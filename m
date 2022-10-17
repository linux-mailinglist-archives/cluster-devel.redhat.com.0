Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D908860199C
	for <lists+cluster-devel@lfdr.de>; Mon, 17 Oct 2022 22:25:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666038333;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vEJiD15A68fC6SKwYs5XNRqfHJAp+vmoTIHZ0Wq7X1E=;
	b=CWLUzApj4BLFoHkKCP9ZkLBVAufaFXkr3aKhH7JzsyUq+10iYu49LekNLOQhSSTP8wABCo
	bfHf1qEwJczjdCOb8i0mgGUR09Itpdm/8BJT2PWykeKohTXTW2YpK5P/ubm8S6ptbkf9lR
	Rk4RTA1c803rw2CUIoFywyCfmnuvjBw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-118-8iTL_ahCMyaq3oxr9RPstA-1; Mon, 17 Oct 2022 16:25:30 -0400
X-MC-Unique: 8iTL_ahCMyaq3oxr9RPstA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 305DD803D50;
	Mon, 17 Oct 2022 20:25:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 25A202166B29;
	Mon, 17 Oct 2022 20:25:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id ECD601946597;
	Mon, 17 Oct 2022 20:25:28 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 802A9194658F for <cluster-devel@listman.corp.redhat.com>;
 Mon, 17 Oct 2022 20:25:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 74EB2C15BAB; Mon, 17 Oct 2022 20:25:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D671C15BA4
 for <cluster-devel@redhat.com>; Mon, 17 Oct 2022 20:25:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5317187B2A3
 for <cluster-devel@redhat.com>; Mon, 17 Oct 2022 20:25:27 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-131--snM-dlFMsSXp-5i_LVfxQ-1; Mon, 17 Oct 2022 16:25:17 -0400
X-MC-Unique: -snM-dlFMsSXp-5i_LVfxQ-1
Received: by mail-pj1-f44.google.com with SMTP id
 d7-20020a17090a2a4700b0020d268b1f02so15342655pjg.1
 for <cluster-devel@redhat.com>; Mon, 17 Oct 2022 13:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vEJiD15A68fC6SKwYs5XNRqfHJAp+vmoTIHZ0Wq7X1E=;
 b=WjURZb14+ZtUHZ4y/XCSU1KFZBfwe1VMCl7ktWuXXOpLjDcCWNvzZ4rgH/lMEZdZ44
 K19mhLH2TyMWUv2OmMXraf52N85fUcbRRmiZd93TWmfbz02aS5ng8jW24jbK9nemylr/
 mr9elO+Z4R/Cf2SUX3Zt5PfikKbVvKsBGilopRKB4/ux6q0gTNE1DUxqkodUw8tFgeDF
 NyY1TmxGaFqSQMry0K2X3cinpot6DBEOT0VcP0XY/e9zMw+Y4Ccm2hS7QaLpj1wx1k14
 1JsXyQyoaqjOMy2Htx/ZDoV/mBL2lAMTYChg0c5qGQ/HUlMiyCXP9u+2Q4l0viKnCygU
 eVdw==
X-Gm-Message-State: ACrzQf1LOWbk9fWyF4tRP3yqp2IAyI1FkFKVZkXr7FhihWPfWX6c9MHm
 JZnX1Cu0u3OdjcO6hJUTNCA=
X-Google-Smtp-Source: AMsMyM7NCPquviHbr1ViT+Zn2xCx1V3w/gqj9EI3FyaFAgvANG2ME7aA/s6o30lzSxwKI6TzBYUiPA==
X-Received: by 2002:a17:90a:e7d0:b0:20c:169f:7503 with SMTP id
 kb16-20020a17090ae7d000b0020c169f7503mr34763255pjb.175.1666038316564; 
 Mon, 17 Oct 2022 13:25:16 -0700 (PDT)
Received: from vmfolio.. (c-76-102-73-225.hsd1.ca.comcast.net. [76.102.73.225])
 by smtp.googlemail.com with ESMTPSA id
 pj12-20020a17090b4f4c00b00200b12f2bf5sm145037pjb.1.2022.10.17.13.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 13:25:16 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 17 Oct 2022 13:24:50 -0700
Message-Id: <20221017202451.4951-23-vishal.moola@gmail.com>
In-Reply-To: <20221017202451.4951-1-vishal.moola@gmail.com>
References: <20221017202451.4951-1-vishal.moola@gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Cluster-devel] [PATCH v3 22/23] nilfs2: Convert
 nilfs_clear_dirty_pages() to use filemap_get_folios_tag()
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
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Convert function to use folios throughout. This is in preparation for
the removal of find_get_pages_range_tag().

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>
---
 fs/nilfs2/page.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/fs/nilfs2/page.c b/fs/nilfs2/page.c
index d921542a9593..41ccd43cd979 100644
--- a/fs/nilfs2/page.c
+++ b/fs/nilfs2/page.c
@@ -358,22 +358,22 @@ void nilfs_copy_back_pages(struct address_space *dmap,
  */
 void nilfs_clear_dirty_pages(struct address_space *mapping, bool silent)
 {
-	struct pagevec pvec;
+	struct folio_batch fbatch;
 	unsigned int i;
 	pgoff_t index = 0;
 
-	pagevec_init(&pvec);
+	folio_batch_init(&fbatch);
 
-	while (pagevec_lookup_tag(&pvec, mapping, &index,
-					PAGECACHE_TAG_DIRTY)) {
-		for (i = 0; i < pagevec_count(&pvec); i++) {
-			struct page *page = pvec.pages[i];
+	while (filemap_get_folios_tag(mapping, &index, (pgoff_t)-1,
+				PAGECACHE_TAG_DIRTY, &fbatch)) {
+		for (i = 0; i < folio_batch_count(&fbatch); i++) {
+			struct folio *folio = fbatch.folios[i];
 
-			lock_page(page);
-			nilfs_clear_dirty_page(page, silent);
-			unlock_page(page);
+			folio_lock(folio);
+			nilfs_clear_dirty_page(&folio->page, silent);
+			folio_unlock(folio);
 		}
-		pagevec_release(&pvec);
+		folio_batch_release(&fbatch);
 		cond_resched();
 	}
 }
-- 
2.36.1

