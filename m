Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8020A6E8F1D
	for <lists+cluster-devel@lfdr.de>; Thu, 20 Apr 2023 12:06:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681985210;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2Fzr57yVT4AGfP8f/rHc++3o/RNaaVBknK7ki+b7wqg=;
	b=J+FeXoWDoBtTdOcaYZM+KAaGKnj+t/sCDaVcWDXmoGGu0ztyiAIT8512vV0qDgOoPRS9Hr
	TdKjCiD4YKE49JMO9BGDYFm7cs8rS/nyhNprzFwgLR74kvSPia8y9NKky3fXigbs1CPDIX
	MVM/Vv/Y4sZ6K+pzxTg4Gyq/S9bSq8E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-503-9Jle8RkzMye0MuY9ad_n0w-1; Thu, 20 Apr 2023 06:06:47 -0400
X-MC-Unique: 9Jle8RkzMye0MuY9ad_n0w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C0A51802D32;
	Thu, 20 Apr 2023 10:06:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2B98C1410F1C;
	Thu, 20 Apr 2023 10:06:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 980371946A48;
	Thu, 20 Apr 2023 10:06:34 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B98771946A49 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 20 Apr 2023 10:06:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AB33A40BC79E; Thu, 20 Apr 2023 10:06:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A28F140BC79C
 for <cluster-devel@redhat.com>; Thu, 20 Apr 2023 10:06:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86FD2101A531
 for <cluster-devel@redhat.com>; Thu, 20 Apr 2023 10:06:07 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-481-pe4kaHWmM2SijZvG6JDxKQ-1; Thu, 20 Apr 2023 06:05:59 -0400
X-MC-Unique: pe4kaHWmM2SijZvG6JDxKQ-1
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-3f177cb2c6cso3447255e9.2; 
 Thu, 20 Apr 2023 03:05:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681985157; x=1684577157;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2Fzr57yVT4AGfP8f/rHc++3o/RNaaVBknK7ki+b7wqg=;
 b=BZYP+SnaYDrziSBoXwqWBtUjJPvq1i7Q2A79X9BCckoe8P3zpGn6JPbwvv+sfeWCgc
 BI/eZ1NCAuHNrhUFPgO2t8UWfPXH7J09nYKvLR5SL0JgpLC1nutmpZmcP5nG35Iq00Pt
 Jvq9IuSTylCPAD7j4a46pke7PHDKK/DkAUV3urQILSkZUhHoc51DjLwvbD3JkAv6fa7A
 /H0031RkCyV0BKSK3yHOvsleLNW3mlMN1TC9t9qs+3zqQCsfz4wu7sq/X30eaeHvokVY
 5V8Pkqby2rQCqNOKpDi6KK+ASP4IWRqkjeM15RYkKofrjazf8lW3KUMEf1BS239P8YWA
 Q4Lg==
X-Gm-Message-State: AAQBX9ewDsV58de4waZOk6yae6VINL3v74fUrAdtRV+XGVmwD7UTLIbY
 r42E/uMFG710V6LqQJcgtr8=
X-Google-Smtp-Source: AKy350bLyO4KQbV/PoPdUqDGkkMZX7ZfuVuX5huOYxZIzQyFuycseqFdIVwkpU3U96njdfQtavhtJw==
X-Received: by 2002:a05:6000:1201:b0:2f2:c46b:1eb5 with SMTP id
 e1-20020a056000120100b002f2c46b1eb5mr939686wrx.59.1681985157174; 
 Thu, 20 Apr 2023 03:05:57 -0700 (PDT)
Received: from localhost.localdomain
 (aftr-62-216-205-208.dynamic.mnet-online.de. [62.216.205.208])
 by smtp.googlemail.com with ESMTPSA id
 l11-20020a5d674b000000b0030276f42f08sm201410wrw.88.2023.04.20.03.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 03:05:56 -0700 (PDT)
From: Johannes Thumshirn <jth@kernel.org>
To: axboe@kernel.dk
Date: Thu, 20 Apr 2023 12:04:45 +0200
Message-Id: <20230420100501.32981-7-jth@kernel.org>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Cluster-devel] [PATCH v4 06/22] md: raid5-log: use __bio_add_page
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

