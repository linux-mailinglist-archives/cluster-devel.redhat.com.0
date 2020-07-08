Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id F326D219270
	for <lists+cluster-devel@lfdr.de>; Wed,  8 Jul 2020 23:20:16 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-HyK61CAqM8qmazQv7cDRZw-1; Wed, 08 Jul 2020 17:20:14 -0400
X-MC-Unique: HyK61CAqM8qmazQv7cDRZw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE5DC802783;
	Wed,  8 Jul 2020 21:20:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D6E22C2BC;
	Wed,  8 Jul 2020 21:20:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8BC5193F7B;
	Wed,  8 Jul 2020 21:20:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 068LK9MY009769 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 8 Jul 2020 17:20:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 68FEC33238; Wed,  8 Jul 2020 21:20:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6437C3322D
	for <cluster-devel@redhat.com>; Wed,  8 Jul 2020 21:20:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4CC008EF3AD
	for <cluster-devel@redhat.com>; Wed,  8 Jul 2020 21:20:09 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-150-ujI4_Yi2P0CTRFoiyA34fA-1;
	Wed, 08 Jul 2020 17:20:03 -0400
X-MC-Unique: ujI4_Yi2P0CTRFoiyA34fA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 641B5AE61;
	Wed,  8 Jul 2020 21:20:02 +0000 (UTC)
From: Goldwyn Rodrigues <rgoldwyn@suse.de>
To: linux-btrfs@vger.kernel.org
Date: Wed,  8 Jul 2020 16:19:26 -0500
Message-Id: <20200708211926.7706-7-rgoldwyn@suse.de>
In-Reply-To: <20200708211926.7706-1-rgoldwyn@suse.de>
References: <20200708211926.7706-1-rgoldwyn@suse.de>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 068LK9MY009769
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, darrick.wong@oracle.com,
	cluster-devel@redhat.com, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, hch@lst.de,
	Goldwyn Rodrigues <rgoldwyn@suse.com>
Subject: [Cluster-devel] [PATCH 6/6] btrfs: split btrfs_direct_IO to read
	and write part
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

From: Goldwyn Rodrigues <rgoldwyn@suse.com>

The read and write versions don't have anything in common except for the
call to iomap_dio_rw.  So split this function, and merge each half into
its only caller.

Originally proposed by Christoph Hellwig <hch@lst.de>

Signed-off-by: Goldwyn Rodrigues <rgoldwyn@suse.com>
---
 fs/btrfs/ctree.h |  4 +-
 fs/btrfs/file.c  | 95 +++++++++++++++++++++++++++++++++++++++++++-----
 fs/btrfs/inode.c | 82 +----------------------------------------
 3 files changed, 90 insertions(+), 91 deletions(-)

diff --git a/fs/btrfs/ctree.h b/fs/btrfs/ctree.h
index 677f170434e3..1037969cda63 100644
--- a/fs/btrfs/ctree.h
+++ b/fs/btrfs/ctree.h
@@ -28,6 +28,7 @@
 #include <linux/dynamic_debug.h>
 #include <linux/refcount.h>
 #include <linux/crc32c.h>
+#include <linux/iomap.h>
 #include "extent-io-tree.h"
 #include "extent_io.h"
 #include "extent_map.h"
@@ -2935,7 +2936,8 @@ int btrfs_writepage_cow_fixup(struct page *page, u64 start, u64 end);
 void btrfs_writepage_endio_finish_ordered(struct page *page, u64 start,
 					  u64 end, int uptodate);
 extern const struct dentry_operations btrfs_dentry_operations;
-ssize_t btrfs_direct_IO(struct kiocb *iocb, struct iov_iter *iter);
+extern const struct iomap_ops btrfs_dio_iomap_ops;
+extern const struct iomap_dio_ops btrfs_dops;
 
 /* ioctl.c */
 long btrfs_ioctl(struct file *file, unsigned int cmd, unsigned long arg);
diff --git a/fs/btrfs/file.c b/fs/btrfs/file.c
index 9d486350f1bf..8c738f8101c4 100644
--- a/fs/btrfs/file.c
+++ b/fs/btrfs/file.c
@@ -1825,21 +1825,65 @@ static noinline ssize_t btrfs_buffered_write(struct kiocb *iocb,
 	return num_written ? num_written : ret;
 }
 
