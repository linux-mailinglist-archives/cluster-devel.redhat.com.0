Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CA17167B8
	for <lists+cluster-devel@lfdr.de>; Tue, 30 May 2023 17:50:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685461827;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AKDiQc5c5mMUE+M48Yw66vq1cPaHt+34Qu81mFVf1Zw=;
	b=izxxShAR0ED0aFm5G0LO1I2Xze8znFEhUybQ7YuqUMbtTyfeq2U29AnDR8svABt3IMe9HE
	eTcn/o1uTvfsK0+yLJCWpMysEjgSDxRL7/thXM8hCRF0X0rbISlhYR+WDBO57gw+uWKnJa
	aGh+3IgG6+9JIkzhmGHfeugy7lmHP7U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-UsEx03FZO3GOHcthDv3Mvw-1; Tue, 30 May 2023 11:50:23 -0400
X-MC-Unique: UsEx03FZO3GOHcthDv3Mvw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDB4D3C11A2A;
	Tue, 30 May 2023 15:50:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E1FF4421C3;
	Tue, 30 May 2023 15:50:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3AFEC19452C8;
	Tue, 30 May 2023 15:50:02 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4F5881946595 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 30 May 2023 15:49:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2298A112132E; Tue, 30 May 2023 15:49:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BB79112132C
 for <cluster-devel@redhat.com>; Tue, 30 May 2023 15:49:47 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2F9C8039AB
 for <cluster-devel@redhat.com>; Tue, 30 May 2023 15:49:46 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-396-H7QJJE6uOdaes_Fs9zDozQ-2; Tue, 30 May 2023 11:49:44 -0400
X-MC-Unique: H7QJJE6uOdaes_Fs9zDozQ-2
X-IronPort-AV: E=Sophos;i="6.00,204,1681142400"; d="scan'208";a="231905673"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 May 2023 23:49:40 +0800
IronPort-SDR: cusp5fVdZKy67CPwNMuYDkQWu3YYdmxSmEdIt839dLsC3liFSJ2ExwJHljfYksdyQkIeZ2719O
 oqhu9cZAsOSL4j82Y1eTKqG0hJ4CI1IRE2jJuO6H/wG1ISflB3RUAUD2WwhrJ4QHubC1HCw+fz
 ghPLpQIkAQJEjcgJ+eTdFYAb5v4cMJe9q/+njGgJYDteyApMcpiwS7uqkNuSVGp03n8W1jWMQE
 AVlKbjIvdVb0SQ6pFZEHDBGk94jNgUhvtli/Iqys9h8ZVTEUeJsafIyHaEApcwUJ+ECAphgLxb
 Ou8=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 May 2023 08:04:31 -0700
IronPort-SDR: yyyyMz2TAyAtxiGu5+SWb7d/x9PogCVD4itlH+FOZL5M/obbujzn0nPyfJX5f76wmH56HSlR9F
 zkurIL57b/oE5ItIAM3mh+0TCxwpK0Osc0l70ZtbuGZDq2Rs1n51DtbbNViftHEWLZ73mey9zy
 2cUmbpQh/Z5J5zOcjj/YTd3YK2PiCTKftG8A1EENSystxnnFIuMK7Oe+UZdJx94whGX4awAqm2
 /U8JBrcdaMvSOP4HNMkLK5PxyRVKrvl3XxjQW8zcaD6MbGJ9RpKug8LVrI9FIoeuVVWNz6eSxF
 8ic=
WDCIronportException: Internal
Received: from unknown (HELO redsun91.ssa.fujisawa.hgst.com) ([10.149.66.6])
 by uls-op-cesaip02.wdc.com with ESMTP; 30 May 2023 08:49:32 -0700
From: Johannes Thumshirn <johannes.thumshirn@wdc.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 30 May 2023 08:49:05 -0700
Message-Id: <fb78f4208bb5d1f4032be20d9ee1210468ba3f40.1685461490.git.johannes.thumshirn@wdc.com>
In-Reply-To: <cover.1685461490.git.johannes.thumshirn@wdc.com>
References: <cover.1685461490.git.johannes.thumshirn@wdc.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [PATCH v6 02/20] drbd: use __bio_add_page to add
 page to bio
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net,
 Song Liu <song@kernel.org>, dm-devel@redhat.com,
 Christoph Hellwig <hch@lst.de>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
 Chaitanya Kulkarni <kch@nvidia.com>, Mike Snitzer <snitzer@kernel.org>,
 Ming Lei <ming.lei@redhat.com>, linux-raid@vger.kernel.org,
 Mikulas Patocka <mpatocka@redhat.com>, Hannes Reinecke <hare@suse.de>,
 linux-block@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 gouhao@uniontech.com, linux-mm@kvack.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-fsdevel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: wdc.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The drbd code only adds a single page to a newly created bio. So use
__bio_add_page() to add the page which is guaranteed to succeed in this
case.

This brings us closer to marking bio_add_page() as __must_check.

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 drivers/block/drbd/drbd_bitmap.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/block/drbd/drbd_bitmap.c b/drivers/block/drbd/drbd_bitmap.c
index 6ac8c54b44c7..85ca000a0564 100644
--- a/drivers/block/drbd/drbd_bitmap.c
+++ b/drivers/block/drbd/drbd_bitmap.c
@@ -1043,9 +1043,7 @@ static void bm_page_io_async(struct drbd_bm_aio_ctx *ctx, int page_nr) __must_ho
 	bio = bio_alloc_bioset(device->ldev->md_bdev, 1, op, GFP_NOIO,
 			&drbd_md_io_bio_set);
 	bio->bi_iter.bi_sector = on_disk_sector;
-	/* bio_add_page of a single page to an empty bio will always succeed,
-	 * according to api.  Do we want to assert that? */
-	bio_add_page(bio, page, len, 0);
+	__bio_add_page(bio, page, len, 0);
 	bio->bi_private = ctx;
 	bio->bi_end_io = drbd_bm_endio;
 
-- 
2.40.1

