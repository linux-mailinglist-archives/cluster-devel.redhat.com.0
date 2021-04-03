Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8B3D8353492
	for <lists+cluster-devel@lfdr.de>; Sat,  3 Apr 2021 17:35:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617464108;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=E7/0oijoUGTUfwwMN7o5p/c+bD1+VUhNRaE8+Nibiqk=;
	b=Jg3x6+3ewbaPXYk0NV32KsyUwPwLC+jQfFFTp5PYpucjRuLKZBFy0d1lvEciCxDd+hXd6Z
	2q0Nr5W5W4cAzHQ82eXCcYp+SyxV2H8b/ySY3Nmt6zCjuYq5OaJfjDke8YIL16XpfHykuD
	s4v+o5XyEWQ5kSxXFOxqbUBK4YO9Nkw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-hevHuH7tNjiobAOPDzFcKg-1; Sat, 03 Apr 2021 11:35:07 -0400
X-MC-Unique: hevHuH7tNjiobAOPDzFcKg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2F67802B4F;
	Sat,  3 Apr 2021 15:35:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D75A10027C4;
	Sat,  3 Apr 2021 15:35:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BEA714BB7C;
	Sat,  3 Apr 2021 15:34:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 133FYrvi011012 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 3 Apr 2021 11:34:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2EF26101A7F7; Sat,  3 Apr 2021 15:34:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A9F31005B67
	for <cluster-devel@redhat.com>; Sat,  3 Apr 2021 15:34:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59589101A52C
	for <cluster-devel@redhat.com>; Sat,  3 Apr 2021 15:34:49 +0000 (UTC)
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
	[209.85.166.197]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-471-v14blYQ_OParhH9Ris8-Eg-1; Sat, 03 Apr 2021 11:34:45 -0400
X-MC-Unique: v14blYQ_OParhH9Ris8-Eg-1
Received: by mail-il1-f197.google.com with SMTP id y11so7329981ilq.2
	for <cluster-devel@redhat.com>; Sat, 03 Apr 2021 08:34:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=E7/0oijoUGTUfwwMN7o5p/c+bD1+VUhNRaE8+Nibiqk=;
	b=g6vQzFyHOsKoCzqaDPEtN9OyMbAv1Dug3CoX/Wsa1+ReSYGX4AjfZdRIKanBxgLVVi
	1u7uYh6MfDGuS+irVC5XQl6G2HEFmocjRDAhvcft3FdklWeCQT35Qhh4MdASo1q85ymm
	W8cMD7JY5SXeu+D9rqIeBiysF7IzRh1jvxLJytQPbnRsteZ0Pcf6YokMIm33nmUEJs9h
	A3l3u2mL64YvVErZ9z+nURRypkV4j43ifUMoKkhKMKyheqN8Z3/8uWQGz9jdZYGz4Q9g
	z/AZjeWBhGieQ6GMBRlBF6SA1xXjiF6dDG6zusEw0KwMUV9UcX4+a2Btqfug1xt9qDHj
	Xu3w==
X-Gm-Message-State: AOAM532DXEFrYP/Y3NCPD2BjGyxTBYcW3GZPqjVv0E3A91PX86W/EccU
	2uatXwlwkUFl9QqVWLYohmfsV5rjnhWbYYfXh9dwtHqGPnNmSkXga4PmcvtHTOEY5d0LA4IJaSs
	9yC5hOptUXNQ0qnlL514/YN7bpqmrpTb+nizyNg==
X-Received: by 2002:a05:6e02:1a22:: with SMTP id
	g2mr14544442ile.231.1617464084995; 
	Sat, 03 Apr 2021 08:34:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzx7sZJVgNq9cqTtwZv2pRgGbYka7u0VPv8ob0jkVecB50+cdGeayBcO1n+t4H8M8zV7UTT8HKiyHBXE9HR8EY=
X-Received: by 2002:a05:6e02:1a22:: with SMTP id
	g2mr14544433ile.231.1617464084786; 
	Sat, 03 Apr 2021 08:34:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210326173337.44231-1-aahringo@redhat.com>
	<20210326173337.44231-8-aahringo@redhat.com>
	<20210402205351.GA24027@linux-2.home>
In-Reply-To: <20210402205351.GA24027@linux-2.home>
From: Alexander Ahring Oder Aring <aahringo@redhat.com>
Date: Sat, 3 Apr 2021 11:34:33 -0400
Message-ID: <CAK-6q+hnj94xQS+QceDF3GyDR78ns61-T1UVLs7o6kJsPzT=Fw@mail.gmail.com>
To: Guillaume Nault <gnault@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Guillaume,

