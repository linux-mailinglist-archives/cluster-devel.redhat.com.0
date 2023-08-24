Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FCB787A1F
	for <lists+cluster-devel@lfdr.de>; Thu, 24 Aug 2023 23:20:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692912003;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Y3pDag7WeYCcT/prwEGsElDsalLsF4eVH5WpuARrvCw=;
	b=NSKA6ar6fElfYk/isLu2bCjKHFJUKHsJgVSqNXlBDC1FHKllj10hTbQvPQTuq5eHsywKDI
	Su2al/r+o3Wny2kvDuihTQCoV9iT2A5cKdGmJrjM4zP1jrUy1E24Rnss3CZyf35r6G4PCu
	imf4YzMG3noIWkl5pzc4NCnVsEFAj+8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-PEDh_I0IOa-esi2loDe4Zw-1; Thu, 24 Aug 2023 17:19:59 -0400
X-MC-Unique: PEDh_I0IOa-esi2loDe4Zw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C610104D980;
	Thu, 24 Aug 2023 21:19:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 51DA71121319;
	Thu, 24 Aug 2023 21:19:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 24EE219465A8;
	Thu, 24 Aug 2023 21:19:58 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D068F1946589 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 24 Aug 2023 21:19:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C11DCC16030; Thu, 24 Aug 2023 21:19:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (unknown [10.45.224.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 23675C1602B;
 Thu, 24 Aug 2023 21:19:56 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Thu, 24 Aug 2023 23:19:48 +0200
Message-Id: <20230824211948.3242607-10-agruenba@redhat.com>
In-Reply-To: <20230824211948.3242607-1-agruenba@redhat.com>
References: <20230824211948.3242607-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Cluster-devel] [PATCH 9/9] gfs2: Fix quota data refcount after
 cleanup
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
Cc: syzbot+3f6a670108ce43356017@syzkaller.appspotmail.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

[   81.372851][ T5532] CPU: 1 PID: 5532 Comm: syz-executor.0 Not tainted 6.2.0-rc1-syzkaller-dirty #0
[   81.382080][ T5532] Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/12/2023
[   81.392343][ T5532] Call Trace:
[   81.395654][ T5532]  <TASK>
[   81.398603][ T5532]  dump_stack_lvl+0x1b1/0x290
[   81.418421][ T5532]  gfs2_assert_warn_i+0x19a/0x2e0
[   81.423480][ T5532]  gfs2_quota_cleanup+0x4c6/0x6b0
[   81.428611][ T5532]  gfs2_make_fs_ro+0x517/0x610
[   81.457802][ T5532]  gfs2_withdraw+0x609/0x1540
[   81.481452][ T5532]  gfs2_inode_refresh+0xb2d/0xf60
[   81.506658][ T5532]  gfs2_instantiate+0x15e/0x220
[   81.511504][ T5532]  gfs2_glock_wait+0x1d9/0x2a0
[   81.516352][ T5532]  do_sync+0x485/0xc80
[   81.554943][ T5532]  gfs2_quota_sync+0x3da/0x8b0
[   81.559738][ T5532]  gfs2_sync_fs+0x49/0xb0
[   81.564063][ T5532]  sync_filesystem+0xe8/0x220
[   81.568740][ T5532]  generic_shutdown_super+0x6b/0x310
[   81.574112][ T5532]  kill_block_super+0x79/0xd0
[   81.578779][ T5532]  deactivate_locked_super+0xa7/0xf0
[   81.584064][ T5532]  cleanup_mnt+0x494/0x520
[   81.593753][ T5532]  task_work_run+0x243/0x300
[   81.608837][ T5532]  exit_to_user_mode_loop+0x124/0x150
[   81.614232][ T5532]  exit_to_user_mode_prepare+0xb2/0x140
[   81.619820][ T5532]  syscall_exit_to_user_mode+0x26/0x60
[   81.625287][ T5532]  do_syscall_64+0x49/0xb0
[   81.629710][ T5532]  entry_SYSCALL_64_after_hwframe+0x63/0xcd

In this backtrace, gfs2_quota_sync() takes quota data references and
then calls do_sync().  Function do_sync() encounters filesystem
corruption and withdraws the filesystem, wich (among other things) calls
gfs2_quota_cleanup().  Function gfs2_quota_cleanup() wrongly assumes
that nobody is holding any quota data references anymore, and destroys
all quota data objects.  When gfs2_quota_sync() then resumes and
dereferences the quota data objects it is holding, those objects are no
longer there.

Fix that by changing gfs2_quota_cleanup() to only destroy quota data
objects that are no longer in use.  This also means that qd_put() needs
to check if quotas are still active, and destroy quota data objects
itself otherwise.  (We check for the presence of the SDF_JOURNAL_LIVE
flag to decide whether quotas are still active or not.)

Thanks to Edward Adam Davis <eadavis@sina.com> for the initial patches.

Link: https://lore.kernel.org/all/0000000000002b5e2405f14e860f@google.com
Reported-by: syzbot+3f6a670108ce43356017@syzkaller.appspotmail.com
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/ops_fstype.c |  1 +
 fs/gfs2/quota.c      | 41 ++++++++++++++++++++++++++++++++++++++---
 fs/gfs2/quota.h      |  1 +
 fs/gfs2/super.c      |  1 +
 4 files changed, 41 insertions(+), 3 deletions(-)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 6ea295cee463..4035f61c294d 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -1590,6 +1590,7 @@ static int gfs2_reconfigure(struct fs_context *fc)
 	if ((sb->s_flags ^ fc->sb_flags) & SB_RDONLY) {
 		if (fc->sb_flags & SB_RDONLY) {
 			gfs2_make_fs_ro(sdp);
+			gfs2_quota_wait_cleanup(sdp);
 		} else {
 			error = gfs2_make_fs_rw(sdp);
 			if (error)
diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index 97fdf64148ba..232211359f58 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -109,7 +109,11 @@ static inline void spin_unlock_bucket(unsigned int hash)
 static void gfs2_qd_dealloc(struct rcu_head *rcu)
 {
 	struct gfs2_quota_data *qd = container_of(rcu, struct gfs2_quota_data, qd_rcu);
+	struct gfs2_sbd *sdp = qd->qd_sbd;
+
 	kmem_cache_free(gfs2_quotad_cachep, qd);
+	if (atomic_dec_and_test(&sdp->sd_quota_count))
+		wake_up(&sdp->sd_kill_wait);
 }
 
 static void gfs2_qd_dispose(struct gfs2_quota_data *qd)
@@ -143,7 +147,6 @@ static void gfs2_qd_list_dispose(struct list_head *list)
 		list_del(&qd->qd_lru);
 
 		gfs2_qd_dispose(qd);
-		atomic_dec(&sdp->sd_quota_count);
 	}
 }
 
@@ -317,13 +320,24 @@ static void qd_hold(struct gfs2_quota_data *qd)
 
 static void qd_put(struct gfs2_quota_data *qd)
 {
+	struct gfs2_sbd *sdp;
+
 	if (lockref_put_or_lock(&qd->qd_lockref))
 		return;
 
+	BUG_ON(__lockref_is_dead(&qd->qd_lockref));
+	sdp = qd->qd_sbd;
+	if (unlikely(!test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags))) {
+		lockref_mark_dead(&qd->qd_lockref);
+		spin_unlock(&qd->qd_lockref.lock);
+
+		gfs2_qd_dispose(qd);
+		return;
+	}
+
 	qd->qd_lockref.count = 0;
 	list_lru_add(&gfs2_qd_lru, &qd->qd_lru);
 	spin_unlock(&qd->qd_lockref.lock);
-
 }
 
 static int slot_get(struct gfs2_quota_data *qd)
