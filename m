Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id BBA9D15D6A4
	for <lists+cluster-devel@lfdr.de>; Fri, 14 Feb 2020 12:37:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581680273;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5Ey5GwVWyIBJt/+/393UO7Nx1GdweRJOgsCbjE7KjIY=;
	b=F6+4aYGsdtKJMOFXk9oOwBgZlAUlMEK2Ka5lVrG6sYrecajGhhh0QzfR9nlem7w6uJ3Bb6
	ALT0kM29OW+pIu2jviCsvM1KaRwuVvDRsYJEYaP+Pf5PSQ8Yp9P2K7e6UYzXCa+PJOrmnb
	o7+uqR9hn12sSj4iVOaj1U0oUyhYl3c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-bNH5BY4FNn23KC6mHe3PnQ-1; Fri, 14 Feb 2020 06:37:51 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDA958010FB;
	Fri, 14 Feb 2020 11:37:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C6FAE60BF4;
	Fri, 14 Feb 2020 11:37:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A10ED8B2C5;
	Fri, 14 Feb 2020 11:37:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01E4XUGJ025012 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 13 Feb 2020 23:33:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1CACB2026D67; Fri, 14 Feb 2020 04:33:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 15C682028CD2
	for <cluster-devel@redhat.com>; Fri, 14 Feb 2020 04:33:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 700AC803B4A
	for <cluster-devel@redhat.com>; Fri, 14 Feb 2020 04:33:27 +0000 (UTC)
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
	[216.228.121.64]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-167-h2h4QvOEPriW69nEpQxNwg-1; Thu, 13 Feb 2020 23:33:25 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
	hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
	id <B5e4622f70001>; Thu, 13 Feb 2020 20:32:55 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
	by hqpgpgate102.nvidia.com (PGP Universal service);
	Thu, 13 Feb 2020 20:33:24 -0800
X-PGP-Universal: processed;
	by hqpgpgate102.nvidia.com on Thu, 13 Feb 2020 20:33:24 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
	(172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Fri, 14 Feb 2020 04:33:23 +0000
To: Matthew Wilcox <willy@infradead.org>
References: <20200211010348.6872-1-willy@infradead.org>
	<20200211010348.6872-2-willy@infradead.org>
	<e0f459af-bb5d-58b9-78be-5adf687477c0@nvidia.com>
	<20200214042137.GX7778@bombadil.infradead.org>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <ab9d0e43-3fb4-cb14-4974-ad4a8ab57a83@nvidia.com>
Date: Thu, 13 Feb 2020 20:33:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200214042137.GX7778@bombadil.infradead.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
	HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-MC-Unique: h2h4QvOEPriW69nEpQxNwg-1
X-MC-Unique: bNH5BY4FNn23KC6mHe3PnQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Fri, 14 Feb 2020 06:37:40 -0500
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v5 01/13] mm: Fix the return type of
 __do_page_cache_readahead
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 2/13/20 8:21 PM, Matthew Wilcox wrote:
> On Thu, Feb 13, 2020 at 07:19:53PM -0800, John Hubbard wrote:
>> On 2/10/20 5:03 PM, Matthew Wilcox wrote:
>>> @@ -161,7 +161,7 @@ unsigned int __do_page_cache_readahead(struct address_space *mapping,
>>>  	unsigned long end_index;	/* The last page we want to read */
>>>  	LIST_HEAD(page_pool);
>>>  	int page_idx;
>>
>>
>> What about page_idx, too? It should also have the same data type as nr_pages, as long as
>> we're trying to be consistent on this point.
>>
>> Just want to ensure we're ready to handle those 2^33+ page readaheads... :)
> 
> Nah, this is just a type used internally to the function.  Getting the
> API right for the callers is the important part.
> 

Agreed that the real point of this is to match up the API, but why not finish the job
by going all the way through? It's certainly not something we need to lose sleep over,
but it does seem like you don't want to have code like this:

        for (page_idx = 0; page_idx < nr_to_read; page_idx++) {

...with the ability, technically, to overflow page_idx due to it being an int,
while nr_to_read is an unsigned long. (And the new sanitizers and checkers are
apt to complain about it, btw.)

(Apologies if there is some kernel coding idiom that I still haven't learned, about this 
sort of thing.)

thanks,
-- 
John Hubbard
NVIDIA

