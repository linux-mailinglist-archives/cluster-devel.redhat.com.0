Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id BC0C23511C8
	for <lists+cluster-devel@lfdr.de>; Thu,  1 Apr 2021 11:18:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617268738;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hwn88m1MTzLQbrbIKsN8vALD1GEqTzwaNDI7LyQ1CPA=;
	b=ah2Un7NvRhQhwYYcJLTDrNlUmwveX6HCDyrCz/wcZ50EWRAYdBCi8fJpYs02vX5vFXB4WE
	bmpIY1bSWFzbomSk9jXbVA7syFhb/gDCjq9F7dvLQ/YycAxFpfg1k3q3EpRmD6Z4jvB4Ca
	HxWR7n/d3pWTToqJEK+ElunTgw2dvyg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-3sVl0GLNPleZDX9ePRIIGQ-1; Thu, 01 Apr 2021 05:18:57 -0400
X-MC-Unique: 3sVl0GLNPleZDX9ePRIIGQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15D78835BD9;
	Thu,  1 Apr 2021 09:18:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8189F73A63;
	Thu,  1 Apr 2021 09:18:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DCBF04A7C8;
	Thu,  1 Apr 2021 09:18:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1319Iks9028058 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 1 Apr 2021 05:18:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 39DAD6F13B; Thu,  1 Apr 2021 09:18:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.194.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 414C860CCD;
	Thu,  1 Apr 2021 09:18:45 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  1 Apr 2021 11:18:36 +0200
Message-Id: <20210401091839.2251916-2-agruenba@redhat.com>
In-Reply-To: <20210401091839.2251916-1-agruenba@redhat.com>
References: <20210401091839.2251916-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 1/4] gfs2: Add new gfs2_iomap_get helper
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

Rename the current gfs2_iomap_get and gfs2_iomap_alloc functions to __*.
Add a new gfs2_iomap_get helper that doesn't expose struct metapath.
Rename gfs2_iomap_get_alloc to gfs2_iomap_alloc.  Use the new helpers
where they make sense.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/bmap.c | 65 +++++++++++++++++++++++++++-----------------------
 fs/gfs2/bmap.h |  6 +++--
 fs/gfs2/file.c |  5 ++--
 3 files changed, 41 insertions(+), 35 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 7a358ae05185..cc12dc0d6955 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -632,7 +632,7 @@ enum alloc_state {
 };
 
 /**
- * gfs2_iomap_alloc - Build a metadata tree of the requested height
+ * __gfs2_iomap_alloc - Build a metadata tree of the requested height
  * @inode: The GFS2 inode
  * @iomap: The iomap structure
  * @mp: The metapath, with proper height information calculated
@@ -642,7 +642,7 @@ enum alloc_state {
  *  ii) Indirect blocks to fill in lower part of the metadata tree
  * iii) Data blocks
  *
- * This function is called after gfs2_iomap_get, which works out the
+ * This function is called after __gfs2_iomap_get, which works out the
  * total number of blocks which we need via gfs2_alloc_size.
  *
  * We then do the actual allocation asking for an extent at a time (if
@@ -660,8 +660,8 @@ enum alloc_state {
  * Returns: errno on error
  */
 
