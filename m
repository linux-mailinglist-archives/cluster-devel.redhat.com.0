Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B23C26AE824
	for <lists+cluster-devel@lfdr.de>; Tue,  7 Mar 2023 18:13:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678209200;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RPv8jK2P22gCJiP+FprxEOF9h/IxmdhMQ/ElTrURaEw=;
	b=PZIcXWnTML2jH+fqxvyZOXAVX+8OSPXdBogOcFqpO3HOraSRv+9oVz4m131X9XRQ7jl/YR
	hka4sTZhF/l2M4EqKazXPLlQ1jCP2iMjfoNKTWm/waMg0jv6tu4oM+xWv6REA/dquPebg9
	1l2zEucC+H9f/7msyFtWA9rKuVkYOJU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-EAeC77R0NhKu4N3ncPkeyg-1; Tue, 07 Mar 2023 12:13:16 -0500
X-MC-Unique: EAeC77R0NhKu4N3ncPkeyg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B4811C426A1;
	Tue,  7 Mar 2023 17:13:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7F60E1121314;
	Tue,  7 Mar 2023 17:13:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 55BFE19465A8;
	Tue,  7 Mar 2023 17:13:13 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AC2771946594 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  7 Mar 2023 17:13:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A035614171C4; Tue,  7 Mar 2023 17:13:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C2B1140EBF4;
 Tue,  7 Mar 2023 17:13:10 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue,  7 Mar 2023 12:13:00 -0500
Message-Id: <20230307171307.2785162-3-aahringo@redhat.com>
In-Reply-To: <20230307171307.2785162-1-aahringo@redhat.com>
References: <20230307171307.2785162-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCHv2 dlm-tool 2/9] dlm_controld: always create
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

