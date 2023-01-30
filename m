Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EA61B681A4C
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Jan 2023 20:24:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675106692;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RPv8jK2P22gCJiP+FprxEOF9h/IxmdhMQ/ElTrURaEw=;
	b=E2RkpixzeQ+QTOw9ou9rGsiQrNZ8Iou4za/lZChWW9Bc5J5rUfMgdmbsdWZzawFvJwAwLB
	MTrQOaKNmQaHUMK4yS21YD1aTfvU177ERi6FKbvoCcVDNJVKIf644U3psKX8b9E5hN7DMT
	kZTzuJb6oYLoubES/1rmL+eCDd2/P9M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-249-bHSTgRcsMB2S_xNUfezYCA-1; Mon, 30 Jan 2023 14:24:48 -0500
X-MC-Unique: bHSTgRcsMB2S_xNUfezYCA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5AB543C10228;
	Mon, 30 Jan 2023 19:24:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 264542026D68;
	Mon, 30 Jan 2023 19:24:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B66171946594;
	Mon, 30 Jan 2023 19:24:45 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 69A4B1946589 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 30 Jan 2023 19:24:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5ED6C422AE; Mon, 30 Jan 2023 19:24:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39CE7175AD;
 Mon, 30 Jan 2023 19:24:44 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 30 Jan 2023 14:24:31 -0500
Message-Id: <20230130192437.3330300-2-aahringo@redhat.com>
In-Reply-To: <20230130192437.3330300-1-aahringo@redhat.com>
References: <20230130192437.3330300-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Cluster-devel] [PATCH dlm-tool 2/8] dlm_controld: always create
 logdir
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Currently the logdir will be created only if logfile does contain a
string. To add another logfiles we simple create the logdir always on
startup.
---
 dlm_controld/logging.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/dlm_controld/logging.c b/dlm_controld/logging.c
index 2c57138c..3298ef99 100644
--- a/dlm_controld/logging.c
+++ b/dlm_controld/logging.c
@@ -38,27 +38,27 @@ void init_logging(void)
 
 	set_logfile_priority();
 
-	if (logfile[0]) {
-		old_umask = umask(0077);
-		rv = mkdir(SYS_VARDIR, 0700);
-		if (rv < 0 && errno != EEXIST) {
-			umask(old_umask);
-			goto skip_logfile;
-		}
+	old_umask = umask(0077);
+	rv = mkdir(SYS_VARDIR, 0700);
+	if (rv < 0 && errno != EEXIST) {
+		umask(old_umask);
+		goto skip_logfile;
+	}
 
-		rv = mkdir(SYS_LOGDIR, 0700);
-		if (rv < 0 && errno != EEXIST) {
-			umask(old_umask);
-			goto skip_logfile;
-		}
+	rv = mkdir(SYS_LOGDIR, 0700);
+	if (rv < 0 && errno != EEXIST) {
+		umask(old_umask);
+		goto skip_logfile;
+	}
 
-		rv = mkdir(LOGDIR, 0700);
-		if (rv < 0 && errno != EEXIST) {
-			umask(old_umask);
-			goto skip_logfile;
-		}
+	rv = mkdir(LOGDIR, 0700);
+	if (rv < 0 && errno != EEXIST) {
 		umask(old_umask);
+		goto skip_logfile;
+	}
+	umask(old_umask);
 
+	if (logfile[0]) {
 		logfile_fp = fopen(logfile, "a+");
 		if (logfile_fp != NULL) {
 			int fd = fileno(logfile_fp);
-- 
2.31.1

