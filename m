Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF0E717EBB
	for <lists+cluster-devel@lfdr.de>; Wed, 31 May 2023 13:45:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685533519;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JaOdRASqHT7xzwXc2NQuDZOUhvsv6oArp6EMJMX683Y=;
	b=RFkxCjC3Bdk7A0VtzS1OeiEKNRfQHBTveSVyaUuKkYiB75AkkpKeoInmGJsGOwTgId+KHt
	MnbXPo3EAGgE3ar7g7rOYOiuJsDCotfCY+pGmoftFzt/nt6Sy45mNCj1IJh1vaid9Bd9BJ
	ldGyyp+4TlfqaKzrvyRLwF0wpJtiMis=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-m5I1kwMPMvyWk812A0a3Rw-1; Wed, 31 May 2023 07:45:15 -0400
X-MC-Unique: m5I1kwMPMvyWk812A0a3Rw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFEEA3C0CEF3;
	Wed, 31 May 2023 11:45:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B445A112132C;
	Wed, 31 May 2023 11:45:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D52FE19465A8;
	Wed, 31 May 2023 11:45:13 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4AEB819465A0 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 31 May 2023 11:38:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 386FF140E963; Wed, 31 May 2023 11:38:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 31582140E962
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 11:38:27 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16B03811E85
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 11:38:27 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-670-uMZed4hIMoSamzgKN0drFA-3; Wed, 31 May 2023 07:38:23 -0400
X-MC-Unique: uMZed4hIMoSamzgKN0drFA-3
X-IronPort-AV: E=Sophos;i="6.00,207,1681142400"; d="scan'208";a="230206740"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 31 May 2023 19:38:22 +0800
IronPort-SDR: AKyZKNSYji+m8xROIvpEyWTQ2jMTAEv8VaK9W0Ih1OjvenjpRCQL42qJtnPkdaSx+sQxmyOHVm
 VfUNrs4Rq55rN5jKu+t04epESei5CsIf9LzAXc8wP/AqnybK626uv32oaRPS2SA8lI5r/F8FC/
 ylUrp/WjUKI0UldwSEd7CIyM2wlJpVRo9WiR2GRJxp9b6Vb1XEE25M9lza7yeCDbvGmr423qjn
 H3K0JbFWroe7K3ddNF6Dj0hzQD/TlGRlbExA/qM/MDDboWZJC5UTwzK+X4YRsEJu+630TnwBYc
 yDg=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 May 2023 03:53:14 -0700
IronPort-SDR: lAQlFwod1LolanzvJjaARoBCaCoqlzlJvddh/3MsACWNQGgD14eFzSLN0liv2+mcfhIC77P3CS
 1i7vOm3aUOsXwXutLoeFQKJtrw73hgHopJDe51ArWDkDFNwHKprY9j/qv61HzysMLWNq25shOE
 ylF5Nu9ABGp3+xkDejsFGtJBav5gx4Hsxuy03mMTMqo0HfVvI8JihYKEedehepQ4Il5YXjmQCs
 OYEX1WwJukJjMHdMpbV6GqyvWS73AlArLwN2qD/OIOwugmkreMfF4mPgARhXOeBr+pacamAGi3
 hsY=
WDCIronportException: Internal
Received: from unknown (HELO redsun91.ssa.fujisawa.hgst.com) ([10.149.66.6])
 by uls-op-cesaip02.wdc.com with ESMTP; 31 May 2023 04:38:19 -0700
From: Johannes Thumshirn <johannes.thumshirn@wdc.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 31 May 2023 04:37:47 -0700
Message-Id: <8b046033b3b073d1ea91c45cd278b7aadd0b7e1e.1685461490.git.johannes.thumshirn@wdc.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCH v6 05/20] md: use __bio_add_page to add
 single page
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: wdc.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The md-raid superblock writing code uses bio_add_page() to add a page to a
newly created bio. bio_add_page() can fail, but the return value is never
checked.

Use __bio_add_page() as adding a single page to a newly created bio is
guaranteed to succeed.

This brings us a step closer to marking bio_add_page() as __must_check.

Signed-of_-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Acked-by: Song Liu <song@kernel.org>
---
 drivers/md/md.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index 8e344b4b3444..6a559a7e89c0 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -938,7 +938,7 @@ void md_super_write(struct mddev *mddev, struct md_rdev *rdev,
 	atomic_inc(&rdev->nr_pending);
 
 	bio->bi_iter.bi_sector = sector;
-	bio_add_page(bio, page, size, 0);
+	__bio_add_page(bio, page, size, 0);
 	bio->bi_private = rdev;
 	bio->bi_end_io = super_written;
 
@@ -979,7 +979,7 @@ int sync_page_io(struct md_rdev *rdev, sector_t sector, int size,
 		bio.bi_iter.bi_sector = sector + rdev->new_data_offset;
 	else
 		bio.bi_iter.bi_sector = sector + rdev->data_offset;
-	bio_add_page(&bio, page, size, 0);
+	__bio_add_page(&bio, page, size, 0);
 
 	submit_bio_wait(&bio);
 
-- 
2.40.1

