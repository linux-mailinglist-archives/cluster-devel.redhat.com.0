Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3F86D0199
	for <lists+cluster-devel@lfdr.de>; Thu, 30 Mar 2023 12:44:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680173084;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oWxxzkupGP3zZ8EA8mimp1VOh/9W6PeHdnUpiZAKea0=;
	b=bgWovQKl2q3O59Q0dZvywxgE2wQBzPO5ftDhuDtgCSvT+IArVxLzc1hdnymYUZa3awEUqe
	BX7OUIhTj/cB8Om9yYg/hnVaL91IGhPfDuYRo6J8PBX8BvxrNugS6oROs8d4diYj3sk/sy
	1e7ij2QOfc8hP/G76TEvTs3ZaAreffg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-1LG6LSURN1ufjv5-NRgCUg-1; Thu, 30 Mar 2023 06:44:43 -0400
X-MC-Unique: 1LG6LSURN1ufjv5-NRgCUg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B3DB100DEB2;
	Thu, 30 Mar 2023 10:44:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 701BAC15BBA;
	Thu, 30 Mar 2023 10:44:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5491D19465B7;
	Thu, 30 Mar 2023 10:44:42 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0362C1946597 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 30 Mar 2023 10:44:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DDA61492B00; Thu, 30 Mar 2023 10:44:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D68DE492C3E
 for <cluster-devel@redhat.com>; Thu, 30 Mar 2023 10:44:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7F293C025C4
 for <cluster-devel@redhat.com>; Thu, 30 Mar 2023 10:44:37 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-599-Q9aiqBo-NrSDRzGaLlZavQ-10; Thu, 30 Mar 2023 06:44:33 -0400
X-MC-Unique: Q9aiqBo-NrSDRzGaLlZavQ-10
X-IronPort-AV: E=Sophos;i="5.98,303,1673884800"; d="scan'208";a="338948129"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 Mar 2023 18:44:32 +0800
IronPort-SDR: 9JmArhkK2SMO8CKCFz+P8o53wOlzgmJCFikZR1ftrruaO/ang2TZ6AqyH6FkxdVolY9yalNmmm
 2ZtuJCwI8wA2BUac4zYBVwepKfQDkAZ93anwfN90g/Vr2hKw/uGFwlJTJ69flr8DENZ+lcMt8V
 6frKDUCyYpVXkXE877uRE/yd71Iy6Xs/moJca3SjR4R55GmzYjl7k9cE4wZXUWIGogUJF8hUjO
 i52zoYWjvAowLwUATTQoRNyWCO4lIeVYUkQyEaa97ooW1XzWsoZGwmeRjzrO589Moz3WJtaP/3
 n+M=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Mar 2023 02:54:59 -0700
IronPort-SDR: LLyR2Npm2+MAJM3XIZClgMxoi6I/W/dIVvFOaKwZbXR+FXU/hAizNCjpHL6vVJ53LRicCLvlw6
 5vJSG8HqxBWOqmVv/563WgNcBAKcQrTbUaISiCtdAKhBTNUkKx21Cw/LpFv6nwsVXjwJUXttT1
 Ouz87wSgGmy/lK21UBktPDa5DL8h2pGw5G6UoHn1GsKFWFrgaBgxcgxKAEyMdk+8OOry+WySWP
 2F6SU6oJeDkTWv5KZR1md8qL0MPIRJYLz7AIbGmgoPFt1/WpjDzmEIsUXysP0EYjsW8qL4qhU5
 Fe4=
WDCIronportException: Internal
Received: from unknown (HELO redsun91.ssa.fujisawa.hgst.com) ([10.149.66.72])
 by uls-op-cesaip01.wdc.com with ESMTP; 30 Mar 2023 03:44:30 -0700
From: Johannes Thumshirn <johannes.thumshirn@wdc.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu, 30 Mar 2023 03:43:51 -0700
Message-Id: <e12bd574e0b6e8f12ee80e44908d8463e647053f.1680172791.git.johannes.thumshirn@wdc.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [Cluster-devel] [PATCH v2 09/19] btrfs: raid56: use __bio_add_page
 to add single page
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: wdc.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The btrfs raid58 sector submission code uses bio_add_page() to add a page
to a newly created bio. bio_add_page() can fail, but the return value is
never checked.

Use __bio_add_page() as adding a single page to a newly created bio is
guaranteed to succeed.

This brings us a step closer to marking bio_add_page() as __must_check.

Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 fs/btrfs/raid56.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/btrfs/raid56.c b/fs/btrfs/raid56.c
index 642828c1b299..c8173e003df6 100644
--- a/fs/btrfs/raid56.c
+++ b/fs/btrfs/raid56.c
@@ -1108,7 +1108,7 @@ static int rbio_add_io_sector(struct btrfs_raid_bio *rbio,
 	bio->bi_iter.bi_sector = disk_start >> 9;
 	bio->bi_private = rbio;
 
-	bio_add_page(bio, sector->page, sectorsize, sector->pgoff);
+	__bio_add_page(bio, sector->page, sectorsize, sector->pgoff);
 	bio_list_add(bio_list, bio);
 	return 0;
 }
-- 
2.39.2

