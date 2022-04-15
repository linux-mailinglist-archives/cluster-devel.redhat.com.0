Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BEB5021D4
	for <lists+cluster-devel@lfdr.de>; Fri, 15 Apr 2022 06:54:42 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-135-8yKOUmW-O7GMrXQ5PC6tug-1; Fri, 15 Apr 2022 00:54:37 -0400
X-MC-Unique: 8yKOUmW-O7GMrXQ5PC6tug-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62A3C3800E89;
	Fri, 15 Apr 2022 04:54:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 53B2940D017F;
	Fri, 15 Apr 2022 04:54:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 18A5A1940351;
	Fri, 15 Apr 2022 04:54:36 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CFC61194034B for <cluster-devel@listman.corp.redhat.com>;
 Fri, 15 Apr 2022 04:54:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C20EA2166BA4; Fri, 15 Apr 2022 04:54:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BDD8A2167D6F
 for <cluster-devel@redhat.com>; Fri, 15 Apr 2022 04:54:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C72C1C068F1
 for <cluster-devel@redhat.com>; Fri, 15 Apr 2022 04:54:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299-rcj1zbS6NCutEhdOET7zbQ-1; Fri, 15 Apr 2022 00:54:28 -0400
X-MC-Unique: rcj1zbS6NCutEhdOET7zbQ-1
Received: from [2a02:1205:504b:4280:f5dd:42a4:896c:d877] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfDyR-008Ptb-2k; Fri, 15 Apr 2022 04:54:23 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri, 15 Apr 2022 06:52:58 +0200
Message-Id: <20220415045258.199825-28-hch@lst.de>
In-Reply-To: <20220415045258.199825-1-hch@lst.de>
References: <20220415045258.199825-1-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: [Cluster-devel] [PATCH 27/27] direct-io: remove random prefetches
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
Cc: jfs-discussion@lists.sourceforge.net, linux-nvme@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, drbd-dev@lists.linbit.com,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, cluster-devel@redhat.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 linux-um@lists.infradead.org, nbd@other.debian.org,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-raid@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Randomly poking into block device internals for manual prefetches isn't
exactly a very maintainable thing to do.  And none of the performance
criticil direct I/O implementations still use this library function
anyway, so just drop it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/direct-io.c | 32 ++++----------------------------
 1 file changed, 4 insertions(+), 28 deletions(-)

diff --git a/fs/direct-io.c b/fs/direct-io.c
index aef06e607b405..840752006f601 100644
--- a/fs/direct-io.c
+++ b/fs/direct-io.c
@@ -1115,11 +1115,10 @@ static inline int drop_refcount(struct dio *dio)
  * individual fields and will generate much worse code. This is important
  * for the whole file.
  */
-static inline ssize_t
-do_blockdev_direct_IO(struct kiocb *iocb, struct inode *inode,
-		      struct block_device *bdev, struct iov_iter *iter,
-		      get_block_t get_block, dio_iodone_t end_io,
-		      dio_submit_t submit_io, int flags)
+ssize_t __blockdev_direct_IO(struct kiocb *iocb, struct inode *inode,
+		struct block_device *bdev, struct iov_iter *iter,
+		get_block_t get_block, dio_iodone_t end_io,
+		dio_submit_t submit_io, int flags)
 {
 	unsigned i_blkbits = READ_ONCE(inode->i_blkbits);
 	unsigned blkbits = i_blkbits;
@@ -1334,29 +1333,6 @@ do_blockdev_direct_IO(struct kiocb *iocb, struct inode *inode,
 	kmem_cache_free(dio_cache, dio);
 	return retval;
 }
-
-ssize_t __blockdev_direct_IO(struct kiocb *iocb, struct inode *inode,
-			     struct block_device *bdev, struct iov_iter *iter,
-			     get_block_t get_block,
-			     dio_iodone_t end_io, dio_submit_t submit_io,
-			     int flags)
-{
-	/*
-	 * The block device state is needed in the end to finally
-	 * submit everything.  Since it's likely to be cache cold
-	 * prefetch it here as first thing to hide some of the
-	 * latency.
-	 *
-	 * Attempt to prefetch the pieces we likely need later.
-	 */
-	prefetch(&bdev->bd_disk->part_tbl);
-	prefetch(bdev->bd_disk->queue);
-	prefetch((char *)bdev->bd_disk->queue + SMP_CACHE_BYTES);
-
-	return do_blockdev_direct_IO(iocb, inode, bdev, iter, get_block,
-				     end_io, submit_io, flags);
-}
-
 EXPORT_SYMBOL(__blockdev_direct_IO);
 
 static __init int dio_init(void)
-- 
2.30.2

