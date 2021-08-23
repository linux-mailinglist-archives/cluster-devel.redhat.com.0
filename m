Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id CB8CC3F4E77
	for <lists+cluster-devel@lfdr.de>; Mon, 23 Aug 2021 18:36:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629736584;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=r5NSirjKs41jSzfQIVFQxmbd80RcTLP1GCVAVajYdQQ=;
	b=NBnJp6qT1UQgUVCiW9XjPxsMpluciESoDpWP1ALUvfQeTV7OILjmZBwM0cXpQrNd4YVLJ/
	9zFivMWZvXFMDLx43EuwwLH2u1fSMlbPfdPDjkPc1CB+yV3C/V1sQ5xnhLgcDACavuxF82
	uWdX+rO8tn4UIOgJHQyezKJgAVJqKdg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-R0513d4KM2KugM6m49T9rQ-1; Mon, 23 Aug 2021 12:36:23 -0400
X-MC-Unique: R0513d4KM2KugM6m49T9rQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B39748799E0;
	Mon, 23 Aug 2021 16:36:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DF481ABD7;
	Mon, 23 Aug 2021 16:36:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 35B60181A0F2;
	Mon, 23 Aug 2021 16:36:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17NGaH84030824 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 23 Aug 2021 12:36:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 654289C06A; Mon, 23 Aug 2021 16:36:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A9DE9C074
	for <cluster-devel@redhat.com>; Mon, 23 Aug 2021 16:36:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A59B101A52C
	for <cluster-devel@redhat.com>; Mon, 23 Aug 2021 16:36:14 +0000 (UTC)
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
	[209.85.166.198]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-76-ut711Li1OWOyeSYeKnLlgg-1; Mon, 23 Aug 2021 12:36:13 -0400
X-MC-Unique: ut711Li1OWOyeSYeKnLlgg-1
Received: by mail-il1-f198.google.com with SMTP id
	y8-20020a92c748000000b00224811cb945so10074423ilp.6
	for <cluster-devel@redhat.com>; Mon, 23 Aug 2021 09:36:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=r5NSirjKs41jSzfQIVFQxmbd80RcTLP1GCVAVajYdQQ=;
	b=aI2/f3tEY6I2zT+iapMeo5U8A6SJiVQS7bobDdGWbhVfiJ0R6gSlRZriFcJsDDC1zG
	OzG37aa14fFLLUj+L6iBpwwvp3meLM7P9eKMa+7LZUnw2zNbLfQB/9iP+uKh7MoGhWpj
	iHgPO/hUCledV4CdayxIk+yExIlv46hoB4OxwTqVnKRNvMHj1U2ikUGPGB1d8mbBouMl
	eyyCkcwoKFw5eGNSJm0iW+1K9Uw/Ly9LbHYYz7Dxxf4Ojfe9WcDeR47UYzP4ex1DcDug
	JKYEbBEnkjIeFPrD6Uk4W2mwAG4kr2+Sey9vD821EKtBHPFKuq0OpD21lFrdBU66AseQ
	o+AQ==
X-Gm-Message-State: AOAM530G26vbfS/vd9G48C0mUfsmvZOLi3WstwegrwCsabcAobFFryoU
	oX6xwxG3V8rQ3LVjTkPMA+7emGq/lq+jHajvScasse13scG7dgV8FF5eKN/PCx5jn1PHDY3E5Kd
	IFIBa/Yt0RysDSF31TVScew==
X-Received: by 2002:a05:6602:341:: with SMTP id
	w1mr27131478iou.40.1629736572394; 
	Mon, 23 Aug 2021 09:36:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjIF/CeJPjrbLMOMSAillsWB3d7qGWogCMb9ncBdT7T+8wQDkqYOC3c+S2kxOZsak+rrto5w==
X-Received: by 2002:a05:6602:341:: with SMTP id
	w1mr27131468iou.40.1629736572248; 
	Mon, 23 Aug 2021 09:36:12 -0700 (PDT)
Received: from [172.16.0.19] (209-212-39-192.brainerd.net. [209.212.39.192])
	by smtp.gmail.com with ESMTPSA id z6sm7453260ilp.9.2021.08.23.09.36.10
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 23 Aug 2021 09:36:11 -0700 (PDT)
To: Matthew Wilcox <willy@infradead.org>,
	Andreas Gruenbacher <agruenba@redhat.com>
References: <20210819194102.1491495-1-agruenba@redhat.com>
	<20210819194102.1491495-11-agruenba@redhat.com>
	<5e8a20a8d45043e88013c6004636eae5dadc9be3.camel@redhat.com>
	<cf284633-a9db-9f88-6b60-4377bc33e473@redhat.com>
	<CAHc6FU7EMOEU7C5ryu5pMMx1v+8CTAOMyGdf=wfaw8=TTA_btQ@mail.gmail.com>
	<8e2ab23b93c96248b7c253dc3ea2007f5244adee.camel@redhat.com>
	<CAHc6FU5uHJSXD+CQk3W9BfZmnBCd+fqHt4Bd+=uVH18rnYCPLg@mail.gmail.com>
	<YSPHR7EL/ujG0Of7@casper.infradead.org>
From: Bob Peterson <rpeterso@redhat.com>
Message-ID: <43cf01f7-1fb5-26a9-bcda-5c9748c6f32e@redhat.com>
Date: Mon, 23 Aug 2021 11:36:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YSPHR7EL/ujG0Of7@casper.infradead.org>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>, ocfs2-devel@oss.oracle.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/23/21 11:05 AM, Matthew Wilcox wrote:
> On Mon, Aug 23, 2021 at 05:18:12PM +0200, Andreas Gruenbacher wrote:
>> On Mon, Aug 23, 2021 at 10:14 AM Steven Whitehouse <swhiteho@redhat.com> wrote:
>>> If the goal here is just to allow the glock to be held for a longer
>>> period of time, but with occasional interruptions to prevent
>>> starvation, then we have a potential model for this. There is
>>> cond_resched_lock() which does this for spin locks.
>>
>> This isn't an appropriate model for what I'm trying to achieve here.
>> In the cond_resched case, we know at the time of the cond_resched call
>> whether or not we want to schedule. If we do, we want to drop the spin
>> lock, schedule, and then re-acquire the spin lock. In the case we're
>> looking at here, we want to fault in user pages. There is no way of
>> knowing beforehand if the glock we're currently holding will have to
>> be dropped to achieve that. In fact, it will almost never have to be
>> dropped. But if it does, we need to drop it straight away to allow the
>> conflicting locking request to succeed.
> 
> It occurs to me that this is similar to the wound/wait mutexes
> (include/linux/ww_mutex.h & Documentation/locking/ww-mutex-design.rst).
> You want to mark the glock as woundable before faulting, and then discover
> if it was wounded after faulting.  Maybe sharing this terminology will
> aid in understanding?
> 
Hmm. Woundable. I like it.
Andreas and I argued about the terminology but we never found a 
middle-ground. Perhaps this is it. Thanks, Matthew.

Regards,

Bob Peterson

