Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 623CE2FB5E7
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Jan 2021 12:54:07 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-a6SasVxdO1qN0fGQ1hDGBg-1; Tue, 19 Jan 2021 06:54:04 -0500
X-MC-Unique: a6SasVxdO1qN0fGQ1hDGBg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3A1B100E32D;
	Tue, 19 Jan 2021 11:54:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B1B4260C0F;
	Tue, 19 Jan 2021 11:54:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9AB8E18095FF;
	Tue, 19 Jan 2021 11:54:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10J5AOZv021422 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 19 Jan 2021 00:10:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7BEAE112D16F; Tue, 19 Jan 2021 05:10:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 77F3C112D169
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 05:10:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6619E811E78
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 05:10:24 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-275-syc4Cy24OOuxXFHGlKk6TQ-1; Tue, 19 Jan 2021 00:10:20 -0500
X-MC-Unique: syc4Cy24OOuxXFHGlKk6TQ-1
IronPort-SDR: pw04DkX/KQQhfPeoth+zECxcRzaI2dh1rxMq83OxYlSjK8ueep5+j6kwIkwGQIIYb6kbAsHoYy
	DC6TNluVXfUofHqryxjZE6W2/MN/BKKfSB00ildALbcN4sA1HlBvyruc3CSnU0gNCSh0NPkPHX
	e6gi0bwP1WztzR77qEfvnB3K0NAmBrSYa7o15oWpf2uPFhCz64XX0QGVkCWhhiO5ROJ0VCRwnf
	4ocUbwOHjhW7w4UK0yYArLYLZuf0cEOEuYL0FZwZ7TTyljN9xyXdh8F45OKsxWLVcUD72pNyvA
	GQ0=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="158940765"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:10:19 +0800
IronPort-SDR: ybDxS5W7aKYrP2235G5C9fm8awzh1tIhls4cloxqzr8XTw6k67Iu0P24S+2EeLuIvL6H2d/Fw2
	oeZrqtH8T+Kt0kkvn0628/dOJ0k81RbH2s6PWXOHaS+VUFEi4B83+niR9bL95Rwgp8rMryJS77
	f0S7jUeitY34rlY9GlYuvavABzRqu5dyqBPA+0YV/COXDKDASeuq87H5nShQyLZLYx0p28fsJM
	5xeFyikkuGZj9gdz3DfGkjEumX0r0PsHKzykYNkTEHe+UOGoWYXtuiTQARDqyD3mGJwZSQ32sC
	LWQTInxH6MRS2+lhP+6aK2Ia
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:52:54 -0800
IronPort-SDR: cPCtUc/IRHJ6v0mRHjS8V8MFIsoN0oL2wMbe6Ozxyn7u6Jlq2FjrgvACBEr/lheyPR/5wD4N+M
	KEDIu5wE7UWz8Cv9qJDWZum4DMbM7mOvzj/7tfqqgYPHbQ1LhSR/PgR8NGyaDkjJQEt2LBkn32
	1OZrCSpTxv+AMTCn8V0WZgKvKOAI/tj1Sffo8uYhn7bxkZYYg0/EqRTNAqMwUOaWkw/9SrZbM5
	n6bVFFI/rd2QJwwAKHXPwXh+bmpzJXrCR4jV/u3YAVKTR0Pw0jMhQst/htFOvMCrlOnknkAxQ9
	MSM=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:10:18 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@tron.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:25 -0800
Message-Id: <20210119050631.57073-32-chaitanya.kulkarni@wdc.com>
In-Reply-To: <20210119050631.57073-1-chaitanya.kulkarni@wdc.com>
References: <20210119050631.57073-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Tue, 19 Jan 2021 06:53:48 -0500
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net, snitzer@redhat.com,
	gustavo@embeddedor.com, clm@fb.com, dm-devel@redhat.com,
	adilger.kernel@dilger.ca, hch@lst.de, naohiro.aota@wdc.com,
	sagi@grimberg.me, darrick.wong@oracle.com, osandov@fb.com,
	kent.overstreet@gmail.com, Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
	josef@toxicpanda.com, efremov@linux.com, colyli@suse.de,
	tj@kernel.org, viro@zeniv.linux.org.uk, dsterba@suse.com,
	bvanassche@acm.org, axboe@kernel.dk, damien.lemoal@wdc.com,
	tytso@mit.edu, martin.petersen@oracle.com, song@kernel.org,
	philipp.reisner@linbit.com, jefflexu@linux.alibaba.com,
	lars.ellenberg@linbit.com, jth@kernel.org, asml.silence@gmail.com
Subject: [Cluster-devel] [RFC PATCH 31/37] eros: use bio_init_fields in data
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 fs/erofs/data.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/erofs/data.c b/fs/erofs/data.c
index ea4f693bee22..15f3a3f01fa3 100644
--- a/fs/erofs/data.c
+++ b/fs/erofs/data.c
@@ -220,10 +220,8 @@ static inline struct bio *erofs_read_raw_page(struct bio *bio,
 
 		bio = bio_alloc(GFP_NOIO, nblocks);
 
-		bio->bi_end_io = erofs_readendio;
-		bio_set_dev(bio, sb->s_bdev);
-		bio->bi_iter.bi_sector = (sector_t)blknr <<
-			LOG_SECTORS_PER_BLOCK;
+		bio_init_fields(bio, sb->s_bdev, (sector_t)blknr <<
+			LOG_SECTORS_PER_BLOCK, NULL, erofs_readendio, 0, 0);
 		bio->bi_opf = REQ_OP_READ | (ra ? REQ_RAHEAD : 0);
 	}
 
-- 
2.22.1

