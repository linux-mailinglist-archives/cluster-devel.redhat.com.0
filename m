Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 15F502FB5D2
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Jan 2021 12:54:03 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-IP4uPdQ_MMG4b_ntMs-KUw-1; Tue, 19 Jan 2021 06:54:01 -0500
X-MC-Unique: IP4uPdQ_MMG4b_ntMs-KUw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4252F801817;
	Tue, 19 Jan 2021 11:53:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A6F360BF1;
	Tue, 19 Jan 2021 11:53:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 12B1218095FF;
	Tue, 19 Jan 2021 11:53:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10J58nmK020737 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 19 Jan 2021 00:08:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8C3B32026D11; Tue, 19 Jan 2021 05:08:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 87C242026D49
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 05:08:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10C29811E78
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 05:08:47 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-462-bgjP5nOVMK-3iqVCi4frhg-2; Tue, 19 Jan 2021 00:08:40 -0500
X-MC-Unique: bgjP5nOVMK-3iqVCi4frhg-2
IronPort-SDR: AWdYhsdnR2BeNutYnsxH9Tb8RvzNNjCOW8i5o606tUggwcF5E1yNZoVzDU+qqZL+BbC6PXTmwd
	A596uLZjOOWgKzC3WzIx5JrijMeIRe1A8qH73q+SmspOYSIsJ92/Pmqnb7KStW2B0Ei393Q6FL
	hF79pwhaV6f8sOxTZsTsEuy002QyXJ7i6LKPfVRUfwbVv2mfxyRha3iTcGku8D80AeSbctXl20
	PLsmPxNuBKjvjXUFV8Sfn0OO1k15WrJlIU8nr0SBGCv1B79qgGa9tOTiwjrmAee+FM/qQ6tPH7
	Q7s=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="162201090"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:08:37 +0800
IronPort-SDR: B++/icjoVfzkgKWv/Qbse3NiYx6tm90UISnW48KsZgWu9WLIihTw7lt03yF8+FdsBqiew/86n4
	z/ctUaJk8AdM07M2vlkGjCRIcYv/t51GMA2/yIK9j92J49yD6cAXQ03rf5qTzIW1+HfXaGbqD6
	yG34JvJiNAMIx7pFaBRPjEvE4zJvD2j/k4N/4zV6RTZ2ChKYPxOHNZ93fo0y5PjTeE2TwokV/Q
	NM8JzFN8SpwMZlAXHScFgtJpWwzAGCQAS0Lr+Czp0k6ykVsJgzvi1saWmN29X+yZTlC6MfVPn3
	EFvO1JqVEQp9MAyl/xza+U75
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:53:15 -0800
IronPort-SDR: JlGfCHshT1mK+XacVyirUo0rFyjPWt2f31VZ3z2J1Z+1bAsxbYaQqDfkpztEmemcjkFKSqFtBW
	eEHx4MKVO6uhGP44oLoJjur9xUH9E+nf+FFdLDlrYS2WxbXcD7sJerBxjAL9tpVS6iMx+k6Ygk
	O6RIIA/q4UYqrDznEz4/cneeqCBOoZihS6qjthtpQtFPN4aYc3uvtGPOTbAR+UEONOX62l4CZO
	swheoC8AcejSmyN7MaD5wpht27eshQMMdBz4TnpekpmQcRnvSAFWabxuH6D+W4HdmuEhyRgLHS
	mSA=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:08:37 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@tron.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:11 -0800
Message-Id: <20210119050631.57073-18-chaitanya.kulkarni@wdc.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
Subject: [Cluster-devel] [RFC PATCH 17/37] pktcdvd: use bio_init_fields
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
 drivers/block/pktcdvd.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/block/pktcdvd.c b/drivers/block/pktcdvd.c
index b8bb8ec7538d..47eb4e0bd4c3 100644
--- a/drivers/block/pktcdvd.c
+++ b/drivers/block/pktcdvd.c
@@ -1028,10 +1028,8 @@ static void pkt_gather_data(struct pktcdvd_device *pd, struct packet_data *pkt)
 
 		bio = pkt->r_bios[f];
 		bio_reset(bio);
-		bio->bi_iter.bi_sector = pkt->sector + f * (CD_FRAMESIZE >> 9);
-		bio_set_dev(bio, pd->bdev);
-		bio->bi_end_io = pkt_end_io_read;
-		bio->bi_private = pkt;
+		bio_init_fields(bio, pd->bdev, pkt->sector + f * (CD_FRAMESIZE >> 9), pkt,
+				pkt_end_io_read, 0, 0);
 
 		p = (f * CD_FRAMESIZE) / PAGE_SIZE;
 		offset = (f * CD_FRAMESIZE) % PAGE_SIZE;
@@ -1208,10 +1206,8 @@ static void pkt_start_write(struct pktcdvd_device *pd, struct packet_data *pkt)
 	int f;
 
 	bio_reset(pkt->w_bio);
-	pkt->w_bio->bi_iter.bi_sector = pkt->sector;
-	bio_set_dev(pkt->w_bio, pd->bdev);
-	pkt->w_bio->bi_end_io = pkt_end_io_packet_write;
-	pkt->w_bio->bi_private = pkt;
+	bio_init_fields(pkt->w_bio, pd->bdev, pkt->sector, pkt,
+			pkt_end_io_packet_write, 0, 0);
 
 	/* XXX: locking? */
 	for (f = 0; f < pkt->frames; f++) {
-- 
2.22.1

