Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EF86DDE75
	for <lists+cluster-devel@lfdr.de>; Tue, 11 Apr 2023 16:49:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681224570;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=M9VB4Yf5ggTEenHmXTQLP/Q8rffF+pkHV/6Z4JYkvfI=;
	b=BCVJT3HKNIyacCADkEGNBL3itI0ZDeD94aXPTy+ZFwAwrYY5KN17sBLr8JKixxsVvj+mkA
	JsyqN9BPo7j3IqU6kbk2cxmUCepwFtuweBzuVLCH4y+5RA6LHBTsEV8Gwu4jbeqg/GB32N
	mMneNpAE9i8OMjd08xruImEmp8+5t7c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-346-95bicoBGNfKkepoh0EcINg-1; Tue, 11 Apr 2023 10:49:27 -0400
X-MC-Unique: 95bicoBGNfKkepoh0EcINg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D804101A551;
	Tue, 11 Apr 2023 14:49:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 942872166B32;
	Tue, 11 Apr 2023 14:49:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 295F61946A66;
	Tue, 11 Apr 2023 14:49:25 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4EEE119466DF for <cluster-devel@listman.corp.redhat.com>;
 Tue, 11 Apr 2023 14:49:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 30D734020C86; Tue, 11 Apr 2023 14:49:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 081924020C80;
 Tue, 11 Apr 2023 14:49:23 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 11 Apr 2023 10:49:14 -0400
Message-Id: <20230411144916.1231886-2-aahringo@redhat.com>
In-Reply-To: <20230411144916.1231886-1-aahringo@redhat.com>
References: <20230411144916.1231886-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Cluster-devel] [PATCH dlm-tool 2/4] fence: move pkg-config fail to
 bin target
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

Currently make (GNU Make 4.2.1) will fail if pkg-config fails even if
it's not necessary, e.g. make clean target. We move the make bailout if
pkg-config failed to the binary target when pkg-config result is
necessary.

Note: this is using $(.SHELLSTATUS) which is only available on GNU Make
version 4.2 or above.
---
 fence/Makefile | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/fence/Makefile b/fence/Makefile
index 894f6396..263657ec 100644
--- a/fence/Makefile
+++ b/fence/Makefile
@@ -21,8 +21,10 @@ CFLAGS += -fPIE -DPIE
 CFLAGS += -I../include
 
 PKG_CONFIG ?= pkg-config
+PKG_CONFIG_FLAGS := --errors-to-stdout
 
-CFLAGS += $(shell $(PKG_CONFIG) --cflags pacemaker-fencing)
+PACEMAKER_CFLAGS := $(shell $(PKG_CONFIG) $(PKG_CONFIG_FLAGS) --cflags pacemaker-fencing)
+PACEMAKER_CFLAGS_STATUS := $(.SHELLSTATUS)
 
 LDFLAGS += -Wl,-z,relro -Wl,-z,now -pie
 LDFLAGS += -ldl
@@ -30,7 +32,10 @@ LDFLAGS += -ldl
 all: $(BIN_TARGET)
 
 $(BIN_TARGET): $(BIN_SOURCE)
-	$(CC) $(BIN_SOURCE) $(CFLAGS) $(LDFLAGS) -o $@ -L.
+ifneq ($(PACEMAKER_CFLAGS_STATUS),0)
+	$(error "Failed to call pkg-config for pacemaker cflags: $(PACEMAKER_CFLAGS)")
+endif
+	$(CC) $(BIN_SOURCE) $(CFLAGS) $(PACEMAKER_CFLAGS) $(LDFLAGS) -o $@ -L.
 
 clean:
 	rm -f *.o *.so *.so.* $(BIN_TARGET)
-- 
2.31.1

