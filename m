Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 97FD82FB5E0
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Jan 2021 12:54:06 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-OFgXv0EKMsOcWfgoBVC-NQ-1; Tue, 19 Jan 2021 06:54:02 -0500
X-MC-Unique: OFgXv0EKMsOcWfgoBVC-NQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 523A91927816;
	Tue, 19 Jan 2021 11:53:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32C205D760;
	Tue, 19 Jan 2021 11:53:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1D83B5002C;
	Tue, 19 Jan 2021 11:53:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10J59UpI021098 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 19 Jan 2021 00:09:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 01F106F9C2; Tue, 19 Jan 2021 05:09:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EFFC96F9C6
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 05:09:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E4561875049
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 05:09:28 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-504-6_MiN1BsMXevDLCcyfodaw-1; Tue, 19 Jan 2021 00:09:23 -0500
X-MC-Unique: 6_MiN1BsMXevDLCcyfodaw-1
IronPort-SDR: pq8qwa56MlVAbaVjNajxz/6TpSMEavY76A+XCP/Ha3K7T+U1rZsbVtjeMYO9SZCrySfW2jIvE4
	/pNEOgeJEZ27+8MGLLifMdcucd9Z0yYuGsGlObpZYEsaU4oBIsbR/6CuXhzi/m6OE/N67le7ll
	vYFM8ZNQ+sVgP15YFm+Ebk//W5DEy530hv7FEqGNqjYbhiLncgZt28VNgdkXpco7D0whh5ooYa
	mesJKjtToSDplEfrLtdWOmvoytrCfSLoyNWvg0UQzOGcXickl96aErM8qHT1U4YJ1flTcQxG30
	Sts=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="158940679"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:09:23 +0800
IronPort-SDR: 5TSceFpf0WcWDeQozdscWZjOHVAvos9KgK49bdy3ZH/XlGrtUjLxREp+IFf+6sNCcHH77cbMAu
	4qMMClJXDwIvz/UuQ51p6ndP/D6vVIuBbqOnf41uJq52KWtMyWVvUUn+0oCS+oxBFEjw0g4wsv
	a/cQnbrqd1thSk4jSnlLeSKoNS4fMc0t4IAFC4YOVRukw8jfIxlHz0LJyCcC/WlZ80hfLDlw+n
	SgkmsS6teXlM7k0lnR1zUpMAeGW07nw8Kp/znTabtnCXkc6Nr33YVW1fH14RO1ewEkUN+fW5NG
	xaEDP2I93UZ5JRBX3qtRC5vo
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:51:57 -0800
IronPort-SDR: WDMfO4KSjZ85dQnSqJHGqhPnau1IPWBJa7ouAx7fSY8Jjs07UadggeWCP1wGZdoVsyHikSCSBo
	NjR3hTBoDZYf083INEVXN/g/gzRcE8c69hDQ3bHF1CnrxKItq/1x7A8KFxUF9hsEZwznMnu465
	WdZoTY5ZKFKbPPmsD6E9kgpTCXMTN98PIQwHFSUfz5GsmitLQ4YX+7Kt3he3pE680JbUdUcIwc
	w3TKORGekwZavC6DFj/L4eyCUg1ECleXwXNyg9AYomurOycfkdloWjts9kBTsEWz8yA/ZIB3I9
	J7c=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:09:22 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@tron.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:17 -0800
Message-Id: <20210119050631.57073-24-chaitanya.kulkarni@wdc.com>
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
Subject: [Cluster-devel] [RFC PATCH 23/37] dm-zoned: use bio_init_fields
	metadata
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
 drivers/md/dm-zoned-metadata.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index b298fefb022e..f114d595ce23 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -577,10 +577,8 @@ static struct dmz_mblock *dmz_get_mblock_slow(struct dmz_metadata *zmd,
 	spin_unlock(&zmd->mblk_lock);
 
 	/* Submit read BIO */
-	bio->bi_iter.bi_sector = dmz_blk2sect(block);
-	bio_set_dev(bio, dev->bdev);
-	bio->bi_private = mblk;
-	bio->bi_end_io = dmz_mblock_bio_end_io;
+	bio_init_fields(bio, dev->bdev, dmz_blk2sect(block), mblk,
+			dmz_mblock_bio_end_io, 0, 0);
 	bio_set_op_attrs(bio, REQ_OP_READ, REQ_META | REQ_PRIO);
 	bio_add_page(bio, mblk->page, DMZ_BLOCK_SIZE, 0);
 	submit_bio(bio);
@@ -733,10 +731,8 @@ static int dmz_write_mblock(struct dmz_metadata *zmd, struct dmz_mblock *mblk,
 
 	set_bit(DMZ_META_WRITING, &mblk->state);
 
-	bio->bi_iter.bi_sector = dmz_blk2sect(block);
-	bio_set_dev(bio, dev->bdev);
-	bio->bi_private = mblk;
-	bio->bi_end_io = dmz_mblock_bio_end_io;
+	bio_init_fields(bio, dev->bdev, dmz_blk2sect(block), mblk,
+			dmz_mblock_bio_end_io, 0, 0);
 	bio_set_op_attrs(bio, REQ_OP_WRITE, REQ_META | REQ_PRIO);
 	bio_add_page(bio, mblk->page, DMZ_BLOCK_SIZE, 0);
 	submit_bio(bio);
@@ -763,8 +759,7 @@ static int dmz_rdwr_block(struct dmz_dev *dev, int op,
 	if (!bio)
 		return -ENOMEM;
 
-	bio->bi_iter.bi_sector = dmz_blk2sect(block);
-	bio_set_dev(bio, dev->bdev);
+	bio_init_fields(bio, dev->bdev, dmz_blk2sect(block), NULL, NULL, 0, 0);
 	bio_set_op_attrs(bio, op, REQ_SYNC | REQ_META | REQ_PRIO);
 	bio_add_page(bio, page, DMZ_BLOCK_SIZE, 0);
 	ret = submit_bio_wait(bio);
-- 
2.22.1

