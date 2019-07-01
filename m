Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id DECFB5C556
	for <lists+cluster-devel@lfdr.de>; Mon,  1 Jul 2019 23:56:15 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 802E587630;
	Mon,  1 Jul 2019 21:56:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 69F034CD;
	Mon,  1 Jul 2019 21:56:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4D3A31806B16;
	Mon,  1 Jul 2019 21:56:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x61LuBGt007953 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 1 Jul 2019 17:56:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E98C91DA; Mon,  1 Jul 2019 21:56:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 93E524F80;
	Mon,  1 Jul 2019 21:56:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8F11730C585A;
	Mon,  1 Jul 2019 21:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1cM8rtVZcUoMG4FfS5hdRNZT/XeV1Ea4OU7AC3QMrYU=;
	b=f9wVcCEpxvf4GeNSmzSE4k8bb5
	Zt1mxrYK5Dym7kFxR3L+LPg8z33ZMkEMLGAE8sTcWS1w7F8gM3kT/+hE8r15zfmroeOA50T3k4A/5
	6P0UoMyJEn5wMc+VMkqtgCUqoUF2F8+5f6FYZ3SmnmeczZr1eETt6a4IDVryFc/FiIcZwuWi6pc0Z
	CYwpe4RY+WoHFEASJuEaLLd4CVMgP/uuZ16qYbOQIE2kcCNf1Sx9vuEGBsf0mk/nHhrHBNS4q+YhX
	nUhF7l6Wz2nJoUSQhIcbDu15YMpOPs9K9e1ieMPEcKHey9sMyHVfgQwoPNMYX2jd+sTEQmw1h2k3h
	utlogaNQ==;
Received: from [38.98.37.141] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1hi4HL-0001rw-DX; Mon, 01 Jul 2019 21:56:04 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon,  1 Jul 2019 23:54:34 +0200
Message-Id: <20190701215439.19162-11-hch@lst.de>
In-Reply-To: <20190701215439.19162-1-hch@lst.de>
References: <20190701215439.19162-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.46]); Mon, 01 Jul 2019 21:56:04 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Mon, 01 Jul 2019 21:56:04 +0000 (UTC) for IP:'198.137.202.133'
	DOMAIN:'bombadil.infradead.org' HELO:'bombadil.infradead.org'
	FROM:'BATV+bb02ddf78a79a38d855c+5790+infradead.org+hch@bombadil.srs.infradead.org'
	RCPT:''
X-RedHat-Spam-Score: -2.297  (DKIM_SIGNED, DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 198.137.202.133 bombadil.infradead.org 198.137.202.133
	bombadil.infradead.org
	<BATV+bb02ddf78a79a38d855c+5790+infradead.org+hch@bombadil.srs.infradead.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	cluster-devel@redhat.com, "Darrick J . Wong" <darrick.wong@oracle.com>
Subject: [Cluster-devel] [PATCH 10/15] gfs2: merge gfs2_writepage_common
	into gfs2_writepage
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Mon, 01 Jul 2019 21:56:14 +0000 (UTC)

No need to keep these two functions separate.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/gfs2/aops.c | 32 ++++++--------------------------
 1 file changed, 6 insertions(+), 26 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index 3b3043332e5a..d78b5778fca7 100644
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

