Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9DBF82FBB7F
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Jan 2021 16:44:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611071098;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=80x1csBFwNtkmCWUd4KyC9/q+B70WnfdzVOGDSlYK70=;
	b=g3KeJIK0TfjSoLt2Tdhkv6o0YbdPix+nqdxVF4+hUuXsd8bvwWQGMY6CQotjwtlk4hzemo
	2cpEbmviYpoXFiexbgQbtSFS8DJuIk3Dc9m5CM980B/KBaGgxDl80piGXKeHLDaQhahI4L
	lRxAWt9Q0WkrOJADegWZUX7bQP2+8WI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-zISL2WfoMu2Newo8FkmfFg-1; Tue, 19 Jan 2021 10:44:57 -0500
X-MC-Unique: zISL2WfoMu2Newo8FkmfFg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4ED16CE646;
	Tue, 19 Jan 2021 15:44:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B3A7B5DA2E;
	Tue, 19 Jan 2021 15:44:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E6A504A7C6;
	Tue, 19 Jan 2021 15:44:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10JFioLj029035 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 19 Jan 2021 10:44:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EBA9119C84; Tue, 19 Jan 2021 15:44:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C63099CA0;
	Tue, 19 Jan 2021 15:44:47 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BB89F18095FF;
	Tue, 19 Jan 2021 15:44:47 +0000 (UTC)
Date: Tue, 19 Jan 2021 10:44:44 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <1287886465.45164472.1611071084974.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAHc6FU7T5RzFhPWF_YbZY9a7+goVTPKrOybh46e12xe6zhL99Q@mail.gmail.com>
References: <2125295377.38904313.1608669538740.JavaMail.zimbra@redhat.com>
	<51252ca2-fa56-acb8-24cf-fb2e992f76de@redhat.com>
	<561946972.42407585.1609776564024.JavaMail.zimbra@redhat.com>
	<CAHc6FU7T5RzFhPWF_YbZY9a7+goVTPKrOybh46e12xe6zhL99Q@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.113.58, 10.4.195.15]
Thread-Topic: gfs2: make recovery workqueue operate on a gfs2 mount point,
	not journal
Thread-Index: wjHCEkdlDsn86Y/b8voEh3y+fqFwIQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- Original Message -----
> On Mon, Jan 4, 2021 at 5:09 PM Bob Peterson <rpeterso@redhat.com> wrote:
> >
> > Hi,
> >
> > ----- Original Message -----
> > > Hi,
> > >
> > > On 22/12/2020 20:38, Bob Peterson wrote:
> > > > Hi,
> > > >
> > > > Before this patch, journal recovery was done by a workqueue function
> > > > that
> > > > operated on a per-journal basis. The problem is, these could run
> > > > simultaneously
> > > > which meant that they could all use the same bio, sd_log_bio, to do
> > > > their
> > > > writing to all the various journals. These operations overwrote one
> > > > another
> > > > eventually causing memory corruption.
> > >
> > > Why not just add more bios so that this issue goes away? It would make
> > > more sense than preventing recovery from running in parallel. In general
> > > recovery should be spread amoung nodes anyway, so the case of having
> > > multiple recoveries running on the same node in parallel should be
> > > fairly rare too,
> > >
> > > Steve.
> >
> > As I understand it, if we allocate a bio from the same bio_set (as
> > bio_alloc does)
> > we need to submit the previous bio before getting the next one, which means
> > recovery processes cannot work in parallel, even if they use different bio
> > pointers.
> 
> Each recovery worker submits the current bio before allocating the
> next, so in the worst possible case, the recovery workers will end up
> getting serialized (that is, they will sleep in bio_alloc until they
> get their turn).
> 
> Andreas

Sure, the recovery workers' bio allocations and submitting may be serialized,
but that's where it ends. The recovery workers don't prevent races with each
other when using the variable common to all of them: sdp->sd_log_bio.
This is the case when there are, for example, 5 journals with 5 different
recovery workers, all trying to use the same sdp->sd_log_bio at the same time.
My choices were between using 5 different pointers or 1 single point of use.
I chose the latter. If you like, I can temporarily revert the patch and try
to somehow prove this is what happens, but it seems like a waste of time.
The patch made the problem go away.

Bob

