Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C99B660196D
	for <lists+cluster-devel@lfdr.de>; Mon, 17 Oct 2022 22:25:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666038306;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wBY1NrBIv9xetMKdetRJVFMD/fis2/cKbUx1OxFOf8Q=;
	b=UDt3o817MvcTAxkQ1mlc8TZr5VcSlwUyaOGorw5icXaCYhwp+Zo1Jni1qCO3zc2C+wwEpY
	0Kz6qB7ii0Zuws7rhOiKlLaJynq1NlMCjaaNEwfAvXpEnYUtVPDApW3rhliUaHFaUWyZlo
	RiP2SAbd19w3e0/VxXQlhtxmLlERoXs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-13-7zjqrMyaPoOVhoCSgO053g-1; Mon, 17 Oct 2022 16:25:05 -0400
X-MC-Unique: 7zjqrMyaPoOVhoCSgO053g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 441473C3C960;
	Mon, 17 Oct 2022 20:25:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3810F202279C;
	Mon, 17 Oct 2022 20:25:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1E1951946597;
	Mon, 17 Oct 2022 20:25:04 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BA4A9194658F for <cluster-devel@listman.corp.redhat.com>;
 Mon, 17 Oct 2022 20:25:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 902842166B2F; Mon, 17 Oct 2022 20:25:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 887ED2166B29
 for <cluster-devel@redhat.com>; Mon, 17 Oct 2022 20:25:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 689BB101A56C
 for <cluster-devel@redhat.com>; Mon, 17 Oct 2022 20:25:02 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-235-JaHVeeuEM4-IGRGOm56L4w-1; Mon, 17 Oct 2022 16:25:00 -0400
X-MC-Unique: JaHVeeuEM4-IGRGOm56L4w-1
Received: by mail-pl1-f172.google.com with SMTP id i6so11787785pli.12;
 Mon, 17 Oct 2022 13:25:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wBY1NrBIv9xetMKdetRJVFMD/fis2/cKbUx1OxFOf8Q=;
 b=t0WxQAWMeqIkOWkkLXBH67UUMj4wILRfrijEFbrudHV/SAjHeNJhfXlVg5TgGPRZQP
 QlNonnJNuGa0Lq7ufXJ9iYfnLc1+rLRu6otH6je/XI8CBeKDmA1U7p7q9zSsDQbDzBL+
 ifflf8uxpoAmiqdnvxD6BfgAX5cS2olLzPIG6vF1koCoY/EkJWKIfdBQ77XT8p8YvjdI
 plmXIBfHWWhDiSVeNFvOH94QoNVhP4iSzEZYlK6xi8zGDGdng+MUjyXtLFFLXGni4Lp8
 w/T6yq0onTUX2xPbMzlQ5sVPRU6Gqne8XABPZUtG699WCBolrSZkq2DUVRnMogJXIZvj
 hNfQ==
X-Gm-Message-State: ACrzQf0uRte+x5ou6UOUiClgndAdkOzo+j82blqL1hPbepDY6hmNUhZn
 fX7m9Ww2IbqLFC+g0H5jPIA=
X-Google-Smtp-Source: AMsMyM5GIzxV9I8ip+Pr2r9RoHLPxaNW9eYwlWAmGdU4DreygpgYRX81ubULxlq5zAIFV1Q1aTcOIw==
X-Received: by 2002:a17:902:c943:b0:182:f5af:40c5 with SMTP id
 i3-20020a170902c94300b00182f5af40c5mr13511810pla.72.1666038299406; 
 Mon, 17 Oct 2022 13:24:59 -0700 (PDT)
Received: from vmfolio.. (c-76-102-73-225.hsd1.ca.comcast.net. [76.102.73.225])
 by smtp.googlemail.com with ESMTPSA id
 pj12-20020a17090b4f4c00b00200b12f2bf5sm145037pjb.1.2022.10.17.13.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 13:24:59 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 17 Oct 2022 13:24:33 -0700
Message-Id: <20221017202451.4951-6-vishal.moola@gmail.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH v3 05/23] afs: Convert
 afs_writepages_region() to use filemap_get_folios_tag()
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
Cc: linux-cifs@vger.kernel.org, David Howells <dhowells@redhat.com>,
 linux-nilfs@vger.kernel.org,
 "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Convert to use folios throughout. This function is in preparation to
remove find_get_pages_range_tag().

Also modified this function to write the whole batch one at a time,
rather than calling for a new set every single write.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Tested-by: David Howells <dhowells@redhat.com>
---
 fs/afs/write.c | 114 +++++++++++++++++++++++++------------------------
 1 file changed, 59 insertions(+), 55 deletions(-)

