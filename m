Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 291CB2FB5E3
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Jan 2021 12:54:07 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-6MvOtIRfNyuKyjtNg8sXlg-1; Tue, 19 Jan 2021 06:54:04 -0500
X-MC-Unique: 6MvOtIRfNyuKyjtNg8sXlg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9422581C49A;
	Tue, 19 Jan 2021 11:53:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8131E60C5F;
	Tue, 19 Jan 2021 11:53:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3F0064BB7B;
	Tue, 19 Jan 2021 11:53:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10J59OiK021066 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 19 Jan 2021 00:09:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CEB6D63AFA; Tue, 19 Jan 2021 05:09:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 75FF16D9D9
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 05:09:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DFF19858EEC
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 05:09:22 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-18-nm3Ys2jxMJ-V74tCILc5ZA-1; Tue, 19 Jan 2021 00:09:18 -0500
X-MC-Unique: nm3Ys2jxMJ-V74tCILc5ZA-1
IronPort-SDR: wGyXOKbD+ckYA1JTKqMaTrnGe+dH7n10xNbG8mnjShFLNn+HQYSfcBXspp/SjOX0foGi/NVHtP
	kj+pwRBVyAvq41+xpqDHUVFmRkKHHSY+01arxnTBMOThKihPYCm65z9kjElwQP7SStRuKv0Kcx
	VIs7L8Off4Px4Ns64u8F9SEORkI1C9yQd1BzIG6qHZ9IiT6kn3dqAOa3jhp54mrt8BbSmnwRqJ
	z21PhBOMieGt2BN4O4wrgoAbTRRWSdVAeYyl2u2YedQ9cYdXNBUw2Zru0Q6uxmzlwsC77QHmSW
	oNU=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="157758606"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:08:14 +0800
IronPort-SDR: IDA7wKtocHix1EgcoSlVtTqdSCgl397CWuD+0eogeTCpuQOGRfdc6D4iBDr2lMY+f+AAKjV1J9
	DsAOWU6fYi/mbBWcONqeOoAMd1AfN0Un14S0razd1akCeiehm+SS8PmlLjPgzMjcIdi1e8wqfN
	Hh2GEAzchtEsK8Dij1i8IRVGfvCtEESbAFKMU3s7K/8Ka66C7U7n2u9g6ygKa1n93CGo5otTkM
	pGop+f4Q+OAjtMZs4joboHQLFzZyI5oh2erRkaG9DD8kuEAN52OagHV87gVKmbkuvP0GYN32nD
	mhwo2fzLhEvBE0HJ7P3Uwy7n
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:50:50 -0800
IronPort-SDR: p1tcnYwAx/l/NVCOSE++cI0sO4XNQ+lbfc67fxaPGZ0Kwcqxhdz9+u3CPNrCwOw83oDaMA1Qjm
	ESU3xmsUtmMt60eRcgdVRVFxzLHWW7CqjKNcfNh1+RIHGbsJ3Ai97YW6MaxhVDB0yLEg9IysxE
	83VZ2vSeY/l/vgDGSUb38hhYRsZT54dyq7c3WndcswTCZVlwVMvWGE4bWezbXz6r57OZtdR1bX
	3lpkUR2AIs9h1PW1353M+8ODhhBWH9ueZ25tUnouwQQq8n8IP+3JRSYVgmwudbuVJ26I/RNNul
	ogs=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:08:14 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@tron.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:08 -0800
Message-Id: <20210119050631.57073-15-chaitanya.kulkarni@wdc.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
Subject: [Cluster-devel] [RFC PATCH 14/37] drdb: use bio_init_fields in
	bitmap
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
 drivers/block/drbd/drbd_bitmap.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/block/drbd/drbd_bitmap.c b/drivers/block/drbd/drbd_bitmap.c
index df53dca5d02c..4fd9746af469 100644
--- a/drivers/block/drbd/drbd_bitmap.c
+++ b/drivers/block/drbd/drbd_bitmap.c
@@ -1006,13 +1006,10 @@ static void bm_page_io_async(struct drbd_bm_aio_ctx *ctx, int page_nr) __must_ho
 		bm_store_page_idx(page, page_nr);
 	} else
 		page = b->bm_pages[page_nr];
-	bio_set_dev(bio, device->ldev->md_bdev);
-	bio->bi_iter.bi_sector = on_disk_sector;
+	bio_init_fields(bio, device->ldev->md_bdev, on_disk_sector, ctx, drbd_bm_endio, 0, 0);
 	/* bio_add_page of a single page to an empty bio will always succeed,
 	 * according to api.  Do we want to assert that? */
 	bio_add_page(bio, page, len, 0);
-	bio->bi_private = ctx;
-	bio->bi_end_io = drbd_bm_endio;
 	bio_set_op_attrs(bio, op, 0);
 
 	if (drbd_insert_fault(device, (op == REQ_OP_WRITE) ? DRBD_FAULT_MD_WR : DRBD_FAULT_MD_RD)) {
-- 
2.22.1

