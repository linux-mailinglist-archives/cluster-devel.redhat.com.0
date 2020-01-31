Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5566314F1EE
	for <lists+cluster-devel@lfdr.de>; Fri, 31 Jan 2020 19:08:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580494107;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QM3Wogxqm3HeccapAEJqhs7D2VQ5azHMYyD4JAXXeHY=;
	b=Q0hgOp/IRj+fMN5mr7G7PR0uskYaFo0OL+2lBdOtEZ7jD3fQ+LTUaSnVcVh7pqVcCscnpN
	Ge2phNU2cqSY6o3mwlv0Zc9QmQhrUWgfbMr+ye8mI2nlt5HhTzzEKDs3fUfyF2yWnQrDsE
	NPKJsJhSIHp37Pnf5Gng05VO4KS8nmY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-CA04LiGDMM-lr2kBKaRPmQ-1; Fri, 31 Jan 2020 13:08:24 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C1E585EE6A;
	Fri, 31 Jan 2020 18:08:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BEA77FB60;
	Fri, 31 Jan 2020 18:08:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3D67018089CD;
	Fri, 31 Jan 2020 18:08:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00VI8KrG027098 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 31 Jan 2020 13:08:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7478660BEC; Fri, 31 Jan 2020 18:08:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-223.ams2.redhat.com [10.36.116.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 438A560BE0
	for <cluster-devel@redhat.com>; Fri, 31 Jan 2020 18:08:18 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 31 Jan 2020 12:07:22 -0600
Message-Id: <20200131180723.178863-25-rpeterso@redhat.com>
In-Reply-To: <20200131180723.178863-1-rpeterso@redhat.com>
References: <20200131180723.178863-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 24/25] gfs2: Do proper error checking
	for go_sync family of glops functions
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: CA04LiGDMM-lr2kBKaRPmQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Before this patch, function do_xmote would try to sync out the glock
dirty data by calling the appropriate glops function XXX_go_sync()
but it did not check for a good return code. If the sync was not
possible due to an io error or whatever, do_xmote would continue on
and call go_inval and release the glock to other cluster nodes.
When those nodes go to replay the journal, they may already be holding
glocks for the journal records that should have been synced, but were
not due to the ignored error.

This patch introduces proper error code checking to the go_sync
family of glops functions.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Reviewed-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c  | 16 ++++++++++++++--
 fs/gfs2/glops.c  | 30 +++++++++++++++++++-----------
 fs/gfs2/incore.h |  2 +-
 3 files changed, 34 insertions(+), 14 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 2b43a8488aec..a09ffc7b439b 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -600,8 +600,20 @@ __acquires(&gl->gl_lockref.lock)
 =09    (lck_flags & (LM_FLAG_TRY|LM_FLAG_TRY_1CB)))
 =09=09clear_bit(GLF_BLOCKING, &gl->gl_flags);
 =09spin_unlock(&gl->gl_lockref.lock);
-=09if (glops->go_sync)
-=09=09glops->go_sync(gl);
+=09if (glops->go_sync) {
+=09=09ret =3D glops->go_sync(gl);
+=09=09/* If we had a problem syncing (due to io errors or whatever,
+=09=09 * we should not invalidate the metadata or tell dlm to
+=09=09 * release the glock to other nodes.
+=09=09 */
+=09=09if (ret) {
+=09=09=09if (cmpxchg(&sdp->sd_log_error, 0, ret)) {
+=09=09=09=09fs_err(sdp, "Error %d syncing glock \n", ret);
+=09=09=09=09gfs2_dump_glock(NULL, gl, true);
+=09=09=09}
+=09=09=09return;
+=09=09}
+=09}
 =09if (test_bit(GLF_INVALIDATE_IN_PROGRESS, &gl->gl_flags)) {
 =09=09/*
 =09=09 * The call to go_sync should have cleared out the ail list.
diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index bbbcae8d853c..9e9c7a4b8c66 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -82,10 +82,11 @@ static void __gfs2_ail_flush(struct gfs2_glock *gl, boo=
l fsync,
 }
=20
=20
-static void gfs2_ail_empty_gl(struct gfs2_glock *gl)
+static int gfs2_ail_empty_gl(struct gfs2_glock *gl)
 {
 =09struct gfs2_sbd *sdp =3D gl->gl_name.ln_sbd;
 =09struct gfs2_trans tr;
+=09int ret;
=20
 =09memset(&tr, 0, sizeof(tr));
 =09INIT_LIST_HEAD(&tr.tr_buf);
@@ -116,7 +117,7 @@ static void gfs2_ail_empty_gl(struct gfs2_glock *gl)
 =09=09=09goto flush;
 =09=09if (log_in_flight)
 =09=09=09log_flush_wait(sdp);
-=09=09return;
+=09=09return 0;
 =09}
=20
 =09/* A shortened, inline version of gfs2_trans_begin()
@@ -124,8 +125,9 @@ static void gfs2_ail_empty_gl(struct gfs2_glock *gl)
          * on the stack */
 =09tr.tr_reserved =3D 1 + gfs2_struct2blk(sdp, tr.tr_revokes);
 =09tr.tr_ip =3D _RET_IP_;
-=09if (gfs2_log_reserve(sdp, tr.tr_reserved) < 0)
-=09=09return;
+=09ret =3D gfs2_log_reserve(sdp, tr.tr_reserved);
+=09if (ret < 0)
+=09=09return ret;
 =09WARN_ON_ONCE(current->journal_info);
 =09current->journal_info =3D &tr;
=20
@@ -135,6 +137,7 @@ static void gfs2_ail_empty_gl(struct gfs2_glock *gl)
 flush:
 =09gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_NORMAL |
 =09=09       GFS2_LFC_AIL_EMPTY_GL);
