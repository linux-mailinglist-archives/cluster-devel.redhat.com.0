Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E55618B74
	for <lists+cluster-devel@lfdr.de>; Thu,  3 Nov 2022 23:28:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667514498;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=04TfsshirPxCNoji6KR6vQQ5/+Nqz1IUHQcJvZJx5NI=;
	b=UKa5KWIaZnulzEgdFIRZ+XkCriiJtHY/8FLci0V3IKEoYWjXAdUfxoo3j1DlzXmd5EIgtG
	nJz9WDDrp8ZqiETpjVHeMMGjft3puopaqBbLuMZ8RolkVhiP5Nc+NeT+85aMrBIaJrRZv4
	VmxTe1A9elqZ6N94+Aeo8C1jDMhatao=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-QMB-2Tt5OvOsdjofbE1lxA-1; Thu, 03 Nov 2022 18:28:15 -0400
X-MC-Unique: QMB-2Tt5OvOsdjofbE1lxA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A4AC3817A66;
	Thu,  3 Nov 2022 22:28:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D9F161121325;
	Thu,  3 Nov 2022 22:28:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A5E9419465B2;
	Thu,  3 Nov 2022 22:28:13 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B4BAC1946594 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  3 Nov 2022 22:28:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A38781121331; Thu,  3 Nov 2022 22:28:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B6541121325
 for <cluster-devel@redhat.com>; Thu,  3 Nov 2022 22:28:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DB49185A78B
 for <cluster-devel@redhat.com>; Thu,  3 Nov 2022 22:28:11 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-622-TVMm5j7aPjOzxabrStCbEQ-1; Thu, 03 Nov 2022 18:28:09 -0400
X-MC-Unique: TVMm5j7aPjOzxabrStCbEQ-1
Received: by mail-pf1-f177.google.com with SMTP id b29so2904536pfp.13
 for <cluster-devel@redhat.com>; Thu, 03 Nov 2022 15:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=04TfsshirPxCNoji6KR6vQQ5/+Nqz1IUHQcJvZJx5NI=;
 b=Vgy7Lvw3bm9jadeEgTqnuFw74Tz21PAGwk/GKh2f7PJbmm+V4ZFj3mXGt4sSLMAZvD
 uhr1b6IiqxUNgBY5Sc0udShgsR5IqB41phgYyhun9R+u+qN91NAFDJOpQpNhcj4/wIWV
 4eIWy9p5cz44bsL8WNMIpQ3OZVlO4pHk3cR6MYgoQjHp63vDIH7xeQc9AaFxSal/wVr6
 Z6ABE+2Lp7CyuafSewXBdyHONpA6Tb50QfJIfgMLLRcxBRMg/w61I3R76c/IWBZzXDiY
 gYtrR8a/UWShWR2bc7qs+OvSNHXgmYl6ZHY2+mm4yF6CQX5xjPleueTsraFcLTGJiUH8
 xJSw==
X-Gm-Message-State: ACrzQf3pI0g2MB0S1jKiPdRelP77DRQALBDUVEJLNHJFZ980+1EfO2Lb
 L5w6Gpcv46BhTOaWYN0VnQ8=
X-Google-Smtp-Source: AMsMyM7hE1bfSjSUUen+m8TVmotDYU/np98yLJV1t++FadjOyzDId3GOm6PXy0DRJG1AjfsRAwszyw==
X-Received: by 2002:a05:6a00:1a4d:b0:563:a7c4:f521 with SMTP id
 h13-20020a056a001a4d00b00563a7c4f521mr32742358pfv.61.1667514488876; 
 Thu, 03 Nov 2022 15:28:08 -0700 (PDT)
Received: from fedora ([2601:644:8002:1c20::8080])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a170902da9000b00186b86ed450sm1169376plx.156.2022.11.03.15.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 15:28:08 -0700 (PDT)
Date: Thu, 3 Nov 2022 15:28:05 -0700
From: Vishal Moola <vishal.moola@gmail.com>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <Y2RAdUtJrOJmYU4L@fedora>
References: <20220901220138.182896-1-vishal.moola@gmail.com>
 <20220901220138.182896-5-vishal.moola@gmail.com>
 <20221018210152.GH2703033@dread.disaster.area>
