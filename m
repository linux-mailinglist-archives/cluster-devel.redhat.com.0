Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D076F4113
	for <lists+cluster-devel@lfdr.de>; Tue,  2 May 2023 12:21:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683022866;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TksHOnJypDZrr5KaC2Siyq1TxZim9ijHgxo9PaGwkEc=;
	b=dhs2ysARDhuH4D3JWRfheKDPxC13DJbkJnLS3V3FOW4KWYsRKvdbRur33hclBRJT1pdWtm
	/95bGGyz5KGPkAlH8OWcRNaS9VPcoDFvWUIDfwmoSKxgcwBnR3A3O9Kyv4DZ9ZswMMmTlB
	bbQkNLAmnNIAxAg3qiP6UzxrbUPVrIU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-rSS2zeyAMkKf0YEHF994pg-1; Tue, 02 May 2023 06:21:02 -0400
X-MC-Unique: rSS2zeyAMkKf0YEHF994pg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D032A1C04191;
	Tue,  2 May 2023 10:21:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C5985492C14;
	Tue,  2 May 2023 10:21:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B375719465A0;
	Tue,  2 May 2023 10:21:00 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 80A2B1946595 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  2 May 2023 10:20:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 73F67492B0F; Tue,  2 May 2023 10:20:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C986492B03
 for <cluster-devel@redhat.com>; Tue,  2 May 2023 10:20:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 51D5B18E0927
 for <cluster-devel@redhat.com>; Tue,  2 May 2023 10:20:59 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-lXoc79VvPN-N58c265tqng-5; Tue, 02 May 2023 06:20:54 -0400
X-MC-Unique: lXoc79VvPN-N58c265tqng-5
X-IronPort-AV: E=Sophos;i="5.99,243,1677513600"; d="scan'208";a="341747131"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 02 May 2023 18:20:53 +0800
IronPort-SDR: ALFfwJi5foxZDGxfkLU2LyqHGmiC7xX0qez3WbBqLi5W5/J/fGXyBktON/Ho6DR5ncXmHBfzGL
 tVBiVGV1gAyjTZBF52SHrvLr9biUGfZW56sklkItzQgvCGZ0Oe3oNz4NCv21mv3/hhN7p/fuS9
 QthNqzSvouawhRM1V8BVC1pwAhH0pKEUpJKyb011Q2JaGEq3csZ0EvDkSX1Xn5oRM3OYa9cpwN
 Z9FEpXj6JruCRGnn5H8aYJOnpmRyamRoP91E3b6V0E5gg+PnuGOLxxhn4ndmbnzo4J7MubWKZe
 BGU=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 May 2023 02:30:41 -0700
IronPort-SDR: lZvLJJNtit6YaDaRBpAoPeA+okMXi1NgBhcPxuv1Yj1Ti6ZR/qtMcFmyzA1CfeQK9Pm52oQ4UX
 KijqLwLr15wFCQ51AUQnZWWjgtCohUdv1nJi/CHpIu+F1EOxkUvPsh0Om8NjYgSZly+8KyWjI/
 xdAuOSlf0xZugpuHVN61JlWiVSWBV5uiFwn5N8ol3vENfCoFPsM6Ej5IFQDNt6Mdr8+XUfaqOo
 w1LhiCL74i+xYwatkvZWipXL1PHg3LZseF9wsfZrOCmoMv39jP9sPSI7W2Kyr6m8JvTNnzZ1Kh
 VWM=
WDCIronportException: Internal
Received: from myd008205.ad.shared (HELO localhost.localdomain)
 ([10.225.1.100])
 by uls-op-cesaip02.wdc.com with ESMTP; 02 May 2023 03:20:50 -0700
From: Johannes Thumshirn <johannes.thumshirn@wdc.com>
To: "axboe @ kernel . dk" <axboe@kernel.dk>
Date: Tue,  2 May 2023 12:19:18 +0200
Message-Id: <20230502101934.24901-5-johannes.thumshirn@wdc.com>
In-Reply-To: <20230502101934.24901-1-johannes.thumshirn@wdc.com>
References: <20230502101934.24901-1-johannes.thumshirn@wdc.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [Cluster-devel] [PATCH v5 04/20] fs: buffer: use __bio_add_page to
 add single page to bio
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
Cc: linux-block@vger.kernel.org, damien.lemoal@wdc.com, kch@nvidia.com,
 shaggy@kernel.org, song@kernel.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, snitzer@kernel.org,
 jfs-discussion@lists.sourceforge.net, willy@infradead.org, ming.lei@redhat.com,
 cluster-devel@redhat.com, linux-mm@kvack.org, dm-devel@redhat.com,
 hare@suse.de, linux-fsdevel@vger.kernel.org, linux-raid@vger.kernel.org,
 hch@lst.de
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: wdc.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The buffer_head submission code uses bio_add_page() to add a page to a
newly created bio. bio_add_page() can fail, but the return value is never
checked.

Use __bio_add_page() as adding a single page to a newly created bio is
guaranteed to succeed.

This brings us a step closer to marking bio_add_page() as __must_check.

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 fs/buffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index a7fc561758b1..5abc26d8399d 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -2760,7 +2760,7 @@ static void submit_bh_wbc(blk_opf_t opf, struct buffer_head *bh,
 
 	bio->bi_iter.bi_sector = bh->b_blocknr * (bh->b_size >> 9);
 
-	bio_add_page(bio, bh->b_page, bh->b_size, bh_offset(bh));
+	__bio_add_page(bio, bh->b_page, bh->b_size, bh_offset(bh));
 	BUG_ON(bio->bi_iter.bi_size != bh->b_size);
 
 	bio->bi_end_io = end_bio_bh_io_sync;
-- 
2.40.0

