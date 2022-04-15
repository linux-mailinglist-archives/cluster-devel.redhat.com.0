Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4191D5021DF
	for <lists+cluster-devel@lfdr.de>; Fri, 15 Apr 2022 06:54:58 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-ZcHPXO28M1iCJLtzM6lVTA-1; Fri, 15 Apr 2022 00:54:54 -0400
X-MC-Unique: ZcHPXO28M1iCJLtzM6lVTA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8709E3C32B85;
	Fri, 15 Apr 2022 04:54:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 79A48442CBC;
	Fri, 15 Apr 2022 04:54:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 434AB194034D;
	Fri, 15 Apr 2022 04:54:53 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C441919451EC for <cluster-devel@listman.corp.redhat.com>;
 Fri, 15 Apr 2022 04:54:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B3F712024CB6; Fri, 15 Apr 2022 04:54:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE9132024CCB
 for <cluster-devel@redhat.com>; Fri, 15 Apr 2022 04:54:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8A3586B8A1
 for <cluster-devel@redhat.com>; Fri, 15 Apr 2022 04:54:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-381-oiFjQjcgMayjeBLcFzz1EQ-1; Fri, 15 Apr 2022 00:54:36 -0400
X-MC-Unique: oiFjQjcgMayjeBLcFzz1EQ-1
Received: from [2a02:1205:504b:4280:f5dd:42a4:896c:d877] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfDyL-008Pnr-T3; Fri, 15 Apr 2022 04:54:18 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri, 15 Apr 2022 06:52:56 +0200
Message-Id: <20220415045258.199825-26-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: [Cluster-devel] [PATCH 25/27] block: add a bdev_discard_granularity
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
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, linux-raid@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>, linux-mmc@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 ntfs3@lists.linux.dev, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Abstract away implementation details from file systems by providing a
block_device based helper to retrieve the discard granularity.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
Acked-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com> [drbd]
Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Acked-by: David Sterba <dsterba@suse.com> [btrfs]
---
 block/blk-lib.c                     |  5 ++---
 drivers/block/drbd/drbd_nl.c        |  9 +++++----
 drivers/block/drbd/drbd_receiver.c  |  3 +--
 drivers/block/loop.c                |  2 +-
 drivers/target/target_core_device.c |  3 +--
 fs/btrfs/ioctl.c                    | 12 ++++--------
 fs/exfat/file.c                     |  3 +--
 fs/ext4/mballoc.c                   |  6 +++---
 fs/f2fs/file.c                      |  3 +--
 fs/fat/file.c                       |  3 +--
 fs/gfs2/rgrp.c                      |  7 +++----
 fs/jfs/ioctl.c                      |  3 +--
 fs/nilfs2/ioctl.c                   |  4 ++--
 fs/ntfs3/file.c                     |  4 ++--
 fs/ntfs3/super.c                    |  6 ++----
 fs/ocfs2/ioctl.c                    |  3 +--
 fs/xfs/xfs_discard.c                |  4 ++--
 include/linux/blkdev.h              |  5 +++++
 18 files changed, 38 insertions(+), 47 deletions(-)

