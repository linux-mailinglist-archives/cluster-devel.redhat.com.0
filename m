Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 558ED35A81A
	for <lists+cluster-devel@lfdr.de>; Fri,  9 Apr 2021 22:48:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618001299;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=+w97EnvkIxCbwHwxFQIEHOjm0xpagg3mqk4+fswrNFI=;
	b=esBoK5xr5uib+IIYPg2aIy+htAESYBIJ/ZE8SFoMIu4QTo4xphKnNp8HFhgSRrx+TdD7G6
	ZqRCiWmyy1BT5OyXZnxpI9J75HOYGKG/j+/WPSJazWKlMq/gVoEOyFbgGthIBCdL3aK3oS
	d1xg3q1mE3ItpUnNQayT2Ew4577YU3U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-wkfDgsOaPKi2RwtGtNh83w-1; Fri, 09 Apr 2021 16:48:14 -0400
X-MC-Unique: wkfDgsOaPKi2RwtGtNh83w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58028107ACC7;
	Fri,  9 Apr 2021 20:48:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47CB25C1A1;
	Fri,  9 Apr 2021 20:48:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0A10355345;
	Fri,  9 Apr 2021 20:48:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 139Kiq56028394 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 9 Apr 2021 16:44:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BF142207529C; Fri,  9 Apr 2021 20:44:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B97502075297
	for <cluster-devel@redhat.com>; Fri,  9 Apr 2021 20:44:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2531585A5AA
	for <cluster-devel@redhat.com>; Fri,  9 Apr 2021 20:44:50 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
	[209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-11-sLbpGtvNMXeFGAavMLOhGA-1; Fri, 09 Apr 2021 16:44:48 -0400
X-MC-Unique: sLbpGtvNMXeFGAavMLOhGA-1
Received: by mail-wr1-f69.google.com with SMTP id z12so2771652wro.22
	for <cluster-devel@redhat.com>; Fri, 09 Apr 2021 13:44:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=+w97EnvkIxCbwHwxFQIEHOjm0xpagg3mqk4+fswrNFI=;
	b=jBp1gKKY0Mnja+nF9ifc1EMK+/6OL5c3SRCcv5SeBA7+U/wySm0doRIL9Funo0MI60
	Tb2KRljMMyB3wxRWoztDHK/G4c4LpQIGumyehH+I/ny5OpoWzvhH7FhzBR3AXhPdJdzs
	GlCY3h1fPMNro5PqrJ9UEJDlNlTtyZ2YA4EKSX/VrzuTMA/grkb8inV4KqjouOy+yrdh
	hJI4/eVvJBoAJ92HLhNc4Xx7X6HUQqlGqFAC8pVQrbhuctP/1dZB4G1K1hg9KhwjLMmC
	luSzK2R586X011DCl0Mrmlv+952cfXA8Bh74AGxORLxgNa1MyLCB9Z41/IdOk3coX511
	CtOg==
X-Gm-Message-State: AOAM533zTmLKRv/InYLy6DkDsY4CruV3uVy+FFL3YKXqMVyUBsluBa5M
	ihfI8P5WzI0sbp82eNjKT81Q26yJgk0OpRYrGwiTvbg9AGjLr2dp2SArjM9VkHuFhnNHQ4x/L9x
	Tl7jw0v2SPaTMw82nrBw2Mg==
X-Received: by 2002:a05:6000:550:: with SMTP id
	b16mr151671wrf.378.1618001087297; 
	Fri, 09 Apr 2021 13:44:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyl+0IxCz0chmVtkmWdl9aWmKu+rHRd3Lf3SGmj9+T+aqm3Nq3bqq88xgtgqKn2LuCk3Uhcbw==
X-Received: by 2002:a05:6000:550:: with SMTP id
	b16mr151664wrf.378.1618001087181; 
	Fri, 09 Apr 2021 13:44:47 -0700 (PDT)
Received: from linux-2.home
	(2a01cb058918ce00dd1a5a4f9908f2d5.ipv6.abo.wanadoo.fr.
	[2a01:cb05:8918:ce00:dd1a:5a4f:9908:f2d5])
	by smtp.gmail.com with ESMTPSA id
	g84sm5284342wmf.30.2021.04.09.13.44.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 09 Apr 2021 13:44:45 -0700 (PDT)
Date: Fri, 9 Apr 2021 22:44:43 +0200
From: Guillaume Nault <gnault@redhat.com>
To: Alexander Ahring Oder Aring <aahringo@redhat.com>
Message-ID: <20210409204443.GC30244@linux-2.home>
References: <20210326173337.44231-1-aahringo@redhat.com>
	<20210326173337.44231-8-aahringo@redhat.com>
	<20210402205351.GA24027@linux-2.home>
	<CAK-6q+hnj94xQS+QceDF3GyDR78ns61-T1UVLs7o6kJsPzT=Fw@mail.gmail.com>
	<CAK-6q+giMt8HUg5jY0msrKGazUeRnGNqC6nNPqNa2Mca8NRCuQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK-6q+giMt8HUg5jY0msrKGazUeRnGNqC6nNPqNa2Mca8NRCuQ@mail.gmail.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 05, 2021 at 01:33:48PM -0400, Alexander Ahring Oder Aring wrote:
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
> 
> > > Also, couldn't we set the DLM sequence numbers in
> > > dlm_midcomms_commit_buffer_3_2() rather than using a callback function
> > > in dlm_lowcomms_new_buffer()?
> > >
> ...
> >
> > Yes, I looked into TCP_REPAIR at first and I agree it can be used to
> > solve this problem. However TCP_REPAIR can be used as a part of a more
> > generic solution, there needs to be something "additional handling"
> > done e.g. additional socket options to let the application layer save
> > states before receiving errors. I am also concerned how it would work
> 
> The code [0] is what I meant above. It will call
> tcp_write_queue_purge(); before reporting the error over error
> queue/callback. That need to be handled differently to allow dumping
> the actual TCP state and restore at reconnect, at least that is what I
> have in my mind.

Thanks. That's not usable as is, indeed.
Also, by retransmitting data from the previous send-queue, we risk
resending messages that the peer already received (for example because
the previous connection didn't receive the latest ACKs). I guess that
receiving the same DLM messages twice is going to confuse the peer.
So it looks like we'll need application level sequence numbers anyway.

> - Alex
> 
> [0] https://elixir.bootlin.com/linux/v5.12-rc6/source/net/ipv4/tcp_input.c#L4239
> 

