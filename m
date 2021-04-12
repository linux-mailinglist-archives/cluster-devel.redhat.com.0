Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id CAE6935CA44
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Apr 2021 17:42:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618242153;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=zVFlOQIKsbDtmM0t2lJ+0TBYJVRS0MmP/XcG40rdfA8=;
	b=TigeeOzMQkwDeqq/G1ovosjGCJiFWeEsC52/0fkOzXXZJAAcZBV2A4twhqhjw4EkxctCWA
	7x7tnwh30tYwh2KOv+dohXqOm1mopWGqScBwW3kESR5HU8LGm3JM/9vrHlY+OmBmYMrOb4
	BGlzOdpnhd5TGVjA5hzZr8qmmabUgM8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-685ADrX3NAue2VJtW4GPzA-1; Mon, 12 Apr 2021 11:42:32 -0400
X-MC-Unique: 685ADrX3NAue2VJtW4GPzA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FF04DF8AD;
	Mon, 12 Apr 2021 15:42:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 751635C1C2;
	Mon, 12 Apr 2021 15:42:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3515C1806D0E;
	Mon, 12 Apr 2021 15:42:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13CFgQD3000873 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 12 Apr 2021 11:42:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D6F8262181; Mon, 12 Apr 2021 15:42:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D1259621BD
	for <cluster-devel@redhat.com>; Mon, 12 Apr 2021 15:42:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E903C85A5A8
	for <cluster-devel@redhat.com>; Mon, 12 Apr 2021 15:42:23 +0000 (UTC)
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
	[209.85.166.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-476-esArtjgfPfaO2SbrsQcScg-1; Mon, 12 Apr 2021 11:42:22 -0400
X-MC-Unique: esArtjgfPfaO2SbrsQcScg-1
Received: by mail-io1-f69.google.com with SMTP id v14so2723257iob.5
	for <cluster-devel@redhat.com>; Mon, 12 Apr 2021 08:42:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zVFlOQIKsbDtmM0t2lJ+0TBYJVRS0MmP/XcG40rdfA8=;
	b=D5pmXF+xUFUNVlnFkgi0DIVg5UTB8LKTX6zbmicojYwd3JBkyz8XE/w7D3K5nyaZaV
	dXSM3hjPQymnDrRrR6iSzWwTc5iXBlHdONxrtnOFAL6ARlujLZaDO/2N7C5HshFgwx4R
	qBJRgrBN4FwasURT9iBP+Z/sn3dr7IaB9BFjEvimANMW/OTLd5lPR0Yq76lVHYWwNOVR
	GOvA9CtNM4C5CrTff9byxbJJ1RxOfM1pQB3T6PfwbYIteoDgsnnbP8D7siRlG+06y3DV
	A0Tw2FroDSxJSQ9prYjXTWC08h4G2ZE8QIDXvOFWr+ZEwZF0SnFubSrWIHbbDG1/Nsu8
	M+5g==
X-Gm-Message-State: AOAM532xKbB7ylBez3QsjTTqgSwuTyWxgIt+uOAUmUz+a38wFJ/Pkm7a
	d9va5AW3ncnG1kxhEbdr/4O5UuwbVtLk0NJ6iyYkbSw2HSzbPqDZCyfcgquGhqpFQ1kp8iv7EjJ
	dunNEtmuQI4JfzbckZMVjRWzu+As04E2bwEHB1w==
X-Received: by 2002:a02:70d6:: with SMTP id
	f205mr29084653jac.124.1618242141308; 
	Mon, 12 Apr 2021 08:42:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWVe8PceCoB1Azst0LTqnyIceXNPjyD0Ulx/MZN6ML4UFC8yAWdQTo/5XRLnH8bFqwRIHiAOHZDokqYSUXTn8=
X-Received: by 2002:a02:70d6:: with SMTP id
	f205mr29084637jac.124.1618242141093; 
	Mon, 12 Apr 2021 08:42:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210326173337.44231-1-aahringo@redhat.com>
	<20210326173337.44231-8-aahringo@redhat.com>
	<20210402205351.GA24027@linux-2.home>
	<CAK-6q+hnj94xQS+QceDF3GyDR78ns61-T1UVLs7o6kJsPzT=Fw@mail.gmail.com>
	<CAK-6q+giMt8HUg5jY0msrKGazUeRnGNqC6nNPqNa2Mca8NRCuQ@mail.gmail.com>
	<20210409204443.GC30244@linux-2.home>
	<CAK-6q+gBDO2UO78ohssyLdqRsjvkcMYw9H6v2DvDJZL-VdhpZQ@mail.gmail.com>
In-Reply-To: <CAK-6q+gBDO2UO78ohssyLdqRsjvkcMYw9H6v2DvDJZL-VdhpZQ@mail.gmail.com>
From: Alexander Ahring Oder Aring <aahringo@redhat.com>
Date: Mon, 12 Apr 2021 11:42:10 -0400
Message-ID: <CAK-6q+hvV2L+XeUzLTzwEK4NCpupgAoLxH6a9+833KDjSAtZRw@mail.gmail.com>
To: Guillaume Nault <gnault@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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

On Mon, Apr 12, 2021 at 11:30 AM Alexander Ahring Oder Aring
<aahringo@redhat.com> wrote:
>
> Hi,
>
> On Fri, Apr 9, 2021 at 4:44 PM Guillaume Nault <gnault@redhat.com> wrote:
> >
> > On Mon, Apr 05, 2021 at 01:33:48PM -0400, Alexander Ahring Oder Aring wrote:
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
> > >
> > > > > Also, couldn't we set the DLM sequence numbers in
> > > > > dlm_midcomms_commit_buffer_3_2() rather than using a callback function
> > > > > in dlm_lowcomms_new_buffer()?
> > > > >
> > > ...
> > > >
> > > > Yes, I looked into TCP_REPAIR at first and I agree it can be used to
> > > > solve this problem. However TCP_REPAIR can be used as a part of a more
> > > > generic solution, there needs to be something "additional handling"
> > > > done e.g. additional socket options to let the application layer save
> > > > states before receiving errors. I am also concerned how it would work
> > >
> > > The code [0] is what I meant above. It will call
> > > tcp_write_queue_purge(); before reporting the error over error
> > > queue/callback. That need to be handled differently to allow dumping
> > > the actual TCP state and restore at reconnect, at least that is what I
> > > have in my mind.
> >
> > Thanks. That's not usable as is, indeed.
> > Also, by retransmitting data from the previous send-queue, we risk
> > resending messages that the peer already received (for example because
> > the previous connection didn't receive the latest ACKs). I guess that
> > receiving the same DLM messages twice is going to confuse the peer.
> > So it looks like we'll need application level sequence numbers anyway.
>
> I agree, the new "retransmit all unacknowledged messages on reconnect"
> method will filter at the receiving side the already received messages
> because they have the sequence numbers, this case occurs a lot.
>
> However I think there is still the possibility to use TCP_REPAIR here,
> we need to restore states about all 3 queues, rx, tx (write,
> retransmit) and sequence numbers. Window size is an optional
> additional thing. On the application layer we need to be sure that we
> don't drop anything if error occurs and start to transmit them after
> restoring the state again. Of course both endpoints need to support it
> and have been correctly configured.


I am not sure if this ends in something like "ignore some error cases
in TCP", at least TCP_RST is something which seems to be triggered
sometimes because "smart hardware" in the network e.g. but cable out
and in again (not sure about that one). I think restoring the state
might be work, but transparent proxies (haproxy, etc.) could be
confused? I am not sure here...

- Alex

