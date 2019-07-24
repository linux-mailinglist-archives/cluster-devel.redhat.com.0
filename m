Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EB672C4A
	for <lists+cluster-devel@lfdr.de>; Wed, 24 Jul 2019 12:22:55 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B67E0307D871;
	Wed, 24 Jul 2019 10:22:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 212035D71C;
	Wed, 24 Jul 2019 10:22:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9D7A641F53;
	Wed, 24 Jul 2019 10:22:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6OAMoq4015801 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 24 Jul 2019 06:22:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 950B45D704; Wed, 24 Jul 2019 10:22:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fogou.chygwyn.com (unknown [10.33.36.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E969D5D71C;
	Wed, 24 Jul 2019 10:22:47 +0000 (UTC)
To: Christoph Hellwig <hch@infradead.org>
References: <20190724084303.1236-1-baijiaju1990@gmail.com>
	<2986ed32-9aad-8e9c-1373-1402b34e65ac@redhat.com>
	<20190724100207.GA7916@infradead.org>
From: Steven Whitehouse <swhiteho@redhat.com>
Message-ID: <380199a4-1864-d61a-1b9c-f21d4f3f8a32@redhat.com>
Date: Wed, 24 Jul 2019 11:22:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190724100207.GA7916@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Wed, 24 Jul 2019 10:22:54 +0000 (UTC)

Hi,

On 24/07/2019 11:02, Christoph Hellwig wrote:
> On Wed, Jul 24, 2019 at 09:48:38AM +0100, Steven Whitehouse wrote:
>> Hi,
>>
>> On 24/07/2019 09:43, Jia-Ju Bai wrote:
>>> In gfs2_alloc_inode(), when kmem_cache_alloc() on line 1724 returns
>>> NULL, ip is assigned to NULL. In this case, "return &ip->i_inode" will
>>> cause a null-pointer dereference.
>>>
>>> To fix this null-pointer dereference, NULL is returned when ip is NULL.
>>>
>>> This bug is found by a static analysis tool STCheck written by us.
>> The bug is in the tool I'm afraid. Since i_inode is the first element of ip,
>> there is no NULL dereference here. A pointer to ip->i_inode and a pointer to
>> ip are one and the same (bar the differing types) which is the reason that
>> we return &ip->i_inode rather than just ip,
> But that doesn't help if ip is NULL, as dereferencing a field in in
> still remains invalid behavior.
>
>
We are not dereferencing it though really, we are taking the address of 
the field... we could have written:

return (struct inode *)ip;

and it would have the same effect, so far as I can tell. I don't mind 
changing it, if that is perhaps a clearer way to write the same thing, 
rather than &ip->i_inode;

Steve.


