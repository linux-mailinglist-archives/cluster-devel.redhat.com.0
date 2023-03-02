Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD3F6A87A6
	for <lists+cluster-devel@lfdr.de>; Thu,  2 Mar 2023 18:15:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677777318;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MxeddMP38EQiRmtP0v1TsFnkAFxdfQzP66RdbmMndEw=;
	b=L7y+JhV8IkrT9XvnUnlmrviT6axmge6Uvq3/8uTwFfI/1LAeFUYlotCvQj3s/9b0+Un0nl
	+VCWxoAjobh5x97icwUHXvWUEmG8SuPqWHT6U2bXijQP58cTXvofLnFPm1cRG9KJAp0PnW
	NRDb/fFIaf4v/rqrFLeYBim/Co0dl9s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-yrl-SwYCPcew9L_CZCMouw-1; Thu, 02 Mar 2023 12:15:16 -0500
X-MC-Unique: yrl-SwYCPcew9L_CZCMouw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B778B87B2B8;
	Thu,  2 Mar 2023 17:15:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A425E14171B8;
	Thu,  2 Mar 2023 17:15:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 77B221943BC2;
	Thu,  2 Mar 2023 17:15:10 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1EC681948641 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  2 Mar 2023 17:15:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8DBFA492B17; Thu,  2 Mar 2023 17:14:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 69B3E492B00;
 Thu,  2 Mar 2023 17:14:56 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu,  2 Mar 2023 12:14:38 -0500
Message-Id: <20230302171441.1509914-11-aahringo@redhat.com>
In-Reply-To: <20230302171441.1509914-1-aahringo@redhat.com>
References: <20230302171441.1509914-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [Cluster-devel] [PATCH dlm-tool 11/14] dlm_controld: constify
 name_in in log_level()
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch will constify the name_in parameter of log_level() which is
only used as readonly pointer.
---
 dlm_controld/dlm_daemon.h | 2 +-
 dlm_controld/logging.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/dlm_controld/dlm_daemon.h b/dlm_controld/dlm_daemon.h
index 2c53e22b..2a2b0dbf 100644
--- a/dlm_controld/dlm_daemon.h
+++ b/dlm_controld/dlm_daemon.h
@@ -221,7 +221,7 @@ EXTERN struct list_head run_ops;
 #define LOG_NONE  0x00001111
 
 __attribute__ (( format( printf, 3, 4 ) ))
-void log_level(char *name_in, uint32_t level_in, const char *fmt, ...);
+void log_level(const char *name_in, uint32_t level_in, const char *fmt, ...);
 
 #define log_error(fmt, args...) log_level(NULL, LOG_ERR, fmt, ##args)
 #define log_debug(fmt, args...) log_level(NULL, LOG_DEBUG, fmt, ##args)
diff --git a/dlm_controld/logging.c b/dlm_controld/logging.c
index 83de2da4..e71fe52c 100644
--- a/dlm_controld/logging.c
+++ b/dlm_controld/logging.c
@@ -175,7 +175,7 @@ static void log_str_to_file(FILE *fp)
 	fflush(fp);
 }
 
-void log_level(char *name_in, uint32_t level_in, const char *fmt, ...)
+void log_level(const char *name_in, uint32_t level_in, const char *fmt, ...)
 {
 	va_list ap;
 	char name[NAME_ID_SIZE + 2];
-- 
2.31.1

