Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 41A7F4297B4
	for <lists+cluster-devel@lfdr.de>; Mon, 11 Oct 2021 21:40:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633981244;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gL5cIQT7gbI5HUp+kj+g49GkBdzAYy6hT5BqRdu8+Oc=;
	b=gGlyTUeqpTTU1CHJK1Fo7pIOYcmgP9KQEpQt64GEhTZqA2m6ONqzvCZs4FUqnid3lD0AV6
	+avG8RfCwo0DIuZRLubjPyNuvzm8CLEmMYksrDjN6z1ok8npHZ9aw34BtXR0CB1YL/fpkz
	r8UY+9PMYsW7bFcbjMSztBWWliJ7zUo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-aD5kj2L_Mg2oLG0VEjanUQ-1; Mon, 11 Oct 2021 15:40:41 -0400
X-MC-Unique: aD5kj2L_Mg2oLG0VEjanUQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1134A101AFAA;
	Mon, 11 Oct 2021 19:40:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0246A5F4E4;
	Mon, 11 Oct 2021 19:40:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7CEE04EA39;
	Mon, 11 Oct 2021 19:40:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19BJeWRF028826 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 11 Oct 2021 15:40:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F3F812657E; Mon, 11 Oct 2021 19:40:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-114-2.phx2.redhat.com [10.3.114.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C2FCB2657D
	for <cluster-devel@redhat.com>; Mon, 11 Oct 2021 19:40:31 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 11 Oct 2021 14:40:05 -0500
Message-Id: <20211011194008.50097-11-rpeterso@redhat.com>
In-Reply-To: <20211011194008.50097-1-rpeterso@redhat.com>
References: <20211011194008.50097-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 v3 PATCH 10/13] gfs2: fix GL_SKIP node_scope
	problems
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Before this patch, when a glock was locked, the very first holder on the
queue would unlock the lockref and call the go_instantiate glops function
(if one existed), unless GL_SKIP was specified. When we introduced the new
node-scope concept, we allowed multiple holders to lock glocks in EX mode
and share the lock.

But node-scope introduced a new problem: if the first holder has GL_SKIP
and the next one does NOT, since it is not the first holder on the queue,
the go_instantiate op was not called. Eventually the GL_SKIP holder may
call the instantiate sub-function (e.g. gfs2_rgrp_bh_get) but there was
still a window of time in which another non-GL_SKIP holder assumes the
instantiate function had been called by the first holder. In the case of
rgrp glocks, this led to a NULL pointer dereference on the buffer_heads.

This patch tries to fix the problem by introducing two new glock flags:

GLF_INSTANTIATE_NEEDED, which keeps track of when the instantiate function
needs to be called to "fill in" or "read in" the object before it is
referenced.

GLF_INSTANTIATE_IN_PROG which is used to determine when a process is
in the process of reading in the object. Whenever a function needs to
reference the object, it checks the GLF_INSTANTIATE_NEEDED flag, and if
set, it sets GLF_INSTANTIATE_IN_PROG and calls the glops "go_instantiate"
function.

As before, the gl_lockref spin_lock is unlocked during the IO operation,
which may take a relatively long amount of time to complete. While
unlocked, if another process determines go_instantiate is still needed,
it sees GLF_INSTANTIATE_IN_PROG is set, and waits for the go_instantiate
glop operation to be completed. Once GLF_INSTANTIATE_IN_PROG is cleared,
it needs to check GLF_INSTANTIATE_NEEDED again because the other process's
go_instantiate operation may not have been successful.

Functions that previously called the instantiate sub-functions now call
directly into gfs2_instantiate so the new bits are managed properly.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c  | 37 ++++++++++++++++++++++++++++++++++---
 fs/gfs2/glock.h  |  1 +
 fs/gfs2/glops.c  | 10 ++++++----
 fs/gfs2/incore.h |  2 ++
 fs/gfs2/inode.c  |  3 ++-
 fs/gfs2/rgrp.c   | 21 +++++++++++----------
 fs/gfs2/super.c  |  2 +-
 7 files changed, 57 insertions(+), 19 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 39bfac34e8a4..d76a8f2d69f1 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -387,15 +387,39 @@ static void do_error(struct gfs2_glock *gl, const int ret)
  * Returns: 0 if instantiate was successful, 2 if type specific operation is
  * underway, or error.
  */
