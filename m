Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A621E3C77A4
	for <lists+cluster-devel@lfdr.de>; Tue, 13 Jul 2021 22:03:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626206596;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dd/glixc3m822uCEatTlBwMIQ7MWHd69GOD/4QbqSjM=;
	b=IfJ/cjiwhRUXmJAOgJsoBu+yyoZZC68FvrtEqTKXy4CLCQ2FTsNjmmJzzyxB4GA4wNUGTb
	g0I0c54VRhL5mNUADoa+bnqThgPOMTO+Hej8WnmM6K2MM6mQgwlA5a6D6m1i4tF8tenqfY
	VjlwDCadWOfJGo6SsPYzkj7ob2+fnkM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-PuEjn6sRM5OXB4WE9evp_Q-1; Tue, 13 Jul 2021 16:03:15 -0400
X-MC-Unique: PuEjn6sRM5OXB4WE9evp_Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30EFF804140;
	Tue, 13 Jul 2021 20:03:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F14219C44;
	Tue, 13 Jul 2021 20:03:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AB1BF1809C9A;
	Tue, 13 Jul 2021 20:03:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16DK391B030604 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 13 Jul 2021 16:03:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C3D05DAF04; Tue, 13 Jul 2021 20:03:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BEB41DA695
	for <cluster-devel@redhat.com>; Tue, 13 Jul 2021 20:03:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A678396B04D
	for <cluster-devel@redhat.com>; Tue, 13 Jul 2021 20:03:06 +0000 (UTC)
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
	[209.85.166.200]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-404-Pqx8Bib6P0efmKjlvDv6Aw-1; Tue, 13 Jul 2021 16:03:05 -0400
X-MC-Unique: Pqx8Bib6P0efmKjlvDv6Aw-1
Received: by mail-il1-f200.google.com with SMTP id
	h11-20020a056e021b8bb029020d99b97ad3so4417267ili.4
	for <cluster-devel@redhat.com>; Tue, 13 Jul 2021 13:03:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=dd/glixc3m822uCEatTlBwMIQ7MWHd69GOD/4QbqSjM=;
	b=ijVbXILjvLdkaf0fKbebaGGVO3MbksQ4JPZf4AZbEV9y/WgRwcoX3G3l52CpNA3Jl9
	e1OQiCmg5vXnvTdeANWsOpAsbn/wCvHFrboku37EA0i5HjXXftXe6iQ7o5eiQpaVHrn7
	Y+vJarhtUIgzrIeHl06aIDNJF0+u4bLXpqE+CssB0ik0o1SZIlH6x+G1Hd/YkTMqczCu
	ylKL9AEl1ZSoKqaLfLLTXqA/eyMsSm9VE3Mup474Ix/m40qrirOxBMn4xPNxNoE3U4Im
	LctImGiExs9vuP3VvgL5h11Bzt9+uBK0k5LrRNYAYNyNZa3ZFhbDS0bxA/Xmc99sI7Rs
	4ITA==
X-Gm-Message-State: AOAM531Tjp2WwUbfxen5yr2U7LHaWznRU5Slq2jTh2w+aWET2npWINxr
	pcipm018vKlqnt+Pe2OBk+YzNH5OAa3z5AxD9E+46aOO7drD2Iapczv0+pYu6WG4IlLqCzO+fCw
	/qSoF4kkXmJ4ZVsovbdry2CVB6Q0BYvzSxOUHwD0LIf3fRUNnLzx8zT26f0upP4ObC5oDQOy/5Q
	==
X-Received: by 2002:a6b:6016:: with SMTP id r22mr4646967iog.12.1626206584315; 
	Tue, 13 Jul 2021 13:03:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybNIOUBRSCggZkDmamKETt0X9TNEA+BDPByF1jV672IxWB+xVYEAowSn7kPOkAWQPp44SUhA==
X-Received: by 2002:a6b:6016:: with SMTP id r22mr4646953iog.12.1626206584082; 
	Tue, 13 Jul 2021 13:03:04 -0700 (PDT)
