Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A434938CA
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Jan 2022 11:44:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642589082;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=u8S2l1EwReMYFsopVwsMXA1Z1kYeUhnTJVg5V8h9Tgc=;
	b=cNMndOEXz1omLFiSWj7A2Xnt7kfwaibOCVFwXjmal/EyEzeQdq/ENWFWLgT9M7YnJSxoOp
	tDzb6vJfHErPxB5YZDC3r/H8eYo7Lp9mq7HR6Oj17V87HuHkMh2p++7s4eVOXOhlwBtcur
	xFmb6mtFBPk8S9V/oNY9rybzlHp1ClE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-2fwCWDgqNvS_BQZ0Mccsrg-1; Wed, 19 Jan 2022 05:44:39 -0500
X-MC-Unique: 2fwCWDgqNvS_BQZ0Mccsrg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B01A9101F7B9;
	Wed, 19 Jan 2022 10:44:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 71E39105915C;
	Wed, 19 Jan 2022 10:44:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5AF244BB7C;
	Wed, 19 Jan 2022 10:44:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20JAiYLV024582 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Jan 2022 05:44:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 720B479455; Wed, 19 Jan 2022 10:44:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.37.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F2FF378B10
	for <cluster-devel@redhat.com>; Wed, 19 Jan 2022 10:44:33 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 19 Jan 2022 10:43:14 +0000
Message-Id: <20220119104316.2489995-20-anprice@redhat.com>
In-Reply-To: <20220119104316.2489995-1-anprice@redhat.com>
References: <20220119104316.2489995-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 19/21] libgfs2: Namespace improvements -
	struct gfs2_bitmap
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

Rename to struct lgfs2_bitmap.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/convert/gfs2_convert.c |  6 +++---
 gfs2/edit/hexedit.c         |  2 +-
 gfs2/fsck/pass5.c           |  2 +-
 gfs2/libgfs2/fs_bits.c      |  4 ++--
 gfs2/libgfs2/fs_ops.c       |  2 +-
 gfs2/libgfs2/libgfs2.h      |  4 ++--
 gfs2/libgfs2/rgrp.c         | 12 ++++++------
 gfs2/libgfs2/rgrp.h         |  2 +-
 gfs2/libgfs2/structures.c   |  2 +-
 9 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/gfs2/convert/gfs2_convert.c b/gfs2/convert/gfs2_convert.c
