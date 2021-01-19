Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0FACE2FB5D4
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Jan 2021 12:54:04 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-QxEk7g0MM-O4InVWi6ujVQ-1; Tue, 19 Jan 2021 06:54:01 -0500
X-MC-Unique: QxEk7g0MM-O4InVWi6ujVQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8104080670F;
	Tue, 19 Jan 2021 11:53:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DB3D1980E;
	Tue, 19 Jan 2021 11:53:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 590944BB7B;
	Tue, 19 Jan 2021 11:53:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10J58vgb020794 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 19 Jan 2021 00:08:57 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9850C63AFA; Tue, 19 Jan 2021 05:08:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 931794411D
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 05:08:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 801CE811E76
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 05:08:57 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-157-R9yMcesYMO-2UOisdQaBXA-1; Tue, 19 Jan 2021 00:08:53 -0500
X-MC-Unique: R9yMcesYMO-2UOisdQaBXA-1
IronPort-SDR: 93B5OFa9RWsvyszOF+8JfhkG3y2jzW2/3+wyJnWpNigvaSza5kLh8iKrw6+MVwwzFzrsmIVPs2
	Bfoo0eta3w4ywzx2fTYgdklOsiY/OtGuwMlyBAzrezkx8qvLCXCkDuQqv92DlWqQJv1sSzcZfR
	32m4o5bKNhyanxzzQG5AazHjzuuk4NX5BJiKGJf5JqZasprrG3awnX3Nso0zhX73Nt1Eo9C676
	sBnAx6W9Jh7ltAX7gKvkGJapm4Z+anqK7lciRA8aM1MahdnD3K0dbqo847vVcpKraG+FFTNKJd
	RZw=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="158940624"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:08:52 +0800
IronPort-SDR: 7mtiOs2KWUrDeVrdUhLCqvT2ywAWtKybI/SWZ03B9wtd/X+oaF8GftX5jsh8dQYUl8hyyk1rhG
	jPBvTKBgBVhz+H3SXXEefgpj3UOYMMx9X6v0g5FHSmouLJ74cZBPTRF8YGt0iWxQ+cKjj9D1pA
	DwZvvNsRaKKTTQdnMuRUxhO4zfsv8aoE5yn21/FR4dA5YCMSsxeZvxfzi/Y66ACvdpKmhigIUE
	f0tSgIRxz9JNbnOcdAc/+bSxRhR4x4FdUzCUdzpDsDxc1iIDKXdfggQD5CdWm8GkkLWtuD/wsH
	I6mQ+7G6S2fkdAKHmnzKbBxe
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:51:26 -0800
IronPort-SDR: zqmdr8uNSGUFgZ7LrU0GCeEBE+HwqEp3d6yRCc4vmJxwtA/Yo4CFOUY62UCXmXuPUcpvGTrzPZ
	ZvCO6cAymIpMTiIbl4e2oge4VHFzjo0lUvlL/UEVWaUmjNMbvFL6pQOn3IbgBdVAxsKv/xFkfH
	Muc3sg0LIgVa0PCQf7zl6WshjAalrUxlLiYGPDB48hNEN7m0zho6fJXM/WqCYq7SGSNzGvX8Gl
	6TzvHwI3LTXrv+sfDj/IEWvxKvmwhi3VABVseKTOUqh9RvyxCMjwM25iJM4iyI7r5ezZ5UcdOF
	Ldg=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:08:51 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@tron.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:13 -0800
Message-Id: <20210119050631.57073-20-chaitanya.kulkarni@wdc.com>
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
Subject: [Cluster-devel] [RFC PATCH 19/37] bcache: use bio_init_fields in
	super
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
 drivers/md/bcache/super.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
index a4752ac410dc..b4ced138a0c0 100644
--- a/drivers/md/bcache/super.c
+++ b/drivers/md/bcache/super.c
@@ -312,9 +312,7 @@ void bch_write_bdev_super(struct cached_dev *dc, struct closure *parent)
 	closure_init(cl, parent);
 
 	bio_init(bio, dc->sb_bv, 1);
-	bio_set_dev(bio, dc->bdev);
-	bio->bi_end_io	= write_bdev_super_endio;
-	bio->bi_private = dc;
+	bio_init_fields(bio, dc->bdev, 0, dc, write_bdev_super_endio, 0, 0);
 
 	closure_get(cl);
 	/* I/O request sent to backing device */
@@ -356,9 +354,7 @@ void bcache_write_super(struct cache_set *c)
 		ca->sb.version = version;
 
 	bio_init(bio, ca->sb_bv, 1);
-	bio_set_dev(bio, ca->bdev);
-	bio->bi_end_io	= write_super_endio;
-	bio->bi_private = ca;
+	bio_init_fields(bio, ca->bdev, 0, ca, write_super_endio, 0, 0);
 
 	closure_get(cl);
 	__write_super(&ca->sb, ca->sb_disk, bio);
@@ -402,9 +398,7 @@ static void uuid_io(struct cache_set *c, int op, unsigned long op_flags,
 
 		bio->bi_opf = REQ_SYNC | REQ_META | op_flags;
 		bio->bi_iter.bi_size = KEY_SIZE(k) << 9;
-
-		bio->bi_end_io	= uuid_endio;
-		bio->bi_private = cl;
+		bio_init_fields(bio, NULL, 0, cl, uuid_endio, 0, 0);
 		bio_set_op_attrs(bio, op, REQ_SYNC|REQ_META|op_flags);
 		bch_bio_map(bio, c->uuids);
 
@@ -566,12 +560,9 @@ static void prio_io(struct cache *ca, uint64_t bucket, int op,
 
 	closure_init_stack(cl);
 
-	bio->bi_iter.bi_sector	= bucket * ca->sb.bucket_size;
-	bio_set_dev(bio, ca->bdev);
 	bio->bi_iter.bi_size	= meta_bucket_bytes(&ca->sb);
-
-	bio->bi_end_io	= prio_endio;
-	bio->bi_private = ca;
+	bio_init_fields(bio, ca->bdev, bucket * ca->sb.bucket_size, ca,
+			prio_endio, 0, 0);
 	bio_set_op_attrs(bio, op, REQ_SYNC|REQ_META|op_flags);
 	bch_bio_map(bio, ca->disk_buckets);
 
-- 
2.22.1

