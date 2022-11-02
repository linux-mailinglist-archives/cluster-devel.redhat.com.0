Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EED861674A
	for <lists+cluster-devel@lfdr.de>; Wed,  2 Nov 2022 17:11:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667405487;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ihiS02r9sD2/Zs2Vx3FiURN5naIQGKMktV+WLRuKSks=;
	b=jOZoNu2ueERGCbXA6da/XZG5lu2h4kimF19ylPOWC3eBK5I1h8efgzUcD0bqHNxtEDpBK9
	2C0LR1zswKodDaWewojpCPqnDtIPLISr5cqZiN85Ydd+Q8Fp2TzRQDdvjUxjbcLxgUG+hK
	dQU39YOi/yLuynXSmH9dA/BxuqssafM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-wJdXyxQiO3GKthZcTgUQYg-1; Wed, 02 Nov 2022 12:11:22 -0400
X-MC-Unique: wJdXyxQiO3GKthZcTgUQYg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA8B7887403;
	Wed,  2 Nov 2022 16:11:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BF7492166B2B;
	Wed,  2 Nov 2022 16:11:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AB36219465B2;
	Wed,  2 Nov 2022 16:11:21 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6EFEE1946594 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  2 Nov 2022 16:11:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 536412166B2D; Wed,  2 Nov 2022 16:11:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C6A52166B2B
 for <cluster-devel@redhat.com>; Wed,  2 Nov 2022 16:11:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33A8C857FAC
 for <cluster-devel@redhat.com>; Wed,  2 Nov 2022 16:11:20 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-626-bshnRsHrM1OO51XuIYsxzA-1; Wed, 02 Nov 2022 12:11:18 -0400
X-MC-Unique: bshnRsHrM1OO51XuIYsxzA-1
Received: by mail-pg1-f169.google.com with SMTP id s196so16649822pgs.3
 for <cluster-devel@redhat.com>; Wed, 02 Nov 2022 09:11:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ihiS02r9sD2/Zs2Vx3FiURN5naIQGKMktV+WLRuKSks=;
 b=FBrAA4RiL0u/ABxFMRY4UoFr3aldpcBAnNdILckjh+qGxi/Zt41DJ5j7vi9jx3xBDZ
 pD4II2dQ14cBuAf4Cz/yLWl13R9Bt+1gQFDOVOAW8jmBTxdnb28LhsGK+kSD3AvS/kpI
 xa+GPTKk+wDnWKC1ZSbKJbRSh3PxGLO08Js8lqFaFzTPsNARYlKcqymhq74TwquNqBgS
 2CFmgTa2vzBf0qjVAAbFY/H4JmqQUn6/HEp5xDx57BXxFmE8/jPfHLvQlHbHqpGbxuDK
 ydAUFgvwO/JgNaUUasXTBPEXcEDUkyxiSjAAPAJLJMF26+Ind2HnUQEemn/SDYq/3xAH
 Jtfg==
X-Gm-Message-State: ACrzQf2AVb+XiUzUZv9U/lF/II7V0Ip/jRTuRnjncaobQVKDy8y1LSkq
 589SAdSO2cNlFFWUawXy130=
X-Google-Smtp-Source: AMsMyM633/rTqiXcBf1XgON7eedWlU4pI5wcG5xiQZ6whfd6GaRXCeCpBFfVcxVkD9k3/TH52+6eXg==
X-Received: by 2002:a05:6a00:a22:b0:54e:6a90:fbef with SMTP id
 p34-20020a056a000a2200b0054e6a90fbefmr25892086pfh.53.1667405477494; 
 Wed, 02 Nov 2022 09:11:17 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:8002:1c20::8080])
 by smtp.googlemail.com with ESMTPSA id
 ms4-20020a17090b234400b00210c84b8ae5sm1632101pjb.35.2022.11.02.09.11.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:11:17 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Wed,  2 Nov 2022 09:10:15 -0700
