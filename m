Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 76D533E3FF4
	for <lists+cluster-devel@lfdr.de>; Mon,  9 Aug 2021 08:28:44 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-qsXqovVlMcmwe_Ph_hmO7A-1; Mon, 09 Aug 2021 02:28:42 -0400
X-MC-Unique: qsXqovVlMcmwe_Ph_hmO7A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B94680982E;
	Mon,  9 Aug 2021 06:28:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 113061017CE5;
	Mon,  9 Aug 2021 06:28:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F1167180BAB0;
	Mon,  9 Aug 2021 06:28:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1796Schu003096 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 9 Aug 2021 02:28:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C6433100402D; Mon,  9 Aug 2021 06:28:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF04D1134CBF
	for <cluster-devel@redhat.com>; Mon,  9 Aug 2021 06:28:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C55718D13A3
	for <cluster-devel@redhat.com>; Mon,  9 Aug 2021 06:28:35 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-478-J5EOcD_fMtWh_Mrlv57cIw-1; Mon, 09 Aug 2021 02:28:34 -0400
X-MC-Unique: J5EOcD_fMtWh_Mrlv57cIw-1
Received: from [2a02:1205:5023:1f80:c068:bd3d:78b3:7d37] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCyk1-00AhMz-9M; Mon, 09 Aug 2021 06:26:43 +0000
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Date: Mon,  9 Aug 2021 08:12:31 +0200
Message-Id: <20210809061244.1196573-18-hch@lst.de>
In-Reply-To: <20210809061244.1196573-1-hch@lst.de>
References: <20210809061244.1196573-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: nvdimm@lists.linux.dev, cluster-devel@redhat.com,
	Matthew Wilcox <willy@infradead.org>,
	Shiyang Ruan <ruansy.fnst@fujitsu.com>,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH 17/30] iomap: switch __iomap_dio_rw to use
	iomap_iter
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

Switch __iomap_dio_rw to use iomap_iter.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/btrfs/inode.c      |   5 +-
 fs/iomap/direct-io.c  | 164 +++++++++++++++++++++---------------------
 include/linux/iomap.h |   4 +-
 3 files changed, 86 insertions(+), 87 deletions(-)

diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index 0117d867ecf876..3b0595e8bdd929 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -8194,9 +8194,10 @@ static struct btrfs_dio_private *btrfs_create_dio_private(struct bio *dio_bio,
 	return dip;
 }
 
