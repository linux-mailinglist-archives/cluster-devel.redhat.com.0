Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1D56A87A8
	for <lists+cluster-devel@lfdr.de>; Thu,  2 Mar 2023 18:15:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677777319;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RPv8jK2P22gCJiP+FprxEOF9h/IxmdhMQ/ElTrURaEw=;
	b=JTGAcpw1yephX4xXM6mNvxvMfHp78+qt2y4U8PfOeAvta1FFZ0U+Geie9y1tTaIBy6AUq9
	8zpqQk0/QngeLkhnENOyjISZZYIYMPv9Q1pD2xAyztni5EgDF2jJJ3ION022BRHzo/9CT8
	Qi5uilz2Zog/lDp8LYhST74+sGQo+hY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-SP71X4qQMd65buIKJDpnhw-1; Thu, 02 Mar 2023 12:15:14 -0500
X-MC-Unique: SP71X4qQMd65buIKJDpnhw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 834E529AA2E3;
	Thu,  2 Mar 2023 17:15:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 787AD492C3E;
	Thu,  2 Mar 2023 17:15:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 70D3D1948679;
	Thu,  2 Mar 2023 17:15:10 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F05F219452D8 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  2 Mar 2023 17:14:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0FCB5492B0F; Thu,  2 Mar 2023 17:14:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D8FC2492C3E;
 Thu,  2 Mar 2023 17:14:54 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu,  2 Mar 2023 12:14:29 -0500
Message-Id: <20230302171441.1509914-2-aahringo@redhat.com>
In-Reply-To: <20230302171441.1509914-1-aahringo@redhat.com>
References: <20230302171441.1509914-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [Cluster-devel] [PATCH dlm-tool 02/14] dlm_controld: always create
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

