Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD9F5682E
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Jun 2019 14:04:40 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AB6B13082AED;
	Wed, 26 Jun 2019 12:04:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 727921001281;
	Wed, 26 Jun 2019 12:04:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6F6271806B12;
	Wed, 26 Jun 2019 12:04:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5QC3d7R010578 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 26 Jun 2019 08:03:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 17EAD6013A; Wed, 26 Jun 2019 12:03:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.205.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AF0986013D;
	Wed, 26 Jun 2019 12:03:37 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org
Date: Wed, 26 Jun 2019 14:03:33 +0200
Message-Id: <20190626120333.13310-2-agruenba@redhat.com>
In-Reply-To: <20190626120333.13310-1-agruenba@redhat.com>
References: <20190626120333.13310-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-xfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH 2/2] fs: fold __generic_write_end back into
	generic_write_end
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Wed, 26 Jun 2019 12:04:39 +0000 (UTC)

From: Christoph Hellwig <hch@lst.de>

This effectively reverts a6d639da63ae ("fs: factor out a
__generic_write_end helper") as we now open code what is left of that
helper in iomap.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/buffer.c   | 62 ++++++++++++++++++++++++---------------------------
 fs/internal.h |  2 --
 2 files changed, 29 insertions(+), 35 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index e450c55f6434..49a871570092 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -2086,38 +2086,6 @@ int block_write_begin(struct address_space *mapping, loff_t pos, unsigned len,
 }
 EXPORT_SYMBOL(block_write_begin);
 
-void __generic_write_end(struct inode *inode, loff_t pos, unsigned copied,
-		struct page *page)
-{
-	loff_t old_size = inode->i_size;
-	bool i_size_changed = false;
-
-	/*
-	 * No need to use i_size_read() here, the i_size cannot change under us
-	 * because we hold i_rwsem.
-	 *
-	 * But it's important to update i_size while still holding page lock:
-	 * page writeout could otherwise come in and zero beyond i_size.
-	 */
-	if (pos + copied > inode->i_size) {
-		i_size_write(inode, pos + copied);
-		i_size_changed = true;
-	}
-
-	unlock_page(page);
-
-	if (old_size < pos)
-		pagecache_isize_extended(inode, old_size, pos);
-	/*
-	 * Don't mark the inode dirty under page lock. First, it unnecessarily
-	 * makes the holding time of page lock longer. Second, it forces lock
-	 * ordering of page lock and transaction start for journaling
-	 * filesystems.
-	 */
-	if (i_size_changed)
-		mark_inode_dirty(inode);
-}
-
 int block_write_end(struct file *file, struct address_space *mapping,
 			loff_t pos, unsigned len, unsigned copied,
 			struct page *page, void *fsdata)
@@ -2158,9 +2126,37 @@ int generic_write_end(struct file *file, struct address_space *mapping,
 			loff_t pos, unsigned len, unsigned copied,
 			struct page *page, void *fsdata)
 {
+	struct inode *inode = mapping->host;
+	loff_t old_size = inode->i_size;
+	bool i_size_changed = false;
+
 	copied = block_write_end(file, mapping, pos, len, copied, page, fsdata);
-	__generic_write_end(mapping->host, pos, copied, page);
+
+	/*
+	 * No need to use i_size_read() here, the i_size cannot change under us
+	 * because we hold i_rwsem.
+	 *
+	 * But it's important to update i_size while still holding page lock:
+	 * page writeout could otherwise come in and zero beyond i_size.
+	 */
+	if (pos + copied > inode->i_size) {
+		i_size_write(inode, pos + copied);
+		i_size_changed = true;
+	}
+
+	unlock_page(page);
 	put_page(page);
+
+	if (old_size < pos)
+		pagecache_isize_extended(inode, old_size, pos);
+	/*
+	 * Don't mark the inode dirty under page lock. First, it unnecessarily
+	 * makes the holding time of page lock longer. Second, it forces lock
+	 * ordering of page lock and transaction start for journaling
+	 * filesystems.
+	 */
+	if (i_size_changed)
+		mark_inode_dirty(inode);
 	return copied;
 }
 EXPORT_SYMBOL(generic_write_end);
diff --git a/fs/internal.h b/fs/internal.h
index a48ef81be37d..2f3c3de51fad 100644
--- a/fs/internal.h
+++ b/fs/internal.h
@@ -40,8 +40,6 @@ static inline int __sync_blockdev(struct block_device *bdev, int wait)
 extern void guard_bio_eod(int rw, struct bio *bio);
 extern int __block_write_begin_int(struct page *page, loff_t pos, unsigned len,
 		get_block_t *get_block, struct iomap *iomap);
-void __generic_write_end(struct inode *inode, loff_t pos, unsigned copied,
-		struct page *page);
 
 /*
  * char_dev.c
-- 
2.20.1

