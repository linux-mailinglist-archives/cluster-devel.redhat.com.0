Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8713F616793
	for <lists+cluster-devel@lfdr.de>; Wed,  2 Nov 2022 17:11:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667405512;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0kIQ32jgESZghl2JsFuRf0mmCK8FvEn1HKHvqp4B/UI=;
	b=DaD6OiW6O0lcbwKxREPYblhbkOjhcGjARPtg3v4577by0lOaHRb09zSJhrXjoZe+zSSkBS
	QAGoH1XaQy3r9qSApd2qKeP1ytl5DWeLhWT9790nde3ndzH4Hl3QIJiEq9NUQVFVjlQhL9
	iEqCi6EXMzaMsvn0tKkpZ0MuOp63rxc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-mbUHMtDcPHKsq4A32tLlsg-1; Wed, 02 Nov 2022 12:11:48 -0400
X-MC-Unique: mbUHMtDcPHKsq4A32tLlsg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 408F93817971;
	Wed,  2 Nov 2022 16:11:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 33D9A492B08;
	Wed,  2 Nov 2022 16:11:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EF4A119465B2;
	Wed,  2 Nov 2022 16:11:46 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 09D731946594 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  2 Nov 2022 16:11:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id ED8D51121320; Wed,  2 Nov 2022 16:11:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E6CB01121314
 for <cluster-devel@redhat.com>; Wed,  2 Nov 2022 16:11:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE66D101E157
 for <cluster-devel@redhat.com>; Wed,  2 Nov 2022 16:11:43 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-152-YhG0ZxjLNbOd4EEa_gr-6g-2; Wed, 02 Nov 2022 12:11:42 -0400
X-MC-Unique: YhG0ZxjLNbOd4EEa_gr-6g-2
Received: by mail-pf1-f177.google.com with SMTP id k15so8767865pfg.2
 for <cluster-devel@redhat.com>; Wed, 02 Nov 2022 09:11:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0kIQ32jgESZghl2JsFuRf0mmCK8FvEn1HKHvqp4B/UI=;
 b=omNAxE4OpISHPECifaMdURXSIzKbuYDyg3XpPNtePD5sqr5W8kmgRk/4sRNwfyXrsZ
 c7jK/KzBO+jghRLmoqkYJ8XnCb+4sjw3Z5hSJkoIE7MG3Yt2rubgAAah2XqoOFRWlCyM
 M6cwm33S8zP95ac8lSRm3gcuYR/ehlERWeF8QtWV5+c+xv4cH1mgnjfb1LdN5ic66IZ5
 rZUCa8ARHohQc/5AsdoQSoXpkqIqJQOHdacATW3crBz7Wplnnrsed9x9gNh7N1ZI9LhY
 dwtaisA7ArGMDDLKBQw2xYH57CRL42K97XXEP8SJ4Vu30bO0pnIROmaSRRg6p3SDVyXa
 +khQ==
X-Gm-Message-State: ACrzQf02UcEK9RD30CP1bjQ0I1tbg+G3M4wlGR3oB/UjLPnGsOXvicyX
 15Ifd1x2pUr55pX1SlzCGNo=
X-Google-Smtp-Source: AMsMyM6M+HYXpiH0U+VfyXFrJ89SEz8gDigaYYVWPndroJTYZEBXjmxNBwyGQzQ73aNi+YK3GqHHhQ==
X-Received: by 2002:a63:5a1b:0:b0:461:9934:6f62 with SMTP id
 o27-20020a635a1b000000b0046199346f62mr22432948pgb.266.1667405501408; 
 Wed, 02 Nov 2022 09:11:41 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:8002:1c20::8080])
 by smtp.googlemail.com with ESMTPSA id
 ms4-20020a17090b234400b00210c84b8ae5sm1632101pjb.35.2022.11.02.09.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:11:41 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Wed,  2 Nov 2022 09:10:31 -0700
Message-Id: <20221102161031.5820-24-vishal.moola@gmail.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [PATCH v4 23/23] filemap: Remove
 find_get_pages_range_tag()
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

