Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B41B04FA4B6
	for <lists+cluster-devel@lfdr.de>; Sat,  9 Apr 2022 07:03:12 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-473-Ma0zboYFOTCqaloTd3XIEg-1; Sat, 09 Apr 2022 01:03:08 -0400
X-MC-Unique: Ma0zboYFOTCqaloTd3XIEg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE6353C1395A;
	Sat,  9 Apr 2022 05:03:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B15DE145B97F;
	Sat,  9 Apr 2022 05:03:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 042421940358;
	Sat,  9 Apr 2022 05:03:07 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1FAD51940341 for <cluster-devel@listman.corp.redhat.com>;
 Sat,  9 Apr 2022 05:03:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EDE36404778A; Sat,  9 Apr 2022 05:03:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E9FD940D296C
 for <cluster-devel@redhat.com>; Sat,  9 Apr 2022 05:03:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0BEA800B28
 for <cluster-devel@redhat.com>; Sat,  9 Apr 2022 05:03:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-1rxyPAQoNym7HlZkSi_6vg-1; Sat, 09 Apr 2022 01:03:04 -0400
X-MC-Unique: 1rxyPAQoNym7HlZkSi_6vg-1
Received: from 213-147-167-116.nat.highway.webapn.at ([213.147.167.116]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nd33s-0020WM-ET; Sat, 09 Apr 2022 04:51:01 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Sat,  9 Apr 2022 06:50:20 +0200
Message-Id: <20220409045043.23593-5-hch@lst.de>
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
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: [Cluster-devel] [PATCH 04/27] drbd: remove assign_p_sizes_qlim
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Fold each branch into its only caller.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/drbd/drbd_main.c | 47 +++++++++++++++-------------------
 1 file changed, 20 insertions(+), 27 deletions(-)

diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index 9676a1d214bc5..1262fe1c33618 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -903,31 +903,6 @@ void drbd_gen_and_send_sync_uuid(struct drbd_peer_device *peer_device)
 	}
 }
 
-/* communicated if (agreed_features & DRBD_FF_WSAME) */
-static void
-assign_p_sizes_qlim(struct drbd_device *device, struct p_sizes *p,
-					struct request_queue *q)
-{
-	if (q) {
-		p->qlim->physical_block_size = cpu_to_be32(queue_physical_block_size(q));
-		p->qlim->logical_block_size = cpu_to_be32(queue_logical_block_size(q));
-		p->qlim->alignment_offset = cpu_to_be32(queue_alignment_offset(q));
-		p->qlim->io_min = cpu_to_be32(queue_io_min(q));
-		p->qlim->io_opt = cpu_to_be32(queue_io_opt(q));
-		p->qlim->discard_enabled = blk_queue_discard(q);
-		p->qlim->write_same_capable = 0;
-	} else {
-		q = device->rq_queue;
-		p->qlim->physical_block_size = cpu_to_be32(queue_physical_block_size(q));
-		p->qlim->logical_block_size = cpu_to_be32(queue_logical_block_size(q));
-		p->qlim->alignment_offset = 0;
-		p->qlim->io_min = cpu_to_be32(queue_io_min(q));
-		p->qlim->io_opt = cpu_to_be32(queue_io_opt(q));
-		p->qlim->discard_enabled = 0;
-		p->qlim->write_same_capable = 0;
-	}
-}
-
 int drbd_send_sizes(struct drbd_peer_device *peer_device, int trigger_reply, enum dds_flags flags)
 {
 	struct drbd_device *device = peer_device->device;
@@ -957,14 +932,32 @@ int drbd_send_sizes(struct drbd_peer_device *peer_device, int trigger_reply, enu
 		q_order_type = drbd_queue_order_type(device);
 		max_bio_size = queue_max_hw_sectors(q) << 9;
 		max_bio_size = min(max_bio_size, DRBD_MAX_BIO_SIZE);
-		assign_p_sizes_qlim(device, p, q);
+		p->qlim->physical_block_size =
+			cpu_to_be32(queue_physical_block_size(q));
+		p->qlim->logical_block_size =
+			cpu_to_be32(queue_logical_block_size(q));
+		p->qlim->alignment_offset =
+			cpu_to_be32(queue_alignment_offset(q));
+		p->qlim->io_min = cpu_to_be32(queue_io_min(q));
+		p->qlim->io_opt = cpu_to_be32(queue_io_opt(q));
+		p->qlim->discard_enabled = blk_queue_discard(q);
 		put_ldev(device);
 	} else {
+		struct request_queue *q = device->rq_queue;
+
+		p->qlim->physical_block_size =
+			cpu_to_be32(queue_physical_block_size(q));
+		p->qlim->logical_block_size =
+			cpu_to_be32(queue_logical_block_size(q));
+		p->qlim->alignment_offset = 0;
+		p->qlim->io_min = cpu_to_be32(queue_io_min(q));
+		p->qlim->io_opt = cpu_to_be32(queue_io_opt(q));
+		p->qlim->discard_enabled = 0;
+
 		d_size = 0;
 		u_size = 0;
 		q_order_type = QUEUE_ORDERED_NONE;
 		max_bio_size = DRBD_MAX_BIO_SIZE; /* ... multiple BIOs per peer_request */
-		assign_p_sizes_qlim(device, p, NULL);
 	}
 
 	if (peer_device->connection->agreed_pro_version <= 94)
-- 
2.30.2

