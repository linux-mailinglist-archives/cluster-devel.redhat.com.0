Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 57A9F2FB5E6
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Jan 2021 12:54:07 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-vCiC9wS0PbSIGaF3wQcfRw-1; Tue, 19 Jan 2021 06:54:03 -0500
X-MC-Unique: vCiC9wS0PbSIGaF3wQcfRw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 166E9CF9BA;
	Tue, 19 Jan 2021 11:53:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0465B19C99;
	Tue, 19 Jan 2021 11:53:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DBBAE1809CA0;
	Tue, 19 Jan 2021 11:53:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10J58pee020753 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 19 Jan 2021 00:08:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 180052166B29; Tue, 19 Jan 2021 05:08:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 12A9F2166B2B
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 05:08:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27EEF1875049
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 05:08:48 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-462-euVjLiHONOKPkU_L4lP9ig-3; Tue, 19 Jan 2021 00:08:44 -0500
X-MC-Unique: euVjLiHONOKPkU_L4lP9ig-3
IronPort-SDR: 59WzEWMffpXO2QWZMUwsIoSQ32eQpQgxAsT3bztb3WDD5r7BT6CbaH4y/ErgQvStcm2xSzCikN
	3oxQO7F1Tqu2z1ynJXDHxjmfq9CFKWwKUo0GPcN1dfjlAm42eKWwzPhfGwDSt+aXckVHtqVRIb
	mVpRizoccp0hnBUGJf9nIomoo9bT9wQ8sodyNDMxf7Ko8eDXDFfyF9T3IuVesk6aW3W5/6w1/c
	j3YSmV53/3W6sBIIi7G2snVfDOCmKf8zqgjEfgDzMwpVC0KIvvCZkULw3M4e57J2QDH4qr8Kpu
	uRY=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="162200984"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:07:40 +0800
IronPort-SDR: UwaNLmtY0e41V+uDOCCIZFh9vCLPffAV4RgvCvtQjyZpHsp7UHYJbMJL+t8avK1i9ZBb5Ypx8c
	SU3EqEim1v6YltcE1Mg69VBuK8lViAx1nmez2MxH8XudgVO++cQkpCZZV5MXNupoe3xSQrr3B2
	iFm3/H/4vRbkFjNDWZ8kixlT4YMPlYAtmARK2w3XDXgfFhL47nhHTDUgveQR1tHeW6jKXudhRO
	giN2ulDggQ6rUSA2c5LbEsnwcLhc/gx3tyU1S/TMZAJeFjmfiIDlHcVsgrmEz8ZBuG8ODKoPnK
	G/spl3rxm5KJBLl+yIDNwyrT
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:50:15 -0800
IronPort-SDR: TM9dpxhc1bBjOypQU+TCA1+JHS3X6tbyUfX7CLJp8sH85tB99xJFscHBDCLFq2/sTR23LiC3TM
	J8KKwbkNN7jjvKISe7zzGqpFWELclGi38nUt/LvFQapcIN9YFp8DZRQ2izF3uYGZWxHnRIgtO2
	WhlQFVHRjq0w2Sygnwa63xoEK9fTLJNmudOASmzr+o1zZ38TO1TOJzzBzvspEDTXWPVaZigUus
	O1/x342A0NXQzCNMPt4Ly8HseHr0drZDIxn0r08WsOUedcj3h8TiQqY/1oiIV4nQx5hppaJXgU
	55M=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:07:40 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@tron.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:03 -0800
Message-Id: <20210119050631.57073-10-chaitanya.kulkarni@wdc.com>
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
Subject: [Cluster-devel] [RFC PATCH 09/37] iomap: use bio_init_fields in
	buffered-io
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 fs/iomap/buffered-io.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 16a1e82e3aeb..d256799569cf 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -1222,10 +1222,9 @@ iomap_alloc_ioend(struct inode *inode, struct iomap_writepage_ctx *wpc,
 	struct bio *bio;
 
 	bio = bio_alloc_bioset(GFP_NOFS, BIO_MAX_PAGES, &iomap_ioend_bioset);
-	bio_set_dev(bio, wpc->iomap.bdev);
-	bio->bi_iter.bi_sector = sector;
+	bio_init_fields(bio, wpc->iomap.bdev, sector, NULL, NULL, 0,
+			inode->i_write_hint);
 	bio->bi_opf = REQ_OP_WRITE | wbc_to_write_flags(wbc);
-	bio->bi_write_hint = inode->i_write_hint;
 	wbc_init_bio(wbc, bio);
 
 	ioend = container_of(bio, struct iomap_ioend, io_inline_bio);
-- 
2.22.1

