Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A84DC6DDE76
	for <lists+cluster-devel@lfdr.de>; Tue, 11 Apr 2023 16:49:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681224570;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Mih2OK/5gtuHD//4zMxAqY4NQmJFRiQF4YsaC75lTVM=;
	b=AkconXh857rhb5RHwMdtKlV0klrvMmZk91d2+Cslf5y7WWGcS4109sNE2MFdqYUmGk0BG9
	ZgmHMqWvS3ICd4w/e85TCZ6+p9zC7Zz37TCkHyvWrxvSZUApR5AyXnpCToKt7lJuSDNhDB
	nMEeU8BMWAQokFLQWrW6joFiNv527Jo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-446-8yzZmBTQOVOayJcvGRmz9w-1; Tue, 11 Apr 2023 10:49:27 -0400
X-MC-Unique: 8yzZmBTQOVOayJcvGRmz9w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6DCF6185A791;
	Tue, 11 Apr 2023 14:49:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BFD3FC15BB8;
	Tue, 11 Apr 2023 14:49:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 120811946A42;
	Tue, 11 Apr 2023 14:49:24 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4C6391946586 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 11 Apr 2023 14:49:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 032274020C84; Tue, 11 Apr 2023 14:49:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCD6D4020C80;
 Tue, 11 Apr 2023 14:49:22 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 11 Apr 2023 10:49:13 -0400
Message-Id: <20230411144916.1231886-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Cluster-devel] [PATCH dlm-tool 1/4] fence: make pkg-config binary
 as passable make var
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch defines PKG_CONFIG make var which could be overwrite by the
user like it's the case for dlm_controld Makefile.
---
 fence/Makefile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fence/Makefile b/fence/Makefile
index ee4dfb88..894f6396 100644
--- a/fence/Makefile
+++ b/fence/Makefile
@@ -19,7 +19,10 @@ CFLAGS += -D_GNU_SOURCE -O2 -ggdb \
 
 CFLAGS += -fPIE -DPIE
 CFLAGS += -I../include
-CFLAGS += $(shell pkg-config --cflags pacemaker-fencing)
+
+PKG_CONFIG ?= pkg-config
+
+CFLAGS += $(shell $(PKG_CONFIG) --cflags pacemaker-fencing)
 
 LDFLAGS += -Wl,-z,relro -Wl,-z,now -pie
 LDFLAGS += -ldl
-- 
2.31.1

