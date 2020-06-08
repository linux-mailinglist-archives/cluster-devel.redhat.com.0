Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D7B0D1F1CAC
	for <lists+cluster-devel@lfdr.de>; Mon,  8 Jun 2020 18:02:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591632150;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=u/gXtealzS02EM6L88CMKSaoUKjMV4jeQlZ7IM3Bdlc=;
	b=h91j+9MjEwaTdAk/zAtFRzTD2sYNXO+DDHIRVX2lZoVFcQMzjppM1Q2Ef3wWCxMEUoYV/p
	sygzQt/xuqbM2Mcra3o/urur36Olee/fQRhd1Gj7xBXSujjkHNbI96m+XfpCMCPcJeJyTV
	K2ERhjUbPe/C2wMsISpMS3rtzVlZXsg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-3Au6aVg9NdGQqEr_mwY3jA-1; Mon, 08 Jun 2020 12:02:29 -0400
X-MC-Unique: 3Au6aVg9NdGQqEr_mwY3jA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7AD918FF660;
	Mon,  8 Jun 2020 16:02:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C6CF578FD7;
	Mon,  8 Jun 2020 16:02:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B5574B348A;
	Mon,  8 Jun 2020 16:02:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 058G0w1r011686 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 8 Jun 2020 12:00:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 81A3F1CA; Mon,  8 Jun 2020 16:00:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.195.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B28948926C;
	Mon,  8 Jun 2020 16:00:57 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon,  8 Jun 2020 18:00:29 +0200
Message-Id: <20200608160039.549204-11-agruenba@redhat.com>
In-Reply-To: <20200608160039.549204-1-agruenba@redhat.com>
References: <20200608160039.549204-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 10/20] gfs2: Turn gl_delete into a delayed
	work
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

This requires flushing delayed work items in gfs2_make_fs_ro (which is called
before unmounting a filesystem).

