Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D96086AE820
	for <lists+cluster-devel@lfdr.de>; Tue,  7 Mar 2023 18:13:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678209199;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DCuuw8CGb60VwJtKq4hDAmdO2SS1gH502BvQYrTlc94=;
	b=bcAoJAAm4iWHwoFBUtV+AzhiR20obuGuQowkWC2MmFECGU6jSyXeBOuJlTB7Ba3uRNIoIW
	wqVX8kHgSaD10T51f6A172aGOpI/4BLS7hVb8SYoWv6hDYYY5wP6Ddj0Hpt/g42qcP/MAb
	V8x78r9nbkAGBr6tN/z2dzGcKqdZM+c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-Q9umR-z3OayQwQKhtNeO5w-1; Tue, 07 Mar 2023 12:13:16 -0500
X-MC-Unique: Q9umR-z3OayQwQKhtNeO5w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C764100F908;
	Tue,  7 Mar 2023 17:13:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 62613492C14;
	Tue,  7 Mar 2023 17:13:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4ABFC19465B8;
	Tue,  7 Mar 2023 17:13:12 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D75DD19465B7 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  7 Mar 2023 17:13:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CCB8314171C3; Tue,  7 Mar 2023 17:13:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8AF0140EBF4;
 Tue,  7 Mar 2023 17:13:11 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue,  7 Mar 2023 12:13:07 -0500
Message-Id: <20230307171307.2785162-10-aahringo@redhat.com>
In-Reply-To: <20230307171307.2785162-1-aahringo@redhat.com>
References: <20230307171307.2785162-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCHv2 dlm-tool 9/9] dlm_controld: constify
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
index 94a9238f..86b37603 100644
--- a/dlm_controld/dlm_daemon.h
+++ b/dlm_controld/dlm_daemon.h
@@ -217,7 +217,7 @@ EXTERN struct list_head run_ops;
 #define LOG_NONE  0x00001111
 
 __attribute__ (( format( printf, 3, 4 ) ))
-void log_level(char *name_in, uint32_t level_in, const char *fmt, ...);
+void log_level(const char *name_in, uint32_t level_in, const char *fmt, ...);
 
 #define log_error(fmt, args...) log_level(NULL, LOG_ERR, fmt, ##args)
 #define log_debug(fmt, args...) log_level(NULL, LOG_DEBUG, fmt, ##args)
diff --git a/dlm_controld/logging.c b/dlm_controld/logging.c
index 3298ef99..f1f23f3f 100644
--- a/dlm_controld/logging.c
+++ b/dlm_controld/logging.c
@@ -151,7 +151,7 @@ static void log_save_str(int len, char *log_buf, unsigned int *point,
 	*wrap = w;
 }
 
-void log_level(char *name_in, uint32_t level_in, const char *fmt, ...)
+void log_level(const char *name_in, uint32_t level_in, const char *fmt, ...)
 {
 	va_list ap;
 	char name[NAME_ID_SIZE + 2];
-- 
2.31.1

