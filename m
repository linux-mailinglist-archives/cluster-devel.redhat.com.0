Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 64B432FC0AD
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Jan 2021 21:14:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611087282;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=8TkMo+mkckZ7Wu1kMIRF9YBCR3axT/siRqTK6s4mfU0=;
	b=WcB4U1Uob9RoKI7RqQPYhu4gCAkUM0OIp+h5Jv/zLyOCwPZrGoYiU1HorsDyc2c4XJUbg1
	cNQtlhQxvyTup6Gbp5uQ7FRONw/W/X6jLcAeBOi2ioQsLhVNScJSBHJvQuzVt+jj1fTMEp
	4Q0J1XDlMe3PjN2rk3kiiZuTObfOjEE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-rHM5I0VIM3a7s95vXeN4KQ-1; Tue, 19 Jan 2021 15:14:40 -0500
X-MC-Unique: rHM5I0VIM3a7s95vXeN4KQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D4EB800D53;
	Tue, 19 Jan 2021 20:14:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C3845D6AD;
	Tue, 19 Jan 2021 20:14:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 03C154BB7B;
	Tue, 19 Jan 2021 20:14:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10JKERUO026011 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 19 Jan 2021 15:14:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E49D0A9F34; Tue, 19 Jan 2021 20:14:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DFB49A9F30
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 20:14:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B12F0858EEC
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 20:14:24 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
	[209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-436-3fwHN1LSNSWaD4Zfl_bZtw-1; Tue, 19 Jan 2021 15:14:23 -0500
X-MC-Unique: 3fwHN1LSNSWaD4Zfl_bZtw-1
Received: by mail-wm1-f71.google.com with SMTP id r1so371009wmn.8
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 12:14:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8TkMo+mkckZ7Wu1kMIRF9YBCR3axT/siRqTK6s4mfU0=;
	b=C851cshlpqyyUhvBpVn3zhtWNHJg0CsrlnWp+NP/CJvfgD2rsU9UhNNCCZ5NmwCzjC
	vlu408pjRXHuoVV3X6HNq0X2YKUpTwjOm7rmvnTufEDXcQnS3SdqeNLXLTBPiGLGIgTb
	chIXqF3ocEsF9Iuo5+7RvMKl99IZtkbAZudnlOCQI2z6z36xg2aeM+99Vp/SxjBCMXQA
	prLAnvte7X8afZgD0MntrO97FE9lFjCq147uAFLfl5rLzF4c8dIrtXntvvOOaSAeje1h
	EBfh2rFy3cWL5xGQdxk/DTJQzGbgA6DGck7O9J2ztFVCtkBj84nmbfrY/f7sAXSTk+vG
	vMjQ==
X-Gm-Message-State: AOAM53091tEZSqPsW+BLwBOedhpY/7klLErO7oE5QaQRKEEssWd+u5SI
	XH+WLgRWztOHazRTLDkM5gNqUD2EA0m1Ktb59Bf5qOa4w4Dt5mu7Q8eT1HarSDOGmFMEFV1FVw3
	OywQEUTAeheGp3JHzumXjPGH6SavOZYvQkUZWrg==
X-Received: by 2002:a05:600c:4ec6:: with SMTP id
	g6mr1227950wmq.2.1611087261633; 
	Tue, 19 Jan 2021 12:14:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFxWJxu0KZYv8F9UYdat794fpbz7fUgmlW0n8Uq+mfvjlj0FJPWlRqVjW6QzY8vVsMFBmvPxFb5Yai9wTe9g8=
X-Received: by 2002:a05:600c:4ec6:: with SMTP id
	g6mr1227940wmq.2.1611087261410; 
	Tue, 19 Jan 2021 12:14:21 -0800 (PST)
MIME-Version: 1.0
References: <2125295377.38904313.1608669538740.JavaMail.zimbra@redhat.com>
	<51252ca2-fa56-acb8-24cf-fb2e992f76de@redhat.com>
	<561946972.42407585.1609776564024.JavaMail.zimbra@redhat.com>
	<CAHc6FU7T5RzFhPWF_YbZY9a7+goVTPKrOybh46e12xe6zhL99Q@mail.gmail.com>
	<1287886465.45164472.1611071084974.JavaMail.zimbra@redhat.com>
	<CAHc6FU6sNa5CA1Q9deyuVhBA7RohHhb59m6PZ3-EMFueW6W6kg@mail.gmail.com>
	<1238899263.45200782.1611080322302.JavaMail.zimbra@redhat.com>
In-Reply-To: <1238899263.45200782.1611080322302.JavaMail.zimbra@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 19 Jan 2021 21:14:10 +0100
Message-ID: <CAHc6FU4Q52thggDKTA3Z7dJG1Viu=YgyQa05jCrtjo+_pvxhuw@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH] gfs2: make recovery workqueue
 operate on a gfs2 mount point, not journal
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 19, 2021 at 7:18 PM Bob Peterson <rpeterso@redhat.com> wrote:
> ----- Original Message -----
> > On Tue, Jan 19, 2021 at 4:44 PM Bob Peterson <rpeterso@redhat.com> wrote:
> > > Sure, the recovery workers' bio allocations and submitting may be
> > > serialized,
> > > but that's where it ends. The recovery workers don't prevent races with
> > > each
> > > other when using the variable common to all of them: sdp->sd_log_bio.
> > > This is the case when there are, for example, 5 journals with 5 different
> > > recovery workers, all trying to use the same sdp->sd_log_bio at the same
> > > time.
> >
> > Well, sdp->sd_log_bio obviously needs to be moved to a per-journal context.
>
> I tried that and it didn't end well. If we keep multiple bio pointers, each
> recovery worker still needs to make sure all the other bios are submitted
> before allocating a new one. Sure, it could make sure _its_ previous bio was
> submitted, and the others would be serialized, but there are cases in which
> they can run out of bios. Yes, I saw this.

This doesn't make sense. If you've seen starvation, it must have been
for another reason.

> This can happen, for example,
> when you have 60 gfs2 mounts times 5 nodes, with lots of workers requesting
> lots of bios at the same time. Unless, of course, we allocate unique bio_sets
> that get their own slabs, etc. We can introduce spinlock locking or something
> to manage this, but when I tried it, I found multiple scenarios that deadlock.
> It gets ugly really fast.

As long as each worker makes sure it doesn't allocate another bio
before submitting its previous bio, it doesn't matter how many workers
there are or what state they're in. They will still make progress as
long as they can allocate at least one bio overall.

> In practice, when multiple nodes in a cluster go down, their journals are
> recovered by several of the remaining cluster nodes, which means they happen
> simultaneously anyway, and pretty quickly. In my case, I've got 5 nodes and
> 2 of them get shot, so the remaining 3 nodes do the journal recovery, and
> I've never seen them conflict with one another. Their glocks seem to distribute
> the work well.
>
> The only time you're really going to see multiple journals recovered by the
> same node (for the same file systems anyway) is when the cluster loses quorum.
> Then when quorum is regained, there is often a burst of requests to recover
> multiple journals on the same few nodes. Then the same node often tries to
> recover several journals for several file systems.
>
> So the circumstances are unusual to begin with. But also very recreatable.
>
> What's wrong with a single worker that handles them all? What's your actual
> concern with doing it this way? Is it performance? Who cares if journal
> recovery takes 1.4 seconds rather than 1.2 seconds?

It was Steve who questioned if serializing recovery in that way was a
reasonable change. I don't know if recovering multiple journals on the
same node in parallel is very useful. But I also don't buy your bio
starvation argument.

Thanks,
Andreas

