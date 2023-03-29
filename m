Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C8B6CF09B
	for <lists+cluster-devel@lfdr.de>; Wed, 29 Mar 2023 19:08:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680109737;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZAZJI3cszmYVH87/ojs4mDfrFkC7lyCVrVL/gBZqQsA=;
	b=gMp59WDvGQ7xjMBYj82QceuObhILad8hsx5B4aAKRe8NZlVHowOajqIsiaCx7yr6/si/iW
	7cfddpeLzVf7wWu+iFjLxChAbozBaqpLU64S5y6waQ6ZaTfUynEr4gALE+BiwDfpHXEbRg
	b+pS5UHRNj267ne//sdaDY8IdXXch48=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-jmcM5MaPPw-U5lYX-UfASA-1; Wed, 29 Mar 2023 13:08:54 -0400
X-MC-Unique: jmcM5MaPPw-U5lYX-UfASA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7FADB8030D4;
	Wed, 29 Mar 2023 17:08:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6CA87A34F4;
	Wed, 29 Mar 2023 17:08:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1493019465BB;
	Wed, 29 Mar 2023 17:08:52 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C7F281946587 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 29 Mar 2023 17:07:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BD5A914171BC; Wed, 29 Mar 2023 17:07:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B533714171BB
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 17:07:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8369C8030D5
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 17:07:51 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-Ug1c3qYKPc2CdRHCvqi0Rg-1; Wed, 29 Mar 2023 13:07:49 -0400
X-MC-Unique: Ug1c3qYKPc2CdRHCvqi0Rg-1
X-IronPort-AV: E=Sophos;i="5.98,301,1673884800"; d="scan'208";a="338882595"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 Mar 2023 01:06:43 +0800
IronPort-SDR: Z2IR30jkG8dK4+yN/Yww32a9vKc07GGRdSAiuywSEleIiUYSxBrcGC7wmSDtncHAlPaCS5qxzA
 UfWCdNnd0ptTGukcsNyMG+SZogyC+4GOVfDczTgxlqIBqet+5ZnDwLsLgKqeu1De9542bltS1F
 zoENTq7bJFKahXjNdMewRpHmcWcO6+v5aoxdMqdWIMmw3vpKjvduUV1azqpYyFXU62UUgMCuAV
 hxVQaj0uc6pq+iLwIzEbd3nKu52axmqFcZ1kqrk6GT0l9qx7/hf2U6YnRVeEKxQC63NhKuhGJd
 qEw=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Mar 2023 09:22:53 -0700
IronPort-SDR: K3LvTn2mgS4z3aUZiHti9nEkM7pjvbBH6ZS/kYcx3E/VzjPdX+tted0ood1vYEc+vc7pbp55fL
 71ZnHrIDtp/LZ0g7xWSsFjKZVDSjmWu1MIOcddLaQ0QQ8DiFvqGt1SHDGt+30EdZYwUUss3ZJ5
 KHpYJp5gqdZMg4wYwQ+fxuyfJ4v5Ag1shD0OnVsp1Xt+MyUCPRAm3nfZVTezAdIkfloHRGP7Kb
 R4SjVt0dhflNVTvL7W5jpm1ArkajddHLuecePRmkHp+nFFOhkLEqvaqFM/RyBRB4b76XC4/FNz
 P4E=
WDCIronportException: Internal
Received: from unknown (HELO redsun91.ssa.fujisawa.hgst.com) ([10.149.66.72])
 by uls-op-cesaip01.wdc.com with ESMTP; 29 Mar 2023 10:06:42 -0700
From: Johannes Thumshirn <johannes.thumshirn@wdc.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 29 Mar 2023 10:05:54 -0700
Message-Id: <faae16612c163bd6e65cf3d629b0a3c65666821b.1680108414.git.johannes.thumshirn@wdc.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCH 08/19] btrfs: repair: use __bio_add_page for
 adding single page
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

