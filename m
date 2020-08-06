Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id CE5F023DAE7
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Aug 2020 15:39:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596721139;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dH2Cxo7WSAbQmU8eWcRPxtPg4dA1NSUTbkziChA5hrw=;
	b=BC05/7HdLk7ESuasM55tEuwwPsNHBAO/hDITX882C0A9Vs2lMxbsMKZzr6Jx09blUV9dVb
	nu9XZKMiNqy5HRSeYkkQXTVg6jGZXvmX85+5SdeikzlNWuIZDVcGvsZ6CwcFBbpXhUyorJ
	ATjzOwTy3DiLbc0FB2Ay2K7lv63TjK0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-JypmQbN4NO6AU5OQl4l6vQ-1; Thu, 06 Aug 2020 09:38:56 -0400
X-MC-Unique: JypmQbN4NO6AU5OQl4l6vQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A608A79EC4;
	Thu,  6 Aug 2020 13:38:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9532387A56;
	Thu,  6 Aug 2020 13:38:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8197996939;
	Thu,  6 Aug 2020 13:38:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 076DcrjP030976 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 6 Aug 2020 09:38:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 73AB660BF1; Thu,  6 Aug 2020 13:38:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 93BCD70110
	for <cluster-devel@redhat.com>; Thu,  6 Aug 2020 13:38:52 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  6 Aug 2020 14:38:00 +0100
Message-Id: <20200806133807.111280-26-anprice@redhat.com>
In-Reply-To: <20200806133807.111280-1-anprice@redhat.com>
References: <20200806133807.111280-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 25/32] savemeta: Introduce multi-block reads
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

When there are contiguous ranges of inode blocks that we can read
together, read them in one chunk. They still need to be processed
individually as they might have different characteristics but this will
allow us to do larger reads where possible. The new check_read_range() and
save_range() functions are intended to be generic so that we can use
them to read indirect blocks etc. in larger chunks later.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/savemeta.c | 132 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 99 insertions(+), 33 deletions(-)

diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index 0de7dbf9..50d93b0b 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -328,8 +328,8 @@ static size_t di_save_len(const char *buf, uint64_t owner)
  * returns: 0 if successful
  *          -1 if this isn't gfs metadata.
  */
