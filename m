Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A526DDE78
	for <lists+cluster-devel@lfdr.de>; Tue, 11 Apr 2023 16:49:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681224573;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CDBeN0CCdRqB1EuYN0kDlHjvECFIe5Sxql/QtV6E2gA=;
	b=T+y1/Np0YqDqcKOx3g1ERqebrzPzrL0PhDB9JT8TjAxA/Je1OLV28wFQNKE5BD3kCMrQ8T
	jjL8Gtvrfx23ASyzcdt9qRE/tNIjJlgEzFM/zw+43sRIRCKwHwkLev3kizjkvne/czv0nH
	JZwqylj8kf0/BlIdvskEscWFNSpaw+U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-BeCGnNqzOgSLH3qhe2gYWA-1; Tue, 11 Apr 2023 10:49:27 -0400
X-MC-Unique: BeCGnNqzOgSLH3qhe2gYWA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6ED0D3C0F377;
	Tue, 11 Apr 2023 14:49:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 25BAF47CDC;
	Tue, 11 Apr 2023 14:49:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1CAF41946A46;
	Tue, 11 Apr 2023 14:49:24 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6BE081946586 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 11 Apr 2023 14:49:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5D6254020C82; Tue, 11 Apr 2023 14:49:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 352734020C80;
 Tue, 11 Apr 2023 14:49:23 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 11 Apr 2023 10:49:15 -0400
Message-Id: <20230411144916.1231886-3-aahringo@redhat.com>
In-Reply-To: <20230411144916.1231886-1-aahringo@redhat.com>
References: <20230411144916.1231886-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Cluster-devel] [PATCH dlm-tool 3/4] dlm_controld: move pkg-config
 fail to bin target
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Currently make (GNU Make 4.2.1) will fail if pkg-config fails even if
it's not necessary, e.g. make clean target. We move the make bailout if
pkg-config failed to the binary target when pkg-config result is
necessary.

Note: this is using $(.SHELLSTATUS) which is only available on GNU Makefile
version 4.2 or above.
---
 dlm_controld/Makefile | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/dlm_controld/Makefile b/dlm_controld/Makefile
index 9cf7152f..44715982 100644
--- a/dlm_controld/Makefile
+++ b/dlm_controld/Makefile
@@ -54,20 +54,35 @@ BIN_LDFLAGS += -lpthread -lrt -lcpg -lcmap -lcfg -lquorum -luuid
 LIB_LDFLAGS += $(LDFLAGS) -Wl,-z,relro -Wl,-z,now -pie
 
 PKG_CONFIG ?= pkg-config
+PKG_CONFIG_FLAGS := --errors-to-stdout
+
 ifeq ($(USE_SD_NOTIFY),yes)
-	BIN_CFLAGS += $(shell $(PKG_CONFIG) --cflags libsystemd) \
+	SYSTEMD_CFLAGS := $(shell $(PKG_CONFIG) $(PKG_CONFIG_FLAGS) --cflags libsystemd) \
 		      -DUSE_SD_NOTIFY
-	BIN_LDFLAGS += $(shell $(PKG_CONFIG) --libs libsystemd)
+	SYSTEMD_CFLAGS_STATUS := $(.SHELLSTATUS)
+	SYSTEMD_LDFLAGS := $(shell $(PKG_CONFIG) $(PKG_CONFIG_FLAGS) --libs libsystemd)
+	SYSTEMD_LDFLAGS_STATUS := $(.SHELLSTATUS)
+else
+	SYSTEMD_CFLAGS_STATUS := 0
+	SYSTEMD_LDFLAGS_STATUS := 0
 endif
 
-ifeq (, $(shell $(PKG_CONFIG) --libs "libquorum >= 3.1.0"))
-	 $(error "Requires libquorum at least version 3.1.0")
-endif
+CPG_LDFLAGS := $(shell $(PKG_CONFIG) $(PKG_CONFIG_FLAGS) --libs "libquorum >= 3.1.0")
+CPG_LDFLAGS_STATUS := $(.SHELLSTATUS)
 
 all: $(LIB_TARGET) $(BIN_TARGET) $(LIB_PC)
 
 $(BIN_TARGET): $(BIN_SOURCE)
-	$(CC) $(BIN_SOURCE) $(BIN_CFLAGS) $(BIN_LDFLAGS) -o $@ -L.
+ifneq ($(CPG_LDFLAGS_STATUS),0)
+	$(error "Failed to call pkg-config for corosync ldflags: $(CPG_LDFLAGS)")
+endif
+ifneq ($(SYSTEMD_CFLAGS_STATUS),0)
+	$(error "Failed to call pkg-config for systemd cflags: $(SYSTEMD_CFLAGS)")
+endif
+ifneq ($(SYSTEMD_LDFLAGS_STATUS),0)
+	$(error "Failed to call pkg-config for systemd ldflags: $(SYSTEMD_LDFLAGS)")
+endif
+	$(CC) $(BIN_SOURCE) $(BIN_CFLAGS) $(SYSTEMD_CFLAGS) $(BIN_LDFLAGS) $(SYSTEMD_LDFLAGS) -o $@ -L.
 
 $(LIB_TARGET): $(LIB_SOURCE)
 	$(CC) $^ $(LIB_CFLAGS) $(LIB_LDFLAGS) -shared -o $@ -Wl,-soname=$(LIB_SMAJOR)
-- 
2.31.1

