Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2374F5635
	for <lists+cluster-devel@lfdr.de>; Wed,  6 Apr 2022 08:23:28 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-168-IopMzSenMHaEL0F7o5TznQ-1; Wed, 06 Apr 2022 02:23:23 -0400
X-MC-Unique: IopMzSenMHaEL0F7o5TznQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E865800B28;
	Wed,  6 Apr 2022 06:23:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7285A2024CAE;
	Wed,  6 Apr 2022 06:23:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2AD5B194036C;
	Wed,  6 Apr 2022 06:23:22 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 647AB19451F3 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  6 Apr 2022 06:23:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 574AA2026D64; Wed,  6 Apr 2022 06:23:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 510132026985
 for <cluster-devel@redhat.com>; Wed,  6 Apr 2022 06:23:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3AFA729DD9A6
 for <cluster-devel@redhat.com>; Wed,  6 Apr 2022 06:23:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-TDnItts_Np2v9IDRmLbiBg-1; Wed, 06 Apr 2022 02:23:12 -0400
X-MC-Unique: TDnItts_Np2v9IDRmLbiBg-1
Received: from 213-225-3-188.nat.highway.a1.net ([213.225.3.188]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbyny-003vFI-1v; Wed, 06 Apr 2022 06:06:10 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  6 Apr 2022 08:05:02 +0200
Message-Id: <20220406060516.409838-14-hch@lst.de>
In-Reply-To: <20220406060516.409838-1-hch@lst.de>
References: <20220406060516.409838-1-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: [Cluster-devel] [PATCH 13/27] block: add a bdev_stable_writes helper
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Add a helper to check the stable writes flag based on the block_device
instead of having to poke into the block layer internal request_queue.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/dm-table.c  | 4 +---
 fs/super.c             | 2 +-
 include/linux/blkdev.h | 6 ++++++
 mm/swapfile.c          | 2 +-
 4 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index 5e38d0dd009d5..d46839faa0ca5 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -1950,9 +1950,7 @@ static int device_requires_stable_pages(struct dm_target *ti,
 					struct dm_dev *dev, sector_t start,
 					sector_t len, void *data)
 {
-	struct request_queue *q = bdev_get_queue(dev->bdev);
-
-	return blk_queue_stable_writes(q);
+	return bdev_stable_writes(dev->bdev);
 }
 
 int dm_table_set_restrictions(struct dm_table *t, struct request_queue *q,
diff --git a/fs/super.c b/fs/super.c
index f1d4a193602d6..60f57c7bc0a69 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -1204,7 +1204,7 @@ static int set_bdev_super(struct super_block *s, void *data)
 	s->s_dev = s->s_bdev->bd_dev;
 	s->s_bdi = bdi_get(s->s_bdev->bd_disk->bdi);
 
-	if (blk_queue_stable_writes(s->s_bdev->bd_disk->queue))
+	if (bdev_stable_writes(s->s_bdev))
 		s->s_iflags |= SB_I_STABLE_WRITES;
 	return 0;
 }
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 075b16d4560e7..a433798c3343e 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1330,6 +1330,12 @@ static inline bool bdev_nonrot(struct block_device *bdev)
 	return blk_queue_nonrot(bdev_get_queue(bdev));
 }
 
+static inline bool bdev_stable_writes(struct block_device *bdev)
+{
+	return test_bit(QUEUE_FLAG_STABLE_WRITES,
+			&bdev_get_queue(bdev)->queue_flags);
+}
+
 static inline bool bdev_write_cache(struct block_device *bdev)
 {
 	return test_bit(QUEUE_FLAG_WC, &bdev_get_queue(bdev)->queue_flags);
diff --git a/mm/swapfile.c b/mm/swapfile.c
index d5ab7ec4d92ca..4069f17a82c8e 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -3065,7 +3065,7 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 		goto bad_swap_unlock_inode;
 	}
 
-	if (p->bdev && blk_queue_stable_writes(p->bdev->bd_disk->queue))
+	if (p->bdev && bdev_stable_writes(p->bdev))
 		p->flags |= SWP_STABLE_WRITES;
 
 	if (p->bdev && p->bdev->bd_disk->fops->rw_page)
-- 
2.30.2