-static int gfs2_instantiate(struct gfs2_holder *gh)
+int gfs2_instantiate(struct gfs2_holder *gh)
 {
 	struct gfs2_glock *gl = gh->gh_gl;
 	const struct gfs2_glock_operations *glops = gl->gl_ops;
 	int ret;
 
+again:
+	if (!test_bit(GLF_INSTANTIATE_NEEDED, &gl->gl_flags))
+		return 0;
+
+	/*
+	 * Since we unlock the lockref lock, we set a flag to indicate
+	 * instantiate is in progress.
+	 */
+	if (test_bit(GLF_INSTANTIATE_IN_PROG, &gl->gl_flags)) {
+		wait_on_bit(&gl->gl_flags, GLF_INSTANTIATE_IN_PROG,
+			    TASK_UNINTERRUPTIBLE);
+		/*
+		 * Here we just waited for a different instantiate to finish.
+		 * But that may not have been successful, as when a process
+		 * locks an inode glock _before_ it has an actual inode to
+		 * instantiate into. So we check again. This process might
+		 * have an inode to instantiate, so might be successful.
+		 */
+		goto again;
+	}
+
+	set_bit(GLF_INSTANTIATE_IN_PROG, &gl->gl_flags);
+
 	ret = glops->go_instantiate(gh);
 	switch(ret) {
 	case 0:
+		clear_bit(GLF_INSTANTIATE_NEEDED, &gl->gl_flags);
 		break;
 	case 1:
 		ret = 2;
@@ -404,6 +428,9 @@ static int gfs2_instantiate(struct gfs2_holder *gh)
 		gh->gh_error = ret;
 		break;
 	}
+	clear_bit(GLF_INSTANTIATE_IN_PROG, &gl->gl_flags);
+	smp_mb__after_atomic();
+	wake_up_bit(&gl->gl_flags, GLF_INSTANTIATE_IN_PROG);
 	return ret;
 }
 
@@ -434,7 +461,7 @@ __acquires(&gl->gl_lockref.lock)
 			do_error(gl, 0);
 			break;
 		}
