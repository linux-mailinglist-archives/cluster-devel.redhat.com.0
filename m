Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EB56CF089
	for <lists+cluster-devel@lfdr.de>; Wed, 29 Mar 2023 19:08:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680109711;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=x02oUNjO7QJjWY1PXTXGuNFM/HVTI0Li9/Hh3mHsQyc=;
	b=cOWoa3IaR7gN2fr0l5Vo32cjTDpyau3uAgFWB5Rri/N7s8RVGXKsskNZtxEXFpPRMke6iQ
	Tz5kv/acGFxJ8P7VNrwHEjfxtKpeLJzk2NqfzLLA5lX707VtxZOUjy8+Tm31wq0jPbrYMy
	lwPh3F2LRMznET2/p/Vzx+PZDp7dhGs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-W1JUMTlhNv2auNnZTFjR8w-1; Wed, 29 Mar 2023 13:08:26 -0400
X-MC-Unique: W1JUMTlhNv2auNnZTFjR8w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 569C4802D32;
	Wed, 29 Mar 2023 17:08:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4AB9114171BB;
	Wed, 29 Mar 2023 17:08:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3B010194658D;
	Wed, 29 Mar 2023 17:08:25 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 65F681946587 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 29 Mar 2023 17:07:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 571B1492B02; Wed, 29 Mar 2023 17:07:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FE38492B00
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 17:07:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 329813C0C8B0
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 17:07:53 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-111-Rwo1izbpNcOoHv4fbajjLQ-6; Wed, 29 Mar 2023 13:07:51 -0400
X-MC-Unique: Rwo1izbpNcOoHv4fbajjLQ-6
X-IronPort-AV: E=Sophos;i="5.98,301,1673884800"; d="scan'208";a="338882602"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 Mar 2023 01:06:46 +0800
IronPort-SDR: behiMJSQgrZKD1dU84tJ/YL9rjowP2aArrPXXtUp6I3XQlo8K1zZPbZOonHLX56/byL6tvVNvE
 7rATUqUfSRtuCfMWKkP2iTawrMir7W17Igs3GAkpk1k2xQMK8HxbRhNtYyp7dYa/W5d3gfM8LO
 xMZZZ+lrJ2bAHl6ySUEozCR/lCUlbRHBBDCChrtlxYMGbN5lvxdIB0w+/7rArwDnADxS0ANQLb
 Jebpjn6ua2W50p98Z8MF6qpgMVTAmSNyvkKQq+O4SjW90uixLYudISJ6DGVThcjQZaGVx9SRVz
 PZM=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Mar 2023 09:22:56 -0700
IronPort-SDR: MOOXixcYEV1/J4lyBRhkoD3BrfkuwpVTjAnSNbGauDrQItggC4QoQ11Hy/5dh8cwJqG4TR0IkO
 Lnow8+4PjvklzXGKvuMnewjdhwfoe2RXCWLLrlvUTUex+DEDozd3vEEbQbLHW3vObVIOGbX5+L
 9twd+og8XKgLZTmhzd7AQK5yODOqOEQMLfsU73Gxn69Zp7ZgBbmVcFqWvAs2LM4xS7ajmwhg/x
 f+DcHorKiciGGPhCff17T/c0ZTt7hWf/JGR8UxngNwnUUQ1TMJefX0ET3IFIG0c8MJgSPEpX7y
 R+E=
WDCIronportException: Internal
Received: from unknown (HELO redsun91.ssa.fujisawa.hgst.com) ([10.149.66.72])
 by uls-op-cesaip01.wdc.com with ESMTP; 29 Mar 2023 10:06:45 -0700
From: Johannes Thumshirn <johannes.thumshirn@wdc.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 29 Mar 2023 10:05:55 -0700
Message-Id: <5ce38530bc488f9d4f1692d701ca7ad5ea8ca3e9.1680108414.git.johannes.thumshirn@wdc.com>
In-Reply-To: <cover.1680108414.git.johannes.thumshirn@wdc.com>
References: <cover.1680108414.git.johannes.thumshirn@wdc.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [Cluster-devel] [PATCH 09/19] btrfs: raid56: use __bio_add_page to
 add single page
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
Cc: linux-raid@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 cluster-devel@redhat.com, Chaitanya Kulkarni <kch@nvidia.com>,
 Song Liu <song@kernel.org>, Dave Kleikamp <shaggy@kernel.org>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Mike Snitzer <snitzer@kernel.org>, jfs-discussion@lists.sourceforge.net,
 Matthew Wilcox <willy@infradead.org>, Ming Lei <ming.lei@redhat.com>,
 linux-block@vger.kernel.org, linux-mm@kvack.org, dm-devel@redhat.com,
 David Sterba <dsterba@suse.com>, Hannes Reinecke <hare@suse.de>,
 linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