-static blk_qc_t btrfs_submit_direct(struct inode *inode, struct iomap *iomap,
+static blk_qc_t btrfs_submit_direct(const struct iomap_iter *iter,
 		struct bio *dio_bio, loff_t file_offset)
 {
+	struct inode *inode = iter->inode;
 	const bool write = (btrfs_op(dio_bio) == BTRFS_MAP_WRITE);
 	struct btrfs_fs_info *fs_info = btrfs_sb(inode->i_sb);
 	const bool raid56 = (btrfs_data_alloc_profile(fs_info) &
@@ -8212,7 +8213,7 @@ static blk_qc_t btrfs_submit_direct(struct inode *inode, struct iomap *iomap,
 	int ret;
 	blk_status_t status;
 	struct btrfs_io_geometry geom;
-	struct btrfs_dio_data *dio_data = iomap->private;
+	struct btrfs_dio_data *dio_data = iter->iomap.private;
 	struct extent_map *em = NULL;
 
 	dip = btrfs_create_dio_private(dio_bio, inode, file_offset);
diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
index 41ccbfc9dc820a..4ecd255e0511ce 100644
--- a/fs/iomap/direct-io.c
+++ b/fs/iomap/direct-io.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (C) 2010 Red Hat, Inc.
- * Copyright (c) 2016-2018 Christoph Hellwig.
+ * Copyright (c) 2016-2021 Christoph Hellwig.
  */
 #include <linux/module.h>
 #include <linux/compiler.h>
@@ -59,19 +59,17 @@ int iomap_dio_iopoll(struct kiocb *kiocb, bool spin)
 }
 EXPORT_SYMBOL_GPL(iomap_dio_iopoll);
 
-static void iomap_dio_submit_bio(struct iomap_dio *dio, struct iomap *iomap,
-		struct bio *bio, loff_t pos)
+static void iomap_dio_submit_bio(const struct iomap_iter *iter,
+		struct iomap_dio *dio, struct bio *bio, loff_t pos)
 {
 	atomic_inc(&dio->ref);
 
 	if (dio->iocb->ki_flags & IOCB_HIPRI)
 		bio_set_polled(bio, dio->iocb);
 
-	dio->submit.last_queue = bdev_get_queue(iomap->bdev);
+	dio->submit.last_queue = bdev_get_queue(iter->iomap.bdev);
 	if (dio->dops && dio->dops->submit_io)
-		dio->submit.cookie = dio->dops->submit_io(
-				file_inode(dio->iocb->ki_filp),
-				iomap, bio, pos);
+		dio->submit.cookie = dio->dops->submit_io(iter, bio, pos);
 	else
 		dio->submit.cookie = submit_bio(bio);
 }
@@ -181,24 +179,23 @@ static void iomap_dio_bio_end_io(struct bio *bio)
 	}
 }
 
-static void
-iomap_dio_zero(struct iomap_dio *dio, struct iomap *iomap, loff_t pos,
-		unsigned len)
+static void iomap_dio_zero(const struct iomap_iter *iter, struct iomap_dio *dio,
+		loff_t pos, unsigned len)
 {
 	struct page *page = ZERO_PAGE(0);
 	int flags = REQ_SYNC | REQ_IDLE;
 	struct bio *bio;
 
 	bio = bio_alloc(GFP_KERNEL, 1);
-	bio_set_dev(bio, iomap->bdev);
-	bio->bi_iter.bi_sector = iomap_sector(iomap, pos);
+	bio_set_dev(bio, iter->iomap.bdev);
+	bio->bi_iter.bi_sector = iomap_sector(&iter->iomap, pos);
 	bio->bi_private = dio;
 	bio->bi_end_io = iomap_dio_bio_end_io;
 
 	get_page(page);
 	__bio_add_page(bio, page, len, 0);
 	bio_set_op_attrs(bio, REQ_OP_WRITE, flags);
-	iomap_dio_submit_bio(dio, iomap, bio, pos);
+	iomap_dio_submit_bio(iter, dio, bio, pos);
 }
 
 /*
@@ -206,8 +203,8 @@ iomap_dio_zero(struct iomap_dio *dio, struct iomap *iomap, loff_t pos,
  * mapping, and whether or not we want FUA.  Note that we can end up
  * clearing the WRITE_FUA flag in the dio request.
  */
-static inline unsigned int
-iomap_dio_bio_opflags(struct iomap_dio *dio, struct iomap *iomap, bool use_fua)
+static inline unsigned int iomap_dio_bio_opflags(struct iomap_dio *dio,
+		const struct iomap *iomap, bool use_fua)
 {
 	unsigned int opflags = REQ_SYNC | REQ_IDLE;
 
@@ -229,13 +226,16 @@ iomap_dio_bio_opflags(struct iomap_dio *dio, struct iomap *iomap, bool use_fua)
 	return opflags;
 }
 
-static loff_t
-iomap_dio_bio_actor(struct inode *inode, loff_t pos, loff_t length,
-		struct iomap_dio *dio, struct iomap *iomap)
+static loff_t iomap_dio_bio_iter(const struct iomap_iter *iter,
+		struct iomap_dio *dio)
 {
+	const struct iomap *iomap = &iter->iomap;
+	struct inode *inode = iter->inode;
 	unsigned int blkbits = blksize_bits(bdev_logical_block_size(iomap->bdev));
 	unsigned int fs_block_size = i_blocksize(inode), pad;
 	unsigned int align = iov_iter_alignment(dio->submit.iter);
+	loff_t length = iomap_length(iter);
+	loff_t pos = iter->pos;
 	unsigned int bio_opf;
 	struct bio *bio;
 	bool need_zeroout = false;
@@ -286,7 +286,7 @@ iomap_dio_bio_actor(struct inode *inode, loff_t pos, loff_t length,
 		/* zero out from the start of the block to the write offset */
 		pad = pos & (fs_block_size - 1);
 		if (pad)
-			iomap_dio_zero(dio, iomap, pos - pad, pad);
+			iomap_dio_zero(iter, dio, pos - pad, pad);
 	}
 
 	/*
@@ -339,7 +339,7 @@ iomap_dio_bio_actor(struct inode *inode, loff_t pos, loff_t length,
 
 		nr_pages = bio_iov_vecs_to_alloc(dio->submit.iter,
 						 BIO_MAX_VECS);
-		iomap_dio_submit_bio(dio, iomap, bio, pos);
+		iomap_dio_submit_bio(iter, dio, bio, pos);
 		pos += n;
 	} while (nr_pages);
 
@@ -355,7 +355,7 @@ iomap_dio_bio_actor(struct inode *inode, loff_t pos, loff_t length,
 		/* zero out from the end of the write to the end of the block */
 		pad = pos & (fs_block_size - 1);
 		if (pad)
-			iomap_dio_zero(dio, iomap, pos, fs_block_size - pad);
+			iomap_dio_zero(iter, dio, pos, fs_block_size - pad);
 	}
 out:
 	/* Undo iter limitation to current extent */
@@ -365,35 +365,38 @@ iomap_dio_bio_actor(struct inode *inode, loff_t pos, loff_t length,
 	return ret;
 }
 
-static loff_t
-iomap_dio_hole_actor(loff_t length, struct iomap_dio *dio)
+static loff_t iomap_dio_hole_iter(const struct iomap_iter *iter,
+		struct iomap_dio *dio)
 {
-	length = iov_iter_zero(length, dio->submit.iter);
+	loff_t length = iov_iter_zero(iomap_length(iter), dio->submit.iter);
+
 	dio->size += length;
 	return length;
 }
 
-static loff_t
-iomap_dio_inline_actor(struct inode *inode, loff_t pos, loff_t length,
-		struct iomap_dio *dio, struct iomap *iomap)
+static loff_t iomap_dio_inline_iter(const struct iomap_iter *iomi,
+		struct iomap_dio *dio)
 {
+	const struct iomap *iomap = &iomi->iomap;
 	struct iov_iter *iter = dio->submit.iter;
-	void *inline_data = iomap_inline_data(iomap, pos);
+	void *inline_data = iomap_inline_data(iomap, iomi->pos);
+	loff_t length = iomap_length(iomi);
+	loff_t pos = iomi->pos;
 	size_t copied;
 
 	if (WARN_ON_ONCE(!iomap_inline_data_valid(iomap)))
 		return -EIO;
 
 	if (dio->flags & IOMAP_DIO_WRITE) {
-		loff_t size = inode->i_size;
+		loff_t size = iomi->inode->i_size;
 
 		if (pos > size)
 			memset(iomap_inline_data(iomap, size), 0, pos - size);
 		copied = copy_from_iter(inline_data, length, iter);
 		if (copied) {
 			if (pos + copied > size)
-				i_size_write(inode, pos + copied);
-			mark_inode_dirty(inode);
+				i_size_write(iomi->inode, pos + copied);
+			mark_inode_dirty(iomi->inode);
 		}
 	} else {
 		copied = copy_to_iter(inline_data, length, iter);
@@ -402,30 +405,27 @@ iomap_dio_inline_actor(struct inode *inode, loff_t pos, loff_t length,
 	return copied;
 }
 
-static loff_t
-iomap_dio_actor(struct inode *inode, loff_t pos, loff_t length,
-		void *data, struct iomap *iomap, struct iomap *srcmap)
+static loff_t iomap_dio_iter(const struct iomap_iter *iter,
+		struct iomap_dio *dio)
 {
-	struct iomap_dio *dio = data;
-
-	switch (iomap->type) {
+	switch (iter->iomap.type) {
 	case IOMAP_HOLE:
 		if (WARN_ON_ONCE(dio->flags & IOMAP_DIO_WRITE))
 			return -EIO;
-		return iomap_dio_hole_actor(length, dio);
+		return iomap_dio_hole_iter(iter, dio);
 	case IOMAP_UNWRITTEN:
 		if (!(dio->flags & IOMAP_DIO_WRITE))
-			return iomap_dio_hole_actor(length, dio);
-		return iomap_dio_bio_actor(inode, pos, length, dio, iomap);
+			return iomap_dio_hole_iter(iter, dio);
+		return iomap_dio_bio_iter(iter, dio);
 	case IOMAP_MAPPED:
-		return iomap_dio_bio_actor(inode, pos, length, dio, iomap);
+		return iomap_dio_bio_iter(iter, dio);
 	case IOMAP_INLINE:
-		return iomap_dio_inline_actor(inode, pos, length, dio, iomap);
+		return iomap_dio_inline_iter(iter, dio);
 	case IOMAP_DELALLOC:
 		/*
 		 * DIO is not serialised against mmap() access at all, and so
 		 * if the page_mkwrite occurs between the writeback and the
-		 * iomap_apply() call in the DIO path, then it will see the
+		 * iomap_iter() call in the DIO path, then it will see the
 		 * DELALLOC block that the page-mkwrite allocated.
 		 */
 		pr_warn_ratelimited("Direct I/O collision with buffered writes! File: %pD4 Comm: %.20s\n",
@@ -456,16 +456,19 @@ __iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
 {
 	struct address_space *mapping = iocb->ki_filp->f_mapping;
 	struct inode *inode = file_inode(iocb->ki_filp);
-	size_t count = iov_iter_count(iter);
-	loff_t pos = iocb->ki_pos;
-	loff_t end = iocb->ki_pos + count - 1, ret = 0;
+	struct iomap_iter iomi = {
+		.inode		= inode,
+		.pos		= iocb->ki_pos,
+		.len		= iov_iter_count(iter),
+		.flags		= IOMAP_DIRECT,
+	};
+	loff_t end = iomi.pos + iomi.len - 1, ret = 0;
 	bool wait_for_completion =
 		is_sync_kiocb(iocb) || (dio_flags & IOMAP_DIO_FORCE_WAIT);
-	unsigned int iomap_flags = IOMAP_DIRECT;
 	struct blk_plug plug;
 	struct iomap_dio *dio;
 
-	if (!count)
+	if (!iomi.len)
 		return NULL;
 
 	dio = kmalloc(sizeof(*dio), GFP_KERNEL);
@@ -486,29 +489,30 @@ __iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
 	dio->submit.last_queue = NULL;
 
 	if (iov_iter_rw(iter) == READ) {
-		if (pos >= dio->i_size)
+		if (iomi.pos >= dio->i_size)
 			goto out_free_dio;
 
 		if (iocb->ki_flags & IOCB_NOWAIT) {
-			if (filemap_range_needs_writeback(mapping, pos, end)) {
+			if (filemap_range_needs_writeback(mapping, iomi.pos,
+					end)) {
 				ret = -EAGAIN;
 				goto out_free_dio;
 			}
-			iomap_flags |= IOMAP_NOWAIT;
+			iomi.flags |= IOMAP_NOWAIT;
 		}
 
 		if (iter_is_iovec(iter))
 			dio->flags |= IOMAP_DIO_DIRTY;
 	} else {
-		iomap_flags |= IOMAP_WRITE;
+		iomi.flags |= IOMAP_WRITE;
 		dio->flags |= IOMAP_DIO_WRITE;
 
 		if (iocb->ki_flags & IOCB_NOWAIT) {
-			if (filemap_range_has_page(mapping, pos, end)) {
+			if (filemap_range_has_page(mapping, iomi.pos, end)) {
 				ret = -EAGAIN;
 				goto out_free_dio;
 			}
-			iomap_flags |= IOMAP_NOWAIT;
+			iomi.flags |= IOMAP_NOWAIT;
 		}
 
 		/* for data sync or sync, we need sync completion processing */
@@ -527,12 +531,13 @@ __iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
 
 	if (dio_flags & IOMAP_DIO_OVERWRITE_ONLY) {
 		ret = -EAGAIN;
-		if (pos >= dio->i_size || pos + count > dio->i_size)
+		if (iomi.pos >= dio->i_size ||
+		    iomi.pos + iomi.len > dio->i_size)
 			goto out_free_dio;
-		iomap_flags |= IOMAP_OVERWRITE_ONLY;
+		iomi.flags |= IOMAP_OVERWRITE_ONLY;
 	}
 
-	ret = filemap_write_and_wait_range(mapping, pos, end);
+	ret = filemap_write_and_wait_range(mapping, iomi.pos, end);
 	if (ret)
 		goto out_free_dio;
 
@@ -542,9 +547,10 @@ __iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
 		 * If this invalidation fails, let the caller fall back to
 		 * buffered I/O.
 		 */
-		if (invalidate_inode_pages2_range(mapping, pos >> PAGE_SHIFT,
-				end >> PAGE_SHIFT)) {
-			trace_iomap_dio_invalidate_fail(inode, pos, count);
+		if (invalidate_inode_pages2_range(mapping,
+				iomi.pos >> PAGE_SHIFT, end >> PAGE_SHIFT)) {
+			trace_iomap_dio_invalidate_fail(inode, iomi.pos,
+							iomi.len);
 			ret = -ENOTBLK;
 			goto out_free_dio;
 		}
@@ -559,31 +565,23 @@ __iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
 	inode_dio_begin(inode);
 
 	blk_start_plug(&plug);
-	do {
-		ret = iomap_apply(inode, pos, count, iomap_flags, ops, dio,
-				iomap_dio_actor);
-		if (ret <= 0) {
-			/* magic error code to fall back to buffered I/O */
-			if (ret == -ENOTBLK) {
-				wait_for_completion = true;
-				ret = 0;
-			}
-			break;
-		}
-		pos += ret;
-
-		if (iov_iter_rw(iter) == READ && pos >= dio->i_size) {
-			/*
-			 * We only report that we've read data up to i_size.
-			 * Revert iter to a state corresponding to that as
-			 * some callers (such as splice code) rely on it.
-			 */
-			iov_iter_revert(iter, pos - dio->i_size);
-			break;
-		}
-	} while ((count = iov_iter_count(iter)) > 0);
+	while ((ret = iomap_iter(&iomi, ops)) > 0)
+		iomi.processed = iomap_dio_iter(&iomi, dio);
 	blk_finish_plug(&plug);
 
+	/*
+	 * We only report that we've read data up to i_size.
+	 * Revert iter to a state corresponding to that as some callers (such
+	 * as the splice code) rely on it.
+	 */
+	if (iov_iter_rw(iter) == READ && iomi.pos >= dio->i_size)
+		iov_iter_revert(iter, iomi.pos - dio->i_size);
+
+	/* magic error code to fall back to buffered I/O */
+	if (ret == -ENOTBLK) {
+		wait_for_completion = true;
+		ret = 0;
+	}
 	if (ret < 0)
 		iomap_dio_set_error(dio, ret);
 
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index aac4176ea16439..66e04aedd2ca83 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -322,8 +322,8 @@ int iomap_writepages(struct address_space *mapping,
 struct iomap_dio_ops {
 	int (*end_io)(struct kiocb *iocb, ssize_t size, int error,
 		      unsigned flags);
-	blk_qc_t (*submit_io)(struct inode *inode, struct iomap *iomap,
-			struct bio *bio, loff_t file_offset);
+	blk_qc_t (*submit_io)(const struct iomap_iter *iter, struct bio *bio,
+			      loff_t file_offset);
 };
 
 /*
-- 
2.30.2

