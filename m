Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB6363773
	for <lists+cluster-devel@lfdr.de>; Tue,  9 Jul 2019 16:08:41 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8CFFB9FDD7;
	Tue,  9 Jul 2019 14:08:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 77EC15D70D;
	Tue,  9 Jul 2019 14:08:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5AAD1206D3;
	Tue,  9 Jul 2019 14:08:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x69E7XGa016120 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 9 Jul 2019 10:07:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 00360831CE; Tue,  9 Jul 2019 14:07:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.205.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 030C6831B7;
	Tue,  9 Jul 2019 14:07:31 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Tue,  9 Jul 2019 16:06:53 +0200
Message-Id: <20190709140657.19064-15-agruenba@redhat.com>
In-Reply-To: <20190709140657.19064-1-agruenba@redhat.com>
References: <20190709140657.19064-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: Christoph Hellwig <hch@lst.de>
Subject: [Cluster-devel] [GFS2 PATCH 14/18] gfs2: merge
	gfs2_writepage_common into gfs2_writepage
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Tue, 09 Jul 2019 14:08:40 +0000 (UTC)

From: Christoph Hellwig <hch@lst.de>

There is no need to keep these two functions separate.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/aops.c | 32 ++++++--------------------------
 1 file changed, 6 insertions(+), 26 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index 210e4a8d4e7b..4edf917752af 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -82,15 +82,11 @@ static int gfs2_get_block_noalloc(struct inode *inode, sector_t lblock,
 }
 
 /**
- * gfs2_writepage_common - Common bits of writepage
- * @page: The page to be written
+ * gfs2_writepage - Write page for writeback mappings
+ * @page: The page
  * @wbc: The writeback control
- *
- * Returns: 1 if writepage is ok, otherwise an error code or zero if no error.
  */
-
-static int gfs2_writepage_common(struct page *page,
-				 struct writeback_control *wbc)
+static int gfs2_writepage(struct page *page, struct writeback_control *wbc)
 {
 	struct inode *inode = page->mapping->host;
 	struct gfs2_inode *ip = GFS2_I(inode);
@@ -109,7 +105,9 @@ static int gfs2_writepage_common(struct page *page,
 		page->mapping->a_ops->invalidatepage(page, 0, PAGE_SIZE);
 		goto out;
 	}
-	return 1;
+
+	return nobh_writepage(page, gfs2_get_block_noalloc, wbc);
+
 redirty:
 	redirty_page_for_writepage(wbc, page);
 out:
@@ -117,24 +115,6 @@ static int gfs2_writepage_common(struct page *page,
 	return 0;
 }
 
-/**
- * gfs2_writepage - Write page for writeback mappings
- * @page: The page
- * @wbc: The writeback control
- *
- */
-
-static int gfs2_writepage(struct page *page, struct writeback_control *wbc)
-{
-	int ret;
-
-	ret = gfs2_writepage_common(page, wbc);
-	if (ret <= 0)
-		return ret;
-
-	return nobh_writepage(page, gfs2_get_block_noalloc, wbc);
-}
-
 /* This is the same as calling block_write_full_page, but it also
  * writes pages outside of i_size
  */
-- 
2.20.1

