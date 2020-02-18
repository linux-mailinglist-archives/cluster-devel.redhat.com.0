Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id E87391636A6
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Feb 2020 00:00:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582066828;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IB7kCRmqWHOCgH5gvEJMi5Ucod9FJFELOexbDWiq5WM=;
	b=VQJEeDEloJYJdVeqAn2pNk4vX1M87gxDCOQUZUWfB39NP8XeiGplc0EFeBld94AP75vEB2
	dqM7sYwyZfa3XqHEURAYstE82Xo/hf4MbFD1iRGQ2BrGvM9zyosNFZogqizKwV2kUW7cQk
	Wi5kNVOEQInOyF/NcBL+C+4T3ntALoo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-hHb6lWqBP4CWZmp8g_3JWg-1; Tue, 18 Feb 2020 18:00:26 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74BF2107B0E1;
	Tue, 18 Feb 2020 23:00:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EEA3A26FD7;
	Tue, 18 Feb 2020 23:00:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 41D8B18089C8;
	Tue, 18 Feb 2020 23:00:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01IN0JTE024985 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 18:00:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8EDB62026D69; Tue, 18 Feb 2020 23:00:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 890BB2063FE5
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 23:00:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35644867B18
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 23:00:17 +0000 (UTC)
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
	[216.228.121.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-405-8_BE6q8NPEuCnCbhdszqaQ-1; Tue, 18 Feb 2020 18:00:14 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
	hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
	id <B5e4c6c6f0000>; Tue, 18 Feb 2020 14:59:59 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
	by hqpgpgate102.nvidia.com (PGP Universal service);
	Tue, 18 Feb 2020 15:00:13 -0800
X-PGP-Universal: processed;
	by hqpgpgate102.nvidia.com on Tue, 18 Feb 2020 15:00:13 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
	(172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Tue, 18 Feb 2020 23:00:13 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Matthew Wilcox <willy@infradead.org>, <linux-fsdevel@vger.kernel.org>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-6-willy@infradead.org>
	<7691abe7-d0e9-e091-b158-764fb624c2d7@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <cf7c9f73-ea15-24a5-2b97-388164a581ef@nvidia.com>
Date: Tue, 18 Feb 2020 15:00:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <7691abe7-d0e9-e091-b158-764fb624c2d7@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
	HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-MC-Unique: 8_BE6q8NPEuCnCbhdszqaQ-1
X-MC-Unique: hHb6lWqBP4CWZmp8g_3JWg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v6 04/16] mm: Tweak readahead loop
	slightly
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 2/18/20 2:57 PM, John Hubbard wrote:
> On 2/17/20 10:45 AM, Matthew Wilcox wrote:
>> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>>
>> Eliminate the page_offset variable which was just confusing;
>> record the start of each consecutive run of pages in the
> 
> 

Darn it, I incorrectly reviewed the N/16 patch, instead of the N/19, for 
this one. I thought I had deleted all those! Let me try again with the
correct patch, sorry!!

thanks,
-- 
John Hubbard
NVIDIA

> OK...presumably for the benefit of a following patch, since it is not 
> actually consumed in this patch.
> 
>> readahead_control, and move the 'kick off a fresh batch' code to
>> the end of the function for easier use in the next patch.
> 
> 
> That last bit was actually done in the previous patch, rather than this
> one, right?
> 
>>
>> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
>> ---
>>  mm/readahead.c | 31 +++++++++++++++++++------------
>>  1 file changed, 19 insertions(+), 12 deletions(-)
>>
>> diff --git a/mm/readahead.c b/mm/readahead.c
>> index 15329309231f..74791b96013f 100644
>> --- a/mm/readahead.c
>> +++ b/mm/readahead.c
>> @@ -154,7 +154,6 @@ void __do_page_cache_readahead(struct address_space *mapping,
>>  		unsigned long lookahead_size)
>>  {
>>  	struct inode *inode = mapping->host;
>> -	struct page *page;
>>  	unsigned long end_index;	/* The last page we want to read */
>>  	LIST_HEAD(page_pool);
>>  	int page_idx;
>> @@ -163,6 +162,7 @@ void __do_page_cache_readahead(struct address_space *mapping,
>>  	struct readahead_control rac = {
>>  		.mapping = mapping,
>>  		.file = filp,
>> +		._start = offset,
>>  		._nr_pages = 0,
>>  	};
>>  
>> @@ -175,32 +175,39 @@ void __do_page_cache_readahead(struct address_space *mapping,
>>  	 * Preallocate as many pages as we will need.
>>  	 */
>>  	for (page_idx = 0; page_idx < nr_to_read; page_idx++) {
>> -		pgoff_t page_offset = offset + page_idx;
> 
> 
> You know...this ends up incrementing offset each time through the
> loop, so yes, the behavior is the same as when using "offset + page_idx".
> However, now it's a little harder to see that.
> 
> IMHO the page_offset variable is not actually a bad thing, here. I'd rather
> keep it, all other things being equal (and I don't see any other benefits
> here: line count is the same, for example).
> 
> What do you think?
> 
> 
> thanks,
> 

