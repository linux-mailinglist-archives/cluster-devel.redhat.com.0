Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD685606E2
	for <lists+cluster-devel@lfdr.de>; Wed, 29 Jun 2022 19:02:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656522176;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XSZ/wpefjaQw7Fb4WHzxUq1nuMbVyKCrUoqKYZG1fmc=;
	b=Eeb51nvE5C6RuywlH7UzxU23kAZulM8g2ry+JNRWDAmi+7BorKIF2C6TcCKRqTRIFxQ//g
	q7JUZY79MY4lZHz3H84CIlHe0T2+2a1GnbAvGjHvgZLS73Hysz1mQKnptwCa4dxhk0sD29
	FpzoNxhcX/nhQ3s0QX/ZRg6NQmXL8cU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-6YxrwsLYNRmKBlv19kq70Q-1; Wed, 29 Jun 2022 13:02:51 -0400
X-MC-Unique: 6YxrwsLYNRmKBlv19kq70Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EEBF1811E90;
	Wed, 29 Jun 2022 17:02:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BFAEB2166B26;
	Wed, 29 Jun 2022 17:02:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E377E1947060;
	Wed, 29 Jun 2022 17:02:47 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 982571947058 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 29 Jun 2022 16:37:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7E355492CA4; Wed, 29 Jun 2022 16:37:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.localdomain (unknown [10.40.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CFBAB492CA3;
 Wed, 29 Jun 2022 16:37:14 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 29 Jun 2022 18:37:05 +0200
Message-Id: <20220629163711.732931-4-agruenba@redhat.com>
In-Reply-To: <20220629163711.732931-1-agruenba@redhat.com>
References: <20220629163711.732931-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [Cluster-devel] [PATCH 3/9] gfs2: Revert 'Fix "truncate in
 progress" hang'
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Now that interrupted truncates are completed in the context of the
process taking the glock, there is no need for the glock state engine to
delegate that task to gfs2_quotad or for quotad to perform those
truncates anymore.  Get rid of the obsolete associated infrastructure.

Reverts commit 813e0c46c9e2 ("GFS2: Fix "truncate in progress" hang").

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.c      | 41 +++++------------------------------------
 fs/gfs2/glock.h      |  2 --
 fs/gfs2/glops.c      | 11 ++---------
 fs/gfs2/incore.h     |  3 ---
 fs/gfs2/main.c       |  1 -
 fs/gfs2/ops_fstype.c |  2 --
 fs/gfs2/quota.c      | 28 +---------------------------
 7 files changed, 8 insertions(+), 80 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 41bee3db8c0d..347c7bc1fae3 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -518,8 +518,7 @@ int gfs2_instantiate(struct gfs2_holder *gh)
  * do_promote - promote as many requests as possible on the current queue
  * @gl: The glock
  * 
- * Returns: 1 if there is a blocked holder at the head of the list, or 2
- *          if a type specific operation is underway.
+ * Returns: 1 if there is a blocked holder at the head of the list
  */
 
 static int do_promote(struct gfs2_glock *gl)
@@ -627,7 +626,6 @@ static void finish_xmote(struct gfs2_glock *gl, unsigned int ret)
 	const struct gfs2_glock_operations *glops = gl->gl_ops;
 	struct gfs2_holder *gh;
 	unsigned state = ret & LM_OUT_ST_MASK;
-	int rv;
 
 	spin_lock(&gl->gl_lockref.lock);
 	trace_gfs2_glock_state_change(gl, state);
@@ -685,6 +683,8 @@ static void finish_xmote(struct gfs2_glock *gl, unsigned int ret)
 		gfs2_demote_wake(gl);
 	if (state != LM_ST_UNLOCKED) {
 		if (glops->go_xmote_bh) {
+			int rv;
+
 			spin_unlock(&gl->gl_lockref.lock);
 			rv = glops->go_xmote_bh(gl);
 			spin_lock(&gl->gl_lockref.lock);
@@ -693,13 +693,10 @@ static void finish_xmote(struct gfs2_glock *gl, unsigned int ret)
 				goto out;
 			}
 		}
-		rv = do_promote(gl);
-		if (rv == 2)
-			goto out_locked;
+		do_promote(gl);
 	}
 out:
 	clear_bit(GLF_LOCK, &gl->gl_flags);
-out_locked:
 	spin_unlock(&gl->gl_lockref.lock);
 }
 
