Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E2E5C562
	for <lists+cluster-devel@lfdr.de>; Mon,  1 Jul 2019 23:56:46 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 360872F8BE5;
	Mon,  1 Jul 2019 21:56:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2045C422C;
	Mon,  1 Jul 2019 21:56:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0458C206D2;
	Mon,  1 Jul 2019 21:56:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x61LuguD008946 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 1 Jul 2019 17:56:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 66E28D1F8; Mon,  1 Jul 2019 21:56:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2140F18945;
	Mon,  1 Jul 2019 21:56:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0CF9D804F2;
	Mon,  1 Jul 2019 21:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MaH24b8xJDTj3Al9vqh9CsCx+cmy0ROZOe+AR4Iw4xw=;
	b=KLAOwSXvaZ3Tem/14IqmkfbGCw
	5PMDrMuNOcC+JnHpXlaUoJFTlr8FEHG3xXmDFjX90g59a7QUZ6lXV0WEtlFv2hFqJv6w6z1b6/jlk
	gs8TaAoj6rr7Q2CMOUCJNF6R7KVeiWD7AHRIE6zLV5CfFLfOb5wXDm3k/R/cSY0tHL0fiGZwUZg7Y
	ihAvMqReoiPnUnu9e/D8UvKLN2COuD9L+KBXL+w7I+A20/wH1nUWwBMzGufC27R7fdjQXd2vs7lR2
	xVORzyt/k1FikKYEN6T5t1oP6DEM397xO0fAHIPbkBEexVgi+UMKLKVpAszQpy26CMKfwsqQ93s5u
	9YooNc6Q==;
Received: from [38.98.37.141] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1hi4Hn-0001wQ-TN; Mon, 01 Jul 2019 21:56:32 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon,  1 Jul 2019 23:54:38 +0200
Message-Id: <20190701215439.19162-15-hch@lst.de>
In-Reply-To: <20190701215439.19162-1-hch@lst.de>
References: <20190701215439.19162-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.27]); Mon, 01 Jul 2019 21:56:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Mon, 01 Jul 2019 21:56:33 +0000 (UTC) for IP:'198.137.202.133'
	DOMAIN:'bombadil.infradead.org' HELO:'bombadil.infradead.org'
	FROM:'BATV+bb02ddf78a79a38d855c+5790+infradead.org+hch@bombadil.srs.infradead.org'
	RCPT:''
X-RedHat-Spam-Score: -2.297  (DKIM_SIGNED, DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 198.137.202.133 bombadil.infradead.org 198.137.202.133
	bombadil.infradead.org
	<BATV+bb02ddf78a79a38d855c+5790+infradead.org+hch@bombadil.srs.infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	cluster-devel@redhat.com, "Darrick J . Wong" <darrick.wong@oracle.com>
Subject: [Cluster-devel] [PATCH 14/15] gfs2: don't use buffer_heads in
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Mon, 01 Jul 2019 21:56:45 +0000 (UTC)

Rewrite gfs2_allocate_page_backing to call gfs2_iomap_get_alloc and
operate on struct iomap directly.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/gfs2/file.c | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 282a4aaab900..8c72e4cecd89 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -379,31 +379,30 @@ static void gfs2_size_hint(struct file *filep, loff_t offset, size_t size)
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

