Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B158E35C9AA
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Apr 2021 17:21:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618240905;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=/g/9UWsIg89KEwiE7o6cJ0IFIWMBwhUp0iHoc+KXYLw=;
	b=hcn9w29ffRrODZMU1B3hC7oV8PAf3DAS/YqGiUw34ujCvdXzuCZusKqge40Saobd5tolH1
	7jHryx4ZXCUh7jKexsvMgeM7dLvER6UU1M3Fp/pHH7l9tRmVsIrKDXau6xwJNEyCvJDHDY
	ahnpv+kQLOeA/h21nArOb/dX+Xj+AcI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-p9HIjISiPeiBZnkXvr2mrg-1; Mon, 12 Apr 2021 11:21:44 -0400
X-MC-Unique: p9HIjISiPeiBZnkXvr2mrg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABE0491279;
	Mon, 12 Apr 2021 15:21:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC01F5C1C2;
	Mon, 12 Apr 2021 15:21:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B558144A5A;
	Mon, 12 Apr 2021 15:21:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13CFLW1T030039 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 12 Apr 2021 11:21:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D17F521E20C4; Mon, 12 Apr 2021 15:21:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB17021E20C2
	for <cluster-devel@redhat.com>; Mon, 12 Apr 2021 15:21:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B0D781C964
	for <cluster-devel@redhat.com>; Mon, 12 Apr 2021 15:21:30 +0000 (UTC)
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
	[209.85.166.199]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-369-g4PgTnbzMVql3W8oTUSqPQ-1; Mon, 12 Apr 2021 11:21:28 -0400
X-MC-Unique: g4PgTnbzMVql3W8oTUSqPQ-1
Received: by mail-il1-f199.google.com with SMTP id i1so194613ilu.3
	for <cluster-devel@redhat.com>; Mon, 12 Apr 2021 08:21:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/g/9UWsIg89KEwiE7o6cJ0IFIWMBwhUp0iHoc+KXYLw=;
	b=Ds8xErjot8MgIg6sY3BtJDpbGFjovR9+y90GejWh2ivuuO/jXp+1oqaQ8vZ3C6LOzH
	dkRMV0ux+3EmN5agKKYNax6wVTQ5+1/52dw2AJmIoPDpHJlYzDRLvWaAZqu83437DSS6
	s4HkobOhclkLboS3eI7+cz7TkS9/5zYPWmticvvILUUfmk7EDE6SLBJxCI67/hy8kZbF
	lzaLow3oW08K8mMl/wJUMHad3Yhc75lFCJbNbZWbvtJJaQ/8bsjA90sWCBp61EtvMA3x
	GhI2QSNNH9SEPfLnOl4yXrbhL+d3RBU4sO3CPu2CYFDIBiiXa5UIVkP3gP+VvZT/0P+8
	1LsQ==
X-Gm-Message-State: AOAM530kZ5iFsAR33mvQi3aF+w+Ffqy2mMZyDaRyseiM67u0Ji+KhgNs
	sSFaVA14kTPPvX85CaNia2qewr1rkg40zmHIcTIRzPQsFCCZqmcWc8loFR+HX1fRf7jmVPDlKXM
	NWmuQlFrJvWaGEhRS2C8I5TtWj46FgtdDwWJJhw==
X-Received: by 2002:a02:70d6:: with SMTP id
	f205mr28993141jac.124.1618240887930; 
	Mon, 12 Apr 2021 08:21:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyteDZtAZZfBIpXevF2YNK5xOAUJ5gk4l7Zu23K/tUavF6tTi7KUUKkV9SgjHMP0Lr9m6KwprDFd25dJ7ERuxw=
X-Received: by 2002:a02:70d6:: with SMTP id
	f205mr28993121jac.124.1618240887651; 
	Mon, 12 Apr 2021 08:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210326173337.44231-1-aahringo@redhat.com>
	<20210326173337.44231-8-aahringo@redhat.com>
	<20210402205351.GA24027@linux-2.home>
	<CAK-6q+hnj94xQS+QceDF3GyDR78ns61-T1UVLs7o6kJsPzT=Fw@mail.gmail.com>
	<20210409203221.GB30244@linux-2.home>
In-Reply-To: <20210409203221.GB30244@linux-2.home>
From: Alexander Ahring Oder Aring <aahringo@redhat.com>
Date: Mon, 12 Apr 2021 11:21:16 -0400
Message-ID: <CAK-6q+jog8D6YcSc807wL08eQWqnUSX6iU+dkka+E5iGJzxKZg@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, Apr 9, 2021 at 4:32 PM Guillaume Nault <gnault@redhat.com> wrote:
...
> >
> > Yes, there is one thing missing. I detected a synchronization issue
> > because the node membership of a lockspace is done by a different
> > protocol handled in user space. This protocol declares the actual peer
> > of the DLM protocol. In short, there are two protocols here, whereas
> > one handles the membership of peers and the other handles the actual
> > operations. There is a missing synchronization between operations and
> > membership which I solved with a DLM_FIN message.
>
> Thanks, I'll re-read the parts about DLM_FIN with this explanation in
> mind.
>

