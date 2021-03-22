Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2699E3452A3
	for <lists+cluster-devel@lfdr.de>; Mon, 22 Mar 2021 23:55:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616453716;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=EJRGPrErSYu08nLfSPwoJhYiBRzDD1XRNZx5wcmZuBY=;
	b=BkCRaGPk19DReS4oDRMa2SPXr87LlrvKxd04gsLdj6UsL/6k2fYRKfXnHhRKxB7bZmNbmJ
	ELAvJaqYLiwCLJnVd7jINWIGDZPnNHcy2KxTndFDUjz3IcTj4rBToJsPWvLwDV0UlDhTAY
	pFlZPWVanZMtovHq1JMNf1VCf57OoEM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-_7CSW9mYM120JwNaaAfIfA-1; Mon, 22 Mar 2021 18:55:14 -0400
X-MC-Unique: _7CSW9mYM120JwNaaAfIfA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62C1A87A826;
	Mon, 22 Mar 2021 22:55:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0650F5B6AB;
	Mon, 22 Mar 2021 22:55:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C09AB4BB7C;
	Mon, 22 Mar 2021 22:55:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12MMt4cX019151 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 22 Mar 2021 18:55:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 35420110AF3D; Mon, 22 Mar 2021 22:55:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31357110AF41
	for <cluster-devel@redhat.com>; Mon, 22 Mar 2021 22:55:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7A120185A7B2
	for <cluster-devel@redhat.com>; Mon, 22 Mar 2021 22:55:01 +0000 (UTC)
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
	[209.85.166.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-482-ShBe0KGyMk-7aiFJM8206w-1; Mon, 22 Mar 2021 18:54:59 -0400
X-MC-Unique: ShBe0KGyMk-7aiFJM8206w-1
Received: by mail-io1-f69.google.com with SMTP id x6so556217ioj.6
	for <cluster-devel@redhat.com>; Mon, 22 Mar 2021 15:54:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EJRGPrErSYu08nLfSPwoJhYiBRzDD1XRNZx5wcmZuBY=;
	b=M2SgJsAzltj40/PKSfMhUllbxRj76OuwE7/Xoxkjm4hK5aPwtHGjhj6V2zeiHB22NM
	hv0KnZGaNjHK+OVEAFRDqVpxUte7DQW3AdgfQAtzz4EXSm9unPerf06F1ZULTuGOMUBB
	ZpWHEmvv2c4nCivroO/ZFPyeYonSR7RWsFwKHl6LRiC4rgRUGVnhdySdH/WWK9LZQrOB
	7lez0Nz2HOa4Xw4oqbaakMTbW7E5+IuIWPKzwmtbh21LIdsOb9PLwOO6/2Vsn4JQo+TF
	abx+mrN8Esyn2W83ZAAT6I3SAGkvO52x/g8xVL2MRIFibTJ92cycu5KstHH7MughQAkf
	cWdA==
X-Gm-Message-State: AOAM533CbkqfdVGjzyreeiQ+r0baem/t6x9taCyN5u0eaqUlOnXG3Ee5
	aUM8AQwfSfwpt2Y6nkQFMkD4Osztu8weTWLVevKy70KaTqPg7J2CPMVTJhcYCcnICgYAN/l7Lwb
	ieNZrXN4cCVAoaYii6rbj+mk9ONaCjWyHgshrjg==
X-Received: by 2002:a6b:5112:: with SMTP id f18mr1788680iob.196.1616453698998; 
	Mon, 22 Mar 2021 15:54:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQBBGDvKOB5Ibz/CoJUcLCwxagGbHf4lleY2LHMBOES7/wGDcbEfvxpeDAleWMfdDIsF8PSN8ZazZlHIdbvLs=
X-Received: by 2002:a6b:5112:: with SMTP id f18mr1788663iob.196.1616453698736; 
	Mon, 22 Mar 2021 15:54:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210310191745.80824-1-aahringo@redhat.com>
	<7536fa5a3661675c583a448cf1bbc3f026bfea23.camel@redhat.com>
	<CAK-6q+hueOPUSUpCM2ksfgtNPB9HSvSy9HLUZvLPi+g9v0Cmiw@mail.gmail.com>
	<ff7b25011a930e3d9f2f2bd17ed39bbc025257b7.camel@redhat.com>
In-Reply-To: <ff7b25011a930e3d9f2f2bd17ed39bbc025257b7.camel@redhat.com>
From: Alexander Ahring Oder Aring <aahringo@redhat.com>
Date: Mon, 22 Mar 2021 18:54:47 -0400
Message-ID: <CAK-6q+g3n1f=-hwCPt9fz6yg8WXG6dz=_1H5N_a6P2cwLeVeOw@mail.gmail.com>
To: Paolo Abeni <pabeni@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Guillaume Nault <gnault@redhat.com>
Subject: Re: [Cluster-devel] [PATCHv2 dlm/next 0/8] fs: dlm: introduce dlm
	re-transmission layer
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, Mar 16, 2021 at 2:37 PM Paolo Abeni <pabeni@redhat.com> wrote:
>
> Hello,
>
> On Fri, 2021-03-12 at 09:52 -0500, Alexander Ahring Oder Aring wrote:
> > On Thu, Mar 11, 2021 at 4:09 AM Paolo Abeni <pabeni@redhat.com> wrote:
> > > - DEFAULT_BUFFER_SIZE == LOWCOMMS_MAX_TX_BUFFER_LEN in current net-
> > > next, so looks like a change below is actually a no op ?!?
> >
> > It's LOWCOMMS_MAX_TX_BUFFER_LEN updated in patch 7/8:
> >
> > #define LOWCOMMS_MAX_TX_BUFFER_LEN     (DEFAULT_BUFFER_SIZE -
> > DLM_MIDCOMMS_OPT_LEN)
> >
> > whereas DEFAULT_BUFFER_SIZE is the maximum possible dlm message size
> > at socket layer level. Mainly this is limited because we can get a
> > maximum page buffer allocation for the dlm application layer only and
> > the application layer cannot deal with any additional logic to handle
> > more. However that is also an architecture thing, because it needs to
> > be the minimal page buffer size of all architecture due compatibility
> > with other architectures. I introduced a check which should report
> > problems if architectures doesn't support it:
> >
> > BUILD_BUG_ON(PAGE_SIZE < DEFAULT_BUFFER_SIZE);
> >
> > LOWCOMMS_MAX_TX_BUFFER_LEN is the length after the encapsulation
> > header, the size "what the dlm application layer can maximum put in a
> > message" on application layer level.
> >
> > The names are misnamed, it's on my list to update them. Any
> > recommendations (MAX_DLM_SOCKET_BUFFER_SIZE/MAX_DLM_APP_BUFFER_SIZE)?
>
> I'm almost literaly the last person to ask this kind of questions, as I
> always pick up bad names... I would opt for:
>
> DLM_MAX_SOCKET_BUFSIZE
> DLM_MAX_APP_BUFSIZE
>

