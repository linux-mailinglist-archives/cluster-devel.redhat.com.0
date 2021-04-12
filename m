Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id EB9A235C9DC
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Apr 2021 17:30:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618241451;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=dXPXt4plU4MIzt5z9i+qydfOjIBvOXY/+LovXIasUYA=;
	b=d/SRUWMX6KK5pr3FidFHdW2nDdlcH88PRL0UUqAeq8ETt6ZynS0iHDtmK7zAyt9IsbHUf3
	/QyXv2jlUlfrM1j4Iv+++FPTandctoq2qULHg7xsW6UrW3m8ukvbhUvB0h3j1uwTN6jNAE
	Pwa8BmaWb7V1aIjaB9mJJqZPSCIA3ZA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-k4mlNYilNDGMDC538UFcgw-1; Mon, 12 Apr 2021 11:30:49 -0400
X-MC-Unique: k4mlNYilNDGMDC538UFcgw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DB9F8189DE;
	Mon, 12 Apr 2021 15:30:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 524C55C1BB;
	Mon, 12 Apr 2021 15:30:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9D3FF44A59;
	Mon, 12 Apr 2021 15:30:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13CFUg7Z031294 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 12 Apr 2021 11:30:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BDDCE10085DC; Mon, 12 Apr 2021 15:30:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B2C40110DBAB
	for <cluster-devel@redhat.com>; Mon, 12 Apr 2021 15:30:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F3E885A5B9
	for <cluster-devel@redhat.com>; Mon, 12 Apr 2021 15:30:40 +0000 (UTC)
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
	[209.85.166.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-188-YFjQojF0PQ-JtNP5UhZpjQ-1; Mon, 12 Apr 2021 11:30:37 -0400
X-MC-Unique: YFjQojF0PQ-JtNP5UhZpjQ-1
Received: by mail-io1-f72.google.com with SMTP id v14so2697233iob.5
	for <cluster-devel@redhat.com>; Mon, 12 Apr 2021 08:30:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dXPXt4plU4MIzt5z9i+qydfOjIBvOXY/+LovXIasUYA=;
	b=r4hvZSeDF/V9sI1y0t9EgP0SzGXMgF8VRFMzaTv70hmx153bNoa7h8IXHpXnFkH/yz
	9MFOZ9P2z8l2mYFmH+LlLWiCWNpFNK3YFlViz6GRzhdl/sTHgJWeKX+LHLI1TQJyqOOr
	2pw1dmXmUW23+Q5jj1ybyQvdxI7DsgnGsaBjKudGDiD6xfOwYQGvXegRkeKf6EE068oi
	a8WIoLGjymHZIy8Vbo0rjLx7GuWEiHP6ap8i/mDoIDyQn8kKDS1RR++T4K15Q5MGFVPy
	PpniwUEv+EHNcxUpXaYWRuILJLibSHZCdhuaJ3dva3ZnWQNNKPJW2eepOJ+8HhkLoxUD
	fUlQ==
X-Gm-Message-State: AOAM530xuFpiB9fdUShL4s0KakRtN2TQ4kCx1hzKQpC8n4jmOD71MK9d
	1Nwy/+aUnBd50V7lMNxhyRiy4QcuLqGIPHjj8eT1sytdPWh67+aGORiCsnK3G76kuvNT8UfFyLZ
	X+s6h0erAY8JHtUcN6xwtuztpjek2cYRluLuP3Q==
X-Received: by 2002:a05:6602:2ac4:: with SMTP id
	m4mr22772932iov.41.1618241437050; 
	Mon, 12 Apr 2021 08:30:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw84P8xi3pSkDaRfaZN4GlkL0jyUStEPwkM3pYdOpBRX2FqnOS2fm7e/EpxkME0x1LOiJcgdER0otFYHbqz6PY=
X-Received: by 2002:a05:6602:2ac4:: with SMTP id
	m4mr22772915iov.41.1618241436781; 
	Mon, 12 Apr 2021 08:30:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210326173337.44231-1-aahringo@redhat.com>
	<20210326173337.44231-8-aahringo@redhat.com>
	<20210402205351.GA24027@linux-2.home>
	<CAK-6q+hnj94xQS+QceDF3GyDR78ns61-T1UVLs7o6kJsPzT=Fw@mail.gmail.com>
	<CAK-6q+giMt8HUg5jY0msrKGazUeRnGNqC6nNPqNa2Mca8NRCuQ@mail.gmail.com>
	<20210409204443.GC30244@linux-2.home>
In-Reply-To: <20210409204443.GC30244@linux-2.home>
From: Alexander Ahring Oder Aring <aahringo@redhat.com>
Date: Mon, 12 Apr 2021 11:30:25 -0400
Message-ID: <CAK-6q+gBDO2UO78ohssyLdqRsjvkcMYw9H6v2DvDJZL-VdhpZQ@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, Apr 9, 2021 at 4:44 PM Guillaume Nault <gnault@redhat.com> wrote:
>
> On Mon, Apr 05, 2021 at 01:33:48PM -0400, Alexander Ahring Oder Aring wrote:
> > Hi,
> >
> > On Sat, Apr 3, 2021 at 11:34 AM Alexander Ahring Oder Aring
> > <aahringo@redhat.com> wrote:
> > >
> > ...
> > >
> > > > It seems to me that the only time DLM might need to retransmit data, is
> > > > when recovering from a connection failure. So why can't we just resend
> > > > unacknowledged data at reconnection time? That'd probably simplify the
> > > > code a lot (no need to maintain a retransmission timeout on TX, no need
> > > > to handle sequence numbers that are in the future on RX).
> > > >
> > >
> > > I can try to remove the timer, timeout and do the above approach to
> > > retransmit at reconnect. Then I test it again and I will report back
> > > to see if it works or why we have other problems.
> > >
> >
> > I have an implementation of this running and so far I don't see any problems.
> >
> > > > Also, couldn't we set the DLM sequence numbers in
> > > > dlm_midcomms_commit_buffer_3_2() rather than using a callback function
> > > > in dlm_lowcomms_new_buffer()?
> > > >
> > ...
> > >
> > > Yes, I looked into TCP_REPAIR at first and I agree it can be used to
> > > solve this problem. However TCP_REPAIR can be used as a part of a more
> > > generic solution, there needs to be something "additional handling"
> > > done e.g. additional socket options to let the application layer save
> > > states before receiving errors. I am also concerned how it would work
> >
> > The code [0] is what I meant above. It will call
> > tcp_write_queue_purge(); before reporting the error over error
> > queue/callback. That need to be handled differently to allow dumping
> > the actual TCP state and restore at reconnect, at least that is what I
> > have in my mind.
>
> Thanks. That's not usable as is, indeed.
> Also, by retransmitting data from the previous send-queue, we risk
> resending messages that the peer already received (for example because
> the previous connection didn't receive the latest ACKs). I guess that
> receiving the same DLM messages twice is going to confuse the peer.
> So it looks like we'll need application level sequence numbers anyway.

I agree, the new "retransmit all unacknowledged messages on reconnect"
method will filter at the receiving side the already received messages
because they have the sequence numbers, this case occurs a lot.

However I think there is still the possibility to use TCP_REPAIR here,
we need to restore states about all 3 queues, rx, tx (write,
retransmit) and sequence numbers. Window size is an optional
additional thing. On the application layer we need to be sure that we
don't drop anything if error occurs and start to transmit them after
restoring the state again. Of course both endpoints need to support it
and have been correctly configured.

- Alex

