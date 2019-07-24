Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B995B72CB2
	for <lists+cluster-devel@lfdr.de>; Wed, 24 Jul 2019 12:55:13 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2C77B2EED1A;
	Wed, 24 Jul 2019 10:55:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DA1E1001B04;
	Wed, 24 Jul 2019 10:55:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8B18241F53;
	Wed, 24 Jul 2019 10:55:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6OAt77j020860 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 24 Jul 2019 06:55:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 05164600C7; Wed, 24 Jul 2019 10:55:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fogou.chygwyn.com (unknown [10.33.36.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4834B601B7;
	Wed, 24 Jul 2019 10:55:03 +0000 (UTC)
To: Christoph Hellwig <hch@infradead.org>
References: <20190724084303.1236-1-baijiaju1990@gmail.com>
	<2986ed32-9aad-8e9c-1373-1402b34e65ac@redhat.com>
	<20190724100207.GA7916@infradead.org>
	<380199a4-1864-d61a-1b9c-f21d4f3f8a32@redhat.com>
	<20190724102718.GA30071@infradead.org>
From: Steven Whitehouse <swhiteho@redhat.com>
Message-ID: <42a3501a-ff02-2b3d-850f-4ee1c014d815@redhat.com>
Date: Wed, 24 Jul 2019 11:55:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190724102718.GA30071@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH] fs: gfs2: Fix a null-pointer
 dereference in gfs2_alloc_inode()
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Wed, 24 Jul 2019 10:55:12 +0000 (UTC)

Hi,

On 24/07/2019 11:27, Christoph Hellwig wrote:
> On Wed, Jul 24, 2019 at 11:22:46AM +0100, Steven Whitehouse wrote:
>> and it would have the same effect, so far as I can tell. I don't mind
>> changing it, if that is perhaps a clearer way to write the same thing,
>> rather than &ip->i_inode;
> The cleanest thing is to not rely on any of that magic and write it
> like all other file systems:
>
> 	ip = kmem_cache_alloc
> 	if (!ip)
> 		retuturn NULL;
>
> 	...
>
> 	return &ip->i_inode;
>
> Absolutely not point in trying to be clever here.

Yes, that works too,

Steve.


