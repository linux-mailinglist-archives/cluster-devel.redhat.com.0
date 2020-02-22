Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 52759168ADB
	for <lists+cluster-devel@lfdr.de>; Sat, 22 Feb 2020 01:15:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582330551;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Xu1W/y2f9OTxnj+6T8DBBjck/f2ICJjqDeKYJhM73bw=;
	b=OwZIWI3BU5En9rpSBY0vG235fh0r0mN8AUEcoSrPKuROZNqsPlr2n8hPvd6SbrqDhUh9Z7
	bvxBpWkitCr99N4MhNX1tM5VObwQIxDZ/m2qeV3zgHbVfpPO/PiZQrfke3KALtBsvBCRTQ
	oWO5/Te867QrVgk/rpd5N6jOPsMKh4I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-rkZhgq9iMAWjX9YUuUl3fA-1; Fri, 21 Feb 2020 19:15:49 -0500
X-MC-Unique: rkZhgq9iMAWjX9YUuUl3fA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D09DFDB61;
	Sat, 22 Feb 2020 00:15:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 34231790CF;
	Sat, 22 Feb 2020 00:15:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2CDF418089C8;
	Sat, 22 Feb 2020 00:15:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01M0FYEY002189 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 21 Feb 2020 19:15:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 63B8E2063FE6; Sat, 22 Feb 2020 00:15:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E7592063FE5
	for <cluster-devel@redhat.com>; Sat, 22 Feb 2020 00:15:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A11585A304
	for <cluster-devel@redhat.com>; Sat, 22 Feb 2020 00:15:31 +0000 (UTC)
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
	[216.228.121.64]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-284-dI5O05GSP7ilAqsgba3poQ-1; Fri, 21 Feb 2020 19:15:29 -0500
X-MC-Unique: dI5O05GSP7ilAqsgba3poQ-1
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
	hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
	id <B5e50727e0001>; Fri, 21 Feb 2020 16:14:54 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
	by hqpgpgate101.nvidia.com (PGP Universal service);
	Fri, 21 Feb 2020 16:15:28 -0800
X-PGP-Universal: processed;
	by hqpgpgate101.nvidia.com on Fri, 21 Feb 2020 16:15:28 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
	(172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Sat, 22 Feb 2020 00:15:28 +0000
To: Matthew Wilcox <willy@infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
	<20200219210103.32400-2-willy@infradead.org>
	<e065679e-222f-7323-9782-0c4471bb9233@nvidia.com>
	<20200221214853.GF24185@bombadil.infradead.org>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <69fa8779-3433-9d35-a1f4-f115dc86c6d8@nvidia.com>
Date: Fri, 21 Feb 2020 16:15:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200221214853.GF24185@bombadil.infradead.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
	HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v7 01/24] mm: Move readahead prototypes
	from mm.h
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 2/21/20 1:48 PM, Matthew Wilcox wrote:
> On Thu, Feb 20, 2020 at 06:43:31PM -0800, John Hubbard wrote:
>> Yes. But I think these files also need a similar change:
>>
>>     fs/btrfs/disk-io.c
> 
> That gets pagemap.h through ctree.h, so I think it's fine.  It's
> already using mapping_set_gfp_mask(), so it already depends on pagemap.h.
> 
>>     fs/nfs/super.c
> 
> That gets it through linux/nfs_fs.h.
> 
> I was reluctant to not add it to blk-core.c because it doesn't seem
> necessarily intuitive that the block device core would include pagemap.h.
> 
> That said, blkdev.h does include pagemap.h, so maybe I don't need to
> include it here.

OK. Looks good (either through blkdev.h or as-is), so:

    Reviewed-by: John Hubbard <jhubbard@nvidia.com>


> 
>> ...because they also use VM_READAHEAD_PAGES, and do not directly include
>> pagemap.h yet.
> 
>>> +#define VM_READAHEAD_PAGES	(SZ_128K / PAGE_SIZE)
>>> +
>>> +void page_cache_sync_readahead(struct address_space *, struct file_ra_state *,
>>> +		struct file *, pgoff_t index, unsigned long req_count);
>>
>> Yes, "struct address_space *mapping" is weird, but I don't know if it's
>> "misleading", given that it's actually one of the things you have to learn
>> right from the beginning, with linux-mm, right? Or is that about to change?
>>
>> I'm not asking to restore this to "struct address_space *mapping", but I thought
>> it's worth mentioning out loud, especially if you or others are planning on
>> changing those names or something. Just curious.
> 
> No plans (on my part) to change the name, although I have heard people
> grumbling that there's very little need for it to be a separate struct
> from inode, except for the benefit of coda, which is not exactly a
> filesystem with a lot of users ...
> 
> Anyway, no plans to change it.  If there were something _special_ about
> it like a theoretical:
> 
> void mapping_dedup(struct address_space *canonical,
> 		struct address_space *victim);
> 
> then that's useful information and shouldn't be deleted.  But I don't
> think the word 'mapping' there conveys anything useful (other than the
> convention is to call a 'struct address_space' a mapping, which you'll
> see soon enough once you look at any of the .c files).
> 

OK, that's consistent and makes sense.


thanks,
-- 
John Hubbard
NVIDIA

