Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 677336E7BAF
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Apr 2023 16:11:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681913477;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6vsuN/DXTgv6nXT8tixf/9v37orpsS/ZRMb3IsbWCsU=;
	b=Z8NN9915yhmD361zIKaiaBuff5aaxCvvYHN6nD+nR63iUZpSzA/FDL4d2AGaeusv6JkDur
	m/K5mtq2cdqmSxbuzRhlqRhls9jsyaah5J+7oseTgzcSYp6v7mHnxk5OnH4Oly8FWEW9ga
	TcICrCv2Bo7V7ky62yUSUrBCscuuk8I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-zxs4Gyk1PYWBw1wUZEg9_w-1; Wed, 19 Apr 2023 10:11:12 -0400
X-MC-Unique: zxs4Gyk1PYWBw1wUZEg9_w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D60F010146E3;
	Wed, 19 Apr 2023 14:11:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CA95E2026D25;
	Wed, 19 Apr 2023 14:11:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8B34C19465B1;
	Wed, 19 Apr 2023 14:11:04 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D992D19465B2 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 19 Apr 2023 14:10:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BE6A44020BEE; Wed, 19 Apr 2023 14:10:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B659D4020BF2
 for <cluster-devel@redhat.com>; Wed, 19 Apr 2023 14:10:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99C672999B44
 for <cluster-devel@redhat.com>; Wed, 19 Apr 2023 14:10:58 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391-M66DBg0APsWhtwmM0o6BbA-1; Wed, 19 Apr 2023 10:10:56 -0400
X-MC-Unique: M66DBg0APsWhtwmM0o6BbA-1
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-3f173af665fso16675345e9.3; 
 Wed, 19 Apr 2023 07:10:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681913455; x=1684505455;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6vsuN/DXTgv6nXT8tixf/9v37orpsS/ZRMb3IsbWCsU=;
 b=fCszvhPddzQnwZnafS2FAZkoR5+7vfHbhqARsx08aGEcJH8jK1MmRE98waTqsJeQkr
 D2TDWnAvWxH4haD3wnyweadv7/MwKQxH3TPTYktwgjA3YniSSk0xw6GUXRr9fKy2PonP
 +IkTnu1AyBuhFMIj5ve4qutobBlAKi4+86rz7u80vuKvTezjxUxwsIGKnUljcrOTWIDd
 WDlVYpFF7/BBuUAjWMH5DDxLnvvbqPi7p9uLmpdi7ymEVg/BOM1av6RPpLVSkC5iDlfT
 DrXa2kBJUrSvuy4Dd3ET01tWvJ+iD2QXnqLMlyGVg/rXRROtNqFD/Aa43kHqXQp/PzjT
 7GyA==
X-Gm-Message-State: AAQBX9fOjHDweeLnWQUIW2EMc9plhRu+ORKhMjEWRK1Y3S0jQUjtLtoT
 mtTtEm9SiIXjHeZyeGnHa0g=
X-Google-Smtp-Source: AKy350ZtqTfiMh/3xTzWhxaqnfC6KE+V7qat1q3S3ZwFV6mDgq1XPDVNE2nS1h2LUGMDwyBUmS7crw==
X-Received: by 2002:a5d:4a0b:0:b0:2fb:ca40:e42c with SMTP id
 m11-20020a5d4a0b000000b002fbca40e42cmr4564600wrq.6.1681913455062; 
 Wed, 19 Apr 2023 07:10:55 -0700 (PDT)
Received: from localhost.localdomain
 (aftr-62-216-205-204.dynamic.mnet-online.de. [62.216.205.204])
 by smtp.googlemail.com with ESMTPSA id
 q17-20020a5d61d1000000b002faaa9a1721sm7612089wrv.58.2023.04.19.07.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 07:10:54 -0700 (PDT)
From: Johannes Thumshirn <jth@kernel.org>
To: axboe@kernel.dk
Date: Wed, 19 Apr 2023 16:09:26 +0200
Message-Id: <20230419140929.5924-17-jth@kernel.org>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Cluster-devel] [PATCH v3 16/19] md: raid1: use __bio_add_page for
 adding single page to bio
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

The sync request code uses bio_add_page() to add a page to a newly created bio.
bio_add_page() can fail, but the return value is never checked.

Use __bio_add_page() as adding a single page to a newly created bio is
guaranteed to succeed.

This brings us a step closer to marking bio_add_page() as __must_check.

Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Acked-by: Song Liu <song@kernel.org>
---
 drivers/md/raid1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
index 8283ef177f6c..ff89839455ec 100644
--- a/drivers/md/raid1.c
+++ b/drivers/md/raid1.c
@@ -2917,7 +2917,7 @@ static sector_t raid1_sync_request(struct mddev *mddev, sector_t sector_nr,
 				 * won't fail because the vec table is big
 				 * enough to hold all these pages
 				 */
-				bio_add_page(bio, page, len, 0);
+				__bio_add_page(bio, page, len, 0);
 			}
 		}
 		nr_sectors += len>>9;
-- 
2.39.2

