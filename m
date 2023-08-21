Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DF2782E63
	for <lists+cluster-devel@lfdr.de>; Mon, 21 Aug 2023 18:26:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692635170;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ePMNkGDJp3CTukJNWSHboor0nzdaFYmCYUO8dSH0x7E=;
	b=INlldYpQWNITF4QBg4Xgz0YKPE9RLO/c+55RDlmv0d3d7rbVyH7cOGk+NYAMacE6vTeraN
	fE0xWdr0FAzWhTG2KLLnbNtbC1GWAP1CN0DDysAI05clIsD4wWVInAAKMZ067mnJL9LVjV
	6f5irrZM/9tdsV7V1z42Fx7r3GHKklE=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-68-_bCxK9sUOri9ri-6BZGDZQ-1; Mon, 21 Aug 2023 12:26:07 -0400
X-MC-Unique: _bCxK9sUOri9ri-6BZGDZQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5C643C0F674;
	Mon, 21 Aug 2023 16:26:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AB6562026D2A;
	Mon, 21 Aug 2023 16:26:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6A104194658D;
	Mon, 21 Aug 2023 16:25:50 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D48E21946586 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 21 Aug 2023 16:25:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C107E492C1B; Mon, 21 Aug 2023 16:25:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C85A492C13;
 Mon, 21 Aug 2023 16:25:48 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 21 Aug 2023 12:25:39 -0400
Message-Id: <20230821162540.594227-2-aahringo@redhat.com>
In-Reply-To: <20230821162540.594227-1-aahringo@redhat.com>
References: <20230821162540.594227-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [Cluster-devel] [PATCH dlm-tool 2/3] dlm_controld: update
 container_of() implementation
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch updates the container_of() implementation taken from the
Linux kernel.

We need to turn off -Wpointer-arith as the new container_of()
implementation does void pointer artihmetic as shown by this example
warning:

linux_helpers.h:43:26: warning: pointer of type ‘void *’ used in
arithmetic [-Wpointer-arith]
---
 dlm_controld/Makefile        |  2 +-
 dlm_controld/linux_helpers.h | 36 ++++++++++++++++++++++++++++++++++++
 dlm_controld/list.h          | 12 +-----------
 dlm_controld/rbtree.h        |  2 +-
 4 files changed, 39 insertions(+), 13 deletions(-)

diff --git a/dlm_controld/Makefile b/dlm_controld/Makefile
index 28b6bb0a..328a64ba 100644
--- a/dlm_controld/Makefile
+++ b/dlm_controld/Makefile
@@ -38,7 +38,7 @@ LIB_SOURCE = lib.c
 
 CFLAGS += -D_GNU_SOURCE -O2 -ggdb \
 	-Wall -Wformat -Wformat-security -Wmissing-prototypes -Wnested-externs \
-	-Wpointer-arith -Wextra -Wshadow -Wcast-align -Wwrite-strings \
+	-Wextra -Wshadow -Wcast-align -Wwrite-strings \
 	-Waggregate-return -Wstrict-prototypes -Winline -Wredundant-decls \
 	-Wno-sign-compare -Wno-unused-parameter -Wp,-D_FORTIFY_SOURCE=2 \
 	-fexceptions -fasynchronous-unwind-tables -fdiagnostics-show-option \
diff --git a/dlm_controld/linux_helpers.h b/dlm_controld/linux_helpers.h
index 5ef13466..09705cff 100644
--- a/dlm_controld/linux_helpers.h
+++ b/dlm_controld/linux_helpers.h
@@ -3,6 +3,42 @@
 #ifndef __DLM_LINUX_HELPERS__
 #define __DLM_LINUX_HELPERS__
 
+/*
+ * static_assert - check integer constant expression at build time
+ *
+ * static_assert() is a wrapper for the C11 _Static_assert, with a
+ * little macro magic to make the message optional (defaulting to the
+ * stringification of the tested expression).
+ *
+ * Contrary to BUILD_BUG_ON(), static_assert() can be used at global
+ * scope, but requires the expression to be an integer constant
+ * expression (i.e., it is not enough that __builtin_constant_p() is
+ * true for expr).
+ *
+ * Also note that BUILD_BUG_ON() fails the build if the condition is
+ * true, while static_assert() fails the build if the expression is
+ * false.
+ */
+#define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
+#define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
+
+#define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
+
+/**
+ * container_of - cast a member of a structure out to the containing structure
+ * @ptr:	the pointer to the member.
+ * @type:	the type of the container struct this is embedded in.
+ * @member:	the name of the member within the struct.
+ *
+ * WARNING: any const qualifier of @ptr is lost.
+ */
+#define container_of(ptr, type, member) ({				\
+	void *__mptr = (void *)(ptr);					\
+	static_assert(__same_type(*(ptr), ((type *)0)->member) ||	\
+		      __same_type(*(ptr), void),			\
+		      "pointer type mismatch in container_of()");	\
+	((type *)(__mptr - offsetof(type, member))); })
+
 #define WRITE_ONCE(x, val)				\
 do {							\
 	*(volatile typeof(x) *)&(x) = (val);		\
diff --git a/dlm_controld/list.h b/dlm_controld/list.h
index a2a5e5f3..e9df2ef2 100644
--- a/dlm_controld/list.h
+++ b/dlm_controld/list.h
@@ -3,17 +3,7 @@
 #ifndef _LINUX_LIST_H
 #define _LINUX_LIST_H
 
-/**
- * container_of - cast a member of a structure out to the containing structure
- *
- * @ptr:        the pointer to the member.
- * @type:       the type of the container struct this is embedded in.
- * @member:     the name of the member within the struct.
- *
- */
-#define container_of(ptr, type, member) ({                      \
-	const typeof( ((type *)0)->member ) *__mptr = (ptr);    \
-	(type *)( (char *)__mptr - offsetof(type,member) );})
+#include "linux_helpers.h"
 
 /*
  * These are non-NULL pointers that will result in page faults
diff --git a/dlm_controld/rbtree.h b/dlm_controld/rbtree.h
index ddb86ff6..48b6e32f 100644
--- a/dlm_controld/rbtree.h
+++ b/dlm_controld/rbtree.h
@@ -20,7 +20,7 @@
 #include <stdbool.h>
 #include <string.h>
 
-#include "list.h"
+#include "linux_helpers.h"
 #include "rbtree_types.h"
 
 #define rb_parent(r)   ((struct rb_node *)((r)->__rb_parent_color & ~3))
-- 
2.31.1