@@ -1466,20 +1480,41 @@ void gfs2_quota_cleanup(struct gfs2_sbd *sdp)
 	struct gfs2_quota_data *qd;
 	LIST_HEAD(dispose);
 
+	BUG_ON(test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags));
+
 	spin_lock(&qd_lock);
 	list_for_each_entry(qd, &sdp->sd_quota_list, qd_list) {
+		spin_lock(&qd->qd_lockref.lock);
+		if (qd->qd_lockref.count != 0) {
+			spin_unlock(&qd->qd_lockref.lock);
+			continue;
+		}
+		lockref_mark_dead(&qd->qd_lockref);
+		spin_unlock(&qd->qd_lockref.lock);
+
 		list_lru_del(&gfs2_qd_lru, &qd->qd_lru);
 		list_add(&qd->qd_lru, &dispose);
 	}
 	spin_unlock(&qd_lock);
 
 	gfs2_qd_list_dispose(&dispose);
-	gfs2_assert_warn(sdp, !atomic_read(&sdp->sd_quota_count));
 
 	kvfree(sdp->sd_quota_bitmap);
 	sdp->sd_quota_bitmap = NULL;
 }
 
+void gfs2_quota_wait_cleanup(struct gfs2_sbd *sdp)
+{
+	int count;
+
+	wait_event_timeout(sdp->sd_kill_wait,
+		(count = atomic_read(&sdp->sd_quota_count)) == 0,
+		HZ * 60);
+
+	if (count != 0)
+		fs_err(sdp, "%d left-over quota data objects\n", count);
+}
+
 static void quotad_error(struct gfs2_sbd *sdp, const char *msg, int error)
 {
 	if (error == 0 || error == -EROFS)
diff --git a/fs/gfs2/quota.h b/fs/gfs2/quota.h
index 21ada332d555..830c5116d628 100644
--- a/fs/gfs2/quota.h
+++ b/fs/gfs2/quota.h
@@ -33,6 +33,7 @@ extern int gfs2_quota_refresh(struct gfs2_sbd *sdp, struct kqid qid);
 
 extern int gfs2_quota_init(struct gfs2_sbd *sdp);
 extern void gfs2_quota_cleanup(struct gfs2_sbd *sdp);
+extern void gfs2_quota_wait_cleanup(struct gfs2_sbd *sdp);
 extern int gfs2_quotad(void *data);
 
 extern void gfs2_wake_up_statfs(struct gfs2_sbd *sdp);
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index e0dceef3c9cc..05a4adf320a6 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -622,6 +622,7 @@ static void gfs2_put_super(struct super_block *sb)
 	if (!sb_rdonly(sb)) {
 		gfs2_make_fs_ro(sdp);
 	}
+	gfs2_quota_wait_cleanup(sdp);
 	WARN_ON(gfs2_withdrawing(sdp));
 
 	/*  At this point, we're through modifying the disk  */
-- 
2.40.1

