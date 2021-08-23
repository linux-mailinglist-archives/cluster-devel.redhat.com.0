Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 790203F4D36
	for <lists+cluster-devel@lfdr.de>; Mon, 23 Aug 2021 17:18:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629731924;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=8UQPHdxCvb0Ewfa1Oz5Y/LDOGEQHYeTGsDvKMf5nPfA=;
	b=UHKcUyGcxmeTBcH/LdmokrL5Ftkejjkis4FT9+0ej2GMDWrnLFX+HxEeABNyolNZ6lbQj8
	oFe0A0vPKW/+oNSluMpUmODNMlFUPhbiwBDxuOqA1rqWy+ATF33cHqngJsMFv+cOGPge/2
	MAptQU0C+BrnygkKI7+Yg64C0MB5yRc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-hdGUqsfyOa2WIj7M4QmgNA-1; Mon, 23 Aug 2021 11:18:43 -0400
X-MC-Unique: hdGUqsfyOa2WIj7M4QmgNA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA070108292D;
	Mon, 23 Aug 2021 15:18:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 55EB460C82;
	Mon, 23 Aug 2021 15:18:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3EB964A7C8;
	Mon, 23 Aug 2021 15:18:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17NFIUj0022975 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 23 Aug 2021 11:18:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 82FF3202F303; Mon, 23 Aug 2021 15:18:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C90A202F300
	for <cluster-devel@redhat.com>; Mon, 23 Aug 2021 15:18:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3989680100E
	for <cluster-devel@redhat.com>; Mon, 23 Aug 2021 15:18:27 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
	[209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-510-Ic3Egwk4NIi8XY2ukNmaYQ-1; Mon, 23 Aug 2021 11:18:25 -0400
X-MC-Unique: Ic3Egwk4NIi8XY2ukNmaYQ-1
Received: by mail-wm1-f72.google.com with SMTP id
	m22-20020a7bca56000000b002e7508f3faeso544537wml.2
	for <cluster-devel@redhat.com>; Mon, 23 Aug 2021 08:18:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8UQPHdxCvb0Ewfa1Oz5Y/LDOGEQHYeTGsDvKMf5nPfA=;
	b=KUIVvU7AzS2pgzJmIeb9lq/iCRoB+AUao86alTfejHaLA+8ZYZxq97w/3IUMeScyDH
	hNp0CB8eOoqwtFdWXaO/X6w6krWNyTZ+hZxK49WthxdJRQFtxNpFtwPZCSdNN1Ze9IAL
	ATVpZNClpg28mchTc1Ywu2OMyGaLqcTGvbZ0r9P+aSxP/H5tV59LvSKUGeQ9dM2M7IGs
	lZgv4XEBQpLMoVfrZq3a2h/wD90K7g2BidVM+e+fs9PX1kCJgvFF7zb2hpEp71//Wnm1
	NH1xPSMNvK1T+l8Cegr5uYu1wMY6m/xn3c7bRIuGKN4ibBIcm+y9d3BK+s/ZfyFh+gua
	K/Vg==
X-Gm-Message-State: AOAM5303zhWXq8SnsPwuip6VlJbgVXSAzIthBV21NOqcBAOfGxm6Z+ZQ
	DjI0I5B0qv5WM1xZrql0vOk8F2hSqHEfJGruFKyvnvN6kGPhg/MHOj55efN4A3owt9Rh6B78J/4
	aLDaaKYzx2Z6KLEUMXOpYUFmv7Lxv+TLkrug1/A==
X-Received: by 2002:a5d:47a4:: with SMTP id 4mr6615043wrb.329.1629731904223;
	Mon, 23 Aug 2021 08:18:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyP18KupeQocqPi7pOs/GkS6DYQwd2BMjtkeQW4SttZsY2aCuhDw4kt4ORRQF7kvquqp7Y+qyQBLWafEIaQ/7o=
X-Received: by 2002:a5d:47a4:: with SMTP id 4mr6615019wrb.329.1629731904039;
	Mon, 23 Aug 2021 08:18:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210819194102.1491495-1-agruenba@redhat.com>
	<20210819194102.1491495-11-agruenba@redhat.com>
	<5e8a20a8d45043e88013c6004636eae5dadc9be3.camel@redhat.com>
	<cf284633-a9db-9f88-6b60-4377bc33e473@redhat.com>
	<CAHc6FU7EMOEU7C5ryu5pMMx1v+8CTAOMyGdf=wfaw8=TTA_btQ@mail.gmail.com>
	<8e2ab23b93c96248b7c253dc3ea2007f5244adee.camel@redhat.com>
In-Reply-To: <8e2ab23b93c96248b7c253dc3ea2007f5244adee.camel@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 23 Aug 2021 17:18:12 +0200
Message-ID: <CAHc6FU5uHJSXD+CQk3W9BfZmnBCd+fqHt4Bd+=uVH18rnYCPLg@mail.gmail.com>
To: Steven Whitehouse <swhiteho@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 23, 2021 at 10:14 AM Steven Whitehouse <swhiteho@redhat.com> wrote:
> On Fri, 2021-08-20 at 17:22 +0200, Andreas Gruenbacher wrote:
> > On Fri, Aug 20, 2021 at 3:11 PM Bob Peterson <rpeterso@redhat.com>
> > wrote:
> > >
> [snip]
> > >
> > > You can almost think of this as a performance enhancement. This
> > > concept
> > > allows a process to hold a glock for much longer periods of time,
> > > at a
> > > lower priority, for example, when gfs2_file_read_iter needs to hold
> > > the
> > > glock for very long-running iterative reads.
> >
> > Consider a process that allocates a somewhat large buffer and reads
> > into it in chunks that are not page aligned. The buffer initially
> > won't be faulted in, so we fault in the first chunk and write into
> > it.
> > Then, when reading the second chunk, we find that the first page of
> > the second chunk is already present. We fill it, set the
> > HIF_MAY_DEMOTE flag, fault in more pages, and clear the
> > HIF_MAY_DEMOTE
> > flag. If we then still have the glock (which is very likely), we
> > resume the read. Otherwise, we return a short result.
> >
> > Thanks,
> > Andreas
> >
>
> If the goal here is just to allow the glock to be held for a longer
> period of time, but with occasional interruptions to prevent
> starvation, then we have a potential model for this. There is
> cond_resched_lock() which does this for spin locks.

This isn't an appropriate model for what I'm trying to achieve here.
In the cond_resched case, we know at the time of the cond_resched call
whether or not we want to schedule. If we do, we want to drop the spin
lock, schedule, and then re-acquire the spin lock. In the case we're
looking at here, we want to fault in user pages. There is no way of
knowing beforehand if the glock we're currently holding will have to
be dropped to achieve that. In fact, it will almost never have to be
dropped. But if it does, we need to drop it straight away to allow the
conflicting locking request to succeed.

Have a look at how the patch queue uses gfs2_holder_allow_demote() and
gfs2_holder_disallow_demote():

https://listman.redhat.com/archives/cluster-devel/2021-August/msg00128.html
https://listman.redhat.com/archives/cluster-devel/2021-August/msg00134.html

Thanks,
Andreas

