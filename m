Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id B96CE367000
	for <lists+cluster-devel@lfdr.de>; Wed, 21 Apr 2021 18:21:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619022109;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=6YHmZ8qea2nh06Q9cz//wvNe8J0xw+W1ZPeA/uEMFec=;
	b=PRbk5hOM5UhL6gt4wVm7uzTOynEdTt+Qn8LyUjtUMwqQQwobW1nYlF0H7VTxmOtFTpAlH1
	N+Ygjt2n9QXCsnZda9ZsZr5XAjqVk48fsfSwrJEhb8FSYx9JNpSrQtQn+UkAxUgXY2j4jQ
	+rlZ1tfvCDkp5mWmnjVhnwMpj/hxzC4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-N80gVzDJPGO_RDo5KmKs0Q-1; Wed, 21 Apr 2021 12:21:48 -0400
X-MC-Unique: N80gVzDJPGO_RDo5KmKs0Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 422B81006C86;
	Wed, 21 Apr 2021 16:21:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AEFEF610A8;
	Wed, 21 Apr 2021 16:21:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4E75344A58;
	Wed, 21 Apr 2021 16:21:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13LGLbMq011311 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 21 Apr 2021 12:21:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BE81120B4AC8; Wed, 21 Apr 2021 16:21:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B98C420B4ACF
	for <cluster-devel@redhat.com>; Wed, 21 Apr 2021 16:21:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5494EA28805
	for <cluster-devel@redhat.com>; Wed, 21 Apr 2021 16:21:33 +0000 (UTC)
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
	[209.85.166.199]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-472-vqYb4LSMNge8T3Mih5E_ig-1; Wed, 21 Apr 2021 12:21:26 -0400
X-MC-Unique: vqYb4LSMNge8T3Mih5E_ig-1
Received: by mail-il1-f199.google.com with SMTP id
	t15-20020a92dc0f0000b029016b11675c42so16410553iln.3
	for <cluster-devel@redhat.com>; Wed, 21 Apr 2021 09:21:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6YHmZ8qea2nh06Q9cz//wvNe8J0xw+W1ZPeA/uEMFec=;
	b=YEZoQUevOK71VxCg9OsTCtJ8HhRQ+VOLHcDmlUY7AsdMGtfr8vgtjBavSkeWIqsJ0c
	9Hv+XujsZR7GxFG+a6kNIefppbw08MP0/CqeaYCv4ozBoIwu7gJoJrHCQX+oQpp4hOyG
	V9QIaaX+jcncH0OG85jJWAByfpgKBRk5/IuPxJaBRWvl8S0jQm4mmlDbshrJNUIGWdpM
	hapgt1KqpP7PEA/XP5URSBog3bLgiSonxZPY2GDHqqgqplYzeV+/HYLDciEEuHnbI6Sn
	p91rSVbSsxPnG6allfXpCX3cWWpaZbfvgItwWAzWVvjdAU/S4DDHPEpvcIr4J6FQJ6yP
	FrMw==
X-Gm-Message-State: AOAM533RuRXZ6PSfnDGGlrd324PT9/IbGRRSCNLWZCCVXJPDOJ9Weuwn
	i4Iwc21w7ky9DqyO/k9hzzr/fbrjBPsBD6qchRXskbF9+zE1avrAYHe1osRQcF53sTb1MiB86sx
	+vWzAY9dGgy2+QM5X+7WFWv2iCeoKwRazetEtSg==
X-Received: by 2002:a05:6602:8cf:: with SMTP id
	h15mr3367046ioz.148.1619022086250; 
	Wed, 21 Apr 2021 09:21:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2UtEvTSGdziV0eHoczYznycatgyisCvJG4Da2uPGAF4oMSaf395yvYcfNLXgIsPHC1tNuY05Rb+xw4u1KnZE=
X-Received: by 2002:a05:6602:8cf:: with SMTP id
	h15mr3367032ioz.148.1619022086119; 
	Wed, 21 Apr 2021 09:21:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210326173337.44231-1-aahringo@redhat.com>
	<20210326173337.44231-8-aahringo@redhat.com>
	<20210402205351.GA24027@linux-2.home>
	<CAK-6q+hnj94xQS+QceDF3GyDR78ns61-T1UVLs7o6kJsPzT=Fw@mail.gmail.com>
	<20210409203221.GB30244@linux-2.home>
	<CAK-6q+jog8D6YcSc807wL08eQWqnUSX6iU+dkka+E5iGJzxKZg@mail.gmail.com>
In-Reply-To: <CAK-6q+jog8D6YcSc807wL08eQWqnUSX6iU+dkka+E5iGJzxKZg@mail.gmail.com>
From: Alexander Ahring Oder Aring <aahringo@redhat.com>
Date: Wed, 21 Apr 2021 12:21:15 -0400
Message-ID: <CAK-6q+hsjkLvHtvxKuU595jh1fWA4h7VzQspyJsbZytbWTFx2Q@mail.gmail.com>
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

On Mon, Apr 12, 2021 at 11:21 AM Alexander Ahring Oder Aring
<aahringo@redhat.com> wrote:
>
> Hi,
>
> On Fri, Apr 9, 2021 at 4:32 PM Guillaume Nault <gnault@redhat.com> wrote:
> ...
> > >
> > > Yes, there is one thing missing. I detected a synchronization issue
> > > because the node membership of a lockspace is done by a different
> > > protocol handled in user space. This protocol declares the actual peer
> > > of the DLM protocol. In short, there are two protocols here, whereas
> > > one handles the membership of peers and the other handles the actual
> > > operations. There is a missing synchronization between operations and
> > > membership which I solved with a DLM_FIN message.
> >
> > Thanks, I'll re-read the parts about DLM_FIN with this explanation in
> > mind.
> >
>
> okay. Thank you.
>

Additional note:

The DLM_FIN is like a 4 way close handshake with the possibility of
having a half-close socket. We probably can do that on TCP with
shutdown, but not on SCTP. However it's now on the application layer.

- Alex

