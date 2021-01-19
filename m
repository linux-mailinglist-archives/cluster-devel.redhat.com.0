Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E249E2FB5D9
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Jan 2021 12:54:05 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-veGt-Tq_OHqSJfFBj44gUQ-1; Tue, 19 Jan 2021 06:54:03 -0500
X-MC-Unique: veGt-Tq_OHqSJfFBj44gUQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFF1E192AB89;
	Tue, 19 Jan 2021 11:53:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C01110023AE;
	Tue, 19 Jan 2021 11:53:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 82AB65002E;
	Tue, 19 Jan 2021 11:53:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10J59i43021152 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 19 Jan 2021 00:09:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3B3AC4411D; Tue, 19 Jan 2021 05:09:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 35B546D9EB
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 05:09:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D67AD101A53F
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 05:09:41 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-104-iB0efMk-PkK9285b87ADsQ-1; Tue, 19 Jan 2021 00:09:37 -0500
X-MC-Unique: iB0efMk-PkK9285b87ADsQ-1
IronPort-SDR: cbq8lPSCnnG1donUUlo1HwU0Gxdep1TlXleUFfbYKJiDefzq0uq7TS0TaxSJ3T2oHMoAHOFyTi
	jRVXi6vetJSzQOsQGUC5J9WvoicmkbgdB0lgODGDb/rjOXxZ2kreDgEo2gbpSnI0y407IQihp+
	XrKdJ9vPmEycVxmvhkDP6SykMP+V9fxG9LfexlMoBtgn5VjvcnG3JofgW4q/CMD0hkfzlyB825
	ywHeun+1beyOSCUi54DgrYelILWWSEYl/DX0BoNTMRrttigEW0HBb7JFumru578CgNZW5wnrU/
	Qqk=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="158940691"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:09:37 +0800
IronPort-SDR: zUzgCNrCcRy27jcxBTJlINf+qco+CGx2aJSotqRYPLFAZFGTNNnCtTGSzOIl4lYS+ynxCfnIpx
	OpTOkTFy92KVAcKVEcxvNIfXNJSSex22sUCatIuAwJgdPvV8cfXCMdWU15Di10gE53S3kafbIV
	NTkjCvzAeFGBjnCVBxtS4YmTUCJZ4PyEIfXuvKW2lqD6B9ohNYNfW15H9LQlUPC5RsqCMKYR1h
	bNYD1DjZG/qFP4WKJiGcgjcMBQEWQG9Oba982i9hyI0UeX/3bakUf9B6Zyx6AOn9Z8ywBSuqTz
	X9p4ZXDC3uEAly7czCOycY7n
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:54:13 -0800
IronPort-SDR: 82udVg0tcJR2e9Ov1+A4/XxfwUpr6AnnaaUrqXRQiZStYiKcrlpKU0DkZ5iMbm8iZTvQAtMZG/
	I8wyRE90NxZichs84bJgmmJzLP0cByQHps51BWtoql+dpr7gkHTtxNhSfv63hHFg3HLCAOwaZD
	+dt9xs8jlS8ttjdqGabgZ5alJdiHqr1V7WKaF95Pd/LIfmh9EooiqLrIPLv7qKKLiQaaSOFfaR
	3ilv2AB4rQ3+1E1OdOv6+VBj6UNe20rcRhCRm3hgKs7Kn1zftFTr7vNmUA+PXjeDeKmQalWZYt
	Kyc=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:09:36 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@tron.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:19 -0800
Message-Id: <20210119050631.57073-26-chaitanya.kulkarni@wdc.com>
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
Subject: [Cluster-devel] [RFC PATCH 25/37] dm-zoned: use bio_init_fields
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 drivers/md/md.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index ca409428b4fc..b331c81f3a12 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -1001,11 +1001,9 @@ void md_super_write(struct mddev *mddev, struct md_rdev *rdev,
 
 	atomic_inc(&rdev->nr_pending);
 
-	bio_set_dev(bio, rdev->meta_bdev ? rdev->meta_bdev : rdev->bdev);
-	bio->bi_iter.bi_sector = sector;
 	bio_add_page(bio, page, size, 0);
-	bio->bi_private = rdev;
-	bio->bi_end_io = super_written;
+	bio_init_fields(bio, rdev->meta_bdev ? rdev->meta_bdev : rdev->bdev,
+			sector, rdev, super_written, 0, 0);
 
 	if (test_bit(MD_FAILFAST_SUPPORTED, &mddev->flags) &&
 	    test_bit(FailFast, &rdev->flags) &&
-- 
2.22.1

