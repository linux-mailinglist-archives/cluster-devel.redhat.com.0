Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D73E9763EA2
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Jul 2023 20:36:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690396573;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4nMBXV7H64gOrhl4zawAd1v4gOxxcUcKa0XrtHmmrHA=;
	b=UN2EvTFKsZozGDZZzx2ZAoIXXtpFdbAI4rX0zp8IPH90xZYxzWAUwbOWY7i9Y2wsIkE2YK
	VuQ6yZU/JG3fhTqTD7XxKq4FkiHbIglhajPmRCGEJsDEVep3phPlmzqQ9rZMd0WxW7dbhq
	9G1tRq5QyVxMdMoMrXFQhDRkpw08JNY=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-jZK23pkRNriju1UjDj4AAQ-1; Wed, 26 Jul 2023 14:36:09 -0400
X-MC-Unique: jZK23pkRNriju1UjDj4AAQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 803E5381494D;
	Wed, 26 Jul 2023 18:36:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 25CE04094DC3;
	Wed, 26 Jul 2023 18:36:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B5A061946A72;
	Wed, 26 Jul 2023 18:36:04 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AE4AB1946A6C for <cluster-devel@listman.corp.redhat.com>;
 Wed, 26 Jul 2023 17:00:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 969D84094DC0; Wed, 26 Jul 2023 17:00:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.users.ipa.redhat.com (unknown [10.22.32.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D97F4094DC1
 for <cluster-devel@redhat.com>; Wed, 26 Jul 2023 17:00:34 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 26 Jul 2023 12:00:33 -0500
Message-ID: <20230726170033.389773-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Cluster-devel] [PATCH] gfs2: prevent gfs2_logd spinning
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

Before this patch if the ail list was busy due to slow hardware, and the
number of free blocks was insufficient for a transaction the logd daemon
could loop hundreds of thousands of times, each making no progress.
This robbed the system of cpu time and did massive amounts of locking
and unlocking of the ail list spinlock (sd_ail_lock) which made it
harder to make progress flushing the log to free up the necessary space
in the journal.

This patch checks to see if any progress has been made on processing the
ail list. If all the ail items are busy (being written) and no progress
has been made, the logd daemon sleeps for one second (rather than the
normal 30 seconds). As before, log flushes override this behavior.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/log.c | 42 ++++++++++++++++++++++++++++++++----------
 1 file changed, 32 insertions(+), 10 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index aa568796207c..df626cdc7093 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -298,12 +298,13 @@ static void gfs2_ail_empty_tr(struct gfs2_sbd *sdp, struct gfs2_trans *tr,
  * @sdp: the filesystem
  * @tr: the transaction
  * @max_revokes: If nonzero, issue revokes for the bd items for written buffers
+ * @inactive: Returned count of ail elements that are no longer active
  *
  * returns: the transaction's count of remaining active items
  */
 
 static int gfs2_ail1_empty_one(struct gfs2_sbd *sdp, struct gfs2_trans *tr,
-				int *max_revokes)
+				int *max_revokes, u32 *inactive)
 {
 	struct gfs2_bufdata *bd, *s;
 	struct buffer_head *bh;
@@ -326,6 +327,7 @@ static int gfs2_ail1_empty_one(struct gfs2_sbd *sdp, struct gfs2_trans *tr,
 			active_count++;
 			continue;
 		}
+		(*inactive)++;
 		if (!buffer_uptodate(bh) &&
 		    !cmpxchg(&sdp->sd_log_error, 0, -EIO)) {
 			gfs2_io_error_bh(sdp, bh);
@@ -351,19 +353,23 @@ static int gfs2_ail1_empty_one(struct gfs2_sbd *sdp, struct gfs2_trans *tr,
  * gfs2_ail1_empty - Try to empty the ail1 lists
  * @sdp: The superblock
  * @max_revokes: If non-zero, add revokes where appropriate
+ * @progress: if non-null, count of ail items for which we made progress
  *
  * Tries to empty the ail1 lists, starting with the oldest first
  */
 
-static int gfs2_ail1_empty(struct gfs2_sbd *sdp, int max_revokes)
+static int gfs2_ail1_empty(struct gfs2_sbd *sdp, int max_revokes, u32 *progress)
 {
 	struct gfs2_trans *tr, *s;
 	int oldest_tr = 1;
+	u32 tot_inactive = 0, inactive = 0;
 	int ret;
 
 	spin_lock(&sdp->sd_ail_lock);
 	list_for_each_entry_safe_reverse(tr, s, &sdp->sd_ail1_list, tr_list) {
-		if (!gfs2_ail1_empty_one(sdp, tr, &max_revokes) && oldest_tr)
+		ret = gfs2_ail1_empty_one(sdp, tr, &max_revokes, &inactive);
+		tot_inactive += inactive;
+;		if (!ret && oldest_tr)
 			list_move(&tr->tr_list, &sdp->sd_ail2_list);
 		else
 			oldest_tr = 0;
@@ -377,6 +383,8 @@ static int gfs2_ail1_empty(struct gfs2_sbd *sdp, int max_revokes)
 		gfs2_withdraw(sdp);
 	}
 
+	if (progress)
+		*progress += tot_inactive;
 	return ret;
 }
 
@@ -812,7 +820,7 @@ void gfs2_flush_revokes(struct gfs2_sbd *sdp)
 	unsigned int max_revokes = atomic_read(&sdp->sd_log_revokes_available);
 
 	gfs2_log_lock(sdp);
-	gfs2_ail1_empty(sdp, max_revokes);
+	gfs2_ail1_empty(sdp, max_revokes, NULL);
 	gfs2_log_unlock(sdp);
 }
 
@@ -984,7 +992,7 @@ static void empty_ail1_list(struct gfs2_sbd *sdp)
 		}
 		gfs2_ail1_start(sdp);
 		gfs2_ail1_wait(sdp);
-		if (gfs2_ail1_empty(sdp, 0))
+		if (gfs2_ail1_empty(sdp, 0, NULL))
 			return;
 	}
 }
