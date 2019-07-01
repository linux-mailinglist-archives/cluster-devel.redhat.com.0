Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFF95C53D
	for <lists+cluster-devel@lfdr.de>; Mon,  1 Jul 2019 23:55:18 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D87911796;
	Mon,  1 Jul 2019 21:55:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C15393ACC;
	Mon,  1 Jul 2019 21:55:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8C8821806B16;
	Mon,  1 Jul 2019 21:55:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x61Lt8LE006223 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 1 Jul 2019 17:55:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0C06C60C44; Mon,  1 Jul 2019 21:55:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0329A60BF3;
	Mon,  1 Jul 2019 21:55:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C5BFC58E23;
	Mon,  1 Jul 2019 21:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=H5iiLixQpBoYnoSWeGAijoRFuz0TrYtuZ+fjQILjz6Q=;
	b=J/E7EYiXP7KURncHP/I7TaurfZ
	f8GsL8/al9rM/Q8EwPLXDA2wIWiZArHbitOB3/meR60cNhxzSICFR83rjSn3fDx1E6GmPdsFO7Vof
	nfqLZlGtQnJTMEFeQI+Te6u/y9LYIRTvNZWJDWnWiTedsQjsb0Lllp8tierlZyegNzlwSd6boanGl
	Gre2ltK12b/LvSn3e0DN66tElt0ndRrPsuT33Y55e97l/KvzGGILWLwFJpyuEDO+AbhSIxGvX4Fvd
	9reTIFaKBqVdB1iJk48ocLl2h5SwLeXgtt88sk2gtIpJW3LfdpiLY9SBYdgNxkEYh8aMTwYxtufD0
	hJGqPF1w==;
Received: from [38.98.37.141] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1hi4GM-0000Wp-78; Mon, 01 Jul 2019 21:55:03 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon,  1 Jul 2019 23:54:26 +0200
Message-Id: <20190701215439.19162-3-hch@lst.de>
In-Reply-To: <20190701215439.19162-1-hch@lst.de>
References: <20190701215439.19162-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.39]); Mon, 01 Jul 2019 21:55:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Mon, 01 Jul 2019 21:55:03 +0000 (UTC) for IP:'198.137.202.133'
	DOMAIN:'bombadil.infradead.org' HELO:'bombadil.infradead.org'
	FROM:'BATV+bb02ddf78a79a38d855c+5790+infradead.org+hch@bombadil.srs.infradead.org'
	RCPT:''
X-RedHat-Spam-Score: -2.297  (DKIM_SIGNED, DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 198.137.202.133 bombadil.infradead.org 198.137.202.133
	bombadil.infradead.org
	<BATV+bb02ddf78a79a38d855c+5790+infradead.org+hch@bombadil.srs.infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	cluster-devel@redhat.com, "Darrick J . Wong" <darrick.wong@oracle.com>
Subject: [Cluster-devel] [PATCH 02/15] FOLD: iomap: make ->submit_ioend
	optional
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Mon, 01 Jul 2019 21:55:12 +0000 (UTC)

Provide a default end_io handler that comple file systems can override
if they need deferred action.  With that we don't need an submit_ioend
method for simple file systems.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/iomap.c        | 26 +++++++++++++++++++++-----
 fs/xfs/xfs_aops.c | 23 ++++++++++-------------
 2 files changed, 31 insertions(+), 18 deletions(-)

diff --git a/fs/iomap.c b/fs/iomap.c
index ebfff663b2a9..7574f63939cc 100644
--- a/fs/iomap.c
+++ b/fs/iomap.c
@@ -2350,6 +2350,13 @@ iomap_sort_ioends(struct list_head *ioend_list)
 }
 EXPORT_SYMBOL_GPL(iomap_sort_ioends);
 
+static void iomap_writepage_end_bio(struct bio *bio)
+{
+	struct iomap_ioend *ioend = bio->bi_private;
+
+	iomap_finish_ioend(ioend, blk_status_to_errno(bio->bi_status));
+}
+
 /*
  * Submit the bio for an ioend. We are passed an ioend with a bio attached to
  * it, and we submit that bio. The ioend may be used for multiple bio
@@ -2368,14 +2375,23 @@ static int
 iomap_submit_ioend(struct iomap_writepage_ctx *wpc, struct iomap_ioend *ioend,
 		int error)
 {
+	ioend->io_bio->bi_private = ioend;
+	ioend->io_bio->bi_end_io = iomap_writepage_end_bio;
+
 	/*
-	 * If we are failing the IO now, just mark the ioend with an error and
-	 * finish it.  This will run IO completion immediately as there is only
-	 * one reference to the ioend at this point in time.
+	 * File systems can perform actions at submit time and/or override
+	 * the end_io handler here for complex operations like copy on write
+	 * extent manipulation or unwritten extent conversions.
 	 */
-	ioend->io_bio->bi_private = ioend;
-	error = wpc->ops->submit_ioend(ioend, error);
+	if (wpc->ops->submit_ioend)
+		error = wpc->ops->submit_ioend(ioend, error);
 	if (error) {
+		/*
+		 * If we are failing the IO now, just mark the ioend with an
+		 * error and finish it.  This will run IO completion immediately
+		 * as there is only one reference to the ioend at this point in
+		 * time.
+		 */
 		ioend->io_bio->bi_status = errno_to_blk_status(error);
 		bio_endio(ioend->io_bio);
 		return error;
diff --git a/fs/xfs/xfs_aops.c b/fs/xfs/xfs_aops.c
index 0821312a1d11..ac1404bc583c 100644
--- a/fs/xfs/xfs_aops.c
+++ b/fs/xfs/xfs_aops.c
@@ -265,20 +265,14 @@ xfs_end_bio(
 {
 	struct iomap_ioend	*ioend = bio->bi_private;
 	struct xfs_inode	*ip = XFS_I(ioend->io_inode);
-	struct xfs_mount	*mp = ip->i_mount;
 	unsigned long		flags;
 
-	if ((ioend->io_flags & IOMAP_F_SHARED) ||
-	    ioend->io_type == IOMAP_UNWRITTEN ||
-	    ioend->io_private) {
-		spin_lock_irqsave(&ip->i_ioend_lock, flags);
-		if (list_empty(&ip->i_ioend_list))
-			WARN_ON_ONCE(!queue_work(mp->m_unwritten_workqueue,
-						 &ip->i_ioend_work));
-		list_add_tail(&ioend->io_list, &ip->i_ioend_list);
-		spin_unlock_irqrestore(&ip->i_ioend_lock, flags);
-	} else
-		iomap_finish_ioend(ioend, blk_status_to_errno(bio->bi_status));
+	spin_lock_irqsave(&ip->i_ioend_lock, flags);
+	if (list_empty(&ip->i_ioend_list))
+		WARN_ON_ONCE(!queue_work(ip->i_mount->m_unwritten_workqueue,
+					 &ip->i_ioend_work));
+	list_add_tail(&ioend->io_list, &ip->i_ioend_list);
+	spin_unlock_irqrestore(&ip->i_ioend_lock, flags);
 }
 
 /*
@@ -531,7 +525,10 @@ xfs_submit_ioend(
 
 	memalloc_nofs_restore(nofs_flag);
 
-	ioend->io_bio->bi_end_io = xfs_end_bio;
+	if ((ioend->io_flags & IOMAP_F_SHARED) ||
+	    ioend->io_type == IOMAP_UNWRITTEN ||
+	    ioend->io_private)
+		ioend->io_bio->bi_end_io = xfs_end_bio;
 	return status;
 }
 
-- 
2.20.1

