Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3291F3F5112
	for <lists+cluster-devel@lfdr.de>; Mon, 23 Aug 2021 21:13:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629746006;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=jhaMcYrw2lrnaBdCd+giUeZH7Ccr515F+el79Rmo7nk=;
	b=USYtCt9vqLqbu5ZK3dSaNrEeumdvk1U3NqnjgwpWviRU2wkVLuDu6bPE1SR01hiO4B4nay
	jOv+p7avcygTl4t1t1Q7jicT+wjm22IVCE/DgN9A85kiMGtUY8PxE4nJT1Y4qm2+q74zGW
	o5/2QAHLEfWwcMm6AmcjbbXVKj4BnUI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-ihXX9-59OFW61XEoNKBxJw-1; Mon, 23 Aug 2021 15:13:24 -0400
X-MC-Unique: ihXX9-59OFW61XEoNKBxJw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABDF3100806D;
	Mon, 23 Aug 2021 19:13:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 09BB960861;
	Mon, 23 Aug 2021 19:13:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 58CC14BB7C;
	Mon, 23 Aug 2021 19:13:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17NJDDdo010049 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 23 Aug 2021 15:13:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3039C202F31E; Mon, 23 Aug 2021 19:13:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B32B202F31C
	for <cluster-devel@redhat.com>; Mon, 23 Aug 2021 19:13:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AEF0518A01AC
	for <cluster-devel@redhat.com>; Mon, 23 Aug 2021 19:13:07 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
	[209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-188-nv306NY0PaSsRoPCBjhwAA-1; Mon, 23 Aug 2021 15:13:04 -0400
X-MC-Unique: nv306NY0PaSsRoPCBjhwAA-1
Received: by mail-wr1-f69.google.com with SMTP id
	a13-20020adfed0d000000b00156fd70137aso5115599wro.8
	for <cluster-devel@redhat.com>; Mon, 23 Aug 2021 12:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jhaMcYrw2lrnaBdCd+giUeZH7Ccr515F+el79Rmo7nk=;
	b=Bc9rsG06YBY6qTQxQdZMp8jp/zpGlWrv3jMff6l/jHd8pp8SbEd1PbuKwuZByyLiKu
	4ob2FvhFlZoZY75CJnJ3fVXL4VzKGkIUhJqLMCEwEVb+bOFCZznzCU67LUAEHhJubNMV
	HC2h3jilLxtkr7As3gihC6LdpCsW3S+YnBDgc41Tt2E3NS0Y45nULMjBClnnqiI7Ua8Z
	EifQ5A7xYsSoDcJ7n1CARQ/rK8xEbp9FgIh58hyGh3cLup7GJfzRid2EmuLXY4tSBkUH
	IMsVbta/xE6ziDbfZLvRWOsdZnDsfqx8jLNgs5wgyGulUxLdusRv76dJxNEtLAF8Cd1r
	uh5A==
X-Gm-Message-State: AOAM530ljXIlFJLDkFeLutZJg4MH/h6npU9EWIw8xlyXcU3wWBPKF5Tc
	r/jmyxxFNVl+l/g/WrewuKN9zEcVjX6QeuUuUTCz4wDEwGy08Igq84Lqiom380wmPYfXjAxQUNh
	TmhouHAgL39LR29Lg8AY3LvpvtdHVl3q5fZSJkw==
X-Received: by 2002:a5d:47a4:: with SMTP id 4mr7629136wrb.329.1629745983149;
	Mon, 23 Aug 2021 12:13:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOwVKSkOsp25StuMxS8Ul0aw4mKnHx9V9RP7lUqsGktvPh3lqSJ/b7aud/VYi5l7IjlqGElaqaSmdZHcnMVNk=
X-Received: by 2002:a5d:47a4:: with SMTP id 4mr7629112wrb.329.1629745982984;
	Mon, 23 Aug 2021 12:13:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210819194102.1491495-1-agruenba@redhat.com>
	<20210819194102.1491495-11-agruenba@redhat.com>
	<5e8a20a8d45043e88013c6004636eae5dadc9be3.camel@redhat.com>
	<cf284633-a9db-9f88-6b60-4377bc33e473@redhat.com>
	<CAHc6FU7EMOEU7C5ryu5pMMx1v+8CTAOMyGdf=wfaw8=TTA_btQ@mail.gmail.com>
	<8e2ab23b93c96248b7c253dc3ea2007f5244adee.camel@redhat.com>
	<CAHc6FU5uHJSXD+CQk3W9BfZmnBCd+fqHt4Bd+=uVH18rnYCPLg@mail.gmail.com>
	<YSPHR7EL/ujG0Of7@casper.infradead.org>
In-Reply-To: <YSPHR7EL/ujG0Of7@casper.infradead.org>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 23 Aug 2021 21:12:51 +0200
Message-ID: <CAHc6FU4Qay6v8gRQN_ZWz0AwtuOD-BH6+Ahkgimk0L4GkWLbrQ@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 23, 2021 at 6:06 PM Matthew Wilcox <willy@infradead.org> wrote:
> On Mon, Aug 23, 2021 at 05:18:12PM +0200, Andreas Gruenbacher wrote:
> > On Mon, Aug 23, 2021 at 10:14 AM Steven Whitehouse <swhiteho@redhat.com> wrote:
> > > If the goal here is just to allow the glock to be held for a longer
> > > period of time, but with occasional interruptions to prevent
> > > starvation, then we have a potential model for this. There is
> > > cond_resched_lock() which does this for spin locks.
> >
> > This isn't an appropriate model for what I'm trying to achieve here.
> > In the cond_resched case, we know at the time of the cond_resched call
> > whether or not we want to schedule. If we do, we want to drop the spin
> > lock, schedule, and then re-acquire the spin lock. In the case we're
> > looking at here, we want to fault in user pages. There is no way of
> > knowing beforehand if the glock we're currently holding will have to
> > be dropped to achieve that. In fact, it will almost never have to be
> > dropped. But if it does, we need to drop it straight away to allow the
> > conflicting locking request to succeed.
>
> It occurs to me that this is similar to the wound/wait mutexes
> (include/linux/ww_mutex.h & Documentation/locking/ww-mutex-design.rst).
> You want to mark the glock as woundable before faulting, and then discover
> if it was wounded after faulting.  Maybe sharing this terminology will
> aid in understanding?

I've looked at the ww_mutex documentation. A "transaction" wounds
another "transaction" and that other transaction then "dies", or it
"heals" and restarts. In the glock case, a process sets and clears the
HIF_MAY_DEMOTE flag on one of its own glock holder contexts. After
clearing the flag, it either still holds the glock or it doesn't;
nothing needs to be done to "die" or to "heal". So I'm not sure we
want to conflate two concepts.

One of the earlier terms we've used was "stealing", with a
HIF_MAY_STEAL flag. That works, but it's slightly less obvious what
happens to a glock holder when the glock is stolen from it. (The
holder gets dequeued, __gfs2_glock_dq.) The glock code already uses
the terms promote/demote, acquire/release, enqueue/dequeue, and
_nq/_dq for various forms of acquiring and releasing a glock, so we're
not in a shortage or names right now apparently.

Thanks,
Andreas

