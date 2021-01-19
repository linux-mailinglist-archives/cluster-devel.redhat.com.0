Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 00E072FB5CC
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Jan 2021 12:54:01 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-JA5QZ_-xMuiGZsNAWPp4iw-1; Tue, 19 Jan 2021 06:53:59 -0500
X-MC-Unique: JA5QZ_-xMuiGZsNAWPp4iw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C481D8066F0;
	Tue, 19 Jan 2021 11:53:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A090960C68;
	Tue, 19 Jan 2021 11:53:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8B8804EBC6;
	Tue, 19 Jan 2021 11:53:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10J57wVV020379 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 19 Jan 2021 00:07:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 57CA9112D16F; Tue, 19 Jan 2021 05:07:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 53C13112D169
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 05:07:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41355858EEC
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 05:07:56 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-475-YIFc_wDjOqWahJVmnscWqQ-1; Tue, 19 Jan 2021 00:07:48 -0500
X-MC-Unique: YIFc_wDjOqWahJVmnscWqQ-1
IronPort-SDR: sKLjB0XiBiJ1D3WZZTd6uym07WVoWRlt7/w0cvn0J5QRVHdNQMjavufLRZpaldrIQyv7QxcUAB
	nhaXqeVtbeMlAT6zLUMToFVSRTSMl76xvrdV3XYbWgWjpSTkZZMFVCTmQLSmjh4mSGYXzl9L++
	9MNGMAa09CYNSCI4FiH6pf+mwIiMYOrgid8vgIKWECsugjAkYL4uUu56Hg9o78wCZELIlRm89B
	M1DVZVkU8yIJ1w9bFvBzhhLrM7qvVmxuOZUfITv4VBGm5mwribDSKSqaaBl+zpJRA+MPAMjHf6
	vyU=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="261722173"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:18:07 +0800
IronPort-SDR: nKzAABCIAElIm3lxyJo8h8I//pxEyDVbU+OXEHYfwh6Z2+xa8SIuBZWFOHh5NWSgqltb8Cvelo
	penE3SjNv6SCZEudqLZmrhceq1Nj+rmTfJR8VxhbBDappCVc5rLBaPt6k/MDR6Vem6p6DgMdds
	6EZdSFgASt/ysrkBEwNyO3S/c3jwdLA3HXdUWem+QkB+zHCSZqD73CZSdh7BKcP+rAgNKGHtDe
	nqloH/42bHbCWQmQgYZsNUmI1KhJ3bGbGinAHVNX0QKOeFUiK5rZ5FR4EkrvRBbRQ3aegwfMgO
	WqmiNXEfvo44js2jyDo0sZvM
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:50:22 -0800
IronPort-SDR: z0ZW9dyPTLw53eARwPq8+5nuJJ+yGnb1S3afLxWS5cRMuD3GO8FzJcyb/494viUnLZ93FPHi6a
	3MdikG0yU2ucYS4a+pszMPxdsf3jMw5J2ahGcJgTTzK3LHcPj0MYZR0Q1pR6fYTjIlk5jXhiBg
	wsBVE9/ViYCXjpOk05UySgjB2d/pwdD0R6sXtZQT/+GSCaDzW5cIOqfqIiFsiuqf2/hNL4trLe
	wWdFviDzfdU8EZetm7X+/kphay2DvflOFtCnqYvJIkQCp+kSJnhyMAhfqOGFMVkkVdPhO/0qgy
	FxQ=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:07:47 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@tron.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:04 -0800
Message-Id: <20210119050631.57073-11-chaitanya.kulkarni@wdc.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
Subject: [Cluster-devel] [RFC PATCH 10/37] iomap: use bio_init_fields in
	direct-io
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
 fs/iomap/direct-io.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
index 933f234d5bec..3756dbf51909 100644
--- a/fs/iomap/direct-io.c
+++ b/fs/iomap/direct-io.c
@@ -190,10 +190,8 @@ iomap_dio_zero(struct iomap_dio *dio, struct iomap *iomap, loff_t pos,
 	struct bio *bio;
 
 	bio = bio_alloc(GFP_KERNEL, 1);
-	bio_set_dev(bio, iomap->bdev);
-	bio->bi_iter.bi_sector = iomap_sector(iomap, pos);
-	bio->bi_private = dio;
-	bio->bi_end_io = iomap_dio_bio_end_io;
+	bio_init_fields(bio, iomap->bdev, iomap_sector(iomap, pos), dio,
+			iomap_dio_bio_end_io, 0, 0);
 
 	get_page(page);
 	__bio_add_page(bio, page, len, 0);
@@ -272,12 +270,9 @@ iomap_dio_bio_actor(struct inode *inode, loff_t pos, loff_t length,
 		}
 
 		bio = bio_alloc(GFP_KERNEL, nr_pages);
-		bio_set_dev(bio, iomap->bdev);
-		bio->bi_iter.bi_sector = iomap_sector(iomap, pos);
-		bio->bi_write_hint = dio->iocb->ki_hint;
-		bio->bi_ioprio = dio->iocb->ki_ioprio;
-		bio->bi_private = dio;
-		bio->bi_end_io = iomap_dio_bio_end_io;
+		bio_init_fields(bio, iomap->bdev, iomap_sector(iomap, pos), dio,
+				iomap_dio_bio_end_io, dio->iocb->ki_ioprio,
+				dio->iocb->ki_hint);
 
 		ret = bio_iov_iter_get_pages(bio, dio->submit.iter);
 		if (unlikely(ret)) {
-- 
2.22.1