diff --git a/block/blk-lib.c b/block/blk-lib.c
index 8b4b66d3a9bfc..43aa4d7fe859f 100644
--- a/block/blk-lib.c
+++ b/block/blk-lib.c
@@ -12,8 +12,7 @@
 
 static sector_t bio_discard_limit(struct block_device *bdev, sector_t sector)
 {
-	unsigned int discard_granularity =
-		bdev_get_queue(bdev)->limits.discard_granularity;
+	unsigned int discard_granularity = bdev_discard_granularity(bdev);
 	sector_t granularity_aligned_sector;
 
 	if (bdev_is_partition(bdev))
@@ -59,7 +58,7 @@ int __blkdev_issue_discard(struct block_device *bdev, sector_t sector,
 	}
 
 	/* In case the discard granularity isn't set by buggy device driver */
-	if (WARN_ON_ONCE(!q->limits.discard_granularity)) {
+	if (WARN_ON_ONCE(!bdev_discard_granularity(bdev))) {
 		char dev_name[BDEVNAME_SIZE];
 
 		bdevname(bdev, dev_name);
diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index 0678ceb505799..a6280dcb37679 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -1425,7 +1425,6 @@ static void sanitize_disk_conf(struct drbd_device *device, struct disk_conf *dis
 			       struct drbd_backing_dev *nbc)
 {
 	struct block_device *bdev = nbc->backing_bdev;
-	struct request_queue *q = bdev->bd_disk->queue;
 
 	if (disk_conf->al_extents < DRBD_AL_EXTENTS_MIN)
 		disk_conf->al_extents = DRBD_AL_EXTENTS_MIN;
@@ -1442,12 +1441,14 @@ static void sanitize_disk_conf(struct drbd_device *device, struct disk_conf *dis
 	if (disk_conf->rs_discard_granularity) {
 		int orig_value = disk_conf->rs_discard_granularity;
 		sector_t discard_size = bdev_max_discard_sectors(bdev) << 9;
+		unsigned int discard_granularity = bdev_discard_granularity(bdev);
 		int remainder;
 
-		if (q->limits.discard_granularity > disk_conf->rs_discard_granularity)
-			disk_conf->rs_discard_granularity = q->limits.discard_granularity;
+		if (discard_granularity > disk_conf->rs_discard_granularity)
+			disk_conf->rs_discard_granularity = discard_granularity;
 
-		remainder = disk_conf->rs_discard_granularity % q->limits.discard_granularity;
+		remainder = disk_conf->rs_discard_granularity %
+				discard_granularity;
 		disk_conf->rs_discard_granularity += remainder;
 
 		if (disk_conf->rs_discard_granularity > discard_size)
diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 8a4a47da56fe9..275c53c7b629e 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -1511,7 +1511,6 @@ void drbd_bump_write_ordering(struct drbd_resource *resource, struct drbd_backin
 int drbd_issue_discard_or_zero_out(struct drbd_device *device, sector_t start, unsigned int nr_sectors, int flags)
 {
 	struct block_device *bdev = device->ldev->backing_bdev;
-	struct request_queue *q = bdev_get_queue(bdev);
 	sector_t tmp, nr;
 	unsigned int max_discard_sectors, granularity;
 	int alignment;
@@ -1521,7 +1520,7 @@ int drbd_issue_discard_or_zero_out(struct drbd_device *device, sector_t start, u
 		goto zero_out;
 
 	/* Zero-sector (unknown) and one-sector granularities are the same.  */
-	granularity = max(q->limits.discard_granularity >> 9, 1U);
+	granularity = max(bdev_discard_granularity(bdev) >> 9, 1U);
 	alignment = (bdev_discard_alignment(bdev) >> 9) % granularity;
 
 	max_discard_sectors = min(bdev_max_discard_sectors(bdev), (1U << 22));
diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index 0e061c9896eff..976cf987b3920 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -759,7 +759,7 @@ static void loop_config_discard(struct loop_device *lo)
 		struct request_queue *backingq = bdev_get_queue(I_BDEV(inode));
 
 		max_discard_sectors = backingq->limits.max_write_zeroes_sectors;
-		granularity = backingq->limits.discard_granularity ?:
+		granularity = bdev_discard_granularity(I_BDEV(inode)) ?:
 			queue_physical_block_size(backingq);
 
 	/*
diff --git a/drivers/target/target_core_device.c b/drivers/target/target_core_device.c
index 6cb9f87843278..25f33eb25337c 100644
--- a/drivers/target/target_core_device.c
+++ b/drivers/target/target_core_device.c
@@ -835,7 +835,6 @@ struct se_device *target_alloc_device(struct se_hba *hba, const char *name)
 bool target_configure_unmap_from_queue(struct se_dev_attrib *attrib,
 				       struct block_device *bdev)
 {
-	struct request_queue *q = bdev_get_queue(bdev);
 	int block_size = bdev_logical_block_size(bdev);
 
 	if (!bdev_max_discard_sectors(bdev))
@@ -847,7 +846,7 @@ bool target_configure_unmap_from_queue(struct se_dev_attrib *attrib,
 	 * Currently hardcoded to 1 in Linux/SCSI code..
 	 */
 	attrib->max_unmap_block_desc_count = 1;
-	attrib->unmap_granularity = q->limits.discard_granularity / block_size;
+	attrib->unmap_granularity = bdev_discard_granularity(bdev) / block_size;
 	attrib->unmap_granularity_alignment =
 		bdev_discard_alignment(bdev) / block_size;
 	return true;
diff --git a/fs/btrfs/ioctl.c b/fs/btrfs/ioctl.c
index 096bb0da03f1c..70765d59616a5 100644
--- a/fs/btrfs/ioctl.c
+++ b/fs/btrfs/ioctl.c
@@ -468,7 +468,6 @@ static noinline int btrfs_ioctl_fitrim(struct btrfs_fs_info *fs_info,
 					void __user *arg)
 {
 	struct btrfs_device *device;
-	struct request_queue *q;
 	struct fstrim_range range;
 	u64 minlen = ULLONG_MAX;
 	u64 num_devices = 0;
@@ -498,14 +497,11 @@ static noinline int btrfs_ioctl_fitrim(struct btrfs_fs_info *fs_info,
 	rcu_read_lock();
 	list_for_each_entry_rcu(device, &fs_info->fs_devices->devices,
 				dev_list) {
-		if (!device->bdev)
+		if (!device->bdev || !bdev_max_discard_sectors(device->bdev))
 			continue;
-		q = bdev_get_queue(device->bdev);
-		if (bdev_max_discard_sectors(device->bdev)) {
-			num_devices++;
-			minlen = min_t(u64, q->limits.discard_granularity,
-				     minlen);
-		}
+		num_devices++;
+		minlen = min_t(u64, bdev_discard_granularity(device->bdev),
+				    minlen);
 	}
 	rcu_read_unlock();
 
diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index 765e4f63dd18d..20d4e47f57ab2 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -351,7 +351,6 @@ int exfat_setattr(struct user_namespace *mnt_userns, struct dentry *dentry,
 
 static int exfat_ioctl_fitrim(struct inode *inode, unsigned long arg)
 {
-	struct request_queue *q = bdev_get_queue(inode->i_sb->s_bdev);
 	struct fstrim_range range;
 	int ret = 0;
 
@@ -365,7 +364,7 @@ static int exfat_ioctl_fitrim(struct inode *inode, unsigned long arg)
 		return -EFAULT;
 
 	range.minlen = max_t(unsigned int, range.minlen,
-				q->limits.discard_granularity);
+				bdev_discard_granularity(inode->i_sb->s_bdev));
 
 	ret = exfat_trim_fs(inode, &range);
 	if (ret < 0)
diff --git a/fs/ext4/mballoc.c b/fs/ext4/mballoc.c
index c3668c977cd99..6d1820536d88d 100644
--- a/fs/ext4/mballoc.c
+++ b/fs/ext4/mballoc.c
@@ -6455,7 +6455,7 @@ ext4_trim_all_free(struct super_block *sb, ext4_group_t group,
  */
 int ext4_trim_fs(struct super_block *sb, struct fstrim_range *range)
 {
-	struct request_queue *q = bdev_get_queue(sb->s_bdev);
+	unsigned int discard_granularity = bdev_discard_granularity(sb->s_bdev);
 	struct ext4_group_info *grp;
 	ext4_group_t group, first_group, last_group;
 	ext4_grpblk_t cnt = 0, first_cluster, last_cluster;
@@ -6475,9 +6475,9 @@ int ext4_trim_fs(struct super_block *sb, struct fstrim_range *range)
 	    range->len < sb->s_blocksize)
 		return -EINVAL;
 	/* No point to try to trim less than discard granularity */
-	if (range->minlen < q->limits.discard_granularity) {
+	if (range->minlen < discard_granularity) {
 		minlen = EXT4_NUM_B2C(EXT4_SB(sb),
-			q->limits.discard_granularity >> sb->s_blocksize_bits);
+				discard_granularity >> sb->s_blocksize_bits);
 		if (minlen > EXT4_CLUSTERS_PER_GROUP(sb))
 			goto out;
 	}
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 5b89af0f27f05..8053d99f3920b 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2285,7 +2285,6 @@ static int f2fs_ioc_fitrim(struct file *filp, unsigned long arg)
 {
 	struct inode *inode = file_inode(filp);
 	struct super_block *sb = inode->i_sb;
-	struct request_queue *q = bdev_get_queue(sb->s_bdev);
 	struct fstrim_range range;
 	int ret;
 
@@ -2304,7 +2303,7 @@ static int f2fs_ioc_fitrim(struct file *filp, unsigned long arg)
 		return ret;
 
 	range.minlen = max((unsigned int)range.minlen,
-				q->limits.discard_granularity);
+			   bdev_discard_granularity(sb->s_bdev));
 	ret = f2fs_trim_fs(F2FS_SB(sb), &range);
 	mnt_drop_write_file(filp);
 	if (ret < 0)
diff --git a/fs/fat/file.c b/fs/fat/file.c
index e4c7d10e80129..bf91f977debea 100644
--- a/fs/fat/file.c
+++ b/fs/fat/file.c
@@ -127,7 +127,6 @@ static int fat_ioctl_fitrim(struct inode *inode, unsigned long arg)
 	struct super_block *sb = inode->i_sb;
 	struct fstrim_range __user *user_range;
 	struct fstrim_range range;
-	struct request_queue *q = bdev_get_queue(sb->s_bdev);
 	int err;
 
 	if (!capable(CAP_SYS_ADMIN))
@@ -141,7 +140,7 @@ static int fat_ioctl_fitrim(struct inode *inode, unsigned long arg)
 		return -EFAULT;
 
 	range.minlen = max_t(unsigned int, range.minlen,
-			     q->limits.discard_granularity);
+			     bdev_discard_granularity(sb->s_bdev));
 
 	err = fat_trim_fs(inode, &range);
 	if (err < 0)
diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 7f20ac9133bc6..6d26bb5254844 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -1386,7 +1386,7 @@ int gfs2_fitrim(struct file *filp, void __user *argp)
 {
 	struct inode *inode = file_inode(filp);
 	struct gfs2_sbd *sdp = GFS2_SB(inode);
-	struct request_queue *q = bdev_get_queue(sdp->sd_vfs->s_bdev);
+	struct block_device *bdev = sdp->sd_vfs->s_bdev;
 	struct buffer_head *bh;
 	struct gfs2_rgrpd *rgd;
 	struct gfs2_rgrpd *rgd_end;
@@ -1405,7 +1405,7 @@ int gfs2_fitrim(struct file *filp, void __user *argp)
 	if (!test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags))
 		return -EROFS;
 
-	if (!bdev_max_discard_sectors(sdp->sd_vfs->s_bdev))
+	if (!bdev_max_discard_sectors(bdev))
 		return -EOPNOTSUPP;
 
 	if (copy_from_user(&r, argp, sizeof(r)))
@@ -1418,8 +1418,7 @@ int gfs2_fitrim(struct file *filp, void __user *argp)
 	start = r.start >> bs_shift;
 	end = start + (r.len >> bs_shift);
 	minlen = max_t(u64, r.minlen, sdp->sd_sb.sb_bsize);
-	minlen = max_t(u64, minlen,
-		       q->limits.discard_granularity) >> bs_shift;
+	minlen = max_t(u64, minlen, bdev_discard_granularity(bdev)) >> bs_shift;
 
 	if (end <= start || minlen > sdp->sd_max_rg_data)
 		return -EINVAL;
diff --git a/fs/jfs/ioctl.c b/fs/jfs/ioctl.c
index 357ae6e5c36ec..1e7b177ece605 100644
--- a/fs/jfs/ioctl.c
+++ b/fs/jfs/ioctl.c
@@ -110,7 +110,6 @@ long jfs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 	case FITRIM:
 	{
 		struct super_block *sb = inode->i_sb;
-		struct request_queue *q = bdev_get_queue(sb->s_bdev);
 		struct fstrim_range range;
 		s64 ret = 0;
 
@@ -127,7 +126,7 @@ long jfs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 			return -EFAULT;
 
 		range.minlen = max_t(unsigned int, range.minlen,
-			q->limits.discard_granularity);
+				     bdev_discard_granularity(sb->s_bdev));
 
 		ret = jfs_ioc_trim(inode, &range);
 		if (ret < 0)
diff --git a/fs/nilfs2/ioctl.c b/fs/nilfs2/ioctl.c
index 52b73f558fcb1..87e1004b606d2 100644
--- a/fs/nilfs2/ioctl.c
+++ b/fs/nilfs2/ioctl.c
@@ -1052,7 +1052,6 @@ static int nilfs_ioctl_resize(struct inode *inode, struct file *filp,
 static int nilfs_ioctl_trim_fs(struct inode *inode, void __user *argp)
 {
 	struct the_nilfs *nilfs = inode->i_sb->s_fs_info;
-	struct request_queue *q = bdev_get_queue(nilfs->ns_bdev);
 	struct fstrim_range range;
 	int ret;
 
@@ -1065,7 +1064,8 @@ static int nilfs_ioctl_trim_fs(struct inode *inode, void __user *argp)
 	if (copy_from_user(&range, argp, sizeof(range)))
 		return -EFAULT;
 
-	range.minlen = max_t(u64, range.minlen, q->limits.discard_granularity);
+	range.minlen = max_t(u64, range.minlen,
+			     bdev_discard_granularity(nilfs->ns_bdev));
 
 	down_read(&nilfs->ns_segctor_sem);
 	ret = nilfs_sufile_trim_fs(nilfs->ns_sufile, &range);
diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index e763236169331..15806eeae217a 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -22,7 +22,6 @@ static int ntfs_ioctl_fitrim(struct ntfs_sb_info *sbi, unsigned long arg)
 {
 	struct fstrim_range __user *user_range;
 	struct fstrim_range range;
-	struct request_queue *q = bdev_get_queue(sbi->sb->s_bdev);
 	int err;
 
 	if (!capable(CAP_SYS_ADMIN))
@@ -35,7 +34,8 @@ static int ntfs_ioctl_fitrim(struct ntfs_sb_info *sbi, unsigned long arg)
 	if (copy_from_user(&range, user_range, sizeof(range)))
 		return -EFAULT;
 
-	range.minlen = max_t(u32, range.minlen, q->limits.discard_granularity);
+	range.minlen = max_t(u32, range.minlen,
+			     bdev_discard_granularity(sbi->sb->s_bdev));
 
 	err = ntfs_trim_fs(sbi, &range);
 	if (err < 0)
diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index c734085bcce4a..5f2e414cfa79b 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -882,7 +882,6 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	int err;
 	struct ntfs_sb_info *sbi = sb->s_fs_info;
 	struct block_device *bdev = sb->s_bdev;
-	struct request_queue *rq;
 	struct inode *inode;
 	struct ntfs_inode *ni;
 	size_t i, tt;
@@ -912,9 +911,8 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 		goto out;
 	}
 
-	rq = bdev_get_queue(bdev);
-	if (bdev_max_discard_sectors(bdev) && rq->limits.discard_granularity) {
-		sbi->discard_granularity = rq->limits.discard_granularity;
+	if (bdev_max_discard_sectors(bdev) && bdev_discard_granularity(bdev)) {
+		sbi->discard_granularity = bdev_discard_granularity(bdev);
 		sbi->discard_granularity_mask_inv =
 			~(u64)(sbi->discard_granularity - 1);
 	}
diff --git a/fs/ocfs2/ioctl.c b/fs/ocfs2/ioctl.c
index 9b78ef103ada6..afd54ec661030 100644
--- a/fs/ocfs2/ioctl.c
+++ b/fs/ocfs2/ioctl.c
@@ -903,7 +903,6 @@ long ocfs2_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 	case FITRIM:
 	{
 		struct super_block *sb = inode->i_sb;
-		struct request_queue *q = bdev_get_queue(sb->s_bdev);
 		struct fstrim_range range;
 		int ret = 0;
 
@@ -916,7 +915,7 @@ long ocfs2_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		if (copy_from_user(&range, argp, sizeof(range)))
 			return -EFAULT;
 
-		range.minlen = max_t(u64, q->limits.discard_granularity,
+		range.minlen = max_t(u64, bdev_discard_granularity(sb->s_bdev),
 				     range.minlen);
 		ret = ocfs2_trim_fs(sb, &range);
 		if (ret < 0)
diff --git a/fs/xfs/xfs_discard.c b/fs/xfs/xfs_discard.c
index a4e6609d616b7..e2ada115c23f9 100644
--- a/fs/xfs/xfs_discard.c
+++ b/fs/xfs/xfs_discard.c
@@ -152,8 +152,8 @@ xfs_ioc_trim(
 	struct xfs_mount		*mp,
 	struct fstrim_range __user	*urange)
 {
-	struct request_queue	*q = bdev_get_queue(mp->m_ddev_targp->bt_bdev);
-	unsigned int		granularity = q->limits.discard_granularity;
+	unsigned int		granularity =
+		bdev_discard_granularity(mp->m_ddev_targp->bt_bdev);
 	struct fstrim_range	range;
 	xfs_daddr_t		start, end, minlen;
 	xfs_agnumber_t		start_agno, end_agno, agno;
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 767ab22e1052a..f1cf557ea20ef 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1257,6 +1257,11 @@ static inline unsigned int bdev_max_discard_sectors(struct block_device *bdev)
 	return bdev_get_queue(bdev)->limits.max_discard_sectors;
 }
 
+static inline unsigned int bdev_discard_granularity(struct block_device *bdev)
+{
+	return bdev_get_queue(bdev)->limits.discard_granularity;
+}
+
 static inline unsigned int bdev_write_zeroes_sectors(struct block_device *bdev)
 {
 	struct request_queue *q = bdev_get_queue(bdev);
-- 
2.30.2

