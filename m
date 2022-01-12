Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC3B48CBED
	for <lists+cluster-devel@lfdr.de>; Wed, 12 Jan 2022 20:27:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642015659;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jghHahgfJfH1AFfovN/v5biK7/I+PporBCJFHeDlrZM=;
	b=b2BEUovZbDOVi6mmOLKUWCLXWiD9nJFhzQK9uAwTdVysqwPhWD3Uf1xSq9j3iwLSeZRnnp
	F+w+9+QpBkQ2eq5PYj2kSR7fECDZZf7GTvUM0vvQGNzXMS1APo1dJ/XzQ2II0Xg/7Bz+qp
	pELtrVp5JpnWyzeUDay4K9Tpve8HZ7Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-267-3vK-PG4DOc6h_2ykTZVkUQ-1; Wed, 12 Jan 2022 14:27:35 -0500
X-MC-Unique: 3vK-PG4DOc6h_2ykTZVkUQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D0EF101AFA7;
	Wed, 12 Jan 2022 19:27:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F2713100EBBE;
	Wed, 12 Jan 2022 19:27:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E01591806D2C;
	Wed, 12 Jan 2022 19:27:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20CJRVg5009412 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 12 Jan 2022 14:27:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6A7FC2B178; Wed, 12 Jan 2022 19:27:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.37.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B62B545D67
	for <cluster-devel@redhat.com>; Wed, 12 Jan 2022 19:27:30 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 12 Jan 2022 19:26:48 +0000
Message-Id: <20220112192650.1426415-17-anprice@redhat.com>
In-Reply-To: <20220112192650.1426415-1-anprice@redhat.com>
References: <20220112192650.1426415-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 16/18] libgfs2: Remove config.[ch]
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

The cfg_debug bits are no longer used.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/libgfs2/Makefile.am       | 2 --
 gfs2/libgfs2/checks.am         | 1 -
 gfs2/libgfs2/config.c          | 9 ---------
 gfs2/libgfs2/config.h          | 6 ------
 gfs2/libgfs2/device_geometry.c | 1 -
 gfs2/libgfs2/libgfs2.h         | 3 ---
 gfs2/libgfs2/structures.c      | 1 -
 gfs2/mkfs/main_jadd.c          | 1 -
 gfs2/mkfs/main_mkfs.c          | 1 -
 9 files changed, 25 deletions(-)
 delete mode 100644 gfs2/libgfs2/config.c
 delete mode 100644 gfs2/libgfs2/config.h

diff --git a/gfs2/libgfs2/Makefile.am b/gfs2/libgfs2/Makefile.am
index c3f2425d..123b85b7 100644
--- a/gfs2/libgfs2/Makefile.am
+++ b/gfs2/libgfs2/Makefile.am
@@ -23,7 +23,6 @@ noinst_HEADERS = \
 	libgfs2.h \
 	crc32c.h \
 	lang.h \
-	config.h \
 	rgrp.h
 
 noinst_LTLIBRARIES = libgfs2.la
@@ -40,7 +39,6 @@ libgfs2_la_SOURCES = \
 	buf.c \
 	gfs2_disk_hash.c \
 	ondisk.c \
-	config.c \
 	device_geometry.c \
 	fs_ops.c \
 	recovery.c \
diff --git a/gfs2/libgfs2/checks.am b/gfs2/libgfs2/checks.am
index 18d719ab..d1aa7189 100644
--- a/gfs2/libgfs2/checks.am
+++ b/gfs2/libgfs2/checks.am
@@ -12,7 +12,6 @@ check_libgfs2_SOURCES = \
 	device_geometry.c \
 	fs_ops.c \
 	structures.c \
-	config.c \
 	fs_bits.c \
 	gfs1.c \
 	misc.c \
diff --git a/gfs2/libgfs2/config.c b/gfs2/libgfs2/config.c
deleted file mode 100644
index d2431e43..00000000
--- a/gfs2/libgfs2/config.c
+++ /dev/null
@@ -1,9 +0,0 @@
-#include "libgfs2.h"
-#include "config.h"
-
-int cfg_debug = 0;
-
-void lgfs2_set_debug(int enable)
-{
-	cfg_debug = enable;
-}
diff --git a/gfs2/libgfs2/config.h b/gfs2/libgfs2/config.h
deleted file mode 100644
index 7c1eb3c3..00000000
--- a/gfs2/libgfs2/config.h
+++ /dev/null
@@ -1,6 +0,0 @@
-#ifndef __LGFS2_CONFIG_H__
-#define __LGFS2_CONFIG_H__
-
-extern int cfg_debug;
-
-#endif /* __LGFS2_CONFIG_H__ */
diff --git a/gfs2/libgfs2/device_geometry.c b/gfs2/libgfs2/device_geometry.c
index b149d2c0..cb1ed6d5 100644
--- a/gfs2/libgfs2/device_geometry.c
+++ b/gfs2/libgfs2/device_geometry.c
@@ -14,7 +14,6 @@
 #include <linux/fs.h>
 
 #include "libgfs2.h"
-#include "config.h"
 
 #ifndef BLKSSZGET
 #define BLKSSZGET _IO(0x12,104)   /* logical_block_size */
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index fa710a6c..20d8d57e 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -471,9 +471,6 @@ extern uint32_t lgfs2_get_block_type(const char *buf);
 #define bread(bl, num) __bread(bl, num, __LINE__, __FUNCTION__)
 #define breadm(bl, bhs, n, block) __breadm(bl, bhs, n, block, __LINE__, __FUNCTION__)
 
-/* config.c */
-extern void lgfs2_set_debug(int enable);
-
 /* device_geometry.c */
 extern int lgfs2_get_dev_info(int fd, struct lgfs2_dev_info *i);
 extern void fix_device_geometry(struct gfs2_sbd *sdp);
diff --git a/gfs2/libgfs2/structures.c b/gfs2/libgfs2/structures.c
index 9b78ed51..d7b7f4e1 100644
--- a/gfs2/libgfs2/structures.c
+++ b/gfs2/libgfs2/structures.c
@@ -14,7 +14,6 @@
 #include <uuid.h>
 
 #include "libgfs2.h"
-#include "config.h"
 #include "crc32c.h"
 
 int build_master(struct gfs2_sbd *sdp)
diff --git a/gfs2/mkfs/main_jadd.c b/gfs2/mkfs/main_jadd.c
index 2648b980..0a7f1f33 100644
--- a/gfs2/mkfs/main_jadd.c
+++ b/gfs2/mkfs/main_jadd.c
@@ -158,7 +158,6 @@ static int decode_arguments(int argc, char *argv[], struct gfs2_sbd *sdp, struct
 			break;
 		case 'D':
 			opts->debug = 1;
-			lgfs2_set_debug(1);
 			break;
 		case 'h':
 			print_usage(argv[0]);
diff --git a/gfs2/mkfs/main_mkfs.c b/gfs2/mkfs/main_mkfs.c
index ae192bd4..8f8d8f04 100644
--- a/gfs2/mkfs/main_mkfs.c
+++ b/gfs2/mkfs/main_mkfs.c
@@ -366,7 +366,6 @@ static int opts_get(int argc, char *argv[], struct mkfs_opts *opts)
 			break;
 		case 'D':
 			opts->debug = 1;
-			lgfs2_set_debug(1);
 			break;
 		case 'h':
 			print_usage(argv[0]);
-- 
2.34.1

