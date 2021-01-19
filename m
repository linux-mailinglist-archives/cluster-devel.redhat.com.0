Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id EFF012FBB08
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Jan 2021 16:23:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611069821;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=X0LTWMkejL0qocdHS9GVqE/An7fXJmW8XPIqJsnP+xk=;
	b=XgRdq6cfwKfos5zn/cd+Hv3+3qmwS10odEB3xvY1RxTAp28Xr3N7HyZmma52Mbtol9Yvf8
	wclqUfxK53IgYPj62hYJRTGfFMTigigkeFNsStz82sdohjMe5EQz4bli4kuyqolJZJrXZl
	zZTYPYLOCGibvrvmptGh+ANmbn1Ic/w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-ez4WEpcgMUqTTY6zzTrYxA-1; Tue, 19 Jan 2021 10:23:36 -0500
X-MC-Unique: ez4WEpcgMUqTTY6zzTrYxA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD272800D53;
	Tue, 19 Jan 2021 15:23:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A41CE60C7A;
	Tue, 19 Jan 2021 15:23:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E02BA4A7C7;
	Tue, 19 Jan 2021 15:23:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10JFNSZa027295 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 19 Jan 2021 10:23:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 687012026D12; Tue, 19 Jan 2021 15:23:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6323A2026D11
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 15:23:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E0B3101AA40
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 15:23:23 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
	[209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-535-k0K8c-T1PYSODO0NAk3ynA-1; Tue, 19 Jan 2021 10:23:21 -0500
X-MC-Unique: k0K8c-T1PYSODO0NAk3ynA-1
Received: by mail-wr1-f69.google.com with SMTP id w5so9944319wrl.9
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 07:23:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=X0LTWMkejL0qocdHS9GVqE/An7fXJmW8XPIqJsnP+xk=;
	b=CawlQHhZzPX9USxpAJ5hnudz8LQyR/hvCaQFGqGKpPRHZhzcDDi29+Ei4DlGm76Kg0
	NNXnV4oqfD3WuQGf4dsvkrxIDgOttog1W8tDpvZvqFBIp4k8A1L5hq3DyIlT5EIVZo2O
	TXPnTpIibaC7AmWBc5tyCz151gkczLFFmQzkV2OmrfYPF1OCUZIzN967cmOXc94bwjA4
	V7atdBK6m4QDVQ9HXvxxWeCgPiyUj7f8asyc4VtF2fOJsQgBw70VovBgJZWtvqw4cyq/
	+jmHmDZgQWlYEXHHDmkIGnNdgnUmVlKIWaBvhCUxDx/hyd7WXuhAZKCySA/XjwY7OV5C
	dTmQ==
X-Gm-Message-State: AOAM530SVKdlK28Z4mb562kI0Ay20gEdrU2+LqCGgklgP7iFboIgKI6I
	OOYaBtRUVc2+Szi+ITXeczMw1lqxOVTw5xydDdZio9yEfk/8eoA4LPu9rX7L0YRHALNeCSwc1jU
	Lym5heDwOWqvM0Zpl1+z5oIlryM4xrRd7q3Kh+w==
X-Received: by 2002:a5d:4491:: with SMTP id j17mr4861010wrq.78.1611069800577; 
	Tue, 19 Jan 2021 07:23:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/FyE6ed2kHtR/YiWgrPBfjdEhY5EwY3qaLTsQWpBA3cRnTmnZvdqmMPTU1BlaqWUsgV0asPoD+tqltDcDzZY=
X-Received: by 2002:a5d:4491:: with SMTP id j17mr4861004wrq.78.1611069800481; 
	Tue, 19 Jan 2021 07:23:20 -0800 (PST)
MIME-Version: 1.0
References: <2125295377.38904313.1608669538740.JavaMail.zimbra@redhat.com>
	<51252ca2-fa56-acb8-24cf-fb2e992f76de@redhat.com>
	<561946972.42407585.1609776564024.JavaMail.zimbra@redhat.com>
In-Reply-To: <561946972.42407585.1609776564024.JavaMail.zimbra@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 19 Jan 2021 16:23:08 +0100
Message-ID: <CAHc6FU7T5RzFhPWF_YbZY9a7+goVTPKrOybh46e12xe6zhL99Q@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH] gfs2: make recovery workqueue
 operate on a gfs2 mount point, not journal
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 4, 2021 at 5:09 PM Bob Peterson <rpeterso@redhat.com> wrote:
>
> Hi,
>
> ----- Original Message -----
> > Hi,
> >
> > On 22/12/2020 20:38, Bob Peterson wrote:
> > > Hi,
> > >
> > > Before this patch, journal recovery was done by a workqueue function that
> > > operated on a per-journal basis. The problem is, these could run
> > > simultaneously
> > > which meant that they could all use the same bio, sd_log_bio, to do their
> > > writing to all the various journals. These operations overwrote one another
> > > eventually causing memory corruption.
> >
> > Why not just add more bios so that this issue goes away? It would make
> > more sense than preventing recovery from running in parallel. In general
> > recovery should be spread amoung nodes anyway, so the case of having
> > multiple recoveries running on the same node in parallel should be
> > fairly rare too,
> >
> > Steve.
>
> As I understand it, if we allocate a bio from the same bio_set (as bio_alloc does)
> we need to submit the previous bio before getting the next one, which means
> recovery processes cannot work in parallel, even if they use different bio pointers.

Each recovery worker submits the current bio before allocating the
next, so in the worst possible case, the recovery workers will end up
getting serialized (that is, they will sleep in bio_alloc until they
get their turn).

Andreas

