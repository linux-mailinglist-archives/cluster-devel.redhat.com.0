Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2AE717F9F
	for <lists+cluster-devel@lfdr.de>; Wed, 31 May 2023 14:08:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685534882;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sNH7pVmdygoeCZgHZmSqANM+8vLZ64wXe5n0PirP0kQ=;
	b=MLTsftR4M6gXvmqapmOgHkSZdh9JJ4KBSsDg7JMTRB2S4OUOgzc5vq3uvZ/QdlZvWMlLk8
	LJpgAVOHkTNlSweEewPB3eG5S7kdNhouN9s75sxL6sfqEuWbELh/MPfwdD2RyUVOvd6TWs
	ucRGRyPaVCABcIyPFXir3EPX6fgDXy0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-oJCnnDnEOk-lavTPA4j0Hw-1; Wed, 31 May 2023 08:07:57 -0400
X-MC-Unique: oJCnnDnEOk-lavTPA4j0Hw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F577802E58;
	Wed, 31 May 2023 12:07:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5202CC154D7;
	Wed, 31 May 2023 12:07:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2BFDB19452CC;
	Wed, 31 May 2023 12:07:40 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0719C1946595 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 31 May 2023 11:51:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DA21B140E963; Wed, 31 May 2023 11:51:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D3368140E962
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 11:51:49 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B50AC811E7C
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 11:51:49 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-1sLoQF1bMpSoNUrvxlzFYA-1; Wed, 31 May 2023 07:51:46 -0400
X-MC-Unique: 1sLoQF1bMpSoNUrvxlzFYA-1
X-IronPort-AV: E=Sophos;i="6.00,207,1681142400"; d="scan'208";a="237001989"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 31 May 2023 19:51:43 +0800
IronPort-SDR: XRutVaFhAji8TTmK4n2G2Vr03Ys5/Yy29jddLKcCyYupiLJMnw0yaxeadgZyh+sP/h/APvuQGZ
 IsOKzBw/VNdVdCFy3xkcdmZn5mti2BmSvdommxTPsridfjpyPYnvvXkMWaXXE5xJPwoNcxOgl7
 apCuzCEIcSBd3dAvmvu92kxaG+f17PfXHuoG7zVIeZ1FFyPmiIC09tZESD4EHzewdOZwKjUuPv
 jiXPlQwbQzk5hmLWSno8de6noryN2ibwbQhRY1WJVxTc2TO94SQq5OzmBf+wJTulom6Dd3XMwK
 qVE=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 May 2023 04:00:54 -0700
IronPort-SDR: FCL2eubAZP5N9vA9HDK+m1l82gIsrfnKwR7xl5QF91RBemiBMgqeza4/jZiezHWUmx+A2BPvbg
 diAJW3D6qzTTjWDhUmm4+CPI/5Pg7yzgXHh3HJFIrkz3I6/YCxvrl5dZGpioD3FIrHJ11rp7ht
 I6HmAKaEKAajDqnW187jX1JXP1SwiHNqHZle9nVdQDpjjStKHttQk7X5nq4km22hnGrB8FLHbJ
 5GGj+z1T+oiCsX5btGRw34bpXv3+vXL9f6GlctCmHk5dzGi6sYWMqAROn6Jr2ed+EqoN495klc
 Cyk=
WDCIronportException: Internal
Received: from unknown (HELO redsun91.ssa.fujisawa.hgst.com) ([10.149.66.6])
 by uls-op-cesaip02.wdc.com with ESMTP; 31 May 2023 04:51:41 -0700
From: Johannes Thumshirn <johannes.thumshirn@wdc.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 31 May 2023 04:50:40 -0700
Message-Id: <7ae4a902e08fe2e90c012ee07aeb35d4aae28373.1685532726.git.johannes.thumshirn@wdc.com>
In-Reply-To: <cover.1685532726.git.johannes.thumshirn@wdc.com>
References: <cover.1685532726.git.johannes.thumshirn@wdc.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCH v7 17/20] block: mark bio_add_page as
 __must_check
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: wdc.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Now that all users of bio_add_page check for the return value, mark
bio_add_page as __must_check.

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 include/linux/bio.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/bio.h b/include/linux/bio.h
index b3e7529ff55e..ea2d937d3cba 100644
--- a/include/linux/bio.h
+++ b/include/linux/bio.h
@@ -465,7 +465,8 @@ extern void bio_uninit(struct bio *);
 void bio_reset(struct bio *bio, struct block_device *bdev, blk_opf_t opf);
 void bio_chain(struct bio *, struct bio *);
 
-int bio_add_page(struct bio *, struct page *, unsigned len, unsigned off);
+int __must_check bio_add_page(struct bio *bio, struct page *page, unsigned len,
+			      unsigned off);
 bool bio_add_folio(struct bio *, struct folio *, size_t len, size_t off);
 extern int bio_add_pc_page(struct request_queue *, struct bio *, struct page *,
 			   unsigned int, unsigned int);
-- 
2.40.1

