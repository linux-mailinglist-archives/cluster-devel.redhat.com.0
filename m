Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D2E6E7D60
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Apr 2023 16:47:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681915669;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2Fzr57yVT4AGfP8f/rHc++3o/RNaaVBknK7ki+b7wqg=;
	b=QE8GfF1aPJ7XWA0nmjKGF9eY0QlJEn+2K+yvQSvBF4MeadOgyNP59eKgFfLu0nrJDlrfH8
	VjejA3yjZXTlKhQ8YWITG4VbAHQ+znQFElfGZcASQaeV5iYEkrVI80e3qYf9LzHNwjX4Bi
	Ead56FpvmOEpomoaN+/+CF/SvOdQMAY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-202-wCZBGCmiMvSw5Hd4Deq5Dg-1; Wed, 19 Apr 2023 10:47:47 -0400
X-MC-Unique: wCZBGCmiMvSw5Hd4Deq5Dg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9015F101A554;
	Wed, 19 Apr 2023 14:47:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 333072026D16;
	Wed, 19 Apr 2023 14:47:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C1DEB19465B5;
	Wed, 19 Apr 2023 14:47:45 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AFFE219465B1 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 19 Apr 2023 14:10:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A23B5492B05; Wed, 19 Apr 2023 14:10:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9ACFB492B04
 for <cluster-devel@redhat.com>; Wed, 19 Apr 2023 14:10:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 804E11C0A591
 for <cluster-devel@redhat.com>; Wed, 19 Apr 2023 14:10:45 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-2JuMPlayMv2tbe5ZCX2ojQ-1; Wed, 19 Apr 2023 10:10:40 -0400
X-MC-Unique: 2JuMPlayMv2tbe5ZCX2ojQ-1
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-2fa36231b1cso1714196f8f.2; 
 Wed, 19 Apr 2023 07:10:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681913438; x=1684505438;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2Fzr57yVT4AGfP8f/rHc++3o/RNaaVBknK7ki+b7wqg=;
 b=kX7yArWxBhCi7liIz7UDc4SI+EAD56F5jN+7i4DDp1j5F8ru4SIbCmzo2OKrMEImCf
 AJbeFGaNGbKZGbRCuq4KGOWZNXVutN5CiyXUB8KQWVAJnX5vBYcF61d3u3dkCRUup2qA
 dOPcjBR9vSLRbe3eCT941r5/5iYPZoswfIaYuk1k+jAPKD19xvM1YaxiHR2fetJQpTO8
 3lUDxsJ9bqs+3GEXjmb4XH1zjArDwfCTYX47th1QQbMXxysjnp8vBmuKRwxwmjNzl/KD
 7IeN+Jr4I6+PIZx7tv7/JzwSoem+nXM0GfQHs6zvznzHSdggzoPtvFj5tV2u49h02Z91
 vDOA==
X-Gm-Message-State: AAQBX9fkfuDc9PfUr0tweY7R3EASiihPUwat9CRxAhRJ/xOBLPW5WYhS
 WyMg3/6fovsNWSvJMMwTcUY=
X-Google-Smtp-Source: AKy350b+UwzbHTOCNn17UYnXZKHlXNJQwvx+l7TgssVsB5tDN4gwDjzdQ+Z4ngjORp4WObNT+HzhDA==
X-Received: by 2002:adf:f10f:0:b0:2f7:efb1:ec8c with SMTP id
 r15-20020adff10f000000b002f7efb1ec8cmr4366904wro.23.1681913438239; 
 Wed, 19 Apr 2023 07:10:38 -0700 (PDT)
Received: from localhost.localdomain
 (aftr-62-216-205-204.dynamic.mnet-online.de. [62.216.205.204])
 by smtp.googlemail.com with ESMTPSA id
 q17-20020a5d61d1000000b002faaa9a1721sm7612089wrv.58.2023.04.19.07.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 07:10:37 -0700 (PDT)
From: Johannes Thumshirn <jth@kernel.org>
To: axboe@kernel.dk
Date: Wed, 19 Apr 2023 16:09:16 +0200
Message-Id: <20230419140929.5924-7-jth@kernel.org>
In-Reply-To: <20230419140929.5924-1-jth@kernel.org>
References: <20230419140929.5924-1-jth@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [Cluster-devel] [PATCH v3 06/19] md: raid5-log: use __bio_add_page
 to add single page
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Johannes Thumshirn <johannes.thumshirn@wdc.com>

The raid5 log metadata submission code uses bio_add_page() to add a page
to a newly created bio. bio_add_page() can fail, but the return value is
never checked.

Use __bio_add_page() as adding a single page to a newly created bio is
guaranteed to succeed.

This brings us a step closer to marking bio_add_page() as __must_check.

Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Acked-by: Song Liu <song@kernel.org>
---
 drivers/md/raid5-cache.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/raid5-cache.c b/drivers/md/raid5-cache.c
index 46182b955aef..852b265c5db4 100644
--- a/drivers/md/raid5-cache.c
+++ b/drivers/md/raid5-cache.c
@@ -792,7 +792,7 @@ static struct r5l_io_unit *r5l_new_meta(struct r5l_log *log)
 	io->current_bio = r5l_bio_alloc(log);
 	io->current_bio->bi_end_io = r5l_log_endio;
 	io->current_bio->bi_private = io;
-	bio_add_page(io->current_bio, io->meta_page, PAGE_SIZE, 0);
+	__bio_add_page(io->current_bio, io->meta_page, PAGE_SIZE, 0);
 
 	r5_reserve_log_entry(log, io);
 
-- 
2.39.2