On Fri, Apr 2, 2021 at 4:54 PM Guillaume Nault <gnault@redhat.com> wrote:
>
> On Fri, Mar 26, 2021 at 01:33:36PM -0400, Alexander Aring wrote:
> > This patch introduce to make a tcp lowcomms connection reliable even if
> > reconnects occurs. This is done by an application layer re-transmission
> > handling and sequence numbers in dlm protocols. There are three new dlm
> > commands:
> >
> > DLM_OPTS:
> >
> > This will encapsulate an existing dlm message (and rcom message if they
> > don't have an own application side re-transmission handling). As optional
> > handling additional tlv's (type length fields) can be appended. This can
> > be for example a sequence number field. However because in DLM_OPTS the
> > lockspace field is unused and a sequence number is a mandatory field it
> > isn't made as a tlv and we put the sequence number inside the lockspace
> > id. The possibility to add optional options are still there for future
> > purposes.
> >
> > DLM_ACK:
> >
> > Just a dlm header to acknowledge the receive of a DLM_OPTS message to
> > it's sender.
> >
> > DLM_FIN:
> >
> > A new DLM message to synchronize pending message to the other dlm end if
> > the node want to disconnects. Each side waits until it receives this
> > message and disconnects. It's important that this message has nothing to
> > do with the application logic because it might run in a timeout if
> > acknowledge messages are dropped. The problem which we try to solve with
> > DLM_FIN is that the node membership is handled by corosync and not the
> > kernel dlm protocol itself, DLM_FIN tries to synchronize the kernel dlm
> > protocol with corosync join/leave membership callbacks.
>
> If I understand correctly, currently, when DLM faces a hard but
> temporary connection failure (like receiving a stray TCP RST), it
> automatically recreates a new connection. However, the in-flight data
> of the previous connection are lost. The problem is that such data loss
> can turn the participating nodes into inconsistent states.
>
> Therefore this patch series implements sequence number tracking at the
> application level, so that a new connection can retransmit
> unacknowledged data from the previous, failed, connection.
>
> Is that an accurate summary or is there anything I've missed?
>

Yes, there is one thing missing. I detected a synchronization issue
because the node membership of a lockspace is done by a different
protocol handled in user space. This protocol declares the actual peer
of the DLM protocol. In short, there are two protocols here, whereas
one handles the membership of peers and the other handles the actual
operations. There is a missing synchronization between operations and
membership which I solved with a DLM_FIN message.

> I feel that this patch goes very far into re-implementing TCP-like
> features. For example, why is fast-retransmit even needed? DLM seems to
> always uses a transport protocol that guarantees reliable and in order
> delivery. Therefore, duplicate DLM acknowledgements can't happen on an
> established connection. Even when reconnecting, it'd be the sender's
> responsibility to resend the last unackowledged data first. How could
> this lead to holes in the DLM sequence numbers on the receiver's side?
>

I agree it's a TCP re-implementation on the application layer.

Fast-retransmit is not needed as it is not needed in TCP. However it
solves drops faster, in DLM and GFS2 you would experience a stuck in
some filesystem syscalls until the drop is resolved.

> It seems to me that the only time DLM might need to retransmit data, is
> when recovering from a connection failure. So why can't we just resend
> unacknowledged data at reconnection time? That'd probably simplify the
> code a lot (no need to maintain a retransmission timeout on TX, no need
> to handle sequence numbers that are in the future on RX).
>

I can try to remove the timer, timeout and do the above approach to
retransmit at reconnect. Then I test it again and I will report back
to see if it works or why we have other problems.

> Also, couldn't we set the DLM sequence numbers in
> dlm_midcomms_commit_buffer_3_2() rather than using a callback function
> in dlm_lowcomms_new_buffer()?
>

That has something to do with the internal buffer allocator. The order
is defined in dlm_lowcomms_new_buffer() and there is an internal lock
which needs to be held there. I can't do this without somehow making
the lock accessible in dlm_midcomms_commit_buffer_3_2(). The code is
also optimized that the lock isn't held during kmalloc().

> Finally, I wonder if we could avoid adding DLM sequence numbers
> entirely. Have you considered using the TCP_REPAIR infrastructure to
> retrieve the send queue of the failed socket and resend that data once
> the new socket is connected?
>

Yes, I looked into TCP_REPAIR at first and I agree it can be used to
solve this problem. However TCP_REPAIR can be used as a part of a more
generic solution, there needs to be something "additional handling"
done e.g. additional socket options to let the application layer save
states before receiving errors. I am also concerned how it would work
with haproxy, etc. It also has some advantages to restore window size,
etc. I was thinking about submitting a proposal to the next netdevconf
after doing some experiments with it.

We decided to solve this problem at the application layer first, then
look into how to make a more generic solution. For me, I am not sure
how cifs deals with reconnects or it just allows drops.

> Please correct me if the above suggestions don't make sense. I'm not
> familiar with DLM so I can very well be missing important points.
>

No problem, it does make sense for me.

- Alex

