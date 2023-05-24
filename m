Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EEF70F811
	for <lists+cluster-devel@lfdr.de>; Wed, 24 May 2023 15:53:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684936398;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wgoDAUEGIWMLSUk5bOEC+u2bXLN387impuhdZrh6D2U=;
	b=SfI0b8wXuk5juTpEbUn7EUgA7+jRbSaQR6YQrA7awBV0DfU9n/jRhsJiK6yhZ4Jxxee/8y
	G92h54a1JfvXjzLv0tfgtnvZVY2DtxnbewQa5KLhGfKlJsaWdEqQ2cIZobMYXPiXYxI46l
	y1hGJj2jNl08SDvzFDpeu5bP0+C8hdU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-zdRM1tXQO7-6EjjOZHdqrw-1; Wed, 24 May 2023 09:53:11 -0400
X-MC-Unique: zdRM1tXQO7-6EjjOZHdqrw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3630A38149A3;
	Wed, 24 May 2023 13:53:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E09092166B26;
	Wed, 24 May 2023 13:53:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B3B7B19465B3;
	Wed, 24 May 2023 13:53:09 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DEFFF19465A0 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 24 May 2023 13:50:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C14BD400F1F; Wed, 24 May 2023 13:50:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 977B2492B00;
 Wed, 24 May 2023 13:50:04 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 24 May 2023 09:50:01 -0400
Message-Id: <20230524135001.854651-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [Cluster-devel] [PATCH] dlm_controld: remove unnecessary header
 include
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
Cc: cluster-devel@redhat.com, fdinitto@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The timewarn netlink functionality got dropped and will be removed by
kernel v6.4. The user space part was already dropped by commit 34ea31e7
("controld: remove timewarn handling"). This is just a left over of this
commit. Recent builds fails now because the UAPI header in the Linux
kernel was removed. This means older dlm sources cannot be build with
newer kernel-headers, however it is not recommended to use older dlm
sources and all existing users should upgrade anyway.

Reported-by: Fabio M. Di Nitto <fdinitto@redhat.com>
---
 dlm_controld/main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/dlm_controld/main.c b/dlm_controld/main.c
index c9d1c5f1..14be5edd 100644
--- a/dlm_controld/main.c
+++ b/dlm_controld/main.c
@@ -12,7 +12,6 @@
 #include <pthread.h>
 #include <linux/netlink.h>
 #include <linux/genetlink.h>
-#include <linux/dlm_netlink.h>
 #include <uuid/uuid.h>
 
 #ifdef USE_SD_NOTIFY
-- 
2.31.1

