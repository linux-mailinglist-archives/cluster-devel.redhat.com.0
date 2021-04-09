Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id A3E9E35A7E2
	for <lists+cluster-devel@lfdr.de>; Fri,  9 Apr 2021 22:33:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618000400;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Uzkj9TViJhmMqE2Lk1qpYMTS1248BwH3ua2KmRS1QXE=;
	b=e+NLnyYDrsto/iVO4ZygZlcUC82ki3A7vFzsEm7KUrFmhwghGjDC4MWEj8RzQnFLjwSjnY
	/zQwAX6JGD7/hv/kcbLRvzeTFMBsmsDCrwhjfwEFhbdQl6H6s+y+mMZB7/ZvWmIaHrCf/j
	r/fXA8ecUh6CXDv8V8dxM49n7zepdKs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-vCi9MyAGOP6ugT1K9OU8IA-1; Fri, 09 Apr 2021 16:33:18 -0400
X-MC-Unique: vCi9MyAGOP6ugT1K9OU8IA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7D0C69731;
	Fri,  9 Apr 2021 20:33:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B1E55D9E3;
	Fri,  9 Apr 2021 20:33:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8524C5533E;
	Fri,  9 Apr 2021 20:33:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 139KWUgf027533 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 9 Apr 2021 16:32:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 50C8A219B899; Fri,  9 Apr 2021 20:32:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BB73219B89D
	for <cluster-devel@redhat.com>; Fri,  9 Apr 2021 20:32:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7815A800883
	for <cluster-devel@redhat.com>; Fri,  9 Apr 2021 20:32:27 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
	[209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-195-p-qkn8_-P4CVEm7rWsO2vg-1; Fri, 09 Apr 2021 16:32:25 -0400
X-MC-Unique: p-qkn8_-P4CVEm7rWsO2vg-1
Received: by mail-wr1-f71.google.com with SMTP id a15so2739203wrf.19
	for <cluster-devel@redhat.com>; Fri, 09 Apr 2021 13:32:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=Uzkj9TViJhmMqE2Lk1qpYMTS1248BwH3ua2KmRS1QXE=;
	b=Mn+RJczJVans+axLWjvBDbYxZp14eklAEzUyj+3lN2C4BTUrgPeCnX4SaNftOsDaiG
	WQ2UYMBlydgBalUkxilYpIoYIYJAhzOIJIPA+h4BXwRKu8DAocLQC9Z0BmhsJoUuTCeq
	MSulb9f2QVgyirH3yR+BHl5yXhbbTuYK0J7sO0P6wIAHznLx5d/R6uRgp73H6OZ7drAh
	cH7tmrWlDVu32F/Rq2P/c3qDtHuKObLqeKprxyWyUZWIX1zoCjeFGgFkRMQ8/ExtXit3
	WjTX/LU0j6THInXE2xipOZ0kgYwiIkOL9bsCMv1BiaeP3fxahNNv7MtYOnlw8pPhD4vN
	cTdQ==
X-Gm-Message-State: AOAM532YPe1hgCXTrXLSVFGpBiRaIpmX/E9qjbZ/uC0pcMOeujUkVlZf
	F7Pcn1fvE1NkywKHfAwhLjIX6Vh7NE4jerrR5J8IDjqXBg/xWRQmqxTrGXV1laVy/Gb8YI9jzeK
	yefmCwRlonakFCAC+rkZEpg==
X-Received: by 2002:a5d:6b82:: with SMTP id n2mr18951368wrx.399.1618000344675; 
	Fri, 09 Apr 2021 13:32:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyN2q8Vkto7Onzjl0frPUZUNU5gPDWqOXaD5Dy3aZ+JnjpV0ZtynccJR2zcyVGWUISJE5GWpQ==
X-Received: by 2002:a5d:6b82:: with SMTP id n2mr18951352wrx.399.1618000344430; 
	Fri, 09 Apr 2021 13:32:24 -0700 (PDT)
Received: from linux-2.home
	(2a01cb058918ce00dd1a5a4f9908f2d5.ipv6.abo.wanadoo.fr.
	[2a01:cb05:8918:ce00:dd1a:5a4f:9908:f2d5])
	by smtp.gmail.com with ESMTPSA id
	c18sm2501513wrn.92.2021.04.09.13.32.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 09 Apr 2021 13:32:23 -0700 (PDT)
Date: Fri, 9 Apr 2021 22:32:21 +0200
From: Guillaume Nault <gnault@redhat.com>
To: Alexander Ahring Oder Aring <aahringo@redhat.com>
Message-ID: <20210409203221.GB30244@linux-2.home>
References: <20210326173337.44231-1-aahringo@redhat.com>
	<20210326173337.44231-8-aahringo@redhat.com>
	<20210402205351.GA24027@linux-2.home>
	<CAK-6q+hnj94xQS+QceDF3GyDR78ns61-T1UVLs7o6kJsPzT=Fw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK-6q+hnj94xQS+QceDF3GyDR78ns61-T1UVLs7o6kJsPzT=Fw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Apr 03, 2021 at 11:34:33AM -0400, Alexander Ahring Oder Aring wrote:
> Hi Guillaume,
> 
> On Fri, Apr 2, 2021 at 4:54 PM Guillaume Nault <gnault@redhat.com> wrote:
> >
> > On Fri, Mar 26, 2021 at 01:33:36PM -0400, Alexander Aring wrote:
> > > This patch introduce to make a tcp lowcomms connection reliable even if
> > > reconnects occurs. This is done by an application layer re-transmission
> > > handling and sequence numbers in dlm protocols. There are three new dlm
> > > commands:
> > >
> > > DLM_OPTS:
> > >
> > > This will encapsulate an existing dlm message (and rcom message if they
> > > don't have an own application side re-transmission handling). As optional
> > > handling additional tlv's (type length fields) can be appended. This can
> > > be for example a sequence number field. However because in DLM_OPTS the
> > > lockspace field is unused and a sequence number is a mandatory field it
> > > isn't made as a tlv and we put the sequence number inside the lockspace
> > > id. The possibility to add optional options are still there for future
> > > purposes.
> > >
> > > DLM_ACK:
> > >
> > > Just a dlm header to acknowledge the receive of a DLM_OPTS message to
> > > it's sender.
> > >
> > > DLM_FIN:
> > >
> > > A new DLM message to synchronize pending message to the other dlm end if
> > > the node want to disconnects. Each side waits until it receives this
> > > message and disconnects. It's important that this message has nothing to
> > > do with the application logic because it might run in a timeout if
> > > acknowledge messages are dropped. The problem which we try to solve with
> > > DLM_FIN is that the node membership is handled by corosync and not the
> > > kernel dlm protocol itself, DLM_FIN tries to synchronize the kernel dlm
> > > protocol with corosync join/leave membership callbacks.
> >
> > If I understand correctly, currently, when DLM faces a hard but
> > temporary connection failure (like receiving a stray TCP RST), it
> > automatically recreates a new connection. However, the in-flight data
> > of the previous connection are lost. The problem is that such data loss
> > can turn the participating nodes into inconsistent states.
> >
> > Therefore this patch series implements sequence number tracking at the
> > application level, so that a new connection can retransmit
> > unacknowledged data from the previous, failed, connection.
> >
> > Is that an accurate summary or is there anything I've missed?
> >
> 
> Yes, there is one thing missing. I detected a synchronization issue
> because the node membership of a lockspace is done by a different
> protocol handled in user space. This protocol declares the actual peer
> of the DLM protocol. In short, there are two protocols here, whereas
> one handles the membership of peers and the other handles the actual
> operations. There is a missing synchronization between operations and
> membership which I solved with a DLM_FIN message.

Thanks, I'll re-read the parts about DLM_FIN with this explanation in
mind.

> > I feel that this patch goes very far into re-implementing TCP-like
> > features. For example, why is fast-retransmit even needed? DLM seems to
> > always uses a transport protocol that guarantees reliable and in order
> > delivery. Therefore, duplicate DLM acknowledgements can't happen on an
> > established connection. Even when reconnecting, it'd be the sender's
> > responsibility to resend the last unackowledged data first. How could
> > this lead to holes in the DLM sequence numbers on the receiver's side?
> >
> 
> I agree it's a TCP re-implementation on the application layer.
> 
> Fast-retransmit is not needed as it is not needed in TCP. However it
> solves drops faster, in DLM and GFS2 you would experience a stuck in
> some filesystem syscalls until the drop is resolved.

I was not talking about fast retransmits in general. My question was:
how could a DLM fast retransmit even be triggered? This can only happen
when some DLM messages get lost or are received out of order. But the
transport layer guarantees lossless and in order delivery. Even in case
of a reconnection, I can't see how the peer could get holes in its
receive queue. What am I missing?

> > It seems to me that the only time DLM might need to retransmit data, is
> > when recovering from a connection failure. So why can't we just resend
> > unacknowledged data at reconnection time? That'd probably simplify the
> > code a lot (no need to maintain a retransmission timeout on TX, no need
> > to handle sequence numbers that are in the future on RX).
> >
> 
> I can try to remove the timer, timeout and do the above approach to
> retransmit at reconnect. Then I test it again and I will report back
> to see if it works or why we have other problems.

I see you've posted a new version of the patch series. I'll look at it
soon.

> > Also, couldn't we set the DLM sequence numbers in
> > dlm_midcomms_commit_buffer_3_2() rather than using a callback function
> > in dlm_lowcomms_new_buffer()?
> >
> 
> That has something to do with the internal buffer allocator. The order
> is defined in dlm_lowcomms_new_buffer() and there is an internal lock
> which needs to be held there. I can't do this without somehow making
> the lock accessible in dlm_midcomms_commit_buffer_3_2(). The code is
> also optimized that the lock isn't held during kmalloc().

I missed that. Thanks for the explanation.

> > Finally, I wonder if we could avoid adding DLM sequence numbers
> > entirely. Have you considered using the TCP_REPAIR infrastructure to
> > retrieve the send queue of the failed socket and resend that data once
> > the new socket is connected?
> >
> 
> Yes, I looked into TCP_REPAIR at first and I agree it can be used to
> solve this problem. However TCP_REPAIR can be used as a part of a more
> generic solution, there needs to be something "additional handling"
> done e.g. additional socket options to let the application layer save
> states before receiving errors. I am also concerned how it would work
> with haproxy, etc. It also has some advantages to restore window size,
> etc. I was thinking about submitting a proposal to the next netdevconf
> after doing some experiments with it.

Well, I was thinking of using TCP_REPAIR only to retrieve the send
queue. I didn't mean to avoid the hand-check like in the CRIU use case.
A TCP connection break is a sign that something went wrong between the
peers, so a full reconnection is in order IMHO.

> We decided to solve this problem at the application layer first, then
> look into how to make a more generic solution. For me, I am not sure
> how cifs deals with reconnects or it just allows drops.

Indeed, it'd be interesting to know how other protocols handle this
case.

> > Please correct me if the above suggestions don't make sense. I'm not
> > familiar with DLM so I can very well be missing important points.
> >
> 
> No problem, it does make sense for me.
> 
> - Alex
> 