Message-Id: <20221102161031.5820-8-vishal.moola@gmail.com>
In-Reply-To: <20221102161031.5820-1-vishal.moola@gmail.com>
References: <20221102161031.5820-1-vishal.moola@gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH v4 07/23] btrfs: Convert
 extent_write_cache_pages() to use filemap_get_folios_tag()
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
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, David Sterba <dsterba@suse.com>,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Converted function to use folios throughout. This is in preparation for
the removal of find_get_pages_range_tag(). Now also supports large
folios.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: David Sterba <dsterba@suse.com>
---
 fs/btrfs/extent_io.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
index 9ae75db4d55e..983dde83ba93 100644
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@ -3088,8 +3088,8 @@ static int extent_write_cache_pages(struct address_space *mapping,
 	int ret = 0;
 	int done = 0;
 	int nr_to_write_done = 0;
-	struct pagevec pvec;
-	int nr_pages;
+	struct folio_batch fbatch;
+	unsigned int nr_folios;
 	pgoff_t index;
 	pgoff_t end;		/* Inclusive */
 	pgoff_t done_index;
@@ -3109,7 +3109,7 @@ static int extent_write_cache_pages(struct address_space *mapping,
 	if (!igrab(inode))
 		return 0;
 
-	pagevec_init(&pvec);
+	folio_batch_init(&fbatch);
 	if (wbc->range_cyclic) {
 		index = mapping->writeback_index; /* Start from prev offset */
 		end = -1;
@@ -3147,14 +3147,14 @@ static int extent_write_cache_pages(struct address_space *mapping,
 		tag_pages_for_writeback(mapping, index, end);
 	done_index = index;
 	while (!done && !nr_to_write_done && (index <= end) &&
-			(nr_pages = pagevec_lookup_range_tag(&pvec, mapping,
-						&index, end, tag))) {
+			(nr_folios = filemap_get_folios_tag(mapping, &index,
+							end, tag, &fbatch))) {
 		unsigned i;
 
-		for (i = 0; i < nr_pages; i++) {
-			struct page *page = pvec.pages[i];
+		for (i = 0; i < nr_folios; i++) {
+			struct folio *folio = fbatch.folios[i];
 
-			done_index = page->index + 1;
+			done_index = folio->index + folio_nr_pages(folio);
 			/*
 			 * At this point we hold neither the i_pages lock nor
 			 * the page lock: the page may be truncated or
@@ -3162,29 +3162,29 @@ static int extent_write_cache_pages(struct address_space *mapping,
 			 * or even swizzled back from swapper_space to
 			 * tmpfs file mapping
 			 */
-			if (!trylock_page(page)) {
+			if (!folio_trylock(folio)) {
 				submit_write_bio(epd, 0);
-				lock_page(page);
+				folio_lock(folio);
 			}
 
-			if (unlikely(page->mapping != mapping)) {
-				unlock_page(page);
+			if (unlikely(folio->mapping != mapping)) {
+				folio_unlock(folio);
 				continue;
 			}
 
 			if (wbc->sync_mode != WB_SYNC_NONE) {
-				if (PageWriteback(page))
+				if (folio_test_writeback(folio))
 					submit_write_bio(epd, 0);
-				wait_on_page_writeback(page);
+				folio_wait_writeback(folio);
 			}
 
-			if (PageWriteback(page) ||
-			    !clear_page_dirty_for_io(page)) {
-				unlock_page(page);
+			if (folio_test_writeback(folio) ||
+			    !folio_clear_dirty_for_io(folio)) {
+				folio_unlock(folio);
 				continue;
 			}
 
-			ret = __extent_writepage(page, wbc, epd);
+			ret = __extent_writepage(&folio->page, wbc, epd);
 			if (ret < 0) {
 				done = 1;
 				break;
@@ -3197,7 +3197,7 @@ static int extent_write_cache_pages(struct address_space *mapping,
 			 */
 			nr_to_write_done = wbc->nr_to_write <= 0;
 		}
-		pagevec_release(&pvec);
+		folio_batch_release(&fbatch);
 		cond_resched();
 	}
 	if (!scanned && !done) {
-- 
2.38.1

