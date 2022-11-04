Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDF0618D41
	for <lists+cluster-devel@lfdr.de>; Fri,  4 Nov 2022 01:32:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667521972;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=nqFWmWfUe3nfY/W1IhQtBrk1jdkAMC8SotBe5qoKInk=;
	b=LizlCRX9SaSC8+cpN5fddWlb70fUvsAfNXmMuW3H5WLpv9xfV4y509QTdGJ3864jjltxd3
	yhjgua0CuouFPiviRFvoNLTMy9NhsvjweDh0PnI+FaaLjbBLAzahgakrJEYUPrzVnfLl0q
	U0DEDmFKCk9t7h8IAMLyf0heKv5EqWw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-292-WYy1oNrjM5a8vf88Pa9gKg-1; Thu, 03 Nov 2022 20:32:50 -0400
X-MC-Unique: WYy1oNrjM5a8vf88Pa9gKg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1621982DFC7;
	Fri,  4 Nov 2022 00:32:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A5A781415123;
	Fri,  4 Nov 2022 00:32:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4B7A319465B2;
	Fri,  4 Nov 2022 00:32:47 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 190F71946594 for <cluster-devel@listman.corp.redhat.com>;
 Fri,  4 Nov 2022 00:32:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 084BB1402BDC; Fri,  4 Nov 2022 00:32:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 000C41402BDB
 for <cluster-devel@redhat.com>; Fri,  4 Nov 2022 00:32:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D54B3823F09
 for <cluster-devel@redhat.com>; Fri,  4 Nov 2022 00:32:45 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-376-yS6JE20JPF6br79ngHPTCQ-1; Thu, 03 Nov 2022 20:32:41 -0400
X-MC-Unique: yS6JE20JPF6br79ngHPTCQ-1
Received: by mail-pf1-f177.google.com with SMTP id d10so3139099pfh.6
 for <cluster-devel@redhat.com>; Thu, 03 Nov 2022 17:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nqFWmWfUe3nfY/W1IhQtBrk1jdkAMC8SotBe5qoKInk=;
 b=MXi4g1vX++35K49naGkqcYxvO+4VFW8MGZ/Er+7l6CiQ8T8jbydaxQMdaTH78yGBIz
 /406OjewBO4KnrNiirTILTy5L+IXlxBmK7h/kPW4iO3crC2KvPoOH9zAYnfxeGcycsgQ
 WMFczftlMIG0TuxyAg/n6nwnaFjNb6I2JNoTdxzR1+3RLQzN0DzQ9wShwP3BduUl7+46
 nPpCM+fQWwWvzOzwqqb1miEe+hUXfkXbX7nc3bitkf04zwZzX4mPCcAs5BbO5cMy1vQA
 qbTb5YYEdeYPpEvYzJ4NHRh7vYOg6jgxEBEDeqVIdyd7W+12soSWqmNEctEFl8PcwJ4M
 vuOw==
X-Gm-Message-State: ACrzQf3M1tKsUbZtiheBlJHb7ERdq34mdpgZycDh4/hh2srfJJCwn3zf
 SMWoz4klGqtBzG1ohbXzhr3iJg==
X-Google-Smtp-Source: AMsMyM6iJ2SNWGuGLen8Rv+LFYo5aa41OR1ELR00lyKv92EB0uGeLIs3Yf+UrlIB5ACN2HoiTY/hWA==
X-Received: by 2002:aa7:962c:0:b0:56c:14c9:70dc with SMTP id
 r12-20020aa7962c000000b0056c14c970dcmr224950pfg.17.1667521959674; 
 Thu, 03 Nov 2022 17:32:39 -0700 (PDT)
Received: from dread.disaster.area (pa49-181-106-210.pa.nsw.optusnet.com.au.
 [49.181.106.210]) by smtp.gmail.com with ESMTPSA id
 w189-20020a6282c6000000b0056c04dee930sm1341605pfd.120.2022.11.03.17.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 17:32:39 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1oqkdP-009ySF-U9; Fri, 04 Nov 2022 11:32:35 +1100
