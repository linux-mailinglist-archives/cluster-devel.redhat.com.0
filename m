Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE2B5C557
	for <lists+cluster-devel@lfdr.de>; Mon,  1 Jul 2019 23:56:18 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 91DA1C057F2E;
	Mon,  1 Jul 2019 21:56:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3653A18346;
	Mon,  1 Jul 2019 21:56:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CC3871806B16;
	Mon,  1 Jul 2019 21:56:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x61Lu820007857 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 1 Jul 2019 17:56:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C944A60852; Mon,  1 Jul 2019 21:56:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 69CDD608BA;
	Mon,  1 Jul 2019 21:56:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 88A3A307D96F;
	Mon,  1 Jul 2019 21:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wUN3msfIBmk8ExcsmdUqiIIJacel8TRXGTWr925TWE0=;
	b=S+Jg1ly1bRCvDygJpTrJGAGrGp
	WjxehwcokNW02Vwgt2qJU22suCwA9s1bqCNSlaRMyDkDedXdkOWT2Xp0rq5PKtN6XlCAjW3BDQ1nn
	gw7iVWzUUzn9kvEItbuxrZqu0diq5iVJFAr8/Bntv6fw0b7GR0ZVmehSd6evM+HDwefB/U/5Hy+gL
	qz61AW4JwOCZGin6+E1jcKGDHwuHZMuDOKP4MVL4ry6uSmVFzp6QZKxkViDC4E+XuEfEIAiVwjmlw
	dbQD2nkJNLWIIpckyEgqryYdRA4QZQxc7I1gR5ORr4sKJhPTy1RkeU6a4l2Zc3O1HGDlxvsuykGuT
	8D3QFCHA==;
Received: from [38.98.37.141] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1hi4HE-0001r2-GW; Mon, 01 Jul 2019 21:55:57 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon,  1 Jul 2019 23:54:33 +0200
Message-Id: <20190701215439.19162-10-hch@lst.de>
In-Reply-To: <20190701215439.19162-1-hch@lst.de>
References: <20190701215439.19162-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.48]); Mon, 01 Jul 2019 21:55:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Mon, 01 Jul 2019 21:55:57 +0000 (UTC) for IP:'198.137.202.133'
	DOMAIN:'bombadil.infradead.org' HELO:'bombadil.infradead.org'
	FROM:'BATV+bb02ddf78a79a38d855c+5790+infradead.org+hch@bombadil.srs.infradead.org'
	RCPT:''
X-RedHat-Spam-Score: -2.297  (DKIM_SIGNED, DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 198.137.202.133 bombadil.infradead.org 198.137.202.133
	bombadil.infradead.org
	<BATV+bb02ddf78a79a38d855c+5790+infradead.org+hch@bombadil.srs.infradead.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	cluster-devel@redhat.com, "Darrick J . Wong" <darrick.wong@oracle.com>
Subject: [Cluster-devel] [PATCH 09/15] gfs2: merge gfs2_writeback_aops and
	gfs2_ordered_aops
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Mon, 01 Jul 2019 21:56:17 +0000 (UTC)

The only difference between the two is that gfs2_ordered_aops sets the
set_page_dirty method to __set_page_dirty_buffers, but given that
__set_page_dirty_buffers is the default if no method is set there is
no need to to do that.  Merge the two sets of operations into one.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/gfs2/aops.c | 28 +++-------------------------
 1 file changed, 3 insertions(+), 25 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index 3c58b40c93eb..3b3043332e5a 100644
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

