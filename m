Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 251A056B0D4
	for <lists+cluster-devel@lfdr.de>; Fri,  8 Jul 2022 05:29:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657250981;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=oM2k/skZQvyu3mUYfkmntJvn7Ev2BYz4NH8zgIp7wHI=;
	b=hE9Eb7G1xvKLG75vuGnwoJE0Q7GVhExuTGTyIFwcaDRslONyyVjNoGoDdsp60kviv75mcd
	xXJF84QGRNv0MTqDK1aKySJi6dkwYlctzi5Ew+um8QT7IwZQJzUlZMNtBZT9UMRXVrCWNF
	MKKl7lEMqB3y+TxOy5he+CRn9xhJxQk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-217-ooqwza84Pv64NDp8VvqsaQ-1; Thu, 07 Jul 2022 23:29:34 -0400
X-MC-Unique: ooqwza84Pv64NDp8VvqsaQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D158801E95;
	Fri,  8 Jul 2022 03:29:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4B0D92166B26;
	Fri,  8 Jul 2022 03:29:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0ABC8194706E;
	Fri,  8 Jul 2022 03:29:32 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id ACB01194706B for <cluster-devel@listman.corp.redhat.com>;
 Fri,  8 Jul 2022 03:29:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 862C1400EA84; Fri,  8 Jul 2022 03:29:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 81EB9404C6C7
 for <cluster-devel@redhat.com>; Fri,  8 Jul 2022 03:29:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6766F101A54E
 for <cluster-devel@redhat.com>; Fri,  8 Jul 2022 03:29:30 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-z09_NB-gOyORNTk_lohAug-1; Thu, 07 Jul 2022 23:29:27 -0400
X-MC-Unique: z09_NB-gOyORNTk_lohAug-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1o9eg6-003A5X-T9; Fri, 08 Jul 2022 03:29:15 +0000
Date: Fri, 8 Jul 2022 04:29:14 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Hugh Dickins <hughd@google.com>
Message-ID: <Ysekikp60Hhs5lV0@casper.infradead.org>
References: <20220608150249.3033815-1-willy@infradead.org>
 <20220608150249.3033815-8-willy@infradead.org>
 <6e7599d1-8a5f-bf16-383c-febd753bd051@google.com>
MIME-Version: 1.0
In-Reply-To: <6e7599d1-8a5f-bf16-383c-febd753bd051@google.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 07, 2022 at 07:50:17PM -0700, Hugh Dickins wrote:
> On Wed, 8 Jun 2022, Matthew Wilcox (Oracle) wrote:
> 
> > Now that both callers have a folio, convert this function to
> > take a folio & rename it.
> > 
> > Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > ---
> >  mm/migrate.c | 19 ++++++++++++-------
> >  1 file changed, 12 insertions(+), 7 deletions(-)
> > 
> > diff --git a/mm/migrate.c b/mm/migrate.c
> > index 2975f0c4d7cf..2e2f41572066 100644
> > --- a/mm/migrate.c
> > +++ b/mm/migrate.c
> > @@ -336,13 +336,18 @@ void pmd_migration_entry_wait(struct mm_struct *mm, pmd_t *pmd)
> >  }
> >  #endif
> >  
> > -static int expected_page_refs(struct address_space *mapping, struct page *page)
> > +static int folio_expected_refs(struct address_space *mapping,
> > +		struct folio *folio)
> >  {
> > -	int expected_count = 1;
> > +	int refs = 1;
> > +	if (!mapping)
> > +		return refs;
> >  
> > -	if (mapping)
> > -		expected_count += compound_nr(page) + page_has_private(page);
> > -	return expected_count;
> > +	refs += folio_nr_pages(folio);
> > +	if (folio_get_private(folio))
> > +		refs++;
> > +
> > +	return refs;
> >  }
> >  
> >  /*
> > @@ -359,7 +364,7 @@ int folio_migrate_mapping(struct address_space *mapping,
> >  	XA_STATE(xas, &mapping->i_pages, folio_index(folio));
> >  	struct zone *oldzone, *newzone;
> >  	int dirty;
> > -	int expected_count = expected_page_refs(mapping, &folio->page) + extra_count;
> > +	int expected_count = folio_expected_refs(mapping, folio) + extra_count;
> >  	long nr = folio_nr_pages(folio);
> >  
> >  	if (!mapping) {
> > @@ -669,7 +674,7 @@ static int __buffer_migrate_folio(struct address_space *mapping,
> >  		return migrate_page(mapping, &dst->page, &src->page, mode);
> >  
> >  	/* Check whether page does not have extra refs before we do more work */
> > -	expected_count = expected_page_refs(mapping, &src->page);
> > +	expected_count = folio_expected_refs(mapping, src);
> >  	if (folio_ref_count(src) != expected_count)
> >  		return -EAGAIN;
> >  
> > -- 
> > 2.35.1
> 
> This commit (742e89c9e352d38df1a5825fe40c4de73a5d5f7a in pagecache.git
> folio/for-next and recent linux-next) is dangerously wrong, at least
> for swapcache, and probably for some others.
> 
> I say "dangerously" because it tells page migration a swapcache page
> is safe for migration when it certainly is not.
> 
> The fun that typically ensues is kernel BUG at include/linux/mm.h:750!
> put_page_testzero() VM_BUG_ON_PAGE(page_ref_count(page) == 0, page),
> if CONFIG_DEBUG_VM=y (bisecting for that is what brought me to this).
> But I guess you might get silent data corruption too.
> 
> I assumed at first that you'd changed the rules, and were now expecting
> any subsystem that puts a non-zero value into folio->private to raise
> its refcount - whereas the old convention (originating with buffer heads)
> is that setting PG_private says an extra refcount has been taken, please
> call try_to_release_page() to lower it, and maybe that will use data in
> page->private to do so; but page->private free for the subsystem owning
> the page to use as it wishes, no refcount implication.  But that you
> had missed updating swapcache.
> 
> So I got working okay with the patch below; but before turning it into
> a proper patch, noticed that there were still plenty of other places
> applying the test for PG_private: so now think that maybe you set out
> with intention as above, realized it wouldn't work, but got distracted
> before cleaning up some places you'd already changed.  And patch below
> now goes in the wrong direction.
> 
> Or maybe you didn't intend any change, but the PG_private test just got
> missed in a few places.  I don't know, hope you remember, but current
> linux-next badly inconsistent.
> Over to you, thanks,