When inodes are deleted and then recreated, pending gl_delete work items would
have no effect because the inode generations will have changed, so we can
cancel any pending gl_delete works before reusing iopen glocks.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c  | 47 +++++++++++++++++++++++++++++++++++++++++++++--
 fs/gfs2/glock.h  |  4 ++++
 fs/gfs2/glops.c  |  9 ++++++++-
 fs/gfs2/incore.h |  5 +++--
 fs/gfs2/inode.c  |  2 ++
 fs/gfs2/rgrp.c   |  2 +-
 fs/gfs2/super.c  |  4 ++--
 7 files changed, 65 insertions(+), 8 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 12681616eb76..0332086f7ab9 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -776,11 +776,16 @@ bool gfs2_inode_already_deleted(struct gfs2_glock *gl, u64 generation)
 
 static void delete_work_func(struct work_struct *work)
 {
-	struct gfs2_glock *gl = container_of(work, struct gfs2_glock, gl_delete);
+	struct delayed_work *dwork = to_delayed_work(work);
+	struct gfs2_glock *gl = container_of(dwork, struct gfs2_glock, gl_delete);
 	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
 	struct inode *inode;
 	u64 no_addr = gl->gl_name.ln_number;
 
+	spin_lock(&gl->gl_lockref.lock);
+	clear_bit(GLF_PENDING_DELETE, &gl->gl_flags);
+	spin_unlock(&gl->gl_lockref.lock);
+
 	/* If someone's using this glock to create a new dinode, the block must
 	   have been freed by another node, then re-used, in which case our
 	   iopen callback is too late after the fact. Ignore it. */
@@ -949,7 +954,7 @@ int gfs2_glock_get(struct gfs2_sbd *sdp, u64 number,
 	gl->gl_object = NULL;
 	gl->gl_hold_time = GL_GLOCK_DFT_HOLD;
 	INIT_DELAYED_WORK(&gl->gl_work, glock_work_func);
-	INIT_WORK(&gl->gl_delete, delete_work_func);
+	INIT_DELAYED_WORK(&gl->gl_delete, delete_work_func);
 
 	mapping = gfs2_glock2aspace(gl);
 	if (mapping) {
@@ -1772,6 +1777,44 @@ static void glock_hash_walk(glock_examiner examiner, const struct gfs2_sbd *sdp)
 	rhashtable_walk_exit(&iter);
 }
 
+bool gfs2_queue_delete_work(struct gfs2_glock *gl, unsigned long delay)
+{
+	bool queued;
+
+	spin_lock(&gl->gl_lockref.lock);
+	queued = queue_delayed_work(gfs2_delete_workqueue,
+				    &gl->gl_delete, delay);
+	if (queued)
+		set_bit(GLF_PENDING_DELETE, &gl->gl_flags);
+	spin_unlock(&gl->gl_lockref.lock);
+	return queued;
+}
+
+void gfs2_cancel_delete_work(struct gfs2_glock *gl)
+{
+	if (cancel_delayed_work_sync(&gl->gl_delete)) {
+		clear_bit(GLF_PENDING_DELETE, &gl->gl_flags);
+		gfs2_glock_put(gl);
+	}
+}
+
+bool gfs2_delete_work_queued(const struct gfs2_glock *gl)
+{
+	return test_bit(GLF_PENDING_DELETE, &gl->gl_flags);
+}
+
+static void flush_delete_work(struct gfs2_glock *gl)
+{
+	flush_delayed_work(&gl->gl_delete);
+	gfs2_glock_queue_work(gl, 0);
+}
+
+void gfs2_flush_delete_work(struct gfs2_sbd *sdp)
+{
+	glock_hash_walk(flush_delete_work, sdp);
+	flush_workqueue(gfs2_delete_workqueue);
+}
+
 /**
  * thaw_glock - thaw out a glock which has an unprocessed reply waiting
  * @gl: The glock to thaw
diff --git a/fs/gfs2/glock.h b/fs/gfs2/glock.h
index 5c1b60fdedcf..711b3005a7ea 100644
--- a/fs/gfs2/glock.h
+++ b/fs/gfs2/glock.h
@@ -235,6 +235,10 @@ static inline int gfs2_glock_nq_init(struct gfs2_glock *gl,
 
 extern void gfs2_glock_cb(struct gfs2_glock *gl, unsigned int state);
 extern void gfs2_glock_complete(struct gfs2_glock *gl, int ret);
+extern bool gfs2_queue_delete_work(struct gfs2_glock *gl, unsigned long delay);
+extern void gfs2_cancel_delete_work(struct gfs2_glock *gl);
+extern bool gfs2_delete_work_queued(const struct gfs2_glock *gl);
+extern void gfs2_flush_delete_work(struct gfs2_sbd *sdp);
 extern void gfs2_gl_hash_clear(struct gfs2_sbd *sdp);
 extern void gfs2_glock_finish_truncate(struct gfs2_inode *ip);
 extern void gfs2_glock_thaw(struct gfs2_sbd *sdp);
diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 63ae9e45ce34..909cd722e46a 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -608,11 +608,17 @@ static void iopen_go_callback(struct gfs2_glock *gl, bool remote)
 	if (gl->gl_demote_state == LM_ST_UNLOCKED &&
 	    gl->gl_state == LM_ST_SHARED && ip) {
 		gl->gl_lockref.count++;
-		if (queue_work(gfs2_delete_workqueue, &gl->gl_delete) == 0)
+		if (!queue_delayed_work(gfs2_delete_workqueue,
+					&gl->gl_delete, 0))
 			gl->gl_lockref.count--;
 	}
 }
 
+static int iopen_go_demote_ok(const struct gfs2_glock *gl)
+{
+       return !gfs2_delete_work_queued(gl);
+}
+
 /**
  * inode_go_free - wake up anyone waiting for dlm's unlock ast to free it
  * @gl: glock being freed
@@ -716,6 +722,7 @@ const struct gfs2_glock_operations gfs2_freeze_glops = {
 const struct gfs2_glock_operations gfs2_iopen_glops = {
 	.go_type = LM_TYPE_IOPEN,
 	.go_callback = iopen_go_callback,
+	.go_demote_ok = iopen_go_demote_ok,
 	.go_flags = GLOF_LRU | GLOF_NONDISK,
 };
 
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 84a824293a78..fdcf7a2f06c5 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -345,6 +345,7 @@ enum {
 	GLF_OBJECT			= 14, /* Used only for tracing */
 	GLF_BLOCKING			= 15,
 	GLF_INODE_CREATING		= 16, /* Inode creation occurring */
+	GLF_PENDING_DELETE		= 17,
 	GLF_FREEING			= 18, /* Wait for glock to be freed */
 };
 
@@ -378,8 +379,8 @@ struct gfs2_glock {
 	atomic_t gl_revokes;
 	struct delayed_work gl_work;
 	union {
-		/* For inode and iopen glocks only */
-		struct work_struct gl_delete;
+		/* For iopen glocks only */
+		struct delayed_work gl_delete;
 		/* For rgrp glocks only */
 		struct {
 			loff_t start;
diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index 5acd3ce30759..a4112906abc2 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -170,6 +170,7 @@ struct inode *gfs2_inode_lookup(struct super_block *sb, unsigned int type,
 		error = gfs2_glock_nq_init(io_gl, LM_ST_SHARED, GL_EXACT, &ip->i_iopen_gh);
 		if (unlikely(error))
 			goto fail;
+		gfs2_cancel_delete_work(ip->i_iopen_gh.gh_gl);
 		glock_set_object(ip->i_iopen_gh.gh_gl, ip);
 		gfs2_glock_put(io_gl);
 		io_gl = NULL;
@@ -724,6 +725,7 @@ static int gfs2_create_inode(struct inode *dir, struct dentry *dentry,
 	if (error)
 		goto fail_gunlock2;
 
+	gfs2_cancel_delete_work(ip->i_iopen_gh.gh_gl);
 	glock_set_object(ip->i_iopen_gh.gh_gl, ip);
 	gfs2_set_iop(inode);
 	insert_inode_hash(inode);
diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index a321c34e3d6e..074f228ea839 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -1835,7 +1835,7 @@ static void try_rgrp_unlink(struct gfs2_rgrpd *rgd, u64 *last_unlinked, u64 skip
 		 */
 		ip = gl->gl_object;
 
-		if (ip || queue_work(gfs2_delete_workqueue, &gl->gl_delete) == 0)
+		if (ip || !gfs2_queue_delete_work(gl, 0))
 			gfs2_glock_put(gl);
 		else
 			found++;
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index e69efed9fb51..71218a6fd9b4 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -626,7 +626,7 @@ int gfs2_make_fs_ro(struct gfs2_sbd *sdp)
 		}
 	}
 
-	flush_workqueue(gfs2_delete_workqueue);
+	gfs2_flush_delete_work(sdp);
 	if (!log_write_allowed && current == sdp->sd_quotad_process)
 		fs_warn(sdp, "The quotad daemon is withdrawing.\n");
 	else if (sdp->sd_quotad_process)
@@ -1054,7 +1054,7 @@ static int gfs2_drop_inode(struct inode *inode)
 		struct gfs2_glock *gl = ip->i_iopen_gh.gh_gl;
 
 		gfs2_glock_hold(gl);
-		if (queue_work(gfs2_delete_workqueue, &gl->gl_delete) == 0)
+		if (!gfs2_queue_delete_work(gl, 0))
 			gfs2_glock_queue_put(gl);
 		return false;
 	}
-- 
2.26.2

