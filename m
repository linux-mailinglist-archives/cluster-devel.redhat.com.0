Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC715C552
	for <lists+cluster-devel@lfdr.de>; Mon,  1 Jul 2019 23:56:06 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 30396C0495A1;
	Mon,  1 Jul 2019 21:56:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 189F64CD;
	Mon,  1 Jul 2019 21:56:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ED058206D1;
	Mon,  1 Jul 2019 21:56:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x61Lu1wB007651 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 1 Jul 2019 17:56:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 270441001E71; Mon,  1 Jul 2019 21:56:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9A261001B14;
	Mon,  1 Jul 2019 21:55:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 933B12E95A2;
	Mon,  1 Jul 2019 21:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4KIFr9ZHaCXhARbl88sQ7wGpF7jLnr+OvF2cM11W+Cg=;
	b=OlFVQPNusbwK/Nvp5DbR6/I2YN
	aswjM2ty93qtjPSyCPr47h6qUEwC+zylWdK9/xoEkY6G0Aa01yirnPMZZTLMuLOpgptqln6SE/hcE
	3UOxIHALSCayu4h5WY85lbZYpJwtZUTBUAR0uaeW/uO67Qkbe0ryGag29o11Ij+VW5IP7X3iJqiSU
	13ih+jizQhMlv0oYPdq1Ab/ZxBjMBoHG9VB5bWfOHt5XeMwxWwFDpF7X1xD6YUOTXpKhXmT+1JuSJ
	3XVCANi8BUUKWEMYY0fIe+8UjhHvFyjK3/kWvJc7EwRJq8idXfL+/qxSGMbGx8KNN6zQ3dWtIRd9W
	bQ4Z6X6w==;
Received: from [38.98.37.141] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1hi4H7-0001oq-Ie; Mon, 01 Jul 2019 21:55:50 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon,  1 Jul 2019 23:54:32 +0200
Message-Id: <20190701215439.19162-9-hch@lst.de>
In-Reply-To: <20190701215439.19162-1-hch@lst.de>
References: <20190701215439.19162-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.29]); Mon, 01 Jul 2019 21:55:50 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Mon, 01 Jul 2019 21:55:50 +0000 (UTC) for IP:'198.137.202.133'
	DOMAIN:'bombadil.infradead.org' HELO:'bombadil.infradead.org'
	FROM:'BATV+bb02ddf78a79a38d855c+5790+infradead.org+hch@bombadil.srs.infradead.org'
	RCPT:''
X-RedHat-Spam-Score: -2.297  (DKIM_SIGNED, DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 198.137.202.133 bombadil.infradead.org 198.137.202.133
	bombadil.infradead.org
	<BATV+bb02ddf78a79a38d855c+5790+infradead.org+hch@bombadil.srs.infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	cluster-devel@redhat.com, "Darrick J . Wong" <darrick.wong@oracle.com>
Subject: [Cluster-devel] [PATCH 08/15] gfs2: remove the unused
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Mon, 01 Jul 2019 21:56:05 +0000 (UTC)

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/gfs2/aops.c | 41 -----------------------------------------
 fs/gfs2/aops.h |  3 ---
 2 files changed, 44 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index abeac61cfed3..3c58b40c93eb 100644
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

