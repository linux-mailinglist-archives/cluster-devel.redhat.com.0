Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C51717F92
	for <lists+cluster-devel@lfdr.de>; Wed, 31 May 2023 14:07:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685534833;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JV+QfbhswWYe7PfMrv2Yu8Kn7ZidQZ3SJddP0Uv61YU=;
	b=IoV3F7ansS61BtT2HynRzHw4spCkUMvfX9OwH3RC7xh1g0gm8pCxObQbGH8ErOyH7RaLHM
	INSjXzX23m+zGbk3vJ8VRmlonIqXLBwLmUUtmEAD51ul3SrU0bZ9WkpyeLuzOSxNC13I97
	486NuTJupaxffg0qqYw5+T3w72Lpp84=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-NZTcl88IPD60XH1tcyil1w-1; Wed, 31 May 2023 08:07:10 -0400
X-MC-Unique: NZTcl88IPD60XH1tcyil1w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 168A23C0F246;
	Wed, 31 May 2023 12:07:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0B50B492B0B;
	Wed, 31 May 2023 12:07:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B606319451DC;
	Wed, 31 May 2023 12:06:43 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EF6C01946595 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 31 May 2023 11:51:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E0E3540D1A6; Wed, 31 May 2023 11:51:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D941D40BB2D
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 11:51:52 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA4A0185A797
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 11:51:52 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-1AV81ycEP1SDQMMki3IT_w-2; Wed, 31 May 2023 07:51:49 -0400
X-MC-Unique: 1AV81ycEP1SDQMMki3IT_w-2
X-IronPort-AV: E=Sophos;i="6.00,207,1681142400"; d="scan'208";a="237002003"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 31 May 2023 19:51:47 +0800
IronPort-SDR: 5N45c7rzI+VFwS5txeNg/ohQKBWXuA1UnXGaWWe2a1JftofNJcJAVVjPp/2/TaCJM68zwABzQu
 fJQNMVeGpJw5pBlzTkx6x4D+rWpGhZOWlX/FbPMeE/N1DYWVkxC9I/1XDbFsr8yLxGitGBhh3a
 pnB5GUtsdj8V6uMEaxeG+CPLCs7z+2YxPWc/UZy2uIC+QopHY209sLOXQVtlliBG3VzbUKYEXb
 5SRQWjtXKi7KZZJlsTmBfR7uAnbyuxJXF7lMDaxff4numH0MAL8m/zAYKR1OXiK4t+r2fqXM9O
 4HQ=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 May 2023 04:00:58 -0700
IronPort-SDR: QS61h54T8yZW50RLo6/tAmhIU9dZKUSaD+j7SLLE6DJcuENXB0nA81DplHQBb61D4xQN5z6YYg
 lyD4dagzoF40PNFlLjzTZJ0Zg7tFZiGl11uz4H1TbZVmBSoN2y+wo62ttaYHvL6KiHjLe0+6zm
 FGyHqtygisbhzUI8rq/fYFXGU3w82UmCTVNSYk+2JCVsdH8VqjYSAJfn3rSnoQGKjalA3DHPXh
 ec/1PSkgm/XAUuzf+dnf+/NfDPsket5c3ZH5oLqRyfJ8DIpHZ5kI0+L0iQDvqE4e97x4r0cURX
 AEA=
WDCIronportException: Internal
Received: from unknown (HELO redsun91.ssa.fujisawa.hgst.com) ([10.149.66.6])
 by uls-op-cesaip02.wdc.com with ESMTP; 31 May 2023 04:51:44 -0700
From: Johannes Thumshirn <johannes.thumshirn@wdc.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 31 May 2023 04:50:41 -0700
Message-Id: <924dff4077812804398ef84128fb920507fa4be1.1685532726.git.johannes.thumshirn@wdc.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [Cluster-devel] [PATCH v7 18/20] block: add bio_add_folio_nofail
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
 Mikulas Patocka <mpatocka@redhat.com>, Hannes Reinecke <hare@suse.de>,
 linux-fsdevel@vger.kernel.org, gouha7@uniontech.com,
 Christoph Hellwig <hch@lst.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: wdc.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Just like for bio_add_pages() add a no-fail variant for bio_add_folio().

Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 block/bio.c         | 8 ++++++++
 include/linux/bio.h | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/block/bio.c b/block/bio.c
index 043944fd46eb..07bc5139f9db 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -1138,6 +1138,14 @@ int bio_add_page(struct bio *bio, struct page *page,
 }
 EXPORT_SYMBOL(bio_add_page);
 
+void bio_add_folio_nofail(struct bio *bio, struct folio *folio, size_t len,
+			  size_t off)
+{
+	WARN_ON_ONCE(len > UINT_MAX);
+	WARN_ON_ONCE(off > UINT_MAX);
+	__bio_add_page(bio, &folio->page, len, off);
+}
+
 /**
  * bio_add_folio - Attempt to add part of a folio to a bio.
  * @bio: BIO to add to.
diff --git a/include/linux/bio.h b/include/linux/bio.h
index ea2d937d3cba..f907d75af205 100644
--- a/include/linux/bio.h
+++ b/include/linux/bio.h
@@ -474,6 +474,8 @@ int bio_add_zone_append_page(struct bio *bio, struct page *page,
 			     unsigned int len, unsigned int offset);
 void __bio_add_page(struct bio *bio, struct page *page,
 		unsigned int len, unsigned int off);
+void bio_add_folio_nofail(struct bio *bio, struct folio *folio, size_t len,
+			  size_t off);
 int bio_iov_iter_get_pages(struct bio *bio, struct iov_iter *iter);
 void bio_iov_bvec_set(struct bio *bio, struct iov_iter *iter);
 void __bio_release_pages(struct bio *bio, bool mark_dirty);
-- 
2.40.1

