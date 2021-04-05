Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id CEEF8354795
	for <lists+cluster-devel@lfdr.de>; Mon,  5 Apr 2021 22:29:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617654585;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=NOSOBmRyFdFwFo8taAfMrSx8g6fjYlebKhNvU5t4eoc=;
	b=JxA4dIBMbZwecN3IHtQYtIJjImJWVOSpqxeS/CSVvxV9p1b0Aff1R1xdGIoCLFcewx7xTS
	ObUNRuzrQAnEvVid6c60ZMQkXYNuD+PE+LZeDaZIhf70R23HMJg+NsCktctOChEpyVxynj
	9VpvOh6WByDyc6arO3SvYTJgU2gCODE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-52-AyowOQQ5M4GZ99tM1MQBmw-1; Mon, 05 Apr 2021 16:29:44 -0400
X-MC-Unique: AyowOQQ5M4GZ99tM1MQBmw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F4DC8143F2;
	Mon,  5 Apr 2021 20:29:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F3DA610A8;
	Mon,  5 Apr 2021 20:29:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4EBB61809C84;
	Mon,  5 Apr 2021 20:29:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 135KTV9H012770 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 5 Apr 2021 16:29:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1BFD02166BCC; Mon,  5 Apr 2021 20:29:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 152972166B2D
	for <cluster-devel@redhat.com>; Mon,  5 Apr 2021 20:29:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3B5F811E7A
	for <cluster-devel@redhat.com>; Mon,  5 Apr 2021 20:29:23 +0000 (UTC)
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
	[209.85.166.199]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-257-OOBaSBKmNcmOh0DzbWhj7g-1; Mon, 05 Apr 2021 16:29:22 -0400
X-MC-Unique: OOBaSBKmNcmOh0DzbWhj7g-1
Received: by mail-il1-f199.google.com with SMTP id s10so10261346ilo.7
	for <cluster-devel@redhat.com>; Mon, 05 Apr 2021 13:29:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NOSOBmRyFdFwFo8taAfMrSx8g6fjYlebKhNvU5t4eoc=;
	b=lOVq45f9pZahkWqj6Xnjq26bDR1ef7nDPP0haYHeOk3qwUo6Y3qG+1R+++gbrjQVm8
	98A6KRqzgngZ41TnMAk0KU+xLbWGhXw9+zyZwi3n1gbht48NYCPsTMwTrVX1UXSROVBj
	pYKocC9SQ74GIrI/vG6rumPGCuRkGHhdVCYlOiuXPbbdQMGJBbSe7IWIYO08Y1n8PoGu
	NwMbS4h9p3v8UxkfeDzEC8qsLR4WJ9Jx3Q9PJM/9oDmirsyp/y2mBGedDWy2+tTLGP0W
	eXqMi4pwL2TFwyochf12lUUHQoU79tgqhxRvgb8FCihIzAihSyC/ugrpRjvPR8H5pYVQ
	eKYg==
X-Gm-Message-State: AOAM531dzt6vbHQ9VohL3sqES5TJ9y5ozkUMMXPcr5bzilmhnn1kNlyA
	agOhYoreKOa9CqBYylqFngCOAIoQeNiMwSyRiX036JAKE6Qhh8RgnH9KtLELU+PR+mBxY+RiUG5
	kwNK3Kp1Q9jymkmtdrYEC95NGo8vOy23jZKOiqw==
X-Received: by 2002:a92:ac0a:: with SMTP id r10mr5205497ilh.45.1617654561713; 
	Mon, 05 Apr 2021 13:29:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLDXSmaET5OBs+IPkA7kBNtIYkGVf/XcLw2V+AoLAPQ7zZksWskq8RLa4FxLo5RmHm//fBUEnA5LRDijG75mg=
X-Received: by 2002:a92:ac0a:: with SMTP id r10mr5205489ilh.45.1617654561506; 
	Mon, 05 Apr 2021 13:29:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210326173337.44231-1-aahringo@redhat.com>
	<20210326173337.44231-8-aahringo@redhat.com>
	<20210402205351.GA24027@linux-2.home>
	<CAK-6q+hnj94xQS+QceDF3GyDR78ns61-T1UVLs7o6kJsPzT=Fw@mail.gmail.com>
	<CAK-6q+giMt8HUg5jY0msrKGazUeRnGNqC6nNPqNa2Mca8NRCuQ@mail.gmail.com>
In-Reply-To: <CAK-6q+giMt8HUg5jY0msrKGazUeRnGNqC6nNPqNa2Mca8NRCuQ@mail.gmail.com>
From: Alexander Ahring Oder Aring <aahringo@redhat.com>
Date: Mon, 5 Apr 2021 16:29:10 -0400
Message-ID: <CAK-6q+i5YmXV_NkwCGerPfNTjCE=or626Refuz_7CQDRhrJj1A@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, Apr 5, 2021 at 1:33 PM Alexander Ahring Oder Aring
<aahringo@redhat.com> wrote:
>
> Hi,
>
> On Sat, Apr 3, 2021 at 11:34 AM Alexander Ahring Oder Aring
> <aahringo@redhat.com> wrote:
> >
> ...
> >
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
> >
>
> I have an implementation of this running and so far I don't see any problems.

There is a problem but it's related to the behaviour how reconnections
are triggered. The whole communication can be stuck because the send()
triggers a reconnection if not connected anymore. Before, the timer
was triggering some send() and this was triggering a reconnection in a
periodic way. Therefore we never had any stuck situation where nobody
was sending anything anymore. It's a rare case but I am currently
running into it. However I think I need to change how the
reconnections are triggered with some "forever periodic try" which
should solve this issue.

- Alex

