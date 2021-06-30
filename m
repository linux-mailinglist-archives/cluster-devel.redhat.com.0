Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9AF803B822F
	for <lists+cluster-devel@lfdr.de>; Wed, 30 Jun 2021 14:32:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1625056361;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=RQZ34p00W47EK/M00vu4N1h6gunJeEQ5RDsJI1DSqqg=;
	b=BMz7kxl5Dr7NHVFxnUtRjagQkNk6VctLiuc7hwAYd0+U3DIlcbat0iC2AhfF5jhF1x7PD+
	36AG1GYvOVDfjaO+v3VmjfbGEvHBnJRgBjJ5sRcizeLSrhmAcyDehP/eZ+3ldqrX6fm0pS
	sBlCq+4vooO/fLL2eAGFjVGvLZrr4XA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-5khSPQZWNvilb1MQuZeIqQ-1; Wed, 30 Jun 2021 08:32:39 -0400
X-MC-Unique: 5khSPQZWNvilb1MQuZeIqQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D15F0804310;
	Wed, 30 Jun 2021 12:32:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F176360854;
	Wed, 30 Jun 2021 12:32:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B6AF21809C99;
	Wed, 30 Jun 2021 12:32:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15UCUAY1007505 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 30 Jun 2021 08:30:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 964681014606; Wed, 30 Jun 2021 12:30:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 90C2E1017CB8
	for <cluster-devel@redhat.com>; Wed, 30 Jun 2021 12:30:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 252388011AF
	for <cluster-devel@redhat.com>; Wed, 30 Jun 2021 12:30:08 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
	[209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-591-8dqK2Qa9OIuvQG-yAxkpwQ-1; Wed, 30 Jun 2021 08:30:06 -0400
X-MC-Unique: 8dqK2Qa9OIuvQG-yAxkpwQ-1
Received: by mail-wr1-f69.google.com with SMTP id
	r2-20020a5d6c620000b029011a8a299a4dso888629wrz.17
	for <cluster-devel@redhat.com>; Wed, 30 Jun 2021 05:30:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RQZ34p00W47EK/M00vu4N1h6gunJeEQ5RDsJI1DSqqg=;
	b=n/qQxUBa9S/ecwHvts6q9fIopl4wkQOP6I4hgxCn/LY9QSqycc3YvE6Ha9hDVHb9sZ
	67t0N6EmQggLfshHF3XDhGq6OdNbXYnXtbyaqlMxq3d3+dAIQg7TTj724q3IKByFSobk
	ahtNdZKBPUlJ4GPeTC62O/r61b+qf5UfJJuBw2qNoDUock+mqo+dL5uG9H3tXYiNm7+u
	Ed7+hDylllHBdBpo71szE5L9P+7gt9VM0qiLYZonGyn8CCDhwklajAjg/+y4VjIjcGqL
	YsoXBX/t/GttyJbU+qgjUNJbkRfCg914c3cN6/W+1LQYxhdgFCm1WJRt4rKQC7tWzml2
	aztg==
X-Gm-Message-State: AOAM533ltdXFSlt/LBzioXtAqUCnI3ECDH7lRcBjOo1+xgk36gr9Tdkn
	uw860lx0eXGhyIjKhORPHKXdXlAUKhfQ8Oa0DWwFfMgD+Pa4Y+sk9r65Ef9Bf6Cny08xuAqr/WS
	vDB89B+bf0eVXyU1Qwd8+FBOHPZWZY10HEGHGTw==
X-Received: by 2002:a5d:64a1:: with SMTP id m1mr38417842wrp.377.1625056204779; 
	Wed, 30 Jun 2021 05:30:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiKZD8yv7AFvQByvy6FrFUeDUZiI9d4+EOWLz8GJb+ib2SSR1Xzbba+opGBb3gRXer0OrDHoNpt28PzPvCzZU=
X-Received: by 2002:a5d:64a1:: with SMTP id m1mr38417829wrp.377.1625056204627; 
	Wed, 30 Jun 2021 05:30:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210628172727.1894503-1-agruenba@redhat.com>
	<YNoJPZ4NWiqok/by@casper.infradead.org>
	<YNoLTl602RrckQND@infradead.org>
	<YNpGW2KNMF9f77bk@casper.infradead.org>
	<YNqvzNd+7+YtXfQj@infradead.org>
In-Reply-To: <YNqvzNd+7+YtXfQj@infradead.org>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 30 Jun 2021 14:29:53 +0200
Message-ID: <CAHc6FU7+Q0D_pnjUbLXseeHfVQZ2nHTKMzH+0ppLh9cpX-UaPg@mail.gmail.com>
To: "Darrick J . Wong" <djwong@kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH 0/2] iomap: small block problems
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Darrick,

On Tue, Jun 29, 2021 at 7:47 AM Christoph Hellwig <hch@infradead.org> wrote:
> On Mon, Jun 28, 2021 at 10:59:55PM +0100, Matthew Wilcox wrote:
> > > > so permit pages without an iop to enter writeback and create an iop
> > > > *then*.  Would that solve your problem?
> > >
> > > It is the right thing to do, especially when combined with a feature
> > > patch to not bother to create the iomap_page structure on small
> > > block size file systems when the extent covers the whole page.
> >
> > We don't know the extent layout at the point where *this* patch creates
> > iomap_pages during writeback.  I imagine we can delay creating one until
> > we find out what our destination layout will be?
>
> Hmm.  Actually ->page_mkwrite is always is always called on an uptodate
> page and we even assert that.  I should have remembered the whole page
> fault path better.
>
> So yeah, I think we should take patch 1 from Andreas, then a non-folio
> version of your patch as a start.

will you pick up those two patches and push them to Linus? They both
seem pretty safe.

Thanks,
Andreas

