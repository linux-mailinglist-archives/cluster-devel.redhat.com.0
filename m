Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 76616EC7B
	for <lists+cluster-devel@lfdr.de>; Tue, 30 Apr 2019 00:09:52 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 05FD13082B69;
	Mon, 29 Apr 2019 22:09:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E21E05D73A;
	Mon, 29 Apr 2019 22:09:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C136F18089CC;
	Mon, 29 Apr 2019 22:09:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3TM9nAx009915 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 29 Apr 2019 18:09:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 168A088EA; Mon, 29 Apr 2019 22:09:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.205.80])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5D9AA1850B;
	Mon, 29 Apr 2019 22:09:46 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com, "Darrick J . Wong" <darrick.wong@oracle.com>
Date: Tue, 30 Apr 2019 00:09:31 +0200
Message-Id: <20190429220934.10415-3-agruenba@redhat.com>
In-Reply-To: <20190429220934.10415-1-agruenba@redhat.com>
References: <20190429220934.10415-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, linux-mm@kvack.org,
	Dave Chinner <david@fromorbit.com>,
	Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org,
	Mark Syms <Mark.Syms@citrix.com>
Subject: [Cluster-devel] [PATCH v7 2/5] fs: Turn __generic_write_end into a
	void function
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Mon, 29 Apr 2019 22:09:51 +0000 (UTC)

The VFS-internal __generic_write_end helper always returns the value of
its @copied argument.  This can be confusing, and it isn't very useful
anyway, so turn __generic_write_end into a function returning void
instead.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/buffer.c   | 6 +++---
 fs/internal.h | 2 +-
 fs/iomap.c    | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index ce357602f471..e0d4c6a5e2d2 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -2085,7 +2085,7 @@ int block_write_begin(struct address_space *mapping, loff_t pos, unsigned len,
 }
 EXPORT_SYMBOL(block_write_begin);
 
-int __generic_write_end(struct inode *inode, loff_t pos, unsigned copied,
+void __generic_write_end(struct inode *inode, loff_t pos, unsigned copied,
 		struct page *page)
 {
 	loff_t old_size = inode->i_size;
@@ -2116,7 +2116,6 @@ int __generic_write_end(struct inode *inode, loff_t pos, unsigned copied,
 	 */
 	if (i_size_changed)
 		mark_inode_dirty(inode);
-	return copied;
 }
 
 int block_write_end(struct file *file, struct address_space *mapping,
@@ -2160,7 +2159,8 @@ int generic_write_end(struct file *file, struct address_space *mapping,
 			struct page *page, void *fsdata)
 {
 	copied = block_write_end(file, mapping, pos, len, copied, page, fsdata);
-	return __generic_write_end(mapping->host, pos, copied, page);
+	__generic_write_end(mapping->host, pos, copied, page);
+	return copied;
 }
 EXPORT_SYMBOL(generic_write_end);
 
diff --git a/fs/internal.h b/fs/internal.h
index 6a8b71643af4..530587fdf5d8 100644
--- a/fs/internal.h
+++ b/fs/internal.h
@@ -44,7 +44,7 @@ static inline int __sync_blockdev(struct block_device *bdev, int wait)
 extern void guard_bio_eod(int rw, struct bio *bio);
 extern int __block_write_begin_int(struct page *page, loff_t pos, unsigned len,
 		get_block_t *get_block, struct iomap *iomap);
-int __generic_write_end(struct inode *inode, loff_t pos, unsigned copied,
+void __generic_write_end(struct inode *inode, loff_t pos, unsigned copied,
 		struct page *page);
 
 /*
diff --git a/fs/iomap.c b/fs/iomap.c
index 2344c662e6fc..f8c9722d1a97 100644
--- a/fs/iomap.c
+++ b/fs/iomap.c
@@ -777,7 +777,7 @@ iomap_write_end(struct inode *inode, loff_t pos, unsigned len,
 		ret = __iomap_write_end(inode, pos, len, copied, page, iomap);
 	}
 
-	ret = __generic_write_end(inode, pos, ret, page);
+	__generic_write_end(inode, pos, ret, page);
 	if (iomap->page_done)
 		iomap->page_done(inode, pos, copied, page, iomap);
 
-- 
2.20.1

