Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 19C722FB5E2
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Jan 2021 12:54:07 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-8NVmtR2bN9y2_O6toNFfSQ-1; Tue, 19 Jan 2021 06:54:04 -0500
X-MC-Unique: 8NVmtR2bN9y2_O6toNFfSQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15137192CC51;
	Tue, 19 Jan 2021 11:54:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E93EF6A91D;
	Tue, 19 Jan 2021 11:53:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CE4C61809C9F;
	Tue, 19 Jan 2021 11:53:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10J5Aqq8021534 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 19 Jan 2021 00:10:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3522C2166B2B; Tue, 19 Jan 2021 05:10:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F8232166B29
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 05:10:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4155B187504D
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 05:10:49 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-487-ccr6RaBoOV-2Wr5Y4vuyWA-1; Tue, 19 Jan 2021 00:10:42 -0500
X-MC-Unique: ccr6RaBoOV-2Wr5Y4vuyWA-1
IronPort-SDR: me66d1yU4p9hBo/Fag0KoTptBbVdy6mT4dG6nihrqaPCfx+xorYvgNxRsYEo+rOtqsfE2KEW1R
	D1RFGN/Ky0Eyyb8lk4LrW/AZ9FyMG4Hy/rcbggnVaMMyCyfJr+1o/C7JEwAJ0f5VOeXNO63nAS
	CPMyKqWDLibOPRoBGn+X+6jjl23HN8tCinHpED842R46AQnI1Q9dzJDJwIKQe3c8U8GvYOyjfC
	YDTVXoGigfIBGAv653HIYB4Ubiat4NYor/W/0fEI97XlEUhNcQT6GUcUe3tO5oX9OQ8LzpGs74
	5lA=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="158940794"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:10:41 +0800
IronPort-SDR: c/aH/K/VWIsg3Wm8kJumf/+fhG1w1L77D8u27mAGhscbTh+0Ec9JmrY00rc4fgTmZOZ2cIuR5I
	iuWRr/o35kA6EIBl1QhGzrh6PzwQJNe5ZpVBsYljN38ZlGQFfOj96sBrTop5s7Gb4xORo1K2AV
	WuIOreQW2g9k80FNF3Tkkf1sxL7VKR2JIkMSaCA0nA3sGqt72o3tx4ow4OKoMf3ELt0UnDmVUQ
	GhDimj4bpbvYxO8ZwG1bTQ6s4q0OrbsrVpY7ol8cmFiEtrubanZQ8E4WTDw+v6OeS1AoSdE3kb
	g5mzrPm0JN2eBU7bMyjjPiz+
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:55:17 -0800
IronPort-SDR: oklSZwC4T98igITkHvUN5/cFLVu1yS+dVuRFw1rj6Sypghilpv1dq004ftoRiIcXr+1cvb1C+g
	e1+GCw894PQkPu1QcGSBSC17BzbJVdUoKLEKnb23R5ToJPinuljlR2aaNZBBxuQfj4BqaudRJa
	XDGeUKlYGqrX0PkiJf+ZiBwJ6Ik8t4zeEDjdqLOFU05xrby1lNOvGG7JThAaPObtceSdxUj1c7
	/m5QwBatTkcZcWmVuIDWjsPnj5ACeHofJxm9d2p07oDQHlNegcWml37RbpxW8gEnNxSajg/OqB
	c4E=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:10:40 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@tron.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:28 -0800
Message-Id: <20210119050631.57073-35-chaitanya.kulkarni@wdc.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
Subject: [Cluster-devel] [RFC PATCH 34/37] nfs: use bio_init_fields in
	blocklayout
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
 fs/nfs/blocklayout/blocklayout.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/fs/nfs/blocklayout/blocklayout.c b/fs/nfs/blocklayout/blocklayout.c
index 3be6836074ae..7ac96519c8b7 100644
--- a/fs/nfs/blocklayout/blocklayout.c
+++ b/fs/nfs/blocklayout/blocklayout.c
@@ -128,12 +128,8 @@ bl_alloc_init_bio(int npg, struct block_device *bdev, sector_t disk_sector,
 			bio = bio_alloc(GFP_NOIO, npg);
 	}
 
-	if (bio) {
-		bio->bi_iter.bi_sector = disk_sector;
-		bio_set_dev(bio, bdev);
-		bio->bi_end_io = end_io;
-		bio->bi_private = par;
-	}
+	if (bio)
+		bio_init_fields(bio, bdev, disk_sector, par, end_io, 0, 0);
 	return bio;
 }
 
-- 
2.22.1

