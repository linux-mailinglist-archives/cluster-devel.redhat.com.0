Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 6C733197D50
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Mar 2020 15:46:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585576010;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4+oehtfUm8hSFml9TTxXWji+2MnCl8Cx6EZ6OdWLHZI=;
	b=dDmu7a6rYciM1kXAyiAujX6mWhAmcQZ/EN8CkyZ2ULHyn4nTFh6ITQcVryrq1rjG/Wu3t4
	WjiTIAukq7hcTs8NM+71d4oaIaiU6vVaJv3YIV8Qk++yOQrc9Hw4g7m3xAFALxCQ+v7RZE
	EmNI36q+8cmC839sW7NZ3y1aNjwlCNI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-_c-yiZT9PSCM5l_OZ19bhw-1; Mon, 30 Mar 2020 09:46:48 -0400
X-MC-Unique: _c-yiZT9PSCM5l_OZ19bhw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B495C8024E7;
	Mon, 30 Mar 2020 13:46:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F82D1001B07;
	Mon, 30 Mar 2020 13:46:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8600818089CD;
	Mon, 30 Mar 2020 13:46:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02UDkV7O020239 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 30 Mar 2020 09:46:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B3C5448; Mon, 30 Mar 2020 13:46:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-79.phx2.redhat.com [10.3.112.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 781455C1A8
	for <cluster-devel@redhat.com>; Mon, 30 Mar 2020 13:46:31 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 30 Mar 2020 08:45:53 -0500
Message-Id: <20200330134624.259349-9-rpeterso@redhat.com>
In-Reply-To: <20200330134624.259349-1-rpeterso@redhat.com>
References: <20200330134624.259349-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 08/39] gfs2: Rework how rgrp
	buffer_heads are managed
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Reviewed-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c  |  8 --------
 fs/gfs2/glops.c  |  9 +--------
 fs/gfs2/incore.h |  1 -
 fs/gfs2/rgrp.c   | 23 +++++------------------
 fs/gfs2/rgrp.h   |  1 -
 5 files changed, 6 insertions(+), 36 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index d0eceaff3cea..1cb471a8bc87 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -1241,7 +1241,6 @@ int gfs2_glock_poll(struct gfs2_holder *gh)
 void gfs2_glock_dq(struct gfs2_holder *gh)
 {
 =09struct gfs2_glock *gl =3D gh->gh_gl;
-=09const struct gfs2_glock_operations *glops =3D gl->gl_ops;
 =09unsigned delay =3D 0;
 =09int fast_path =3D 0;
=20
@@ -1252,13 +1251,6 @@ void gfs2_glock_dq(struct gfs2_holder *gh)
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
index 58431f67665e..1c557457c753 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -145,15 +145,9 @@ static void rgrp_go_sync(struct gfs2_glock *gl)
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
@@ -601,7 +595,6 @@ const struct gfs2_glock_operations gfs2_rgrp_glops =3D =
{
 =09.go_sync =3D rgrp_go_sync,
 =09.go_inval =3D rgrp_go_inval,
 =09.go_lock =3D gfs2_rgrp_go_lock,
-=09.go_unlock =3D gfs2_rgrp_go_unlock,
 =09.go_dump =3D gfs2_rgrp_dump,
 =09.go_type =3D LM_TYPE_RGRP,
 =09.go_flags =3D GLOF_LVB,
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 3cd2de3db40a..b95c8a31d309 100644
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
index 2bdd662deff5..2ee2f7d48bc1 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -720,8 +720,12 @@ void gfs2_clear_rgrpd(struct gfs2_sbd *sdp)
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
@@ -1284,23 +1288,6 @@ void gfs2_rgrp_brelse(struct gfs2_rgrpd *rgd)
 =09=09=09bi->bi_bh =3D NULL;
 =09=09}
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
2.25.1

