Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6536E8F22
	for <lists+cluster-devel@lfdr.de>; Thu, 20 Apr 2023 12:06:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681985217;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XSziFxMRLlc78BEY3ZIcArKRUqB+ur0VzFu/o2eWTQg=;
	b=JUsZy6lk4/ormvpFDQKhB55ftgRNNfR89AxpQYYT0o6mR43SNdybiRFTY3qPnCVJP59abE
	+/06g+ATZf381fwzZWLhjJv9YGb6HSrMqsLWINNDtCv13COYbLCUNC2ffHn8xIldeHlqPf
	1D6IrIvx2GvyjeXKu8714Vh9NncvYQI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-101-oSDPILjoPRCQ3syUSPbk7Q-1; Thu, 20 Apr 2023 06:06:54 -0400
X-MC-Unique: oSDPILjoPRCQ3syUSPbk7Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA701884ED3;
	Thu, 20 Apr 2023 10:06:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 67A0D492B05;
	Thu, 20 Apr 2023 10:06:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CE4D01946A5A;
	Thu, 20 Apr 2023 10:06:39 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DF62619465B5 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 20 Apr 2023 10:06:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 28A1440BC79A; Thu, 20 Apr 2023 10:06:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 21CC140BC798
 for <cluster-devel@redhat.com>; Thu, 20 Apr 2023 10:06:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 051553802AC0
 for <cluster-devel@redhat.com>; Thu, 20 Apr 2023 10:06:05 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-laZuIbxDMROpmbES3Zx6sw-1; Thu, 20 Apr 2023 06:06:03 -0400
X-MC-Unique: laZuIbxDMROpmbES3Zx6sw-1
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-3f176a16c03so3360155e9.2; 
 Thu, 20 Apr 2023 03:06:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681985161; x=1684577161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XSziFxMRLlc78BEY3ZIcArKRUqB+ur0VzFu/o2eWTQg=;
 b=QnFd/qD7gTdTMUi8S3IC8x5iYL0xdBPB8Rh6NgdkueaUF6budVXfynHLxdFIDNhyaH
 8hiP2lbJ4dGn5EFKnrqPhl4GCU0StoDMIw4Jzstr66NZJz/M3kGwswMD/bnc+EjlLeCO
 l8Au1BLkwPMDFgyyJhxmzyQn4TvZi9vIDp77rnZin3I+WMdeyUOaq+5MBonRvd5TuPLs
 Kvf7cFOFmyTARxJI+6b8281zsDJIHVt7novw9pMbYLjIgxWhAoVOtsXK5rUfOK7yOopr
 E/rpKma1WtFlPvS7KAGKVctEvPqV77hf5VlmcQwdBLxqGnL0UmfqtYDzns0iTcPMh8zS
 IPnw==
X-Gm-Message-State: AAQBX9e1ingk1fgu6896qsGWpLuCH+KyGivapyUbJNf3LLLWYa6OrqhQ
 U9RLF5+zTY8hScP2QxR+m84=
X-Google-Smtp-Source: AKy350YaG3KN92VetUrzcVoSFywGceMQufxfAD2B5CXNNTFsILzF+cTK0i2X3r4O7jeyW50fb6yefQ==
X-Received: by 2002:a05:6000:1105:b0:2ff:f37:9d02 with SMTP id
 z5-20020a056000110500b002ff0f379d02mr782954wrw.69.1681985161137; 
 Thu, 20 Apr 2023 03:06:01 -0700 (PDT)
Received: from localhost.localdomain
 (aftr-62-216-205-208.dynamic.mnet-online.de. [62.216.205.208])
 by smtp.googlemail.com with ESMTPSA id
 l11-20020a5d674b000000b0030276f42f08sm201410wrw.88.2023.04.20.03.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 03:06:00 -0700 (PDT)
From: Johannes Thumshirn <jth@kernel.org>
To: axboe@kernel.dk
Date: Thu, 20 Apr 2023 12:04:48 +0200
Message-Id: <20230420100501.32981-10-jth@kernel.org>
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
Subject: [Cluster-devel] [PATCH v4 09/22] btrfs: raid56: use __bio_add_page
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Johannes Thumshirn <johannes.thumshirn@wdc.com>

The btrfs raid58 sector submission code uses bio_add_page() to add a page
to a newly created bio. bio_add_page() can fail, but the return value is
never checked.

Use __bio_add_page() as adding a single page to a newly created bio is
guaranteed to succeed.

This brings us a step closer to marking bio_add_page() as __must_check.

Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 fs/btrfs/raid56.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/btrfs/raid56.c b/fs/btrfs/raid56.c
index 642828c1b299..c8173e003df6 100644
--- a/fs/btrfs/raid56.c
+++ b/fs/btrfs/raid56.c
@@ -1108,7 +1108,7 @@ static int rbio_add_io_sector(struct btrfs_raid_bio *rbio,
 	bio->bi_iter.bi_sector = disk_start >> 9;
 	bio->bi_private = rbio;
 
-	bio_add_page(bio, sector->page, sectorsize, sector->pgoff);
+	__bio_add_page(bio, sector->page, sectorsize, sector->pgoff);
 	bio_list_add(bio_list, bio);
 	return 0;
 }
-- 
2.39.2

