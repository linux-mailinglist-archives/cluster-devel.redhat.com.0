Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B382630E1F6
	for <lists+cluster-devel@lfdr.de>; Wed,  3 Feb 2021 19:08:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612375701;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FKYZZzmyadCBCH/1zNQSpfz7on9BQuuFJ5E/VnssqSk=;
	b=RzKKT24FhJxSEsX5IQgQTiS+ooWGIRi/AHR8RDeCRxaCC9coeOGpqUOaTpiLIKDNsJ2yIn
	vaf+9xqMzm8GMy9eTmL4nglU616N9+GPdffEqNDuqk6z1Nejul7UwBwpeU7Q4rCq73fu5c
	vGhMvnh2tf+lenOA2YQJA6YgZS4Ob2I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-IEITOc2_NbuUfXEN3EYtdQ-1; Wed, 03 Feb 2021 13:08:19 -0500
X-MC-Unique: IEITOc2_NbuUfXEN3EYtdQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69652107ACFC;
	Wed,  3 Feb 2021 18:08:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 55A5E1971C;
	Wed,  3 Feb 2021 18:08:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4151757DFA;
	Wed,  3 Feb 2021 18:08:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 113I8EB0028636 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 3 Feb 2021 13:08:14 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 48E713828; Wed,  3 Feb 2021 18:08:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (ovpn-112-155.ams2.redhat.com [10.36.112.155])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8F8A5709B7;
	Wed,  3 Feb 2021 18:08:13 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed,  3 Feb 2021 19:07:48 +0100
Message-Id: <20210203180755.246596-14-agruenba@redhat.com>
In-Reply-To: <20210203180755.246596-1-agruenba@redhat.com>
References: <20210203180755.246596-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v4 13/20] gfs2: Clean up gfs2_log_reserve
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
 fs/gfs2/log.c   | 58 +++++++++++++++++++++----------------------------
 fs/gfs2/trans.c |  3 +--
 2 files changed, 26 insertions(+), 35 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index cff95889b6f4..ca9fa481913d 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -415,11 +415,12 @@ bool gfs2_log_is_empty(struct gfs2_sbd *sdp) {
 
 void gfs2_log_release(struct gfs2_sbd *sdp, unsigned int blks)
 {
-
 	atomic_add(blks, &sdp->sd_log_blks_free);
 	trace_gfs2_log_blocks(sdp, blks);
 	gfs2_assert_withdraw(sdp, atomic_read(&sdp->sd_log_blks_free) <=
 				  sdp->sd_jdesc->jd_blocks);
+	if (atomic_read(&sdp->sd_log_blks_needed))
+		wake_up(&sdp->sd_log_waitq);
 }
 
 /**
@@ -444,36 +445,33 @@ void gfs2_log_reserve(struct gfs2_sbd *sdp, unsigned int blks)
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
 
@@ -1107,7 +1105,8 @@ static void log_refund(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 	maxres = sdp->sd_log_blks_reserved + tr->tr_reserved;
 	gfs2_assert_withdraw(sdp, maxres >= reserved);
 	unused = maxres - reserved;
-	gfs2_log_release(sdp, unused);
+	if (unused)
+		gfs2_log_release(sdp, unused);
 	sdp->sd_log_blks_reserved = reserved;
 
 	gfs2_log_unlock(sdp);
@@ -1192,7 +1191,6 @@ int gfs2_logd(void *data)
 	struct gfs2_sbd *sdp = data;
 	unsigned long t = 1;
 	DEFINE_WAIT(wait);
-	bool did_flush;
 
 	while (!kthread_should_stop()) {
 
@@ -1211,12 +1209,10 @@ int gfs2_logd(void *data)
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
@@ -1225,12 +1221,8 @@ int gfs2_logd(void *data)
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
diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index 2269aa7ad69d..cac93b2004cf 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -73,10 +73,9 @@ int __gfs2_trans_begin(struct gfs2_trans *tr, struct gfs2_sbd *sdp,
 
 	down_read(&sdp->sd_log_flush_lock);
 	if (unlikely(!test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags))) {
-		gfs2_log_release(sdp, tr->tr_reserved);
 		up_read(&sdp->sd_log_flush_lock);
+		gfs2_log_release(sdp, tr->tr_reserved);
 		sb_end_intwrite(sdp->sd_vfs);
-		wake_up(&sdp->sd_log_waitq);
 		return -EROFS;
 	}
 
-- 
2.26.2

