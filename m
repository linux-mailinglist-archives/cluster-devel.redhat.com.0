Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAAD579252
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Jul 2022 07:10:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658207448;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6SOS311H1Kd4/Gu2H0EUF0bA1s5eohvTrKD49zRMxEs=;
	b=YS6FJHUHYOgd0DuXGomLHLyKnybz2Fc6VT5aEDBlyJDWJv0rRRrWDuST1LsAoxrz6qCPpL
	lZnhWp38Nx5Ul7Jq5ggxsPV8SpcHUzd9xTd8VZTJ7dy7xNDGJn/LviaPzAVLqmlZ9x6z9y
	i8aWsS16A+xNjAVgtnx1ii38VTLTysY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-150-SodwOFJlMR-_48wNlnAREw-1; Tue, 19 Jul 2022 01:10:41 -0400
X-MC-Unique: SodwOFJlMR-_48wNlnAREw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 44ADB8039A0;
	Tue, 19 Jul 2022 05:10:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1BF9C18EB7;
	Tue, 19 Jul 2022 05:10:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B9E11194707C;
	Tue, 19 Jul 2022 05:10:39 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6B5061945DA7 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 19 Jul 2022 05:10:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5CF3A1121319; Tue, 19 Jul 2022 05:10:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 591D81121315
 for <cluster-devel@redhat.com>; Tue, 19 Jul 2022 05:10:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E8828041BE
 for <cluster-devel@redhat.com>; Tue, 19 Jul 2022 05:10:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-78-BnbmJNd_MpeOtNZo289deQ-1; Tue, 19 Jul 2022 01:10:31 -0400
X-MC-Unique: BnbmJNd_MpeOtNZo289deQ-1
Received: from 089144198117.atnat0007.highway.a1.net ([89.144.198.117]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1oDebn-004jTi-Qf; Tue, 19 Jul 2022 04:13:20 +0000
From: Christoph Hellwig <hch@lst.de>
To: Bob Peterson <rpeterso@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Naohiro Aota <naohiro.aota@wdc.com>
Date: Tue, 19 Jul 2022 06:13:09 +0200
Message-Id: <20220719041311.709250-3-hch@lst.de>
In-Reply-To: <20220719041311.709250-1-hch@lst.de>
References: <20220719041311.709250-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: [Cluster-devel] [PATCH 2/4] gfs2: remove ->writepage
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: cluster-devel@redhat.com, linux-xfs@vger.kernel.org,
 Johannes Thumshirn <jth@kernel.org>, linux-fsdevel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

->writepage is only used for single page writeback from memory reclaim,
and not called at all for cgroup writeback.  Follow the lead of XFS
and remove ->writepage and rely entirely on ->writepages.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Tested-by: Andreas Gruenbacher <agruenba@redhat.com>
Reviewed-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/aops.c | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index 106e90a365838..0240a1a717f56 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -81,31 +81,6 @@ static int gfs2_get_block_noalloc(struct inode *inode, sector_t lblock,
 	return 0;
 }
 
-/**
- * gfs2_writepage - Write page for writeback mappings
- * @page: The page
- * @wbc: The writeback control
- */
-static int gfs2_writepage(struct page *page, struct writeback_control *wbc)
-{
-	struct inode *inode = page->mapping->host;
-	struct gfs2_inode *ip = GFS2_I(inode);
-	struct gfs2_sbd *sdp = GFS2_SB(inode);
-	struct iomap_writepage_ctx wpc = { };
-
-	if (gfs2_assert_withdraw(sdp, gfs2_glock_is_held_excl(ip->i_gl)))
-		goto out;
-	if (current->journal_info)
-		goto redirty;
-	return iomap_writepage(page, wbc, &wpc, &gfs2_writeback_ops);
-
-redirty:
-	redirty_page_for_writepage(wbc, page);
-out:
-	unlock_page(page);
-	return 0;
-}
-
 /**
  * gfs2_write_jdata_page - gfs2 jdata-specific version of block_write_full_page
  * @page: The page to write
@@ -765,7 +740,6 @@ bool gfs2_release_folio(struct folio *folio, gfp_t gfp_mask)
 }
 
 static const struct address_space_operations gfs2_aops = {
-	.writepage = gfs2_writepage,
 	.writepages = gfs2_writepages,
 	.read_folio = gfs2_read_folio,
 	.readahead = gfs2_readahead,
-- 
2.30.2

