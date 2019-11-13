Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8E6D2FBAC5
	for <lists+cluster-devel@lfdr.de>; Wed, 13 Nov 2019 22:30:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573680648;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=b7jPERGRLBx3mA7+vW1lTQR42nthsgM10XpYfGjE1OY=;
	b=bogX+P7jt60bN1YnB9wLR1zmKypjGkIuP+AXLaxYpmByFp5Vu6mqxlV+Lvo/cZFMjlykGC
	9/GIcKykbhOlHwqbGJuL+U1c0sIebrRcxeaa6PCnQkz82TGLdoYR8pYjeeVCJbdlstxbva
	giL5CHIdbBWZv5qhSWMedu4dlzi1eFE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-o8VKlzsaMiqUBFpB6wrAxw-1; Wed, 13 Nov 2019 16:30:47 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C167189DC08;
	Wed, 13 Nov 2019 21:30:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1927251C41;
	Wed, 13 Nov 2019 21:30:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ED50D18034EA;
	Wed, 13 Nov 2019 21:30:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xADLUZSh005192 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 13 Nov 2019 16:30:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 74B416973B; Wed, 13 Nov 2019 21:30:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-140.phx2.redhat.com [10.3.116.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3EDA869739
	for <cluster-devel@redhat.com>; Wed, 13 Nov 2019 21:30:35 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 13 Nov 2019 15:30:01 -0600
Message-Id: <20191113213030.237431-4-rpeterso@redhat.com>
In-Reply-To: <20191113213030.237431-1-rpeterso@redhat.com>
References: <20191113213030.237431-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 03/32] gfs2: Rework how rgrp buffer_heads
	are managed
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: o8VKlzsaMiqUBFpB6wrAxw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Before this patch, the rgrp code had a serious problem related to
how it managed buffer_heads for resource groups. The problem caused
file system corruption, especially in cases of journal replay.

When an rgrp glock was demoted to transfer ownership to a
different cluster node, do_xmote() first calls rgrp_go_sync and then
rgrp_go_inval, as expected. When it calls rgrp_go_sync, that called
gfs2_rgrp_brelse() that dropped the buffer_head reference count.
In most cases, the reference count went to zero, which is right.
However, there were other places where the buffers are handled
differently.

After rgrp_go_sync, do_xmote called rgrp_go_inval which called
gfs2_rgrp_brelse a second time, then rgrp_go_inval's call to
truncate_inode_pages_range would get rid of the pages in memory,
but only if the reference count drops to 0.

Unfortunately, gfs2_rgrp_brelse was setting bi->bi_bh =3D NULL.
So when rgrp_go_sync called gfs2_rgrp_brelse, it lost the pointer
to the buffer_heads in cases where the reference count was still 1.
Therefore, when rgrp_go_inval called gfs2_rgrp_brelse a second time,
it failed the check for "if (bi->bi_bh)" and thus failed to call
brelse a second time. Because of that, the reference count on those
buffers sometimes failed to drop from 1 to 0. And that caused
function truncate_inode_pages_range to keep the pages in page cache
rather than freeing them.

The next time the rgrp glock was acquired, the metadata read of
the rgrp buffers re-used the pages in memory, which were now
wrong because they were likely modified by the other node who
acquired the glock in EX (which is why we demoted the glock).
This re-use of the page cache caused corruption because changes
made by the other nodes were never seen, so the bitmaps were
inaccurate.

For some reason, the problem became most apparent when journal
replay forced the replay of rgrps in memory, which caused newer
rgrp data to be overwritten by the older in-core pages.

A big part of the problem was that the rgrp buffer were released
in multiple places: The go_unlock function would release them when
the glock was released rather than when the glock is demoted,
which is clearly wrong because our intent was to cache them until
the glock is demoted from SH or EX.

This patch attempts to clean up the mess and make one consistent
and centralized mechanism for managing the rgrp buffer_heads by
implementing several changes:

1. It eliminates the call to gfs2_rgrp_brelse() from rgrp_go_sync.
   We don't want to release the buffers or zero the pointers when
   syncing for the reasons stated above. It only makes sense to
   release them when the glock is actually invalidated (go_inval).
   And when we do, then we set the bh pointers to NULL.
2. The go_unlock function (which was only used for rgrps) is
   eliminated, as we've talked about doing many times before.
   The go_unlock function was called too early in the glock dq
   process, and should not happen until the glock is invalidated.
