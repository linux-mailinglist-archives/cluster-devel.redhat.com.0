Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BF06E8F30
	for <lists+cluster-devel@lfdr.de>; Thu, 20 Apr 2023 12:07:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681985230;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bdnAdvAKJlDAz7pM0pp8Diurpm3+TR0sCY4FonfaEe4=;
	b=ezvH6an639iC3tRcku9c9ylcp4EMsnGcnY7Jss6gyEaqmy7AJ+bu/7siKqVeFcmn2In2LL
	z6DlnALKTHmsjU8uFwo/QzB2La018MKNzx9JAlBJX+QL9XxlhFdn/A21nVZuoQrox+6hj2
	ZrmpF/lrGfuDisjgIiP74CjBNVzBJIA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-y9GinIrHPXiDUiWsmXKtsw-1; Thu, 20 Apr 2023 06:07:05 -0400
X-MC-Unique: y9GinIrHPXiDUiWsmXKtsw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F751101A557;
	Thu, 20 Apr 2023 10:07:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 94978C16024;
	Thu, 20 Apr 2023 10:07:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 55A9C1946A6B;
	Thu, 20 Apr 2023 10:06:55 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 23AC519472C3 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 20 Apr 2023 10:06:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 60AEC40BC7A2; Thu, 20 Apr 2023 10:06:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 59B9340BC7A1
 for <cluster-devel@redhat.com>; Thu, 20 Apr 2023 10:06:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E08488B7A1
 for <cluster-devel@redhat.com>; Thu, 20 Apr 2023 10:06:20 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-6Q6pQEx1MfSZ7MVyLQ4j-Q-1; Thu, 20 Apr 2023 06:06:18 -0400
X-MC-Unique: 6Q6pQEx1MfSZ7MVyLQ4j-Q-1
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-3f1728c2a57so5546325e9.0; 
 Thu, 20 Apr 2023 03:06:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681985176; x=1684577176;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bdnAdvAKJlDAz7pM0pp8Diurpm3+TR0sCY4FonfaEe4=;
 b=cL/WWMv9Lp4ugbMMR8r3EOuBg8Xzl51v4nQsi4ylKbZVM0F9FYxXGWcsPQxWQZR/zx
 UmF6iV8neQxjLttbuVSAppCGimeadEXZl0tLlAyUu8auY3tq/FFY8M04Uf5H/Mb0Bpml
 pgDU7g1SedO2eseeANoZe4n3dbb+hFUj256VkrJcRsgsXiyyCx96wE7cmqP5u34RLJ69
 +zAQYouuE6sVvwhTargWkBvHvXUORfsYXz5VlSrki0MpjATGWbZLNl3BZSqrNbA2bWKH
 zhGiJTEYXLePgkoZnagf5ugaZrt+vSG2SCYLnFpX4MBnX4uYJKN9jVvHWI8Lup6NYLWl
 IX5Q==
X-Gm-Message-State: AAQBX9e2xXOcQPtUh0k4cwLZ4jjZ64o5wEB2UH6YFSiVwIY8S8UVxxav
 MN+iQfGBqFsTW/NBGLR6YpA=
X-Google-Smtp-Source: AKy350bs2gtzNI5cB6yEjD27bAOubU763Pln69XpJllBqakY/TYBXJ5mOXnM5tQ2B75UHodvDIFK3A==
X-Received: by 2002:a5d:6dcc:0:b0:2fa:43e7:4a32 with SMTP id
 d12-20020a5d6dcc000000b002fa43e74a32mr694948wrz.66.1681985176558; 
 Thu, 20 Apr 2023 03:06:16 -0700 (PDT)
Received: from localhost.localdomain
 (aftr-62-216-205-208.dynamic.mnet-online.de. [62.216.205.208])
 by smtp.googlemail.com with ESMTPSA id
 l11-20020a5d674b000000b0030276f42f08sm201410wrw.88.2023.04.20.03.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 03:06:16 -0700 (PDT)
From: Johannes Thumshirn <jth@kernel.org>
To: axboe@kernel.dk
Date: Thu, 20 Apr 2023 12:05:01 +0200
Message-Id: <20230420100501.32981-23-jth@kernel.org>
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
Subject: [Cluster-devel] [PATCH v4 22/22] block: mark bio_add_folio as
 __must_check
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Now that all callers of bio_add_folio() check the return value, mark it as
__must_check.

Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 include/linux/bio.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/bio.h b/include/linux/bio.h
index 99fa832db836..36cfc091caed 100644
--- a/include/linux/bio.h
+++ b/include/linux/bio.h
@@ -466,7 +466,7 @@ void bio_reset(struct bio *bio, struct block_device *bdev, blk_opf_t opf);
 void bio_chain(struct bio *, struct bio *);
 
 int __must_check bio_add_page(struct bio *, struct page *, unsigned len, unsigned off);
-bool bio_add_folio(struct bio *, struct folio *, size_t len, size_t off);
+bool __must_check bio_add_folio(struct bio *, struct folio *, size_t len, size_t off);
 extern int bio_add_pc_page(struct request_queue *, struct bio *, struct page *,
 			   unsigned int, unsigned int);
 int bio_add_zone_append_page(struct bio *bio, struct page *page,
-- 
2.39.2