@@ -856,7 +853,6 @@ __releases(&gl->gl_lockref.lock)
 __acquires(&gl->gl_lockref.lock)
 {
 	struct gfs2_holder *gh = NULL;
-	int ret;
 
 	if (test_and_set_bit(GLF_LOCK, &gl->gl_flags))
 		return;
@@ -875,18 +871,14 @@ __acquires(&gl->gl_lockref.lock)
 	} else {
 		if (test_bit(GLF_DEMOTE, &gl->gl_flags))
 			gfs2_demote_wake(gl);
-		ret = do_promote(gl);
-		if (ret == 0)
+		if (do_promote(gl) == 0)
 			goto out_unlock;
-		if (ret == 2)
-			goto out;
 		gh = find_first_waiter(gl);
 		gl->gl_target = gh->gh_state;
 		if (!(gh->gh_flags & (LM_FLAG_TRY | LM_FLAG_TRY_1CB)))
 			do_error(gl, 0); /* Fail queued try locks */
 	}
 	do_xmote(gl, gh, gl->gl_target);
-out:
 	return;
 
 out_sched:
@@ -2213,29 +2205,6 @@ void gfs2_gl_hash_clear(struct gfs2_sbd *sdp)
 	glock_hash_walk(dump_glock_func, sdp);
 }
 