-		if (gh->gh_list.prev == &gl->gl_holders &&
+		if (test_bit(GLF_INSTANTIATE_NEEDED, &gl->gl_flags) &&
 		    !(gh->gh_flags & GL_SKIP) && gl->gl_ops->go_instantiate) {
 			lock_released = true;
 			spin_unlock(&gl->gl_lockref.lock);
@@ -1088,7 +1115,7 @@ int gfs2_glock_get(struct gfs2_sbd *sdp, u64 number,
 
 	atomic_inc(&sdp->sd_glock_disposal);
 	gl->gl_node.next = NULL;
-	gl->gl_flags = 0;
+	gl->gl_flags = glops->go_instantiate ? BIT(GLF_INSTANTIATE_NEEDED) : 0;
 	gl->gl_name = name;
 	lockdep_set_subclass(&gl->gl_lockref.lock, glops->go_subclass);
 	gl->gl_lockref.count = 1;
@@ -2177,6 +2204,10 @@ static const char *gflags2str(char *buf, const struct gfs2_glock *gl)
 		*p++ = 'P';
 	if (test_bit(GLF_FREEING, gflags))
 		*p++ = 'x';
+	if (test_bit(GLF_INSTANTIATE_NEEDED, gflags))
+		*p++ = 'n';
+	if (test_bit(GLF_INSTANTIATE_IN_PROG, gflags))
+		*p++ = 'N';
 	*p = 0;
 	return buf;
 }
diff --git a/fs/gfs2/glock.h b/fs/gfs2/glock.h
index 2a71e2068a95..0b774dcc408a 100644
--- a/fs/gfs2/glock.h
+++ b/fs/gfs2/glock.h
@@ -202,6 +202,7 @@ extern void gfs2_holder_reinit(unsigned int state, u16 flags,
 extern void gfs2_holder_uninit(struct gfs2_holder *gh);
 extern int gfs2_glock_nq(struct gfs2_holder *gh);
 extern int gfs2_glock_poll(struct gfs2_holder *gh);
+extern int gfs2_instantiate(struct gfs2_holder *gh);
 extern int gfs2_glock_wait(struct gfs2_holder *gh);
 extern int gfs2_glock_async_wait(unsigned int num_gh, struct gfs2_holder *ghs);
 extern void gfs2_glock_dq(struct gfs2_holder *gh);
diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 8452a83bd55a..e2656baf38a3 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -357,6 +357,7 @@ static void inode_go_inval(struct gfs2_glock *gl, int flags)
 		truncate_inode_pages(mapping, 0);
 		if (ip) {
 			set_bit(GIF_INVALID, &ip->i_flags);
+			set_bit(GLF_INSTANTIATE_NEEDED, &gl->gl_flags);
 			forget_all_cached_acls(&ip->i_inode);
 			security_inode_invalidate_secctx(&ip->i_inode);
 			gfs2_dir_hash_inval(ip);
@@ -495,13 +496,13 @@ static int inode_go_instantiate(struct gfs2_holder *gh)
 	struct gfs2_inode *ip = gl->gl_object;
 	int error = 0;
 
-	if (!ip)
-		return 0;
+	if (!ip) /* no inode to populate - read it in later */
+		goto out;
 
 	if (test_bit(GIF_INVALID, &ip->i_flags)) {
 		error = gfs2_inode_refresh(ip);
 		if (error)
-			return error;
+			goto out;
 	}
 
 	if (gh->gh_state != LM_ST_DEFERRED)
@@ -515,9 +516,10 @@ static int inode_go_instantiate(struct gfs2_holder *gh)
 			list_add(&ip->i_trunc_list, &sdp->sd_trunc_list);
 		spin_unlock(&sdp->sd_trunc_lock);
 		wake_up(&sdp->sd_quota_wait);
-		return 1;
+		error = 1;
 	}
 
+out:
 	return error;
 }
 
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index ae669ee7b1d8..e119b87128f4 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -315,6 +315,7 @@ struct gfs2_alloc_parms {
 
 enum {
 	GLF_LOCK			= 1,
+	GLF_INSTANTIATE_NEEDED		= 2, /* needs instantiate */
 	GLF_DEMOTE			= 3,
 	GLF_PENDING_DEMOTE		= 4,
 	GLF_DEMOTE_IN_PROGRESS		= 5,
@@ -324,6 +325,7 @@ enum {
 	GLF_REPLY_PENDING		= 9,
 	GLF_INITIAL			= 10,
 	GLF_FROZEN			= 11,
+	GLF_INSTANTIATE_IN_PROG		= 12, /* instantiate happening now */
 	GLF_LRU				= 13,
 	GLF_OBJECT			= 14, /* Used only for tracing */
 	GLF_BLOCKING			= 15,
diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index 4f8e5c2bcf1f..8569142901f6 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -183,6 +183,7 @@ struct inode *gfs2_inode_lookup(struct super_block *sb, unsigned int type,
 
 		glock_set_object(ip->i_gl, ip);
 		set_bit(GIF_INVALID, &ip->i_flags);
+		set_bit(GLF_INSTANTIATE_NEEDED, &ip->i_gl->gl_flags);
 		error = gfs2_glock_nq_init(io_gl, LM_ST_SHARED, GL_EXACT, &ip->i_iopen_gh);
 		if (unlikely(error))
 			goto fail;
@@ -196,7 +197,7 @@ struct inode *gfs2_inode_lookup(struct super_block *sb, unsigned int type,
 
 		if (type == DT_UNKNOWN) {
 			/* Inode glock must be locked already */
-			error = gfs2_inode_refresh(GFS2_I(inode));
+			error = gfs2_instantiate(&i_gh);
 			if (error)
 				goto fail;
 		} else {
diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index cdcbc822064d..5ee7da3a450e 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -1238,8 +1238,7 @@ static int gfs2_rgrp_bh_get(struct gfs2_rgrpd *rgd)
 		rgd->rd_rgl->rl_unlinked = cpu_to_be32(count_unlinked(rgd));
 		gfs2_rgrp_ondisk2lvb(rgd->rd_rgl,
 				     rgd->rd_bits[0].bi_bh->b_data);
-	}
-	else if (sdp->sd_args.ar_rgrplvb) {
+	} else if (sdp->sd_args.ar_rgrplvb) {
 		if (!gfs2_rgrp_lvb_valid(rgd)){
 			gfs2_consist_rgrpd(rgd);
 			error = -EIO;
@@ -1257,11 +1256,10 @@ static int gfs2_rgrp_bh_get(struct gfs2_rgrpd *rgd)
 		bi->bi_bh = NULL;
 		gfs2_assert_warn(sdp, !bi->bi_clone);
 	}
-
 	return error;
 }
 
-static int update_rgrp_lvb(struct gfs2_rgrpd *rgd)
+static int update_rgrp_lvb(struct gfs2_rgrpd *rgd, struct gfs2_holder *gh)
 {
 	u32 rl_flags;
 
@@ -1269,7 +1267,7 @@ static int update_rgrp_lvb(struct gfs2_rgrpd *rgd)
 		return 0;
 
 	if (cpu_to_be32(GFS2_MAGIC) != rgd->rd_rgl->rl_magic)
-		return gfs2_rgrp_bh_get(rgd);
+		return gfs2_instantiate(gh);
 
 	rl_flags = be32_to_cpu(rgd->rd_rgl->rl_flags);
 	rl_flags &= ~GFS2_RDF_MASK;
@@ -1312,6 +1310,7 @@ void gfs2_rgrp_brelse(struct gfs2_rgrpd *rgd)
 			bi->bi_bh = NULL;
 		}
 	}
+	set_bit(GLF_INSTANTIATE_NEEDED, &rgd->rd_gl->gl_flags);
 }
 
 int gfs2_rgrp_send_discards(struct gfs2_sbd *sdp, u64 offset,
@@ -2110,7 +2109,8 @@ int gfs2_inplace_reserve(struct gfs2_inode *ip, struct gfs2_alloc_parms *ap)
 			    gfs2_rgrp_congested(rs->rs_rgd, loops))
 				goto skip_rgrp;
 			if (sdp->sd_args.ar_rgrplvb) {
-				error = update_rgrp_lvb(rs->rs_rgd);
+				error = update_rgrp_lvb(rs->rs_rgd,
+							&ip->i_rgd_gh);
 				if (unlikely(error)) {
 					rgrp_unlock_local(rs->rs_rgd);
 					gfs2_glock_dq_uninit(&ip->i_rgd_gh);
@@ -2125,8 +2125,11 @@ int gfs2_inplace_reserve(struct gfs2_inode *ip, struct gfs2_alloc_parms *ap)
 		    (loops == 0 && target > rs->rs_rgd->rd_extfail_pt))
 			goto skip_rgrp;
 
-		if (sdp->sd_args.ar_rgrplvb)
-			gfs2_rgrp_bh_get(rs->rs_rgd);
+		if (sdp->sd_args.ar_rgrplvb) {
+			error = gfs2_instantiate(&ip->i_rgd_gh);
+			if (error)
+				goto skip_rgrp;
+		}
 
 		/* Get a reservation if we don't already have one */
 		if (!gfs2_rs_active(rs))
@@ -2762,8 +2765,6 @@ void gfs2_rlist_free(struct gfs2_rgrp_list *rlist)
 
 void rgrp_lock_local(struct gfs2_rgrpd *rgd)
 {
-	GLOCK_BUG_ON(rgd->rd_gl, !gfs2_glock_is_held_excl(rgd->rd_gl) &&
-		     !test_bit(SDF_NORECOVERY, &rgd->rd_sbd->sd_flags));
 	mutex_lock(&rgd->rd_mutex);
 }
 
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 6e00d15ef0a8..26c726580041 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1245,7 +1245,7 @@ static enum dinode_demise evict_should_delete(struct inode *inode,
 		return SHOULD_NOT_DELETE_DINODE;
 
 	if (test_bit(GIF_INVALID, &ip->i_flags)) {
-		ret = gfs2_inode_refresh(ip);
+		ret = gfs2_instantiate(gh);
 		if (ret)
 			return SHOULD_NOT_DELETE_DINODE;
 	}
-- 
2.31.1

