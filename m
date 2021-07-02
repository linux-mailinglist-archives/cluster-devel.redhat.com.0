Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7F9A23B9A30
	for <lists+cluster-devel@lfdr.de>; Fri,  2 Jul 2021 02:44:57 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-mP7S5zHMNlScIRCSbIHigQ-1; Thu, 01 Jul 2021 20:44:55 -0400
X-MC-Unique: mP7S5zHMNlScIRCSbIHigQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E3F8100C663;
	Fri,  2 Jul 2021 00:44:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CE2210016F5;
	Fri,  2 Jul 2021 00:44:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2F2971809C98;
	Fri,  2 Jul 2021 00:44:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1620in2d028563 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 1 Jul 2021 20:44:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5793A108BF2; Fri,  2 Jul 2021 00:44:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5205110F991
	for <cluster-devel@redhat.com>; Fri,  2 Jul 2021 00:44:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A049D8556F2
	for <cluster-devel@redhat.com>; Fri,  2 Jul 2021 00:44:45 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
	[209.85.167.51]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-32-Idh843kGOJGmAx_IX9FGmw-1; Thu, 01 Jul 2021 20:44:43 -0400
X-MC-Unique: Idh843kGOJGmAx_IX9FGmw-1
Received: by mail-lf1-f51.google.com with SMTP id bu19so15080124lfb.9
	for <cluster-devel@redhat.com>; Thu, 01 Jul 2021 17:44:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iAFBHiNSZwKerU1t63V8e2H+JwkRhVjzTJjD0e6PoSw=;
	b=Jw6CFnXyt3RqAb+G9m/EApiZQZUCVQiGNnaG3rUi3VP+8FJnwG7jLRrNP7sU561ghA
	pXm9MSos0Gp7alXaq1uslTUbGzg4V1LYzIVJBLHQNwoizElbtZHTjVw79DjkGD8xHjWt
	PK343lqe1W0mTefUGDX63B49GR0v21nBYzmFEiShyc2twK5jvqSrgodbpKxi+Wpy6nOn
	conI9pFwnRjkc+hxtuJr+oXxT4yfQdT8+IhmYKFucAxMvWbfXtEx7lEqPLThk2Y3z1UM
	4fLt21FL4NTVPNdxUYwF6TQtZ09jDeIGs6W+1jOgDs8pCHFiAheJOjKZG7x0VrZEYJxd
	q7bA==
X-Gm-Message-State: AOAM530qvwQD9lL9ZJiHHa4PRJHTt9vCkQ1r2Mu4TTEZl6og2AF6rHXG
	r/f/rBYVXlTXvE09aYErfBuT1y73xgzjan77tRg=
X-Google-Smtp-Source: ABdhPJzV0H7tmkveFBWyJUuaeGd3KmOD3MuX8l1udc5kItQ90SY9aSpQQHK039E4Oll/R/MoCGz93Q==
X-Received: by 2002:a05:6512:3293:: with SMTP id
	p19mr1812217lfe.214.1625186682187; 
	Thu, 01 Jul 2021 17:44:42 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
	[209.85.167.53])
	by smtp.gmail.com with ESMTPSA id v6sm176925ljh.51.2021.07.01.17.44.40
	for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 01 Jul 2021 17:44:41 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id t17so15186568lfq.0
	for <cluster-devel@redhat.com>; Thu, 01 Jul 2021 17:44:40 -0700 (PDT)
X-Received: by 2002:a05:6512:15a2:: with SMTP id
	bp34mr1715559lfb.40.1625186680318; 
	Thu, 01 Jul 2021 17:44:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210701204246.2037142-1-agruenba@redhat.com>
	<CAHk-=wjk6KP3vSLFNPMjoaZ4xY4u=DjTM+C+hCS3QKt+XAE6OA@mail.gmail.com>
	<CAHc6FU5XMfTOBW1a0OnMaPSmgWECvO-KYAo8HeVNsCyd-HyV3g@mail.gmail.com>
	<CAHk-=whaRsSuUeVBn_rLECWyG6h9RGuF9idsT_S+==vnsT8org@mail.gmail.com>
In-Reply-To: <CAHk-=whaRsSuUeVBn_rLECWyG6h9RGuF9idsT_S+==vnsT8org@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 1 Jul 2021 17:44:24 -0700
X-Gmail-Original-Message-ID: <CAHk-=whnHfghvfLAteVeOTyDbypZ=Y7WBHfYByoVZa9SMxKe1w@mail.gmail.com>
Message-ID: <CAHk-=whnHfghvfLAteVeOTyDbypZ=Y7WBHfYByoVZa9SMxKe1w@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Matthew Wilcox <willy@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 1, 2021 at 5:30 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
>
> Of course, if you ask for more data than the file has, that's another
> thing, but who really does that with direct-IO? And if they do, why
> should we care about their silly behavior?

Now, if the issue is that people do IO for bigger areas than you have
memory for, then I think that's a chunking issue. I don't think the
ITER_IOVEC necessarily needs to be converted to an ITER_BVEC in one
single go. That would indeed be painful if somebody tries to do some
huge direct-IO when they just don't have the memory for it.

But the fact is, direct-IO has been an incredible pain-point for
decades, because it's (a) unusual, (b) buggy and (c) has very little
overall design and common code.

The three issues are likely intimately tied together.

The iomap code at least has tried to make for much more common code,
but I really think some direct-IO people should seriously reconsider
how they are doing things when there are fundamental deadlocks in the
design.

And I do think that a ITER_IOVEC -> ITER_BVEC conversion function
might be a really really good idea to solve this problem. There's even
a very natural chunking algorithm: try to do as much as possible with
get_user_pages_fast() - so that if you already *have* the memory, you
can do the full IO (or at least a big part of it).

And if get_user_pages_fast() only gives you a small area - or nothing
at all - you chunk it down aggressively, and realize that "oh, doing
direct-IO when user space is paged out might not be the most optimal
case".

              Linus

