Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FA66E8F38
	for <lists+cluster-devel@lfdr.de>; Thu, 20 Apr 2023 12:07:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681985241;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=R6+NeAX2XCjGoXZTYs/vHx8pZBcBY0nCsbbwup4DNoY=;
	b=WXPQX67+TegOosCVDckZYXOHyMZVw9HIxwtsDcDuflWTfkjHJKdzBfZvrY9iRxxLGZhlKQ
	B+ZgBWtngQoJEeKVaSbmQNor1Exxr0oYZnrGAGAj79/2vfHgGn7d4rPGUW2XFqtg8cHxZN
	B2jCpx49AwZ+48d0RP917ZPYgNJp4xs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-Ki9fSdxpPuimraZceXUVhA-1; Thu, 20 Apr 2023 06:07:16 -0400
X-MC-Unique: Ki9fSdxpPuimraZceXUVhA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F190B858F09;
	Thu, 20 Apr 2023 10:07:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E6F6F2166B34;
	Thu, 20 Apr 2023 10:07:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9E78419459FC;
	Thu, 20 Apr 2023 10:07:00 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 380571946A4E for <cluster-devel@listman.corp.redhat.com>;
 Thu, 20 Apr 2023 10:06:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6A2EFC164E9; Thu, 20 Apr 2023 10:06:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 62C6DC164E7
 for <cluster-devel@redhat.com>; Thu, 20 Apr 2023 10:06:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4726B811E7B
 for <cluster-devel@redhat.com>; Thu, 20 Apr 2023 10:06:21 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-3c4vFA2HNCOovhMXLPyqGQ-1; Thu, 20 Apr 2023 06:06:17 -0400
X-MC-Unique: 3c4vFA2HNCOovhMXLPyqGQ-1
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-3f0a80b686eso3442995e9.1; 
 Thu, 20 Apr 2023 03:06:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681985175; x=1684577175;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R6+NeAX2XCjGoXZTYs/vHx8pZBcBY0nCsbbwup4DNoY=;
 b=XedjZuWxZvDCfnZwvd9vJfITMew+9Q9bEhbD+HV8a+1JRPbK1ATtEy8fHumWQ++qLu
 dDaRBEKZ1LdGzuWWjO4S8CZ1aT6x1Lir8HULEUR/GFO7T4xrRcgc5GaZp0FPcdctJijr
 Wbe1iV7iRhvBaDlZ15TniIbr2TCZAOuyJEpSc3BEYSAcmu8lqJ7wa6rXhfiKaQW0v08y
 j2cvb6kCNEmUusjgQ+CyIJrCdgLYCmTiZZITEVlewFwfUghvD9MaA39UNPzxOs87JZfZ
 xIMO1ZIoHx+tsAKS6Re/NK388tbxXkz2KV0z1pmybBK2NimoejoIbvmNaCD13Bh+HM5X
 dPiA==
X-Gm-Message-State: AAQBX9dy8WzDthditQBUQ66NRTTPJbUsXV9ZmLmW1rNwsQk4+sL3A4bL
 jl2Oob13IyCjYegYarx8dFA=
X-Google-Smtp-Source: AKy350aN3PsOr81dbQugpISlk+yjR+a+4/2N8Qu7GaXUJdAVlidoOhFCKUKxX0oN92RzWan4aBS9aQ==
X-Received: by 2002:a5d:5957:0:b0:2f4:3b2c:1b2e with SMTP id
 e23-20020a5d5957000000b002f43b2c1b2emr951041wri.31.1681985175440; 
 Thu, 20 Apr 2023 03:06:15 -0700 (PDT)
Received: from localhost.localdomain
 (aftr-62-216-205-208.dynamic.mnet-online.de. [62.216.205.208])
 by smtp.googlemail.com with ESMTPSA id
 l11-20020a5d674b000000b0030276f42f08sm201410wrw.88.2023.04.20.03.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 03:06:14 -0700 (PDT)
From: Johannes Thumshirn <jth@kernel.org>
To: axboe@kernel.dk
Date: Thu, 20 Apr 2023 12:05:00 +0200
Message-Id: <20230420100501.32981-22-jth@kernel.org>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Cluster-devel] [PATCH v4 21/22] fs: iomap: use __bio_add_folio
 where possible
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Johannes Thumshirn <johannes.thumshirn@wdc.com>

When the iomap buffered-io code can't add a folio to a bio, it allocates a
new bio and adds the folio to that one. This is done using bio_add_folio(),
but doesn't check for errors.

As adding a folio to a newly created bio can't fail, use the newly
introduced __bio_add_folio() function.

Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 fs/iomap/buffered-io.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 6f4c97a6d7e9..473598b68067 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -312,7 +312,7 @@ static loff_t iomap_readpage_iter(const struct iomap_iter *iter,
 			ctx->bio->bi_opf |= REQ_RAHEAD;
 		ctx->bio->bi_iter.bi_sector = sector;
 		ctx->bio->bi_end_io = iomap_read_end_io;
-		bio_add_folio(ctx->bio, folio, plen, poff);
+		__bio_add_folio(ctx->bio, folio, plen, poff);
 	}
 
 done:
@@ -546,7 +546,7 @@ static int iomap_read_folio_sync(loff_t block_start, struct folio *folio,
 
 	bio_init(&bio, iomap->bdev, &bvec, 1, REQ_OP_READ);
 	bio.bi_iter.bi_sector = iomap_sector(iomap, block_start);
-	bio_add_folio(&bio, folio, plen, poff);
+	__bio_add_folio(&bio, folio, plen, poff);
 	return submit_bio_wait(&bio);
 }
 
@@ -1589,7 +1589,7 @@ iomap_add_to_ioend(struct inode *inode, loff_t pos, struct folio *folio,
 
 	if (!bio_add_folio(wpc->ioend->io_bio, folio, len, poff)) {
 		wpc->ioend->io_bio = iomap_chain_bio(wpc->ioend->io_bio);
-		bio_add_folio(wpc->ioend->io_bio, folio, len, poff);
+		__bio_add_folio(wpc->ioend->io_bio, folio, len, poff);
 	}
 
 	if (iop)
-- 
2.39.2

