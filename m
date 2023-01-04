Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD2565DE29
	for <lists+cluster-devel@lfdr.de>; Wed,  4 Jan 2023 22:15:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672866911;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uFWiZotH2hHO/dqZz3ekRRXvMmeZ6crkehTB/0Ti1xA=;
	b=Wsw4/5yACdKdFpQBexFBTpjSLKGSDWgZmD7QC8xte2pKKPGU+VLuM2zdJ1NIjRvT6G3Bb+
	aduG5FXz9kwoRlLAnWCOaxBr/ojkwRI8P9knI78PDsl02QYBet08p3DYEb17sB67BEEjUa
	Arjo/YK6t87Sx8WyQlHMkuV9Maobd0M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-xCnQ4XLqN0u7jsl-CLccWA-1; Wed, 04 Jan 2023 16:15:10 -0500
X-MC-Unique: xCnQ4XLqN0u7jsl-CLccWA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 44EFA3813F34;
	Wed,  4 Jan 2023 21:15:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 00FC82166B30;
	Wed,  4 Jan 2023 21:15:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D276D194658F;
	Wed,  4 Jan 2023 21:15:08 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 07D721946589 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  4 Jan 2023 21:15:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F1EAA35455; Wed,  4 Jan 2023 21:15:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E9A4451E5
 for <cluster-devel@redhat.com>; Wed,  4 Jan 2023 21:15:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFD861818E46
 for <cluster-devel@redhat.com>; Wed,  4 Jan 2023 21:15:06 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-148-s8pweqewOd-YOa3Q35K5qQ-1; Wed, 04 Jan 2023 16:15:02 -0500
X-MC-Unique: s8pweqewOd-YOa3Q35K5qQ-1
Received: by mail-pj1-f47.google.com with SMTP id v23so37528750pju.3
 for <cluster-devel@redhat.com>; Wed, 04 Jan 2023 13:15:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uFWiZotH2hHO/dqZz3ekRRXvMmeZ6crkehTB/0Ti1xA=;
 b=NifJochG8SmdzH4jAaehtoAs+5hfEUbzz/N+xHRRGKljHZXTyBV6WWrsdz6C8six96
 2Cnrxe5WgAx5GQJoCHO6GS43tq/pF8oJFxTSFhqnqADhbTQVdka29ziLID0oHzPq6gXh
 IxEXDQDEBFHc2u3mHx1mKflNG1QT/6uO5ui98xwyTU0pThXVJ9Hua0mepk7J3MwCR+/p
 VyKlwmNTHJ0m6h6MSNoiKo0VAWRhDtDUXf7EvYILKrVrQmkd9EcNk9xmCH2LBARFdCky
 xyH+CwNr6lGEiGV1mGzvBRsTRUPZWl3/6fSiwIFQiT1zzKB4UEvXjnC3nFZ8NC2f8ZQf
 GOqw==
X-Gm-Message-State: AFqh2krkaiYZL3nPOkXOdWobgKrkFGs14gllhWz8BPbwjMV3shYYmyF6
 Hz5tARVhilqYtStrZWzA0rE=
X-Google-Smtp-Source: AMrXdXs3J6LoGMu8noxjtrKyXAiquvbz4xl3hf/x2raO3jwqWxe++Tv6pvIGcV6rBxNIAYQX5K7/nQ==
X-Received: by 2002:a17:90b:4d8c:b0:21d:ef10:d6ca with SMTP id
 oj12-20020a17090b4d8c00b0021def10d6camr50592886pjb.45.1672866901534; 
 Wed, 04 Jan 2023 13:15:01 -0800 (PST)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:8002:1c20::a55d])
 by smtp.googlemail.com with ESMTPSA id
 i8-20020a17090a138800b00226369149cesm6408pja.21.2023.01.04.13.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 13:15:01 -0800 (PST)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Wed,  4 Jan 2023 13:14:29 -0800
Message-Id: <20230104211448.4804-5-vishal.moola@gmail.com>
In-Reply-To: <20230104211448.4804-1-vishal.moola@gmail.com>
References: <20230104211448.4804-1-vishal.moola@gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Cluster-devel] [PATCH v5 04/23] page-writeback: Convert
 write_cache_pages() to use filemap_get_folios_tag()
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
 linux-kernel@vger.kernel.org, Matthew Wilcow <willy@infradead.org>,
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

