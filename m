Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CF96377F
	for <lists+cluster-devel@lfdr.de>; Tue,  9 Jul 2019 16:09:27 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1AC2F3179162;
	Tue,  9 Jul 2019 14:09:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B57088E07;
	Tue,  9 Jul 2019 14:09:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 76E5F206D1;
	Tue,  9 Jul 2019 14:09:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x69E7UmF016105 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 9 Jul 2019 10:07:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 03050831D6; Tue,  9 Jul 2019 14:07:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.205.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 06588831B7;
	Tue,  9 Jul 2019 14:07:26 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Tue,  9 Jul 2019 16:06:52 +0200
Message-Id: <20190709140657.19064-14-agruenba@redhat.com>
In-Reply-To: <20190709140657.19064-1-agruenba@redhat.com>
References: <20190709140657.19064-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: Christoph Hellwig <hch@lst.de>
Subject: [Cluster-devel] [GFS2 PATCH 13/18] gfs2: merge gfs2_writeback_aops
	and gfs2_ordered_aops
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Tue, 09 Jul 2019 14:09:26 +0000 (UTC)

From: Christoph Hellwig <hch@lst.de>

The only difference between the two is that gfs2_ordered_aops sets the
set_page_dirty method to __set_page_dirty_buffers, but given that
__set_page_dirty_buffers is the default, if no method is set, there is no need
to to do that.  Merge the two sets of operations into one.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/aops.c | 28 +++-------------------------
 1 file changed, 3 insertions(+), 25 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index d82b919ce70f..210e4a8d4e7b 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -847,7 +847,7 @@ int gfs2_releasepage(struct page *page, gfp_t gfp_mask)
 	return 0;
 }
 
-static const struct address_space_operations gfs2_writeback_aops = {
+static const struct address_space_operations gfs2_aops = {
 	.writepage = gfs2_writepage,
 	.writepages = gfs2_writepages,
 	.readpage = gfs2_readpage,
@@ -861,21 +861,6 @@ static const struct address_space_operations gfs2_writeback_aops = {
 	.error_remove_page = generic_error_remove_page,
 };
 
-static const struct address_space_operations gfs2_ordered_aops = {
-	.writepage = gfs2_writepage,
-	.writepages = gfs2_writepages,
-	.readpage = gfs2_readpage,
-	.readpages = gfs2_readpages,
-	.set_page_dirty = __set_page_dirty_buffers,
-	.bmap = gfs2_bmap,
-	.invalidatepage = gfs2_invalidatepage,
-	.releasepage = gfs2_releasepage,
-	.direct_IO = noop_direct_IO,
-	.migratepage = buffer_migrate_page,
-	.is_partially_uptodate = block_is_partially_uptodate,
-	.error_remove_page = generic_error_remove_page,
-};
-
 static const struct address_space_operations gfs2_jdata_aops = {
 	.writepage = gfs2_jdata_writepage,
 	.writepages = gfs2_jdata_writepages,
@@ -891,15 +876,8 @@ static const struct address_space_operations gfs2_jdata_aops = {
 
 void gfs2_set_aops(struct inode *inode)
 {
-	struct gfs2_inode *ip = GFS2_I(inode);
-	struct gfs2_sbd *sdp = GFS2_SB(inode);
-
-	if (gfs2_is_jdata(ip))
+	if (gfs2_is_jdata(GFS2_I(inode)))
 		inode->i_mapping->a_ops = &gfs2_jdata_aops;
-	else if (gfs2_is_writeback(sdp))
-		inode->i_mapping->a_ops = &gfs2_writeback_aops;
-	else if (gfs2_is_ordered(sdp))
-		inode->i_mapping->a_ops = &gfs2_ordered_aops;
 	else
-		BUG();
+		inode->i_mapping->a_ops = &gfs2_aops;
 }
-- 
2.20.1

