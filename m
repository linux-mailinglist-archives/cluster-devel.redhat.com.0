Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADCA6E8F29
	for <lists+cluster-devel@lfdr.de>; Thu, 20 Apr 2023 12:07:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681985223;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=THHWtCWhqF512rUBihGspkzbDFWU17ewgGDnTehbMVM=;
	b=Baz7k2FhYWCIstEgnUQeEyOfcklQVQUhAhBlABaSYAUi2A7UniBzvrAwqp+p3B8pvdADXN
	aYpfLDNHZZAx7PlE3Jh36XBbXr8pNENl2QVbBjScYdFdZ2byfBAK/9No8JsBiE2GOshR4c
	mSwUgstHGLHqnVJe9N/80WauXsOJau4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-Mr0jdL3zMhOXtcuKxi-rVA-1; Thu, 20 Apr 2023 06:07:00 -0400
X-MC-Unique: Mr0jdL3zMhOXtcuKxi-rVA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4FE5A101A557;
	Thu, 20 Apr 2023 10:06:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4504A40C2064;
	Thu, 20 Apr 2023 10:06:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 110111946A7A;
	Thu, 20 Apr 2023 10:06:45 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E9D801946A54 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 20 Apr 2023 10:06:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 891E02166B34; Thu, 20 Apr 2023 10:06:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E0DD2166B33
 for <cluster-devel@redhat.com>; Thu, 20 Apr 2023 10:06:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52DB78996F9
 for <cluster-devel@redhat.com>; Thu, 20 Apr 2023 10:06:00 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-133-bMGvrHZzOcalGZoPANyDCw-1; Thu, 20 Apr 2023 06:05:56 -0400
X-MC-Unique: bMGvrHZzOcalGZoPANyDCw-1
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-2efbaad9d76so446426f8f.0; 
 Thu, 20 Apr 2023 03:05:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681985155; x=1684577155;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=THHWtCWhqF512rUBihGspkzbDFWU17ewgGDnTehbMVM=;
 b=QXdtXfMkXSYiiVesFhMzOQMQ+fpip0enrKstT2ut2AZvz6kUT2XUOtIq3OdRhHj0Rx
 pXT0kyalXk+lybqK7mh3KVq1mCbUw0WWmEwLihkUV675fSdrVw5jfCGdHeIncxPiwTb9
 ayImhIlwyptdyapGkFNubaIHVr82eifmDHvZZ//gTbvmhVTAU5WqPKuoOV2GYJKffQ76
 4Ndw5+1rdWbbn3Llic6klPFndbHEETAEcXzH9no+2qaM8Sb8sV2Ai4ZBqikcQEfV+3CJ
 rZsjukC4KGJtq5JbtsUAtuvUshPmsGE3Zi/a8WHtQiY88NlPD7ZV5v46HBADcbQBPV41
 /07Q==
X-Gm-Message-State: AAQBX9cvbigcioDRvzRx1sqE2l8Xj8sUa6HQmn7L3Dzpx4HHVnBh7FKa
 eUngUtAD6GpR0Sfdd/ollD8=
X-Google-Smtp-Source: AKy350ZbsU031TtJxFavPxkTZE6B7tUnHyO6WeJiIUhkKTmUeZa+r+aiK8RXIaDWo688qiAVYVDPhA==
X-Received: by 2002:adf:e745:0:b0:2ef:8c85:771b with SMTP id
 c5-20020adfe745000000b002ef8c85771bmr926966wrn.51.1681985154753; 
 Thu, 20 Apr 2023 03:05:54 -0700 (PDT)
Received: from localhost.localdomain
 (aftr-62-216-205-208.dynamic.mnet-online.de. [62.216.205.208])
 by smtp.googlemail.com with ESMTPSA id
 l11-20020a5d674b000000b0030276f42f08sm201410wrw.88.2023.04.20.03.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 03:05:54 -0700 (PDT)
From: Johannes Thumshirn <jth@kernel.org>
To: axboe@kernel.dk
Date: Thu, 20 Apr 2023 12:04:43 +0200
Message-Id: <20230420100501.32981-5-jth@kernel.org>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH v4 04/22] fs: buffer: use __bio_add_page to
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

The buffer_head submission code uses bio_add_page() to add a page to a
newly created bio. bio_add_page() can fail, but the return value is never
checked.

Use __bio_add_page() as adding a single page to a newly created bio is
guaranteed to succeed.

This brings us a step closer to marking bio_add_page() as __must_check.

Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 fs/buffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index 9e1e2add541e..855dc41fe162 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -2733,7 +2733,7 @@ static void submit_bh_wbc(blk_opf_t opf, struct buffer_head *bh,
 
 	bio->bi_iter.bi_sector = bh->b_blocknr * (bh->b_size >> 9);
 
-	bio_add_page(bio, bh->b_page, bh->b_size, bh_offset(bh));
+	__bio_add_page(bio, bh->b_page, bh->b_size, bh_offset(bh));
 	BUG_ON(bio->bi_iter.bi_size != bh->b_size);
 
 	bio->bi_end_io = end_bio_bh_io_sync;
-- 
2.39.2

