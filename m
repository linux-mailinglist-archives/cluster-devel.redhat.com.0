Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8862E61675E
	for <lists+cluster-devel@lfdr.de>; Wed,  2 Nov 2022 17:11:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667405495;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kRHFvRATz/y8GqBUnd9mNnOud0frXSc+Rjf1hBP1wek=;
	b=bpVJPofzRTyj/79z6YSxOS7lGgihP1L0xW8WdvzTlDzVyGp76XVH9gMt04pn0GCmkj3zOM
	pTpT2Bmyu8Dxgld5jv6zJ7dAgIu+Mz4Pn3rTlwoXJV8DTm4wLnG83vWTR+k2WXKTnChtyU
	IdhXzbN+NUaz8Os6zHqBfRzJtAfrTN8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-440-Z8cTgFBrOPWO9PIFGeqOgg-1; Wed, 02 Nov 2022 12:11:32 -0400
X-MC-Unique: Z8cTgFBrOPWO9PIFGeqOgg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB0303817978;
	Wed,  2 Nov 2022 16:11:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DFE22140EBF5;
	Wed,  2 Nov 2022 16:11:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D43A719465B2;
	Wed,  2 Nov 2022 16:11:29 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E8B961946594 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  2 Nov 2022 16:11:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A514F492B09; Wed,  2 Nov 2022 16:11:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DAA8492B08
 for <cluster-devel@redhat.com>; Wed,  2 Nov 2022 16:11:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8383A29AA2E9
 for <cluster-devel@redhat.com>; Wed,  2 Nov 2022 16:11:28 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-207-_9VNrf9lN4eDG6pYFMO4Bw-1; Wed, 02 Nov 2022 12:11:23 -0400
X-MC-Unique: _9VNrf9lN4eDG6pYFMO4Bw-1
Received: by mail-pl1-f180.google.com with SMTP id u6so17009645plq.12
 for <cluster-devel@redhat.com>; Wed, 02 Nov 2022 09:11:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kRHFvRATz/y8GqBUnd9mNnOud0frXSc+Rjf1hBP1wek=;
 b=qpC9Sfen2dP2mhU/TENgNSirQQtKlNX0HiZvvBSkI5igzE3L/u3aNuMuJhqQ2rtxA0
 Op1vTknAE9ZrkqJXARBqQfxr+HTfu76lU7oxD5iwHF+NIxgyvc0am3y4e+SJrUDjmtH6
 Gfw7gkbho1k56zA6OMdCuZvQfRdRiQg/Eo5IJpU4np/vAWM/w3mnTJJa0PpTcx5LyhVl
 Mwd9iJJcCPgZIb3NB7ZQl6f9vCxDpjOsbVA0RG+zRk4nZVLp5evgmWK48mjVCb2XqVNA
 GWQLGiH0NrWz+jeSn+oG8Rffhk7rVLpI7GHZSUGrOZXYUPICVoevxUgHsQgQQO/kxpVm
 UskQ==
X-Gm-Message-State: ACrzQf27im9elorHvPAxSWqg1JLB7tTRYRL1uWGV28+R1s6eLuVmxzpX
 DKeVYUnNcGngyMTUcE2K8V4=
X-Google-Smtp-Source: AMsMyM5LdBAn65fV58RDcya59S76voFKa7sKrxzTyfWnCaf8L6hHgNBfM7eEbdAJBhgLDTjmpfKq+w==
X-Received: by 2002:a17:902:f786:b0:180:6f9e:23b with SMTP id
 q6-20020a170902f78600b001806f9e023bmr26013889pln.37.1667405482254; 
 Wed, 02 Nov 2022 09:11:22 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:8002:1c20::8080])
 by smtp.googlemail.com with ESMTPSA id
 ms4-20020a17090b234400b00210c84b8ae5sm1632101pjb.35.2022.11.02.09.11.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:11:21 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Wed,  2 Nov 2022 09:10:18 -0700
Message-Id: <20221102161031.5820-11-vishal.moola@gmail.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [Cluster-devel] [PATCH v4 10/23] ext4: Convert
 mpage_prepare_extent_to_map() to use filemap_get_folios_tag()
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
 cluster-devel@redhat.com, linux-mm@kvack.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Converted the function to use folios throughout. This is in preparation
for the removal of find_get_pages_range_tag(). Now supports large
folios. This change removes 10 calls to compound_head().

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 fs/ext4/inode.c | 55 ++++++++++++++++++++++++-------------------------
 1 file changed, 27 insertions(+), 28 deletions(-)

diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 2b5ef1b64249..69a0708c8e87 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -2572,8 +2572,8 @@ static int ext4_da_writepages_trans_blocks(struct inode *inode)
 static int mpage_prepare_extent_to_map(struct mpage_da_data *mpd)
 {
 	struct address_space *mapping = mpd->inode->i_mapping;
-	struct pagevec pvec;
-	unsigned int nr_pages;
+	struct folio_batch fbatch;
+	unsigned int nr_folios;
 	long left = mpd->wbc->nr_to_write;
 	pgoff_t index = mpd->first_page;
 	pgoff_t end = mpd->last_page;
@@ -2587,18 +2587,17 @@ static int mpage_prepare_extent_to_map(struct mpage_da_data *mpd)
 		tag = PAGECACHE_TAG_TOWRITE;
 	else
 		tag = PAGECACHE_TAG_DIRTY;
-
-	pagevec_init(&pvec);
+	folio_batch_init(&fbatch);
 	mpd->map.m_len = 0;
 	mpd->next_page = index;
 	while (index <= end) {
-		nr_pages = pagevec_lookup_range_tag(&pvec, mapping, &index, end,
-				tag);
-		if (nr_pages == 0)
+		nr_folios = filemap_get_folios_tag(mapping, &index, end,
+				tag, &fbatch);
+		if (nr_folios == 0)
 			break;
 
-		for (i = 0; i < nr_pages; i++) {
-			struct page *page = pvec.pages[i];
+		for (i = 0; i < nr_folios; i++) {
+			struct folio *folio = fbatch.folios[i];
 
 			/*
 			 * Accumulated enough dirty pages? This doesn't apply
@@ -2612,10 +2611,10 @@ static int mpage_prepare_extent_to_map(struct mpage_da_data *mpd)
 				goto out;
 
 			/* If we can't merge this page, we are done. */
-			if (mpd->map.m_len > 0 && mpd->next_page != page->index)
+			if (mpd->map.m_len > 0 && mpd->next_page != folio->index)
 				goto out;
 
-			lock_page(page);
+			folio_lock(folio);
 			/*
 			 * If the page is no longer dirty, or its mapping no
 			 * longer corresponds to inode we are writing (which
@@ -2623,16 +2622,16 @@ static int mpage_prepare_extent_to_map(struct mpage_da_data *mpd)
 			 * page is already under writeback and we are not doing
 			 * a data integrity writeback, skip the page
 			 */
-			if (!PageDirty(page) ||
-			    (PageWriteback(page) &&
+			if (!folio_test_dirty(folio) ||
+			    (folio_test_writeback(folio) &&
 			     (mpd->wbc->sync_mode == WB_SYNC_NONE)) ||
-			    unlikely(page->mapping != mapping)) {
-				unlock_page(page);
+			    unlikely(folio->mapping != mapping)) {
+				folio_unlock(folio);
 				continue;
 			}
 
-			wait_on_page_writeback(page);
-			BUG_ON(PageWriteback(page));
+			folio_wait_writeback(folio);
+			BUG_ON(folio_test_writeback(folio));
 
 			/*
 			 * Should never happen but for buggy code in
@@ -2643,33 +2642,33 @@ static int mpage_prepare_extent_to_map(struct mpage_da_data *mpd)
 			 *
 			 * [1] https://lore.kernel.org/linux-mm/20180103100430.GE4911@quack2.suse.cz
 			 */
-			if (!page_has_buffers(page)) {
-				ext4_warning_inode(mpd->inode, "page %lu does not have buffers attached", page->index);
-				ClearPageDirty(page);
-				unlock_page(page);
+			if (!folio_buffers(folio)) {
+				ext4_warning_inode(mpd->inode, "page %lu does not have buffers attached", folio->index);
+				folio_clear_dirty(folio);
+				folio_unlock(folio);
 				continue;
 			}
 
 			if (mpd->map.m_len == 0)
-				mpd->first_page = page->index;
-			mpd->next_page = page->index + 1;
+				mpd->first_page = folio->index;
+			mpd->next_page = folio->index + folio_nr_pages(folio);
 			/* Add all dirty buffers to mpd */
-			lblk = ((ext4_lblk_t)page->index) <<
+			lblk = ((ext4_lblk_t)folio->index) <<
 				(PAGE_SHIFT - blkbits);
-			head = page_buffers(page);
+			head = folio_buffers(folio);
 			err = mpage_process_page_bufs(mpd, head, head, lblk);
 			if (err <= 0)
 				goto out;
 			err = 0;
-			left--;
+			left -= folio_nr_pages(folio);
 		}
-		pagevec_release(&pvec);
+		folio_batch_release(&fbatch);
 		cond_resched();
 	}
 	mpd->scanned_until_end = 1;
 	return 0;
 out:
-	pagevec_release(&pvec);
+	folio_batch_release(&fbatch);
 	return err;
 }
 
-- 
2.38.1

