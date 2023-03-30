Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A23E06D01BB
	for <lists+cluster-devel@lfdr.de>; Thu, 30 Mar 2023 12:45:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680173111;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2MNTZ8hIqQZr33tFK5vOCN2kPp+OQOLapHSQ9vn8FYg=;
	b=GHQMGLMZCcDNj8sgpN/8Yn4w8xJN86o9HD3FXmrmknDgzE/EaKANJW1HasJe/Rpi18Y6kt
	T/F0EYGGXBZFWENfSCdRXqKzKmqJqNLNFo7nmmRjn+X9XxqTQVUe5bzXumkaAQMyU+vz2U
	Y684rqfj7bjI46xH59mqQ485G2H4pJw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-59-3YtC5nadO2qF-r1hhoe_Og-1; Thu, 30 Mar 2023 06:45:06 -0400
X-MC-Unique: 3YtC5nadO2qF-r1hhoe_Og-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B277885A5A3;
	Thu, 30 Mar 2023 10:45:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A815F2166B33;
	Thu, 30 Mar 2023 10:45:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9B85919465A2;
	Thu, 30 Mar 2023 10:45:05 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C96DD1946587 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 30 Mar 2023 10:45:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BB17614171BB; Thu, 30 Mar 2023 10:45:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B3F22140E96A
 for <cluster-devel@redhat.com>; Thu, 30 Mar 2023 10:45:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 939283C1178E
 for <cluster-devel@redhat.com>; Thu, 30 Mar 2023 10:45:04 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-599-askTNKsEPciVUPFWl8xpIg-19; Thu, 30 Mar 2023 06:45:00 -0400
X-MC-Unique: askTNKsEPciVUPFWl8xpIg-19
X-IronPort-AV: E=Sophos;i="5.98,303,1673884800"; d="scan'208";a="338948198"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 Mar 2023 18:44:59 +0800
IronPort-SDR: DbBaVBI/3sRakUWHqWkrKmMQyhrZQr2W8X+HHnjzkG8rLeaWkiq5kt07RF9POl16Ge6s47hFKU
 N7XZKLBrWgDUNkpLRAcn5bHbb8gE9fyhREVsQ90kafoUFHil+WXMzA+4AGIUmq0h9kIGDaH5UF
 TY37ATGrQEBay25HW/KIYvPX1iB6iOEGKQM9HpAqrdGXZzk1PqlbDOY2lcNbq3Q5tnfaZ1tEH7
 gLnD3n5DUpT6YiJepvA29SQXBtIIaxND0zPdjg9MmxZnzM7xmFs4EEJRkjanse5XCSNRUSa4hI
 yyA=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Mar 2023 02:55:26 -0700
IronPort-SDR: Uz7s+Dcx6yIQkvOUQB+fZBcewu2LBoSQ3pKR+yorfvauRCwyEfsemTaCli7NU9SOzvmIsB3Hts
 tNYBtX+nfuDEC5uXsXRcTKBMvdR7SGstEuCQUjhfSDF+BiYqMb/6WvHW+SrRgnWUnB48Q4E2C4
 fbh8vMwc892YV531EYcZRUKNAzwNrgHgza3EAt8v4dtp8X3HEbGwrP9VyDAFzQUEaHs+TfI18c
 xIpJgsXVErH/79qMVG8Ygjlt4VP7eLqwzcPd+tJBQVyBPVtGsmWswAn0jdBYeDXDy1fyvy4CzS
 HRA=
WDCIronportException: Internal
Received: from unknown (HELO redsun91.ssa.fujisawa.hgst.com) ([10.149.66.72])
 by uls-op-cesaip01.wdc.com with ESMTP; 30 Mar 2023 03:44:57 -0700
From: Johannes Thumshirn <johannes.thumshirn@wdc.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu, 30 Mar 2023 03:44:00 -0700
Message-Id: <84973c41d58473dd50324853fb88a7fcff55745b.1680172791.git.johannes.thumshirn@wdc.com>
In-Reply-To: <cover.1680172791.git.johannes.thumshirn@wdc.com>
References: <cover.1680172791.git.johannes.thumshirn@wdc.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCH v2 18/19] dm-crypt: check if adding pages to
 clone bio fails
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
 Hannes Reinecke <hare@suse.de>, David Sterba <dsterba@suse.com>,
 linux-block@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 linux-mm@kvack.org, Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: wdc.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Check if adding pages to clone bio fails and if it does retry with
reclaim. This mirrors the behaviour of page allocation in
crypt_alloc_buffer().

This way we can mark bio_add_pages as __must_check.

Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 drivers/md/dm-crypt.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 3ba53dc3cc3f..19f7e087c6df 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -1693,7 +1693,14 @@ static struct bio *crypt_alloc_buffer(struct dm_crypt_io *io, unsigned int size)
 
 		len = (remaining_size > PAGE_SIZE) ? PAGE_SIZE : remaining_size;
 
-		bio_add_page(clone, page, len, 0);
+		if (!bio_add_page(clone, page, len, 0)) {
+			mempool_free(page, &cc->page_pool);
+			crypt_free_buffer_pages(cc, clone);
+			bio_put(clone);
+			gfp_mask |= __GFP_DIRECT_RECLAIM;
+			goto retry;
+
+		}
 
 		remaining_size -= len;
 	}
-- 
2.39.2

