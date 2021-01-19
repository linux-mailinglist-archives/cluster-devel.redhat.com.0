Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9FFFE2FB5E8
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Jan 2021 12:54:07 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-Y6Fh4MGLMVuEUrx0mhFdlQ-1; Tue, 19 Jan 2021 06:54:01 -0500
X-MC-Unique: Y6Fh4MGLMVuEUrx0mhFdlQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E9871005E58;
	Tue, 19 Jan 2021 11:53:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1482360C5F;
	Tue, 19 Jan 2021 11:53:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EF3904BB7B;
	Tue, 19 Jan 2021 11:53:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10J58TPX020623 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 19 Jan 2021 00:08:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6A0C22026D11; Tue, 19 Jan 2021 05:08:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 64E042026D49
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 05:08:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50E73811E85
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 05:08:29 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-64-edNBkkBAPUafdiODFoxG8g-1; Tue, 19 Jan 2021 00:08:22 -0500
X-MC-Unique: edNBkkBAPUafdiODFoxG8g-1
IronPort-SDR: UjDgh2Y5yTgwdKcaydHzsVQLqqG9b4Zx3sRSNRVZxo1QiGVr7+kA86/J9HEQ6W4jrh0pZ7WjRW
	k8lThTfgl3oyjqWfWOgw8vl+Ru5UTWnV++0zasNEdwZEzHqp9O+tT/Vh5AviWmdJ0m0NntxQKZ
	XguUKL11ul0XKYVZvi8+XsPMe5IeWforFy7gjeUJWjOYNeoelGrgl7/fFCJOLejYEaJYCk5D7f
	4UTsDkGI8UU2CNgzo0K5A5Gts6qEEfFVVey5dYN9b0Mj0wjHw6c9+vs+5vbjZf3AfmW4WyvdZV
	c1E=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="268080940"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:07:19 +0800
IronPort-SDR: xj6Yt56pBXK2H8umWiMuaXbq2HJ7B2gj1WrNtw0Kkx1Z5xYlLfUFh4430ro48l8M7LiA6gINm8
	fthAdS7TBwzUCuKEL6pZSR82vPWhpJiUftaCWT63Vf6/nhJ0n2oA5iF1msK4Mgo/ocai2d1qsk
	l+0+AFC+kqUwLDRlBnaDe03oxHCLGmJbKzKg0qn4tk2SGPq19Slh5IfQkj88EWNT4h6aP9krgP
	h12npKD0EWhAlRLGmqDIEbaWbkaUbQ2OKr9zv6VFhI1pLiRXn9+XJYbz+kSs7v/ZKaV7Bkala3
	YuMci9UXjnHNDaVUHc/yKWPv
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:51:56 -0800
IronPort-SDR: QBnDS7DVrddQpcsFsBzx6dUP1vCou2zr2+U/E8LncZi1HXSOtDax3BLEkAh4fkXsMSmQFWPGFy
	i9c3j/giOOU39nkkPY4ax6KBgaPpzPJAoufKOchG2Ou0rmyaYFKJUhk8ZPDWpGoP3x51bQeso4
	ExxBU/jV033SF8Q+teRhuDUjl9XHjbBJkEt8Ba8a4jICbdKDHOxkWO7MzEPD0dB8h3reWZeWBh
	KVK+JCC1W+90P0+/EdNiEnUM8xRZsi0+PwhkhSGTp7e4x6m4p6jDgQlTHPkRvWkNPGtHl7ZAoZ
	Mec=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:07:19 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@tron.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:00 -0800
Message-Id: <20210119050631.57073-7-chaitanya.kulkarni@wdc.com>
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
Subject: [Cluster-devel] [RFC PATCH 06/37] gfs2: use bio_init_fields in lops
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
 fs/gfs2/lops.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index 3922b26264f5..9f8a9757b086 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -264,10 +264,8 @@ static struct bio *gfs2_log_alloc_bio(struct gfs2_sbd *sdp, u64 blkno,
 	struct super_block *sb = sdp->sd_vfs;
 	struct bio *bio = bio_alloc(GFP_NOIO, BIO_MAX_PAGES);
 
-	bio->bi_iter.bi_sector = blkno << sdp->sd_fsb2bb_shift;
-	bio_set_dev(bio, sb->s_bdev);
-	bio->bi_end_io = end_io;
-	bio->bi_private = sdp;
+	bio_init_fields(bio, sb->s_bdev, blkno << sdp->sd_fsb2bb_shift,
+			sdp, end_io, 0, 0);
 
 	return bio;
 }
-- 
2.22.1

