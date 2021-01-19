Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 380772FB5DB
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Jan 2021 12:54:06 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-3i5migVMPo-I3sTSAm53pA-1; Tue, 19 Jan 2021 06:54:03 -0500
X-MC-Unique: 3i5migVMPo-I3sTSAm53pA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8466C81460E;
	Tue, 19 Jan 2021 11:53:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D73F60C96;
	Tue, 19 Jan 2021 11:53:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 549EF18095FF;
	Tue, 19 Jan 2021 11:53:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10J58Ldp020571 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 19 Jan 2021 00:08:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3EE976D9EC; Tue, 19 Jan 2021 05:08:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 384994411D
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 05:08:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D290A858285
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 05:08:18 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-215-iiHTK4qjOcOcZObb6Lx00Q-1; Tue, 19 Jan 2021 00:08:16 -0500
X-MC-Unique: iiHTK4qjOcOcZObb6Lx00Q-1
IronPort-SDR: cK4zkPmTjRYP+nj46ivqMVW9j0u4xsIkAiX98X3VGCoXJXQrmZUfmrTqIhFSGMPDj1TjOJPSiw
	C1ymko8GegmththLqIEJm0mfYMyKj51wsXAQoPdWHlKfdOpdn0MjhsgEpOYkcDz3yJtk2KLuhC
	+CkEoXyzpe+f8jAUQRTW5yAM8/3qYVnCMXH5GaoOGHoG6SPGAJ7usCnvVTgMzBkT4Q86plov07
	ug4FRxvljVdIFPJ2GKgbFwXgT0KsAya3lYuUZDU2TyG0fCA2bs5QL7zNi5JIvZcgTSOi9y4m/z
	FnI=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="157763795"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:07:11 +0800
IronPort-SDR: E2T8NhVgpB+JDEMAuLXrSvufKMqXvk25z7MI+9v8HIQmFtuwk9bN+Vwg/nOfulmqXFTTzLx9YF
	PhGPCNv6BsjxnNk6CB6Kk7hHozOH2t9KcQyP7exr27korU/uRsv7KaG3LiEnDXbwPQvuhUHT9z
	Yhd7DRpkFf6cyFWPtCy4znoaXFbISDFT3S4A0OC8iWeFOpv5KryWQLJJ9WyUYPoBQhATgQYXAj
	OqHra6j6+07AHGbIweP8cQxbHTg0fyacqm2+9+xLv9MrCcOrlF07tSL+WiatY1/SivwpGkoqsh
	m/rSxCIdKisK5hC5IcBjte3X
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:49:47 -0800
IronPort-SDR: GDd4J6YTFP8HhrZnL/kPcBPBHOjVMkqjgTSYePXIN1p6VjbBUOlt/t7knTI78j01lupweBVXBE
	Qrf/3CuakDKuhfZFB9YorM1NE5OYf/fNye+BAXuLpvEgn+mQDBn/ePyPBWiXAz5XnISDPfEpam
	WLSsiz8QPhiv+mHlZ3XmyQpDw+MKe+Vz4c2sB+5IGEUQ1QQKIMcPMlMUElLMqb4wubx9smdtxD
	/qANSSO3eFYpLv+9iWpFZEjNiZX8CfoH3PB920NT0je34xsn6+9qoX8nDurumB5w1MB8IpLJkr
	gR8=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:07:12 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@tron.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:05:59 -0800
Message-Id: <20210119050631.57073-6-chaitanya.kulkarni@wdc.com>
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
Subject: [Cluster-devel] [RFC PATCH 05/37] ext4: use bio_init_fields in
	page_io
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
 fs/ext4/page-io.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/ext4/page-io.c b/fs/ext4/page-io.c
index 03a44a0de86a..53a79a7aac15 100644
--- a/fs/ext4/page-io.c
+++ b/fs/ext4/page-io.c
@@ -400,10 +400,8 @@ static void io_submit_init_bio(struct ext4_io_submit *io,
 	 */
 	bio = bio_alloc(GFP_NOIO, BIO_MAX_PAGES);
 	fscrypt_set_bio_crypt_ctx_bh(bio, bh, GFP_NOIO);
-	bio->bi_iter.bi_sector = bh->b_blocknr * (bh->b_size >> 9);
-	bio_set_dev(bio, bh->b_bdev);
-	bio->bi_end_io = ext4_end_bio;
-	bio->bi_private = ext4_get_io_end(io->io_end);
+	bio_init_fields(bio, bh->b_bdev, bh->b_blocknr * (bh->b_size >> 9),
+			ext4_get_io_end(io->io_end), ext4_end_bio, 0, 0);
 	io->io_bio = bio;
 	io->io_next_block = bh->b_blocknr;
 	wbc_init_bio(io->io_wbc, bio);
-- 
2.22.1

