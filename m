Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1B3B02FB5CD
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Jan 2021 12:54:01 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-8BAeEc4gOf-CYvAMnyI_XQ-1; Tue, 19 Jan 2021 06:53:59 -0500
X-MC-Unique: 8BAeEc4gOf-CYvAMnyI_XQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18A111005E4B;
	Tue, 19 Jan 2021 11:53:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0484610023AD;
	Tue, 19 Jan 2021 11:53:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E0F044BB40;
	Tue, 19 Jan 2021 11:53:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10J585Uw020444 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 19 Jan 2021 00:08:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5E9002166B2B; Tue, 19 Jan 2021 05:08:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 592D32166B29
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 05:08:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 45BE882DFE2
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 05:08:05 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-448-UspWCKkwN9a4bU3RLC-eSg-1; Tue, 19 Jan 2021 00:08:02 -0500
X-MC-Unique: UspWCKkwN9a4bU3RLC-eSg-1
IronPort-SDR: uPz+u1E6PXQK49L76ouYwlmvX+QDd2YLV6VitxdcB1IcHEbtNCfmVW+bxwAZwJpVFDg0heSiVs
	/44x6+dA/jIzZ1mREx8Muvwmkkd7+OujIw4CXxngtm4Z1snmrH7l366nHzvJwimSX4OVLfKTTx
	+kqwOxUugVRH1yLVvdQutQrU0FpniHyewIZ7iUgvPgamwTceUUgfOEOi8XgB8v+eThvVxpfrue
	sD2bQIldJbGNvsCXmCnYtCZpLYvpQG/6+2COIVdL8KOmx+2pM/NjPcYh9Lz/ImlJIVa1BAUCC0
	SOE=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="261722214"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:18:28 +0800
IronPort-SDR: TOi2BH+VX5d6W9kK7ecbSDtHtzHfvlsDvO91wcmC1GJwoH86TamBCCtANBdCTS4p+P6CMevSY2
	dlz/V5Y3sJWshrTAOk2PI9/HRQTjzPnSXTlFPAEDJD/9lDVV3ucUWSqsuTwnhEuhK3j979d/Tx
	fdDKhStF8syPiW1r/pPdKYpUiAuG1rTwWJRYkMdFJud4xGpV3WSO8qcM/nIZ4GhzfEz4r2tsAG
	0L+qMyElNUJIhzYVpzYtYVt5JPbVKbqIWrL7ZWdcYKUMVO/s8/tLs7ZEsbocv9r8tMUU0Je1cR
	azXTRKo626upuNLDIdxJw9JN
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:52:38 -0800
IronPort-SDR: Cc2iHwjkEjqCebjYIHV37DmzL2JFDCj0LnxjeYf49PHxyiTP2NZ8nzuGBtZ09ViDWUZ8vTYdRm
	J7nrWhdEN+gCgWv2vDuDE922rCxDY7IuzkLO5tibQ98c7vYRFbD3A74b0I3+FCkHZc9iInjMsk
	ttUysIH9YFkoboXWQTeupwDS6z808YvuNNjY8dANldh5XCHFY3B8WggCGXLgt0OA8lWiQ/lzA1
	Zb3dL/Uummd9+zxAUamqnmJw4K9zg4dg1fijcGrmDnJua/9hMwt6DOXhCDJInxE1KS7iThFeH9
	9Eg=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:08:01 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@tron.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:06 -0800
Message-Id: <20210119050631.57073-13-chaitanya.kulkarni@wdc.com>
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
Subject: [Cluster-devel] [RFC PATCH 12/37] zonefs: use bio_init_fields in
	append
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
 fs/zonefs/super.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
index bec47f2d074b..3117a89550f6 100644
--- a/fs/zonefs/super.c
+++ b/fs/zonefs/super.c
@@ -682,10 +682,9 @@ static ssize_t zonefs_file_dio_append(struct kiocb *iocb, struct iov_iter *from)
 	if (!bio)
 		return -ENOMEM;
 
-	bio_set_dev(bio, bdev);
-	bio->bi_iter.bi_sector = zi->i_zsector;
-	bio->bi_write_hint = iocb->ki_hint;
-	bio->bi_ioprio = iocb->ki_ioprio;
+	bio_init_fields(bio, bdev, zi->i_zsector, NULL, NULL, iocb->ki_ioprio,
+			iocb->ki_hint);
+
 	bio->bi_opf = REQ_OP_ZONE_APPEND | REQ_SYNC | REQ_IDLE;
 	if (iocb->ki_flags & IOCB_DSYNC)
 		bio->bi_opf |= REQ_FUA;
-- 
2.22.1