Converted function to use folios throughout. This is in preparation for
the removal of find_get_pages_range_tag(). This change removes 8 calls
to compound_head(), and the function now supports large folios.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Reviewed-by: Matthew Wilcow (Oracle) <willy@infradead.org>
---
 mm/page-writeback.c | 44 +++++++++++++++++++++++---------------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/mm/page-writeback.c b/mm/page-writeback.c
index ad608ef2a243..5d61fa9eecc0 100644
--- a/mm/page-writeback.c
+++ b/mm/page-writeback.c
@@ -2398,15 +2398,15 @@ int write_cache_pages(struct address_space *mapping,
 	int ret = 0;
 	int done = 0;
 	int error;
-	struct pagevec pvec;
-	int nr_pages;
+	struct folio_batch fbatch;
+	int nr_folios;
 	pgoff_t index;
 	pgoff_t end;		/* Inclusive */
 	pgoff_t done_index;
 	int range_whole = 0;
 	xa_mark_t tag;
 
-	pagevec_init(&pvec);
+	folio_batch_init(&fbatch);
 	if (wbc->range_cyclic) {
 		index = mapping->writeback_index; /* prev offset */
 		end = -1;
@@ -2426,17 +2426,18 @@ int write_cache_pages(struct address_space *mapping,
 	while (!done && (index <= end)) {
 		int i;
 
-		nr_pages = pagevec_lookup_range_tag(&pvec, mapping, &index, end,
-				tag);
-		if (nr_pages == 0)
+		nr_folios = filemap_get_folios_tag(mapping, &index, end,
+				tag, &fbatch);
+
+		if (nr_folios == 0)
 			break;
 
-		for (i = 0; i < nr_pages; i++) {
-			struct page *page = pvec.pages[i];
+		for (i = 0; i < nr_folios; i++) {
+			struct folio *folio = fbatch.folios[i];
 
-			done_index = page->index;
+			done_index = folio->index;
 
-			lock_page(page);
+			folio_lock(folio);
 
 			/*
 			 * Page truncated or invalidated. We can freely skip it
@@ -2446,30 +2447,30 @@ int write_cache_pages(struct address_space *mapping,
 			 * even if there is now a new, dirty page at the same
 			 * pagecache address.
 			 */
-			if (unlikely(page->mapping != mapping)) {
+			if (unlikely(folio->mapping != mapping)) {
 continue_unlock:
-				unlock_page(page);
+				folio_unlock(folio);
 				continue;
 			}
 
-			if (!PageDirty(page)) {
+			if (!folio_test_dirty(folio)) {
 				/* someone wrote it for us */
 				goto continue_unlock;
 			}
 
-			if (PageWriteback(page)) {
+			if (folio_test_writeback(folio)) {
 				if (wbc->sync_mode != WB_SYNC_NONE)
-					wait_on_page_writeback(page);
+					folio_wait_writeback(folio);
 				else
 					goto continue_unlock;
 			}
 
-			BUG_ON(PageWriteback(page));
-			if (!clear_page_dirty_for_io(page))
+			BUG_ON(folio_test_writeback(folio));
+			if (!folio_clear_dirty_for_io(folio))
 				goto continue_unlock;
 
 			trace_wbc_writepage(wbc, inode_to_bdi(mapping->host));
-			error = (*writepage)(page, wbc, data);
+			error = writepage(&folio->page, wbc, data);
 			if (unlikely(error)) {
 				/*
 				 * Handle errors according to the type of
@@ -2484,11 +2485,12 @@ int write_cache_pages(struct address_space *mapping,
 				 * the first error.
 				 */
 				if (error == AOP_WRITEPAGE_ACTIVATE) {
-					unlock_page(page);
+					folio_unlock(folio);
 					error = 0;
 				} else if (wbc->sync_mode != WB_SYNC_ALL) {
 					ret = error;
-					done_index = page->index + 1;
+					done_index = folio->index +
+						folio_nr_pages(folio);
 					done = 1;
 					break;
 				}
@@ -2508,7 +2510,7 @@ int write_cache_pages(struct address_space *mapping,
 				break;
 			}
 		}
-		pagevec_release(&pvec);
+		folio_batch_release(&fbatch);
 		cond_resched();
 	}
 
-- 
2.38.1

