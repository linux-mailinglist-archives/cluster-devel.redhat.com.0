Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E502075298C
	for <lists+cluster-devel@lfdr.de>; Thu, 13 Jul 2023 19:08:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689268126;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/ThPCYxaupQn2Wd/RvKdzEqnCNCCaKH43Rb/NnjncRI=;
	b=LEmtlXXkKDxcKfCTc8VXq1zrXA91pRbVrheB6WhaxRBfZGrcVmLgYbWW6f/OLR089EVCSy
	fWFMnvEU9Ld2XslH3a+WA8BYd0NWNsWLn7StZlNM8S6gYARBTFC9xDGXXsVyFqGo38BJTW
	yj1hBa5AAKnIhol3jYj69wWlOdvv+k8=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-rOOo4uoHMOOJ2Cnv-077Qg-1; Thu, 13 Jul 2023 13:08:41 -0400
X-MC-Unique: rOOo4uoHMOOJ2Cnv-077Qg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD2213C0C498;
	Thu, 13 Jul 2023 17:08:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0DAED492C13;
	Thu, 13 Jul 2023 17:08:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D81E919465A0;
	Thu, 13 Jul 2023 17:08:39 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5709D1946589 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 13 Jul 2023 17:08:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 38BA92166B27; Thu, 13 Jul 2023 17:08:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D9222166B26;
 Thu, 13 Jul 2023 17:08:38 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 13 Jul 2023 13:08:35 -0400
Message-Id: <20230713170836.3583715-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH dlm-tool 1/2] fs: dlm: handle
 DLM_PLOCK_FL_NO_REPLY
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

This patch will handle a newly introduced op flag DLM_PLOCK_FL_NO_REPLY
to be sure we never send a result back in case of the kernel doesn't
expect never a result back.
---
 dlm_controld/plock.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/dlm_controld/plock.c b/dlm_controld/plock.c
index a91aecb0..ab19e8d7 100644
--- a/dlm_controld/plock.c
+++ b/dlm_controld/plock.c
@@ -9,6 +9,10 @@
 #include "dlm_daemon.h"
 #include <linux/dlm_plock.h>
 
+#ifndef DLM_PLOCK_FL_NO_REPLY
+#define DLM_PLOCK_FL_NO_REPLY 2
+#endif
+
 static uint32_t plock_read_count;
 static uint32_t plock_recv_count;
 static uint32_t plock_rate_delays;
@@ -680,6 +684,12 @@ static void write_result(struct dlm_plock_info *in, int rv)
 {
 	int write_rv;
 
+	if (in->flags & DLM_PLOCK_FL_NO_REPLY) {
+		log_debug("write_result: ignored rv %d fd %d\n",
+			  rv, plock_device_fd);
+		return;
+	}
+
 	in->rv = rv;
 	write_rv = write(plock_device_fd, in, sizeof(struct dlm_plock_info));
 	if (write_rv < 0)
-- 
2.31.1

