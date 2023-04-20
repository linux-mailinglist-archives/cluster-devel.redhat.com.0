Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F0D6E8F20
	for <lists+cluster-devel@lfdr.de>; Thu, 20 Apr 2023 12:06:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681985215;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=orhZa1fQDVNg13Xf2hv14fXxJ7CL2ohR8GPEx9ozulE=;
	b=Zc7yomm//RUa6IEue05CjMHa6s/nL9mFvVbQn8lawxVNhlPScAry3pgg9OED1wpX1M8yS5
	+jrPgq37+Dhzt44UBls3iDg0HdsCg5Gr5oJ9olb6E2ZhXHh4VpQRS1WnrBHf3gLyfrMxSs
	fkqRnQFBcMIPEWWUAdwdm8QgMUo3ALI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-z7iHe1W4MXGhIjTMEf1GkA-1; Thu, 20 Apr 2023 06:06:52 -0400
X-MC-Unique: z7iHe1W4MXGhIjTMEf1GkA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3363388B7A0;
	Thu, 20 Apr 2023 10:06:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 27D7D40C2064;
	Thu, 20 Apr 2023 10:06:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BA4A01946A4C;
	Thu, 20 Apr 2023 10:06:34 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B01001946A40 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 20 Apr 2023 10:05:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1331F1410F1F; Thu, 20 Apr 2023 10:05:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BAA11410F1C
 for <cluster-devel@redhat.com>; Thu, 20 Apr 2023 10:05:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E4DC9800B35
 for <cluster-devel@redhat.com>; Thu, 20 Apr 2023 10:05:57 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-BcAt6Ni0PeW3pEsMfF6nSQ-1; Thu, 20 Apr 2023 06:05:54 -0400
X-MC-Unique: BcAt6Ni0PeW3pEsMfF6nSQ-1
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-3f17fdb5062so5425715e9.3; 
 Thu, 20 Apr 2023 03:05:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681985152; x=1684577152;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=orhZa1fQDVNg13Xf2hv14fXxJ7CL2ohR8GPEx9ozulE=;
 b=N1o12UGEZdKHM90xOsU5QbFPml0B1eggb6ZO2TDKQdbXQjh9ewn653wg5EQXc4Lxed
 AtEOjYIUJs80+Q+MdB2HyS2wJkjUiOFUTcn+MCCdcOoosI37YA1i9Vtq/SxpbJmn87kb
 jnecQp2VhQzL2qd79I0Nb89jkmD/+yWdTRGmfCFb9qqJPgaemCYsTTzBTXMwxxiG9sI9
 k69zuK5P86PkK1ZjjMrvDOPUHbUcvR7g/Zf9iRtTILkvkyRYMrxO1/4zg9F8p1z7CiHw
 8xfE77WeszCfTWSA3ytcy0gj+2SnWZpUH5R5fF1FX1bCKSWmcbvHjbVtvr88orrUDuxc
 ZZ2Q==
X-Gm-Message-State: AAQBX9dh7hNYdghEtmYy3vr7KZi7wdtgCSsiD3uzboY6aZqrTld/QwQW
 4GKkGh7j9XfzK84wzNUWGag=
X-Google-Smtp-Source: AKy350YNyeG2cTb3eTw6bH6AN4pc80O2KEoYo8kkUjtKZC1m+QcG1wLOsIVfaGc2U7URhzf/vvK0pQ==
X-Received: by 2002:a5d:52d2:0:b0:2ef:a96:293c with SMTP id
 r18-20020a5d52d2000000b002ef0a96293cmr741768wrv.13.1681985152448; 
 Thu, 20 Apr 2023 03:05:52 -0700 (PDT)
Received: from localhost.localdomain
 (aftr-62-216-205-208.dynamic.mnet-online.de. [62.216.205.208])
 by smtp.googlemail.com with ESMTPSA id
 l11-20020a5d674b000000b0030276f42f08sm201410wrw.88.2023.04.20.03.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 03:05:52 -0700 (PDT)
From: Johannes Thumshirn <jth@kernel.org>
To: axboe@kernel.dk
Date: Thu, 20 Apr 2023 12:04:41 +0200
Message-Id: <20230420100501.32981-3-jth@kernel.org>
In-Reply-To: <20230420100501.32981-1-jth@kernel.org>
References: <20230420100501.32981-1-jth@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCH v4 02/22] drbd: use __bio_add_page to add
 page to bio
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
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net, linux-mm@kvack.org,
 dm-devel@redhat.com, hch@lst.de,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, willy@infradead.org,
 cluster-devel@redhat.com, kch@nvidia.com, snitzer@kernel.org,
 ming.lei@redhat.com, linux-block@vger.kernel.org, hare@suse.de,
 dsterba@suse.com, linux-raid@vger.kernel.org, damien.lemoal@wdc.com,
 song@kernel.org, johannes.thumshirn@wdc.com, linux-fsdevel@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Johannes Thumshirn <johannes.thumshirn@wdc.com>

The drbd code only adds a single page to a newly created bio. So use
__bio_add_page() to add the page which is guaranteed to succeed in this
case.

This brings us closer to marking bio_add_page() as __must_check.

Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 drivers/block/drbd/drbd_bitmap.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/block/drbd/drbd_bitmap.c b/drivers/block/drbd/drbd_bitmap.c
index 289876ffbc31..050154eb963d 100644
--- a/drivers/block/drbd/drbd_bitmap.c
+++ b/drivers/block/drbd/drbd_bitmap.c
@@ -1043,9 +1043,7 @@ static void bm_page_io_async(struct drbd_bm_aio_ctx *ctx, int page_nr) __must_ho
 	bio = bio_alloc_bioset(device->ldev->md_bdev, 1, op, GFP_NOIO,
 			&drbd_md_io_bio_set);
 	bio->bi_iter.bi_sector = on_disk_sector;
-	/* bio_add_page of a single page to an empty bio will always succeed,
-	 * according to api.  Do we want to assert that? */
-	bio_add_page(bio, page, len, 0);
+	__bio_add_page(bio, page, len, 0);
 	bio->bi_private = ctx;
 	bio->bi_end_io = drbd_bm_endio;
 
-- 
2.39.2