-static int gfs2_iomap_alloc(struct inode *inode, struct iomap *iomap,
-			    struct metapath *mp)
+static int __gfs2_iomap_alloc(struct inode *inode, struct iomap *iomap,
+			      struct metapath *mp)
 {
 	struct gfs2_inode *ip = GFS2_I(inode);
 	struct gfs2_sbd *sdp = GFS2_SB(inode);
@@ -802,10 +802,10 @@ static u64 gfs2_alloc_size(struct inode *inode, struct metapath *mp, u64 size)
 
 	/*
 	 * For writes to stuffed files, this function is called twice via
-	 * gfs2_iomap_get, before and after unstuffing. The size we return the
+	 * __gfs2_iomap_get, before and after unstuffing. The size we return the
 	 * first time needs to be large enough to get the reservation and
 	 * allocation sizes right.  The size we return the second time must
-	 * be exact or else gfs2_iomap_alloc won't do the right thing.
+	 * be exact or else __gfs2_iomap_alloc won't do the right thing.
 	 */
 
 	if (gfs2_is_stuffed(ip) || mp->mp_fheight != mp->mp_aheight) {
@@ -829,7 +829,7 @@ static u64 gfs2_alloc_size(struct inode *inode, struct metapath *mp, u64 size)
 }
 
 /**
- * gfs2_iomap_get - Map blocks from an inode to disk blocks
+ * __gfs2_iomap_get - Map blocks from an inode to disk blocks
  * @inode: The inode
  * @pos: Starting position in bytes
  * @length: Length to map, in bytes
@@ -839,9 +839,9 @@ static u64 gfs2_alloc_size(struct inode *inode, struct metapath *mp, u64 size)
  *
  * Returns: errno
  */
-static int gfs2_iomap_get(struct inode *inode, loff_t pos, loff_t length,
-			  unsigned flags, struct iomap *iomap,
-			  struct metapath *mp)
+static int __gfs2_iomap_get(struct inode *inode, loff_t pos, loff_t length,
+			    unsigned flags, struct iomap *iomap,
+			    struct metapath *mp)
 {
 	struct gfs2_inode *ip = GFS2_I(inode);
 	struct gfs2_sbd *sdp = GFS2_SB(inode);
@@ -975,12 +975,10 @@ static int gfs2_iomap_get(struct inode *inode, loff_t pos, loff_t length,
 int gfs2_lblk_to_dblk(struct inode *inode, u32 lblock, u64 *dblock)
 {
 	struct iomap iomap = { };
-	struct metapath mp = { .mp_aheight = 1, };
 	loff_t pos = (loff_t)lblock << inode->i_blkbits;
 	int ret;
 
-	ret = gfs2_iomap_get(inode, pos, i_blocksize(inode), 0, &iomap, &mp);
-	release_metapath(&mp);
+	ret = gfs2_iomap_get(inode, pos, i_blocksize(inode), &iomap);
 	if (ret == 0)
 		*dblock = iomap.addr >> inode->i_blkbits;
 
@@ -1109,14 +1107,14 @@ static int gfs2_iomap_begin_write(struct inode *inode, loff_t pos,
 			if (ret)
 				goto out_trans_end;
 			release_metapath(mp);
-			ret = gfs2_iomap_get(inode, iomap->offset,
-					     iomap->length, flags, iomap, mp);
+			ret = __gfs2_iomap_get(inode, iomap->offset,
+					       iomap->length, flags, iomap, mp);
 			if (ret)
 				goto out_trans_end;
 		}
 
 		if (iomap->type == IOMAP_HOLE) {
-			ret = gfs2_iomap_alloc(inode, iomap, mp);
+			ret = __gfs2_iomap_alloc(inode, iomap, mp);
 			if (ret) {
 				gfs2_trans_end(sdp);
 				gfs2_inplace_release(ip);
@@ -1168,7 +1166,7 @@ static int gfs2_iomap_begin(struct inode *inode, loff_t pos, loff_t length,
 			goto out;
 	}
 
-	ret = gfs2_iomap_get(inode, pos, length, flags, iomap, &mp);
+	ret = __gfs2_iomap_get(inode, pos, length, flags, iomap, &mp);
 	if (ret)
 		goto out_unlock;
 
@@ -1290,9 +1288,7 @@ int gfs2_block_map(struct inode *inode, sector_t lblock,
 	struct gfs2_inode *ip = GFS2_I(inode);
 	loff_t pos = (loff_t)lblock << inode->i_blkbits;
 	loff_t length = bh_map->b_size;
-	struct metapath mp = { .mp_aheight = 1, };
 	struct iomap iomap = { };
-	int flags = create ? IOMAP_WRITE : 0;
 	int ret;
 
 	clear_buffer_mapped(bh_map);
@@ -1300,10 +1296,10 @@ int gfs2_block_map(struct inode *inode, sector_t lblock,
 	clear_buffer_boundary(bh_map);
 	trace_gfs2_bmap(ip, bh_map, lblock, create, 1);
 
-	ret = gfs2_iomap_get(inode, pos, length, flags, &iomap, &mp);
-	if (create && !ret && iomap.type == IOMAP_HOLE)
-		ret = gfs2_iomap_alloc(inode, &iomap, &mp);
-	release_metapath(&mp);
+	if (!create)
+		ret = gfs2_iomap_get(inode, pos, length, &iomap);
+	else
+		ret = gfs2_iomap_alloc(inode, pos, length, &iomap);
 	if (ret)
 		goto out;
 
@@ -1461,15 +1457,26 @@ static int trunc_start(struct inode *inode, u64 newsize)
 	return error;
 }
 
-int gfs2_iomap_get_alloc(struct inode *inode, loff_t pos, loff_t length,
-			 struct iomap *iomap)
+int gfs2_iomap_get(struct inode *inode, loff_t pos, loff_t length,
+		   struct iomap *iomap)
+{
+	struct metapath mp = { .mp_aheight = 1, };
+	int ret;
+
+	ret = __gfs2_iomap_get(inode, pos, length, 0, iomap, &mp);
+	release_metapath(&mp);
+	return ret;
+}
+
+int gfs2_iomap_alloc(struct inode *inode, loff_t pos, loff_t length,
+		     struct iomap *iomap)
 {
 	struct metapath mp = { .mp_aheight = 1, };
 	int ret;
 
-	ret = gfs2_iomap_get(inode, pos, length, IOMAP_WRITE, iomap, &mp);
+	ret = __gfs2_iomap_get(inode, pos, length, IOMAP_WRITE, iomap, &mp);
 	if (!ret && iomap->type == IOMAP_HOLE)
-		ret = gfs2_iomap_alloc(inode, iomap, &mp);
+		ret = __gfs2_iomap_alloc(inode, iomap, &mp);
 	release_metapath(&mp);
 	return ret;
 }
@@ -2519,7 +2526,6 @@ int __gfs2_punch_hole(struct file *file, loff_t offset, loff_t length)
 static int gfs2_map_blocks(struct iomap_writepage_ctx *wpc, struct inode *inode,
 		loff_t offset)
 {
-	struct metapath mp = { .mp_aheight = 1, };
 	int ret;
 
 	if (WARN_ON_ONCE(gfs2_is_stuffed(GFS2_I(inode))))
@@ -2530,8 +2536,7 @@ static int gfs2_map_blocks(struct iomap_writepage_ctx *wpc, struct inode *inode,
 		return 0;
 
 	memset(&wpc->iomap, 0, sizeof(wpc->iomap));
-	ret = gfs2_iomap_get(inode, offset, INT_MAX, 0, &wpc->iomap, &mp);
-	release_metapath(&mp);
+	ret = gfs2_iomap_get(inode, offset, INT_MAX, &wpc->iomap);
 	return ret;
 }
 
diff --git a/fs/gfs2/bmap.h b/fs/gfs2/bmap.h
index aed4632d47d3..c63efee8aaa4 100644
--- a/fs/gfs2/bmap.h
+++ b/fs/gfs2/bmap.h
@@ -49,8 +49,10 @@ extern const struct iomap_writeback_ops gfs2_writeback_ops;
 extern int gfs2_unstuff_dinode(struct gfs2_inode *ip, struct page *page);
 extern int gfs2_block_map(struct inode *inode, sector_t lblock,
 			  struct buffer_head *bh, int create);
-extern int gfs2_iomap_get_alloc(struct inode *inode, loff_t pos, loff_t length,
-				struct iomap *iomap);
+extern int gfs2_iomap_get(struct inode *inode, loff_t pos, loff_t length,
+			  struct iomap *iomap);
+extern int gfs2_iomap_alloc(struct inode *inode, loff_t pos, loff_t length,
+			    struct iomap *iomap);
 extern int gfs2_extent_map(struct inode *inode, u64 lblock, int *new,
 			   u64 *dblock, unsigned *extlen);
 extern int gfs2_setattr_size(struct inode *inode, u64 size);
diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 2d500f90cdac..5d34b974f4fd 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -421,7 +421,7 @@ static int gfs2_allocate_page_backing(struct page *page, unsigned int length)
 	do {
 		struct iomap iomap = { };
 
-		if (gfs2_iomap_get_alloc(page->mapping->host, pos, length, &iomap))
+		if (gfs2_iomap_alloc(page->mapping->host, pos, length, &iomap))
 			return -EIO;
 
 		if (length < iomap.length)
@@ -991,8 +991,7 @@ static int fallocate_chunk(struct inode *inode, loff_t offset, loff_t len,
 	while (offset < end) {
 		struct iomap iomap = { };
 
-		error = gfs2_iomap_get_alloc(inode, offset, end - offset,
-					     &iomap);
+		error = gfs2_iomap_alloc(inode, offset, end - offset, &iomap);
 		if (error)
 			goto out;
 		offset = iomap.offset + iomap.length;
-- 
2.26.2

