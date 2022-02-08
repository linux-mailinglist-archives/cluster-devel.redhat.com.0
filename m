Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A524AE31E
	for <lists+cluster-devel@lfdr.de>; Tue,  8 Feb 2022 22:46:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1644356777;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oA5WgUcqoB4JTKqmK6boMBgXjiyhF+0IARm/gq2uuLU=;
	b=Hv1M5NDncfGTU1/z1nRNy82VZZYBPXd0VnFl6dgoxjIqVqdrkIyUYoJUHS4ryTnGdkL0Dr
	JfO3RWWHPU71NluHxfZQB6NC9HRWPd+KfzMeTyNQr3UC3SrHLBcfvQEXpkcN9EMI9R31qT
	Kr9284PgvnOac/snIZzpBuGPnQXip8Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-213-eDbBNjjTPj-e_N2ghN1VWg-1; Tue, 08 Feb 2022 16:46:13 -0500
X-MC-Unique: eDbBNjjTPj-e_N2ghN1VWg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44A1C1091DA7;
	Tue,  8 Feb 2022 21:46:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 346B945318;
	Tue,  8 Feb 2022 21:46:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1343918218BB;
	Tue,  8 Feb 2022 21:46:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 218LcDGo006085 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 8 Feb 2022 16:38:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0A62F4CEDC; Tue,  8 Feb 2022 21:38:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B0E6256A84;
	Tue,  8 Feb 2022 21:38:12 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue,  8 Feb 2022 16:37:49 -0500
Message-Id: <20220208213749.997455-4-aahringo@redhat.com>
In-Reply-To: <20220208213749.997455-1-aahringo@redhat.com>
References: <20220208213749.997455-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm-tool 3/3] treewide: add
	-fcf-protection=full to CFLAGS
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch adds fcf-protection=full to CFLAGS as annocheck gave a
warning about it and the recommended way to fix it is by adding this as
compiler flag.

https://sourceware.org/annobin/annobin.html/Test-cf-protection.html
---
 dlm_controld/Makefile | 2 +-
 dlm_tool/Makefile     | 2 +-
 fence/Makefile        | 2 +-
 libdlm/Makefile       | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/dlm_controld/Makefile b/dlm_controld/Makefile
index 9cf7152f..ec8c360c 100644
--- a/dlm_controld/Makefile
+++ b/dlm_controld/Makefile
@@ -43,7 +43,7 @@ CFLAGS += -D_GNU_SOURCE -O2 -ggdb \
 	-Wno-sign-compare -Wno-unused-parameter -Wp,-D_FORTIFY_SOURCE=2 \
 	-fexceptions -fasynchronous-unwind-tables -fdiagnostics-show-option \
 	-Wp,-D_GLIBCXX_ASSERTIONS -fstack-protector-strong \
-	-fstack-clash-protection
+	-fstack-clash-protection -fcf-protection=full
 
 BIN_CFLAGS += $(CFLAGS) -fPIE -DPIE
 BIN_CFLAGS += -I../include -I../libdlm
diff --git a/dlm_tool/Makefile b/dlm_tool/Makefile
index 1c3d61d5..57629c73 100644
--- a/dlm_tool/Makefile
+++ b/dlm_tool/Makefile
@@ -15,7 +15,7 @@ CFLAGS += -D_GNU_SOURCE -O2 -ggdb \
 	-Wno-sign-compare -Wno-unused-parameter -Wp,-D_FORTIFY_SOURCE=2 \
 	-fexceptions -fasynchronous-unwind-tables -fdiagnostics-show-option \
 	-Wp,-D_GLIBCXX_ASSERTIONS -fstack-protector-strong \
-	-fstack-clash-protection
+	-fstack-clash-protection -fcf-protection=full
 
 CFLAGS += -fPIE -DPIE
 CFLAGS += -I../include -I../libdlm -I../dlm_controld
diff --git a/fence/Makefile b/fence/Makefile
index ee4dfb88..446f4eaa 100644
--- a/fence/Makefile
+++ b/fence/Makefile
@@ -15,7 +15,7 @@ CFLAGS += -D_GNU_SOURCE -O2 -ggdb \
 	-Wno-sign-compare -Wno-unused-parameter -Wp,-D_FORTIFY_SOURCE=2 \
 	-fexceptions -fasynchronous-unwind-tables -fdiagnostics-show-option \
 	-Wp,-D_GLIBCXX_ASSERTIONS -fstack-protector-strong \
-	-fstack-clash-protection
+	-fstack-clash-protection -fcf-protection=full
 
 CFLAGS += -fPIE -DPIE
 CFLAGS += -I../include
diff --git a/libdlm/Makefile b/libdlm/Makefile
index 5069ccf1..823fdaa9 100644
--- a/libdlm/Makefile
+++ b/libdlm/Makefile
@@ -80,8 +80,8 @@ CFLAGS += -D_GNU_SOURCE -O2 -ggdb \
 	-fdiagnostics-show-option \
 	-fPIC
 
-LIB_CFLAGS += $(CFLAGS) -D_REENTRANT
-LLT_CFLAGS += $(CFLAGS)
+LIB_CFLAGS += $(CFLAGS) -D_REENTRANT -fcf-protection=full
+LLT_CFLAGS += $(CFLAGS) -fcf-protection=full
 
 LIB_LDFLAGS += $(LDFLAGS) -lpthread -Wl,-z,now
 LLT_LDFLAGS += $(LDFLAGS) -Wl,-z,now
-- 
2.31.1

