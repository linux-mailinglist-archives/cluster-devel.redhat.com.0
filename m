Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3AC9A3B7009
	for <lists+cluster-devel@lfdr.de>; Tue, 29 Jun 2021 11:21:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624958490;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dFC+cXWoEwMhZDjDaIwHytruJuayrL7hig5C03V6EAo=;
	b=VK2j90FuhowFwPUzIwzXYcxlkMdnBQazHEm3mwHGPzpqYQVWZFZyx9GevBDJdEfruc0xtl
	JBHVrds9DF7LRqnkmoHzdDC2BhGbtcyP7nFhTTQJZ251U11+5EGZn8XV0QoyGgZ09gRmKU
	T78maBlcXZ4KzYkawm+bL6yYI/HsH4o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-uGByrzOaO-yGW1abRTJTow-1; Tue, 29 Jun 2021 05:21:28 -0400
X-MC-Unique: uGByrzOaO-yGW1abRTJTow-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98DBF100C666;
	Tue, 29 Jun 2021 09:21:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8016C5D6AD;
	Tue, 29 Jun 2021 09:21:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 447474EA29;
	Tue, 29 Jun 2021 09:21:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15T9L7e7027401 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 29 Jun 2021 05:21:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2F69860877; Tue, 29 Jun 2021 09:21:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.36.223])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C5FD60854
	for <cluster-devel@redhat.com>; Tue, 29 Jun 2021 09:21:02 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Tue, 29 Jun 2021 10:21:00 +0100
Message-Id: <20210629092100.325713-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2-utils: Include asm/types.h in our
	linux/types.h
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Include asm/types.h to provide __u* and __s*, and __vector128 which
fixes build failures on ppc64le and s390x:

  In file included from /usr/include/asm/sigcontext.h:14,
                   from /usr/include/bits/sigcontext.h:30,
                   from /usr/include/signal.h:291,
                   from hexedit.c:16:
  /usr/include/asm/elf.h:160:9: error: unknown type name ‘__vector128’
   typedef __vector128 elf_vrreg_t;

asm/types.h is included in the original linux/types.h so this reduces
the difference (at the expense of portability).

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/include/linux/types.h | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/gfs2/include/linux/types.h b/gfs2/include/linux/types.h
index a092afc0..46ef54ba 100644
--- a/gfs2/include/linux/types.h
+++ b/gfs2/include/linux/types.h
@@ -1,6 +1,8 @@
 #ifndef LINUX_TYPES_H
 #define LINUX_TYPES_H
 
+#include <asm/types.h>
+
 /* Satisfy gfs2_ondisk.h with userspace definitions of kernel types */
 
 #include <stdint.h>
@@ -15,21 +17,11 @@
 #define __bitwise __bitwise__
 #define __force __force__
 
-typedef uint8_t __u8;
-typedef uint16_t __u16;
-typedef uint32_t __u32;
-typedef uint64_t __u64;
-
-typedef int8_t __s8;
-typedef int16_t __s16;
-typedef int32_t __s32;
-typedef int64_t __s64;
-
-typedef __u16 __bitwise __le16;
-typedef __u16 __bitwise __be16;
-typedef __u32 __bitwise __le32;
-typedef __u32 __bitwise __be32;
-typedef __u64 __bitwise __le64;
-typedef __u64 __bitwise __be64;
+typedef uint16_t __bitwise __le16;
+typedef uint16_t __bitwise __be16;
+typedef uint32_t __bitwise __le32;
+typedef uint32_t __bitwise __be32;
+typedef uint64_t __bitwise __le64;
+typedef uint64_t __bitwise __be64;
 
 #endif /* LINUX_TYPES_H */
-- 
2.31.1

