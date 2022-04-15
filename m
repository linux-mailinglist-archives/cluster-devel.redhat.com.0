Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F88B5024D3
	for <lists+cluster-devel@lfdr.de>; Fri, 15 Apr 2022 07:49:04 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-209-U799q_8dOrapEZd9dnA88Q-1; Fri, 15 Apr 2022 01:48:58 -0400
X-MC-Unique: U799q_8dOrapEZd9dnA88Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E58A811E81;
	Fri, 15 Apr 2022 05:48:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 22C5B40F4940;
	Fri, 15 Apr 2022 05:48:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C654D194034C;
	Fri, 15 Apr 2022 05:48:56 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 80A0C19451EC for <cluster-devel@listman.corp.redhat.com>;
 Fri, 15 Apr 2022 05:48:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6018C2024CCB; Fri, 15 Apr 2022 05:48:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B4E32024CDA
 for <cluster-devel@redhat.com>; Fri, 15 Apr 2022 05:48:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E35A93C01D83
 for <cluster-devel@redhat.com>; Fri, 15 Apr 2022 05:48:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-271-6XFztj_HM9WOtytwHm57SQ-1; Fri, 15 Apr 2022 01:48:44 -0400
X-MC-Unique: 6XFztj_HM9WOtytwHm57SQ-1
Received: from [2a02:1205:504b:4280:f5dd:42a4:896c:d877] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfDxq-008PC1-Gz; Fri, 15 Apr 2022 04:53:47 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri, 15 Apr 2022 06:52:44 +0200
Message-Id: <20220415045258.199825-14-hch@lst.de>
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
Subject: [Cluster-devel] [PATCH 13/27] block: add a bdev_fua helper
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
 "Martin K . Petersen" <martin.petersen@oracle.com>, linux-mmc@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 ntfs3@lists.linux.dev, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Add a helper to check the FUA flag based on the block_device instead of
having to poke into the block layer internal request_queue.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
---
 drivers/block/rnbd/rnbd-srv.c       | 3 +--
 drivers/target/target_core_iblock.c | 3 +--
 fs/iomap/direct-io.c                | 3 +--
 include/linux/blkdev.h              | 6 +++++-
 4 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/block/rnbd/rnbd-srv.c b/drivers/block/rnbd/rnbd-srv.c
index f8cc3c5fecb4b..beaef43a67b9d 100644
--- a/drivers/block/rnbd/rnbd-srv.c
+++ b/drivers/block/rnbd/rnbd-srv.c
@@ -533,7 +533,6 @@ static void rnbd_srv_fill_msg_open_rsp(struct rnbd_msg_open_rsp *rsp,
 					struct rnbd_srv_sess_dev *sess_dev)
 {
 	struct rnbd_dev *rnbd_dev = sess_dev->rnbd_dev;
-	struct request_queue *q = bdev_get_queue(rnbd_dev->bdev);
 
 	rsp->hdr.type = cpu_to_le16(RNBD_MSG_OPEN_RSP);
 	rsp->device_id =
@@ -560,7 +559,7 @@ static void rnbd_srv_fill_msg_open_rsp(struct rnbd_msg_open_rsp *rsp,
 	rsp->cache_policy = 0;
 	if (bdev_write_cache(rnbd_dev->bdev))
 		rsp->cache_policy |= RNBD_WRITEBACK;
-	if (blk_queue_fua(q))
+	if (bdev_fua(rnbd_dev->bdev))
 		rsp->cache_policy |= RNBD_FUA;
 }
 
diff --git a/drivers/target/target_core_iblock.c b/drivers/target/target_core_iblock.c
index 03013e85ffc03..c4a903b8a47fc 100644
--- a/drivers/target/target_core_iblock.c
+++ b/drivers/target/target_core_iblock.c
@@ -727,14 +727,13 @@ iblock_execute_rw(struct se_cmd *cmd, struct scatterlist *sgl, u32 sgl_nents,
 
 	if (data_direction == DMA_TO_DEVICE) {
 		struct iblock_dev *ib_dev = IBLOCK_DEV(dev);
-		struct request_queue *q = bdev_get_queue(ib_dev->ibd_bd);
 		/*
 		 * Force writethrough using REQ_FUA if a volatile write cache
 		 * is not enabled, or if initiator set the Force Unit Access bit.
 		 */
 		opf = REQ_OP_WRITE;
 		miter_dir = SG_MITER_TO_SG;
-		if (test_bit(QUEUE_FLAG_FUA, &q->queue_flags)) {
+		if (bdev_fua(ib_dev->ibd_bd)) {
 			if (cmd->se_cmd_flags & SCF_FUA)
 				opf |= REQ_FUA;
 			else if (!bdev_write_cache(ib_dev->ibd_bd))
diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
index b08f5dc31780d..62da020d02a11 100644
--- a/fs/iomap/direct-io.c
+++ b/fs/iomap/direct-io.c
@@ -265,8 +265,7 @@ static loff_t iomap_dio_bio_iter(const struct iomap_iter *iter,
 		 * cache flushes on IO completion.
 		 */
 		if (!(iomap->flags & (IOMAP_F_SHARED|IOMAP_F_DIRTY)) &&
-		    (dio->flags & IOMAP_DIO_WRITE_FUA) &&
-		    blk_queue_fua(bdev_get_queue(iomap->bdev)))
+		    (dio->flags & IOMAP_DIO_WRITE_FUA) && bdev_fua(iomap->bdev))
 			use_fua = true;
 	}
 
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 807a49aa5a27a..075b16d4560e7 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -602,7 +602,6 @@ bool blk_queue_flag_test_and_set(unsigned int flag, struct request_queue *q);
 			     REQ_FAILFAST_DRIVER))
 #define blk_queue_quiesced(q)	test_bit(QUEUE_FLAG_QUIESCED, &(q)->queue_flags)
 #define blk_queue_pm_only(q)	atomic_read(&(q)->pm_only)
-#define blk_queue_fua(q)	test_bit(QUEUE_FLAG_FUA, &(q)->queue_flags)
 #define blk_queue_registered(q)	test_bit(QUEUE_FLAG_REGISTERED, &(q)->queue_flags)
 #define blk_queue_nowait(q)	test_bit(QUEUE_FLAG_NOWAIT, &(q)->queue_flags)
 
@@ -1336,6 +1335,11 @@ static inline bool bdev_write_cache(struct block_device *bdev)
 	return test_bit(QUEUE_FLAG_WC, &bdev_get_queue(bdev)->queue_flags);
 }
 
+static inline bool bdev_fua(struct block_device *bdev)
+{
+	return test_bit(QUEUE_FLAG_FUA, &bdev_get_queue(bdev)->queue_flags);
+}
+
 static inline enum blk_zoned_model bdev_zoned_model(struct block_device *bdev)
 {
 	struct request_queue *q = bdev_get_queue(bdev);
-- 
2.30.2

