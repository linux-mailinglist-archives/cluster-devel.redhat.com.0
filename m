Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7698E2FB5D7
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Jan 2021 12:54:05 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-hfmUGAaFOxqx9156hrt8Qg-1; Tue, 19 Jan 2021 06:54:02 -0500
X-MC-Unique: hfmUGAaFOxqx9156hrt8Qg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1749E100E43B;
	Tue, 19 Jan 2021 11:53:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04DB860C68;
	Tue, 19 Jan 2021 11:53:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E20181809CA1;
	Tue, 19 Jan 2021 11:53:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10J59sWj021227 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 19 Jan 2021 00:09:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4376263AFA; Tue, 19 Jan 2021 05:09:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DDA76D9EB
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 05:09:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29AAC80120A
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 05:09:54 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-385-rZv9PSUjPHiGuQhk2g0l3A-1; Tue, 19 Jan 2021 00:09:51 -0500
X-MC-Unique: rZv9PSUjPHiGuQhk2g0l3A-1
IronPort-SDR: DZRl7+AS+UyKjm+lm6pzg8JaVmloYaWVgRmAhq0OFUTeTgDhRmAd2m+SD6EEXWLSWBuBM8Z0Az
	ONFIpcE54qNC0+J3cpp25gsfFRcklBkqMQs5rMkmY6hvbrwB/EXb/PNBZQQPRnFSCDC1XYqXAj
	kleS8m80AdcjzA84U8rYxc9esYoLUnxQ6wzs+5pFz0NtgrjSoD6zdHPtwh2RPykSL5e0y+LchG
	Eu1ag+ELeTEAT2P458nzIouekMCdIsj9rKLRGOl07g1AJkbSpx6iXthFV8DE31VxJlo5jLuPmL
	Cpo=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="158940714"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:09:51 +0800
IronPort-SDR: b5lbDRLEjhXjxIpy+2e9QMX9ijIsBr4KmGr/FikJqUN6r52X2/pjYm+T9wfJhUMMmYBbLJsWcJ
	14cEonDHEyZikM3dLBkqu+zN/F/SvGud6ea2DJ0yaKq34Xvc5OI2ZJv8PH7tr+07H8PQrkGoZd
	CFngjzMx4MAqqdXRTqqabjNVL+iLSFGlRu4/wQ/Biiq79SGvIvvqXZJGHWD7h7zdNYl573mOPf
	8Bw18plnapBR1dZK9uTpIz3ZeRJaLmWfZZovOpnPotnevpLeimcDsPQwv3/GsFWShjw9N9/lW7
	PSVuJCOKAwsz3UtiKGkgdytV
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:54:27 -0800
IronPort-SDR: JLU8nMTD+NZGhpcLc6bx6NezWoOxG1kLxe+XONRlNiEvcpn5x3JxGCWrI6N+TlSlWzGV1Q0IZH
	sVnYt6tKGijbl+nT2mxOo5/rgMe/5l4KRxVV0eiBp02GobWze2qiJQgHs9JNJvbu9kV03QI256
	THC/6jLcI9qR4UKAPS2gqtOtR4DwAg8fBaFWS2YCr+JhQOYLTSPNhMAbcyMh5IWuS0/MKfxvtN
	xPuF9hOwrup1UYc8D7gXKUTo1HoUHkPFFr+UvCvYhNW2SXbqPm5T4xFixZZesNSvVigWeniTT3
	7fA=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:09:50 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@tron.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:21 -0800
Message-Id: <20210119050631.57073-28-chaitanya.kulkarni@wdc.com>
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
Subject: [Cluster-devel] [RFC PATCH 27/37] nvmet: use bio_init_fields in
	bdev-ns
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
 drivers/nvme/target/io-cmd-bdev.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/nvme/target/io-cmd-bdev.c b/drivers/nvme/target/io-cmd-bdev.c
index 125dde3f410e..302ec6bc2a55 100644
--- a/drivers/nvme/target/io-cmd-bdev.c
+++ b/drivers/nvme/target/io-cmd-bdev.c
@@ -323,9 +323,7 @@ static void nvmet_bdev_execute_flush(struct nvmet_req *req)
 		return;
 
 	bio_init(bio, req->inline_bvec, ARRAY_SIZE(req->inline_bvec));
-	bio_set_dev(bio, req->ns->bdev);
-	bio->bi_private = req;
-	bio->bi_end_io = nvmet_bio_done;
+	bio_init_fields(bio, req->ns->bdev, 0, req, nvmet_bio_done, 0, 0);
 	bio->bi_opf = REQ_OP_WRITE | REQ_PREFLUSH;
 
 	submit_bio(bio);
-- 
2.22.1

