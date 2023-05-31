Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CF60E717E9B
	for <lists+cluster-devel@lfdr.de>; Wed, 31 May 2023 13:41:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685533288;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JFwZOevzZPaYPPGYr1w21C+cJT0TV2LMpZApShUn0g8=;
	b=DHfSS3KzQRQB1nzCNFoCKi4S6GxfSQ3UaFFf6h3ovcTRVD3Tx9SvTgL8138C63hexdAhzE
	p1op4ZXpa1bJ3u/5luif+rHQG7rkXFHsfRnJkD2GN9IAvoCAWpJpXoWAisXU5G+8ia0ZTX
	v4SDUAAkj2UiZA3IhpEnKxOS0X9BUPw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-376-P02w_DFrM7afXaeEXnvfnQ-1; Wed, 31 May 2023 07:41:24 -0400
X-MC-Unique: P02w_DFrM7afXaeEXnvfnQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C99C885A5BD;
	Wed, 31 May 2023 11:41:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BA8CA40CFD46;
	Wed, 31 May 2023 11:41:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A0C4419465B2;
	Wed, 31 May 2023 11:41:23 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BA5D01946595 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 31 May 2023 11:38:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9DAD640C6CD0; Wed, 31 May 2023 11:38:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 96D6740C6EC4
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 11:38:18 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 77D45280D587
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 11:38:18 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-tJvKrHTKM-6xLjlSLNS8Qw-2; Wed, 31 May 2023 07:38:14 -0400
X-MC-Unique: tJvKrHTKM-6xLjlSLNS8Qw-2
X-IronPort-AV: E=Sophos;i="6.00,207,1681142400"; d="scan'208";a="230206729"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 31 May 2023 19:38:10 +0800
IronPort-SDR: qHS3qaVvVkaTDizAJLoEN5HEGjNIpI3Yr5wyUtgapYEHRNu97KkKSDzOSlDxUSRooSNOQm3mWE
 0KJYeAXO3Ogvv7pv7BqRSGW6fjvRz9aXhfBRDQ7pF3wW0+yko4g+JE4E+mFDLGDz3V/ZB9MVme
 bAsl5E2CsCgvji6owVbx5zQOT1NqKTQguPo7C7gvx4Fs7RhrK7NWIsIxDgTHsmKz3UviWhnZlP
 UP05bUiiwxhdHuWcPJR0/6a1cANtJCFYKXH72nj9abnQIBgvw1hGUGpXW/OEgCNb+vRRXtV4g5
 A60=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 May 2023 03:53:02 -0700
IronPort-SDR: elnARq94Fzfs9J/SRdQfPNSX2Mj47szsB+03GiXquQ2ST3HVuP3adJmqVxYOTx4q+O3Ar0gSDG
 obKu1tjEmPaDp0Baw6hhej1TiKvLCydrnnSOivc5pAoD/cOgpqCNYnEP6/Mqd74RpC+Wx0vSBH
 GI3+WyE4fAK6iQr0axj5aoe3KHl8hMhJY0SalgRpsyxXvDMZmnHERLU4aQaTJg2RMSrIbWgvpC
 3iHVAQtCOiND+WXOqNqjAwGt4qQsXSe/P0EYzlIb2M+HDt/lrHj4VzKNRsn7VyLQUoD32UrxG5
 92Y=
WDCIronportException: Internal
Received: from unknown (HELO redsun91.ssa.fujisawa.hgst.com) ([10.149.66.6])
 by uls-op-cesaip02.wdc.com with ESMTP; 31 May 2023 04:38:07 -0700
From: Johannes Thumshirn <johannes.thumshirn@wdc.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 31 May 2023 04:37:43 -0700
Message-Id: <64f8ac179cc54aa316c75aaadd71e107ba12917d.1685461490.git.johannes.thumshirn@wdc.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Cluster-devel] [PATCH v6 01/20] swap: use __bio_add_page to add
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
 gouha7@uniontech.com, linux-block@vger.kernel.org,
 Damien Le Moal <damien.lemoal@wdc.com>, linux-mm@kvack.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-fsdevel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: wdc.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The swap code only adds a single page to a newly created bio. So use
__bio_add_page() to add the page which is guaranteed to succeed in this
case.

This brings us closer to marking bio_add_page() as __must_check.

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 mm/page_io.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/mm/page_io.c b/mm/page_io.c
index 87b682d18850..684cd3c7b59b 100644
--- a/mm/page_io.c
+++ b/mm/page_io.c
@@ -338,7 +338,7 @@ static void swap_writepage_bdev_sync(struct page *page,
 	bio_init(&bio, sis->bdev, &bv, 1,
 		 REQ_OP_WRITE | REQ_SWAP | wbc_to_write_flags(wbc));
 	bio.bi_iter.bi_sector = swap_page_sector(page);
-	bio_add_page(&bio, page, thp_size(page), 0);
+	__bio_add_page(&bio, page, thp_size(page), 0);
 
 	bio_associate_blkg_from_page(&bio, page);
 	count_swpout_vm_event(page);
@@ -360,7 +360,7 @@ static void swap_writepage_bdev_async(struct page *page,
 			GFP_NOIO);
 	bio->bi_iter.bi_sector = swap_page_sector(page);
 	bio->bi_end_io = end_swap_bio_write;
-	bio_add_page(bio, page, thp_size(page), 0);
+	__bio_add_page(bio, page, thp_size(page), 0);
 
 	bio_associate_blkg_from_page(bio, page);
 	count_swpout_vm_event(page);
@@ -468,7 +468,7 @@ static void swap_readpage_bdev_sync(struct page *page,
 
 	bio_init(&bio, sis->bdev, &bv, 1, REQ_OP_READ);
 	bio.bi_iter.bi_sector = swap_page_sector(page);
-	bio_add_page(&bio, page, thp_size(page), 0);
+	__bio_add_page(&bio, page, thp_size(page), 0);
 	/*
 	 * Keep this task valid during swap readpage because the oom killer may
 	 * attempt to access it in the page fault retry time check.
@@ -488,7 +488,7 @@ static void swap_readpage_bdev_async(struct page *page,
 	bio = bio_alloc(sis->bdev, 1, REQ_OP_READ, GFP_KERNEL);
 	bio->bi_iter.bi_sector = swap_page_sector(page);
 	bio->bi_end_io = end_swap_bio_read;
-	bio_add_page(bio, page, thp_size(page), 0);
+	__bio_add_page(bio, page, thp_size(page), 0);
 	count_vm_event(PSWPIN);
 	submit_bio(bio);
 }
-- 
2.40.1

