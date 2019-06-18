Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 018FF4A45C
	for <lists+cluster-devel@lfdr.de>; Tue, 18 Jun 2019 16:48:15 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6210981123;
	Tue, 18 Jun 2019 14:47:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 80B9B5BBBD;
	Tue, 18 Jun 2019 14:47:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1FFD81833004;
	Tue, 18 Jun 2019 14:47:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5IElRIC005475 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 Jun 2019 10:47:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 63D8782745; Tue, 18 Jun 2019 14:47:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.205.220])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 663064D1;
	Tue, 18 Jun 2019 14:47:19 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Date: Tue, 18 Jun 2019 16:47:16 +0200
Message-Id: <20190618144716.8133-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-fsdevel@vger.kernel.org,
	Jan Kara <jack@suse.cz>
Subject: [Cluster-devel] [PATCH] fs: Move mark_inode_dirty out of
	__generic_write_end
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Tue, 18 Jun 2019 14:48:13 +0000 (UTC)

Remove the mark_inode_dirty call from __generic_write_end and add it to
generic_write_end and the high-level iomap functions where necessary.
That way, large writes will only dirty inodes at the end instead of
dirtying them once per page.  This fixes a performance bottleneck on
gfs2.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/buffer.c | 26 ++++++++++++++++++--------
 fs/iomap.c  | 42 ++++++++++++++++++++++++++++++++++++++----
 2 files changed, 56 insertions(+), 12 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index e450c55f6434..1b51003bc9d2 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -2089,8 +2089,7 @@ EXPORT_SYMBOL(block_write_begin);
 void __generic_write_end(struct inode *inode, loff_t pos, unsigned copied,
 		struct page *page)
 {
-	loff_t old_size = inode->i_size;
-	bool i_size_changed = false;
+	loff_t old_size;
 
 	/*
 	 * No need to use i_size_read() here, the i_size cannot change under us
@@ -2099,23 +2098,21 @@ void __generic_write_end(struct inode *inode, loff_t pos, unsigned copied,
 	 * But it's important to update i_size while still holding page lock:
 	 * page writeout could otherwise come in and zero beyond i_size.
 	 */
-	if (pos + copied > inode->i_size) {
+	old_size = inode->i_size;
+	if (pos + copied > old_size)
 		i_size_write(inode, pos + copied);
-		i_size_changed = true;
-	}
 
 	unlock_page(page);
 
 	if (old_size < pos)
 		pagecache_isize_extended(inode, old_size, pos);
+
 	/*
 	 * Don't mark the inode dirty under page lock. First, it unnecessarily
 	 * makes the holding time of page lock longer. Second, it forces lock
 	 * ordering of page lock and transaction start for journaling
 	 * filesystems.
 	 */
-	if (i_size_changed)
-		mark_inode_dirty(inode);
 }
 
 int block_write_end(struct file *file, struct address_space *mapping,
@@ -2158,9 +2155,22 @@ int generic_write_end(struct file *file, struct address_space *mapping,
 			loff_t pos, unsigned len, unsigned copied,
 			struct page *page, void *fsdata)
 {
+	struct inode *inode = mapping->host;
+	loff_t old_size;
+
+	/*
+	 * No need to use i_size_read() here, the i_size cannot change under us
+	 * because we hold i_rwsem.
+	 */
+	old_size = inode->i_size;
+
 	copied = block_write_end(file, mapping, pos, len, copied, page, fsdata);
-	__generic_write_end(mapping->host, pos, copied, page);
+	__generic_write_end(inode, pos, copied, page);
 	put_page(page);
+
+	if (old_size != inode->i_size)
+		mark_inode_dirty(inode);
+
 	return copied;
 }
 EXPORT_SYMBOL(generic_write_end);
diff --git a/fs/iomap.c b/fs/iomap.c
index 23ef63fd1669..9454568a7f5e 100644
--- a/fs/iomap.c
+++ b/fs/iomap.c
@@ -881,6 +881,13 @@ iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *iter,
 {
 	struct inode *inode = iocb->ki_filp->f_mapping->host;
 	loff_t pos = iocb->ki_pos, ret = 0, written = 0;
+	loff_t old_size;
+
+        /*
+	 * No need to use i_size_read() here, the i_size cannot change under us
+	 * because we hold i_rwsem.
+	 */
+	old_size = inode->i_size;
 
 	while (iov_iter_count(iter)) {
 		ret = iomap_apply(inode, pos, iov_iter_count(iter),
@@ -891,6 +898,9 @@ iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *iter,
 		written += ret;
 	}
 
+	if (old_size != inode->i_size)
+		mark_inode_dirty(inode);
+
 	return written ? written : ret;
 }
 EXPORT_SYMBOL_GPL(iomap_file_buffered_write);
@@ -961,18 +971,30 @@ int
 iomap_file_dirty(struct inode *inode, loff_t pos, loff_t len,
 		const struct iomap_ops *ops)
 {
+	loff_t old_size;
 	loff_t ret;
 
+        /*
+	 * No need to use i_size_read() here, the i_size cannot change under us
+	 * because we hold i_rwsem.
+	 */
+	old_size = inode->i_size;
+
 	while (len) {
 		ret = iomap_apply(inode, pos, len, IOMAP_WRITE, ops, NULL,
 				iomap_dirty_actor);
 		if (ret <= 0)
-			return ret;
+			goto out;
 		pos += ret;
 		len -= ret;
 	}
+	ret = 0;
 
-	return 0;
+out:
+	if (old_size != inode->i_size)
+		mark_inode_dirty(inode);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(iomap_file_dirty);
 
@@ -1039,19 +1061,31 @@ int
 iomap_zero_range(struct inode *inode, loff_t pos, loff_t len, bool *did_zero,
 		const struct iomap_ops *ops)
 {
+	loff_t old_size;
 	loff_t ret;
 
+        /*
+	 * No need to use i_size_read() here, the i_size cannot change under us
+	 * because we hold i_rwsem.
+	 */
+	old_size = inode->i_size;
+
 	while (len > 0) {
 		ret = iomap_apply(inode, pos, len, IOMAP_ZERO,
 				ops, did_zero, iomap_zero_range_actor);
 		if (ret <= 0)
-			return ret;
+			goto out;
 
 		pos += ret;
 		len -= ret;
 	}
+	ret = 0;
 
-	return 0;
+out:
+	if (old_size != inode->i_size)
+		mark_inode_dirty(inode);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(iomap_zero_range);
 
-- 
2.20.1