-void gfs2_glock_finish_truncate(struct gfs2_inode *ip)
-{
-	struct gfs2_glock *gl = ip->i_gl;
-	int ret;
-
-	ret = gfs2_truncatei_resume(ip);
-	gfs2_glock_assert_withdraw(gl, ret == 0);
-
-	spin_lock(&gl->gl_lockref.lock);
-	clear_bit(GLF_LOCK, &gl->gl_flags);
-	run_queue(gl, 1);
-	wake_up_glock(gl);
-	spin_unlock(&gl->gl_lockref.lock);
-}
-
-void gfs2_wait_truncate(struct gfs2_inode *ip)
-{
-	struct gfs2_glock *gl = ip->i_gl;
-	wait_queue_head_t *wq = glock_waitqueue(&gl->gl_name);
-
-	wait_event(*wq, !(ip->i_diskflags & GFS2_DIF_TRUNC_IN_PROG));
-}
-
 static const char *state2str(unsigned state)
 {
 	switch(state) {
diff --git a/fs/gfs2/glock.h b/fs/gfs2/glock.h
index 2796d5414ec9..5aed8b500cf5 100644
--- a/fs/gfs2/glock.h
+++ b/fs/gfs2/glock.h
@@ -274,8 +274,6 @@ extern void gfs2_cancel_delete_work(struct gfs2_glock *gl);
 extern bool gfs2_delete_work_queued(const struct gfs2_glock *gl);
 extern void gfs2_flush_delete_work(struct gfs2_sbd *sdp);
 extern void gfs2_gl_hash_clear(struct gfs2_sbd *sdp);
-extern void gfs2_glock_finish_truncate(struct gfs2_inode *ip);
-extern void gfs2_wait_truncate(struct gfs2_inode *ip);
 extern void gfs2_glock_thaw(struct gfs2_sbd *sdp);
 extern void gfs2_glock_add_to_lru(struct gfs2_glock *gl);
 extern void gfs2_glock_free(struct gfs2_glock *gl);
diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 6bc096610654..c387f80ca65e 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -488,7 +488,6 @@ int gfs2_inode_refresh(struct gfs2_inode *ip)
 static int inode_go_instantiate(struct gfs2_holder *gh)
 {
 	struct gfs2_glock *gl = gh->gh_gl;
-	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
 	struct gfs2_inode *ip = gl->gl_object;
 	int error = 0;
 
@@ -504,14 +503,8 @@ static int inode_go_instantiate(struct gfs2_holder *gh)
 
 	if ((ip->i_diskflags & GFS2_DIF_TRUNC_IN_PROG) &&
 	    (gl->gl_state == LM_ST_EXCLUSIVE) &&
-	    (gh->gh_state == LM_ST_EXCLUSIVE)) {
-		spin_lock(&sdp->sd_trunc_lock);
-		if (list_empty(&ip->i_trunc_list))
-			list_add(&ip->i_trunc_list, &sdp->sd_trunc_list);
-		spin_unlock(&sdp->sd_trunc_lock);
-		wake_up(&sdp->sd_quota_wait);
-		gfs2_wait_truncate(ip);
-	}
+	    (gh->gh_state == LM_ST_EXCLUSIVE))
+		error = gfs2_truncatei_resume(ip);
 
 out:
 	return error;
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 8c00fb389ae5..9e319c8f9efd 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -396,7 +396,6 @@ struct gfs2_inode {
 	atomic_t i_sizehint;  /* hint of the write size */
 	struct rw_semaphore i_rw_mutex;
 	struct list_head i_ordered;
-	struct list_head i_trunc_list;
 	__be64 *i_hash_cache;
 	u32 i_entries;
 	u32 i_diskflags;
@@ -784,8 +783,6 @@ struct gfs2_sbd {
 	struct mutex sd_quota_mutex;
 	struct mutex sd_quota_sync_mutex;
 	wait_queue_head_t sd_quota_wait;
-	struct list_head sd_trunc_list;
-	spinlock_t sd_trunc_lock;
 
 	unsigned int sd_quota_slots;
 	unsigned long *sd_quota_bitmap;
diff --git a/fs/gfs2/main.c b/fs/gfs2/main.c
index 244187e3e70f..d94791527dcb 100644
--- a/fs/gfs2/main.c
+++ b/fs/gfs2/main.c
@@ -38,7 +38,6 @@ static void gfs2_init_inode_once(void *foo)
 	inode_init_once(&ip->i_inode);
 	atomic_set(&ip->i_sizehint, 0);
 	init_rwsem(&ip->i_rw_mutex);
-	INIT_LIST_HEAD(&ip->i_trunc_list);
 	INIT_LIST_HEAD(&ip->i_ordered);
 	ip->i_qadata = NULL;
 	gfs2_holder_mark_uninitialized(&ip->i_rgd_gh);
diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index c9b423c874a3..549879929c84 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -106,8 +106,6 @@ static struct gfs2_sbd *init_sbd(struct super_block *sb)
 	mutex_init(&sdp->sd_quota_mutex);
 	mutex_init(&sdp->sd_quota_sync_mutex);
 	init_waitqueue_head(&sdp->sd_quota_wait);
-	INIT_LIST_HEAD(&sdp->sd_trunc_list);
-	spin_lock_init(&sdp->sd_trunc_lock);
 	spin_lock_init(&sdp->sd_bitmap_lock);
 
 	INIT_LIST_HEAD(&sdp->sd_sc_inodes_list);
diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index 59d727a4ae2c..a6667e8d781f 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -1517,25 +1517,6 @@ static void quotad_check_timeo(struct gfs2_sbd *sdp, const char *msg,
 	}
 }
 
-static void quotad_check_trunc_list(struct gfs2_sbd *sdp)
-{
-	struct gfs2_inode *ip;
-
-	while(1) {
-		ip = NULL;
-		spin_lock(&sdp->sd_trunc_lock);
-		if (!list_empty(&sdp->sd_trunc_list)) {
-			ip = list_first_entry(&sdp->sd_trunc_list,
-					struct gfs2_inode, i_trunc_list);
-			list_del_init(&ip->i_trunc_list);
-		}
-		spin_unlock(&sdp->sd_trunc_lock);
-		if (ip == NULL)
-			return;
-		gfs2_glock_finish_truncate(ip);
-	}
-}
-
 void gfs2_wake_up_statfs(struct gfs2_sbd *sdp) {
 	if (!sdp->sd_statfs_force_sync) {
 		sdp->sd_statfs_force_sync = 1;
@@ -1558,7 +1539,6 @@ int gfs2_quotad(void *data)
 	unsigned long quotad_timeo = 0;
 	unsigned long t = 0;
 	DEFINE_WAIT(wait);
-	int empty;
 
 	while (!kthread_should_stop()) {
 
@@ -1579,19 +1559,13 @@ int gfs2_quotad(void *data)
 		quotad_check_timeo(sdp, "sync", gfs2_quota_sync, t,
 				   &quotad_timeo, &tune->gt_quota_quantum);
 
-		/* Check for & recover partially truncated inodes */
-		quotad_check_trunc_list(sdp);
-
 		try_to_freeze();
 
 bypass:
 		t = min(quotad_timeo, statfs_timeo);
 
 		prepare_to_wait(&sdp->sd_quota_wait, &wait, TASK_INTERRUPTIBLE);
-		spin_lock(&sdp->sd_trunc_lock);
-		empty = list_empty(&sdp->sd_trunc_list);
-		spin_unlock(&sdp->sd_trunc_lock);
-		if (empty && !sdp->sd_statfs_force_sync)
+		if (!sdp->sd_statfs_force_sync)
 			t -= schedule_timeout(t);
 		else
 			t = 0;
-- 
2.35.1

