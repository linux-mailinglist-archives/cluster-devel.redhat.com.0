Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E00F56B0BB
	for <lists+cluster-devel@lfdr.de>; Fri,  8 Jul 2022 04:50:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657248654;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Ad97sT16le5gjY7PgDU6gmeetvBzm9wlE8bQkILVjNc=;
	b=YIFxRb+BIo2OHbSv8IGvYCPTLX9HdmZZ8fFElZXqU/QPoOxZJrPskKFfiR6sVkSY5fqXfA
	7w+qAc7+uwwLOnYO8QqGTilNk8LEamBIWVC8h3p6gjH8Fm7dUVQFJKK6pg/nFjOMvN2hdU
	+yFyCIGTfXqMQ0RqecU2nBoZR7Y2VDw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-VIml_hMJOLC8_kuMObQ-Rw-1; Thu, 07 Jul 2022 22:50:45 -0400
X-MC-Unique: VIml_hMJOLC8_kuMObQ-Rw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7464F3C02182;
	Fri,  8 Jul 2022 02:50:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6D2F51121315;
	Fri,  8 Jul 2022 02:50:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0683D194706F;
	Fri,  8 Jul 2022 02:50:42 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5C3AD194706D for <cluster-devel@listman.corp.redhat.com>;
 Fri,  8 Jul 2022 02:50:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 29B3340315B; Fri,  8 Jul 2022 02:50:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 25271492C3B
 for <cluster-devel@redhat.com>; Fri,  8 Jul 2022 02:50:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0BCD429AA2ED
 for <cluster-devel@redhat.com>; Fri,  8 Jul 2022 02:50:41 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-92-NAgE8D7ePA691y3nFVuITQ-1; Thu, 07 Jul 2022 22:50:39 -0400
X-MC-Unique: NAgE8D7ePA691y3nFVuITQ-1
Received: by mail-qt1-f178.google.com with SMTP id he28so25555144qtb.13
 for <cluster-devel@redhat.com>; Thu, 07 Jul 2022 19:50:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:mime-version;
 bh=Ad97sT16le5gjY7PgDU6gmeetvBzm9wlE8bQkILVjNc=;
 b=v609cuhERdnn4dMFcehG27+NaRjKKRDM6a9SnA7GpY/1vqpyM9O8jo4cN1ID2Dodq4
 NptiwM5Ej1x84Kg29MAdwF/xQiKBhzmKyfkk9rHc2uAGlkKwdRdKoojyTQdLfqqi7HWL
 NZY12CXeGyqZHl8b9J+Xq43QdQVcK/4gwr3oCbI8Rs4v62EiUZF8TXJfUm0C71dvmwi7
 Vx6yEzaTmldWgX6jfhOXYh56eWkQg+ydr2qexHm9ABcwa7HI543LtQDGECJTU5GGlpQD
 zFADZ7NV60jLx+PaiXGukCanG2yVpaqycdXlPbEuYLZ02hNTeQ96lbAOATnL6a0xyQmS
 lSiA==
X-Gm-Message-State: AJIora8ZY7A9v+z+OXbVupLoKGiEVl7k4duK2EEXtNTHkTJgfU6774ej
 Ck483xrG6wP8Ikm3Snlk+pkNMQ==
X-Google-Smtp-Source: AGRyM1tJqq+vsbrqVwAmw8UZQYXdEmN7Cq4ADeDpayYOUxqHMEno4PbopiKhNsYF91bJVygTm51HMQ==
X-Received: by 2002:ac8:7d52:0:b0:319:51f0:e418 with SMTP id
 h18-20020ac87d52000000b0031951f0e418mr1088284qtb.481.1657248632632; 
 Thu, 07 Jul 2022 19:50:32 -0700 (PDT)
