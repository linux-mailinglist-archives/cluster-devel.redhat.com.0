Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A791C3F2CE6
	for <lists+cluster-devel@lfdr.de>; Fri, 20 Aug 2021 15:12:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629465119;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bqh06A4IsUEWpw6rhzLKw/iWZwAPu+rG9dT74f0JO44=;
	b=CH4rXWBvc4YmKd97buY3VAO+qurpbvAZ2SbsL2HW+Y11+abIRWCfsr7jCRMqFrZkNbnpY7
	FKsbjmJaeb0Wa1xSho8hPDtfcB0CjCcoTAJW/E+8PNJzmRjMuwIYGwVMCASQCSM2Drrnwi
	IeGIoQUFY4cHw7oOPEdXvoEV43eUfa8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-RTFS6a9APWO1erG4KLkIRQ-1; Fri, 20 Aug 2021 09:11:58 -0400
X-MC-Unique: RTFS6a9APWO1erG4KLkIRQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBCE71853028;
	Fri, 20 Aug 2021 13:11:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 360E39D62;
	Fri, 20 Aug 2021 13:11:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 11ECD4BB7C;
	Fri, 20 Aug 2021 13:11:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17KDBjd9016373 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 20 Aug 2021 09:11:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 80989202C0E6; Fri, 20 Aug 2021 13:11:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 792262030BF4
	for <cluster-devel@redhat.com>; Fri, 20 Aug 2021 13:11:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED39889C7DC
	for <cluster-devel@redhat.com>; Fri, 20 Aug 2021 13:11:38 +0000 (UTC)
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
	[209.85.166.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-593-CDlyk05kPgKVPmbvbGi3bg-1; Fri, 20 Aug 2021 09:11:37 -0400
X-MC-Unique: CDlyk05kPgKVPmbvbGi3bg-1
Received: by mail-io1-f72.google.com with SMTP id
	f10-20020a6b620a0000b02904e5ab8bdc6cso5395029iog.22
	for <cluster-devel@redhat.com>; Fri, 20 Aug 2021 06:11:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=bqh06A4IsUEWpw6rhzLKw/iWZwAPu+rG9dT74f0JO44=;
	b=GiJyXpdsxgIqpu9pAKCbIAB/pGQWauE4MSv7r2PYk/7ZDAdIpWEzDmBV1p/0oAVew8
	al5/OV5iroP4Fe4ttfZBHF9kHHB2IB86Dxbqp96FL2ZLHBlYiwhIsG8cibM2tAIUOh+2
	J8oyqKcJQZzMxkQZVMEC7DuWVqKGK333k7QiZSBnDjoLRtynqOSs1bUtD6vwHgQMQ/Oh
	TMmVIM9TCJnxjOOWD7qHbX36rMqlLlbACWM49cJZ3affxP+oenUtm23cDguxfUZdtC1a
	MQTW3OYRDde5FRuz2KM1OwGdUp6wkdDIYCrLQzbyAB8ges4qcyuVPA3MJiw2zls0rU9E
	X7Kw==
X-Gm-Message-State: AOAM530IGcu9PUqzhZOdzvIxNN0Gjvg8+OCG7cpbGE5aVT1ZJqMRRGs1
	rBiWRGcWTdpKdG9PWzxgbkuhCX6N+vlfdnN41CN8hkfwfxhWLPNdOLhXt1TRkGZydfXf4pBXmht
	2HbibAHxXYfgipR0yVU92zw==
X-Received: by 2002:a05:6638:1905:: with SMTP id
	p5mr17720503jal.25.1629465096937; 
	Fri, 20 Aug 2021 06:11:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwn2FwXIDsFpu5O60lFgWVHR+E5ie3a+l6OotzkonnnUZdMfF8XP6FuEiuSEv0LvgDyL5UuiQ==
X-Received: by 2002:a05:6638:1905:: with SMTP id
	p5mr17720468jal.25.1629465096680; 
	Fri, 20 Aug 2021 06:11:36 -0700 (PDT)
Received: from [172.16.0.19] (209-212-39-192.brainerd.net. [209.212.39.192])
	by smtp.gmail.com with ESMTPSA id k9sm3452624ilo.49.2021.08.20.06.11.35
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 20 Aug 2021 06:11:36 -0700 (PDT)
To: Steven Whitehouse <swhiteho@redhat.com>,
	Andreas Gruenbacher <agruenba@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christoph Hellwig <hch@infradead.org>,
	"Darrick J. Wong" <djwong@kernel.org>
References: <20210819194102.1491495-1-agruenba@redhat.com>
	<20210819194102.1491495-11-agruenba@redhat.com>
	<5e8a20a8d45043e88013c6004636eae5dadc9be3.camel@redhat.com>
From: Bob Peterson <rpeterso@redhat.com>
Message-ID: <cf284633-a9db-9f88-6b60-4377bc33e473@redhat.com>
Date: Fri, 20 Aug 2021 08:11:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5e8a20a8d45043e88013c6004636eae5dadc9be3.camel@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v6 10/19] gfs2: Introduce flag for glock
 holder auto-demotion
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

