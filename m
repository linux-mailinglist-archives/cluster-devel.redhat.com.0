Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F24DB593A85
	for <lists+cluster-devel@lfdr.de>; Mon, 15 Aug 2022 21:52:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660593124;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Su63hAb8a6mVadskjqBVvhOMuGXIDX7TMBO5eC7eZbE=;
	b=TmLMT2qd7TDD5h5hunb4z4I1cOCuVvOMOEwnLg5pCckqFcw7NQPhnpqZk4PfDlD0S5DJj1
	1DlGu1sa6m4DewZeC71sWfHAXqaiiH0VbCw+ibzn+9QLV+s9BgFQeAzVLtJVg3PEoH32zi
	cq7E5+nJHyMbvCPwt9vJB3F7qxnpJ5U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-yxVQcVhRNOuXl8JoCGBRwQ-1; Mon, 15 Aug 2022 15:52:01 -0400
X-MC-Unique: yxVQcVhRNOuXl8JoCGBRwQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41E6A823F08;
	Mon, 15 Aug 2022 19:52:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 36DFB18EA8;
	Mon, 15 Aug 2022 19:52:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A1719194034E;
	Mon, 15 Aug 2022 19:51:59 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 432C5194034E for <cluster-devel@listman.corp.redhat.com>;
 Mon, 15 Aug 2022 19:51:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B86022026D64; Mon, 15 Aug 2022 19:51:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9CFB92026D07;
 Mon, 15 Aug 2022 19:51:57 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 15 Aug 2022 15:51:45 -0400
Message-Id: <20220815195148.2209805-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: [Cluster-devel] [PATCH dlm-tool 1/4] python: use force=2 as default
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

To avoid -EBUSY cases we should use 2 as default for force when
releasing the lockspace.
---
 python/bindings/dlm.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/python/bindings/dlm.py b/python/bindings/dlm.py
index b77d374c..b592a3e4 100644
--- a/python/bindings/dlm.py
+++ b/python/bindings/dlm.py
@@ -129,7 +129,7 @@ class Lockspace:
 		if not self.__ls:
 			raise DLMError(-errno.ENOMEM)
 
-	def release(self, force=0):
+	def release(self, force=2):
 		if not self.__ls:
 			return
 
-- 
2.31.1

