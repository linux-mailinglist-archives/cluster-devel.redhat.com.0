Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 815E97167CD
	for <lists+cluster-devel@lfdr.de>; Tue, 30 May 2023 17:50:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685461857;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=v0H6G01iGbarR6jkv3pBNWGf0keH7ufLZQ+rs2S4Px4=;
	b=S3VbDAiyeY32sCQrs7XmnlWgJU6UKMhC4REpcED4x8Kh/h7AkWWANgZoIop0db3jdDPSPV
	CCjsbois9gXuoqT3rsxj+p72xLqDfgNewaSTJ3Squ5N5AEuw5Ab1CHjh3xuLs37Va6Jxls
	jV66nj/Ls8Wny3G/UcF2Zp9mSf2vZ8E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-Ku5WYr7hM2W6v3JyKSp0LQ-1; Tue, 30 May 2023 11:50:48 -0400
X-MC-Unique: Ku5WYr7hM2W6v3JyKSp0LQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F54A101AA42;
	Tue, 30 May 2023 15:50:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 20504492B0B;
	Tue, 30 May 2023 15:50:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D09F81946A41;
	Tue, 30 May 2023 15:50:16 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 922B719452C5 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 30 May 2023 15:50:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7243840BAEE; Tue, 30 May 2023 15:50:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 69210492B00
 for <cluster-devel@redhat.com>; Tue, 30 May 2023 15:50:01 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A2F2185A7B1
 for <cluster-devel@redhat.com>; Tue, 30 May 2023 15:50:01 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-Zuy6Wpu_NVKBa0tGXqOyww-2; Tue, 30 May 2023 11:49:57 -0400
X-MC-Unique: Zuy6Wpu_NVKBa0tGXqOyww-2
X-IronPort-AV: E=Sophos;i="6.00,204,1681142400"; d="scan'208";a="231985991"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 May 2023 23:49:54 +0800
IronPort-SDR: l6oaGFPJMTZ4CIicYHcyZuaAMJyZ/vzVMly//zJbY/oN7T38DWRGJH7s6y5V/bG1OmGxNxS3nS
 rN5y3Jupb1ZdfMPShRZEiPRC55L7KPo/N3ApI3uS1eRBVq4q/y/YYEtRIx5hkkWsDwpHpvOTeh
 0mS1PJSOZwk49Y1ZkU5h5Zsp+wtgQriOwFxttrcV+HfRThp7cZiN15TUK+j8dAT32k4y/nBDCn
 avL4tsNUynS8/h2vud6yN3HBCPUn/bnB7X5yOO4j4OxI4yWhgZBKSGxFNKwUpgoZRxDqwqtUvx
 u3w=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 May 2023 08:04:47 -0700
IronPort-SDR: zGTfFG0qpO3ekSs1jkbGf4NhCicS6v3Qh5GV0UwEUz6d58kwkQKUnQDffRvOn1PEv9wQNQpTvS
 L1oZuq/z0RSqONooE5ZtKTVt8hxkZujCOVwJhVMeym4kHlGOkhBiwzfmYNOjlDQQVkrsyxQ4tH
 p80L+3HwbQfc7Jh5sAenLjk04IkjBZOWxj0Hrxyd4f/4OoEOyS4v4abehlJeUA1wJ/hSkRbMfX
 MOJa9T2/0JxEuYE5ao9I9xF38mYJMK2+8AiT0scG/a3lHdVDEa8s97Vq0v8rwx5fkZZoJMlOnW
 T3A=
WDCIronportException: Internal
Received: from unknown (HELO redsun91.ssa.fujisawa.hgst.com) ([10.149.66.6])
 by uls-op-cesaip02.wdc.com with ESMTP; 30 May 2023 08:49:51 -0700
From: Johannes Thumshirn <johannes.thumshirn@wdc.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 30 May 2023 08:49:11 -0700
Message-Id: <328ebcc2da2307aeb03ce17957a73547c1222e34.1685461490.git.johannes.thumshirn@wdc.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [Cluster-devel] [PATCH v6 08/20] jfs: logmgr: use __bio_add_page to
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
Cc: Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net,
 Song Liu <song@kernel.org>, dm-devel@redhat.com,
 Christoph Hellwig <hch@lst.de>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
 Chaitanya Kulkarni <kch@nvidia.com>, Mike Snitzer <snitzer@kernel.org>,
 Ming Lei <ming.lei@redhat.com>, linux-raid@vger.kernel.org,
 Dave Kleikamp <dave.kleikamp@oracle.com>,
 Mikulas Patocka <mpatocka@redhat.com>, Hannes Reinecke <hare@suse.de>,
 linux-block@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 gouhao@uniontech.com, linux-mm@kvack.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-fsdevel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: wdc.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The JFS IO code uses bio_add_page() to add a page to a newly created bio.
bio_add_page() can fail, but the return value is never checked.

Use __bio_add_page() as adding a single page to a newly created bio is
guaranteed to succeed.

This brings us a step closer to marking bio_add_page() as __must_check.

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Acked-by: Dave Kleikamp <dave.kleikamp@oracle.com>
Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 fs/jfs/jfs_logmgr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/jfs/jfs_logmgr.c b/fs/jfs/jfs_logmgr.c
index 695415cbfe98..15c645827dec 100644
--- a/fs/jfs/jfs_logmgr.c
+++ b/fs/jfs/jfs_logmgr.c
@@ -1974,7 +1974,7 @@ static int lbmRead(struct jfs_log * log, int pn, struct lbuf ** bpp)
 
 	bio = bio_alloc(log->bdev, 1, REQ_OP_READ, GFP_NOFS);
 	bio->bi_iter.bi_sector = bp->l_blkno << (log->l2bsize - 9);
-	bio_add_page(bio, bp->l_page, LOGPSIZE, bp->l_offset);
+	__bio_add_page(bio, bp->l_page, LOGPSIZE, bp->l_offset);
 	BUG_ON(bio->bi_iter.bi_size != LOGPSIZE);
 
 	bio->bi_end_io = lbmIODone;
@@ -2115,7 +2115,7 @@ static void lbmStartIO(struct lbuf * bp)
 
 	bio = bio_alloc(log->bdev, 1, REQ_OP_WRITE | REQ_SYNC, GFP_NOFS);
 	bio->bi_iter.bi_sector = bp->l_blkno << (log->l2bsize - 9);
-	bio_add_page(bio, bp->l_page, LOGPSIZE, bp->l_offset);
+	__bio_add_page(bio, bp->l_page, LOGPSIZE, bp->l_offset);
 	BUG_ON(bio->bi_iter.bi_size != LOGPSIZE);
 
 	bio->bi_end_io = lbmIODone;
-- 
2.40.1

