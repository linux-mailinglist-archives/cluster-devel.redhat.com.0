Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B6005417E9A
	for <lists+cluster-devel@lfdr.de>; Sat, 25 Sep 2021 02:24:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632529453;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8IobqHFgIxCnkFfRj5kCG5PgLEittumDz/w4/9QQP8w=;
	b=fLiDVkYO4c7XizJg6FayF21xKLFur7/G85/Zqrw45ys2yZVNbwkLIyaRslEvIs553AftLi
	IS2BWPppISe3dywy66jD/wxsb0/HrYTpEam7zOFv4TlwSwQXqvNLMHTR3TN3GJUWtPsUN6
	rosrhBCiOTYraADlP+/JjnrM6La98ZU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-38xdlS4gNly7NexMSllZvg-1; Fri, 24 Sep 2021 20:24:12 -0400
X-MC-Unique: 38xdlS4gNly7NexMSllZvg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D874E1084681;
	Sat, 25 Sep 2021 00:24:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E5E1D5D9CA;
	Sat, 25 Sep 2021 00:24:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 35DE14E58F;
	Sat, 25 Sep 2021 00:24:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18P0O0cs008580 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 24 Sep 2021 20:24:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A83725D6CF; Sat, 25 Sep 2021 00:24:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D9EE25D6D5;
	Sat, 25 Sep 2021 00:23:57 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: rpeterso@redhat.com
Date: Fri, 24 Sep 2021 20:23:53 -0400
Message-Id: <20210925002353.1861426-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH RFC gfs2/for-next] fs: gfs2: fix suspicious
	RCU usage
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch fixes a suspicious RCU usage by defer "thaw_glock()" call
outside of atomic context of "glock_hash_walk()". See:

[  993.426039] =============================
[  993.426765] WARNING: suspicious RCU usage
[  993.427522] 5.14.0-rc2+ #265 Tainted: G        W
[  993.428492] -----------------------------
[  993.429237] include/linux/rcupdate.h:328 Illegal context switch in RCU read-side critical section!
[  993.430860]
               other info that might help us debug this:

[  993.432304]
               rcu_scheduler_active = 2, debug_locks = 1
[  993.433493] 3 locks held by kworker/u32:2/194:
[  993.434319]  #0: ffff888109c23148 ((wq_completion)gfs2_control){+.+.}-{0:0}, at: process_one_work+0x452/0xad0
[  993.436135]  #1: ffff888109507e10 ((work_completion)(&(&sdp->sd_control_work)->work)){+.+.}-{0:0}, at: process_one_work+0x452/0xad0
[  993.438081]  #2: ffffffff85ee05c0 (rcu_read_lock){....}-{1:2}, at: rhashtable_walk_start_check+0x0/0x520
[  993.439665]
               stack backtrace:
