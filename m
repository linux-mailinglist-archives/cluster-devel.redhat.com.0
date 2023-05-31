Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 89628717F97
	for <lists+cluster-devel@lfdr.de>; Wed, 31 May 2023 14:07:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685534845;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4wltjMlOzsPDRwIgGzzKckeo7q3CC1AtmBW5BIRqZZc=;
	b=DqRHkpIDxka4UKObLk6F07aLzEAULsdc/j5KLpknPulAA9+/M/gX4TsB02X3AyelNSZz1N
	gLofC+iGDYJ/zsaAa++uhVlr/fbc++FYAyw9PUAurBMvFvwTF2ZhOA7AXsm7aQ4e2M4s3k
	IGX3TvJFXkVpyc6bbkBHhcEty5S2qp8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-155-B8r17rbXP520H3yqjv1J-Q-1; Wed, 31 May 2023 08:07:15 -0400
X-MC-Unique: B8r17rbXP520H3yqjv1J-Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D299A185A794;
	Wed, 31 May 2023 12:07:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C74BF420A8;
	Wed, 31 May 2023 12:07:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F1BA219451E2;
	Wed, 31 May 2023 12:07:02 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E342F19465A0 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 31 May 2023 11:51:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D67774087C62; Wed, 31 May 2023 11:51:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE0094087C67
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 11:51:36 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1957811E96
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 11:51:36 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-1ODLD2NHNDSQwV_upYpPiw-9; Wed, 31 May 2023 07:51:33 -0400
X-MC-Unique: 1ODLD2NHNDSQwV_upYpPiw-9
X-IronPort-AV: E=Sophos;i="6.00,207,1681142400"; d="scan'208";a="232064981"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 31 May 2023 19:51:32 +0800
IronPort-SDR: t4n2CaHHuZRBlDKl+uDZFcV302YeT1PrDhSDedHFyMXwFR9xfFMVXsERNIc2mCszO3T+BCZOLz
 n/kfvuHvv8SRKVI6RfodT247nkc/QKdENPjuqIJaZqPetkH1yD9Fb59msW3XisACuruSqjmKXI
 FTBCJXVCYhZ6OsNOmjv2Y//5hWN0/3ni9HJqjF4/APJzKT93uzpohbcnPu8PK8WOCqsnD+UggQ
 hIAc0QdJH1mROcEB4QH9w20MUKKIHPv0QcmvvQ5vXCUFGh/U5ffhHrLDk3CtwP3DqJ7nWt+392
 YtI=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 May 2023 04:06:24 -0700
IronPort-SDR: Z6zZ5moCZAo8HyghcdM8Wh0qvfaCT2LiPQW+ewVuXAv+zyl3VKWafiSq2yJXvM/A54CkcTJN+V
 kRVbq0irr40y+MWSjgjPIzREhnBw/QeLa6OkO6LV2aSFbCYOSOdgOKC/mj9w510XzxJvNJ+Ppc
 bKsq1lcjXCfe5M8sYfeB+boMuGe7XuwZ5WTGw2/M7CwC8jX4gUJEv1IB/iHxsG6xSoVSNEIkFI
 s8y0GfyXNSKO/vqm5AA9muwlpfgMinBcH8LoI7yFQZewBeLk1GwYOBtK16jZm+Elw8Aj2MWMYn
 WJY=
WDCIronportException: Internal
Received: from unknown (HELO redsun91.ssa.fujisawa.hgst.com) ([10.149.66.6])
 by uls-op-cesaip02.wdc.com with ESMTP; 31 May 2023 04:51:29 -0700
From: Johannes Thumshirn <johannes.thumshirn@wdc.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 31 May 2023 04:50:36 -0700
Message-Id: <827aa12d44ebf3f50b41b47f5cedc0f80179f2c1.1685532726.git.johannes.thumshirn@wdc.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Cluster-devel] [PATCH v7 13/20] md: check for failure when adding
 pages in alloc_behind_master_bio
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: wdc.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

alloc_behind_master_bio() can possibly add multiple pages to a bio, but it
is not checking for the return value of bio_add_page() if adding really
succeeded.

Check if the page adding succeeded and if not bail out.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Acked-by: Song Liu <song@kernel.org>
Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 drivers/md/raid1.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
index 68a9e2d9985b..8283ef177f6c 100644
--- a/drivers/md/raid1.c
+++ b/drivers/md/raid1.c
@@ -1147,7 +1147,10 @@ static void alloc_behind_master_bio(struct r1bio *r1_bio,
 		if (unlikely(!page))
 			goto free_pages;
 
-		bio_add_page(behind_bio, page, len, 0);
+		if (!bio_add_page(behind_bio, page, len, 0)) {
+			free_page(page);
+			goto free_pages;
+		}
 
 		size -= len;
 		i++;
-- 
2.40.1