-static ssize_t __btrfs_direct_write(struct kiocb *iocb, struct iov_iter *from)
+static ssize_t check_direct_IO(struct btrfs_fs_info *fs_info,
+			       const struct iov_iter *iter, loff_t offset)
+{
+	const unsigned int blocksize_mask = fs_info->sectorsize - 1;
+
+	if (offset & blocksize_mask)
+		return -EINVAL;
+
+	if (iov_iter_alignment(iter) & blocksize_mask)
+		return -EINVAL;
+
+	return 0;
+}
+
+static ssize_t btrfs_direct_write(struct kiocb *iocb, struct iov_iter *from)
 {
 	struct file *file = iocb->ki_filp;
 	struct inode *inode = file_inode(file);
-	loff_t pos;
-	ssize_t written;
+	struct btrfs_fs_info *fs_info = btrfs_sb(inode->i_sb);
+	loff_t pos = iocb->ki_pos;
+	ssize_t written = 0;
 	ssize_t written_buffered;
 	loff_t endbyte;
 	int err;
+	size_t count = 0;
+	bool relock = false;
+	int flags = IOMAP_DIO_RWF_NO_STALE_PAGECACHE;
 
-	written = btrfs_direct_IO(iocb, from);
+	if (check_direct_IO(fs_info, from, pos))
+		goto buffered;
+
+	count = iov_iter_count(from);
+	/*
+	 * If the write DIO is beyond the EOF, we need update the isize, but it
+	 * is protected by i_mutex. So we can not unlock the i_mutex at this
+	 * case.
+	 */
+	if (pos + count <= inode->i_size) {
+		inode_unlock(inode);
+		relock = true;
+	} else if (iocb->ki_flags & IOCB_NOWAIT) {
+		return -EAGAIN;
+	}
+
+	if (is_sync_kiocb(iocb))
+		flags |= IOMAP_DIO_RWF_SYNCIO;
+
+	down_read(&BTRFS_I(inode)->dio_sem);
+	written = iomap_dio_rw(iocb, from, &btrfs_dio_iomap_ops, &btrfs_dops,
+			       flags);
+	up_read(&BTRFS_I(inode)->dio_sem);
+
+	if (relock)
+		inode_lock(inode);
 
 	if (written < 0 || !iov_iter_count(from))
 		return written;
 
+buffered:
 	pos = iocb->ki_pos;
 	written_buffered = btrfs_buffered_write(iocb, from);
 	if (written_buffered < 0) {
@@ -1990,7 +2034,7 @@ static ssize_t btrfs_file_write_iter(struct kiocb *iocb,
 		atomic_inc(&BTRFS_I(inode)->sync_writers);
 
 	if (iocb->ki_flags & IOCB_DIRECT) {
-		num_written = __btrfs_direct_write(iocb, from);
+		num_written = btrfs_direct_write(iocb, from);
 	} else {
 		num_written = btrfs_buffered_write(iocb, from);
 		if (num_written > 0)
@@ -3504,16 +3548,47 @@ static int btrfs_file_open(struct inode *inode, struct file *filp)
 	return generic_file_open(inode, filp);
 }
 
+static int check_direct_read(struct btrfs_fs_info *fs_info,
+			     const struct iov_iter *iter, loff_t offset)
+{
+	int ret;
+	int i, seg;
+
+	ret = check_direct_IO(fs_info, iter, offset);
+	if (ret < 0)
+		return ret;
+
+	for (seg = 0; seg < iter->nr_segs; seg++)
+		for (i = seg + 1; i < iter->nr_segs; i++)
+			if (iter->iov[seg].iov_base == iter->iov[i].iov_base)
+				return -EINVAL;
+	return 0;
+}
+
+static ssize_t btrfs_direct_read(struct kiocb *iocb, struct iov_iter *to)
+{
+	struct inode *inode = file_inode(iocb->ki_filp);
+	ssize_t ret;
+	int flags = IOMAP_DIO_RWF_NO_STALE_PAGECACHE;
+
+	if (check_direct_read(btrfs_sb(inode->i_sb), to, iocb->ki_pos))
+		return 0;
+
+	if (is_sync_kiocb(iocb))
+		flags |= IOMAP_DIO_RWF_SYNCIO;
+
+	inode_lock_shared(inode);
+	ret = iomap_dio_rw(iocb, to, &btrfs_dio_iomap_ops, &btrfs_dops, flags);
+	inode_unlock_shared(inode);
+	return ret;
+}
+
 static ssize_t btrfs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 {
 	ssize_t ret = 0;
 
 	if (iocb->ki_flags & IOCB_DIRECT) {
-		struct inode *inode = file_inode(iocb->ki_filp);
-
-		inode_lock_shared(inode);
-		ret = btrfs_direct_IO(iocb, to);
-		inode_unlock_shared(inode);
+		ret = btrfs_direct_read(iocb, to);
 		if (ret < 0)
 			return ret;
 	}
diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index 264b676ebf29..864415a17b1f 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -29,7 +29,6 @@
 #include <linux/swap.h>
 #include <linux/migrate.h>
 #include <linux/sched/mm.h>
-#include <linux/iomap.h>
 #include <asm/unaligned.h>
 #include "misc.h"
 #include "ctree.h"
@@ -7844,92 +7843,15 @@ static blk_qc_t btrfs_submit_direct(struct inode *inode, struct iomap *iomap,
 	return BLK_QC_T_NONE;
 }
 
-static ssize_t check_direct_IO(struct btrfs_fs_info *fs_info,
-			       const struct iov_iter *iter, loff_t offset)
-{
-	int seg;
-	int i;
-	unsigned int blocksize_mask = fs_info->sectorsize - 1;
-	ssize_t retval = -EINVAL;
-
-	if (offset & blocksize_mask)
-		goto out;
-
-	if (iov_iter_alignment(iter) & blocksize_mask)
-		goto out;
-
-	/* If this is a write we don't need to check anymore */
-	if (iov_iter_rw(iter) != READ || !iter_is_iovec(iter))
-		return 0;
-	/*
-	 * Check to make sure we don't have duplicate iov_base's in this
-	 * iovec, if so return EINVAL, otherwise we'll get csum errors
-	 * when reading back.
-	 */
-	for (seg = 0; seg < iter->nr_segs; seg++) {
-		for (i = seg + 1; i < iter->nr_segs; i++) {
-			if (iter->iov[seg].iov_base == iter->iov[i].iov_base)
-				goto out;
-		}
-	}
-	retval = 0;
-out:
-	return retval;
-}
-
-static const struct iomap_ops btrfs_dio_iomap_ops = {
+const struct iomap_ops btrfs_dio_iomap_ops = {
 	.iomap_begin            = btrfs_dio_iomap_begin,
 	.iomap_end              = btrfs_dio_iomap_end,
 };
 
-static const struct iomap_dio_ops btrfs_dops = {
+const struct iomap_dio_ops btrfs_dops = {
 	.submit_io		= btrfs_submit_direct,
 };
 
-ssize_t btrfs_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
-{
-	struct file *file = iocb->ki_filp;
-	struct inode *inode = file->f_mapping->host;
-	struct btrfs_fs_info *fs_info = btrfs_sb(inode->i_sb);
-	struct extent_changeset *data_reserved = NULL;
-	loff_t offset = iocb->ki_pos;
-	size_t count = 0;
-	bool relock = false;
-	ssize_t ret;
-	int flags = IOMAP_DIO_RWF_NO_STALE_PAGECACHE;
-
-	if (check_direct_IO(fs_info, iter, offset))
-		return 0;
-
-	count = iov_iter_count(iter);
-	if (iov_iter_rw(iter) == WRITE) {
-		/*
-		 * If the write DIO is beyond the EOF, we need update
-		 * the isize, but it is protected by i_mutex. So we can
-		 * not unlock the i_mutex at this case.
-		 */
-		if (offset + count <= inode->i_size) {
-			inode_unlock(inode);
-			relock = true;
-		}
-		down_read(&BTRFS_I(inode)->dio_sem);
-	}
-
-	if (is_sync_kiocb(iocb))
-		flags |= IOMAP_DIO_RWF_SYNCIO;
-
-	ret = iomap_dio_rw(iocb, iter, &btrfs_dio_iomap_ops, &btrfs_dops,
-			flags);
-
-	if (iov_iter_rw(iter) == WRITE) {
-		up_read(&BTRFS_I(inode)->dio_sem);
-	}
-	if (relock)
-		inode_lock(inode);
-	extent_changeset_free(data_reserved);
-	return ret;
-}
-
 static int btrfs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 		__u64 start, __u64 len)
 {
-- 
2.26.2


