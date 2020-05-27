Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id A97911E3E97
	for <lists+cluster-devel@lfdr.de>; Wed, 27 May 2020 12:07:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590574057;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oet6q7jt0AUUrWLbY1RGvvj6eRqjyPy3h6ql4JMDYYE=;
	b=JRRsOr1K+5JiapGc3303lSUH2DpKHby66tUCtKeEqmeQwsjV6SCfH9EZ1GCU8/FJEhyCuG
	5kgQrAQU58icyd4Msb+r5Q8OBhZMcnPVx6NgZ6ivOPSfFOcAYBHsXhNogawcgLd0FO0NAV
	15LiMEfsO5bpF0SKCNKQSyZGBX+qWwY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-sSMWcvgXM6SA762WJQ61zA-1; Wed, 27 May 2020 06:07:33 -0400
X-MC-Unique: sSMWcvgXM6SA762WJQ61zA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 326701855A08;
	Wed, 27 May 2020 10:07:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B55B57A1E3;
	Wed, 27 May 2020 10:07:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 250B318095FF;
	Wed, 27 May 2020 10:07:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04RA7Rt7030113 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 27 May 2020 06:07:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D05921A918; Wed, 27 May 2020 10:07:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from localhost.localdomain (unknown [10.33.36.72])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3822C1A8EA;
	Wed, 27 May 2020 10:07:24 +0000 (UTC)
To: Andrew Price <anprice@redhat.com>
References: <20200527082954.1235228-1-anprice@redhat.com>
	<38694c56-7dcb-a52e-2d12-01949c20b9bd@redhat.com>
	<535f4043-d004-c7cd-be3a-0621fd2a35ba@redhat.com>
From: Steven Whitehouse <swhiteho@redhat.com>
Message-ID: <a1a58f62-5eda-b9e9-8567-d10835a5c8c7@redhat.com>
Date: Wed, 27 May 2020 11:07:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <535f4043-d004-c7cd-be3a-0621fd2a35ba@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04RA7Rt7030113
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH] mkfs.gfs2: Don't use optimal_io_size
 when equal to minimum
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
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 27/05/2020 11:02, Andrew Price wrote:
> On 27/05/2020 09:53, Steven Whitehouse wrote:
>> Hi,
>>
>> On 27/05/2020 09:29, Andrew Price wrote:
>>> Some devices report an optimal_io_size of 512 instead of 0 when it's 
>>> not
>>> larger than the minimum_io_size. Currently mkfs.gfs2 uses the non-zero
>>> value to choose the block size, which is almost certainly not what we
>>> want when it's 512. Update the suitability check for optimal_io_size to
>>> avoid using it when it's the same as minimum_io_size.  The effect is
>>> that we fall back to using the default block size, 4096.
>>>
>>> Resolves: rhbz#1839219
>>> Signed-off-by: Andrew Price <anprice@redhat.com>
>>
>> What about for other sizes? We don't really want to select a block 
>> size to be anything other than 4k in most cases, even if the block 
>> device offers a lower minimum/optimal I/O size,
>
> I think it would be unusual for a device to have an optimal_io_size > 
> 512 and < 4K, and I expect it's only 512 for the tested device because 
> of some design or configuration error, so we're still covering most 
> cases anyway. I figured that any other optimal_io_size is likely to be 
> one that's there for a good reason and so we should probably use it 
> (if suitable).
>
> That's just my reasoning for this patch though. I can see the value in 
> ignoring optimal_io_size < 4K, but it poses the question of whether 
> there's any value in allowing mkfs.gfs2 to create < 4K block size 
> filesystems at all.
>
> Andy
>
By default, I can't see any reason why we'd want a block sizes less than 
4k. We might want to allow someone to do that for special cases, but 
generally the lower block sizes cause issue with larger file sizes, due 
to the increased height of the metadata tree. As such we should try and 
avoid them, and ignoring all hints of below 4k seems like a sensible plan.

If someone specifically requests a smaller block size on the command 
line, then that is another thing, but we should try and protect people 
from devices which advertise really small optimal I/O sizes. Really we 
should be using that in combination with the alignment information when 
laying out the larger structures on disk, and not using it for selecting 
the block size - assuming again that these sizes have been set by the 
device to something sensible in the first place,

Steve.


>>
>>> ---
>>>   gfs2/mkfs/main_mkfs.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/gfs2/mkfs/main_mkfs.c b/gfs2/mkfs/main_mkfs.c
>>> index 846b341f..8b97f3d2 100644
>>> --- a/gfs2/mkfs/main_mkfs.c
>>> +++ b/gfs2/mkfs/main_mkfs.c
>>> @@ -505,7 +505,7 @@ static unsigned choose_blocksize(struct 
>>> mkfs_opts *opts)
>>>       }
>>>       if (!opts->got_bsize && got_topol) {
>>>           if (dev->optimal_io_size <= getpagesize() &&
>>> -            dev->optimal_io_size >= dev->minimum_io_size)
>>> +            dev->optimal_io_size > dev->minimum_io_size)
>>>               bsize = dev->optimal_io_size;
>>>           else if (dev->physical_sector_size <= getpagesize() &&
>>>                    dev->physical_sector_size >= GFS2_DEFAULT_BSIZE)


