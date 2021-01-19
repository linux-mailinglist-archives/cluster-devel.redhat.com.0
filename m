Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id BE3942FB5EE
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Jan 2021 12:54:09 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-J2swRXbIMAaZD04fVHeE5A-1; Tue, 19 Jan 2021 06:54:06 -0500
X-MC-Unique: J2swRXbIMAaZD04fVHeE5A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C79E192CC56;
	Tue, 19 Jan 2021 11:54:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B0E65D760;
	Tue, 19 Jan 2021 11:54:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3306B1809C9F;
	Tue, 19 Jan 2021 11:54:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10J59qtd021216 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 19 Jan 2021 00:09:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DEDB9112D172; Tue, 19 Jan 2021 05:09:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DAF8A112D170
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 05:09:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA34A800B3B
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 05:09:49 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-368--AJNFrkOMzuua2WWJ_bxCg-1; Tue, 19 Jan 2021 00:09:45 -0500
X-MC-Unique: -AJNFrkOMzuua2WWJ_bxCg-1
IronPort-SDR: 6pAnuiveTMtKgseTUPC3pcjtyBFvpjhv0U4JC3oiQVF6Ngba01jK9AbeI9KZ48CupLFDLBMmGq
	HH52vVbVQZqfjsNdAqgrebTTQ4/1YKLY04mEkybPPpLp1qqdjwtnljALFVGcVQSTOlBxSs/qsd
	NOX5gFdLKVkSxrGD0bJu7EE/ZqzIGQCHzZBNMfcj5k4YkldgTMVgWsLHjNQtxJqIOC/WviAqBR
	75n6Or4d9FDVYDVIfHhcRdi2+xgMhRL8dB4anoNZNtALygEAfdo6isZrsYxxpnkbGNRL9BD287
	wds=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="157758754"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:09:43 +0800
IronPort-SDR: o9UZZuknfhjRQy4Ps1WiP73ctJDnl24gl1VPZL22EF9Ww2b29rkj1YF2/PTd0X8TAOtKHA3qmW
	uYK/+LWx8XP0Lb27Gc6jXjzgAngYHLfJE/AsqIMX4odmhVhdXnNqDm2mwDkn9autNF/KNdymG9
	7xCKqj1I3NfR1P7BfzRVp8Ejc+Ny7vOXd01jGmzshHXpU+17T790sq/7KZsIxT0uFo1yv3/Mc6
	TwsTxgxeSqMPjKwmSmPuzGbUYSkmN3owdTGqUHA9QkmtEuzeTfs+TzO43HiaWiIhxZ9ZIhVqLu
	B65XpLVrvJv1UHax0IOPLN4W
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:54:21 -0800
IronPort-SDR: LsIx6xfp3MuCvVUBKYFUM/JkQXB8Xd6FGJiWWFhsO5FF8FnRTeuKG7U5dD7Rejep3b07GmAUmb
	ESoAg9lczoALSnARXtAcLYU7nWTaUgdnl4QXBjjX2qbcRpBVzJgVyC4kwkSnttKMzqx1NypHun
	wXbjpdfkPHnx0tGuE/6+V9ou48OKFTaS8Hgad4KU+rvcDNespMF4OxFR14ESWKX7jCsiRaANAt
	Bb3pRfhPY9tW+eTbrNJrKLsm+FoQOnSPpDH4sOQAdptthLApRwVVLlrj3oL4F2Q0S3i/yr38QG
	rvI=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:09:43 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@tron.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:20 -0800
Message-Id: <20210119050631.57073-27-chaitanya.kulkarni@wdc.com>
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
Subject: [Cluster-devel] [RFC PATCH 26/37] dm log writes: use bio_init_fields
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 drivers/md/dm-log-writes.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/md/dm-log-writes.c b/drivers/md/dm-log-writes.c
index e3d35c6c9f71..35c2e0418561 100644
--- a/drivers/md/dm-log-writes.c
+++ b/drivers/md/dm-log-writes.c
@@ -223,11 +223,9 @@ static int write_metadata(struct log_writes_c *lc, void *entry,
 		goto error;
 	}
 	bio->bi_iter.bi_size = 0;
-	bio->bi_iter.bi_sector = sector;
-	bio_set_dev(bio, lc->logdev->bdev);
 	bio->bi_end_io = (sector == WRITE_LOG_SUPER_SECTOR) ?
 			  log_end_super : log_end_io;
-	bio->bi_private = lc;
+	bio_init_fields(bio, lc->logdev->bdev, sector, lc, NULL, 0, 0);
 	bio_set_op_attrs(bio, REQ_OP_WRITE, 0);
 
 	page = alloc_page(GFP_KERNEL);
@@ -283,10 +281,8 @@ static int write_inline_data(struct log_writes_c *lc, void *entry,
 		}
 
 		bio->bi_iter.bi_size = 0;
-		bio->bi_iter.bi_sector = sector;
-		bio_set_dev(bio, lc->logdev->bdev);
-		bio->bi_end_io = log_end_io;
-		bio->bi_private = lc;
+		bio_init_fields(bio, lc->logdev->bdev, sector, lc, log_end_io,
+				0, 0);
 		bio_set_op_attrs(bio, REQ_OP_WRITE, 0);
 
 		for (i = 0; i < bio_pages; i++) {
@@ -370,10 +366,8 @@ static int log_one_block(struct log_writes_c *lc,
 		goto error;
 	}
 	bio->bi_iter.bi_size = 0;
-	bio->bi_iter.bi_sector = sector;
-	bio_set_dev(bio, lc->logdev->bdev);
-	bio->bi_end_io = log_end_io;
-	bio->bi_private = lc;
+	bio_init_fields(bio, lc->logdev->bdev, sector, lc, log_end_io,
+			0, 0);
 	bio_set_op_attrs(bio, REQ_OP_WRITE, 0);
 
 	for (i = 0; i < block->vec_cnt; i++) {
@@ -392,10 +386,7 @@ static int log_one_block(struct log_writes_c *lc,
 				goto error;
 			}
 			bio->bi_iter.bi_size = 0;
-			bio->bi_iter.bi_sector = sector;
-			bio_set_dev(bio, lc->logdev->bdev);
-			bio->bi_end_io = log_end_io;
-			bio->bi_private = lc;
+			bio_init_fields(bio, lc->logdev->bdev, sector, lc, log_end_io, 0, 0);
 			bio_set_op_attrs(bio, REQ_OP_WRITE, 0);
 
 			ret = bio_add_page(bio, block->vecs[i].bv_page,
-- 
2.22.1

