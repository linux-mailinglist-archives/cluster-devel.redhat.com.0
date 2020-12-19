Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 35BBC2DF1A4
	for <lists+cluster-devel@lfdr.de>; Sat, 19 Dec 2020 21:49:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608410968;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cUl1YJLDlkJR2ztkQKcrmHuHmZdEIqYG5/7rled6IQo=;
	b=UvU6GtKWHpPlRJNYVQpJ3rbD3O/gHVRkNfwGWUZRkPyla9jVTEM6gGS67CVeLssw+v/Ov2
	Bh4/G4Gu1ebIcB8pBvvZI6FU7GxwunliTSWR2slO3XGmV4LCKGTdt7fDDANY9r3xFZ+7qw
	rcwGJzG9CaQKJw1ul5MPWQiaMiWbAnM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-Q45VTqj0O--b-BOlR6uHXg-1; Sat, 19 Dec 2020 15:49:26 -0500
X-MC-Unique: Q45VTqj0O--b-BOlR6uHXg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AFE2E76A;
	Sat, 19 Dec 2020 20:49:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AE8550DD2;
	Sat, 19 Dec 2020 20:49:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 47B9B1809C9F;
	Sat, 19 Dec 2020 20:49:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BJKnNk4020241 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 19 Dec 2020 15:49:23 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5B80A50ADB; Sat, 19 Dec 2020 20:49:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (ovpn-115-196.ams2.redhat.com [10.36.115.196])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4DD152DAD0;
	Sat, 19 Dec 2020 20:49:22 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Sat, 19 Dec 2020 21:48:40 +0100
Message-Id: <20201219204848.285781-13-agruenba@redhat.com>
In-Reply-To: <20201219204848.285781-1-agruenba@redhat.com>
References: <20201219204848.285781-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v2 12/20] gfs2: Clean up gfs2_log_reserve
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Wake up log waiters in gfs2_log_release when log space has actually become
available.  This is a much better place for the wakeup than gfs2_logd.

Check if enough log space is immeditely available before anything else.  If
there isn't, use io_wait_event to wait instead of open-coding it.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/log.c | 54 ++++++++++++++++++++++-----------------------------
 1 file changed, 23 insertions(+), 31 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 95ad444bd3dc..7a65823ad1f3 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -420,6 +420,8 @@ void gfs2_log_release(struct gfs2_sbd *sdp, unsigned int blks)
 	trace_gfs2_log_blocks(sdp, blks);
 	gfs2_assert_withdraw(sdp, atomic_read(&sdp->sd_log_blks_free) <=
 				  sdp->sd_jdesc->jd_blocks);
+	if (atomic_read(&sdp->sd_log_blks_needed))
+		wake_up(&sdp->sd_log_waitq);
 }
 
 /**
@@ -444,36 +446,33 @@ void gfs2_log_reserve(struct gfs2_sbd *sdp, unsigned int blks)
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
+	while (free_blocks >= wanted) {
+		if (atomic_try_cmpxchg(&sdp->sd_log_blks_free, &free_blocks,
+				       free_blocks - blks))
+			return;
+	}
+
+	atomic_add(blks, &sdp->sd_log_blks_needed);
+	for (;;) {
+		if (current != sdp->sd_logd_process)
 			wake_up(&sdp->sd_logd_waitq);
-			did_wait = 1;
-			if (atomic_read(&sdp->sd_log_blks_free) <= wanted)
-				io_schedule();
-			free_blocks = atomic_read(&sdp->sd_log_blks_free);
-		} while(free_blocks <= wanted);
-		finish_wait(&sdp->sd_log_waitq, &wait);
+		io_wait_event(sdp->sd_log_waitq,
+			(free_blocks = atomic_read(&sdp->sd_log_blks_free),
+			 free_blocks >= wanted));
+		do {
+			if (atomic_try_cmpxchg(&sdp->sd_log_blks_free,
+					       &free_blocks,
+					       free_blocks - blks))
+				goto reserved;
+		} while (free_blocks >= wanted);
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
+reserved:
+	trace_gfs2_log_blocks(sdp, -blks);
+	if (atomic_sub_return(blks, &sdp->sd_log_blks_needed))
 		wake_up(&sdp->sd_log_waitq);
 }
 
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

