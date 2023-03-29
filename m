Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 396386CF0A8
	for <lists+cluster-devel@lfdr.de>; Wed, 29 Mar 2023 19:09:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680109759;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GDJ+FA6jm0FuzkoAjCv9Foq+v6LVPc682g0yuduBtNI=;
	b=MVxtnUYjRR76m7jiMpp2Ly9TyhSv0nQlbrMjr1Wv7buSf+m6BQE+jpUmPZFDArR0oz9U/M
	KU8+DLb7bCA5aBaYMa9BEbr+RVg5gg4DTmmBh0tOjgukm2IuKM45wVeUs4xDGWUzrr0zkg
	NaED6Kgi7azWv8JdZD3Dl3UIfq7UNeM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-119-wy_uozn4NoyEuW2JtPLmAw-1; Wed, 29 Mar 2023 13:09:14 -0400
X-MC-Unique: wy_uozn4NoyEuW2JtPLmAw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 871CC1C087A7;
	Wed, 29 Mar 2023 17:09:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 79C022166B40;
	Wed, 29 Mar 2023 17:09:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C83291946A4C;
	Wed, 29 Mar 2023 17:09:12 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 27E921946587 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 29 Mar 2023 17:08:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1922418EC2; Wed, 29 Mar 2023 17:08:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 10F64440D7
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 17:08:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB195185A7AC
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 17:08:27 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-FJwalig8OtKQGkVUwLoEOg-2; Wed, 29 Mar 2023 13:08:21 -0400
X-MC-Unique: FJwalig8OtKQGkVUwLoEOg-2
X-IronPort-AV: E=Sophos;i="5.98,301,1673884800"; d="scan'208";a="338882651"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 Mar 2023 01:07:15 +0800
IronPort-SDR: Rt2lL3qFX6M6ZFt/HSL2fLIL1WuxHPAYGKYfgvtz3sdCXW6qeJaKEJTnn+CCciWlTmYppnD9Vz
 6D6cnZSDv0PHqC6KETRVYHpzTj+8dDdiw7fK5E6M73mR+FG5VzeC+PH1nlLG7Bu/fB+FlhcQ64
 LBdZi6w/0wmCbU2rNInU7e4SooNowpMXW9vyhsYiJKvSvS812iy1VNRF8ZKrzCrpHr4m+y5A3N
 7KrtBd4M/khTR8eEqr0UOEfGYONviQuVPB0BcpgxrQfPAv0nVDsAUR4kNWbbN0cAOdSUDvIWga
 Zh0=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Mar 2023 09:23:24 -0700
IronPort-SDR: 8RmI6zmAOTXFtW/2/SG8J8KNZRYzrAFRJ4uNnILqTeeXG066nahjBZoS9n+NN5J3vTZ6r4tTp4
 tgf7Xeh71IvP+ShrkeXh87FE6UCEB3t5gJLO+7c48mDUod+PtEXFK6+gNDb9SNHaMZjGaFFZq5
 oSS15Elmdtz3zYQl0pCPbsA+5iw4KtmRTEhmlTSesmM+hPv3lcg9UKEZ8wbUNW7w/THKtkgzir
 PeuIpe63rdIdw98aKHJN1lP5OhNWW5Tro+ygbZuffnM7QyFj0xiIF2ZERO387ULFLAsv0/t4Fc
 XtI=
WDCIronportException: Internal
Received: from unknown (HELO redsun91.ssa.fujisawa.hgst.com) ([10.149.66.72])
 by uls-op-cesaip01.wdc.com with ESMTP; 29 Mar 2023 10:07:14 -0700
From: Johannes Thumshirn <johannes.thumshirn@wdc.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 29 Mar 2023 10:06:05 -0700
Message-Id: <350bd9c62ce575267a2b38625ab767c332429bc1.1680108414.git.johannes.thumshirn@wdc.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Cluster-devel] [PATCH 19/19] block: mark bio_add_page as
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: wdc.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Now that all users of bio_add_page check for the return value, mark
bio_add_page as __must_check.

Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 include/linux/bio.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/bio.h b/include/linux/bio.h
index d766be7152e1..0f8a8d7a6384 100644
--- a/include/linux/bio.h
+++ b/include/linux/bio.h
@@ -465,7 +465,7 @@ extern void bio_uninit(struct bio *);
 void bio_reset(struct bio *bio, struct block_device *bdev, blk_opf_t opf);
 void bio_chain(struct bio *, struct bio *);
 
-int bio_add_page(struct bio *, struct page *, unsigned len, unsigned off);
+int __must_check bio_add_page(struct bio *, struct page *, unsigned len, unsigned off);
 bool bio_add_folio(struct bio *, struct folio *, size_t len, size_t off);
 extern int bio_add_pc_page(struct request_queue *, struct bio *, struct page *,
 			   unsigned int, unsigned int);
-- 
2.39.2

