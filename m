Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 3B71FFBAD9
	for <lists+cluster-devel@lfdr.de>; Wed, 13 Nov 2019 22:31:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573680668;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KkuJ37xRLGXvIw0kRlaZgN4qlZU9fz/gb2jD0SfuQG4=;
	b=JL3VUM4+Xjxc6afAl//AH+7sGmjywHuwWz9cC8JKFTdznvwBKBh2Y6rfqstMJPq+yqHVCH
	7XRUxm0tSVu7887ifsIUKNgljx7LkAscUjn6uXtRE6wCkTYKe8v0vwW3lM54ZdnJH5/HdU
	mxjSB7pubZSMkjD1jIhoC72y/VbfzDI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-NutkEqmtPnuzHVrLhV3hLg-1; Wed, 13 Nov 2019 16:31:06 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05BD51855523;
	Wed, 13 Nov 2019 21:31:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E7DB96046C;
	Wed, 13 Nov 2019 21:31:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CB4DC18034EB;
	Wed, 13 Nov 2019 21:31:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xADLV2bI005486 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 13 Nov 2019 16:31:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0A83C69739; Wed, 13 Nov 2019 21:31:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-140.phx2.redhat.com [10.3.116.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C87D369320
	for <cluster-devel@redhat.com>; Wed, 13 Nov 2019 21:31:01 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 13 Nov 2019 15:30:29 -0600
Message-Id: <20191113213030.237431-32-rpeterso@redhat.com>
In-Reply-To: <20191113213030.237431-1-rpeterso@redhat.com>
References: <20191113213030.237431-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 31/32] gfs2: Do proper error checking for
	go_sync family of glops functions
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
X-MC-Unique: NutkEqmtPnuzHVrLhV3hLg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
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
---
 fs/gfs2/glock.c  | 16 ++++++++++++++--
 fs/gfs2/glops.c  | 30 +++++++++++++++++++-----------
 fs/gfs2/incore.h |  2 +-
 3 files changed, 34 insertions(+), 14 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 082f70eb96db..464c89c89a2b 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -606,8 +606,20 @@ __acquires(&gl->gl_lockref.lock)
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
index 183fd7cbdbc1..412237469773 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -81,10 +81,11 @@ static void __gfs2_ail_flush(struct gfs2_glock *gl, boo=
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
@@ -115,7 +116,7 @@ static void gfs2_ail_empty_gl(struct gfs2_glock *gl)
 =09=09} else {
 =09=09=09gfs2_log_unlock(sdp);
 =09=09}
-=09=09return;
+=09=09return 0;
 =09}
=20
 =09/* A shortened, inline version of gfs2_trans_begin()
@@ -123,8 +124,9 @@ static void gfs2_ail_empty_gl(struct gfs2_glock *gl)
          * on the stack */
 =09tr.tr_reserved =3D 1 + gfs2_struct2blk(sdp, tr.tr_revokes, sizeof(u64))=
;
 =09tr.tr_ip =3D _RET_IP_;
-=09if (gfs2_log_reserve(sdp, tr.tr_reserved) < 0)
-=09=09return;
+=09ret =3D gfs2_log_reserve(sdp, tr.tr_reserved);
+=09if (ret < 0)
+=09=09return ret;
 =09WARN_ON_ONCE(current->journal_info);
 =09current->journal_info =3D &tr;
=20
@@ -134,6 +136,7 @@ static void gfs2_ail_empty_gl(struct gfs2_glock *gl)
 flush:
 =09gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_NORMAL |
 =09=09       GFS2_LFC_AIL_EMPTY_GL);
+=09return 0;
 }
=20
 void gfs2_ail_flush(struct gfs2_glock *gl, bool fsync)
@@ -167,7 +170,7 @@ void gfs2_ail_flush(struct gfs2_glock *gl, bool fsync)
  * return to caller to demote/unlock the glock until I/O is complete.
  */
=20
-static void rgrp_go_sync(struct gfs2_glock *gl)
+static int rgrp_go_sync(struct gfs2_glock *gl)
 {
 =09struct gfs2_sbd *sdp =3D gl->gl_name.ln_sbd;
 =09struct address_space *mapping =3D &sdp->sd_aspace;
@@ -175,21 +178,24 @@ static void rgrp_go_sync(struct gfs2_glock *gl)
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
@@ -253,12 +259,12 @@ static void gfs2_clear_glop_pending(struct gfs2_inode=
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
@@ -291,6 +297,7 @@ static void inode_go_sync(struct gfs2_glock *gl)
=20
 out:
 =09gfs2_clear_glop_pending(ip);
+=09return error;
 }
=20
 /**
@@ -511,7 +518,7 @@ static void inode_go_dump(struct seq_file *seq, struct =
gfs2_glock *gl,
  *
  */
=20
-static void freeze_go_sync(struct gfs2_glock *gl)
+static int freeze_go_sync(struct gfs2_glock *gl)
 {
 =09int error =3D 0;
 =09struct gfs2_sbd *sdp =3D gl->gl_name.ln_sbd;
@@ -525,7 +532,7 @@ static void freeze_go_sync(struct gfs2_glock *gl)
 =09=09=09=09error);
 =09=09=09if (gfs2_withdrawn(sdp)) {
 =09=09=09=09atomic_set(&sdp->sd_freeze_state, SFS_UNFROZEN);
-=09=09=09=09return;
+=09=09=09=09return 0;
 =09=09=09}
 =09=09=09gfs2_assert_withdraw(sdp, 0);
 =09=09}
@@ -533,6 +540,7 @@ static void freeze_go_sync(struct gfs2_glock *gl)
 =09=09gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_FREEZE |
 =09=09=09       GFS2_LFC_FREEZE_GO_SYNC);
 =09}
+=09return 0;
 }
=20
 /**
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 61be366a2fa7..bebb2c87e0ea 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -233,7 +233,7 @@ struct lm_lockname {
=20
=20
 struct gfs2_glock_operations {
-=09void (*go_sync) (struct gfs2_glock *gl);
+=09int (*go_sync) (struct gfs2_glock *gl);
 =09int (*go_xmote_bh) (struct gfs2_glock *gl, struct gfs2_holder *gh);
 =09void (*go_inval) (struct gfs2_glock *gl, int flags);
 =09int (*go_demote_ok) (const struct gfs2_glock *gl);
--=20
2.23.0