okay. Thank you.

> > > I feel that this patch goes very far into re-implementing TCP-like
> > > features. For example, why is fast-retransmit even needed? DLM seems to
> > > always uses a transport protocol that guarantees reliable and in order
> > > delivery. Therefore, duplicate DLM acknowledgements can't happen on an
> > > established connection. Even when reconnecting, it'd be the sender's
> > > responsibility to resend the last unackowledged data first. How could
> > > this lead to holes in the DLM sequence numbers on the receiver's side?
> > >
> >
> > I agree it's a TCP re-implementation on the application layer.
> >
> > Fast-retransmit is not needed as it is not needed in TCP. However it
> > solves drops faster, in DLM and GFS2 you would experience a stuck in
> > some filesystem syscalls until the drop is resolved.
>
> I was not talking about fast retransmits in general. My question was:
> how could a DLM fast retransmit even be triggered? This can only happen
> when some DLM messages get lost or are received out of order. But the
> transport layer guarantees lossless and in order delivery. Even in case
> of a reconnection, I can't see how the peer could get holes in its
> receive queue. What am I missing?
>

It can be triggered in cases that DLM just does some other operations
which triggers new messages after a reconnect and drop. The receiver
will send back multiple ack frames back with the same sequence number
which indicates for the sender a drop. If the ack count with multiple
times the same sequence number (the receiver expected sequence number)
a retransmission will be triggered. Just like in [0].

> > > It seems to me that the only time DLM might need to retransmit data, is
> > > when recovering from a connection failure. So why can't we just resend
> > > unacknowledged data at reconnection time? That'd probably simplify the
> > > code a lot (no need to maintain a retransmission timeout on TX, no need
> > > to handle sequence numbers that are in the future on RX).
> > >
> >
> > I can try to remove the timer, timeout and do the above approach to
> > retransmit at reconnect. Then I test it again and I will report back
> > to see if it works or why we have other problems.
>
> I see you've posted a new version of the patch series. I'll look at it
> soon.
>

ok.

> > > Also, couldn't we set the DLM sequence numbers in
> > > dlm_midcomms_commit_buffer_3_2() rather than using a callback function
> > > in dlm_lowcomms_new_buffer()?
> > >
> >
> > That has something to do with the internal buffer allocator. The order
> > is defined in dlm_lowcomms_new_buffer() and there is an internal lock
> > which needs to be held there. I can't do this without somehow making
> > the lock accessible in dlm_midcomms_commit_buffer_3_2(). The code is
> > also optimized that the lock isn't held during kmalloc().
>
> I missed that. Thanks for the explanation.
>

ok, no problem. It took some time for me to figure that out as well.

> > > Finally, I wonder if we could avoid adding DLM sequence numbers
> > > entirely. Have you considered using the TCP_REPAIR infrastructure to
> > > retrieve the send queue of the failed socket and resend that data once
> > > the new socket is connected?
> > >
> >
> > Yes, I looked into TCP_REPAIR at first and I agree it can be used to
> > solve this problem. However TCP_REPAIR can be used as a part of a more
> > generic solution, there needs to be something "additional handling"
> > done e.g. additional socket options to let the application layer save
> > states before receiving errors. I am also concerned how it would work
> > with haproxy, etc. It also has some advantages to restore window size,
> > etc. I was thinking about submitting a proposal to the next netdevconf
> > after doing some experiments with it.
>
> Well, I was thinking of using TCP_REPAIR only to retrieve the send
> queue. I didn't mean to avoid the hand-check like in the CRIU use case.
> A TCP connection break is a sign that something went wrong between the
> peers, so a full reconnection is in order IMHO.
>

I am somehow worried about what data-format they are in the "queues"
and even if we can figure out message boundaries? Yes "queues" so far
I remember/know there exists two queues for TCP, a write queue and
retransmit queue. I am not sure if the data payload is with TCP header
or not, something to figure out. Otherwise we would need to parse TCP
here?

> > We decided to solve this problem at the application layer first, then
> > look into how to make a more generic solution. For me, I am not sure
> > how cifs deals with reconnects or it just allows drops.
>
> Indeed, it'd be interesting to know how other protocols handle this
> case.
>

Yes, this protocol is very picky if there is any drop. Of course we
are talking about lock operations over the network, it can be very
fatal if drops occur. Pablo review mentions a lot of "security"
related things and disconnecting peers if they happen. We work here in
the cluster world which operates a little bit differently. What we can
do is send an event to the cluster manager to fence nodes. However I
am not aware that we currently support such handling if something runs
out-of-boundaries of queues, sequence numbers, etc. We need to trust
the network anyway because you can easily trigger deadlocks from
outside, I guess. Trusting network != things run crazy, for the crazy
case we could send events to fence a specific node.

- Alex

[0] https://www.isi.edu/nsnam/DIRECTED_RESEARCH/DR_WANIDA/DR/images/fast-retransmit-2.gif