All callers to find_get_pages_range_tag(), find_get_pages_tag(),
pagevec_lookup_range_tag(), and pagevec_lookup_tag() have been removed.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/pagemap.h | 10 -------
 include/linux/pagevec.h |  8 ------
 mm/filemap.c            | 60 -----------------------------------------
 mm/swap.c               | 10 -------
 4 files changed, 88 deletions(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 28275eecb949..c83dfcbc19b3 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -742,16 +742,6 @@ unsigned filemap_get_folios_contig(struct address_space *mapping,
 		pgoff_t *start, pgoff_t end, struct folio_batch *fbatch);
 unsigned filemap_get_folios_tag(struct address_space *mapping, pgoff_t *start,
 		pgoff_t end, xa_mark_t tag, struct folio_batch *fbatch);
-unsigned find_get_pages_range_tag(struct address_space *mapping, pgoff_t *index,
-			pgoff_t end, xa_mark_t tag, unsigned int nr_pages,
-			struct page **pages);
-static inline unsigned find_get_pages_tag(struct address_space *mapping,
-			pgoff_t *index, xa_mark_t tag, unsigned int nr_pages,
-			struct page **pages)
-{
-	return find_get_pages_range_tag(mapping, index, (pgoff_t)-1, tag,
-					nr_pages, pages);
-}
 
 struct page *grab_cache_page_write_begin(struct address_space *mapping,
 			pgoff_t index);
diff --git a/include/linux/pagevec.h b/include/linux/pagevec.h
index 215eb6c3bdc9..a520632297ac 100644
--- a/include/linux/pagevec.h
+++ b/include/linux/pagevec.h
@@ -26,14 +26,6 @@ struct pagevec {
 };
 
 void __pagevec_release(struct pagevec *pvec);
-unsigned pagevec_lookup_range_tag(struct pagevec *pvec,
-		struct address_space *mapping, pgoff_t *index, pgoff_t end,
-		xa_mark_t tag);
-static inline unsigned pagevec_lookup_tag(struct pagevec *pvec,
-		struct address_space *mapping, pgoff_t *index, xa_mark_t tag)
-{
-	return pagevec_lookup_range_tag(pvec, mapping, index, (pgoff_t)-1, tag);
-}
 
 static inline void pagevec_init(struct pagevec *pvec)
 {
diff --git a/mm/filemap.c b/mm/filemap.c
index cc4be51eae5b..8ad45c2e22cd 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -2318,66 +2318,6 @@ unsigned filemap_get_folios_tag(struct address_space *mapping, pgoff_t *start,
 }
 EXPORT_SYMBOL(filemap_get_folios_tag);
 
-/**
- * find_get_pages_range_tag - Find and return head pages matching @tag.
- * @mapping:	the address_space to search
- * @index:	the starting page index
- * @end:	The final page index (inclusive)
- * @tag:	the tag index
- * @nr_pages:	the maximum number of pages
- * @pages:	where the resulting pages are placed
- *
- * Like find_get_pages_range(), except we only return head pages which are
- * tagged with @tag.  @index is updated to the index immediately after the
- * last page we return, ready for the next iteration.
- *
- * Return: the number of pages which were found.
- */
-unsigned find_get_pages_range_tag(struct address_space *mapping, pgoff_t *index,
-			pgoff_t end, xa_mark_t tag, unsigned int nr_pages,
-			struct page **pages)
-{
-	XA_STATE(xas, &mapping->i_pages, *index);
-	struct folio *folio;
-	unsigned ret = 0;
-
-	if (unlikely(!nr_pages))
-		return 0;
-
-	rcu_read_lock();
-	while ((folio = find_get_entry(&xas, end, tag))) {
-		/*
-		 * Shadow entries should never be tagged, but this iteration
-		 * is lockless so there is a window for page reclaim to evict
-		 * a page we saw tagged.  Skip over it.
-		 */
-		if (xa_is_value(folio))
-			continue;
-
-		pages[ret] = &folio->page;
-		if (++ret == nr_pages) {
-			*index = folio->index + folio_nr_pages(folio);
-			goto out;
-		}
-	}
-
-	/*
-	 * We come here when we got to @end. We take care to not overflow the
-	 * index @index as it confuses some of the callers. This breaks the
-	 * iteration when there is a page at index -1 but that is already
-	 * broken anyway.
-	 */
-	if (end == (pgoff_t)-1)
-		*index = (pgoff_t)-1;
-	else
-		*index = end + 1;
-out:
-	rcu_read_unlock();
-
-	return ret;
-}
-EXPORT_SYMBOL(find_get_pages_range_tag);
-
 /*
  * CD/DVDs are error prone. When a medium error occurs, the driver may fail
  * a _large_ part of the i/o request. Imagine the worst scenario:
diff --git a/mm/swap.c b/mm/swap.c
index 955930f41d20..89351b6dd149 100644
--- a/mm/swap.c
+++ b/mm/swap.c
@@ -1098,16 +1098,6 @@ void folio_batch_remove_exceptionals(struct folio_batch *fbatch)
 	fbatch->nr = j;
 }
 
-unsigned pagevec_lookup_range_tag(struct pagevec *pvec,
-		struct address_space *mapping, pgoff_t *index, pgoff_t end,
-		xa_mark_t tag)
-{
-	pvec->nr = find_get_pages_range_tag(mapping, index, end, tag,
-					PAGEVEC_SIZE, pvec->pages);
-	return pagevec_count(pvec);
-}
-EXPORT_SYMBOL(pagevec_lookup_range_tag);
-
 /*
  * Perform any setup for the swap system
  */
-- 
2.38.1

