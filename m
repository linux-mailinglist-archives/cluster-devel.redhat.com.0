Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 863E135CA01
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Apr 2021 17:35:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618241755;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=ewmXPFSLxjGv26g7aAQAaOA903AC+9P2sCTSs4VwiBQ=;
	b=fj0R3DmPiX8Y3CNXZgXaFwWY9wDAObypokx+dZMl07TLQcuAlgUEABoZlDe575OdZgzRiW
	bVi05KL0DU//Qi/eYgAlldx00ilWDX33PRyRIo6Gnr0i0xqP3IwnQOJ5XYTWEOiwwARSbc
	WaNPisvvdxj62kzgC5GOWZo7hcPe+I0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-HxUjW1d9PlaWclZbGGcVfQ-1; Mon, 12 Apr 2021 11:35:52 -0400
X-MC-Unique: HxUjW1d9PlaWclZbGGcVfQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2143E10054F6;
	Mon, 12 Apr 2021 15:35:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB49319726;
	Mon, 12 Apr 2021 15:35:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C49DA44A6A;
	Mon, 12 Apr 2021 15:35:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13CFZl9n000389 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 12 Apr 2021 11:35:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E1F5221E20E2; Mon, 12 Apr 2021 15:35:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D760921E20E6
	for <cluster-devel@redhat.com>; Mon, 12 Apr 2021 15:35:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A4F1100DE77
	for <cluster-devel@redhat.com>; Mon, 12 Apr 2021 15:35:44 +0000 (UTC)
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
	[209.85.166.200]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-560-qfGR4RHGPgKESuqZhkxXhA-1; Mon, 12 Apr 2021 11:35:42 -0400
X-MC-Unique: qfGR4RHGPgKESuqZhkxXhA-1
Received: by mail-il1-f200.google.com with SMTP id h1so4793907ils.16
	for <cluster-devel@redhat.com>; Mon, 12 Apr 2021 08:35:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ewmXPFSLxjGv26g7aAQAaOA903AC+9P2sCTSs4VwiBQ=;
	b=XgL99PseCp3H1nu29beOCNP4s6mIu60KjoGF376M8KP1iEktjR0XfNtjvxfsJYWulB
	KGoegIvPBavN0szrCB8dqb/uzDJZONuJjk52mKExh4pp8jhOl6sEDKc8RKqkJHbuwccc
	k/1FZPEEDXAPbaHsC3M+wtElXgFvd2+OO9RE6TQdQ7MeDypznRw5PSVxerZHVJbIpE17
	RKgpKiUv0T8BXch/+kALAEarKCAzKniEAR/xwVyFEs4NgZs4mpaR2Or6Ctch+3IRH/Oc
	VR/WOO8J2zEkdbJCAXeguI4/2myoByHYgZjIpk+ItESmGa60IkpziLgt3Up1YKaiQA2G
	WF0Q==
X-Gm-Message-State: AOAM5334hdEJCqwZPdxEADUb0ZqCrU1LGshskmowTK4aYDxCAfewy+kc
	ELKfyE9zqTXMrX5iBQRm9qldL7A/XR0qbU4qKSd+wtnNd/mCRUHXl7+ngtYATlp4Rq8xDoQ5xvZ
	vIOrik8iWmSSi2SgSGbNTT7Jw2hy+YMGxVKKMTQ==
X-Received: by 2002:a05:6e02:501:: with SMTP id
	d1mr17134169ils.76.1618241741845; 
	Mon, 12 Apr 2021 08:35:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWMREBF90GrIm7d8eQk1E82lIXhg8fB77eEDz5CM0TEan/N5M1J2tesORAwqjnqn23gYP98HqNyzDA2Y1fKXg=
X-Received: by 2002:a05:6e02:501:: with SMTP id
	d1mr17134158ils.76.1618241741711; 
	Mon, 12 Apr 2021 08:35:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210326173337.44231-1-aahringo@redhat.com>
	<20210326173337.44231-8-aahringo@redhat.com>
	<20210402205351.GA24027@linux-2.home>
	<CAK-6q+hnj94xQS+QceDF3GyDR78ns61-T1UVLs7o6kJsPzT=Fw@mail.gmail.com>
	<CAK-6q+giMt8HUg5jY0msrKGazUeRnGNqC6nNPqNa2Mca8NRCuQ@mail.gmail.com>
	<CAK-6q+i5YmXV_NkwCGerPfNTjCE=or626Refuz_7CQDRhrJj1A@mail.gmail.com>
	<20210409211107.GD30244@linux-2.home>
In-Reply-To: <20210409211107.GD30244@linux-2.home>
From: Alexander Ahring Oder Aring <aahringo@redhat.com>
Date: Mon, 12 Apr 2021 11:35:30 -0400
Message-ID: <CAK-6q+iECeLw-zoWzGgo7AQpdQsBz_j39GMOVZakmZRN4jBrnw@mail.gmail.com>
To: Guillaume Nault <gnault@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [Cluster-devel] [PATCHv3 dlm/next 7/8] fs: dlm: add reliable
	connection if reconnect
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

Hi,

On Fri, Apr 9, 2021 at 5:11 PM Guillaume Nault <gnault@redhat.com> wrote:
>
> On Mon, Apr 05, 2021 at 04:29:10PM -0400, Alexander Ahring Oder Aring wrote:
> > Hi,
> >
> > On Mon, Apr 5, 2021 at 1:33 PM Alexander Ahring Oder Aring
> > <aahringo@redhat.com> wrote:
> > >
> > > Hi,
> > >
> > > On Sat, Apr 3, 2021 at 11:34 AM Alexander Ahring Oder Aring
> > > <aahringo@redhat.com> wrote:
> > > >
> > > ...
> > > >
> > > > > It seems to me that the only time DLM might need to retransmit data, is
> > > > > when recovering from a connection failure. So why can't we just resend
> > > > > unacknowledged data at reconnection time? That'd probably simplify the
> > > > > code a lot (no need to maintain a retransmission timeout on TX, no need
> > > > > to handle sequence numbers that are in the future on RX).
> > > > >
> > > >
> > > > I can try to remove the timer, timeout and do the above approach to
> > > > retransmit at reconnect. Then I test it again and I will report back
> > > > to see if it works or why we have other problems.
> > > >
> > >
> > > I have an implementation of this running and so far I don't see any problems.
> >
> > There is a problem but it's related to the behaviour how reconnections
> > are triggered. The whole communication can be stuck because the send()
> > triggers a reconnection if not connected anymore. Before, the timer
> > was triggering some send() and this was triggering a reconnection in a
> > periodic way. Therefore we never had any stuck situation where nobody
> > was sending anything anymore. It's a rare case but I am currently
> > running into it. However I think I need to change how the
> > reconnections are triggered with some "forever periodic try" which
> > should solve this issue.
>
> Would it be sufficient to detect socket errors to avoid this problem?
> For example by letting lowcomms_error_report() do the reconnection when
> necessary?

I have something like that as a patch for afterwards, it also contains
some change in the lowcomms workqueue handling and removal of the
"othercon" race paradigm. There are sometimes two connections
established because of a race which I mentioned in midcomms as well
for version detection. In short every node wants to connect
immediately after the cluster manager reports membership to the kernel
dlm implementation. However I ignored that problem of reconnection for
now as it occurs never/rarely but I think it's still there.

Thanks for your review.

- Alex

