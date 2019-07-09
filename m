Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CABA463772
	for <lists+cluster-devel@lfdr.de>; Tue,  9 Jul 2019 16:08:37 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 24D723082B6D;
	Tue,  9 Jul 2019 14:08:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D5315DD9B;
	Tue,  9 Jul 2019 14:08:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D22D8206D6;
	Tue,  9 Jul 2019 14:08:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x69E7QBL016090 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 9 Jul 2019 10:07:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 90EE5831CE; Tue,  9 Jul 2019 14:07:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.205.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 99AC6831B7;
	Tue,  9 Jul 2019 14:07:23 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Tue,  9 Jul 2019 16:06:51 +0200
Message-Id: <20190709140657.19064-13-agruenba@redhat.com>
In-Reply-To: <20190709140657.19064-1-agruenba@redhat.com>
References: <20190709140657.19064-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: Christoph Hellwig <hch@lst.de>
Subject: [Cluster-devel] [GFS2 PATCH 12/18] gfs2: remove the unused
	gfs2_stuffed_write_end function
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Tue, 09 Jul 2019 14:08:36 +0000 (UTC)

From: Christoph Hellwig <hch@lst.de>

This function was overlooked when the write_begin and write_end address space
operations were removed as part of gfs2's iomap conversion.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/aops.c | 41 -----------------------------------------
 fs/gfs2/aops.h |  3 ---
 2 files changed, 44 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index 1463b399285c..d82b919ce70f 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -685,47 +685,6 @@ void adjust_fs_space(struct inode *inode)
 	gfs2_trans_end(sdp);
 }
 
-/**
- * gfs2_stuffed_write_end - Write end for stuffed files
- * @inode: The inode
- * @dibh: The buffer_head containing the on-disk inode
- * @pos: The file position
- * @copied: How much was actually copied by the VFS
- * @page: The page
- *
- * This copies the data from the page into the inode block after
- * the inode data structure itself.
- *
- * Returns: copied bytes or errno
- */
-int gfs2_stuffed_write_end(struct inode *inode, struct buffer_head *dibh,
-			   loff_t pos, unsigned copied,
-			   struct page *page)
-{
-	struct gfs2_inode *ip = GFS2_I(inode);
-	u64 to = pos + copied;
-	void *kaddr;
-	unsigned char *buf = dibh->b_data + sizeof(struct gfs2_dinode);
-
-	BUG_ON(pos + copied > gfs2_max_stuffed_size(ip));
-
-	kaddr = kmap_atomic(page);
-	memcpy(buf + pos, kaddr + pos, copied);
-	flush_dcache_page(page);
-	kunmap_atomic(kaddr);
-
-	WARN_ON(!PageUptodate(page));
-	unlock_page(page);
-	put_page(page);
-
-	if (copied) {
-		if (inode->i_size < to)
-			i_size_write(inode, to);
-		mark_inode_dirty(inode);
-	}
-	return copied;
-}
-
 /**
  * jdata_set_page_dirty - Page dirtying function
  * @page: The page to dirty
diff --git a/fs/gfs2/aops.h b/fs/gfs2/aops.h
index fa8e5d0144dd..3a6d8a90d99e 100644
--- a/fs/gfs2/aops.h
+++ b/fs/gfs2/aops.h
@@ -9,9 +9,6 @@
 #include "incore.h"
 
 extern int stuffed_readpage(struct gfs2_inode *ip, struct page *page);
-extern int gfs2_stuffed_write_end(struct inode *inode, struct buffer_head *dibh,
-				  loff_t pos, unsigned copied,
-				  struct page *page);
 extern void adjust_fs_space(struct inode *inode);
 extern void gfs2_page_add_databufs(struct gfs2_inode *ip, struct page *page,
 				   unsigned int from, unsigned int len);
-- 
2.20.1

