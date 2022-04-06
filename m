Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA094F5672
	for <lists+cluster-devel@lfdr.de>; Wed,  6 Apr 2022 08:26:05 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-543-c4n-77gUNEaxJo1u0h1v_A-1; Wed, 06 Apr 2022 02:26:01 -0400
X-MC-Unique: c4n-77gUNEaxJo1u0h1v_A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 94251100BAA5;
	Wed,  6 Apr 2022 06:26:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8884BC27DB9;
	Wed,  6 Apr 2022 06:26:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 60E8F194036B;
	Wed,  6 Apr 2022 06:26:00 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 617AE19451F3 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  6 Apr 2022 06:25:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4CF15C26E9C; Wed,  6 Apr 2022 06:25:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 49598C15E71
 for <cluster-devel@redhat.com>; Wed,  6 Apr 2022 06:25:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2DE251815CF7
 for <cluster-devel@redhat.com>; Wed,  6 Apr 2022 06:25:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-393-Ot9kx4Z0OGizv5ZynP_B5w-1; Wed, 06 Apr 2022 02:25:57 -0400
X-MC-Unique: Ot9kx4Z0OGizv5ZynP_B5w-1
Received: from 213-225-3-188.nat.highway.a1.net ([213.225.3.188]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbynX-003uuj-EB; Wed, 06 Apr 2022 06:05:44 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  6 Apr 2022 08:04:55 +0200
Message-Id: <20220406060516.409838-7-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: [Cluster-devel] [PATCH 06/27] drbd: cleanup
 decide_on_discard_support
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Sanitize the calling conventions and use a goto label to cleanup the
code flow.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/drbd/drbd_nl.c | 68 +++++++++++++++++++-----------------
 1 file changed, 35 insertions(+), 33 deletions(-)

diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index 02030c9c4d3b1..40bb0b356a6d6 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -1204,38 +1204,42 @@ static unsigned int drbd_max_discard_sectors(struct drbd_connection *connection)
 }
 
 static void decide_on_discard_support(struct drbd_device *device,
-			struct request_queue *q,
-			struct request_queue *b,
-			bool discard_zeroes_if_aligned)
+		struct drbd_backing_dev *bdev)
 {
-	/* q = drbd device queue (device->rq_queue)
-	 * b = backing device queue (device->ldev->backing_bdev->bd_disk->queue),
-	 *     or NULL if diskless
-	 */
-	struct drbd_connection *connection = first_peer_device(device)->connection;
-	bool can_do = b ? blk_queue_discard(b) : true;
-
-	if (can_do && connection->cstate >= C_CONNECTED && !(connection->agreed_features & DRBD_FF_TRIM)) {
-		can_do = false;
-		drbd_info(connection, "peer DRBD too old, does not support TRIM: disabling discards\n");
-	}
-	if (can_do) {
-		/* We don't care for the granularity, really.
-		 * Stacking limits below should fix it for the local
-		 * device.  Whether or not it is a suitable granularity
-		 * on the remote device is not our problem, really. If
-		 * you care, you need to use devices with similar
-		 * topology on all peers. */
-		blk_queue_discard_granularity(q, 512);
-		q->limits.max_discard_sectors = drbd_max_discard_sectors(connection);
-		blk_queue_flag_set(QUEUE_FLAG_DISCARD, q);
-		q->limits.max_write_zeroes_sectors = drbd_max_discard_sectors(connection);
-	} else {
-		blk_queue_flag_clear(QUEUE_FLAG_DISCARD, q);
-		blk_queue_discard_granularity(q, 0);
-		q->limits.max_discard_sectors = 0;
-		q->limits.max_write_zeroes_sectors = 0;
+	struct drbd_connection *connection =
+		first_peer_device(device)->connection;
+	struct request_queue *q = device->rq_queue;
+
+	if (bdev && !blk_queue_discard(bdev->backing_bdev->bd_disk->queue))
+		goto not_supported;
+
+	if (connection->cstate >= C_CONNECTED &&
+	    !(connection->agreed_features & DRBD_FF_TRIM)) {
+		drbd_info(connection,
+			"peer DRBD too old, does not support TRIM: disabling discards\n");
+		goto not_supported;
 	}
+
+	/*
+	 * We don't care for the granularity, really.
+	 *
+	 * Stacking limits below should fix it for the local device.  Whether or
+	 * not it is a suitable granularity on the remote device is not our
+	 * problem, really. If you care, you need to use devices with similar
+	 * topology on all peers.
+	 */
+	blk_queue_discard_granularity(q, 512);
+	q->limits.max_discard_sectors = drbd_max_discard_sectors(connection);
+	blk_queue_flag_set(QUEUE_FLAG_DISCARD, q);
+	q->limits.max_write_zeroes_sectors =
+		drbd_max_discard_sectors(connection);
+	return;
+
+not_supported:
+	blk_queue_flag_clear(QUEUE_FLAG_DISCARD, q);
+	blk_queue_discard_granularity(q, 0);
+	q->limits.max_discard_sectors = 0;
+	q->limits.max_write_zeroes_sectors = 0;
 }
 
 static void fixup_discard_if_not_supported(struct request_queue *q)
@@ -1273,7 +1277,6 @@ static void drbd_setup_queue_param(struct drbd_device *device, struct drbd_backi
 	unsigned int max_segments = 0;
 	struct request_queue *b = NULL;
 	struct disk_conf *dc;
-	bool discard_zeroes_if_aligned = true;
 
 	if (bdev) {
 		b = bdev->backing_bdev->bd_disk->queue;
@@ -1282,7 +1285,6 @@ static void drbd_setup_queue_param(struct drbd_device *device, struct drbd_backi
 		rcu_read_lock();
 		dc = rcu_dereference(device->ldev->disk_conf);
 		max_segments = dc->max_bio_bvecs;
-		discard_zeroes_if_aligned = dc->discard_zeroes_if_aligned;
 		rcu_read_unlock();
 
 		blk_set_stacking_limits(&q->limits);
@@ -1292,7 +1294,7 @@ static void drbd_setup_queue_param(struct drbd_device *device, struct drbd_backi
 	/* This is the workaround for "bio would need to, but cannot, be split" */
 	blk_queue_max_segments(q, max_segments ? max_segments : BLK_MAX_SEGMENTS);
 	blk_queue_segment_boundary(q, PAGE_SIZE-1);
-	decide_on_discard_support(device, q, b, discard_zeroes_if_aligned);
+	decide_on_discard_support(device, bdev);
 
 	if (b) {
 		blk_stack_limits(&q->limits, &b->limits, 0);
-- 
2.30.2