Received: from ripple.attlocal.net
 (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a05620a254700b006a65c58db99sm35676841qko.64.2022.07.07.19.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 19:50:32 -0700 (PDT)
Date: Thu, 7 Jul 2022 19:50:17 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.anvils
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
In-Reply-To: <20220608150249.3033815-8-willy@infradead.org>
Message-ID: <6e7599d1-8a5f-bf16-383c-febd753bd051@google.com>
References: <20220608150249.3033815-1-willy@infradead.org>
 <20220608150249.3033815-8-willy@infradead.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [Cluster-devel] [PATCH v2 07/19] mm/migrate: Convert
 expected_page_refs() to folio_expected_refs()
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
Cc: linux-aio@kvack.org, linux-nfs@vger.kernel.org, cluster-devel@redhat.com,
 linux-ntfs-dev@lists.sourceforge.net, Christoph Hellwig <hch@lst.de>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-xfs@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII

On Wed, 8 Jun 2022, Matthew Wilcox (Oracle) wrote:

> Now that both callers have a folio, convert this function to
> take a folio & rename it.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> ---
>  mm/migrate.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 2975f0c4d7cf..2e2f41572066 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -336,13 +336,18 @@ void pmd_migration_entry_wait(struct mm_struct *mm, pmd_t *pmd)
>  }
>  #endif
>  
> -static int expected_page_refs(struct address_space *mapping, struct page *page)
> +static int folio_expected_refs(struct address_space *mapping,
> +		struct folio *folio)
>  {
> -	int expected_count = 1;
> +	int refs = 1;
> +	if (!mapping)
> +		return refs;
>  
> -	if (mapping)
> -		expected_count += compound_nr(page) + page_has_private(page);
> -	return expected_count;
> +	refs += folio_nr_pages(folio);
> +	if (folio_get_private(folio))
> +		refs++;
> +
> +	return refs;
>  }
>  
>  /*
> @@ -359,7 +364,7 @@ int folio_migrate_mapping(struct address_space *mapping,
>  	XA_STATE(xas, &mapping->i_pages, folio_index(folio));
>  	struct zone *oldzone, *newzone;
>  	int dirty;
> -	int expected_count = expected_page_refs(mapping, &folio->page) + extra_count;
> +	int expected_count = folio_expected_refs(mapping, folio) + extra_count;
>  	long nr = folio_nr_pages(folio);
>  
>  	if (!mapping) {
> @@ -669,7 +674,7 @@ static int __buffer_migrate_folio(struct address_space *mapping,
>  		return migrate_page(mapping, &dst->page, &src->page, mode);
>  
>  	/* Check whether page does not have extra refs before we do more work */
> -	expected_count = expected_page_refs(mapping, &src->page);
> +	expected_count = folio_expected_refs(mapping, src);
>  	if (folio_ref_count(src) != expected_count)
>  		return -EAGAIN;
>  
> -- 
> 2.35.1

This commit (742e89c9e352d38df1a5825fe40c4de73a5d5f7a in pagecache.git
folio/for-next and recent linux-next) is dangerously wrong, at least
for swapcache, and probably for some others.

I say "dangerously" because it tells page migration a swapcache page
is safe for migration when it certainly is not.

The fun that typically ensues is kernel BUG at include/linux/mm.h:750!
put_page_testzero() VM_BUG_ON_PAGE(page_ref_count(page) == 0, page),
if CONFIG_DEBUG_VM=y (bisecting for that is what brought me to this).
But I guess you might get silent data corruption too.

I assumed at first that you'd changed the rules, and were now expecting
any subsystem that puts a non-zero value into folio->private to raise
its refcount - whereas the old convention (originating with buffer heads)
is that setting PG_private says an extra refcount has been taken, please
call try_to_release_page() to lower it, and maybe that will use data in
page->private to do so; but page->private free for the subsystem owning
the page to use as it wishes, no refcount implication.  But that you
had missed updating swapcache.

So I got working okay with the patch below; but before turning it into
a proper patch, noticed that there were still plenty of other places
applying the test for PG_private: so now think that maybe you set out
with intention as above, realized it wouldn't work, but got distracted
before cleaning up some places you'd already changed.  And patch below
now goes in the wrong direction.

Or maybe you didn't intend any change, but the PG_private test just got
missed in a few places.  I don't know, hope you remember, but current
linux-next badly inconsistent.
Over to you, thanks,

Hugh

--- a/mm/migrate.c	2022-07-06 14:24:44.499941975 -0700
+++ b/mm/migrate.c	2022-07-06 15:49:25.000000000 -0700
@@ -351,6 +351,10 @@ unlock:
 }
 #endif
 
+static inline bool folio_counted_private(struct folio *folio)
+{
+	return !folio_test_swapcache(folio) && folio_get_private(folio);
+}
 static int folio_expected_refs(struct address_space *mapping,
 		struct folio *folio)
 {
@@ -359,7 +363,7 @@ static int folio_expected_refs(struct ad
 		return refs;
 
 	refs += folio_nr_pages(folio);
-	if (folio_get_private(folio))
+	if (folio_counted_private(folio))
 		refs++;
 
 	return refs;
--- a/mm/vmscan.c	2022-07-06 14:24:44.531942217 -0700
+++ b/mm/vmscan.c	2022-07-06 15:49:37.000000000 -0700
@@ -2494,6 +2494,10 @@ shrink_inactive_list(unsigned long nr_to
  * The downside is that we have to touch folio->_refcount against each folio.
  * But we had to alter folio->flags anyway.
  */
+static inline bool folio_counted_private(struct folio *folio)
+{
+	return !folio_test_swapcache(folio) && folio_get_private(folio);
+}
 static void shrink_active_list(unsigned long nr_to_scan,
 			       struct lruvec *lruvec,
 			       struct scan_control *sc,
@@ -2538,8 +2542,9 @@ static void shrink_active_list(unsigned
 		}
 
 		if (unlikely(buffer_heads_over_limit)) {
-			if (folio_get_private(folio) && folio_trylock(folio)) {
-				if (folio_get_private(folio))
+			if (folio_counted_private(folio) &&
+			    folio_trylock(folio)) {
+				if (folio_counted_private(folio))
 					filemap_release_folio(folio, 0);
 				folio_unlock(folio);
 			}