ok. I will prepare patches to change the naming later.

> > > - Could you please add more info WRT the reference to unaligned memory
> > > access in the code comments? Which field[s] is[are] subject to that?
> > >
> >
> > none of these fields. Some of the DLM messages have a variable sized
> > payload at the tail. It's a string value. This string length needs to
> > be 8 byte aligned. The kernel violate this, however there exists an
> > userspace API and the user needs to define this string value. One user
> > is lvm, lvm uses an unique identifier the UUID of the volume for this
> > string value, the UUID string value is 36 chars. It will end in a
> > message boundary issue which will/can end in unaligned memory access
> > at the sending side (because of some internal buffer handling) and the
> > receiving side. I tried to fix it by filling zero bytes to this string
> > but the problem is more complicated as David Teigland pointed out to
> > still have backwards compatibility. I would like to schedule to fix
> > the issue in a next major version bump of dlm.
>
> Uhm... It looks like the unaligned access was partially handled with
> memmove/put_unaligned, but that code was removed with
> commit df9e06b800ed025411ce9ab348299b3ef258cf8b - because the removed
> code did not cover all the use-case.
>

This patch actually solves the unaligned memory access for all cases
at the receiving side. However we still have problems at the sending
side (explanation below), that's why I reverted it. The memmove() will
actually fix the message boundary issue and will ensure that a dlm
message pointer starts at a 8 byte aligned address which is not
guaranteed currently.