diff --git a/fs/afs/write.c b/fs/afs/write.c
index 9ebdd36eaf2f..c17dbd82a38c 100644
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -699,82 +699,86 @@ static int afs_writepages_region(struct address_space *mapping,
 				 loff_t start, loff_t end, loff_t *_next)
 {
 	struct folio *folio;
-	struct page *head_page;
+	struct folio_batch fbatch;
 	ssize_t ret;
+	unsigned int i;
 	int n, skips = 0;
 
 	_enter("%llx,%llx,", start, end);
+	folio_batch_init(&fbatch);
 
 	do {
 		pgoff_t index = start / PAGE_SIZE;
 
-		n = find_get_pages_range_tag(mapping, &index, end / PAGE_SIZE,
-					     PAGECACHE_TAG_DIRTY, 1, &head_page);
+		n = filemap_get_folios_tag(mapping, &index, end / PAGE_SIZE,
+					PAGECACHE_TAG_DIRTY, &fbatch);
+
 		if (!n)
 			break;
+		for (i = 0; i < n; i++) {
+			folio = fbatch.folios[i];
+			start = folio_pos(folio); /* May regress with THPs */
 
-		folio = page_folio(head_page);
-		start = folio_pos(folio); /* May regress with THPs */
-
-		_debug("wback %lx", folio_index(folio));
+			_debug("wback %lx", folio_index(folio));
 
-		/* At this point we hold neither the i_pages lock nor the
-		 * page lock: the page may be truncated or invalidated
-		 * (changing page->mapping to NULL), or even swizzled
-		 * back from swapper_space to tmpfs file mapping
-		 */
-		if (wbc->sync_mode != WB_SYNC_NONE) {
-			ret = folio_lock_killable(folio);
-			if (ret < 0) {
-				folio_put(folio);
-				return ret;
-			}
-		} else {
-			if (!folio_trylock(folio)) {
-				folio_put(folio);
-				return 0;
+			/* At this point we hold neither the i_pages lock nor the
+			 * page lock: the page may be truncated or invalidated
+			 * (changing page->mapping to NULL), or even swizzled
+			 * back from swapper_space to tmpfs file mapping
+			 */
+			if (wbc->sync_mode != WB_SYNC_NONE) {
+				ret = folio_lock_killable(folio);
+				if (ret < 0) {
+					folio_batch_release(&fbatch);
+					return ret;
+				}
+			} else {
+				if (!folio_trylock(folio))
+					continue;
 			}
-		}
 
-		if (folio_mapping(folio) != mapping ||
-		    !folio_test_dirty(folio)) {
-			start += folio_size(folio);
-			folio_unlock(folio);
-			folio_put(folio);
-			continue;
-		}
+			if (folio->mapping != mapping ||
+			    !folio_test_dirty(folio)) {
+				start += folio_size(folio);
+				folio_unlock(folio);
+				continue;
+			}
 
-		if (folio_test_writeback(folio) ||
-		    folio_test_fscache(folio)) {
-			folio_unlock(folio);
-			if (wbc->sync_mode != WB_SYNC_NONE) {
-				folio_wait_writeback(folio);
+			if (folio_test_writeback(folio) ||
+			    folio_test_fscache(folio)) {
+				folio_unlock(folio);
+				if (wbc->sync_mode != WB_SYNC_NONE) {
+					folio_wait_writeback(folio);
 #ifdef CONFIG_AFS_FSCACHE
-				folio_wait_fscache(folio);
+					folio_wait_fscache(folio);
 #endif
-			} else {
-				start += folio_size(folio);
+				} else {
+					start += folio_size(folio);
+				}
+				if (wbc->sync_mode == WB_SYNC_NONE) {
+					if (skips >= 5 || need_resched()) {
+						*_next = start;
+						_leave(" = 0 [%llx]", *_next);
+						return 0;
+					}
+					skips++;
+				}
+				continue;
 			}
-			folio_put(folio);
-			if (wbc->sync_mode == WB_SYNC_NONE) {
-				if (skips >= 5 || need_resched())
-					break;
-				skips++;
+
+			if (!folio_clear_dirty_for_io(folio))
+				BUG();
+			ret = afs_write_back_from_locked_folio(mapping, wbc,
+					folio, start, end);
+			if (ret < 0) {
+				_leave(" = %zd", ret);
+				folio_batch_release(&fbatch);
+				return ret;
 			}
-			continue;
-		}
 
-		if (!folio_clear_dirty_for_io(folio))
-			BUG();
-		ret = afs_write_back_from_locked_folio(mapping, wbc, folio, start, end);
-		folio_put(folio);
-		if (ret < 0) {
-			_leave(" = %zd", ret);
-			return ret;
+			start += ret;
 		}
-
-		start += ret;
-
+		folio_batch_release(&fbatch);
 		cond_resched();
 	} while (wbc->nr_to_write > 0);
 
-- 
2.36.1

