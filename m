Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 723F34FA320
	for <lists+cluster-devel@lfdr.de>; Sat,  9 Apr 2022 06:52:11 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-172-1EHgb7yHPKi1BN1AIN9PkQ-1; Sat, 09 Apr 2022 00:52:06 -0400
X-MC-Unique: 1EHgb7yHPKi1BN1AIN9PkQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D700282B80A;
	Sat,  9 Apr 2022 04:52:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8396B40CF8E8;
	Sat,  9 Apr 2022 04:52:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3CBD7194034C;
	Sat,  9 Apr 2022 04:52:01 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4E55E1940341 for <cluster-devel@listman.corp.redhat.com>;
 Sat,  9 Apr 2022 04:51:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3ECE340CFD0B; Sat,  9 Apr 2022 04:51:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A60D40CFD0A
 for <cluster-devel@redhat.com>; Sat,  9 Apr 2022 04:51:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 20C46811E78
 for <cluster-devel@redhat.com>; Sat,  9 Apr 2022 04:51:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-HdDRubuWNruAhWVz8MrFYA-1; Sat, 09 Apr 2022 00:51:56 -0400
X-MC-Unique: HdDRubuWNruAhWVz8MrFYA-1
Received: from 213-147-167-116.nat.highway.webapn.at ([213.147.167.116]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nd34U-00213P-4I; Sat, 09 Apr 2022 04:51:38 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Sat,  9 Apr 2022 06:50:31 +0200
Message-Id: <20220409045043.23593-16-hch@lst.de>
In-Reply-To: <20220409045043.23593-1-hch@lst.de>
References: <20220409045043.23593-1-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: [Cluster-devel] [PATCH 15/27] block: add a
 bdev_max_zone_append_sectors helper
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
 linux-scsi@vger.kernel.org, Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 cluster-devel@redhat.com, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, linux-um@lists.infradead.org, nbd@other.debian.org,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-raid@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-mmc@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 ntfs3@lists.linux.dev, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Add a helper to check the max supported sectors for zone append based on
the block_device instead of having to poke into the block layer internal
request_queue.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 drivers/nvme/target/zns.c | 3 +--
 fs/zonefs/super.c         | 3 +--
 include/linux/blkdev.h    | 6 ++++++
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/nvme/target/zns.c b/drivers/nvme/target/zns.c
index e34718b095504..82b61acf7a72b 100644
--- a/drivers/nvme/target/zns.c
+++ b/drivers/nvme/target/zns.c
@@ -34,8 +34,7 @@ static int validate_conv_zones_cb(struct blk_zone *z,
 
 bool nvmet_bdev_zns_enable(struct nvmet_ns *ns)
 {
-	struct request_queue *q = ns->bdev->bd_disk->queue;
-	u8 zasl = nvmet_zasl(queue_max_zone_append_sectors(q));
+	u8 zasl = nvmet_zasl(bdev_max_zone_append_sectors(ns->bdev));
 	struct gendisk *bd_disk = ns->bdev->bd_disk;
 	int ret;
 
diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
index 3614c7834007d..7a63807b736c4 100644
--- a/fs/zonefs/super.c
+++ b/fs/zonefs/super.c
@@ -678,13 +678,12 @@ static ssize_t zonefs_file_dio_append(struct kiocb *iocb, struct iov_iter *from)
 	struct inode *inode = file_inode(iocb->ki_filp);
 	struct zonefs_inode_info *zi = ZONEFS_I(inode);
 	struct block_device *bdev = inode->i_sb->s_bdev;
-	unsigned int max;
+	unsigned int max = bdev_max_zone_append_sectors(bdev);
 	struct bio *bio;
 	ssize_t size;
 	int nr_pages;
 	ssize_t ret;
 
-	max = queue_max_zone_append_sectors(bdev_get_queue(bdev));
 	max = ALIGN_DOWN(max << SECTOR_SHIFT, inode->i_sb->s_blocksize);
 	iov_iter_truncate(from, max);
 
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index a433798c3343e..f8c50b77543eb 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1188,6 +1188,12 @@ static inline unsigned int queue_max_zone_append_sectors(const struct request_qu
 	return min(l->max_zone_append_sectors, l->max_sectors);
 }
 
+static inline unsigned int
+bdev_max_zone_append_sectors(struct block_device *bdev)
+{
+	return queue_max_zone_append_sectors(bdev_get_queue(bdev));
+}
+
 static inline unsigned queue_logical_block_size(const struct request_queue *q)
 {
 	int retval = 512;
-- 
2.30.2

