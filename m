Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3D96E7D64
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Apr 2023 16:48:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681915685;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EWddmUi1sUqAJfDu3vTNgbuTywHhrfsi4XwupHN4WwQ=;
	b=NynmMw0v+sJHXcFlGgxZo9xzahuRfWYA4Nhz0Rr1lhmJAjLrPBgEaGHnJylrW7mEl4D9y5
	ATFSbLmzzD3vI09vRcy4zadqWIP9c4AXgJlFn5Lr200pGV6qu5QITJwCh9mMZUU3evKZqE
	dJU3qQuGQkTFNCqORneH6niW71mp7ds=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-345-CT-UT2PdMEOXQJUs5IcB3w-1; Wed, 19 Apr 2023 10:48:02 -0400
X-MC-Unique: CT-UT2PdMEOXQJUs5IcB3w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9C9185A5B1;
	Wed, 19 Apr 2023 14:48:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AD1BB2166B34;
	Wed, 19 Apr 2023 14:48:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8C92619465B3;
	Wed, 19 Apr 2023 14:47:50 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 21DEF19465A0 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 19 Apr 2023 14:10:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0774C2026D25; Wed, 19 Apr 2023 14:10:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F420F2026D16
 for <cluster-devel@redhat.com>; Wed, 19 Apr 2023 14:10:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8028101A551
 for <cluster-devel@redhat.com>; Wed, 19 Apr 2023 14:10:40 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-538-scYZQFg-N4G7YMziJXkGtQ-1; Wed, 19 Apr 2023 10:10:38 -0400
X-MC-Unique: scYZQFg-N4G7YMziJXkGtQ-1
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-3f178da21afso11411335e9.1; 
 Wed, 19 Apr 2023 07:10:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681913436; x=1684505436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EWddmUi1sUqAJfDu3vTNgbuTywHhrfsi4XwupHN4WwQ=;
 b=c9oZMxZXu7bhzKvGFH4xZA2iD5PfGxDXSNFSL3MFVb3SIZJDOhsP/478kXVHjzl26W
 Mxf4RZEIs8oHRePMbKLRAzSWJL0wtZRhamxCkLhWv+cAxd/U/gp9G6UGGX/HNyiYNu+c
 iwIV3/9fR6N0HKNOv/mkbuonev2NNw548V4Nd58iHP9YS8M3giaJAM3M78Y2hiqgUyqg
 BjkOKMwynqM+2qX0R9W5uRjfKV17LOJ6IRF7+FYvUOdhaPfSq8CTERvSPDqo8tVz2cwd
 V6U8uVhlGw8a5kzcuxluxTQ+V5mBWIYNbqm0QS15/Ih1XrF1ZBaPcZiMxohlZ4Cz7q0Y
 zfiA==
X-Gm-Message-State: AAQBX9ekBoBTRJKPyFd7EKYsvSYpAjd1RYwaFZ5bgmVuxQOp+DUu9Czd
 vvBb1fXOVYP6Ac8B0U7tEH8=
X-Google-Smtp-Source: AKy350ZCP5TtktKYHNeFf1z9UiQzamRZMP6zyEAA3XLpw0OrBxsfVcM+yuHTi4CwYRfJVTx/CPP8lA==
X-Received: by 2002:adf:f0c8:0:b0:2e5:d4f4:c43b with SMTP id
 x8-20020adff0c8000000b002e5d4f4c43bmr4684807wro.55.1681913436518; 
 Wed, 19 Apr 2023 07:10:36 -0700 (PDT)
Received: from localhost.localdomain
 (aftr-62-216-205-204.dynamic.mnet-online.de. [62.216.205.204])
 by smtp.googlemail.com with ESMTPSA id
 q17-20020a5d61d1000000b002faaa9a1721sm7612089wrv.58.2023.04.19.07.10.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 07:10:35 -0700 (PDT)
From: Johannes Thumshirn <jth@kernel.org>
To: axboe@kernel.dk
Date: Wed, 19 Apr 2023 16:09:15 +0200
Message-Id: <20230419140929.5924-6-jth@kernel.org>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Cluster-devel] [PATCH v3 05/19] md: use __bio_add_page to add
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Johannes Thumshirn <johannes.thumshirn@wdc.com>

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
index 13321dbb5fbc..20b9cd7c2f39 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -958,7 +958,7 @@ void md_super_write(struct mddev *mddev, struct md_rdev *rdev,
 	atomic_inc(&rdev->nr_pending);
 
 	bio->bi_iter.bi_sector = sector;
-	bio_add_page(bio, page, size, 0);
+	__bio_add_page(bio, page, size, 0);
 	bio->bi_private = rdev;
 	bio->bi_end_io = super_written;
 
@@ -999,7 +999,7 @@ int sync_page_io(struct md_rdev *rdev, sector_t sector, int size,
 		bio.bi_iter.bi_sector = sector + rdev->new_data_offset;
 	else
 		bio.bi_iter.bi_sector = sector + rdev->data_offset;
-	bio_add_page(&bio, page, size, 0);
+	__bio_add_page(&bio, page, size, 0);
 
 	submit_bio_wait(&bio);
 
-- 
2.39.2

