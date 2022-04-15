Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA3A5023C2
	for <lists+cluster-devel@lfdr.de>; Fri, 15 Apr 2022 07:20:33 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-knn0Veb9PiWi-eBuARw9gg-1; Fri, 15 Apr 2022 01:20:28 -0400
X-MC-Unique: knn0Veb9PiWi-eBuARw9gg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D1DC811E80;
	Fri, 15 Apr 2022 05:20:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 25C6D145830C;
	Fri, 15 Apr 2022 05:20:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AF5ED19451EC;
	Fri, 15 Apr 2022 05:20:25 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6E41C19451EC for <cluster-devel@listman.corp.redhat.com>;
 Fri, 15 Apr 2022 05:20:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5BA2841639C; Fri, 15 Apr 2022 05:20:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 57DB8406794
 for <cluster-devel@redhat.com>; Fri, 15 Apr 2022 05:20:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F4BA811E78
 for <cluster-devel@redhat.com>; Fri, 15 Apr 2022 05:20:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-vvCb76G1PVKw-Qyk_P42Sg-1; Fri, 15 Apr 2022 01:20:22 -0400
X-MC-Unique: vvCb76G1PVKw-Qyk_P42Sg-1
Received: from [2a02:1205:504b:4280:f5dd:42a4:896c:d877] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfDyG-008PgP-Ki; Fri, 15 Apr 2022 04:54:13 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri, 15 Apr 2022 06:52:54 +0200
Message-Id: <20220415045258.199825-24-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: [Cluster-devel] [PATCH 23/27] block: add a bdev_max_discard_sectors
 helper
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
 David Sterba <dsterba@suse.com>, ceph-devel@vger.kernel.org,
 Coly Li <colyli@suse.de>, linux-raid@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>, linux-mmc@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 ntfs3@lists.linux.dev, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a helper to query the number of sectors support per each discard bio
