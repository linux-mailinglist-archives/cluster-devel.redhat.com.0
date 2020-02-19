Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 655AE163A78
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Feb 2020 03:47:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582080432;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=V/HjUqswaF1dKPtA+ar56SFisPTsJ76O2QClKAvYPMw=;
	b=Jrq3jFAZWg7bWcUW/3Vi4lTLIM/ca04QmW7OdPqXGQ5c5r4V+hqwD3+54yKVEUEp5KPgtD
	/gQqjCj2SH/QvgAfc8ik4X2vdFAUwAL3WTGL74ffBgwsZdMhyuQ/Xposwu1Sr2iJDD8tlf
	e0IM7diOrVIsRqrryrf6z3cCRiPU4Os=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-gtegPzksOeaTz1YKp0oLfw-1; Tue, 18 Feb 2020 21:47:11 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CCD718AB2C3;
	Wed, 19 Feb 2020 02:47:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E1158B54A;
	Wed, 19 Feb 2020 02:47:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B9E4B35AF5;
	Wed, 19 Feb 2020 02:47:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01J2l4uN004210 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 21:47:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D45B1EC4D2; Wed, 19 Feb 2020 02:47:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CFD4CEC4C8
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 02:47:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 018A4801E6D
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 02:47:03 +0000 (UTC)
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
	[216.228.121.64]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-92-opFVFWEVNp-DuqS3cJGXcw-1; Tue, 18 Feb 2020 21:47:01 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
	hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
	id <B5e4ca1830002>; Tue, 18 Feb 2020 18:46:27 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
	by hqpgpgate101.nvidia.com (PGP Universal service);
	Tue, 18 Feb 2020 18:46:59 -0800
X-PGP-Universal: processed;
	by hqpgpgate101.nvidia.com on Tue, 18 Feb 2020 18:46:59 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
	(172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Wed, 19 Feb 2020 02:46:59 +0000
To: Matthew Wilcox <willy@infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-16-willy@infradead.org>
	<1263603d-f446-c447-2eac-697d105fa76c@nvidia.com>
	<20200219022300.GJ24185@bombadil.infradead.org>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <f2d2346d-611c-ebdd-8430-ea4478e044d4@nvidia.com>
Date: Tue, 18 Feb 2020 18:46:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200219022300.GJ24185@bombadil.infradead.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
	HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-MC-Unique: opFVFWEVNp-DuqS3cJGXcw-1
X-MC-Unique: gtegPzksOeaTz1YKp0oLfw-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v6 09/19] mm: Add
	page_cache_readahead_limit
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 2/18/20 6:23 PM, Matthew Wilcox wrote:
> On Tue, Feb 18, 2020 at 05:32:31PM -0800, John Hubbard wrote:
>>> +			page_cache_readahead_limit(inode->i_mapping, NULL,
>>> +					index, LONG_MAX, num_ra_pages, 0);
>>
>>
>> LONG_MAX seems bold at first, but then again I can't think of anything smaller 
>> that makes any sense, and the previous code didn't have a limit either...OK.
> 
> Probably worth looking at Dave's review of this and what we've just
> negotiated on the other subthread ... LONG_MAX is gone.


Great. OK, I see where it's going there.

> 
>> I also wondered about the NULL file parameter, and wonder if we're stripping out
>> information that is needed for authentication, given that that's what the newly
>> written kerneldoc says the "file" arg is for. But it seems that if we're this 
>> deep in the fs code's read routines, file system authentication has long since 
>> been addressed.
> 
> The authentication is for network filesystems.  Local filesystems
> generally don't use the 'file' parameter, and since we're going to be
> calling back into the filesystem's own readahead routine, we know it's
> not needed.
> 
>> Any actually I don't yet (still working through the patches) see any authentication,
>> so maybe that parameter will turn out to be unnecessary.
>>
>> Anyway, It's nice to see this factored out into a single routine.
> 
> I'm kind of thinking about pushing the rac in the other direction too,
> so page_cache_readahead_unlimited(rac, nr_to_read, lookahead_size).
> 
>>> +/**
>>> + * page_cache_readahead_limit - Start readahead beyond a file's i_size.
>>
>>
>> Maybe: 
>>
>>     "Start readahead to a caller-specified end point" ?
>>
>> (It's only *potentially* beyond files's i_size.)
> 
> My current tree has:
>  * page_cache_readahead_exceed - Start unchecked readahead.


Sounds good.

> 
> 
>>> + * @mapping: File address space.
>>> + * @file: This instance of the open file; used for authentication.
>>> + * @offset: First page index to read.
>>> + * @end_index: The maximum page index to read.
>>> + * @nr_to_read: The number of pages to read.
>>
>>
>> How about:
>>
>>     "The number of pages to read, as long as end_index is not exceeded."
> 
> API change makes this irrelevant ;-)
> 
>>> + * @lookahead_size: Where to start the next readahead.
>>
>> Pre-existing, but...it's hard to understand how a size is "where to start".
>> Should we rename this arg?
> 
> It should probably be lookahead_count.
> 
>>> + *
>>> + * This function is for filesystems to call when they want to start
>>> + * readahead potentially beyond a file's stated i_size.  If you want
>>> + * to start readahead on a normal file, you probably want to call
>>> + * page_cache_async_readahead() or page_cache_sync_readahead() instead.
>>> + *
>>> + * Context: File is referenced by caller.  Mutexes may be held by caller.
>>> + * May sleep, but will not reenter filesystem to reclaim memory.
>>
>> In fact, can we say "must not reenter filesystem"? 
> 
> I think it depends which side of the API you're looking at which wording
> you prefer ;-)
> 
> 

Yes. We should try to write these so that it's clear which way we're looking:
in or out. 


thanks,
-- 
John Hubbard
NVIDIA