index f6c7d3a7..50df7f5f 100644
--- a/gfs2/convert/gfs2_convert.c
+++ b/gfs2/convert/gfs2_convert.c
@@ -126,7 +126,7 @@ static void convert_bitmaps(struct lgfs2_sbd *sdp, struct rgrp_tree *rg)
 	unsigned char state;
 
 	for (blk = 0; blk < rg->rt_length; blk++) {
-		struct gfs2_bitmap *bi;
+		struct lgfs2_bitmap *bi;
 		x = (blk) ? sizeof(struct gfs2_meta_header) :
 			sizeof(struct gfs2_rgrp);
 
@@ -951,7 +951,7 @@ err_freei:
 
 static int next_rg_meta(struct rgrp_tree *rgd, uint64_t *block, int first)
 {
-	struct gfs2_bitmap *bits = NULL;
+	struct lgfs2_bitmap *bits = NULL;
 	uint32_t length = rgd->rt_length;
 	uint32_t blk = (first)? 0: (uint32_t)((*block + 1) - rgd->rt_data0);
 	int i;
@@ -1070,7 +1070,7 @@ static int inode_renumber(struct lgfs2_sbd *sbp, uint64_t root_inode_addr, osi_l
 				byte_bit = (block - rgd->rt_data0) % GFS2_NBBY;
 				/* Now figure out which bitmap block the byte is on */
 				for (blk = 0; blk < rgd->rt_length; blk++) {
-					struct gfs2_bitmap *bi = &rgd->bits[blk];
+					struct lgfs2_bitmap *bi = &rgd->bits[blk];
 					/* figure out offset of first bitmap byte for this map: */
 					buf_offset = (blk) ? sizeof(struct gfs2_meta_header) :
 						sizeof(struct gfs2_rgrp);
diff --git a/gfs2/edit/hexedit.c b/gfs2/edit/hexedit.c
index 17ed5062..90140391 100644
--- a/gfs2/edit/hexedit.c
+++ b/gfs2/edit/hexedit.c
@@ -1610,7 +1610,7 @@ static void find_print_block_rg(int bitmap)
 		if (rgd) {
 			rgblock = rgd->rt_addr;
 			if (bitmap) {
-				struct gfs2_bitmap *bits = NULL;
+				struct lgfs2_bitmap *bits = NULL;
 
 				for (i = 0; i < rgd->rt_length; i++) {
 					bits = &(rgd->bits[i]);
diff --git a/gfs2/fsck/pass5.c b/gfs2/fsck/pass5.c
index 55ede8db..302ebaf2 100644
--- a/gfs2/fsck/pass5.c
+++ b/gfs2/fsck/pass5.c
@@ -117,7 +117,7 @@ static void update_rgrp(struct lgfs2_sbd *sdp, struct rgrp_tree *rgp,
 			struct gfs2_bmap *bl, uint32_t *count)
 {
 	uint32_t i;
-	struct gfs2_bitmap *bits;
+	struct lgfs2_bitmap *bits;
 	uint64_t rg_block = 0;
 	int update = 0;
 
diff --git a/gfs2/libgfs2/fs_bits.c b/gfs2/libgfs2/fs_bits.c
index b95732ef..a75c1aa5 100644
--- a/gfs2/libgfs2/fs_bits.c
+++ b/gfs2/libgfs2/fs_bits.c
@@ -127,7 +127,7 @@ int lgfs2_set_bitmap(lgfs2_rgrp_t rgd, uint64_t blkno, int state)
 {
 	int           buf;
 	uint32_t        rgrp_block;
-	struct gfs2_bitmap *bits = NULL;
+	struct lgfs2_bitmap *bits = NULL;
 	unsigned char *byte, cur_state;
 	unsigned int bit;
 
@@ -180,7 +180,7 @@ int lgfs2_get_bitmap(struct lgfs2_sbd *sdp, uint64_t blkno, struct rgrp_tree *rg
 	uint32_t i = 0;
 	char *byte;
 	unsigned int bit;
-	struct gfs2_bitmap *bi;
+	struct lgfs2_bitmap *bi;
 
 	if (rgd == NULL) {
 		rgd = lgfs2_blk2rgrpd(sdp, blkno);
diff --git a/gfs2/libgfs2/fs_ops.c b/gfs2/libgfs2/fs_ops.c
index 0f94c09b..9083b811 100644
--- a/gfs2/libgfs2/fs_ops.c
+++ b/gfs2/libgfs2/fs_ops.c
@@ -119,7 +119,7 @@ static uint64_t find_free_block(struct rgrp_tree *rgd)
 
 	for (bm = 0; bm < rgd->rt_length; bm++) {
 		unsigned long blk = 0;
-		struct gfs2_bitmap *bits = &rgd->bits[bm];
+		struct lgfs2_bitmap *bits = &rgd->bits[bm];
 
 		blk = lgfs2_bitfit((uint8_t *)bits->bi_data + bits->bi_offset,
 		                  bits->bi_len, blk, GFS2_BLKST_FREE);
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index 2fc831e4..1fc04926 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -160,7 +160,7 @@ struct lgfs2_device {
 	uint64_t length;
 };
 
-struct gfs2_bitmap
+struct lgfs2_bitmap
 {
 	char *bi_data;
 	uint32_t bi_offset;  /* The offset in the buffer of the first byte */
@@ -175,7 +175,7 @@ typedef struct _lgfs2_rgrps *lgfs2_rgrps_t;
 
 struct rgrp_tree {
 	struct osi_node node;
-	struct gfs2_bitmap *bits;
+	struct lgfs2_bitmap *bits;
 	lgfs2_rgrps_t rgrps;
 
 	/* Native-endian counterparts of the on-disk rindex struct */
diff --git a/gfs2/libgfs2/rgrp.c b/gfs2/libgfs2/rgrp.c
index 9ca92172..3ae490e8 100644
--- a/gfs2/libgfs2/rgrp.c
+++ b/gfs2/libgfs2/rgrp.c
@@ -52,7 +52,7 @@ int lgfs2_compute_bitstructs(const uint32_t bsize, struct rgrp_tree *rgd)
 		return -1;
 
 	if(rgd->bits == NULL) {
-		rgd->bits = calloc(length, sizeof(struct gfs2_bitmap));
+		rgd->bits = calloc(length, sizeof(struct lgfs2_bitmap));
 		if(rgd->bits == NULL)
 			return -1;
 		ownbits = 1;
@@ -635,11 +635,11 @@ lgfs2_rgrp_t lgfs2_rgrps_append(lgfs2_rgrps_t rgs, struct gfs2_rindex *entry, ui
 		link = &lastrg->node.osi_right;
 	}
 
-	rg = calloc(1, sizeof(*rg) + (be32_to_cpu(entry->ri_length) * sizeof(struct gfs2_bitmap)));
+	rg = calloc(1, sizeof(*rg) + (be32_to_cpu(entry->ri_length) * sizeof(struct lgfs2_bitmap)));
 	if (rg == NULL)
 		return NULL;
 
-	rg->bits = (struct gfs2_bitmap *)(rg + 1);
+	rg->bits = (struct lgfs2_bitmap *)(rg + 1);
 
 	osi_link_node(&rg->node, parent, link);
 	osi_insert_color(&rg->node, &rgs->root);
@@ -807,7 +807,7 @@ static int lgfs2_rbm_incr(struct lgfs2_rbm *rbm)
  */
 static inline uint8_t lgfs2_testbit(const struct lgfs2_rbm *rbm)
 {
-	struct gfs2_bitmap *bi = rbm_bi(rbm);
+	struct lgfs2_bitmap *bi = rbm_bi(rbm);
 	const uint8_t *buffer = (uint8_t *)bi->bi_data + bi->bi_offset;
 	const uint8_t *byte;
 	unsigned int bit;
@@ -879,7 +879,7 @@ static uint32_t lgfs2_free_extlen(const struct lgfs2_rbm *rrbm, uint32_t len)
 	uint32_t chunk_size;
 	uint8_t *ptr, *start, *end;
 	uint64_t block;
-	struct gfs2_bitmap *bi;
+	struct lgfs2_bitmap *bi;
 	struct lgfs2_sbd *sdp = rbm.rgd->rgrps->sdp;
 
 	if (n_unaligned &&
@@ -943,7 +943,7 @@ int lgfs2_rbm_find(struct lgfs2_rbm *rbm, uint8_t state, uint32_t *minext)
 		iters++;
 
 	for (n = 0; n < iters; n++) {
-		struct gfs2_bitmap *bi = rbm_bi(rbm);
+		struct lgfs2_bitmap *bi = rbm_bi(rbm);
 		uint8_t *buf = (uint8_t *)bi->bi_data + bi->bi_offset;
 		uint64_t block;
 		int ret;
diff --git a/gfs2/libgfs2/rgrp.h b/gfs2/libgfs2/rgrp.h
index 423eaefc..f23f25a3 100644
--- a/gfs2/libgfs2/rgrp.h
+++ b/gfs2/libgfs2/rgrp.h
@@ -34,7 +34,7 @@ struct lgfs2_rbm {
 	unsigned bii;       /* Bitmap index */
 };
 
-static inline struct gfs2_bitmap *rbm_bi(const struct lgfs2_rbm *rbm)
+static inline struct lgfs2_bitmap *rbm_bi(const struct lgfs2_rbm *rbm)
 {
 	return rbm->rgd->bits + rbm->bii;
 }
diff --git a/gfs2/libgfs2/structures.c b/gfs2/libgfs2/structures.c
index 011fe8ac..d67c1fc0 100644
--- a/gfs2/libgfs2/structures.c
+++ b/gfs2/libgfs2/structures.c
@@ -499,7 +499,7 @@ int lgfs2_check_meta(const char *buf, int type)
 
 unsigned lgfs2_bm_scan(struct rgrp_tree *rgd, unsigned idx, uint64_t *buf, uint8_t state)
 {
-	struct gfs2_bitmap *bi = &rgd->bits[idx];
+	struct lgfs2_bitmap *bi = &rgd->bits[idx];
 	unsigned n = 0;
 	uint32_t blk = 0;
 
-- 
2.34.1