3. It also eliminates the call to rgrp_brelse in gfs2_clear_rgrpd.
   That will now happen automatically when the rgrp glocks are
   demoted, and shouldn't happen any sooner or later than that.
   Instead, function gfs2_clear_rgrpd has been modified to demote
   the rgrp glocks, and therefore, free those pages, before the
   remaining glocks are culled by gfs2_gl_hash_clear. This
   prevents the gl_object from hanging around when the glocks are
   culled.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.c  |  7 ------
 fs/gfs2/glops.c  |  9 +-------
 fs/gfs2/incore.h |  1 -
 fs/gfs2/rgrp.c   | 60 +++++++++++++++++++++++++++++++-----------------
 fs/gfs2/rgrp.h   |  1 -
 5 files changed, 40 insertions(+), 38 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index faa88bd594e2..809f9cf4239d 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -1245,13 +1245,6 @@ void gfs2_glock_dq(struct gfs2_holder *gh)
 =09list_del_init(&gh->gh_list);
 =09clear_bit(HIF_HOLDER, &gh->gh_iflags);
 =09if (find_first_holder(gl) =3D=3D NULL) {
-=09=09if (glops->go_unlock) {
-=09=09=09GLOCK_BUG_ON(gl, test_and_set_bit(GLF_LOCK, &gl->gl_flags));
-=09=09=09spin_unlock(&gl->gl_lockref.lock);
-=09=09=09glops->go_unlock(gh);
-=09=09=09spin_lock(&gl->gl_lockref.lock);
-=09=09=09clear_bit(GLF_LOCK, &gl->gl_flags);
-=09=09}
 =09=09if (list_empty(&gl->gl_holders) &&
 =09=09    !test_bit(GLF_PENDING_DEMOTE, &gl->gl_flags) &&
 =09=09    !test_bit(GLF_DEMOTE, &gl->gl_flags))
diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 4ede1f18de85..dec5e245b991 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -144,15 +144,9 @@ static void rgrp_go_sync(struct gfs2_glock *gl)
 {
 =09struct gfs2_sbd *sdp =3D gl->gl_name.ln_sbd;
 =09struct address_space *mapping =3D &sdp->sd_aspace;
-=09struct gfs2_rgrpd *rgd;
+=09struct gfs2_rgrpd *rgd =3D gfs2_glock2rgrp(gl);
 =09int error;
=20
-=09spin_lock(&gl->gl_lockref.lock);
-=09rgd =3D gl->gl_object;
-=09if (rgd)
-=09=09gfs2_rgrp_brelse(rgd);
-=09spin_unlock(&gl->gl_lockref.lock);
-
 =09if (!test_and_clear_bit(GLF_DIRTY, &gl->gl_flags))
 =09=09return;
 =09GLOCK_BUG_ON(gl, gl->gl_state !=3D LM_ST_EXCLUSIVE);
@@ -600,7 +594,6 @@ const struct gfs2_glock_operations gfs2_rgrp_glops =3D =
{
 =09.go_sync =3D rgrp_go_sync,
 =09.go_inval =3D rgrp_go_inval,
 =09.go_lock =3D gfs2_rgrp_go_lock,
-=09.go_unlock =3D gfs2_rgrp_go_unlock,
 =09.go_dump =3D gfs2_rgrp_dump,
 =09.go_type =3D LM_TYPE_RGRP,
 =09.go_flags =3D GLOF_LVB,
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 6042babb7324..9a50235567f4 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -239,7 +239,6 @@ struct gfs2_glock_operations {
 =09void (*go_inval) (struct gfs2_glock *gl, int flags);
 =09int (*go_demote_ok) (const struct gfs2_glock *gl);
 =09int (*go_lock) (struct gfs2_holder *gh);
-=09void (*go_unlock) (struct gfs2_holder *gh);
 =09void (*go_dump)(struct seq_file *seq, struct gfs2_glock *gl,
 =09=09=09const char *fs_id_buf);
 =09void (*go_callback)(struct gfs2_glock *gl, bool remote);
diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 2466bb44a23c..10d3397ed3cd 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -730,8 +730,12 @@ void gfs2_clear_rgrpd(struct gfs2_sbd *sdp)
 =09=09rb_erase(n, &sdp->sd_rindex_tree);
=20
 =09=09if (gl) {
-=09=09=09glock_clear_object(gl, rgd);
+=09=09=09if (gl->gl_state !=3D LM_ST_UNLOCKED) {
+=09=09=09=09gfs2_glock_cb(gl, LM_ST_UNLOCKED);
+=09=09=09=09flush_delayed_work(&gl->gl_work);
+=09=09=09}
 =09=09=09gfs2_rgrp_brelse(rgd);
+=09=09=09glock_clear_object(gl, rgd);
 =09=09=09gfs2_glock_put(gl);
 =09=09}
=20
@@ -1283,6 +1287,10 @@ int gfs2_rgrp_go_lock(struct gfs2_holder *gh)
  * gfs2_rgrp_brelse - Release RG bitmaps read in with gfs2_rgrp_bh_get()
  * @rgd: The resource group
  *
+ * Under normal circumstances, b_count should be 1. However, if we withdra=
w
+ * there might be buffer_heads stranded that were pinned but never unpinne=
d
+ * because an io error may have resulted in withdraw, which avoids the bul=
k
+ * of function gfs2_log_flush. Therefore, we need to release all refs.
  */
=20
 void gfs2_rgrp_brelse(struct gfs2_rgrpd *rgd)
@@ -1291,28 +1299,38 @@ void gfs2_rgrp_brelse(struct gfs2_rgrpd *rgd)
=20
 =09for (x =3D 0; x < length; x++) {
 =09=09struct gfs2_bitmap *bi =3D rgd->rd_bits + x;
-=09=09if (bi->bi_bh) {
-=09=09=09brelse(bi->bi_bh);
-=09=09=09bi->bi_bh =3D NULL;
+=09=09if (bi->bi_bh =3D=3D NULL)
+=09=09=09continue;
+
+=09=09smp_mb();
+=09=09if (!gfs2_withdrawn(rgd->rd_sbd) &&
+=09=09    (atomic_read(&bi->bi_bh->b_count) !=3D 1)) {
+=09=09=09    struct gfs2_sbd *sdp =3D rgd->rd_gl->gl_name.ln_sbd;
+=09=09=09    struct gfs2_bufdata *bd =3D bi->bi_bh->b_private;
+
+=09=09=09    fs_err(sdp, "blk:0x%llx b_count=3D%d pinned:%d "
+=09=09=09=09   "locked:%d dirty:%d up2dt:%d bd?%d\n",
+=09=09=09=09   (unsigned long long)bi->bi_bh->b_blocknr,
+=09=09=09=09   atomic_read(&bi->bi_bh->b_count),
+=09=09=09=09   buffer_pinned(bi->bi_bh),
+=09=09=09=09   buffer_locked(bi->bi_bh),
+=09=09=09=09   buffer_dirty(bi->bi_bh),
+=09=09=09=09   buffer_uptodate(bi->bi_bh), bd ? 1 : 0);
+=09=09=09    if (bd)
+=09=09=09=09    fs_err(sdp, "bd_blkno:0x%llx bd_tr:%p bd_list:%d "
+=09=09=09=09=09   "st_list:%d gl_list:%d\n",
+=09=09=09=09=09   (unsigned long long)bd->bd_blkno,
+=09=09=09=09=09   bd->bd_tr,
+=09=09=09=09=09   list_empty(&bd->bd_list)?0:1,
+=09=09=09=09=09   list_empty(&bd->bd_ail_st_list)?0:1,
+=09=09=09=09=09   list_empty(&bd->bd_ail_gl_list)?0:1);
+=09=09=09    gfs2_assert_withdraw(rgd->rd_sbd,
+=09=09=09=09=09(atomic_read(&bi->bi_bh->b_count) =3D=3D 1));
 =09=09}
+=09=09brelse(bi->bi_bh);
+=09=09bi->bi_bh =3D NULL;
 =09}
-
-}
-
-/**
- * gfs2_rgrp_go_unlock - Unlock a rgrp glock
- * @gh: The glock holder for the resource group
- *
- */
-
-void gfs2_rgrp_go_unlock(struct gfs2_holder *gh)
-{
-=09struct gfs2_rgrpd *rgd =3D gh->gh_gl->gl_object;
-=09int demote_requested =3D test_bit(GLF_DEMOTE, &gh->gh_gl->gl_flags) |
-=09=09test_bit(GLF_PENDING_DEMOTE, &gh->gh_gl->gl_flags);
-
-=09if (rgd && demote_requested)
-=09=09gfs2_rgrp_brelse(rgd);
+=09smp_mb();
 }
=20
 int gfs2_rgrp_send_discards(struct gfs2_sbd *sdp, u64 offset,
diff --git a/fs/gfs2/rgrp.h b/fs/gfs2/rgrp.h
index c14a673ae36f..a584f3096418 100644
--- a/fs/gfs2/rgrp.h
+++ b/fs/gfs2/rgrp.h
@@ -33,7 +33,6 @@ extern int gfs2_rindex_update(struct gfs2_sbd *sdp);
 extern void gfs2_free_clones(struct gfs2_rgrpd *rgd);
 extern int gfs2_rgrp_go_lock(struct gfs2_holder *gh);
 extern void gfs2_rgrp_brelse(struct gfs2_rgrpd *rgd);
-extern void gfs2_rgrp_go_unlock(struct gfs2_holder *gh);
=20
 extern struct gfs2_alloc *gfs2_alloc_get(struct gfs2_inode *ip);
=20
--=20
2.23.0

