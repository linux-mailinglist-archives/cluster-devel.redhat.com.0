Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBA16E8F2C
	for <lists+cluster-devel@lfdr.de>; Thu, 20 Apr 2023 12:07:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681985226;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ybte8ln4cL1imogQbfLUc6IIuAFaJLWmv8LuzJpUUJE=;
	b=fOlKb7ifKylCEIMMkZWHnJ+boSKvoLJPz3BIMaL2IBYNcikrkxGNDP4sxFazND04eALyTq
	r++elcKmzXAO1YRqfiJbfj8Y5Ke1E8bHF5rPpwQXuYUlMg6VwXW21l3MfF+CVtLYB02OaL
	AjDH8BC0P0e+15XRcpbzdwctZUZe5d0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-Hg5tkef8NjuDY-SAdaqM1w-1; Thu, 20 Apr 2023 06:07:00 -0400
X-MC-Unique: Hg5tkef8NjuDY-SAdaqM1w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A83929AB3F1;
	Thu, 20 Apr 2023 10:06:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1F8C11402C01;
	Thu, 20 Apr 2023 10:06:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4073919472CA;
	Thu, 20 Apr 2023 10:06:45 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1BC8C1946A79 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 20 Apr 2023 10:06:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A3E05112131B; Thu, 20 Apr 2023 10:06:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D0C31121325
 for <cluster-devel@redhat.com>; Thu, 20 Apr 2023 10:06:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DF57884EC3
 for <cluster-devel@redhat.com>; Thu, 20 Apr 2023 10:06:18 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-481-2AlhWcCIMD-TN4XfpV75og-3; Thu, 20 Apr 2023 06:06:15 -0400
X-MC-Unique: 2AlhWcCIMD-TN4XfpV75og-3
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-3f177cb2c6cso3448465e9.2; 
 Thu, 20 Apr 2023 03:06:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681985174; x=1684577174;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ybte8ln4cL1imogQbfLUc6IIuAFaJLWmv8LuzJpUUJE=;
 b=DhwH0iljwzW+gife+Y9l5HegbpR5b9BWKxwyjv7MXsfht+uPzuNfVX2FvrUHJzSv7N
 txaMBRoVONb6QIuhjSafgjDRM1w0Kwsi7/CL//K2QRtIVEYHZ5S8h7Kp4Y4dlQkQiGn1
 SNDldx1VE0LAKkDE9XM6I9pbkmqsKAxHcIwdgwv55GUIwUZAFRaF3roGKxcWiaGrj99e
 aS3y7qq4Yp+zBoGNn0H3t1j0ZruHrNcIirZhXLnomu9F3zY6AJ9uCeUgQm9bD232Mcsc
 i4W4s5UIqXRF6bmzLfYLPxXtCsIkaQxmGSPWMh6E4HA/ZAXGMngDMnyIunVXVFh+LHy8
 FEew==
X-Gm-Message-State: AAQBX9dyYF3eCrOsWaVJGw3QXxrL8SvpJiTgK9ipYYvOplyYHtgMZ8rs
 JiDSTPwdQFDzQkkiPQPyaEc=
X-Google-Smtp-Source: AKy350ZrFHrJO95XpjLsqvNhaT3Lj7em6PpVK0jNKwO81XYdkMaIRUgqMSWWRox8APZBVDphzDkYwQ==
X-Received: by 2002:adf:f384:0:b0:2f2:9198:f0f with SMTP id
 m4-20020adff384000000b002f291980f0fmr833210wro.10.1681985174142; 
 Thu, 20 Apr 2023 03:06:14 -0700 (PDT)
Received: from localhost.localdomain
 (aftr-62-216-205-208.dynamic.mnet-online.de. [62.216.205.208])
 by smtp.googlemail.com with ESMTPSA id
 l11-20020a5d674b000000b0030276f42f08sm201410wrw.88.2023.04.20.03.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 03:06:13 -0700 (PDT)
From: Johannes Thumshirn <jth@kernel.org>
To: axboe@kernel.dk
Date: Thu, 20 Apr 2023 12:04:59 +0200
Message-Id: <20230420100501.32981-21-jth@kernel.org>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [PATCH v4 20/22] block: add __bio_add_folio
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
Cc: linux-block@vger.kernel.org, damien.lemoal@wdc.com, kch@nvidia.com,
 linux-mm@kvack.org, shaggy@kernel.org, johannes.thumshirn@wdc.com,
 snitzer@kernel.org, jfs-discussion@lists.sourceforge.net, willy@infradead.org,
 ming.lei@redhat.com, cluster-devel@redhat.com, linux-fsdevel@vger.kernel.org,
 dm-devel@redhat.com, hare@suse.de, dsterba@suse.com,
 linux-raid@vger.kernel.org, song@kernel.org, hch@lst.de,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Just like for bio_add_pages() add a no-fail variant for bio_add_folio().

Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 block/bio.c         | 8 ++++++++
 include/linux/bio.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/block/bio.c b/block/bio.c
index fd11614bba4d..f3a3524b53e4 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -1138,6 +1138,14 @@ int bio_add_page(struct bio *bio, struct page *page,
 }
 EXPORT_SYMBOL(bio_add_page);
 
+void __bio_add_folio(struct bio *bio, struct folio *folio, size_t len,
+		     size_t off)
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
index 0f8a8d7a6384..99fa832db836 100644
--- a/include/linux/bio.h
+++ b/include/linux/bio.h
@@ -473,6 +473,7 @@ int bio_add_zone_append_page(struct bio *bio, struct page *page,
 			     unsigned int len, unsigned int offset);
 void __bio_add_page(struct bio *bio, struct page *page,
 		unsigned int len, unsigned int off);
+void __bio_add_folio(struct bio *, struct folio *, size_t len, size_t off);
 int bio_iov_iter_get_pages(struct bio *bio, struct iov_iter *iter);
 void bio_iov_bvec_set(struct bio *bio, struct iov_iter *iter);
 void __bio_release_pages(struct bio *bio, bool mark_dirty);
-- 
2.39.2

