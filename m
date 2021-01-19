Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0611A2FB5D3
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Jan 2021 12:54:04 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-I6i8C1BcNd2rsTf1ngxfVA-1; Tue, 19 Jan 2021 06:54:01 -0500
X-MC-Unique: I6i8C1BcNd2rsTf1ngxfVA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F9BE100E444;
	Tue, 19 Jan 2021 11:53:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F22E18796;
	Tue, 19 Jan 2021 11:53:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 499784BB40;
	Tue, 19 Jan 2021 11:53:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10J58SJq020618 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 19 Jan 2021 00:08:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BFB472026D49; Tue, 19 Jan 2021 05:08:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BAD3F2026D11
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 05:08:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A73DA858EEC
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 05:08:28 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-489-Fk0z_0KHOCOck7UWz9zKdA-1; Tue, 19 Jan 2021 00:08:23 -0500
X-MC-Unique: Fk0z_0KHOCOck7UWz9zKdA-1
IronPort-SDR: IynUi49ob0BnUOvONbjsn1W6alkE7FIqfADGyTAr0njYiboDDcPPQs1JugE4mwLVcsJ40sUMWJ
	7DyUwoqeP5WgOuAMneA0cSB767I3Ik7DgOr9Npw24d6d8uO+HqzuNkjSq3u1QBi2M6Nj7Zgmfv
	i1Ft9GMxrYg4byZxxOcRoWOnxS51pvDM1AaWsQ36FwHiVdA7FVOSXdDkmkwr1inQJnRQaxLc70
	AzY+iZjOm27tbZZk/jNnpkj6VLBypzqNHFUtfMTbvoM92V5reOYnASCIuhj6G59gG+OD7BiAeA
	Wl0=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="261722253"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:19:00 +0800
IronPort-SDR: 6u++bFpgtanfGLUOIZBSWInNlvTP2vGn+UjkPePm8fztobD/d2mic8RGrsEk5o1aYzkaBWZSBT
	pMZRqoAaZkoLTQ2PV7hGQ00GjmCs+HDB927ebqqNVHV0n7OAqkghVpzSsOif9ypqyDq5HZnsj+
	1tjl7u/e4DtziZ1i0SDOYYQ1Jt89zBiBTI07oVI5x2UJzYeoiXiIgnDfwcJ02G5ta7layRvmZR
	WP2EfKqTPDZmX1ctx+S4NJxpPfQ+BCbyXqSJi5NDkNUX29x0IJyN8BSVgHkQcLImp6rCYh+zjd
	I2cZnymvKCcHBQ0oWrQ5ID92
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:50:57 -0800
IronPort-SDR: AukWeQ10GheUQlYR0D5EEj/feVa20cSuWNwottGMwE7opN0/I3RYtMUjQ5GxQSyfBE6/sdBk0k
	z4fxfv6aG+9JDmdOEZ65AwSHkGYtwddoOVkRqi4DvyiiLB8vtd/fOm44eFdRlx5N0V45fVA/G2
	Mrkem+bFgQ/7hMk41j/WbKXfrCn46pyu5FjaWYjPtBRdJOMYXrfOYhaNNWZEy5N5aQ3tw7GglR
	lppVbOb4m+51NXG4xiicKFxmfiLfz3Hlw8sn3kAgisMPSXvCeaKzeiNu728KKk2Lm4HPl2GKbp
	MUo=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:08:22 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@tron.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:09 -0800
Message-Id: <20210119050631.57073-16-chaitanya.kulkarni@wdc.com>
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
Subject: [Cluster-devel] [RFC PATCH 15/37] drdb: use bio_init_fields in
	receiver
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 drivers/block/drbd/drbd_receiver.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 09c86ef3f0fd..2715081a4603 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -1296,9 +1296,7 @@ static void submit_one_flush(struct drbd_device *device, struct issue_flush_cont
 
 	octx->device = device;
 	octx->ctx = ctx;
-	bio_set_dev(bio, device->ldev->backing_bdev);
-	bio->bi_private = octx;
-	bio->bi_end_io = one_flush_endio;
+	bio_init_fields(bio, device->ldev->backing_bdev, 0, octx, one_flush_endio, 0, 0);
 	bio->bi_opf = REQ_OP_FLUSH | REQ_PREFLUSH;
 
 	device->flush_jif = jiffies;
@@ -1693,12 +1691,9 @@ int drbd_submit_peer_request(struct drbd_device *device,
 		goto fail;
 	}
 	/* > peer_req->i.sector, unless this is the first bio */
-	bio->bi_iter.bi_sector = sector;
-	bio_set_dev(bio, device->ldev->backing_bdev);
+	bio_init_fields(bio, device->ldev->backing_bdev, sector, peer_req,
+			drbd_peer_request_endio, 0, 0);
 	bio_set_op_attrs(bio, op, op_flags);
-	bio->bi_private = peer_req;
-	bio->bi_end_io = drbd_peer_request_endio;
-
 	bio->bi_next = bios;
 	bios = bio;
 	++n_bios;
-- 
2.22.1

