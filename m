Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id EACCC3F5992
	for <lists+cluster-devel@lfdr.de>; Tue, 24 Aug 2021 10:00:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629791989;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LJy4JqwQsWHwjFHrTAXgfzWwLoN0LGrnWV2wmHdwLfo=;
	b=SCpforFbpYNIg0Tu5ccRvsVMxfkfy74vAl3RHYZAkc1NOrZ5R8rtCM175rXtipnZgnxdnj
	4GoHIZr4C6aKygnZPdvSgBD866SHL+2bMjNLYgcLywSUTwXyQRg+rcEoRycPSW4Gom9Xta
	bmu/jsem8PX1aRC6kkh5I6skQVw8eCE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-BGJbM-tBOW6iYphjg64hQQ-1; Tue, 24 Aug 2021 03:59:48 -0400
X-MC-Unique: BGJbM-tBOW6iYphjg64hQQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E24031082922;
	Tue, 24 Aug 2021 07:59:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 811D527CA6;
	Tue, 24 Aug 2021 07:59:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D45C04BB7C;
	Tue, 24 Aug 2021 07:59:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17O7xXis002046 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 24 Aug 2021 03:59:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9259020341D0; Tue, 24 Aug 2021 07:59:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E6BC20341CD
	for <cluster-devel@redhat.com>; Tue, 24 Aug 2021 07:59:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E8ABD805F52
	for <cluster-devel@redhat.com>; Tue, 24 Aug 2021 07:59:29 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
	[209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-49-LY9kGA7bPJKniTYJpXJPSw-1; Tue, 24 Aug 2021 03:59:28 -0400
X-MC-Unique: LY9kGA7bPJKniTYJpXJPSw-1
Received: by mail-wm1-f72.google.com with SMTP id
	c2-20020a7bc8420000b0290238db573ab7so884585wml.5
	for <cluster-devel@redhat.com>; Tue, 24 Aug 2021 00:59:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:user-agent:mime-version
	:content-transfer-encoding;
	bh=LJy4JqwQsWHwjFHrTAXgfzWwLoN0LGrnWV2wmHdwLfo=;
	b=SJbZ0xj0NEmzCRsZObtnSwGzL8OYn0pWy4LBGdfYR1QgcbzKQsMn4YapgWbFRjtCCW
	q8KeAvHBGWg1OSK+/UBBvV2V4Z0WRU8xbYsdANl+EMnsH06ynQCbFOoqb8W5DplyL+69
	rwkXZuMT5LFKAk2YcSew+Pi7+lFKsmqywevVNrrKyqs1/JtoksY2ax3sbsnkxQzmW9C9
	H/aGQxxlVmu7FeO3NL+V5LGukEE9JyCl7R8EuP0L1pVOUOJHGuafs41wYv4CaTxcbJpe
	uqczqS2SySUl2AfjKVB8puvq37yNhV6QyZYasDW9Nqxa9z/coqhKUs4gb/LzfP4bcThe
	+iDA==
X-Gm-Message-State: AOAM532fNelWERI0Wdsw0bal/23J+MlHzNQFev6L3ApM9vvFKQZx/Kit
	ZnXoiJ5RSi+EE0ekvC5EE2jPsPGpBsBfsecTx/6j8wxTp4335dAVLAAH75Azdri4ocivNGXBCoL
	J3FUPmSnD9Qz0oPOlb/N4vQ==
X-Received: by 2002:a1c:40c:: with SMTP id 12mr2733045wme.158.1629791966866;
	Tue, 24 Aug 2021 00:59:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzj0PhJgg4JTvuFLgnwv/kAZGzTP9BXAmE0J1/y6sKtGk33rcQwpzh4xhgOENzEg5F5zC0g7A==
X-Received: by 2002:a1c:40c:: with SMTP id 12mr2733027wme.158.1629791966569;
	Tue, 24 Aug 2021 00:59:26 -0700 (PDT)
Received: from
	0.7.3.c.2.b.0.0.0.3.7.8.9.5.0.2.0.0.0.0.a.d.f.f.0.b.8.0.1.0.0.2.ip6.arpa
	(0.7.3.c.2.b.0.0.0.3.7.8.9.5.0.2.0.0.0.0.a.d.f.f.0.b.8.0.1.0.0.2.ip6.arpa.
	[2001:8b0:ffda:0:2059:8730:b2:c370])
	by smtp.gmail.com with ESMTPSA id r1sm428715wmn.46.2021.08.24.00.59.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 24 Aug 2021 00:59:25 -0700 (PDT)
Message-ID: <2c0fbb32e7668844f148b12cb4711abc76f50fe4.camel@redhat.com>
From: Steven Whitehouse <swhiteho@redhat.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 24 Aug 2021 08:59:24 +0100
In-Reply-To: <CAHc6FU5uHJSXD+CQk3W9BfZmnBCd+fqHt4Bd+=uVH18rnYCPLg@mail.gmail.com>
References: <20210819194102.1491495-1-agruenba@redhat.com>
	<20210819194102.1491495-11-agruenba@redhat.com>
	<5e8a20a8d45043e88013c6004636eae5dadc9be3.camel@redhat.com>
	<cf284633-a9db-9f88-6b60-4377bc33e473@redhat.com>
	<CAHc6FU7EMOEU7C5ryu5pMMx1v+8CTAOMyGdf=wfaw8=TTA_btQ@mail.gmail.com>
	<8e2ab23b93c96248b7c253dc3ea2007f5244adee.camel@redhat.com>
	<CAHc6FU5uHJSXD+CQk3W9BfZmnBCd+fqHt4Bd+=uVH18rnYCPLg@mail.gmail.com>
Organization: Red Hat UK Ltd
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

On Mon, 2021-08-23 at 17:18 +0200, Andreas Gruenbacher wrote:
> On Mon, Aug 23, 2021 at 10:14 AM Steven Whitehouse <
> swhiteho@redhat.com> wrote:
> > On Fri, 2021-08-20 at 17:22 +0200, Andreas Gruenbacher wrote:
> > > On Fri, Aug 20, 2021 at 3:11 PM Bob Peterson <rpeterso@redhat.com
> > > >
> > > wrote:
> > [snip]
> > > > You can almost think of this as a performance enhancement. This
> > > > concept
> > > > allows a process to hold a glock for much longer periods of
> > > > time,
> > > > at a
> > > > lower priority, for example, when gfs2_file_read_iter needs to
> > > > hold
> > > > the
> > > > glock for very long-running iterative reads.
> > > 
> > > Consider a process that allocates a somewhat large buffer and
> > > reads
> > > into it in chunks that are not page aligned. The buffer initially
> > > won't be faulted in, so we fault in the first chunk and write
> > > into
> > > it.
> > > Then, when reading the second chunk, we find that the first page
> > > of
> > > the second chunk is already present. We fill it, set the
> > > HIF_MAY_DEMOTE flag, fault in more pages, and clear the
> > > HIF_MAY_DEMOTE
> > > flag. If we then still have the glock (which is very likely), we
> > > resume the read. Otherwise, we return a short result.
> > > 
> > > Thanks,
> > > Andreas
> > > 
> > 
> > If the goal here is just to allow the glock to be held for a longer
> > period of time, but with occasional interruptions to prevent
> > starvation, then we have a potential model for this. There is
> > cond_resched_lock() which does this for spin locks.
> 
> This isn't an appropriate model for what I'm trying to achieve here.
> In the cond_resched case, we know at the time of the cond_resched
> call
> whether or not we want to schedule. If we do, we want to drop the
> spin
> lock, schedule, and then re-acquire the spin lock. In the case we're
> looking at here, we want to fault in user pages. There is no way of
> knowing beforehand if the glock we're currently holding will have to
> be dropped to achieve that. In fact, it will almost never have to be
> dropped. But if it does, we need to drop it straight away to allow
> the
> conflicting locking request to succeed.
> 
> Have a look at how the patch queue uses gfs2_holder_allow_demote()
> and
> gfs2_holder_disallow_demote():
> 
> https://listman.redhat.com/archives/cluster-devel/2021-August/msg00128.html
> https://listman.redhat.com/archives/cluster-devel/2021-August/msg00134.html
> 
> Thanks,
> Andreas
> 

Ah, now I see! Apologies if I've misunderstood the intent here,
initially. It is complicated and not so obvious - at least to me!

You've added a lot of context to this patch in your various replies on
this thread. The original patch description explains how the feature is
implemented, but doesn't really touch on why - that is left to the
other patches that you pointed to above. A short paragraph or two on
the "why" side of things added to the patch description would be
helpful I think.

Your message on Friday (20 Aug 2021 15:17:41 +0200 (20/08/21 14:17:41))
has a good explanation in the second part of it, which with what you've
said above (or similar) would be a good basis.

Apologies again for not understanding what is going on,

Steve.


