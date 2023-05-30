Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0DA716801
	for <lists+cluster-devel@lfdr.de>; Tue, 30 May 2023 17:52:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685461948;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=coh5CBUvVZIC7R6lhSdYV3LoxqSD+fY+F1rkUy818H4=;
	b=hvax6s8JOTSBzRhpj9ul1Mpp4JZEVgFAGMygSlGsuNnbaeo5ywEhgRJsdFBFijbXxJDXJt
	rI1GKQd8FI5frB5/LgOST2fQmlYMm4fRwsayExedzARNcu0myEZsIswMPnXTK4AEmtrEtN
	nB3UmrwKoxGYRRO0GebC5Yg0fRyI//0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-48-vdUCPKurMH2TrCdzctU-Ow-1; Tue, 30 May 2023 11:52:26 -0400
X-MC-Unique: vdUCPKurMH2TrCdzctU-Ow-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 689683825BB0;
	Tue, 30 May 2023 15:52:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5CCC517103;
	Tue, 30 May 2023 15:52:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B7D4E19452C9;
	Tue, 30 May 2023 15:51:04 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BB8BF1946595 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 30 May 2023 15:50:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A5342C154D2; Tue, 30 May 2023 15:50:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DB08C154D1
 for <cluster-devel@redhat.com>; Tue, 30 May 2023 15:50:20 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DD4685A5B5
 for <cluster-devel@redhat.com>; Tue, 30 May 2023 15:50:20 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-Jjetg8HMNUOtN6dg53zqmg-5; Tue, 30 May 2023 11:50:16 -0400
X-MC-Unique: Jjetg8HMNUOtN6dg53zqmg-5
X-IronPort-AV: E=Sophos;i="6.00,204,1681142400"; d="scan'208";a="231986043"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 May 2023 23:50:15 +0800
IronPort-SDR: w2yvAwzkk3nSffqoywfWBAkuTp5heGnw7EArn+HKI20fiMe2js8gWB2s/I6UsvV+pxCoE4Pp7v
 30uz3edo1AIb5ta+xk2hAI3zCuhQW1GhLFzlheDPCsFLlWazAXX9yXz1uaxdOPF5xHJHFEymHH
 Q0RM9ih6VG/ViLrqhVXftuLv+G9/Dqi1HjNpzGYlkEnbqVLqofiaS6sAQVmsmu9dngUd7kueVG
 z+gqvhahKB8x+/eeXjwCZIojjJen2WvaM7lbOnbN8rpKi7zKhSuVe3UslwgCHqjNyDJvaCscXa
 VEI=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 May 2023 08:05:08 -0700
IronPort-SDR: 7c9W4va7M7i7mOYdzqZM8x7PuIzd8bUXS81kk72ffccwZ6ZkU4gnwE7FR84LvLjYB86fEAuYwt
 cXn5GwLOtz5LieaQs84gdIlp6RO2hZOK/Ic6UwD4MNGrVkqvJ5LsygmJvgCDU0mJKU4+2g9Rib
 NOa0IbGiRr60yWN5pk4jtqYmp4DsQOvrRO9O0wvUsb0lo8oWhw/bmV6Xf7GGSKfY/bdv8SGb7j
 X21UMdAublIFCrvsHnUfL3ViWaZJVFO/anGXJGxTYW7s2jPCdwz49/iJqACLwkL9I9X1q4xZdH
 KrA=
WDCIronportException: Internal
Received: from unknown (HELO redsun91.ssa.fujisawa.hgst.com) ([10.149.66.6])
 by uls-op-cesaip02.wdc.com with ESMTP; 30 May 2023 08:50:12 -0700
From: Johannes Thumshirn <johannes.thumshirn@wdc.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 30 May 2023 08:49:18 -0700
Message-Id: <c60c6f46b70c96b528b6c4746918ea87c2a01473.1685461490.git.johannes.thumshirn@wdc.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Cluster-devel] [PATCH v6 15/20] md: raid1: check if adding pages
 to resync bio fails
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

Check if adding pages to resync bio fails and if bail out.

As the comment above suggests this cannot happen, WARN if it actually
happens.

This way we can mark bio_add_pages as __must_check.

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Acked-by: Song Liu <song@kernel.org>
Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 drivers/md/raid1-10.c | 11 ++++++-----
 drivers/md/raid10.c   | 20 ++++++++++----------
 2 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/md/raid1-10.c b/drivers/md/raid1-10.c
index e61f6cad4e08..cd349e69ed77 100644
--- a/drivers/md/raid1-10.c
+++ b/drivers/md/raid1-10.c
@@ -101,11 +101,12 @@ static void md_bio_reset_resync_pages(struct bio *bio, struct resync_pages *rp,
 		struct page *page = resync_fetch_page(rp, idx);
 		int len = min_t(int, size, PAGE_SIZE);
 
-		/*
-		 * won't fail because the vec table is big
-		 * enough to hold all these pages
-		 */
-		bio_add_page(bio, page, len, 0);
+		if (WARN_ON(!bio_add_page(bio, page, len, 0))) {
+			bio->bi_status = BLK_STS_RESOURCE;
+			bio_endio(bio);
+			return;
+		}
+
 		size -= len;
 	} while (idx++ < RESYNC_PAGES && size > 0);
 }
diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
index 4fcfcb350d2b..381c21f7fb06 100644
--- a/drivers/md/raid10.c
+++ b/drivers/md/raid10.c
@@ -3819,11 +3819,11 @@ static sector_t raid10_sync_request(struct mddev *mddev, sector_t sector_nr,
 		for (bio= biolist ; bio ; bio=bio->bi_next) {
 			struct resync_pages *rp = get_resync_pages(bio);
 			page = resync_fetch_page(rp, page_idx);
-			/*
-			 * won't fail because the vec table is big enough
-			 * to hold all these pages
-			 */
-			bio_add_page(bio, page, len, 0);
+			if (WARN_ON(!bio_add_page(bio, page, len, 0))) {
+				bio->bi_status = BLK_STS_RESOURCE;
+				bio_endio(bio);
+				goto giveup;
+			}
 		}
 		nr_sectors += len>>9;
 		sector_nr += len>>9;
@@ -4997,11 +4997,11 @@ static sector_t reshape_request(struct mddev *mddev, sector_t sector_nr,
 		if (len > PAGE_SIZE)
 			len = PAGE_SIZE;
 		for (bio = blist; bio ; bio = bio->bi_next) {
-			/*
-			 * won't fail because the vec table is big enough
-			 * to hold all these pages
-			 */
-			bio_add_page(bio, page, len, 0);
+			if (WARN_ON(!bio_add_page(bio, page, len, 0))) {
+				bio->bi_status = BLK_STS_RESOURCE;
+				bio_endio(bio);
+				return sectors_done;
+			}
 		}
 		sector_nr += len >> 9;
 		nr_sectors += len >> 9;
-- 
2.40.1

