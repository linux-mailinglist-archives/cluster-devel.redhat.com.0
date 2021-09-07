Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id B45D3402CC7
	for <lists+cluster-devel@lfdr.de>; Tue,  7 Sep 2021 18:22:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631031733;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2X8iHtYLmGgAliGzGgFmbI7DRU7z5EXnmtU8WpkkIYA=;
	b=Ar0mR8yhJ+Vbljbe/gIwyiKuMmDxvCFWE4imzgx0hqa7XaVuOvRd5mgMCSVtNT7s+RME0z
	MKp9uu9KqvAXLKVjjPGfpAUQgGHwDv3q4c6KsvFqWZnc7Rjl6VM5oT/qXseoTSN1fWlC52
	n/9REN2LPRL4yLMP0SUUTKjEBxXzUig=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-t7ltyTkYNFKcPgI_eIVdyQ-1; Tue, 07 Sep 2021 12:22:12 -0400
X-MC-Unique: t7ltyTkYNFKcPgI_eIVdyQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5F9184A5E0;
	Tue,  7 Sep 2021 16:22:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED62A60C7F;
	Tue,  7 Sep 2021 16:22:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9528B1809C98;
	Tue,  7 Sep 2021 16:22:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 187GLxLY003922 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 7 Sep 2021 12:21:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5DFA41346F; Tue,  7 Sep 2021 16:21:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4C46360BD8;
	Tue,  7 Sep 2021 16:21:56 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue,  7 Sep 2021 12:21:48 -0400
Message-Id: <20210907162149.1442293-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/tool 1/2] treewide: try to resolve
	symbols at linking time
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch passes linker flags to the linker that all symbols should be
resolved at linking time. If this is not possible the linker will fail
to link.
---
 dlm_controld/Makefile | 4 ++--
 dlm_tool/Makefile     | 2 +-
 fence/Makefile        | 2 +-
 libdlm/Makefile       | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/dlm_controld/Makefile b/dlm_controld/Makefile
index fbc8926c..66799807 100644
--- a/dlm_controld/Makefile
+++ b/dlm_controld/Makefile
@@ -49,9 +49,9 @@ BIN_CFLAGS += $(CFLAGS) -fPIE -DPIE
 BIN_CFLAGS += -I../include -I../libdlm
 LIB_CFLAGS += $(CFLAGS) -fPIC
 
-BIN_LDFLAGS += $(LDFLAGS) -Wl,-z,relro -pie
+BIN_LDFLAGS += $(LDFLAGS) -Wl,-z,relro -Wl,-z,defs -pie
 BIN_LDFLAGS += -lpthread -lrt -lcpg -lcmap -lcfg -lquorum -luuid
-LIB_LDFLAGS += $(LDFLAGS) -Wl,-z,relro -pie
+LIB_LDFLAGS += $(LDFLAGS) -Wl,-z,relro -Wl,-z,defs -pie
 
 PKG_CONFIG ?= pkg-config
 ifeq ($(USE_SD_NOTIFY),yes)
diff --git a/dlm_tool/Makefile b/dlm_tool/Makefile
index 80d77257..7b42638c 100644
--- a/dlm_tool/Makefile
+++ b/dlm_tool/Makefile
@@ -20,7 +20,7 @@ CFLAGS += -D_GNU_SOURCE -O2 -ggdb \
 CFLAGS += -fPIE -DPIE
 CFLAGS += -I../include -I../libdlm -I../dlm_controld
 
-LDFLAGS += -Wl,-z,relro -pie
+LDFLAGS += -Wl,-z,relro -Wl,-z,defs -pie
 LDFLAGS += -L../libdlm -L../dlm_controld
 LDFLAGS += -lpthread -ldlm -ldlmcontrol
 
diff --git a/fence/Makefile b/fence/Makefile
index 1f6dd6b2..2b080468 100644
--- a/fence/Makefile
+++ b/fence/Makefile
@@ -22,7 +22,7 @@ CFLAGS += `xml2-config --cflags`
 CFLAGS += -I../include
 CFLAGS += $(shell pkg-config --cflags pacemaker-fencing)
 
-LDFLAGS += -Wl,-z,relro -pie
+LDFLAGS += -Wl,-z,relro -Wl,-z,defs -pie
 LDFLAGS += `xml2-config --libs`
 LDFLAGS += -ldl
 
diff --git a/libdlm/Makefile b/libdlm/Makefile
index ab327619..313c2a08 100644
--- a/libdlm/Makefile
+++ b/libdlm/Makefile
@@ -84,8 +84,8 @@ CFLAGS += -D_GNU_SOURCE -O2 -ggdb \
 LIB_CFLAGS += $(CFLAGS) -D_REENTRANT
 LLT_CFLAGS += $(CFLAGS)
 
-LIB_LDFLAGS += $(LDFLAGS) -lpthread
-LLT_LDFLAGS += $(LDFLAGS)
+LIB_LDFLAGS += $(LDFLAGS) -lpthread -Wl,-z,defs
+LLT_LDFLAGS += $(LDFLAGS) -Wl,-z,defs
 
 all: $(LIB_TARGET) $(LLT_TARGET) $(LIB_PC) $(LLT_PC)
 
-- 
2.27.0