Received: from [172.16.0.19] (209-212-39-192.brainerd.net. [209.212.39.192])
	by smtp.gmail.com with ESMTPSA id e1sm10213441ilm.7.2021.07.13.13.03.03
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 13 Jul 2021 13:03:03 -0700 (PDT)
To: Steven Whitehouse <swhiteho@redhat.com>,
	cluster-devel <cluster-devel@redhat.com>
References: <20210713180958.66995-1-rpeterso@redhat.com>
	<20210713180958.66995-9-rpeterso@redhat.com>
	<ac3ca605d90d29e8424abc56ac5f410c0cc5e0b0.camel@redhat.com>
From: Bob Peterson <rpeterso@redhat.com>
Message-ID: <be7487f1-ebfd-e7d5-545c-97bb315afd18@redhat.com>
Date: Tue, 13 Jul 2021 15:03:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ac3ca605d90d29e8424abc56ac5f410c0cc5e0b0.camel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [GFS2 PATCH 08/10] gfs2: New log flush watchdog
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 7/13/21 1:41 PM, Steven Whitehouse wrote:
> Hi,
>
> On Tue, 2021-07-13 at 13:09 -0500, Bob Peterson wrote:
>> This patch adds a new watchdog whose sole purpose is to complain when
>> gfs2_log_flush operations are taking too long.
>>
> This one is a bit confusing. It says that it is to check if the log
> flush is taking too long, but it appears to set a timeout based on the
> amount of dirty data that will be written back, so it isn't really the
> log flush, but the writeback and log flush that is being timed I think?
>
> It also looks like the timeout is entirely dependent upon the number of
> dirty pages too, and not on the log flush size. I wonder about the
> performance impact of traversing the list of dirty pages too. If that
> can be avoided it should make the implementation rather more efficient,
>
> Steve.

Well, perhaps my patch description was misleading. The watchdog is meant
to time how long function gfs2_log_flush() holds the sd_log_flush_lock rwsem
in write mode. That includes writing the ordered writes as well as the
metadata. The metadata portion is almost always outweighed 100:1 (or more)
by the ordered writes. The length of time it will take to do the ordered 
writes
should be based on the number of dirty pages. I don't think running the
ordered writes list will impact performance too badly, and that's one reason
I chose to do it before we actually take the sd_log_flush_lock. It does, 
however,
hold the sd_ordered_lock lock during its count. Still, it's small 
compared to
counting the actual pages or something, and modern cpus can run lists very
quickly.

My initial version didn't count at all; it just used an arbitrary number of
seconds any log flush _ought_ to take. However, Barry pointed out that older
hardware can be slow when driven to extremes and I didn't want false
positives.

I also thought about keeping an interactive count whenever pages are
dirtied, or when inodes are added to the ordered writes list, but that 
seemed
like overkill. But it is a reasonable alternative.

The timeout value is also somewhat arbitrary, but I'm open to suggestions.

In my case, faulty hardware caused log flushes to take a very long time, 
which
caused many transactions and glocks to be blocked a long time and eventually
hit the 120-second kernel watchdog, which gives the impression glocks are
being held a very long time (which they are) for some unknown reason.

This can manifest on many (often non-faulty) nodes, since glocks can be 
tied up
indefinitely waiting for a process who has it locked EX but now must
wait until it can acquire the transaction lock, which is blocked on the 
log flush:
My goal was to make hardware problems (like faulty HBAs and fibre switches)
NOT seem like cascading gfs2 file system problems or slowdowns.

These messages will hopefully prompt operations people to investigate the
cause of the slowdown.

I tested this patch with faulty hardware, and it yielded messages like:

[ 2127.027527] gfs2: fsid=bobsrhel8:test.0: log flush pid 256206 took > 
20 seconds to write 98 pages.
[ 2348.979535] gfs2: fsid=bobsrhel8:test.0: log flush pid 256681 took > 
1 seconds to write 1 pages.
[ 3643.571505] gfs2: fsid=bobsrhel8:test.0: log flush pid 262385 took > 
4 seconds to write 16 pages.

Regards,

Bob Peterson