based on the block device and use this helper to stop various places from
poking into the request_queue to see if discard is supported and if so how
much.  This mirrors what is done e.g. for write zeroes as well.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
Acked-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com> [drbd]
Acked-by: Coly Li <colyli@suse.de> [bcache]
Acked-by: David Sterba <dsterba@suse.com> [btrfs]
---
 drivers/block/drbd/drbd_nl.c        | 8 +++++---
 drivers/block/drbd/drbd_receiver.c  | 2 +-
 drivers/block/rnbd/rnbd-srv-dev.h   | 3 +--
 drivers/md/dm-io.c                  | 2 +-
 drivers/target/target_core_device.c | 7 +++----
 fs/f2fs/segment.c                   | 6 ++----
 include/linux/blkdev.h              | 5 +++++
 7 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index 4d00986d6f588..a0a06e238e917 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -1439,7 +1439,8 @@ static bool write_ordering_changed(struct disk_conf *a, struct disk_conf *b)
 static void sanitize_disk_conf(struct drbd_device *device, struct disk_conf *disk_conf,
 			       struct drbd_backing_dev *nbc)
 {
-	struct request_queue * const q = nbc->backing_bdev->bd_disk->queue;
+	struct block_device *bdev = nbc->backing_bdev;
+	struct request_queue *q = bdev->bd_disk->queue;
 
 	if (disk_conf->al_extents < DRBD_AL_EXTENTS_MIN)
 		disk_conf->al_extents = DRBD_AL_EXTENTS_MIN;
@@ -1455,6 +1456,7 @@ static void sanitize_disk_conf(struct drbd_device *device, struct disk_conf *dis
 
 	if (disk_conf->rs_discard_granularity) {
 		int orig_value = disk_conf->rs_discard_granularity;
+		sector_t discard_size = bdev_max_discard_sectors(bdev) << 9;
 		int remainder;
 
 		if (q->limits.discard_granularity > disk_conf->rs_discard_granularity)
@@ -1463,8 +1465,8 @@ static void sanitize_disk_conf(struct drbd_device *device, struct disk_conf *dis
 		remainder = disk_conf->rs_discard_granularity % q->limits.discard_granularity;
 		disk_conf->rs_discard_granularity += remainder;
 
-		if (disk_conf->rs_discard_granularity > q->limits.max_discard_sectors << 9)
-			disk_conf->rs_discard_granularity = q->limits.max_discard_sectors << 9;
+		if (disk_conf->rs_discard_granularity > discard_size)
+			disk_conf->rs_discard_granularity = discard_size;
 
 		if (disk_conf->rs_discard_granularity != orig_value)
 			drbd_info(device, "rs_discard_granularity changed to %d\n",
diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 08da922f81d1d..0b4c7de463989 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -1524,7 +1524,7 @@ int drbd_issue_discard_or_zero_out(struct drbd_device *device, sector_t start, u
 	granularity = max(q->limits.discard_granularity >> 9, 1U);
 	alignment = (bdev_discard_alignment(bdev) >> 9) % granularity;
 
-	max_discard_sectors = min(q->limits.max_discard_sectors, (1U << 22));
+	max_discard_sectors = min(bdev_max_discard_sectors(bdev), (1U << 22));
 	max_discard_sectors -= max_discard_sectors % granularity;
 	if (unlikely(!max_discard_sectors))
 		goto zero_out;
diff --git a/drivers/block/rnbd/rnbd-srv-dev.h b/drivers/block/rnbd/rnbd-srv-dev.h
index 2c3df02b5e8ec..f82fbb4bbda8e 100644
--- a/drivers/block/rnbd/rnbd-srv-dev.h
+++ b/drivers/block/rnbd/rnbd-srv-dev.h
@@ -52,8 +52,7 @@ static inline int rnbd_dev_get_max_discard_sects(const struct rnbd_dev *dev)
 	if (!blk_queue_discard(bdev_get_queue(dev->bdev)))
 		return 0;
 
-	return blk_queue_get_max_sectors(bdev_get_queue(dev->bdev),
-					 REQ_OP_DISCARD);
+	return bdev_max_discard_sectors(dev->bdev);
 }
 
 static inline int rnbd_dev_get_discard_granularity(const struct rnbd_dev *dev)
diff --git a/drivers/md/dm-io.c b/drivers/md/dm-io.c
index 5762366333a27..e4b95eaeec8c7 100644
--- a/drivers/md/dm-io.c
+++ b/drivers/md/dm-io.c
@@ -311,7 +311,7 @@ static void do_region(int op, int op_flags, unsigned region,
 	 * Reject unsupported discard and write same requests.
 	 */
 	if (op == REQ_OP_DISCARD)
-		special_cmd_max_sectors = q->limits.max_discard_sectors;
+		special_cmd_max_sectors = bdev_max_discard_sectors(where->bdev);
 	else if (op == REQ_OP_WRITE_ZEROES)
 		special_cmd_max_sectors = q->limits.max_write_zeroes_sectors;
 	if ((op == REQ_OP_DISCARD || op == REQ_OP_WRITE_ZEROES) &&
diff --git a/drivers/target/target_core_device.c b/drivers/target/target_core_device.c
index 16e775bcf4a7c..c3e25bac90d59 100644
--- a/drivers/target/target_core_device.c
+++ b/drivers/target/target_core_device.c
@@ -829,9 +829,8 @@ struct se_device *target_alloc_device(struct se_hba *hba, const char *name)
 }
 
 /*
- * Check if the underlying struct block_device request_queue supports
- * the QUEUE_FLAG_DISCARD bit for UNMAP/WRITE_SAME in SCSI + TRIM
- * in ATA and we need to set TPE=1
+ * Check if the underlying struct block_device supports discard and if yes
+ * configure the UNMAP parameters.
  */
 bool target_configure_unmap_from_queue(struct se_dev_attrib *attrib,
 				       struct block_device *bdev)
@@ -843,7 +842,7 @@ bool target_configure_unmap_from_queue(struct se_dev_attrib *attrib,
 		return false;
 
 	attrib->max_unmap_lba_count =
-		q->limits.max_discard_sectors >> (ilog2(block_size) - 9);
+		bdev_max_discard_sectors(bdev) >> (ilog2(block_size) - 9);
 	/*
 	 * Currently hardcoded to 1 in Linux/SCSI code..
 	 */
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 22dfeb9915290..71f09adbcba86 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1196,9 +1196,8 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
 						unsigned int *issued)
 {
 	struct block_device *bdev = dc->bdev;
-	struct request_queue *q = bdev_get_queue(bdev);
 	unsigned int max_discard_blocks =
-			SECTOR_TO_BLOCK(q->limits.max_discard_sectors);
+			SECTOR_TO_BLOCK(bdev_max_discard_sectors(bdev));
 	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
 	struct list_head *wait_list = (dpolicy->type == DPOLICY_FSTRIM) ?
 					&(dcc->fstrim_list) : &(dcc->wait_list);
@@ -1375,9 +1374,8 @@ static void __update_discard_tree_range(struct f2fs_sb_info *sbi,
 	struct discard_cmd *dc;
 	struct discard_info di = {0};
 	struct rb_node **insert_p = NULL, *insert_parent = NULL;
-	struct request_queue *q = bdev_get_queue(bdev);
 	unsigned int max_discard_blocks =
-			SECTOR_TO_BLOCK(q->limits.max_discard_sectors);
+			SECTOR_TO_BLOCK(bdev_max_discard_sectors(bdev));
 	block_t end = lstart + len;
 
 	dc = (struct discard_cmd *)f2fs_lookup_rb_tree_ret(&dcc->root,
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 34b1cfd067421..ce16247d3afab 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1254,6 +1254,11 @@ bdev_zone_write_granularity(struct block_device *bdev)
 int bdev_alignment_offset(struct block_device *bdev);
 unsigned int bdev_discard_alignment(struct block_device *bdev);
 
+static inline unsigned int bdev_max_discard_sectors(struct block_device *bdev)
+{
+	return bdev_get_queue(bdev)->limits.max_discard_sectors;
+}
+
 static inline unsigned int bdev_write_zeroes_sectors(struct block_device *bdev)
 {
 	struct request_queue *q = bdev_get_queue(bdev);
-- 
2.30.2

