Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 589FA5C561
	for <lists+cluster-devel@lfdr.de>; Mon,  1 Jul 2019 23:56:39 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EC277C00DE0C;
	Mon,  1 Jul 2019 21:56:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D5EF618675;
	Mon,  1 Jul 2019 21:56:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B8CE9206D2;
	Mon,  1 Jul 2019 21:56:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x61LuZch008582 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 1 Jul 2019 17:56:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6B25319C77; Mon,  1 Jul 2019 21:56:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A0D119C6F;
	Mon,  1 Jul 2019 21:56:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1D189308FEC0;
	Mon,  1 Jul 2019 21:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Y10BC0t6LYdDuR0Paviv8ojLBdUiEzyaXmCWCbURS8Y=;
	b=FQflLT91HiucrTUcF7xhTD2jsR
	PLUOd2GhauLG38djRyHMZvHWfvnEhtWqDs5JPUtNezy2ZWS64Sf4UAYjUVC8JYmewCTnyD5xkfMYf
	N0sZpSsRcpWRmwmL/9YvwrpIjIWsmi5yxqZQOVxOxOpMimEKn1lsrpk2Dkw4R/oR74Z/V60qxl90X
	A7pyDM/OgHMfLbSWRmIITXORe1vOwCrpYtKz/wgM85gNNr99evoSDrhyHGFtp4G+h8QZPED5K4ULK
	N/AacfJw4q2rRWYaN39uT32oJGrEwqLRMu3DMJRoXCpbBdHIJJ0nWetsHMpT8F/q3EV0e0O2IhXvF
	ZbWNLcCg==;
Received: from [38.98.37.141] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1hi4Hh-0001vN-0i; Mon, 01 Jul 2019 21:56:25 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon,  1 Jul 2019 23:54:37 +0200
Message-Id: <20190701215439.19162-14-hch@lst.de>
In-Reply-To: <20190701215439.19162-1-hch@lst.de>
References: <20190701215439.19162-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.49]); Mon, 01 Jul 2019 21:56:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Mon, 01 Jul 2019 21:56:26 +0000 (UTC) for IP:'198.137.202.133'
	DOMAIN:'bombadil.infradead.org' HELO:'bombadil.infradead.org'
	FROM:'BATV+bb02ddf78a79a38d855c+5790+infradead.org+hch@bombadil.srs.infradead.org'
	RCPT:''
X-RedHat-Spam-Score: -2.297  (DKIM_SIGNED, DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 198.137.202.133 bombadil.infradead.org 198.137.202.133
	bombadil.infradead.org
	<BATV+bb02ddf78a79a38d855c+5790+infradead.org+hch@bombadil.srs.infradead.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	cluster-devel@redhat.com, "Darrick J . Wong" <darrick.wong@oracle.com>
Subject: [Cluster-devel] [PATCH 13/15] gfs2: implement gfs2_block_zero_range
	using iomap_zero_range
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Mon, 01 Jul 2019 21:56:38 +0000 (UTC)

iomap handles all the nitty-gritty details of zeroing a file
range for us, so use the proper helper.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/gfs2/bmap.c | 68 +-------------------------------------------------
 1 file changed, 1 insertion(+), 67 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 8e8768685264..b7bd811872cb 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -1281,76 +1281,10 @@ int gfs2_extent_map(struct inode *inode, u64 lblock, int *new, u64 *dblock, unsi
 	return ret;
 }
 
-/**
- * gfs2_block_zero_range - Deal with zeroing out data
- *
- * This is partly borrowed from ext3.
- */
 static int gfs2_block_zero_range(struct inode *inode, loff_t from,
 				 unsigned int length)
 {
-	struct address_space *mapping = inode->i_mapping;
-	struct gfs2_inode *ip = GFS2_I(inode);
-	unsigned long index = from >> PAGE_SHIFT;
-	unsigned offset = from & (PAGE_SIZE-1);
-	unsigned blocksize, iblock, pos;
-	struct buffer_head *bh;
-	struct page *page;
-	int err;
-
-	page = find_or_create_page(mapping, index, GFP_NOFS);
-	if (!page)
-		return 0;
-
-	blocksize = inode->i_sb->s_blocksize;
-	iblock = index << (PAGE_SHIFT - inode->i_sb->s_blocksize_bits);
-
-	if (!page_has_buffers(page))
-		create_empty_buffers(page, blocksize, 0);
-
-	/* Find the buffer that contains "offset" */
-	bh = page_buffers(page);
-	pos = blocksize;
-	while (offset >= pos) {
-		bh = bh->b_this_page;
-		iblock++;
-		pos += blocksize;
-	}
-
-	err = 0;
-
-	if (!buffer_mapped(bh)) {
-		gfs2_block_map(inode, iblock, bh, 0);
-		/* unmapped? It's a hole - nothing to do */
-		if (!buffer_mapped(bh))
-			goto unlock;
-	}
-
-	/* Ok, it's mapped. Make sure it's up-to-date */
-	if (PageUptodate(page))
-		set_buffer_uptodate(bh);
-
-	if (!buffer_uptodate(bh)) {
-		err = -EIO;
-		ll_rw_block(REQ_OP_READ, 0, 1, &bh);
-		wait_on_buffer(bh);
-		/* Uhhuh. Read error. Complain and punt. */
-		if (!buffer_uptodate(bh))
-			goto unlock;
-		err = 0;
-	}
-
-	if (gfs2_is_jdata(ip))
-		gfs2_trans_add_data(ip->i_gl, bh);
-	else
-		gfs2_ordered_add_inode(ip);
-
-	zero_user(page, offset, length);
-	mark_buffer_dirty(bh);
-unlock:
-	unlock_page(page);
-	put_page(page);
-	return err;
+	return iomap_zero_range(inode, from, length, NULL, &gfs2_iomap_ops);
 }
 
 #define GFS2_JTRUNC_REVOKES 8192
-- 
2.20.1

