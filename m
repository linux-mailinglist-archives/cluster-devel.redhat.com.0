Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id F3A372FB5DA
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Jan 2021 12:54:05 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-V5TWIl1cPWa_-mYYnwPlsw-1; Tue, 19 Jan 2021 06:54:03 -0500
X-MC-Unique: V5TWIl1cPWa_-mYYnwPlsw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A41AB100E322;
	Tue, 19 Jan 2021 11:53:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 87E7D60C17;
	Tue, 19 Jan 2021 11:53:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 733A91809C9F;
	Tue, 19 Jan 2021 11:53:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10J5AEGr021371 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 19 Jan 2021 00:10:14 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E7B692026D11; Tue, 19 Jan 2021 05:10:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E2E992026D49
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 05:10:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 36B45101A560
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 05:10:11 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-590-Ujq-uxpLNfG8gYVD8ngSRA-1; Tue, 19 Jan 2021 00:10:06 -0500
X-MC-Unique: Ujq-uxpLNfG8gYVD8ngSRA-1
IronPort-SDR: wrwHjlxWksbSOjbKLOfhHAC+U4aT7wmC9hYS2/BB17TAHPpWRgVmbVlMVK+M4WsT3x7042LVC1
	WBdqctUo+ku6br7y+Qgbwi0DBwnsyAbVx1n1eKIcEGZROVk5rfzb6dj0rfWsuCj8s5BwIZzyKS
	Mv1eYlzxduHFMwW1PHwnl3dwj09Se6pUxAtyqKLd4Ka2jdu987IBi/0g+cerszsag9aQ3vr6Z2
	Ts6+wU3ykm2R6bMea4Mjh0UVzCTI0I9r7A4HtY68c90LrzJH0oEu1sLXycie8k0CjFJm86Vkil
	Mwk=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="261722439"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:21:35 +0800
IronPort-SDR: Pd28p+bf3mxy1iDnPmsf2stX+QJDBO7jkzzJRGWmwWAFzOpe6K4VYhndq2DU+s4HzB5AS0uFvX
	7d5zKJjZWkz+AcykpQPuedfY7hBlMAsRfTfz0Blz9ZRs1pNxdWWj/vZzXmhhvz/Gsw4mhpyBrg
	V9EPhT60/XKW4XgOQTzGxLjn8rR+y5MGJteRYmwn+7xMDJzKnPeV2p9cfDOZzYRnLBblZupYTR
	n5iMXRD/wxg3BhZ/DcGMGklTxcJEfhM2DAF4QvjXF7JHiNlV9l+KRbzGP5dnf85JV6Q4SlJnED
	hYbHGjmZWJYQ4OOQdk1Ak4eu
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:52:40 -0800
IronPort-SDR: fQMFfgdtSu8nKcxUqzclyRB9P+rBI21YWfB4xejgzd1WEdOnHm3L4SakDlfU6oc/GiImWBi40s
	xrwXfD+NR0eoiSPOERNl2yA3hT/FAiC6WXYJT29OBzUhR33jyW2a44OEEyaO8RW7lmq0Kfdbp8
	zCQCZgyL3cFPfEB3ClOgIrUgLmRSb/JHMwYFzZiPt3rsP6BzAQG3FZAe7E697plU5PyJKHWhGY
	W00r37LQP39Cea2s9M16j4CR51XnjLw+rlD/Eucyelmc2VgMjnWu4RGUyCYihZR6I9F/PiTOxm
	QL8=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:10:04 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@tron.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:23 -0800
Message-Id: <20210119050631.57073-30-chaitanya.kulkarni@wdc.com>
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
Subject: [Cluster-devel] [RFC PATCH 29/37] btrfs: use bio_init_fields in
	scrub
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
 fs/btrfs/scrub.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/btrfs/scrub.c b/fs/btrfs/scrub.c
index 5f4f88a4d2c8..1e533966ccf1 100644
--- a/fs/btrfs/scrub.c
+++ b/fs/btrfs/scrub.c
@@ -1650,10 +1650,8 @@ static int scrub_add_page_to_wr_bio(struct scrub_ctx *sctx,
 			sbio->bio = bio;
 		}
 
-		bio->bi_private = sbio;
-		bio->bi_end_io = scrub_wr_bio_end_io;
-		bio_set_dev(bio, sbio->dev->bdev);
-		bio->bi_iter.bi_sector = sbio->physical >> 9;
+		bio_init_fields(bio, sbio->dev->bdev, sbio->physical >> 9,
+				sbio, scrub_wr_bio_end_io, 0, 0);
 		bio->bi_opf = REQ_OP_WRITE;
 		sbio->status = 0;
 	} else if (sbio->physical + sbio->page_count * PAGE_SIZE !=
-- 
2.22.1