On 8/20/21 4:35 AM, Steven Whitehouse wrote:
> Hi,
> 
> On Thu, 2021-08-19 at 21:40 +0200, Andreas Gruenbacher wrote:
>> From: Bob Peterson <rpeterso@redhat.com>
>>
>> This patch introduces a new HIF_MAY_DEMOTE flag and infrastructure
>> that
>> will allow glocks to be demoted automatically on locking conflicts.
>> When a locking request comes in that isn't compatible with the
>> locking
>> state of a holder and that holder has the HIF_MAY_DEMOTE flag set,
>> the
>> holder will be demoted automatically before the incoming locking
>> request
>> is granted.
>>
> I'm not sure I understand what is going on here. When there are locking
> conflicts we generate call backs and those result in glock demotion.
> There is no need for a flag to indicate that I think, since it is the
> default behaviour anyway. Or perhaps the explanation is just a bit
> confusing...

I agree that the whole concept and explanation are confusing. Andreas 
and I went through several heated arguments about the symantics, 
comments, patch descriptions, etc. We played around with many different 
flag name ideas, etc. We did not agree on the best way to describe the 
whole concept. He didn't like my explanation and I didn't like his. So 
yes, it is confusing.

My preferred terminology was "DOD" or "Dequeue On Demand" which makes 
the concept more understandable to me. So basically a process can say
"I need to hold this glock, but for an unknown and possibly lengthy 
period of time, but please feel free to dequeue it if it's in your way."
And bear in mind that several processes may do the same, simultaneously.

You can almost think of this as a performance enhancement. This concept 
allows a process to hold a glock for much longer periods of time, at a 
lower priority, for example, when gfs2_file_read_iter needs to hold the 
glock for very long-running iterative reads.

The process requesting a holder with "Demote On Demand" must then 
determine if its holder has been stolen away (dequeued on demand) after 
its lengthy operation, and therefore needs to pick up the pieces of 
where it left off in its process.

Meanwhile, another process may need to hold the glock. If its requested 
mode is compatible, say SH and SH, the lock is simply granted with no 
further delay. If the mode is incompatible, regardless of whether it's 
on the local node or a different node in the cluster, these 
longer-term/lower-priority holders may be dequeued or prempted by 
another request to hold the glock. Note that although these holders are 
dequeued-on-demand, they are never "uninitted" as part of the process. 
Nor must they ever be, since they may be on another process's heap.

This differs from the normal glock demote process in which the demote 
bit is set on ("requesting" the glock be demoted) but still needs to 
block until the holder does its actual dequeue.

>> Processes that allow a glock holder to be taken away indicate this by
>> calling gfs2_holder_allow_demote().  When they need the glock again,
>> they call gfs2_holder_disallow_demote() and then they check if the
>> holder is still queued: if it is, they're still holding the glock; if
>> it
>> isn't, they need to re-acquire the glock.
>>
>> This allows processes to hang on to locks that could become part of a
>> cyclic locking dependency.  The locks will be given up when a (rare)
>> conflicting locking request occurs, and don't need to be given up
>> prematurely.
> This seems backwards to me. We already have the glock layer cache the
> locks until they are required by another node. We also have the min
> hold time to make sure that we don't bounce locks too much. So what is
> the problem that you are trying to solve here I wonder?

Again, this is simply allowing premption of lenghy/low-priority holders 
whereas the normal demote process will only demote when the glock is 
dequeued after this potentially very-long period of time.

The minimum hold time solves a different problem, and Andreas and I 
talked just yesterday about possibly revisiting how that all works. The 
problem with minimum hold time is that in many cases the glock state 
machine does not want to grant new holders if the demote bit is on, so 
it ends up wasting more time than solving the actual problem.
But that's another problem for another day.

Regards,

Bob Peterson

