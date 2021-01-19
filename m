Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 962642FB5DF
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Jan 2021 12:54:06 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-fSEjrsaXPeygfDRaHESfqQ-1; Tue, 19 Jan 2021 06:54:03 -0500
X-MC-Unique: fSEjrsaXPeygfDRaHESfqQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 971F281C4E6;
	Tue, 19 Jan 2021 11:53:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8266C10023AE;
	Tue, 19 Jan 2021 11:53:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 41F705002C;
	Tue, 19 Jan 2021 11:53:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10J59cjQ021125 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 19 Jan 2021 00:09:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AD8EF2026D12; Tue, 19 Jan 2021 05:09:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A7F392026D11
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 05:09:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D6D4101A53F
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 05:09:36 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-573-R_mPyrZTOP2G3XwCTvG_Og-1; Tue, 19 Jan 2021 00:09:31 -0500
X-MC-Unique: R_mPyrZTOP2G3XwCTvG_Og-1
IronPort-SDR: LOYLqubnS5/ZCv1nQoKFSRXO4fA62yByor/C2KlEzEZWn783ts5bHJDQUdkmU6Egk6RLsuNY9n
	FOnokiOg7mfR7LKwMnLyug3Xcur2ihukjjeJMBXShBue/fA+B0xEPJ16Knb4ftP6EARfWetmcM
	eMt2FbNKVxliHCqE2CTgKCn4vzt1n3o0zMXgC2LGBYZY4pr3YNv7vJRSYIzH0Hvo26XKPzP3cu
	+YyICIQYOuwfOgDe6maNHZhD+Mu1XAqe5DLFcZCb79ltSbrL5ERz6WNqki2aAiAlK4AQL6k7gC
	TN0=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="162201192"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:09:29 +0800
IronPort-SDR: Cd1WB/rkKGjiycrQV7UGMM/5PNpocOXFEBBJFH91nHMDRqLTAcHmK0blzxfpXNxshuTV/NCZ6l
	7jDvex3I5GbGTbKKLOZTk/lRI+4UqwM4r5D/pNScf7Oxzv01YIU+WnfSwX/PPf89xYnL8T/LnK
	sjfAa28AuEqgqfIfVdjG9RtLqggVeN7E0sEAx+yHIgHTJXLDkozdLd85Xck4x+e5DCLpWMK9jO
	8ZXSvp4kG4vtQ52LbCS2c/e915g4539JkfOAxa5RS4JC7klx8QfaFtgCxPij7lmkX14xC3QSgC
	om9eCNvgUx1HGrIxT25QCBNl
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:52:04 -0800
IronPort-SDR: X2W/WReUXrAfluwkD7se2dZ1819ju1OynW28uTSvDSLN2ps3wO1qXeL0GJaXlJKwpIqaALDMhb
	kimb7jLOr+gpWYj06rWyhvZYDu9+2JsUCLwbEquhMfnoBM1g23E7vbj6QE5tFPT0RXTnWA/1bR
	1HmN0UVHZv2jYDXSsFNmf+lCI3bFpzj7XxZ5y9GFacGpyfKADcPO/cyDwrim/4xYtJ4n8KmXYm
	LOaLwIRAOFVmRCvuPUSpoWyGGLooeoj1II+Syix9yI2u6Xeh/1MmoJBsJ6CUrYMQLVvvA0Jyzk
	ZqE=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:09:29 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@tron.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:18 -0800
Message-Id: <20210119050631.57073-25-chaitanya.kulkarni@wdc.com>
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
Subject: [Cluster-devel] [RFC PATCH 24/37] dm-zoned: use bio_init_fields
	target
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
 drivers/md/dm-zoned-target.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index 697f9de37355..8b232b9e3386 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -129,14 +129,11 @@ static int dmz_submit_bio(struct dmz_target *dmz, struct dm_zone *zone,
 	if (!clone)
 		return -ENOMEM;
 
-	bio_set_dev(clone, dev->bdev);
 	bioctx->dev = dev;
-	clone->bi_iter.bi_sector =
-		dmz_start_sect(dmz->metadata, zone) + dmz_blk2sect(chunk_block);
 	clone->bi_iter.bi_size = dmz_blk2sect(nr_blocks) << SECTOR_SHIFT;
-	clone->bi_end_io = dmz_clone_endio;
-	clone->bi_private = bioctx;
-
+	bio_init_fields(clone, dev->bdev,
+			dmz_start_sect(dmz->metadata, zone) + dmz, bioctx,
+			dmz_clone_endio, 0, 0);
 	bio_advance(bio, clone->bi_iter.bi_size);
 
 	refcount_inc(&bioctx->ref);
-- 
2.22.1

