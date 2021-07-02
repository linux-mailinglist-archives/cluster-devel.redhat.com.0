Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 61C2B3B9A73
	for <lists+cluster-devel@lfdr.de>; Fri,  2 Jul 2021 03:14:55 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-XYBYAewxMp66mzpFpcGz_A-1; Thu, 01 Jul 2021 21:14:53 -0400
X-MC-Unique: XYBYAewxMp66mzpFpcGz_A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 901F19126F;
	Fri,  2 Jul 2021 01:14:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 521556E0B7;
	Fri,  2 Jul 2021 01:14:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EDC824EA29;
	Fri,  2 Jul 2021 01:14:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1621Em7P029914 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 1 Jul 2021 21:14:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C1F9E20962FD; Fri,  2 Jul 2021 01:14:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD9EF20962FB
	for <cluster-devel@redhat.com>; Fri,  2 Jul 2021 01:14:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D9C2858F19
	for <cluster-devel@redhat.com>; Fri,  2 Jul 2021 01:14:45 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
	[209.85.166.182]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-337-Z31Bu43aMvmfeoj0xAm61Q-1; Thu, 01 Jul 2021 21:14:43 -0400
X-MC-Unique: Z31Bu43aMvmfeoj0xAm61Q-1
Received: by mail-il1-f182.google.com with SMTP id g3so7022048ilq.10;
	Thu, 01 Jul 2021 18:14:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=F6q+d+OSdqVyGZpPkY0K+9RZhaSmWq15QL3d6lDBiig=;
	b=dHDVlW/spH/BIVXr9X+pkS1nhcPzhiLjzNjXRY1/MbF+HIy26VyU8hyrg1o3Lm3PJl
	LnEUSUymq4Mq5lR/JpXlbiHemJrnJJe4AiRG9/it9kTsjz6MlrCwWCoh/bhS8qPj/i3m
	d0yDcl3uwVkoUFIdSOoNMygpmlg0wE9BBVTwuw5Nos7FB2jvDIEF9nE3az1pNSsgDeC9
	s27QJiGGDzzGDfuZXVGSynxGdVqEiQVQPIwJpT4FxeYDrWETJKV48NtSv7kAZ9IsUvYV
	+NSq4T0vHkCpE4ByPzYy8N45NX4dl5dtsWBWgzkSz4lRsw3mdxknej97RCvU6+fo7iBL
	OJyQ==
X-Gm-Message-State: AOAM532AV54L0co8kTOsXVWKKx5KGzY5QejhM/FTRDp81Vs6BAKRn12+
	o92IeGlmnkSSRk1AGa53pEAsVCiZZ/is29Qabzk=
X-Google-Smtp-Source: ABdhPJzQhUbJyF6fb4MyLJXFciJ/bK6uVcSFO+VlanZegVoqHJwCr06KFd8Eyk7mp511eLN2XQw5mT5d+oflu8gtN/c=
X-Received: by 2002:a05:6e02:114e:: with SMTP id
	o14mr1543607ill.201.1625188481988; 
	Thu, 01 Jul 2021 18:14:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210701204246.2037142-1-agruenba@redhat.com>
	<CAHk-=wjk6KP3vSLFNPMjoaZ4xY4u=DjTM+C+hCS3QKt+XAE6OA@mail.gmail.com>
	<CAHc6FU5XMfTOBW1a0OnMaPSmgWECvO-KYAo8HeVNsCyd-HyV3g@mail.gmail.com>
	<CAHk-=whaRsSuUeVBn_rLECWyG6h9RGuF9idsT_S+==vnsT8org@mail.gmail.com>
	<CAHk-=whnHfghvfLAteVeOTyDbypZ=Y7WBHfYByoVZa9SMxKe1w@mail.gmail.com>
In-Reply-To: <CAHk-=whnHfghvfLAteVeOTyDbypZ=Y7WBHfYByoVZa9SMxKe1w@mail.gmail.com>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Fri, 2 Jul 2021 03:14:30 +0200
Message-ID: <CAHpGcMJg5b+GYjgTtLPO2xdFCP_-efx-rh807nTud5Tdb9cmsA@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	cluster-devel <cluster-devel@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>
Subject: Re: [Cluster-devel] [PATCH] gfs2: Fix mmap + page fault deadlocks
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Am Fr., 2. Juli 2021 um 02:48 Uhr schrieb Linus Torvalds
<torvalds@linux-foundation.org>:
> On Thu, Jul 1, 2021 at 5:30 PM Linus Torvalds <torvalds@linux-foundation.org> wrote:
> > Of course, if you ask for more data than the file has, that's another
> > thing, but who really does that with direct-IO? And if they do, why
> > should we care about their silly behavior?
>
> Now, if the issue is that people do IO for bigger areas than you have
> memory for, then I think that's a chunking issue. I don't think the
> ITER_IOVEC necessarily needs to be converted to an ITER_BVEC in one
> single go. That would indeed be painful if somebody tries to do some
> huge direct-IO when they just don't have the memory for it.
>
> But the fact is, direct-IO has been an incredible pain-point for
> decades, because it's (a) unusual, (b) buggy and (c) has very little
> overall design and common code.
>
> The three issues are likely intimately tied together.
>
> The iomap code at least has tried to make for much more common code,
> but I really think some direct-IO people should seriously reconsider
> how they are doing things when there are fundamental deadlocks in the
> design.
>
> And I do think that a ITER_IOVEC -> ITER_BVEC conversion function
> might be a really really good idea to solve this problem.

I've tried to explain above how keeping the user-space pages
referenced will just lead to different kinds of deadlocks. That is the
problem with this approach.

> There's even
> a very natural chunking algorithm: try to do as much as possible with
> get_user_pages_fast() - so that if you already *have* the memory, you
> can do the full IO (or at least a big part of it).
>
> And if get_user_pages_fast() only gives you a small area - or nothing
> at all - you chunk it down aggressively, and realize that "oh, doing
> direct-IO when user space is paged out might not be the most optimal
> case".
>
>               Linus

Thanks,
Andreas

