Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9CA4C354611
	for <lists+cluster-devel@lfdr.de>; Mon,  5 Apr 2021 19:34:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617644058;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Pe2DLhZdmgfGv74uFbChNVqHa1m1xWtc5yZiFPoe5+I=;
	b=YltUF76oP/wGhdYWd94LT8YE0V3/WllGabjruMULHm4VYKAPUm+ARRJKjSV1K7RBL60A6b
	726TOIPiTrtVE2xUilf4M6MhdMfXfIgl7W5aAjvaQzxYyPd7uO/TBCx4wGf56LXfhXlW0F
	dy9EAuJHG4dko6MXinet1+g+R5fz+C4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-tox4_XEPPxWWwrM4IQvd4Q-1; Mon, 05 Apr 2021 13:34:16 -0400
X-MC-Unique: tox4_XEPPxWWwrM4IQvd4Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA6131800D41;
	Mon,  5 Apr 2021 17:34:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 808B17192A;
	Mon,  5 Apr 2021 17:34:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E250F4BB7C;
	Mon,  5 Apr 2021 17:34:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 135HY7YG029235 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 5 Apr 2021 13:34:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0CF0D2026D60; Mon,  5 Apr 2021 17:34:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 073622026D7F
	for <cluster-devel@redhat.com>; Mon,  5 Apr 2021 17:34:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64512185A7B5
	for <cluster-devel@redhat.com>; Mon,  5 Apr 2021 17:34:04 +0000 (UTC)
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
	[209.85.166.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-26-_KHQAQxUMO60ePO_3pqQUg-1; Mon, 05 Apr 2021 13:34:00 -0400
X-MC-Unique: _KHQAQxUMO60ePO_3pqQUg-1
Received: by mail-io1-f70.google.com with SMTP id e11so11358982ioh.11
	for <cluster-devel@redhat.com>; Mon, 05 Apr 2021 10:34:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Pe2DLhZdmgfGv74uFbChNVqHa1m1xWtc5yZiFPoe5+I=;
	b=c2ouJ+xAj3/V8+P89FG5AAbIKmVK4dUp1akRNGKEYyrwBlVIVnIQWIYso6/r+YOcKs
	wTw2w1OFO1QmjTW9jU5MiUN7l8P9uJY6XBLLFX7pP1CFRTRXXgKJ8AW0yhDd+50hyDmH
	0lVoUqwsR1Hvd6y238Lci5iCrlUeO6ovr1RxNeyIXSM1sN7JvqG3HNDMP9OkSh0+EMKs
	Ddv//juZIS+niVjQY6/Jp23bpnOSzVAIBtSUQ5aTklhJv5ahsy5ck/MtGHUW5g11NjSx
	eo+nKlVN1XuBwa12zAwsH/7yFjB7PSGITjMefahZ5PauqQty9tK4SHsf9yxv5AvG9Rc/
	zpXw==
X-Gm-Message-State: AOAM530dQfit/xJQQYNzdmcVxFB9RIlQXGUuJHcjfe+MMNC0TrqVP2WK
	zdupaZm0Y1zlZXUmdLQeCJTpEytv6ZR976tbpQkdbJCRLlIfgghSkb6GbcbN7KFcWZFgFE4MB3F
	mnsWR51SEzab+4BV409uxJ2H6l+iwlX13cR/j6g==
X-Received: by 2002:a05:6e02:bc4:: with SMTP id
	c4mr20497107ilu.169.1617644039982; 
	Mon, 05 Apr 2021 10:33:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysdEtiygPMqhG9cFJ8BUhByJQyYEv87yQZKr2gzJ6D7MfiRt5hUZAERYgFQVTrug1c73C/VIg+uqBkNrjP4po=
X-Received: by 2002:a05:6e02:bc4:: with SMTP id
	c4mr20497096ilu.169.1617644039790; 
	Mon, 05 Apr 2021 10:33:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210326173337.44231-1-aahringo@redhat.com>
	<20210326173337.44231-8-aahringo@redhat.com>
	<20210402205351.GA24027@linux-2.home>
	<CAK-6q+hnj94xQS+QceDF3GyDR78ns61-T1UVLs7o6kJsPzT=Fw@mail.gmail.com>
In-Reply-To: <CAK-6q+hnj94xQS+QceDF3GyDR78ns61-T1UVLs7o6kJsPzT=Fw@mail.gmail.com>
From: Alexander Ahring Oder Aring <aahringo@redhat.com>
Date: Mon, 5 Apr 2021 13:33:48 -0400
Message-ID: <CAK-6q+giMt8HUg5jY0msrKGazUeRnGNqC6nNPqNa2Mca8NRCuQ@mail.gmail.com>
To: Guillaume Nault <gnault@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Sat, Apr 3, 2021 at 11:34 AM Alexander Ahring Oder Aring
<aahringo@redhat.com> wrote:
>
...
>
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
>

I have an implementation of this running and so far I don't see any problems.

> > Also, couldn't we set the DLM sequence numbers in
> > dlm_midcomms_commit_buffer_3_2() rather than using a callback function
> > in dlm_lowcomms_new_buffer()?
> >
...
>
> Yes, I looked into TCP_REPAIR at first and I agree it can be used to
> solve this problem. However TCP_REPAIR can be used as a part of a more
> generic solution, there needs to be something "additional handling"
> done e.g. additional socket options to let the application layer save
> states before receiving errors. I am also concerned how it would work

The code [0] is what I meant above. It will call
tcp_write_queue_purge(); before reporting the error over error
queue/callback. That need to be handled differently to allow dumping
the actual TCP state and restore at reconnect, at least that is what I
have in my mind.

- Alex

[0] https://elixir.bootlin.com/linux/v5.12-rc6/source/net/ipv4/tcp_input.c#L4239