MIME-Version: 1.0
In-Reply-To: <20221018210152.GH2703033@dread.disaster.area>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 19, 2022 at 08:01:52AM +1100, Dave Chinner wrote:
> On Thu, Sep 01, 2022 at 03:01:19PM -0700, Vishal Moola (Oracle) wrote:
> > Converted function to use folios throughout. This is in preparation for
> > the removal of find_get_pages_range_tag().
> > 
> > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> > ---
> >  mm/page-writeback.c | 44 +++++++++++++++++++++++---------------------
> >  1 file changed, 23 insertions(+), 21 deletions(-)
> > 
> > diff --git a/mm/page-writeback.c b/mm/page-writeback.c
> > index 032a7bf8d259..087165357a5a 100644
> > --- a/mm/page-writeback.c
> > +++ b/mm/page-writeback.c
> > @@ -2285,15 +2285,15 @@ int write_cache_pages(struct address_space *mapping,
> >  	int ret = 0;
> >  	int done = 0;
> >  	int error;
> > -	struct pagevec pvec;
> > -	int nr_pages;
> > +	struct folio_batch fbatch;
> > +	int nr_folios;
> >  	pgoff_t index;
> >  	pgoff_t end;		/* Inclusive */
> >  	pgoff_t done_index;
> >  	int range_whole = 0;
> >  	xa_mark_t tag;
> >  
> > -	pagevec_init(&pvec);
> > +	folio_batch_init(&fbatch);
> >  	if (wbc->range_cyclic) {
> >  		index = mapping->writeback_index; /* prev offset */
> >  		end = -1;
> > @@ -2313,17 +2313,18 @@ int write_cache_pages(struct address_space *mapping,
> >  	while (!done && (index <= end)) {
> >  		int i;
> >  
> > -		nr_pages = pagevec_lookup_range_tag(&pvec, mapping, &index, end,
> > -				tag);
> > -		if (nr_pages == 0)
> > +		nr_folios = filemap_get_folios_tag(mapping, &index, end,
> > +				tag, &fbatch);
> 
> This can find and return dirty multi-page folios if the filesystem
> enables them in the mapping at instantiation time, right?

Yup, it will.

> > +
> > +		if (nr_folios == 0)
> >  			break;
> >  
> > -		for (i = 0; i < nr_pages; i++) {
> > -			struct page *page = pvec.pages[i];
> > +		for (i = 0; i < nr_folios; i++) {
> > +			struct folio *folio = fbatch.folios[i];
> >  
> > -			done_index = page->index;
> > +			done_index = folio->index;
> >  
> > -			lock_page(page);
> > +			folio_lock(folio);
> >  
> >  			/*
> >  			 * Page truncated or invalidated. We can freely skip it
> > @@ -2333,30 +2334,30 @@ int write_cache_pages(struct address_space *mapping,
> >  			 * even if there is now a new, dirty page at the same
> >  			 * pagecache address.
> >  			 */
> > -			if (unlikely(page->mapping != mapping)) {
> > +			if (unlikely(folio->mapping != mapping)) {
> >  continue_unlock:
> > -				unlock_page(page);
> > +				folio_unlock(folio);
> >  				continue;
> >  			}
> >  
> > -			if (!PageDirty(page)) {
> > +			if (!folio_test_dirty(folio)) {
> >  				/* someone wrote it for us */
> >  				goto continue_unlock;
> >  			}
> >  
> > -			if (PageWriteback(page)) {
> > +			if (folio_test_writeback(folio)) {
> >  				if (wbc->sync_mode != WB_SYNC_NONE)
> > -					wait_on_page_writeback(page);
> > +					folio_wait_writeback(folio);
> >  				else
> >  					goto continue_unlock;
> >  			}
> >  
> > -			BUG_ON(PageWriteback(page));
> > -			if (!clear_page_dirty_for_io(page))
> > +			BUG_ON(folio_test_writeback(folio));
> > +			if (!folio_clear_dirty_for_io(folio))
> >  				goto continue_unlock;
> >  
> >  			trace_wbc_writepage(wbc, inode_to_bdi(mapping->host));
> > -			error = (*writepage)(page, wbc, data);
> > +			error = writepage(&folio->page, wbc, data);
> 
> Yet, IIUC, this treats all folios as if they are single page folios.
> i.e. it passes the head page of a multi-page folio to a callback
> that will treat it as a single PAGE_SIZE page, because that's all
> the writepage callbacks are currently expected to be passed...
> 
> So won't this break writeback of dirty multipage folios?

Yes, it appears it would. But it wouldn't because its already 'broken'.

The current find_get_pages_range_tag() actually has the exact same
issue. The current code to fill up the pages array is:

		pages[ret] = &folio->page;
		if (++ret == nr_pages) {
			*index = folio->index + folio_nr_pages(folio);
			goto out;

which behaves the same way as the issue you pointed out (both break
large folios). When I spoke to Matthew about this earlier, we decided
to go ahead with replacing the function and leave it up to the callers
to fix/handle large folios when the filesystem gets to it.

Its not great to leave it 'broken' but its something that isn't - or at
least shouldn't be - creating any problems at present. And I believe Matthew
has plans to address them at some point before they actually become problems?

