Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 480864F5632
	for <lists+cluster-devel@lfdr.de>; Wed,  6 Apr 2022 08:23:23 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-404-Mew4xTjUP6KotrxS9bBE9Q-1; Wed, 06 Apr 2022 02:23:17 -0400
X-MC-Unique: Mew4xTjUP6KotrxS9bBE9Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67E073802ACB;
	Wed,  6 Apr 2022 06:23:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 57A362026D64;
	Wed,  6 Apr 2022 06:23:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 09286194036C;
	Wed,  6 Apr 2022 06:23:16 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B988E1947BBB for <cluster-devel@listman.corp.redhat.com>;
 Wed,  6 Apr 2022 06:23:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9A5AE40C1241; Wed,  6 Apr 2022 06:23:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 96155403D17F
 for <cluster-devel@redhat.com>; Wed,  6 Apr 2022 06:23:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 77DC7811E75
 for <cluster-devel@redhat.com>; Wed,  6 Apr 2022 06:23:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-ilZLnvkGO2WVp7mES5P9wA-1; Wed, 06 Apr 2022 02:23:13 -0400
X-MC-Unique: ilZLnvkGO2WVp7mES5P9wA-1
Received: from 213-225-3-188.nat.highway.a1.net ([213.225.3.188]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbynm-003v6R-De; Wed, 06 Apr 2022 06:05:58 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  6 Apr 2022 08:04:59 +0200
Message-Id: <20220406060516.409838-11-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: [Cluster-devel] [PATCH 10/27] block: add a bdev_nonrot helper
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

Add a helper to check the nonrot flag based on the block_device instead
of having to poke into the block layer internal request_queue.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/ioctl.c                       | 2 +-
 drivers/block/loop.c                | 2 +-
 drivers/md/dm-table.c               | 4 +---
 drivers/md/md.c                     | 3 +--
 drivers/md/raid1.c                  | 2 +-
 drivers/md/raid10.c                 | 2 +-
 drivers/md/raid5.c                  | 2 +-
 drivers/target/target_core_file.c   | 3 +--
 drivers/target/target_core_iblock.c | 2 +-
 fs/btrfs/volumes.c                  | 4 ++--
 fs/ext4/mballoc.c                   | 2 +-
 include/linux/blkdev.h              | 5 +++++
 mm/swapfile.c                       | 4 ++--
 13 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/block/ioctl.c b/block/ioctl.c
index 4a86340133e46..ad3771b268b81 100644
--- a/block/ioctl.c
+++ b/block/ioctl.c
@@ -489,7 +489,7 @@ static int blkdev_common_ioctl(struct block_device *bdev, fmode_t mode,
 				    queue_max_sectors(bdev_get_queue(bdev)));
 		return put_ushort(argp, max_sectors);
 	case BLKROTATIONAL:
-		return put_ushort(argp, !blk_queue_nonrot(bdev_get_queue(bdev)));
+		return put_ushort(argp, !bdev_nonrot(bdev));
 	case BLKRASET:
 	case BLKFRASET:
 		if(!capable(CAP_SYS_ADMIN))
diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index a58595f5ee2c8..8d800d46e4985 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -903,7 +903,7 @@ static void loop_update_rotational(struct loop_device *lo)
 
 	/* not all filesystems (e.g. tmpfs) have a sb->s_bdev */
 	if (file_bdev)
-		nonrot = blk_queue_nonrot(bdev_get_queue(file_bdev));
+		nonrot = bdev_nonrot(file_bdev);
 
 	if (nonrot)
 		blk_queue_flag_set(QUEUE_FLAG_NONROT, q);
diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index 03541cfc2317c..5e38d0dd009d5 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -1820,9 +1820,7 @@ static int device_dax_write_cache_enabled(struct dm_target *ti,
 static int device_is_rotational(struct dm_target *ti, struct dm_dev *dev,
 				sector_t start, sector_t len, void *data)
 {
-	struct request_queue *q = bdev_get_queue(dev->bdev);
-
-	return !blk_queue_nonrot(q);
+	return !bdev_nonrot(dev->bdev);
 }
 
 static int device_is_not_random(struct dm_target *ti, struct dm_dev *dev,
diff --git a/drivers/md/md.c b/drivers/md/md.c
index 309b3af906ad3..19636c2f2cda4 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -5991,8 +5991,7 @@ int md_run(struct mddev *mddev)
 		bool nonrot = true;
 
 		rdev_for_each(rdev, mddev) {
-			if (rdev->raid_disk >= 0 &&
-			    !blk_queue_nonrot(bdev_get_queue(rdev->bdev))) {
+			if (rdev->raid_disk >= 0 && !bdev_nonrot(rdev->bdev)) {
 				nonrot = false;
 				break;
 			}
diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
index 99d5464a51f81..d81b896855f9f 100644
--- a/drivers/md/raid1.c
+++ b/drivers/md/raid1.c
@@ -704,7 +704,7 @@ static int read_balance(struct r1conf *conf, struct r1bio *r1_bio, int *max_sect
 			/* At least two disks to choose from so failfast is OK */
 			set_bit(R1BIO_FailFast, &r1_bio->state);
 
-		nonrot = blk_queue_nonrot(bdev_get_queue(rdev->bdev));
+		nonrot = bdev_nonrot(rdev->bdev);
 		has_nonrot_disk |= nonrot;
 		pending = atomic_read(&rdev->nr_pending);
 		dist = abs(this_sector - conf->mirrors[disk].head_position);
diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
index dfe7d62d3fbdd..7816c8b2e8087 100644
--- a/drivers/md/raid10.c
+++ b/drivers/md/raid10.c
@@ -796,7 +796,7 @@ static struct md_rdev *read_balance(struct r10conf *conf,
 		if (!do_balance)
 			break;
 
-		nonrot = blk_queue_nonrot(bdev_get_queue(rdev->bdev));
+		nonrot = bdev_nonrot(rdev->bdev);
 		has_nonrot_disk |= nonrot;
 		pending = atomic_read(&rdev->nr_pending);
 		if (min_pending > pending && nonrot) {
diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
index 351d341a1ffa4..0bbae0e638666 100644
--- a/drivers/md/raid5.c
+++ b/drivers/md/raid5.c
@@ -7242,7 +7242,7 @@ static struct r5conf *setup_conf(struct mddev *mddev)
 	rdev_for_each(rdev, mddev) {
 		if (test_bit(Journal, &rdev->flags))
 			continue;
-		if (blk_queue_nonrot(bdev_get_queue(rdev->bdev))) {
+		if (bdev_nonrot(rdev->bdev)) {
 			conf->batch_bio_dispatch = false;
 			break;
 		}
diff --git a/drivers/target/target_core_file.c b/drivers/target/target_core_file.c
index 8d191fdc33217..b6ba582b06775 100644
--- a/drivers/target/target_core_file.c
+++ b/drivers/target/target_core_file.c
@@ -135,7 +135,6 @@ static int fd_configure_device(struct se_device *dev)
 	inode = file->f_mapping->host;
 	if (S_ISBLK(inode->i_mode)) {
 		struct block_device *bdev = I_BDEV(inode);
-		struct request_queue *q = bdev_get_queue(bdev);
 		unsigned long long dev_size;
 
 		fd_dev->fd_block_size = bdev_logical_block_size(bdev);
@@ -160,7 +159,7 @@ static int fd_configure_device(struct se_device *dev)
 		 */
 		dev->dev_attrib.max_write_same_len = 0xFFFF;
 
-		if (blk_queue_nonrot(q))
+		if (bdev_nonrot(bdev))
 			dev->dev_attrib.is_nonrot = 1;
 	} else {
 		if (!(fd_dev->fbd_flags & FBDF_HAS_SIZE)) {
diff --git a/drivers/target/target_core_iblock.c b/drivers/target/target_core_iblock.c
index b886ce1770bfd..b41ee5c3b5b82 100644
--- a/drivers/target/target_core_iblock.c
+++ b/drivers/target/target_core_iblock.c
@@ -133,7 +133,7 @@ static int iblock_configure_device(struct se_device *dev)
 	else
 		dev->dev_attrib.max_write_same_len = 0xFFFF;
 
-	if (blk_queue_nonrot(q))
+	if (bdev_nonrot(bd))
 		dev->dev_attrib.is_nonrot = 1;
 
 	bi = bdev_get_integrity(bd);
diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
index 1be7cb2f955fc..1e68674e2cd82 100644
--- a/fs/btrfs/volumes.c
+++ b/fs/btrfs/volumes.c
@@ -643,7 +643,7 @@ static int btrfs_open_one_device(struct btrfs_fs_devices *fs_devices,
 			set_bit(BTRFS_DEV_STATE_WRITEABLE, &device->dev_state);
 	}
 
-	if (!blk_queue_nonrot(bdev_get_queue(bdev)))
+	if (!bdev_nonrot(bdev))
 		fs_devices->rotating = true;
 
 	device->bdev = bdev;
@@ -2715,7 +2715,7 @@ int btrfs_init_new_device(struct btrfs_fs_info *fs_info, const char *device_path
 
 	atomic64_add(device->total_bytes, &fs_info->free_chunk_space);
 
-	if (!blk_queue_nonrot(bdev_get_queue(bdev)))
+	if (!bdev_nonrot(bdev))
 		fs_devices->rotating = true;
 
 	orig_super_total_bytes = btrfs_super_total_bytes(fs_info->super_copy);
diff --git a/fs/ext4/mballoc.c b/fs/ext4/mballoc.c
index 252c168454c7f..c3668c977cd99 100644
--- a/fs/ext4/mballoc.c
+++ b/fs/ext4/mballoc.c
@@ -3498,7 +3498,7 @@ int ext4_mb_init(struct super_block *sb)
 		spin_lock_init(&lg->lg_prealloc_lock);
 	}
 
-	if (blk_queue_nonrot(bdev_get_queue(sb->s_bdev)))
+	if (bdev_nonrot(sb->s_bdev))
 		sbi->s_mb_max_linear_groups = 0;
 	else
 		sbi->s_mb_max_linear_groups = MB_DEFAULT_LINEAR_LIMIT;
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 60d0161389971..3a9578e14a6b0 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1326,6 +1326,11 @@ static inline unsigned int bdev_write_zeroes_sectors(struct block_device *bdev)
 	return 0;
 }
 
+static inline bool bdev_nonrot(struct block_device *bdev)
+{
+	return blk_queue_nonrot(bdev_get_queue(bdev));
+}
+
 static inline enum blk_zoned_model bdev_zoned_model(struct block_device *bdev)
 {
 	struct request_queue *q = bdev_get_queue(bdev);
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 4c7537162af5e..d5ab7ec4d92ca 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -2466,7 +2466,7 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 	if (p->flags & SWP_CONTINUED)
 		free_swap_count_continuations(p);
 
-	if (!p->bdev || !blk_queue_nonrot(bdev_get_queue(p->bdev)))
+	if (!p->bdev || !bdev_nonrot(p->bdev))
 		atomic_dec(&nr_rotate_swap);
 
 	mutex_lock(&swapon_mutex);
@@ -3071,7 +3071,7 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 	if (p->bdev && p->bdev->bd_disk->fops->rw_page)
 		p->flags |= SWP_SYNCHRONOUS_IO;
 
-	if (p->bdev && blk_queue_nonrot(bdev_get_queue(p->bdev))) {
+	if (p->bdev && bdev_nonrot(p->bdev)) {
 		int cpu;
 		unsigned long ci, nr_cluster;
 
-- 
2.30.2