-static int get_gfs_struct_info(const char *buf, uint64_t owner, int *block_type,
-                               size_t *gstruct_len)
+static int get_gfs_struct_info(const char *buf, uint64_t owner, unsigned *block_type,
+                               unsigned *gstruct_len)
 {
 	struct gfs2_meta_header mh;
 
@@ -559,30 +559,79 @@ static int save_buf(struct metafd *mfd, const char *buf, uint64_t addr, unsigned
 	return 0;
 }
 
-static char *check_read_block(int fd, uint64_t blk, uint64_t owner, int *blktype, size_t *blklen)
+struct block_range {
+	uint64_t start;
+	unsigned len;
+	unsigned *blktype;
+	unsigned *blklen;
+	char *buf;
+};
+
+static int save_range(struct metafd *mfd, struct block_range *br)
 {
-	char *buf = calloc(1, sbd.bsize);
-	if (buf == NULL) {
-		perror("Failed to read block");
-		return NULL;
+	for (unsigned i = 0; i < br->len; i++) {
+		int err;
+
+		err = save_buf(mfd, br->buf + (i * sbd.bsize), br->start + i, br->blklen[i]);
+		if (err != 0)
+			return err;
 	}
-	if (gfs2_check_range(&sbd, blk) && blk != LGFS2_SB_ADDR(&sbd)) {
-		fprintf(stderr, "Warning: bad pointer 0x%"PRIx64" ignored.\n", blk);
-		free(buf);
-		return NULL;
+	return 0;
+}
+
+static int check_read_range(int fd, struct block_range *br, uint64_t owner)
+{
+	size_t size;
+
+	br->buf = calloc(br->len, sbd.bsize + sizeof(*br->blktype) + sizeof(*br->blklen));
+	if (br->buf == NULL) {
+		perror("Failed to read range");
+		return 1;
 	}
-	if (pread(sbd.device_fd, buf, sbd.bsize, sbd.bsize * blk) != sbd.bsize) {
-		fprintf(stderr, "Failed to read block 0x%"PRIx64": %s\n",
-		        blk, strerror(errno));
-		free(buf);
-		return NULL;
+	br->blktype = (unsigned *)(br->buf + (br->len * sbd.bsize));
+	br->blklen = br->blktype + br->len;
+	if (br->start < LGFS2_SB_ADDR(&sbd) || br->start + br->len > sbd.fssize) {
+		fprintf(stderr, "Warning: bad range 0x%"PRIx64" (%u blocks) ignored.\n",
+		        br->start, br->len);
+		free(br->buf);
+		br->buf = NULL;
+		return 1;
 	}
-	if (get_gfs_struct_info(buf, owner, blktype, blklen) &&
-	    !block_is_systemfile(owner) && owner != 0) {
-		free(buf);
-		return NULL;
+	size = br->len * sbd.bsize;
+	if (pread(sbd.device_fd, br->buf, size, sbd.bsize * br->start) != size) {
+		fprintf(stderr, "Failed to read block range 0x%"PRIx64" (%u blocks): %s\n",
+		        br->start, br->len, strerror(errno));
+		free(br->buf);
+		br->buf = NULL;
+		return 1;
 	}
-	return buf;
+	for (unsigned i = 0; i < br->len; i++) {
+		char *buf = br->buf + (i * sbd.bsize);
+		uint64_t addr = br->start + i;
+		uint64_t _owner = (owner == 0) ? addr : owner;
+
+		if (get_gfs_struct_info(buf, _owner, br->blktype + i, br->blklen + i) &&
+		    !block_is_systemfile(_owner)) {
+			br->blklen[i] = 0;
+		}
+	}
+	return 0;
+}
+
+static char *check_read_block(int fd, uint64_t blk, uint64_t owner, int *blktype, size_t *blklen)
+{
+	struct block_range br = {
+		.start = blk,
+		.len = 1
+	};
+
+	if (check_read_range(fd, &br, owner) != 0)
+		return NULL;
+	if (blklen != NULL)
+		*blklen = *br.blklen;
+	if (blktype != NULL)
+		*blktype = *br.blktype;
+	return br.buf;
 }
 
 /*
@@ -872,6 +921,19 @@ static void get_journal_inode_blocks(void)
 	}
 }
 
+static void save_allocated_range(struct metafd *mfd, struct block_range *br)
+{
+	if (check_read_range(sbd.device_fd, br, 0) != 0)
+		return;
+
+	save_range(mfd, br);
+	for (unsigned i = 0; i < br->len; i++) {
+		if (br->blktype[i] == GFS2_METATYPE_DI)
+			save_inode_data(mfd, br->start + i);
+	}
+	free(br->buf);
+}
+
 static void save_allocated(struct rgrp_tree *rgd, struct metafd *mfd)
 {
 	uint64_t blk = 0;
@@ -879,24 +941,27 @@ static void save_allocated(struct rgrp_tree *rgd, struct metafd *mfd)
 	uint64_t *ibuf = malloc(sbd.bsize * GFS2_NBBY * sizeof(uint64_t));
 
 	for (i = 0; i < rgd->ri.ri_length; i++) {
-		size_t blen;
-		int btype;
+		struct block_range br = {0};
 
 		m = lgfs2_bm_scan(rgd, i, ibuf, GFS2_BLKST_DINODE);
 
 		for (j = 0; j < m; j++) {
-			char *buf;
-
 			blk = ibuf[j];
-			warm_fuzzy_stuff(blk, FALSE);
-			buf = check_read_block(sbd.device_fd, blk, blk, &btype, &blen);
-			if (buf != NULL) {
-				save_buf(mfd, buf, blk, blen);
-				free(buf);
-				if (btype == GFS2_METATYPE_DI)
-					save_inode_data(mfd, blk);
+			if (br.start == 0) {
+				br.start = blk;
+				br.len = 1;
+			} else if (blk == br.start + br.len) {
+				br.len++;
+			} else {
+				save_allocated_range(mfd, &br);
+				br.start = blk;
+				br.len = 1;
 			}
+			warm_fuzzy_stuff(blk, FALSE);
 		}
+		if (br.start != 0)
+			save_allocated_range(mfd, &br);
+
 		if (!sbd.gfs1)
 			continue;
 
@@ -904,7 +969,8 @@ static void save_allocated(struct rgrp_tree *rgd, struct metafd *mfd)
 		 * If we don't, we may run into metadata allocation issues. */
 		m = lgfs2_bm_scan(rgd, i, ibuf, GFS2_BLKST_UNLINKED);
 		for (j = 0; j < m; j++) {
-			char *buf = check_read_block(sbd.device_fd, blk, blk, &btype, &blen);
+			size_t blen;
+			char *buf = check_read_block(sbd.device_fd, blk, blk, NULL, &blen);
 			if (buf != NULL) {
 				save_buf(mfd, buf, blk, blen);
 				free(buf);
-- 
2.26.2

