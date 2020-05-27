Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 56F6D1E3E75
	for <lists+cluster-devel@lfdr.de>; Wed, 27 May 2020 12:02:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590573772;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=e/xuT3CfxEO6IkOhyu6L9EiLiA+93vssDHqEKHULJXg=;
	b=XlsUf8IY7mXQdN7c9botODTT4/9bHZ/LR0nJ51n4hrexPbFPGaLlKUPpdgSiBlA8ZZBCrZ
	v24BpeVFFXsS5ngtkkVY4JAB2FIFvodZpcT3M+/IOXnxz33NfCBaahNLFzfvffDfiEAJOZ
	Fb99k9llfDhAIiigve8Sf7NeEJtIhG8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-EOcW4-BYM3uaZNJYja93mg-1; Wed, 27 May 2020 06:02:51 -0400
X-MC-Unique: EOcW4-BYM3uaZNJYja93mg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 373DE464;
	Wed, 27 May 2020 10:02:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 913096FB6E;
	Wed, 27 May 2020 10:02:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D3A461809541;
	Wed, 27 May 2020 10:02:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04RA2eg1029603 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 27 May 2020 06:02:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5CD2B5C220; Wed, 27 May 2020 10:02:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from [10.33.36.6] (unknown [10.33.36.6])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5E7B15C1BD;
	Wed, 27 May 2020 10:02:35 +0000 (UTC)
To: Steven Whitehouse <swhiteho@redhat.com>
References: <20200527082954.1235228-1-anprice@redhat.com>
	<38694c56-7dcb-a52e-2d12-01949c20b9bd@redhat.com>
From: Andrew Price <anprice@redhat.com>
Message-ID: <535f4043-d004-c7cd-be3a-0621fd2a35ba@redhat.com>
Date: Wed, 27 May 2020 11:02:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <38694c56-7dcb-a52e-2d12-01949c20b9bd@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27/05/2020 09:53, Steven Whitehouse wrote:
> Hi,
> 
> On 27/05/2020 09:29, Andrew Price wrote:
>> Some devices report an optimal_io_size of 512 instead of 0 when it's not
>> larger than the minimum_io_size. Currently mkfs.gfs2 uses the non-zero
>> value to choose the block size, which is almost certainly not what we
>> want when it's 512. Update the suitability check for optimal_io_size to
>> avoid using it when it's the same as minimum_io_size.  The effect is
>> that we fall back to using the default block size, 4096.
>>
>> Resolves: rhbz#1839219
>> Signed-off-by: Andrew Price <anprice@redhat.com>
> 
> What about for other sizes? We don't really want to select a block size 
> to be anything other than 4k in most cases, even if the block device 
> offers a lower minimum/optimal I/O size,

I think it would be unusual for a device to have an optimal_io_size > 
512 and < 4K, and I expect it's only 512 for the tested device because 
of some design or configuration error, so we're still covering most 
cases anyway. I figured that any other optimal_io_size is likely to be 
one that's there for a good reason and so we should probably use it (if 
suitable).

That's just my reasoning for this patch though. I can see the value in 
ignoring optimal_io_size < 4K, but it poses the question of whether 
there's any value in allowing mkfs.gfs2 to create < 4K block size 
filesystems at all.

Andy

> 
>> ---
>>   gfs2/mkfs/main_mkfs.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/gfs2/mkfs/main_mkfs.c b/gfs2/mkfs/main_mkfs.c
>> index 846b341f..8b97f3d2 100644
>> --- a/gfs2/mkfs/main_mkfs.c
>> +++ b/gfs2/mkfs/main_mkfs.c
>> @@ -505,7 +505,7 @@ static unsigned choose_blocksize(struct mkfs_opts 
>> *opts)
>>       }
>>       if (!opts->got_bsize && got_topol) {
>>           if (dev->optimal_io_size <= getpagesize() &&
>> -            dev->optimal_io_size >= dev->minimum_io_size)
>> +            dev->optimal_io_size > dev->minimum_io_size)
>>               bsize = dev->optimal_io_size;
>>           else if (dev->physical_sector_size <= getpagesize() &&
>>                    dev->physical_sector_size >= GFS2_DEFAULT_BSIZE)

