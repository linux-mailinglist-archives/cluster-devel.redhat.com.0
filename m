Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A66522D9468
	for <lists+cluster-devel@lfdr.de>; Mon, 14 Dec 2020 09:55:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607936109;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IMs94EsZ53wXt+tbvmgB7gVeQVcDxL6SlSMyBCO+p/8=;
	b=fHApDnhPHTbAtfkWMRfU/TLIec69ywBdOdP9jLOv+ECrzedFF8mRO0C0Jk23+kZV8RSx1N
	opAlf59iUHxkbH1ndPtDcIsBX5HJPLD1sbDVkmbGSAEh7tf3bD7zuJDecay9wu9E6xcbZ6
	fpRs7U2AaHM1zI7N6UyqVqWJxDDrSB8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-VTWvfRBeP2WeikdfbaBW0w-1; Mon, 14 Dec 2020 03:55:08 -0500
X-MC-Unique: VTWvfRBeP2WeikdfbaBW0w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4749800D53;
	Mon, 14 Dec 2020 08:55:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A47735D9D0;
	Mon, 14 Dec 2020 08:55:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8E4FB5002C;
	Mon, 14 Dec 2020 08:55:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BE8t3uf016490 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 14 Dec 2020 03:55:03 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8F11862681; Mon, 14 Dec 2020 08:55:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.194])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C88F66267C;
	Mon, 14 Dec 2020 08:55:02 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 14 Dec 2020 09:54:41 +0100
Message-Id: <20201214085442.45467-12-agruenba@redhat.com>
In-Reply-To: <20201214085442.45467-1-agruenba@redhat.com>
References: <20201214085442.45467-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 11/12] gfs2: Clean up gfs2_log_reserve
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Wake up log waiters in gfs2_log_release when log space has actually become
available.  This is a much better place for the wakeup than gfs2_logd.

Check if enough log space is immeditely available before anything else.  If
there isn't, use io_wait_event to wait instead of open coding it.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/log.c | 58 ++++++++++++++++++++++-----------------------------
 1 file changed, 25 insertions(+), 33 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index a8cc71ba4852..36dbec4f9a54 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -411,6 +411,8 @@ void gfs2_log_release(struct gfs2_sbd *sdp, unsigned int blks)
 	trace_gfs2_log_blocks(sdp, blks);
 	gfs2_assert_withdraw(sdp, atomic_read(&sdp->sd_log_blks_free) <=
 				  sdp->sd_jdesc->jd_blocks);
+	if (atomic_read(&sdp->sd_log_blks_needed))
+		wake_up(&sdp->sd_log_waitq);
 }
 
 /**
@@ -444,37 +446,34 @@ void gfs2_log_reserve(struct gfs2_sbd *sdp, unsigned int blks)
 {
 	unsigned reserved_blks = 7 * (4096 / sdp->sd_vfs->s_blocksize);
 	unsigned wanted = blks + reserved_blks;
-	DEFINE_WAIT(wait);
-	int did_wait = 0;
 	unsigned int free_blocks;
 
-	atomic_add(blks, &sdp->sd_log_blks_needed);
-retry:
 	free_blocks = atomic_read(&sdp->sd_log_blks_free);
-	if (unlikely(free_blocks <= wanted)) {
-		do {
-			prepare_to_wait_exclusive(&sdp->sd_log_waitq, &wait,
-					TASK_UNINTERRUPTIBLE);
-			wake_up(&sdp->sd_logd_waitq);
-			did_wait = 1;
-			if (atomic_read(&sdp->sd_log_blks_free) <= wanted)
-				io_schedule();
-			free_blocks = atomic_read(&sdp->sd_log_blks_free);
-		} while(free_blocks <= wanted);
-		finish_wait(&sdp->sd_log_waitq, &wait);
+	while (free_blocks >= wanted) {
+	       if (atomic_try_cmpxchg(&sdp->sd_log_blks_free, &free_blocks,
+				      free_blocks - blks))
+		       return;
 	}
-	if (atomic_cmpxchg(&sdp->sd_log_blks_free, free_blocks,
-				free_blocks - blks) != free_blocks)
-		goto retry;
-	atomic_sub(blks, &sdp->sd_log_blks_needed);
-	trace_gfs2_log_blocks(sdp, -blks);
 
-	/*
-	 * If we waited, then so might others, wake them up _after_ we get
-	 * our share of the log.
-	 */
-	if (unlikely(did_wait))
-		wake_up(&sdp->sd_log_waitq);
+	atomic_add(blks, &sdp->sd_log_blks_needed);
+	for (;;) {
+		if (current != sdp->sd_logd_process)
+			wake_up(&sdp->sd_logd_waitq);
+		io_wait_event(sdp->sd_log_waitq,
+			(free_blocks = atomic_read(&sdp->sd_log_blks_free),
+			 free_blocks >= wanted));
+		do {
+		       if (atomic_try_cmpxchg(&sdp->sd_log_blks_free,
+					      &free_blocks,
+					      free_blocks - blks)) {
+				trace_gfs2_log_blocks(sdp, -blks);
+				if (atomic_sub_return(blks,
+						&sdp->sd_log_blks_needed))
+					wake_up(&sdp->sd_log_waitq);
+				return;
+		       }
+		} while (free_blocks >= wanted);
+	}
 }
 
 /**
@@ -1190,7 +1189,6 @@ int gfs2_logd(void *data)
 	struct gfs2_sbd *sdp = data;
 	unsigned long t = 1;
 	DEFINE_WAIT(wait);
-	bool did_flush;
 
 	while (!kthread_should_stop()) {
 
@@ -1209,12 +1207,10 @@ int gfs2_logd(void *data)
 			continue;
 		}
 
-		did_flush = false;
 		if (gfs2_jrnl_flush_reqd(sdp) || t == 0) {
 			gfs2_ail1_empty(sdp, 0);
 			gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_NORMAL |
 				       GFS2_LFC_LOGD_JFLUSH_REQD);
-			did_flush = true;
 		}
 
 		if (gfs2_ail_flush_reqd(sdp)) {
@@ -1223,12 +1219,8 @@ int gfs2_logd(void *data)
 			gfs2_ail1_empty(sdp, 0);
 			gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_NORMAL |
 				       GFS2_LFC_LOGD_AIL_FLUSH_REQD);
-			did_flush = true;
 		}
 
-		if (!gfs2_ail_flush_reqd(sdp) || did_flush)
-			wake_up(&sdp->sd_log_waitq);
-
 		t = gfs2_tune_get(sdp, gt_logd_secs) * HZ;
 
 		try_to_freeze();
-- 
2.26.2

