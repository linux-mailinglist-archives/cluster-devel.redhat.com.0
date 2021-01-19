Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id D51F62FBEC1
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Jan 2021 19:18:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611080337;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=be21ClGVrQV0tyylME9XePm45VCUG7NI1T3K6DtgVrA=;
	b=MWcGZCOMW4Isi3zpDfcm1A8CkfHbqYwRY79qpqFc3+gOjeIQvBTbPRLxONPxobuT+j9LR6
	ucBKy0vv8eLoEB367AX47gtJA8YT5nZXV8Y4c/ViK3qNFvNwxZEE/5+QD74yXQjvWHbMk2
	ImKn/H1uT9k9UXtBqMF0ZeMrHQ5PsFw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-xGRdZV5JNl6Cgt1E8rF5rg-1; Tue, 19 Jan 2021 13:18:55 -0500
X-MC-Unique: xGRdZV5JNl6Cgt1E8rF5rg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7ABB80DDE0;
	Tue, 19 Jan 2021 18:18:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 38F4160C69;
	Tue, 19 Jan 2021 18:18:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 201F14A7C6;
	Tue, 19 Jan 2021 18:18:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10JIIlGm013926 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 19 Jan 2021 13:18:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 89A8262A25; Tue, 19 Jan 2021 18:18:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C15425D6AD;
	Tue, 19 Jan 2021 18:18:44 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B844D18095FF;
	Tue, 19 Jan 2021 18:18:44 +0000 (UTC)
Date: Tue, 19 Jan 2021 13:18:42 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <1238899263.45200782.1611080322302.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAHc6FU6sNa5CA1Q9deyuVhBA7RohHhb59m6PZ3-EMFueW6W6kg@mail.gmail.com>
References: <2125295377.38904313.1608669538740.JavaMail.zimbra@redhat.com>
	<51252ca2-fa56-acb8-24cf-fb2e992f76de@redhat.com>
	<561946972.42407585.1609776564024.JavaMail.zimbra@redhat.com>
	<CAHc6FU7T5RzFhPWF_YbZY9a7+goVTPKrOybh46e12xe6zhL99Q@mail.gmail.com>
	<1287886465.45164472.1611071084974.JavaMail.zimbra@redhat.com>
	<CAHc6FU6sNa5CA1Q9deyuVhBA7RohHhb59m6PZ3-EMFueW6W6kg@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.113.58, 10.4.195.7]
Thread-Topic: gfs2: make recovery workqueue operate on a gfs2 mount point,
	not journal
Thread-Index: Wt4t6I1VNsaS9JnejtKL1EAza795kA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- Original Message -----
> On Tue, Jan 19, 2021 at 4:44 PM Bob Peterson <rpeterso@redhat.com> wrote:
> > Sure, the recovery workers' bio allocations and submitting may be
> > serialized,
> > but that's where it ends. The recovery workers don't prevent races with
> > each
> > other when using the variable common to all of them: sdp->sd_log_bio.
> > This is the case when there are, for example, 5 journals with 5 different
> > recovery workers, all trying to use the same sdp->sd_log_bio at the same
> > time.
> 
> Well, sdp->sd_log_bio obviously needs to be moved to a per-journal context.

I tried that and it didn't end well. If we keep multiple bio pointers, each
recovery worker still needs to make sure all the other bios are submitted
before allocating a new one. Sure, it could make sure _its_ previous bio was
submitted, and the others would be serialized, but there are cases in which
they can run out of bios. Yes, I saw this. This can happen, for example,
when you have 60 gfs2 mounts times 5 nodes, with lots of workers requesting
lots of bios at the same time. Unless, of course, we allocate unique bio_sets
that get their own slabs, etc. We can introduce spinlock locking or something
to manage this, but when I tried it, I found multiple scenarios that deadlock.
It gets ugly really fast.

In practice, when multiple nodes in a cluster go down, their journals are
recovered by several of the remaining cluster nodes, which means they happen
simultaneously anyway, and pretty quickly. In my case, I've got 5 nodes and
2 of them get shot, so the remaining 3 nodes do the journal recovery, and
I've never seen them conflict with one another. Their glocks seem to distribute
the work well.

The only time you're really going to see multiple journals recovered by the
same node (for the same file systems anyway) is when the cluster loses quorum.
Then when quorum is regained, there is often a burst of requests to recover
multiple journals on the same few nodes. Then the same node often tries to
recover several journals for several file systems.

So the circumstances are unusual to begin with. But also very recreatable.

What's wrong with a single worker that handles them all? What's your actual
concern with doing it this way? Is it performance? Who cares if journal
recovery takes 1.4 seconds rather than 1.2 seconds?

Bob

