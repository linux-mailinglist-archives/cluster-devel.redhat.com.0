Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5DA6D019C
	for <lists+cluster-devel@lfdr.de>; Thu, 30 Mar 2023 12:44:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680173085;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=H3wR0rPg0qOZQvHBdeM7QAiBsaXT+YG7F8LTZ5CEjEA=;
	b=D0dso2MqLE77AsBLwVRO98OfT+Yi4MF+vhDfVrIbEHygERZ9IIAHtNspQrBLW9tgQR9DTQ
	WqSyeM6HtB9H/2EWeQuQGXVkOPTZsU7QUgh/aCnhW0IJOGjN9N9yt0n3P/WidzIAEOV8r6
	KUeeDp8RdXc06bgSX+hCGcPMSmxwWq4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-ARGDYpKtNj2jOsqnOU9kuQ-1; Thu, 30 Mar 2023 06:44:42 -0400
X-MC-Unique: ARGDYpKtNj2jOsqnOU9kuQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 414843823A13;
	Thu, 30 Mar 2023 10:44:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 32E4A492B0A;
	Thu, 30 Mar 2023 10:44:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 28FEB19465BB;
	Thu, 30 Mar 2023 10:44:41 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2615F1946587 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 30 Mar 2023 10:44:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0A8FA14171BC; Thu, 30 Mar 2023 10:44:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 02B2A14171BB
 for <cluster-devel@redhat.com>; Thu, 30 Mar 2023 10:44:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DAC8F801779
 for <cluster-devel@redhat.com>; Thu, 30 Mar 2023 10:44:35 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-599-fSni5mtSOVWlzoYW6vo0mA-9; Thu, 30 Mar 2023 06:44:30 -0400
X-MC-Unique: fSni5mtSOVWlzoYW6vo0mA-9
X-IronPort-AV: E=Sophos;i="5.98,303,1673884800"; d="scan'208";a="338948122"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 Mar 2023 18:44:29 +0800
IronPort-SDR: 7yumelmKpYI2chZzPEXW+fyxlE5WhrNeQv2X8DXkwpE516/cfqM3taja2SuA9E/YL/7Qcgzz/F
 eoKv5vkOnBWx4sGYCIwEZ0H0xFA7HfYU5cpQ9pXNh7Yh+zJ6qX8RKD42P3l2Z4tsIGPbWUegW6
 sQlUCcfCXi9+TYbNDmZ+kfx2QS+qFgoPDnl1HKmWcY2cSJ9/P5ZWbAMUwMMJpbKyivSUmUMo9Z
 lPOTF4qfOiWiedWmrCvMAghtObybx/z7BUki47Z5zv9MkSFkfXSQOPdVWyHPhlV+d0l1i/nHbD
 z58=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Mar 2023 02:54:57 -0700
IronPort-SDR: 7VfBtatRUAMSKGZJhueT2GpjhxB7O4zmUTxm3R9MTyW1KAXQy9vKW9iV7AuhhA2jy1ZSsCp98O
 U1y/h8ZeZN+sRqZVsvVO4hAs927WNwruX7ksWwSZxQaZ7PhnaOJXPNDyTm+sgyqtE99mUZ4qrY
 atKl3lP0PB5GGkREm/HXgG7Yx5KK5w8jOv26buUSZPHatbFFFBRCcm6OyZcoqfvlkdXIYWwkqC
 cF0K5nj/s7lS0zwe1pS6KOfyNTJKWJLOIHUhjXr+avwW9dLSK/XfwgZxojo4KfnWNQ5FGo1gwc
 c7Q=
WDCIronportException: Internal
Received: from unknown (HELO redsun91.ssa.fujisawa.hgst.com) ([10.149.66.72])
 by uls-op-cesaip01.wdc.com with ESMTP; 30 Mar 2023 03:44:27 -0700
From: Johannes Thumshirn <johannes.thumshirn@wdc.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu, 30 Mar 2023 03:43:50 -0700
Message-Id: <92c80a1b14a7f9cab366cce2e7c5778de5e0d6d3.1680172791.git.johannes.thumshirn@wdc.com>
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
Subject: [Cluster-devel] [PATCH v2 08/19] btrfs: repair: use __bio_add_page
 for adding single page
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: wdc.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The btrfs repair bio submission code uses bio_add_page() to add a page to
a newly created bio. bio_add_page() can fail, but the return value is
never checked.

Use __bio_add_page() as adding a single page to a newly created bio is
guaranteed to succeed.

This brings us a step closer to marking bio_add_page() as __must_check.

Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 fs/btrfs/bio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/btrfs/bio.c b/fs/btrfs/bio.c
index 726592868e9c..73220a219c91 100644
--- a/fs/btrfs/bio.c
+++ b/fs/btrfs/bio.c
@@ -224,7 +224,7 @@ static struct btrfs_failed_bio *repair_one_sector(struct btrfs_bio *failed_bbio,
 	repair_bio = bio_alloc_bioset(NULL, 1, REQ_OP_READ, GFP_NOFS,
 				      &btrfs_repair_bioset);
 	repair_bio->bi_iter.bi_sector = failed_bbio->saved_iter.bi_sector;
-	bio_add_page(repair_bio, bv->bv_page, bv->bv_len, bv->bv_offset);
+	__bio_add_page(repair_bio, bv->bv_page, bv->bv_len, bv->bv_offset);
 
 	repair_bbio = btrfs_bio(repair_bio);
 	btrfs_bio_init(repair_bbio, failed_bbio->inode, NULL, fbio);
-- 
2.39.2

