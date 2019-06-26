Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAFE5683A
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Jun 2019 14:07:27 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 784C03DD47;
	Wed, 26 Jun 2019 12:07:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6701C546E1;
	Wed, 26 Jun 2019 12:07:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A9DB2E163;
	Wed, 26 Jun 2019 12:07:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5QC3bR6010541 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 26 Jun 2019 08:03:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 502F16013C; Wed, 26 Jun 2019 12:03:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.205.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EE03F6012E;
	Wed, 26 Jun 2019 12:03:35 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org
Date: Wed, 26 Jun 2019 14:03:32 +0200
Message-Id: <20190626120333.13310-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-xfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH 1/2] iomap: don't mark the inode dirty in
	iomap_write_end
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Wed, 26 Jun 2019 12:07:26 +0000 (UTC)

Marking the inode dirty for each page copied into the page cache can be
very inefficient for file systems that use the VFS dirty inode tracking,
and is completely pointless for those that don't use the VFS dirty inode
tracking.  So instead, only set an iomap flag when changing the in-core
inode size, and open code the rest of __generic_write_end.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/bmap.c        |  2 ++
 fs/iomap.c            | 15 ++++++++++++++-
 include/linux/iomap.h |  1 +
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 93ea1d529aa3..f4b895fc632d 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -1182,6 +1182,8 @@ static int gfs2_iomap_end(struct inode *inode, loff_t pos, loff_t length,
 
 	if (ip->i_qadata && ip->i_qadata->qa_qd_num)
 		gfs2_quota_unlock(ip);
+	if (iomap->flags & IOMAP_F_SIZE_CHANGED)
+		mark_inode_dirty(inode);
 	gfs2_write_unlock(inode);
 
 out:
diff --git a/fs/iomap.c b/fs/iomap.c
index 12654c2e78f8..97569064faaa 100644
--- a/fs/iomap.c
+++ b/fs/iomap.c
@@ -777,6 +777,7 @@ iomap_write_end(struct inode *inode, loff_t pos, unsigned len,
 		unsigned copied, struct page *page, struct iomap *iomap)
 {
 	const struct iomap_page_ops *page_ops = iomap->page_ops;
+	loff_t old_size = inode->i_size;
 	int ret;
 
 	if (iomap->type == IOMAP_INLINE) {
@@ -788,7 +789,19 @@ iomap_write_end(struct inode *inode, loff_t pos, unsigned len,
 		ret = __iomap_write_end(inode, pos, len, copied, page, iomap);
 	}
 
-	__generic_write_end(inode, pos, ret, page);
+	/*
+	 * Update the in-memory inode size after copying the data into the page
+	 * cache.  It's up to the file system to write the updated size to disk,
+	 * preferably after I/O completion so that no stale data is exposed.
+	 */
+	if (pos + ret > old_size) {
+		i_size_write(inode, pos + ret);
+		iomap->flags |= IOMAP_F_SIZE_CHANGED;
+	}
+	unlock_page(page);
+
+	if (old_size < pos)
+		pagecache_isize_extended(inode, old_size, pos);
 	if (page_ops && page_ops->page_done)
 		page_ops->page_done(inode, pos, copied, page, iomap);
 	put_page(page);
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index 2103b94cb1bf..1df9ea187a9a 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -35,6 +35,7 @@ struct vm_fault;
 #define IOMAP_F_NEW		0x01	/* blocks have been newly allocated */
 #define IOMAP_F_DIRTY		0x02	/* uncommitted metadata */
 #define IOMAP_F_BUFFER_HEAD	0x04	/* file system requires buffer heads */
+#define IOMAP_F_SIZE_CHANGED	0x08	/* file size has changed */
 
 /*
  * Flags that only need to be reported for IOMAP_REPORT requests:
-- 
2.20.1

