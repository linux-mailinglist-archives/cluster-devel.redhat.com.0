Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B02C44AE31C
	for <lists+cluster-devel@lfdr.de>; Tue,  8 Feb 2022 22:46:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1644356776;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=am8ubBId0R2VW2lKdO6E4elqoOQLhviDUSlFrhS9boQ=;
	b=SXKVJOdbHZ+b5jJdHnoMaBSXJsCUlT4vOeFkiagKoAqvY7NbXD2oSR70kqvhOGHJBJr03W
	Lpy1yoBpbdGG2U2YdyRw/MpG6VyaaUQZu+iZ2Xjn6gC2gdeZDiVtUhzgDD8F7awldAO8ja
	hQZk9JezbQNLM4SWjI7c5Xin6Qn9bn0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-kqYb4tD8Pqae82MxVxXw2Q-1; Tue, 08 Feb 2022 16:46:13 -0500
X-MC-Unique: kqYb4tD8Pqae82MxVxXw2Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FA58100CCDE;
	Tue,  8 Feb 2022 21:46:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 73E645DB89;
	Tue,  8 Feb 2022 21:46:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 212844BB7C;
	Tue,  8 Feb 2022 21:46:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 218LcCJm006056 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 8 Feb 2022 16:38:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 298AA4CED9; Tue,  8 Feb 2022 21:38:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CFD7E56A84;
	Tue,  8 Feb 2022 21:38:11 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue,  8 Feb 2022 16:37:47 -0500
Message-Id: <20220208213749.997455-2-aahringo@redhat.com>
In-Reply-To: <20220208213749.997455-1-aahringo@redhat.com>
References: <20220208213749.997455-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm-tool 1/3] treewide: do always -Wl, -z,
	now in LDFLAGS
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch reverts commit 7bb5570a ("treewide: try to resolve symbols at
linking time") because the recommended why to avoid security related
issues is always to use -Wl,-z,now.

This is solving the following annocheck failure:

https://sourceware.org/annobin/annobin.html/Test-bind-now.html
---
 dlm_controld/Makefile | 6 +++---
 dlm_tool/Makefile     | 4 ++--
 fence/Makefile        | 4 ++--
 libdlm/Makefile       | 7 +++----
 4 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/dlm_controld/Makefile b/dlm_controld/Makefile
index 8cfc97e6..a92fdebe 100644
--- a/dlm_controld/Makefile
+++ b/dlm_controld/Makefile
@@ -43,15 +43,15 @@ CFLAGS += -D_GNU_SOURCE -O2 -ggdb \
 	-Wno-sign-compare -Wno-unused-parameter -Wp,-D_FORTIFY_SOURCE=2 \
 	-fexceptions -fasynchronous-unwind-tables -fdiagnostics-show-option \
 	-Wp,-D_GLIBCXX_ASSERTIONS -fstack-protector-strong \
-	-fstack-clash-protection -Wl,-z,now
+	-fstack-clash-protection
 
 BIN_CFLAGS += $(CFLAGS) -fPIE -DPIE
 BIN_CFLAGS += -I../include -I../libdlm
 LIB_CFLAGS += $(CFLAGS) -fPIC
 
-BIN_LDFLAGS += $(LDFLAGS) -Wl,-z,relro -Wl,-z,defs -pie
+BIN_LDFLAGS += $(LDFLAGS) -Wl,-z,relro -Wl,-z,now -pie
 BIN_LDFLAGS += -lpthread -lrt -lcpg -lcmap -lcfg -lquorum -luuid
-LIB_LDFLAGS += $(LDFLAGS) -Wl,-z,relro -Wl,-z,defs -pie
+LIB_LDFLAGS += $(LDFLAGS) -Wl,-z,relro -Wl,-z,now -pie
 
 PKG_CONFIG ?= pkg-config
 ifeq ($(USE_SD_NOTIFY),yes)
diff --git a/dlm_tool/Makefile b/dlm_tool/Makefile
index 7b42638c..1c3d61d5 100644
--- a/dlm_tool/Makefile
+++ b/dlm_tool/Makefile
@@ -15,12 +15,12 @@ CFLAGS += -D_GNU_SOURCE -O2 -ggdb \
 	-Wno-sign-compare -Wno-unused-parameter -Wp,-D_FORTIFY_SOURCE=2 \
 	-fexceptions -fasynchronous-unwind-tables -fdiagnostics-show-option \
 	-Wp,-D_GLIBCXX_ASSERTIONS -fstack-protector-strong \
-	-fstack-clash-protection -Wl,-z,now
+	-fstack-clash-protection
 
 CFLAGS += -fPIE -DPIE
 CFLAGS += -I../include -I../libdlm -I../dlm_controld
 
-LDFLAGS += -Wl,-z,relro -Wl,-z,defs -pie
+LDFLAGS += -Wl,-z,relro -Wl,-z,now -pie
 LDFLAGS += -L../libdlm -L../dlm_controld
 LDFLAGS += -lpthread -ldlm -ldlmcontrol
 
diff --git a/fence/Makefile b/fence/Makefile
index 547f7ba9..ee4dfb88 100644
--- a/fence/Makefile
+++ b/fence/Makefile
@@ -15,13 +15,13 @@ CFLAGS += -D_GNU_SOURCE -O2 -ggdb \
 	-Wno-sign-compare -Wno-unused-parameter -Wp,-D_FORTIFY_SOURCE=2 \
 	-fexceptions -fasynchronous-unwind-tables -fdiagnostics-show-option \
 	-Wp,-D_GLIBCXX_ASSERTIONS -fstack-protector-strong \
-	-fstack-clash-protection -Wl,-z,now
+	-fstack-clash-protection
 
 CFLAGS += -fPIE -DPIE
 CFLAGS += -I../include
 CFLAGS += $(shell pkg-config --cflags pacemaker-fencing)
 
-LDFLAGS += -Wl,-z,relro -Wl,-z,defs -pie
+LDFLAGS += -Wl,-z,relro -Wl,-z,now -pie
 LDFLAGS += -ldl
 
 all: $(BIN_TARGET)
diff --git a/libdlm/Makefile b/libdlm/Makefile
index 313c2a08..5069ccf1 100644
--- a/libdlm/Makefile
+++ b/libdlm/Makefile
@@ -78,14 +78,13 @@ CFLAGS += -D_GNU_SOURCE -O2 -ggdb \
 	-fexceptions \
 	-fasynchronous-unwind-tables \
 	-fdiagnostics-show-option \
-	-fPIC \
-	-Wl,-z,now
+	-fPIC
 
 LIB_CFLAGS += $(CFLAGS) -D_REENTRANT
 LLT_CFLAGS += $(CFLAGS)
 
-LIB_LDFLAGS += $(LDFLAGS) -lpthread -Wl,-z,defs
-LLT_LDFLAGS += $(LDFLAGS) -Wl,-z,defs
+LIB_LDFLAGS += $(LDFLAGS) -lpthread -Wl,-z,now
+LLT_LDFLAGS += $(LDFLAGS) -Wl,-z,now
 
 all: $(LIB_TARGET) $(LLT_TARGET) $(LIB_PC) $(LLT_PC)
 
-- 
2.31.1

