Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 939C16034E6
	for <lists+cluster-devel@lfdr.de>; Tue, 18 Oct 2022 23:28:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666128492;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=9c0MfmDDMiDyFxs6faLvTsiA3nu/af5/TaXNlBhXaNQ=;
	b=PBab3fus3SQgMjtLyZg3gb6YUsX2iiltwdI5L+qm+E/58/5E4NnAlz+poAlk8H6d94A5zg
	BC1v07dFg4e5sW1fbhaqfboo4wYaTtbygoF+PC6/bwXvmM8PjuRVOiywe8/3kqLfa95tQL
	lAUncXMUZLEJmKXZAM6/R/NshG/pVm8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-p7aieEzOPLC-lf0qdM7Q5Q-1; Tue, 18 Oct 2022 17:28:10 -0400
X-MC-Unique: p7aieEzOPLC-lf0qdM7Q5Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A421C29AA3BA;
	Tue, 18 Oct 2022 21:28:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E14654030C0;
	Tue, 18 Oct 2022 21:28:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AEC411946597;
	Tue, 18 Oct 2022 21:28:07 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C1469194658F for <cluster-devel@listman.corp.redhat.com>;
 Tue, 18 Oct 2022 21:28:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 68D6F10197; Tue, 18 Oct 2022 21:28:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 60E55FD48
 for <cluster-devel@redhat.com>; Tue, 18 Oct 2022 21:28:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 347063C0D188
 for <cluster-devel@redhat.com>; Tue, 18 Oct 2022 21:28:05 +0000 (UTC)
Received: from mail104.syd.optusnet.com.au (mail104.syd.optusnet.com.au
 [211.29.132.246]) by relay.mimecast.com with ESMTP id
 us-mta-589-QCCvwtbwOei-9bjf9bD09w-1; Tue, 18 Oct 2022 17:28:03 -0400
X-MC-Unique: QCCvwtbwOei-9bjf9bD09w-1
Received: from dread.disaster.area (pa49-181-106-210.pa.nsw.optusnet.com.au
 [49.181.106.210])
 by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id 967678AE0CC;
 Wed, 19 Oct 2022 08:01:53 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1oktii-003bE7-4J; Wed, 19 Oct 2022 08:01:52 +1100
Date: Wed, 19 Oct 2022 08:01:52 +1100
From: Dave Chinner <david@fromorbit.com>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Message-ID: <20221018210152.GH2703033@dread.disaster.area>
References: <20220901220138.182896-1-vishal.moola@gmail.com>
 <20220901220138.182896-5-vishal.moola@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20220901220138.182896-5-vishal.moola@gmail.com>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.4 cv=e9dl9Yl/ c=1 sm=1 tr=0 ts=634f1443
 a=j6JUzzrSC7wlfFge/rmVbg==:117 a=j6JUzzrSC7wlfFge/rmVbg==:17
 a=kj9zAlcOel0A:10 a=Qawa6l4ZSaYA:10 a=pGLkceISAAAA:8 a=7-415B0cAAAA:8
 a=K-JhRxFi-CGouRt9WdAA:9 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 01, 2022 at 03:01:19PM -0700, Vishal Moola (Oracle) wrote:
> Converted function to use folios throughout. This is in preparation for
> the removal of find_get_pages_range_tag().
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>  mm/page-writeback.c | 44 +++++++++++++++++++++++---------------------
>  1 file changed, 23 insertions(+), 21 deletions(-)
> 
> diff --git a/mm/page-writeback.c b/mm/page-writeback.c
> index 032a7bf8d259..087165357a5a 100644
> --- a/mm/page-writeback.c
> +++ b/mm/page-writeback.c
> @@ -2285,15 +2285,15 @@ int write_cache_pages(struct address_space *mapping,
>  	int ret = 0;
>  	int done = 0;
>  	int error;
> -	struct pagevec pvec;
> -	int nr_pages;
> +	struct folio_batch fbatch;
> +	int nr_folios;
>  	pgoff_t index;
>  	pgoff_t end;		/* Inclusive */
>  	pgoff_t done_index;
>  	int range_whole = 0;
>  	xa_mark_t tag;
>  
> -	pagevec_init(&pvec);
> +	folio_batch_init(&fbatch);
>  	if (wbc->range_cyclic) {
>  		index = mapping->writeback_index; /* prev offset */
>  		end = -1;
> @@ -2313,17 +2313,18 @@ int write_cache_pages(struct address_space *mapping,
>  	while (!done && (index <= end)) {
>  		int i;
>  
> -		nr_pages = pagevec_lookup_range_tag(&pvec, mapping, &index, end,
> -				tag);
> -		if (nr_pages == 0)
> +		nr_folios = filemap_get_folios_tag(mapping, &index, end,
> +				tag, &fbatch);

This can find and return dirty multi-page folios if the filesystem
enables them in the mapping at instantiation time, right?

> +
> +		if (nr_folios == 0)
>  			break;
>  
> -		for (i = 0; i < nr_pages; i++) {
> -			struct page *page = pvec.pages[i];
> +		for (i = 0; i < nr_folios; i++) {
> +			struct folio *folio = fbatch.folios[i];
>  
> -			done_index = page->index;
> +			done_index = folio->index;
>  
> -			lock_page(page);
> +			folio_lock(folio);
>  
>  			/*
>  			 * Page truncated or invalidated. We can freely skip it
> @@ -2333,30 +2334,30 @@ int write_cache_pages(struct address_space *mapping,
>  			 * even if there is now a new, dirty page at the same
>  			 * pagecache address.
>  			 */
> -			if (unlikely(page->mapping != mapping)) {
> +			if (unlikely(folio->mapping != mapping)) {
>  continue_unlock:
> -				unlock_page(page);
> +				folio_unlock(folio);
>  				continue;
>  			}
>  
> -			if (!PageDirty(page)) {
> +			if (!folio_test_dirty(folio)) {
>  				/* someone wrote it for us */
>  				goto continue_unlock;
>  			}
>  
> -			if (PageWriteback(page)) {
> +			if (folio_test_writeback(folio)) {
>  				if (wbc->sync_mode != WB_SYNC_NONE)
> -					wait_on_page_writeback(page);
> +					folio_wait_writeback(folio);
>  				else
>  					goto continue_unlock;
>  			}
>  
> -			BUG_ON(PageWriteback(page));
> -			if (!clear_page_dirty_for_io(page))
> +			BUG_ON(folio_test_writeback(folio));
> +			if (!folio_clear_dirty_for_io(folio))
>  				goto continue_unlock;
>  
>  			trace_wbc_writepage(wbc, inode_to_bdi(mapping->host));
> -			error = (*writepage)(page, wbc, data);
> +			error = writepage(&folio->page, wbc, data);

Yet, IIUC, this treats all folios as if they are single page folios.
i.e. it passes the head page of a multi-page folio to a callback
that will treat it as a single PAGE_SIZE page, because that's all
the writepage callbacks are currently expected to be passed...

So won't this break writeback of dirty multipage folios?

-Dave.
-- 
Dave Chinner
david@fromorbit.com