Date: Fri, 4 Nov 2022 11:32:35 +1100
From: Dave Chinner <david@fromorbit.com>
To: Vishal Moola <vishal.moola@gmail.com>
Message-ID: <20221104003235.GZ2703033@dread.disaster.area>
References: <20220901220138.182896-1-vishal.moola@gmail.com>
 <20220901220138.182896-5-vishal.moola@gmail.com>
 <20221018210152.GH2703033@dread.disaster.area>
 <Y2RAdUtJrOJmYU4L@fedora>
MIME-Version: 1.0
In-Reply-To: <Y2RAdUtJrOJmYU4L@fedora>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Cluster-devel] [PATCH 04/23] page-writeback: Convert
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
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 03, 2022 at 03:28:05PM -0700, Vishal Moola wrote:
> On Wed, Oct 19, 2022 at 08:01:52AM +1100, Dave Chinner wrote:
> > On Thu, Sep 01, 2022 at 03:01:19PM -0700, Vishal Moola (Oracle) wrote:
> > > Converted function to use folios throughout. This is in preparation for
> > > the removal of find_get_pages_range_tag().
> > > 
> > > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> > > ---
> > >  mm/page-writeback.c | 44 +++++++++++++++++++++++---------------------
> > >  1 file changed, 23 insertions(+), 21 deletions(-)
> > > 
> > > diff --git a/mm/page-writeback.c b/mm/page-writeback.c
> > > index 032a7bf8d259..087165357a5a 100644
> > > --- a/mm/page-writeback.c
> > > +++ b/mm/page-writeback.c
> > > @@ -2285,15 +2285,15 @@ int write_cache_pages(struct address_space *mapping,
> > >  	int ret = 0;
> > >  	int done = 0;
> > >  	int error;
> > > -	struct pagevec pvec;
> > > -	int nr_pages;
> > > +	struct folio_batch fbatch;
> > > +	int nr_folios;
> > >  	pgoff_t index;
> > >  	pgoff_t end;		/* Inclusive */
> > >  	pgoff_t done_index;
> > >  	int range_whole = 0;
> > >  	xa_mark_t tag;
> > >  
> > > -	pagevec_init(&pvec);
> > > +	folio_batch_init(&fbatch);
> > >  	if (wbc->range_cyclic) {
> > >  		index = mapping->writeback_index; /* prev offset */
> > >  		end = -1;
> > > @@ -2313,17 +2313,18 @@ int write_cache_pages(struct address_space *mapping,
> > >  	while (!done && (index <= end)) {
> > >  		int i;
> > >  
> > > -		nr_pages = pagevec_lookup_range_tag(&pvec, mapping, &index, end,
> > > -				tag);
> > > -		if (nr_pages == 0)
> > > +		nr_folios = filemap_get_folios_tag(mapping, &index, end,
> > > +				tag, &fbatch);
> > 
> > This can find and return dirty multi-page folios if the filesystem
> > enables them in the mapping at instantiation time, right?
> 
> Yup, it will.
> 
> > > +
> > > +		if (nr_folios == 0)
> > >  			break;
> > >  
> > > -		for (i = 0; i < nr_pages; i++) {
> > > -			struct page *page = pvec.pages[i];
> > > +		for (i = 0; i < nr_folios; i++) {
> > > +			struct folio *folio = fbatch.folios[i];
> > >  
> > > -			done_index = page->index;
> > > +			done_index = folio->index;
> > >  
> > > -			lock_page(page);
> > > +			folio_lock(folio);
> > >  
> > >  			/*
> > >  			 * Page truncated or invalidated. We can freely skip it
> > > @@ -2333,30 +2334,30 @@ int write_cache_pages(struct address_space *mapping,
> > >  			 * even if there is now a new, dirty page at the same
> > >  			 * pagecache address.
> > >  			 */
> > > -			if (unlikely(page->mapping != mapping)) {
> > > +			if (unlikely(folio->mapping != mapping)) {
> > >  continue_unlock:
> > > -				unlock_page(page);
> > > +				folio_unlock(folio);
> > >  				continue;
> > >  			}
> > >  
> > > -			if (!PageDirty(page)) {
> > > +			if (!folio_test_dirty(folio)) {
> > >  				/* someone wrote it for us */
> > >  				goto continue_unlock;
> > >  			}
> > >  
> > > -			if (PageWriteback(page)) {
> > > +			if (folio_test_writeback(folio)) {
> > >  				if (wbc->sync_mode != WB_SYNC_NONE)
> > > -					wait_on_page_writeback(page);
> > > +					folio_wait_writeback(folio);
> > >  				else
> > >  					goto continue_unlock;
> > >  			}
> > >  
> > > -			BUG_ON(PageWriteback(page));
> > > -			if (!clear_page_dirty_for_io(page))
> > > +			BUG_ON(folio_test_writeback(folio));
> > > +			if (!folio_clear_dirty_for_io(folio))
> > >  				goto continue_unlock;
> > >  
> > >  			trace_wbc_writepage(wbc, inode_to_bdi(mapping->host));
> > > -			error = (*writepage)(page, wbc, data);
> > > +			error = writepage(&folio->page, wbc, data);
> > 
> > Yet, IIUC, this treats all folios as if they are single page folios.
> > i.e. it passes the head page of a multi-page folio to a callback
> > that will treat it as a single PAGE_SIZE page, because that's all
> > the writepage callbacks are currently expected to be passed...
> > 
> > So won't this break writeback of dirty multipage folios?
> 
> Yes, it appears it would. But it wouldn't because its already 'broken'.

It is? Then why isn't XFS broken on existing kernels? Oh, we don't
know because it hasn't been tested?

Seriously - if this really is broken, and this patchset further
propagating the brokeness, then somebody needs to explain to me why
this is not corrupting data in XFS.

I get it that page/folios are in transition, but passing a
multi-page folio page to an interface that expects a PAGE_SIZE
struct page is a pretty nasty landmine, regardless of how broken the
higher level iteration code already might be.

At minimum, it needs to be documented, though I'd much prefer that
we explicitly duplicate write_cache_pages() as write_cache_folios()
with a callback that takes a folio and change the code to be fully
multi-page folio safe. Then filesystems that support folios (and
large folios) natively can be passed folios without going through
this crappy "folio->page, page->folio" dance because the writepage
APIs are unaware of multi-page folio constructs.

Then you can convert the individual filesystems using
write_cache_pages() to call write_cache_folios() one at a time,
updating the filesystem callback to do the conversion from folio to
struct page and checking that it an order-0 page that it has been
handed....

> The current find_get_pages_range_tag() actually has the exact same
> issue. The current code to fill up the pages array is:
> 
> 		pages[ret] = &folio->page;
> 		if (++ret == nr_pages) {
> 			*index = folio->index + folio_nr_pages(folio);
> 			goto out;

"It's already broken so we can make it more broken" isn't an
acceptible answer....

> Its not great to leave it 'broken' but its something that isn't - or at
> least shouldn't be - creating any problems at present. And I believe Matthew
> has plans to address them at some point before they actually become problems?

You are modifying the interfaces and doing folio conversions that
expose and propagate the brokenness. The brokeness needs to be
either avoided or fixed and not propagated further. Doing the above
write_cache_folios() conversion avoids the propagating the
brokenness, adds runtime detection of brokenness, and provides the
right interface for writeback iteration of folios.

Fixing the generic writeback iterator properly is not much extra
work, and it sets the model for filesytsems that have copy-pasted
write_cache_pages() and then hacked it around for their own purposes
(e.g. ext4, btrfs) to follow.

-Dave.
-- 
Dave Chinner
david@fromorbit.com