[  993.440402] CPU: 13 PID: 194 Comm: kworker/u32:2 Tainted: G        W         5.14.0-rc2+ #265
[  993.441786] Hardware name: Red Hat KVM/RHEL-AV, BIOS 1.14.0-1.module+el8.6.0+12648+6ede71a5 04/01/2014
[  993.443304] Workqueue: gfs2_control gfs2_control_func
[  993.444147] Call Trace:
[  993.444565]  dump_stack_lvl+0x56/0x6f
[  993.445186]  ___might_sleep+0x191/0x1e0
[  993.445838]  down_read+0x7b/0x460
[  993.446400]  ? down_write_killable+0x2b0/0x2b0
[  993.447141]  ? find_held_lock+0xb3/0xd0
[  993.447794]  ? do_raw_spin_unlock+0xa2/0x130
[  993.448521]  dlm_unlock+0x9e/0x1a0
[  993.449102]  ? dlm_lock+0x260/0x260
[  993.449695]  ? pvclock_clocksource_read+0xdc/0x180
[  993.450495]  ? kvm_clock_get_cycles+0x14/0x20
[  993.451210]  ? ktime_get_with_offset+0xc6/0x170
[  993.451971]  gdlm_put_lock+0x29e/0x2d0
[  993.452599]  ? gfs2_cancel_delete_work+0x40/0x40
[  993.453361]  glock_hash_walk+0x16c/0x180
[  993.454014]  ? gfs2_glock_seq_stop+0x30/0x30
[  993.454754]  process_one_work+0x55e/0xad0
[  993.455443]  ? pwq_dec_nr_in_flight+0x110/0x110
[  993.456219]  worker_thread+0x65/0x5e0
[  993.456839]  ? process_one_work+0xad0/0xad0
[  993.457524]  kthread+0x1ed/0x220
[  993.458067]  ? set_kthread_struct+0x80/0x80
[  993.458764]  ret_from_fork+0x22/0x30
[  993.459426] BUG: sleeping function called from invalid context at kernel/locking/rwsem.c:1352
[  993.460816] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 194, name: kworker/u32:2
[  993.462172] 3 locks held by kworker/u32:2/194:
[  993.462916]  #0: ffff888109c23148 ((wq_completion)gfs2_control){+.+.}-{0:0}, at: process_one_work+0x452/0xad0
[  993.464542]  #1: ffff888109507e10 ((work_completion)(&(&sdp->sd_control_work)->work)){+.+.}-{0:0}, at: process_one_work+0x452/0xad0
[  993.466467]  #2: ffffffff85ee05c0 (rcu_read_lock){....}-{1:2}, at: rhashtable_walk_start_check+0x0/0x520
[  993.468016] CPU: 13 PID: 194 Comm: kworker/u32:2 Tainted: G        W         5.14.0-rc2+ #265
[  993.469378] Hardware name: Red Hat KVM/RHEL-AV, BIOS 1.14.0-1.module+el8.6.0+12648+6ede71a5 04/01/2014

The problem is that "thaw_glock()" will call
"sdp->sd_lockstruct.ls_ops->lm_put_lock(gl);" which ends in dlm case in
callback gdlm_put_lock() and this finally calls in some cases
"dlm_unlock()" but "dlm_unlock()" can't be called from atomic context
because semaphores, mutexes, etc.

This patch will simple store all glocks of the hash into a linked list
and do the job afterwards.

Fixes: 88ffbf3e037e ("GFS2: Use resizable hash table for glocks")
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
I am not sure if "thaw_glock()" can be simple deferred after
glock_hash_walk(). Also see that I extended the gfs2_glock structure
with another list entry, I am not sure if these structure are somehow
optimized to cachelines, etc. Otherwise there need to be a different
solution, however this patch should show the problem and maybe a
possible fix?

Sad that dlm API is sleepable context even it seems to offer an
asynchronous API, not easy to change that yet.

 fs/gfs2/glock.c  | 34 ++++++++++++++++++++++++----------
 fs/gfs2/incore.h |  1 +
 2 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 6dfd33dc206b..5c53b478ce2d 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -55,7 +55,7 @@ struct gfs2_glock_iter {
 	loff_t last_pos;		/* last position               */
 };
 
-typedef void (*glock_examiner) (struct gfs2_glock * gl);
+typedef void (*glock_examiner) (struct gfs2_glock * gl, void *data);
 
 static void do_xmote(struct gfs2_glock *gl, struct gfs2_holder *gh, unsigned int target);
 
@@ -1890,7 +1890,8 @@ static struct shrinker glock_shrinker = {
  * that.
  */
 
-static void glock_hash_walk(glock_examiner examiner, const struct gfs2_sbd *sdp)
+static void glock_hash_walk(glock_examiner examiner, const struct gfs2_sbd *sdp,
+			    void *data)
 {
 	struct gfs2_glock *gl;
 	struct rhashtable_iter iter;
@@ -1903,7 +1904,7 @@ static void glock_hash_walk(glock_examiner examiner, const struct gfs2_sbd *sdp)
 		while ((gl = rhashtable_walk_next(&iter)) && !IS_ERR(gl))
 			if (gl->gl_name.ln_sbd == sdp &&
 			    lockref_get_not_dead(&gl->gl_lockref))
-				examiner(gl);
+				examiner(gl, data);
 
 		rhashtable_walk_stop(&iter);
 	} while (cond_resched(), gl == ERR_PTR(-EAGAIN));
@@ -1937,7 +1938,7 @@ bool gfs2_delete_work_queued(const struct gfs2_glock *gl)
 	return test_bit(GLF_PENDING_DELETE, &gl->gl_flags);
 }
 