Ugh.  The problem I'm trying to solve is that we're short on page flags.
We _seemed_ to have correlation between "page->private != NULL" and
"PG_private is set", and so I thought I could make progress towards
removing PG_private.  But the rule you set out above wasn't written down
anywhere that I was able to find it.

I'm about to go to sleep, but I'll think on this some more tomorrow.

> Hugh
> 
> --- a/mm/migrate.c	2022-07-06 14:24:44.499941975 -0700
> +++ b/mm/migrate.c	2022-07-06 15:49:25.000000000 -0700
> @@ -351,6 +351,10 @@ unlock:
>  }
>  #endif
>  
> +static inline bool folio_counted_private(struct folio *folio)
> +{
> +	return !folio_test_swapcache(folio) && folio_get_private(folio);
> +}
>  static int folio_expected_refs(struct address_space *mapping,
>  		struct folio *folio)
>  {
> @@ -359,7 +363,7 @@ static int folio_expected_refs(struct ad
>  		return refs;
>  
>  	refs += folio_nr_pages(folio);
> -	if (folio_get_private(folio))
> +	if (folio_counted_private(folio))
>  		refs++;
>  
>  	return refs;
> --- a/mm/vmscan.c	2022-07-06 14:24:44.531942217 -0700
> +++ b/mm/vmscan.c	2022-07-06 15:49:37.000000000 -0700
> @@ -2494,6 +2494,10 @@ shrink_inactive_list(unsigned long nr_to
>   * The downside is that we have to touch folio->_refcount against each folio.
>   * But we had to alter folio->flags anyway.
>   */
> +static inline bool folio_counted_private(struct folio *folio)
> +{
> +	return !folio_test_swapcache(folio) && folio_get_private(folio);
> +}
>  static void shrink_active_list(unsigned long nr_to_scan,
>  			       struct lruvec *lruvec,
>  			       struct scan_control *sc,
> @@ -2538,8 +2542,9 @@ static void shrink_active_list(unsigned
>  		}
>  
>  		if (unlikely(buffer_heads_over_limit)) {
> -			if (folio_get_private(folio) && folio_trylock(folio)) {
> -				if (folio_get_private(folio))
> +			if (folio_counted_private(folio) &&
> +			    folio_trylock(folio)) {
> +				if (folio_counted_private(folio))
>  					filemap_release_folio(folio, 0);
>  				folio_unlock(folio);
>  			}