+=09return 0;
 }
=20
 void gfs2_ail_flush(struct gfs2_glock *gl, bool fsync)
@@ -168,7 +171,7 @@ void gfs2_ail_flush(struct gfs2_glock *gl, bool fsync)
  * return to caller to demote/unlock the glock until I/O is complete.
  */
=20
-static void rgrp_go_sync(struct gfs2_glock *gl)
+static int rgrp_go_sync(struct gfs2_glock *gl)
 {
 =09struct gfs2_sbd *sdp =3D gl->gl_name.ln_sbd;
 =09struct address_space *mapping =3D &sdp->sd_aspace;
@@ -176,21 +179,24 @@ static void rgrp_go_sync(struct gfs2_glock *gl)
 =09int error;
=20
 =09if (!test_and_clear_bit(GLF_DIRTY, &gl->gl_flags))
-=09=09return;
+=09=09return 0;
 =09GLOCK_BUG_ON(gl, gl->gl_state !=3D LM_ST_EXCLUSIVE);
=20
 =09gfs2_log_flush(sdp, gl, GFS2_LOG_HEAD_FLUSH_NORMAL |
 =09=09       GFS2_LFC_RGRP_GO_SYNC);
 =09filemap_fdatawrite_range(mapping, gl->gl_vm.start, gl->gl_vm.end);
 =09error =3D filemap_fdatawait_range(mapping, gl->gl_vm.start, gl->gl_vm.e=
nd);
+=09WARN_ON_ONCE(error);
 =09mapping_set_error(mapping, error);
-=09gfs2_ail_empty_gl(gl);
+=09if (!error)
+=09=09error =3D gfs2_ail_empty_gl(gl);
=20
 =09spin_lock(&gl->gl_lockref.lock);
 =09rgd =3D gl->gl_object;
 =09if (rgd)
 =09=09gfs2_free_clones(rgd);
 =09spin_unlock(&gl->gl_lockref.lock);
+=09return error;
 }
=20
 /**
@@ -257,12 +263,12 @@ static void gfs2_clear_glop_pending(struct gfs2_inode=
 *ip)
  *
  */
=20
-static void inode_go_sync(struct gfs2_glock *gl)
+static int inode_go_sync(struct gfs2_glock *gl)
 {
 =09struct gfs2_inode *ip =3D gfs2_glock2inode(gl);
 =09int isreg =3D ip && S_ISREG(ip->i_inode.i_mode);
 =09struct address_space *metamapping =3D gfs2_glock2aspace(gl);
-=09int error;
+=09int error =3D 0;
=20
 =09if (isreg) {
 =09=09if (test_and_clear_bit(GIF_SW_PAGED, &ip->i_flags))
@@ -295,6 +301,7 @@ static void inode_go_sync(struct gfs2_glock *gl)
=20
 out:
 =09gfs2_clear_glop_pending(ip);
+=09return error;
 }
=20
 /**
@@ -515,7 +522,7 @@ static void inode_go_dump(struct seq_file *seq, struct =
gfs2_glock *gl,
  *
  */
=20
-static void freeze_go_sync(struct gfs2_glock *gl)
+static int freeze_go_sync(struct gfs2_glock *gl)
 {
 =09int error =3D 0;
 =09struct gfs2_sbd *sdp =3D gl->gl_name.ln_sbd;
@@ -529,7 +536,7 @@ static void freeze_go_sync(struct gfs2_glock *gl)
 =09=09=09=09error);
 =09=09=09if (gfs2_withdrawn(sdp)) {
 =09=09=09=09atomic_set(&sdp->sd_freeze_state, SFS_UNFROZEN);
-=09=09=09=09return;
+=09=09=09=09return 0;
 =09=09=09}
 =09=09=09gfs2_assert_withdraw(sdp, 0);
 =09=09}
@@ -537,6 +544,7 @@ static void freeze_go_sync(struct gfs2_glock *gl)
 =09=09gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_FREEZE |
 =09=09=09       GFS2_LFC_FREEZE_GO_SYNC);
 =09}
+=09return 0;
 }
=20
 /**
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 259b1956e990..acb4aa691e81 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -234,7 +234,7 @@ struct lm_lockname {
=20
=20
 struct gfs2_glock_operations {
-=09void (*go_sync) (struct gfs2_glock *gl);
+=09int (*go_sync) (struct gfs2_glock *gl);
 =09int (*go_xmote_bh) (struct gfs2_glock *gl, struct gfs2_holder *gh);
 =09void (*go_inval) (struct gfs2_glock *gl, int flags);
 =09int (*go_demote_ok) (const struct gfs2_glock *gl);
--=20
2.24.1