-static void flush_delete_work(struct gfs2_glock *gl)
+static void flush_delete_work(struct gfs2_glock *gl, void *data)
 {
 	if (gl->gl_name.ln_type == LM_TYPE_IOPEN) {
 		if (cancel_delayed_work(&gl->gl_delete)) {
@@ -1950,7 +1951,7 @@ static void flush_delete_work(struct gfs2_glock *gl)
 
 void gfs2_flush_delete_work(struct gfs2_sbd *sdp)
 {
-	glock_hash_walk(flush_delete_work, sdp);
+	glock_hash_walk(flush_delete_work, sdp, NULL);
 	flush_workqueue(gfs2_delete_workqueue);
 }
 
@@ -1976,7 +1977,7 @@ static void thaw_glock(struct gfs2_glock *gl)
  *
  */
 
-static void clear_glock(struct gfs2_glock *gl)
+static void clear_glock(struct gfs2_glock *gl, void *data)
 {
 	gfs2_glock_remove_from_lru(gl);
 
@@ -1987,6 +1988,13 @@ static void clear_glock(struct gfs2_glock *gl)
 	spin_unlock(&gl->gl_lockref.lock);
 }
 
+static void deferred_list_glock(struct gfs2_glock *gl, void *data)
+{
+	struct list_head *deferred_list = data;
+
+	list_add_tail(&gl->gl_deferred_list, deferred_list);
+}
+
 /**
  * gfs2_glock_thaw - Thaw any frozen glocks
  * @sdp: The super block
@@ -1995,7 +2003,13 @@ static void clear_glock(struct gfs2_glock *gl)
 
 void gfs2_glock_thaw(struct gfs2_sbd *sdp)
 {
-	glock_hash_walk(thaw_glock, sdp);
+	LIST_HEAD(deferred_list);
+	struct gfs2_glock *gl;
+
+	glock_hash_walk(deferred_list_glock, sdp, &deferred_list);
+
+	list_for_each_entry(gl, &deferred_list, gl_deferred_list)
+		thaw_glock(gl);
 }
 
 static void dump_glock(struct seq_file *seq, struct gfs2_glock *gl, bool fsid)
@@ -2005,7 +2019,7 @@ static void dump_glock(struct seq_file *seq, struct gfs2_glock *gl, bool fsid)
 	spin_unlock(&gl->gl_lockref.lock);
 }
 
-static void dump_glock_func(struct gfs2_glock *gl)
+static void dump_glock_func(struct gfs2_glock *gl, void *data)
 {
 	dump_glock(NULL, gl, true);
 }
@@ -2021,12 +2035,12 @@ void gfs2_gl_hash_clear(struct gfs2_sbd *sdp)
 {
 	set_bit(SDF_SKIP_DLM_UNLOCK, &sdp->sd_flags);
 	flush_workqueue(glock_workqueue);
-	glock_hash_walk(clear_glock, sdp);
+	glock_hash_walk(clear_glock, sdp, NULL);
 	flush_workqueue(glock_workqueue);
 	wait_event_timeout(sdp->sd_glock_wait,
 			   atomic_read(&sdp->sd_glock_disposal) == 0,
 			   HZ * 600);
-	glock_hash_walk(dump_glock_func, sdp);
+	glock_hash_walk(dump_glock_func, sdp, NULL);
 }
 
 void gfs2_glock_finish_truncate(struct gfs2_inode *ip)
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index dc5c9dccb060..9d95084819c9 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -358,6 +358,7 @@ struct gfs2_glock {
 
 	struct list_head gl_lru;
 	struct list_head gl_ail_list;
+	struct list_head gl_deferred_list;
 	atomic_t gl_ail_count;
 	atomic_t gl_revokes;
 	struct delayed_work gl_work;
-- 
2.27.0

