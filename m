Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7816A87A3
	for <lists+cluster-devel@lfdr.de>; Thu,  2 Mar 2023 18:15:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677777317;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=N536NGW51PFM6xEFxepXWZr/bGax9xwl0UVRKbE4BAY=;
	b=KbuiOYa6RWKEYn33qYb3BUsSE5AGcIs8XxR8efZNXEjgMjzzST6qFxs3HVRjtTaWenc/+d
	/cj7GluQWsofiZnEc59mmmK45aTU0fHpd1UhD0DdOwQ6+IBJ0N3o04/A5edszTHoZ6PeYc
	phmbon+OFN/yPTDo00W1fnMZFXoKHjc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-282-Td_KXUCfP4uomIVzeS1Duw-1; Thu, 02 Mar 2023 12:15:15 -0500
X-MC-Unique: Td_KXUCfP4uomIVzeS1Duw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D25EF87A9E0;
	Thu,  2 Mar 2023 17:15:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C67D640C6EC4;
	Thu,  2 Mar 2023 17:15:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7BF161943BCA;
	Thu,  2 Mar 2023 17:15:10 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1E74C19452CE for <cluster-devel@listman.corp.redhat.com>;
 Thu,  2 Mar 2023 17:15:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 10D50492B12; Thu,  2 Mar 2023 17:14:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E057C492B00;
 Thu,  2 Mar 2023 17:14:55 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu,  2 Mar 2023 12:14:35 -0500
Message-Id: <20230302171441.1509914-8-aahringo@redhat.com>
In-Reply-To: <20230302171441.1509914-1-aahringo@redhat.com>
References: <20230302171441.1509914-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [Cluster-devel] [PATCH dlm-tool 08/14] dlm_controld: enable nanosec
 logging
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

Current scope of logging are the seconds since dlm_controld started.
This patch adds nanosecond scope which are requested from the os anyway.
---
 dlm_controld/main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/dlm_controld/main.c b/dlm_controld/main.c
index 8e8d4038..fdfebd1f 100644
--- a/dlm_controld/main.c
+++ b/dlm_controld/main.c
@@ -128,11 +128,13 @@ int do_write(int fd, void *buf, size_t count)
 	return 0;
 }
 
+enum { NS_PER_SECOND = 1000000000 };
+
 uint64_t monotime(void)
 {
 	struct timespec ts;
 	clock_gettime(CLOCK_MONOTONIC, &ts);
-	return ts.tv_sec;
+	return (ts.tv_sec * NS_PER_SECOND)  + ts.tv_nsec;
 }
 
 static void client_alloc(void)
-- 
2.31.1

