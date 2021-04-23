Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 06247369134
	for <lists+cluster-devel@lfdr.de>; Fri, 23 Apr 2021 13:38:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619177908;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vMHw/DNoYYAx52XZm1Sj4hn0pE609/S/QAgzdK6ZW0E=;
	b=PyIPUKZYblmYeBf2T+B5ElndaxxoiWJoRhJntS3/nnpvcArHFUxJm4erBsrqfQkv5/Brqy
	jC7dOyKqpdq53M2NP5wi5LyMLZEx6wsFRAYBTbchP2p1euYcslQ8Jc3VcnsKUs3N02WtV6
	F134O/kexlSEYlziJKsdhlBuVST+QIQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-Ia-T11GMNpGf_gHhEvDrUA-1; Fri, 23 Apr 2021 07:38:26 -0400
X-MC-Unique: Ia-T11GMNpGf_gHhEvDrUA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 347CD87A83E;
	Fri, 23 Apr 2021 11:38:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F2C625C1BB;
	Fri, 23 Apr 2021 11:38:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 72E6D1806D1A;
	Fri, 23 Apr 2021 11:38:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13NBXCP5009533 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 23 Apr 2021 07:33:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 25BDF1037E80; Fri, 23 Apr 2021 11:33:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.37.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 69D2C100763B
	for <cluster-devel@redhat.com>; Fri, 23 Apr 2021 11:33:08 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Fri, 23 Apr 2021 12:33:05 +0100
Message-Id: <20210423113305.722908-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] libgfs2: Add __force tags to endianness
	conversion macros
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

The __be* on-disk field types are annotated with __bitwise, which causes
sparse to recognise them as conflicting with non-__bitwise types, but
the endianness conversion macros don't have the required annotations to
tell sparse when to resolve the conflicts instead of flagging a warning.
Add __force annotations to the conversion macros.

This clears up a handful of sparse warnings but the anti-pattern of
storing cpu-endian values in the on-disk structs is still common (see
libgfs2/ondisk.c), so there are still some to be resolved.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/convert/gfs2_convert.c |  2 +-
 gfs2/include/linux/types.h  |  3 +++
 gfs2/libgfs2/libgfs2.h      | 49 ++++++++++++++++++-------------------
 3 files changed, 28 insertions(+), 26 deletions(-)

diff --git a/gfs2/convert/gfs2_convert.c b/gfs2/convert/gfs2_convert.c
index 5656b39d..ded2589e 100644
--- a/gfs2/convert/gfs2_convert.c
+++ b/gfs2/convert/gfs2_convert.c
@@ -1201,7 +1201,7 @@ static int process_dirent_info(struct gfs2_inode *dip, struct gfs2_sbd *sbp,
 		/* Only do this if the dent was a true gfs1 dent, and not a   */
 		/* gfs2 dent converted from a previously aborted run.         */
 		if (dent_was_gfs1) {
-			switch be16_to_cpu(dent->de_type) {
+			switch (be16_to_cpu(dent->de_type)) {
 			case GFS_FILE_NON:
 				dent->de_type = cpu_to_be16(DT_UNKNOWN);
 				break;
diff --git a/gfs2/include/linux/types.h b/gfs2/include/linux/types.h
index 7f4d4b98..a092afc0 100644
--- a/gfs2/include/linux/types.h
+++ b/gfs2/include/linux/types.h
@@ -7,10 +7,13 @@
 
 #ifdef __CHECKER__
 #define __bitwise__ __attribute__((bitwise))
+#define __force__ __attribute__((force))
 #else
 #define __bitwise__
+#define __force__
 #endif
 #define __bitwise __bitwise__
+#define __force __force__
 
 typedef uint8_t __u8;
 typedef uint16_t __u16;
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index d8afc100..3f36ffb2 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -21,42 +21,41 @@ __BEGIN_DECLS
 
 #if __BYTE_ORDER == __BIG_ENDIAN
 
-#define be16_to_cpu(x) (x)
-#define be32_to_cpu(x) (x)
-#define be64_to_cpu(x) (x)
+#define be16_to_cpu(x) ((__force uint16_t)(__be16)(x))
+#define be32_to_cpu(x) ((__force uint32_t)(__be32)(x))
+#define be64_to_cpu(x) ((__force uint64_t)(__be64)(x))
 
-#define cpu_to_be16(x) (x)
-#define cpu_to_be32(x) (x)
-#define cpu_to_be64(x) (x)
+#define cpu_to_be16(x) ((__force __be16)(uint16_t)(x))
+#define cpu_to_be32(x) ((__force __be32)(uint32_t)(x))
+#define cpu_to_be64(x) ((__force __be64)(uint64_t)(x))
 
-#define le16_to_cpu(x) (bswap_16((x)))
-#define le32_to_cpu(x) (bswap_32((x)))
-#define le64_to_cpu(x) (bswap_64((x)))
+#define le16_to_cpu(x) bswap_16((__force uint16_t)(__le16)(x))
+#define le32_to_cpu(x) bswap_32((__force uint32_t)(__le32)(x))
+#define le64_to_cpu(x) bswap_64((__force uint64_t)(__le64)(x))
 
-#define cpu_to_le16(x) (bswap_16((x)))
-#define cpu_to_le32(x) (bswap_32((x)))
-#define cpu_to_le64(x) (bswap_64((x)))
+#define cpu_to_le16(x) ((__force __le16)bswap_16((x)))
+#define cpu_to_le32(x) ((__force __le32)bswap_32((x)))
+#define cpu_to_le64(x) ((__force __le64)bswap_64((x)))
 
 #endif  /*  __BYTE_ORDER == __BIG_ENDIAN  */
 
-
 #if __BYTE_ORDER == __LITTLE_ENDIAN
 
-#define be16_to_cpu(x) (bswap_16((x)))
-#define be32_to_cpu(x) (bswap_32((x)))
-#define be64_to_cpu(x) (bswap_64((x)))
+#define be16_to_cpu(x) bswap_16((__force uint16_t)(__be16)(x))
+#define be32_to_cpu(x) bswap_32((__force uint32_t)(__be32)(x))
+#define be64_to_cpu(x) bswap_64((__force uint64_t)(__be64)(x))
 
-#define cpu_to_be16(x) (bswap_16((x)))
-#define cpu_to_be32(x) (bswap_32((x)))
-#define cpu_to_be64(x) (bswap_64((x))) 
+#define cpu_to_be16(x) ((__force __be16)bswap_16((x)))
+#define cpu_to_be32(x) ((__force __be32)bswap_32((x)))
+#define cpu_to_be64(x) ((__force __be64)bswap_64((x)))
 
-#define le16_to_cpu(x) (x)
-#define le32_to_cpu(x) (x)
-#define le64_to_cpu(x) (x)
+#define le16_to_cpu(x) ((__force uint16_t)(__le16)(x))
+#define le32_to_cpu(x) ((__force uint32_t)(__le32)(x))
+#define le64_to_cpu(x) ((__force uint64_t)(__le64)(x))
 
-#define cpu_to_le16(x) (x)
-#define cpu_to_le32(x) (x)
-#define cpu_to_le64(x) (x)
+#define cpu_to_le16(x) ((__force __le16)(uint16_t)(x))
+#define cpu_to_le32(x) ((__force __le32)(uint32_t)(x))
+#define cpu_to_le64(x) ((__force __le64)(uint64_t)(x))
 
 #endif  /*  __BYTE_ORDER == __LITTLE_ENDIAN  */
 
-- 
2.30.2

