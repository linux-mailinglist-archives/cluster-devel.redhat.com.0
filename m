Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE6B682E81
	for <lists+cluster-devel@lfdr.de>; Tue, 31 Jan 2023 14:56:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675173382;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jHkFTg5U5L2aSpK1Lpdy5RIgBJ+tb+SijBcIJUVS9q8=;
	b=dDv10Eu09Fleoo44VomFAy/sH+CCazUaDfE2M9A/fywaVlUzojT/rujLk/cuEaCA7JVdQ8
	smH9J9LHSQSLQwFvvPUEiQhhHD+8OYEYq4nnnLRmK6pk3Mrz8DYJIYgcxr84Hy+CI2MvC+
	hc+ppzUHV2Xe+OSdf9CNg7DTm3P+Lik=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-UuBmLEBjNd24sOB57UZnZQ-1; Tue, 31 Jan 2023 08:56:16 -0500
X-MC-Unique: UuBmLEBjNd24sOB57UZnZQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65A32886063;
	Tue, 31 Jan 2023 13:56:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0C17340E4314;
	Tue, 31 Jan 2023 13:56:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B1C671946594;
	Tue, 31 Jan 2023 13:56:10 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4F9511946587 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 31 Jan 2023 13:56:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 40903492B0F; Tue, 31 Jan 2023 13:56:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 07529492B00;
 Tue, 31 Jan 2023 13:56:09 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 31 Jan 2023 08:56:05 -0500
Message-Id: <20230131135605.3831691-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [Cluster-devel] [PATCH dlm-tool] dlm_controld: add gcc format
 printf attribute to log_level
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
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch will add __attribute__ (( format( printf, 3, 4 ) ) to
log_level() functionality which has a format string as parameter. With
this change we enable compiler warnings if format string and applied
parameters do not match. We had some couple of warnings which this patch
fixes as well.
---
 dlm_controld/daemon_cpg.c | 2 +-
 dlm_controld/dlm_daemon.h | 1 +
 dlm_controld/plock.c      | 3 ++-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/dlm_controld/daemon_cpg.c b/dlm_controld/daemon_cpg.c
index e6a03a28..2e0634d4 100644
--- a/dlm_controld/daemon_cpg.c
+++ b/dlm_controld/daemon_cpg.c
@@ -2080,7 +2080,7 @@ int receive_run_reply(struct dlm_header *hd, int len)
 		return 0;
 
 	if (len != sizeof(struct run_reply)) {
-		log_debug("receive_run_reply %s bad len %s expect %d",
+		log_debug("receive_run_reply %s bad len %d expect %zu",
 			  rep->uuid, len, sizeof(struct run_reply));
 		run->info.reply_count++;
 		run->info.need_replies--;
diff --git a/dlm_controld/dlm_daemon.h b/dlm_controld/dlm_daemon.h
index 9bf3f621..2a2b0dbf 100644
--- a/dlm_controld/dlm_daemon.h
+++ b/dlm_controld/dlm_daemon.h
@@ -220,6 +220,7 @@ EXTERN struct list_head run_ops;
 #define LOG_PLOCK 0x00010000
 #define LOG_NONE  0x00001111
 
+__attribute__ (( format( printf, 3, 4 ) ))
 void log_level(const char *name_in, uint32_t level_in, const char *fmt, ...);
 
 #define log_error(fmt, args...) log_level(NULL, LOG_ERR, fmt, ##args)
diff --git a/dlm_controld/plock.c b/dlm_controld/plock.c
index 93afc608..54e5c744 100644
--- a/dlm_controld/plock.c
+++ b/dlm_controld/plock.c
@@ -2005,7 +2005,8 @@ void receive_plocks_data(struct lockspace *ls, struct dlm_header *hd, int len)
 		/* no locks should be included for owned resources */
 
 		if (owner && count) {
-			log_elock(ls, "recv_plocks_data %d:%u n %llu o %d bad count %u",
+			log_elock(ls, "recv_plocks_data %d:%u n %llu o %d bad count %" PRIu32,
+				  hd->nodeid, hd->msgdata,
 				  (unsigned long long)num, owner, count);
 			goto fail_free;
 		}
-- 
2.31.1

