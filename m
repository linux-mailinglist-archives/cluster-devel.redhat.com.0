Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C87F8ED48
	for <lists+cluster-devel@lfdr.de>; Thu, 15 Aug 2019 15:49:29 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EE83B5946B;
	Thu, 15 Aug 2019 13:49:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D888429C5;
	Thu, 15 Aug 2019 13:49:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0289118005A0;
	Thu, 15 Aug 2019 13:49:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7FDnOg3006033 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 15 Aug 2019 09:49:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EDEF2600CD; Thu, 15 Aug 2019 13:49:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fogou.chygwyn.com (unknown [10.33.36.96])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E58583870;
	Thu, 15 Aug 2019 13:49:21 +0000 (UTC)
To: Bob Peterson <rpeterso@redhat.com>,
	cluster-devel <cluster-devel@redhat.com>
References: <20190815132722.1522-1-rpeterso@redhat.com>
	<20190815132722.1522-3-rpeterso@redhat.com>
	<1147324513.8687737.1565876486114.JavaMail.zimbra@redhat.com>
From: Steven Whitehouse <swhiteho@redhat.com>
Message-ID: <3aced31a-da72-4ebd-3a4d-1b39921902f9@redhat.com>
Date: Thu, 15 Aug 2019 14:49:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1147324513.8687737.1565876486114.JavaMail.zimbra@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [GFS2 PATCH 2/2] gfs2: Use async glocks for
 rename
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Thu, 15 Aug 2019 13:49:28 +0000 (UTC)

Hi,

On 15/08/2019 14:41, Bob Peterson wrote:
> I just noticed the parameter comments for gfs2_glock_async_wait
> are wrong, and I've fixed them in a newer version. I can post
> the new version after I get people's initial reactions.
>
> Bob

Overall this looks like a much better approach. We know that this 
doesn't happen very often, so the path which involves the timeout should 
be very rarely taken. The problem is how to select a suitable timeout... 
is 2 secs enough? Can we land up with a DoS in certain situations? 
Hopefully not, but we should take care.

The shared wait queue might also be an issue in terms of contention, so 
it might be worth looking at how to avoid that. Generally though, this 
is looking very promising I think,

Steve.


> ----- Original Message -----
>> Because s_vfs_rename_mutex is not cluster-wide, multiple nodes can
>> reverse the roles of which directories are "old" and which are "new"
>> for the purposes of rename. This can cause deadlocks where two nodes
>> can lock old-then-new but since their roles are reversed, they wait
>> for each other.
>>
>> This patch fixes the problem by acquiring all gfs2_rename's inode
>> glocks asychronously and waits for all glocks to be acquired.
>> That way all inodes are locked regardless of the order.
>>
>> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
>> ---
> (snip)
>> + * gfs2_glock_async_wait - wait on multiple asynchronous glock acquisitions
>> + * @gh: the glock holder
> (snip)
>> +int gfs2_glock_async_wait(unsigned int num_gh, struct gfs2_holder *ghs)
>