> I guess a complete solution based on get_unaligned/put_unaligned is too
> invasive?
>

the application layer doesn't use get_unaligned/put_unaligned and yes
changing it is too invasive. Remember we have full control of our
buffer allocation and operate on socket api and those will use the
user allocated buffers (no skb's). Because this reason
get_unaligned/put_unaligned isn't kind of ?required? as we try to keep
natural alignment of structures. We always know where our buffers come
from (I hope).

> I'm not sure I follow correctly when you says the issue should be
> solved on the send side... What if a sender is buggy/uses an old
> implementation? would that cause unaligned access?
>

The problem here is that dlm has an internal buffer allocator [0]. It
works like:

1. page buffer will be allocated and return pointer to page start to
place a dlm message in there.
2. so far no buffer committed yet which belongs to a page is committed
the _next_ available buffer on the page will be returned to
application layer to fill another message. This pointer is directly at
the end of address of the last allocated buffer on the same page
buffer.
3. if buffer is committed it will be scheduled to transmit and 1.
starts again with a new page buffer.

It's an optimization because a processing of a dlm message can trigger
multiple messages so they try to put a bunch of them into one page.

Why we run into an unaligned memory access now? It's 2. which makes
problems when we have message boundary issues, means our dlm message
length is not divided to 8 and the next message will end in unaligned
memory issues. If an architecture cannot deal with this unaligned
memory access, we can already run into issues at sending side, because
the application layer will directly dereference structure fields on
returned buffer address.

We cannot control "how" a message with a message boundary issue is
processed at the send and receiving side (due TCP stack and what to
put into one segment) and this problem exists for a long time. If we
received/processed only one message with boundary issues everything
would be fine. We need to fix the sending side here to not allow such
messages to send, of course the network is trusted here... We assume
in general that the network is trusted because I think you can simple
occur deadlock states by sending specific dlm messages around, not
just malformed messages.

I simple think we don't have anybody which is using dlm on an
architecture which cannot deal with that unaligned memory access. I
also told you something wrong in the last mail, the kernel does _not_
sending dlm message with a message boundary issue, it's some user
space users e.g. lvm which adds a UUID string as resource name. This
string is a stored inside at the dlm message tail payload and it's 36
chars long (not divided by 8). Such message is very rarely, but the
problem still exists. The user space dlm requests can occur any time.

> If a message is unaligned, will it stay unaligned on re-transmissions?

Depends if case 2. occurs from above description and a previous
allocated had a message boundary issue.

> Otherwise, if the unaligned messages are really a corner case, given
> that this implements app-layer retransmission, what about simply
> detecting the unaligned message and dropping it? It sounds a bit
> scaring to me that a remote peer would be able to trigger an oops (on
> some arches) with a badly crafted packet.
>

No, we can't do that (see below). I detected this issue by inserting a
WARN_ON() and needed to remove it because it is part of the protocol
behaviour for now. I really think nobody using it on an arch which
makes big trouble e.g. kernel oops.

> It looks like the amount of memory the 'receive_queue' and 'send_queue'
> can use is still unbounded ?!? I suggest to drop at least a commend
> about why that should not be an issue (if that is really not a problem
> ;)

We add this reliable feature on reconnects because dropping a message
in DLM will/could end into a deadlock. If DLM drops a message it's
considered to be in a broken state. However DLM is protected against
if a node/peer get fenced by a cluster manager .e.g pressing reset
button. But reset button/fencing != reconnect. This feature will help
to not dropping any DLM message because some e.g. TCP reset was
received for any reason.

I will add a comment, we cannot drop any message in this protocol
(that's why midcomms exists), so the queues must be unbounded. However
if the queue sizes getting too high we can fence the specific node
(because weird things going on)... this is maybe something to improve
in the future.

>
> I had also an additional minor comment on patch 7/8, see there for the
> details...

ok.

- Alex

[0] https://git.kernel.org/pub/scm/linux/kernel/git/teigland/linux-dlm.git/tree/fs/dlm/lowcomms.c?h=next#n1370

