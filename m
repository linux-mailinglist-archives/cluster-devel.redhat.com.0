Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1A6B03D7806
	for <lists+cluster-devel@lfdr.de>; Tue, 27 Jul 2021 16:06:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627394793;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YjwyD1Xvqvywhi/7diEYvFS35YIYUs4HHb9+DGBLWmc=;
	b=FFSMHk6jJOaBYLvgeHGWARKwuiwjdsStOglrSFMxc8oD4i/yWU7ZnfjTXPbi+Msp0bvQ7k
	JnatIKbAbNOpszVs6hcwIhHgSikpUviXD6n+9P1e/gCsG4ogKnzRlDMbufu9xHfQ1Qu8go
	7lHaRMTlQLMQWgqMnwyGinwwDV9gWdg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-a8gqw17AMGOJshHbGgeBDw-1; Tue, 27 Jul 2021 10:06:30 -0400
X-MC-Unique: a8gqw17AMGOJshHbGgeBDw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6429108C308;
	Tue, 27 Jul 2021 14:05:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E825E19C79;
	Tue, 27 Jul 2021 14:05:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 39E4B18087F1;
	Tue, 27 Jul 2021 14:05:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16RE5Wqi029844 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 27 Jul 2021 10:05:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B74831009126; Tue, 27 Jul 2021 14:05:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B31A41009BBC
	for <cluster-devel@redhat.com>; Tue, 27 Jul 2021 14:05:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96FB3101A52C
	for <cluster-devel@redhat.com>; Tue, 27 Jul 2021 14:05:29 +0000 (UTC)
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
	[209.85.166.199]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-186-6RB0I9QWO164VbCCwgeulA-1; Tue, 27 Jul 2021 10:05:28 -0400
X-MC-Unique: 6RB0I9QWO164VbCCwgeulA-1
Received: by mail-il1-f199.google.com with SMTP id
	z18-20020a9232120000b0290216ae9088ffso6881285ile.9
	for <cluster-devel@redhat.com>; Tue, 27 Jul 2021 07:05:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=YjwyD1Xvqvywhi/7diEYvFS35YIYUs4HHb9+DGBLWmc=;
	b=ujogyX/60T7HrgoYW5ZNbj9fhVMErNyD7SdDV/4Y66UgHacOy6qi1W/8YgitZUSOQj
	jL2+45YDDRqxOaiakRwAhKDjq8ttuxQaOJsHIibS2rhUN6d/9Q7G3Sa8T6iqFDNXfODn
	zBFo4P53WXyQxZCY845zbZN2J23Alg0jttlAY/cYrLkXZypIN/QCwoPPq2p3xCnacmtx
	wJzbG8EPcW4eH/E5aRkpXn0PDpLll3VGfX3aYFQ8RcLXerJ/Ofk3XVyYs0uWeLi6Clxm
	MmHyNRAF3+hgIgELaCSHUQGLKaJWfzARyffQnkkT80T3AzbsWJLOOxUn1WOQhBP1PaEZ
	IUeg==
X-Gm-Message-State: AOAM531nbgoK6rVPKpkt1Uy/ottqemtC6uhbkA/Gg4dImYsydGISkpEk
	NhsQh4I9nwQ2rWVA9kOHgt0BDJOao1XVQLzJ0yVmZfuN6iKnmOq5E+OQJXDZ1iizDO84p9+U+Ep
	h5lQbZruFAIwt3WK1Lg8+Plbf+t8wNNOzed9uRxvSP8gggNtB0pg6636aKX24eNLMyFyN9NnICQ
	==
X-Received: by 2002:a92:6610:: with SMTP id a16mr16053185ilc.71.1627394727135; 
	Tue, 27 Jul 2021 07:05:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNA51we9k6k30EW0mIc2+7ei0AZyaSWnE2C7fk5BpYlkootPOD0UUdsTrs7iBparwX6GWLVQ==
X-Received: by 2002:a92:6610:: with SMTP id a16mr16053172ilc.71.1627394726918; 
	Tue, 27 Jul 2021 07:05:26 -0700 (PDT)
Received: from [172.16.0.19] (209-212-39-192.brainerd.net. [209.212.39.192])
	by smtp.gmail.com with ESMTPSA id
	k13sm1744293ilv.18.2021.07.27.07.05.26
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 27 Jul 2021 07:05:26 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>
References: <20210726140058.GA9206@lst.de>
	<612d262a-e997-e887-ade9-1edc5efab758@redhat.com>
	<20210727070546.GA12839@lst.de>
From: Bob Peterson <rpeterso@redhat.com>
Message-ID: <50315f10-b891-3bde-cd03-4efd697a13cc@redhat.com>
Date: Tue, 27 Jul 2021 09:05:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727070546.GA12839@lst.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] gfs2 hang in xfstests generic/361 (v3)
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
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/27/21 2:05 AM, Christoph Hellwig wrote:
> On Mon, Jul 26, 2021 at 01:50:11PM -0500, Bob Peterson wrote:
>> FYI: I just pushed a replacement patch to linux-gfs2/for-next.next4.
>> The patch I mentioned last time had problems, so this is a simplified
>> middle-ground between that patch and the one I suggested earlier.
>> Patch is a89a427e0afe.
> 
> With just that patch cherry picked the test still hangs.
> 
> The entire linux-gfs2/for-next.next4 completes a quick group xfstests
> run, but with a lot of failures:
> 
> Failures: generic/079 generic/082 generic/092 generic/094 generic/103 generic/219 generic/230 generic/235 generic/244 generic/294 generic/306 generic/347 generic/379 generic/380 generic/382 generic/383 generic/384 generic/385 generic/386 generic/400 generic/441 generic/452 generic/488 generic/545 generic/566 generic/587 generic/594 generic/600 generic/601 generic/603
> Failed 30 of 514 tests
> 

Hi Christoph,

Thanks for testing gfs2.
Andreas and I are fully aware of these failures. When I do a full run 
(which I do almost every day), I get these same 9 failures that you also 
reported:

generic/294
generic/306
generic/441
generic/452
generic/488
generic/545
generic/594
generic/619
generic/631

I've not done a detailed analysis of these 9 lately, but in the past 
I've looked at individual failures and they're usually because gfs2 does 
a "file system withdraw" due to IO errors writing to its journal (and 
such--as we want and expect) whereas most file systems don't do that. So 
these are kind of expected failures. Perhaps I should go back check them 
again.

The others you reported are are exempted from my testing (I've got them 
in my excludes file) because in most cases the problem is gfs2's lack of 
support for the usrquota / grpquota / prjquota mount options:

generic/082 - Lack of support for -o usrquota / grpquota / prjquota
generic/219
generic/230
generic/235
generic/244
generic/379
generic/380
generic/382
generic/383
generic/384
generic/385
generic/386
generic/400
generic/566
generic/587
generic/600
generic/601
generic/603

That leaves us:

generic/079 [expunged] - Incorrect permission check (doesn't match the 
one in notify_change)
generic/092 [expunged] - Lack of support for unwritten extents
generic/094 [expunged] - Lack of support for unwritten extents
generic/103       [expunged] - Command having problems: xfs_io -i -fc 
falloc 0 66574524k /mnt/scratch/spc
(I haven't taken the time to analyze this yet)
Inconsistent filesystem when running out of space on dm-thin
(I haven't taken the time to analyze this yet either)

So we know we've still got some work to do here, but we've got higher 
priorities at the moment. They're still on our to-do list.

Regards,

Bob Peterson

