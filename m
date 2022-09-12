Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D93755B6069
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Sep 2022 20:26:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663007171;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HQUrfRdnfiMPUlTfezXhcqX7GV4m5M0rlOnnNapCheA=;
	b=Fb/TeoHEdwa7CcdglIqIGkGRCBfScbvtQMEeEysGPmW2WEEc3jPJACEp36Taj+6XMkmGbh
	+ztyJs0Pe4c07SY/wcQMTM51GaW97PeFABJFE4d6YyIHhZ9qjC2Dy57VEycdRhL+Bvfy06
	379ijgENVFn0H29+rKc5WGTN+LIyUSw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-jYtdMD1UMzm6fXp-0VVS5g-1; Mon, 12 Sep 2022 14:26:05 -0400
X-MC-Unique: jYtdMD1UMzm6fXp-0VVS5g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4EA7F299E752;
	Mon, 12 Sep 2022 18:26:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 435112166B26;
	Mon, 12 Sep 2022 18:26:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2A3021946A46;
	Mon, 12 Sep 2022 18:26:04 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 82BA91946A43 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 12 Sep 2022 18:26:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 66AA440C6EC3; Mon, 12 Sep 2022 18:26:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6319940C6EC2
 for <cluster-devel@redhat.com>; Mon, 12 Sep 2022 18:26:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4BA8E299E754
 for <cluster-devel@redhat.com>; Mon, 12 Sep 2022 18:26:03 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-369-EjU326hTO62z_kT46O9v0Q-1; Mon, 12 Sep 2022 14:26:01 -0400
X-MC-Unique: EjU326hTO62z_kT46O9v0Q-1
Received: by mail-pf1-f176.google.com with SMTP id z187so9419219pfb.12
 for <cluster-devel@redhat.com>; Mon, 12 Sep 2022 11:26:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=HQUrfRdnfiMPUlTfezXhcqX7GV4m5M0rlOnnNapCheA=;
 b=fW6H8jOKEloRS/wBzUT0LFpJm7GCpJtrwjr9MOPp63mCuynsU8awpEszx2klPSNuMg
 CsDe0zwGL39sK/HuJk6Fni0z3aNi52vxDWGkItu/yDbKGLkoNWMr4LdJN8e1bbz39asL
 odO+0uXbJrsIcT35SuHvYwc9GYTJcrgZ/of4GamkFCJ/sRHprpGJV778w1i4qF1uG6GR
 h1upVr82oPDzW+3odYLrgyqokDIcNEzwvzeBc0eO0sLtzAG0qdG1MF9+CgKhd6QRy6Op
 i2eOli7/LYtQgfuhrkZK/R5O1lV71PRKeRyw5SdcQ/Zg7M3n/XlbVkNG+Eeh4v6YXwTi
 8C7Q==
X-Gm-Message-State: ACgBeo1bQZlejmUtF6pmHEujX6mu8aww29MuOpXZGGA6nuiBpgtVWsJG
 9+KnTVWr8wVGXXGBLyqFWJY=
X-Google-Smtp-Source: AA6agR5zoGRPcJJ1BMErXHewDDt0vJdvoM167lmthDP3+E0KxFpRx9Na4XeqBQAsnEhH1ytuVdZJxQ==
X-Received: by 2002:a63:5d4e:0:b0:41d:2966:74e7 with SMTP id
 o14-20020a635d4e000000b0041d296674e7mr24037987pgm.526.1663007160214; 
 Mon, 12 Sep 2022 11:26:00 -0700 (PDT)
Received: from vmfolio.. (c-73-189-111-8.hsd1.ca.comcast.net. [73.189.111.8])
 by smtp.googlemail.com with ESMTPSA id
 x127-20020a626385000000b0053b2681b0e0sm5916894pfb.39.2022.09.12.11.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Sep 2022 11:25:59 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 12 Sep 2022 11:22:24 -0700
Message-Id: <20220912182224.514561-24-vishal.moola@gmail.com>
In-Reply-To: <20220912182224.514561-1-vishal.moola@gmail.com>
References: <20220912182224.514561-1-vishal.moola@gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Cluster-devel] [PATCH v2 23/23] filemap: Remove
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
index 85cc96c82c2c..b8ea33751a66 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -742,16 +742,6 @@ unsigned find_get_pages_contig(struct address_space *mapping, pgoff_t start,
 			       unsigned int nr_pages, struct page **pages);
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
index 435fc53b3f2f..b986f246a6ae 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -2309,66 +2309,6 @@ unsigned filemap_get_folios_tag(struct address_space *mapping, pgoff_t *start,
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
index 9cee7f6a3809..7b8c1c8024a1 100644
--- a/mm/swap.c
+++ b/mm/swap.c
@@ -1055,16 +1055,6 @@ void folio_batch_remove_exceptionals(struct folio_batch *fbatch)
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
2.36.1

