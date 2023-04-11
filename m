Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 780F76DDE77
	for <lists+cluster-devel@lfdr.de>; Tue, 11 Apr 2023 16:49:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681224571;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PyBTtkCoW1fQIHmEklEsks8JLdWwEiA/gnNnXGY9Eh0=;
	b=AYJUya5BM+Ma0rpp8ah1f11wvDYiB5QuoDhFh8y6Z2kllyi+ujlRxVmqGcuygUaXT0mgJG
	cYwtQn4HC30rbCPoVubUeU0zdm5y05RSha4hb43Wf6X1tHrADSmb5DqIMgLUQZcctEp3ji
	9zaWn48M8pWCzrR8X0ECKUc1lD0FUUk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-446-MStFcXPgM4Ka6OhLyOYrYg-1; Tue, 11 Apr 2023 10:49:27 -0400
X-MC-Unique: MStFcXPgM4Ka6OhLyOYrYg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E4CF2932485;
	Tue, 11 Apr 2023 14:49:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 978EC728FC;
	Tue, 11 Apr 2023 14:49:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D5EE21946A62;
	Tue, 11 Apr 2023 14:49:24 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 982981946586 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 11 Apr 2023 14:49:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8AEE04020C83; Tue, 11 Apr 2023 14:49:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 62B0A4020C80;
 Tue, 11 Apr 2023 14:49:23 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 11 Apr 2023 10:49:16 -0400
Message-Id: <20230411144916.1231886-4-aahringo@redhat.com>
In-Reply-To: <20230411144916.1231886-1-aahringo@redhat.com>
References: <20230411144916.1231886-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Cluster-devel] [PATCH dlm-tool 4/4] dlm_controld: use pkg-config
 to find corosync libs
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

Currently all corosync dependencies are hardcorded inside the
dlm_controld Makefile. We will determine those dependencies by
pkg-config. This allows us that dlm_controld can detect when the
corosync libaries are installed in a different place determined by
changing the PKG_CONFIG_PATH env variable.
---
 dlm_controld/Makefile | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/dlm_controld/Makefile b/dlm_controld/Makefile
index 44715982..2d97453a 100644
--- a/dlm_controld/Makefile
+++ b/dlm_controld/Makefile
@@ -50,7 +50,7 @@ BIN_CFLAGS += -I../include -I../libdlm
 LIB_CFLAGS += $(CFLAGS) -fPIC -fplugin=annobin
 
 BIN_LDFLAGS += $(LDFLAGS) -Wl,-z,relro -Wl,-z,now -pie
-BIN_LDFLAGS += -lpthread -lrt -lcpg -lcmap -lcfg -lquorum -luuid
+BIN_LDFLAGS += -lpthread -lrt -luuid
 LIB_LDFLAGS += $(LDFLAGS) -Wl,-z,relro -Wl,-z,now -pie
 
 PKG_CONFIG ?= pkg-config
@@ -67,12 +67,18 @@ else
 	SYSTEMD_LDFLAGS_STATUS := 0
 endif
 
-CPG_LDFLAGS := $(shell $(PKG_CONFIG) $(PKG_CONFIG_FLAGS) --libs "libquorum >= 3.1.0")
+CPG_CFLAGS := $(shell $(PKG_CONFIG) $(PKG_CONFIG_FLAGS) --cflags libcpg libcmap libcfg "libquorum >= 3.1.0")
+CPG_CFLAGS_STATUS := $(.SHELLSTATUS)
+
+CPG_LDFLAGS += $(shell $(PKG_CONFIG) $(PKG_CONFIG_FLAGS) --libs libcpg libcmap libcfg "libquorum >= 3.1.0")
 CPG_LDFLAGS_STATUS := $(.SHELLSTATUS)
 
 all: $(LIB_TARGET) $(BIN_TARGET) $(LIB_PC)
 
 $(BIN_TARGET): $(BIN_SOURCE)
+ifneq ($(CPG_CFLAGS_STATUS),0)
+	$(error "Failed to call pkg-config for corosync cflags: $(CPG_CFLAGS)")
+endif
 ifneq ($(CPG_LDFLAGS_STATUS),0)
 	$(error "Failed to call pkg-config for corosync ldflags: $(CPG_LDFLAGS)")
 endif
@@ -82,7 +88,7 @@ endif
 ifneq ($(SYSTEMD_LDFLAGS_STATUS),0)
 	$(error "Failed to call pkg-config for systemd ldflags: $(SYSTEMD_LDFLAGS)")
 endif
-	$(CC) $(BIN_SOURCE) $(BIN_CFLAGS) $(SYSTEMD_CFLAGS) $(BIN_LDFLAGS) $(SYSTEMD_LDFLAGS) -o $@ -L.
+	$(CC) $(BIN_SOURCE) $(BIN_CFLAGS) $(CPG_CFLAGS) $(SYSTEMD_CFLAGS) $(BIN_LDFLAGS) $(CPG_LDFLAGS) $(SYSTEMD_LDFLAGS) -o $@ -L.
 
 $(LIB_TARGET): $(LIB_SOURCE)
 	$(CC) $^ $(LIB_CFLAGS) $(LIB_LDFLAGS) -shared -o $@ -Wl,-soname=$(LIB_SMAJOR)
-- 
2.31.1

