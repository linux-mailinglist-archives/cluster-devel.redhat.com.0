Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C40C563776
	for <lists+cluster-devel@lfdr.de>; Tue,  9 Jul 2019 16:08:48 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BD8393086239;
	Tue,  9 Jul 2019 14:08:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EEDE51C68;
	Tue,  9 Jul 2019 14:08:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 41417206D5;
	Tue,  9 Jul 2019 14:08:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x69E7jjs016157 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 9 Jul 2019 10:07:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 24F69831CE; Tue,  9 Jul 2019 14:07:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.205.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2BA22831C5;
	Tue,  9 Jul 2019 14:07:37 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Tue,  9 Jul 2019 16:06:56 +0200
Message-Id: <20190709140657.19064-18-agruenba@redhat.com>
In-Reply-To: <20190709140657.19064-1-agruenba@redhat.com>
References: <20190709140657.19064-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: Christoph Hellwig <hch@lst.de>
Subject: [Cluster-devel] [GFS2 PATCH 17/18] gfs2: don't use buffer_heads in
	gfs2_allocate_page_backing
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Tue, 09 Jul 2019 14:08:47 +0000 (UTC)

From: Christoph Hellwig <hch@lst.de>

Rewrite gfs2_allocate_page_backing to call gfs2_iomap_get_alloc and operate on
struct iomap directly.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/file.c | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 5d61113b3f50..8b0c2bfa90c1 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -363,31 +363,30 @@ static void gfs2_size_hint(struct file *filep, loff_t offset, size_t size)
 }
 
 /**
- * gfs2_allocate_page_backing - Use bmap to allocate blocks
+ * gfs2_allocate_page_backing - Allocate blocks for a write fault
  * @page: The (locked) page to allocate backing for
  *
- * We try to allocate all the blocks required for the page in
- * one go. This might fail for various reasons, so we keep
- * trying until all the blocks to back this page are allocated.
- * If some of the blocks are already allocated, thats ok too.
+ * We try to allocate all the blocks required for the page in one go.  This
+ * might fail for various reasons, so we keep trying until all the blocks to
+ * back this page are allocated.  If some of the blocks are already allocated,
+ * that is ok too.
  */
-
 static int gfs2_allocate_page_backing(struct page *page)
 {
-	struct inode *inode = page->mapping->host;
-	struct buffer_head bh;
-	unsigned long size = PAGE_SIZE;
-	u64 lblock = page->index << (PAGE_SHIFT - inode->i_blkbits);
+	u64 pos = page_offset(page);
+	u64 size = PAGE_SIZE;
 
 	do {
-		bh.b_state = 0;
-		bh.b_size = size;
-		gfs2_block_map(inode, lblock, &bh, 1);
-		if (!buffer_mapped(&bh))
+		struct iomap iomap = { };
+
+		if (gfs2_iomap_get_alloc(page->mapping->host, pos, 1, &iomap))
 			return -EIO;
-		size -= bh.b_size;
-		lblock += (bh.b_size >> inode->i_blkbits);
-	} while(size > 0);
+
+		iomap.length = min(iomap.length, size);
+		size -= iomap.length;
+		pos += iomap.length;
+	} while (size > 0);
+
 	return 0;
 }
 
-- 
2.20.1