@@ -1301,6 +1309,7 @@ int gfs2_logd(void *data)
 {
 	struct gfs2_sbd *sdp = data;
 	unsigned long t = 1;
+	u32 progress;
 	DEFINE_WAIT(wait);
 
 	while (!kthread_should_stop()) {
@@ -1320,28 +1329,41 @@ int gfs2_logd(void *data)
 			continue;
 		}
 
+		progress = 0;
 		if (gfs2_jrnl_flush_reqd(sdp) || t == 0) {
-			gfs2_ail1_empty(sdp, 0);
+			gfs2_ail1_empty(sdp, 0, &progress);
 			gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_NORMAL |
 						  GFS2_LFC_LOGD_JFLUSH_REQD);
 		}
 
+		t = gfs2_tune_get(sdp, gt_logd_secs) * HZ;
+
 		if (gfs2_ail_flush_reqd(sdp)) {
 			gfs2_ail1_start(sdp);
 			gfs2_ail1_wait(sdp);
-			gfs2_ail1_empty(sdp, 0);
+			/*
+			 * If we already made progress don't count again:
+			 * the second call may make no progress and zero our
+			 * counter, and we really only need to know if progress
+			 * was made.
+			 */
+			gfs2_ail1_empty(sdp, 0, progress ? NULL : &progress);
 			gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_NORMAL |
 						  GFS2_LFC_LOGD_AIL_FLUSH_REQD);
+			/*
+			 * If we made no progress on our ail list, wait only
+			 * 1 second.
+			 */
+			if (!progress)
+				t = HZ;
 		}
 
-		t = gfs2_tune_get(sdp, gt_logd_secs) * HZ;
-
 		try_to_freeze();
 
 		do {
 			prepare_to_wait(&sdp->sd_logd_waitq, &wait,
 					TASK_INTERRUPTIBLE);
-			if (!gfs2_ail_flush_reqd(sdp) &&
+			if ((!gfs2_ail_flush_reqd(sdp) || !progress) &&
 			    !gfs2_jrnl_flush_reqd(sdp) &&
 			    !kthread_should_stop())
 				t = schedule_timeout(t);
-- 
2.41.0

