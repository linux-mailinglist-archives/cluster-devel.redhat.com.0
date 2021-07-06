Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 901BD3BDAD5
	for <lists+cluster-devel@lfdr.de>; Tue,  6 Jul 2021 18:02:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1625587333;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=2yfndmR2iaMQIWMAd4edCOEQikxHqB5a5e0OL47C4zE=;
	b=b4+96B+vEERCKIMtHI3/vlHJfbRF/681iOgEM2LxHsorCx1DlRGJCKmWfe1RnpP1uzPomD
	rCvvXlRUWroIpRLBtQMLtNkpglL26us7AVE5bzc02PqHNLpx+KaREmzXLbYJh9c8pp+rBX
	mPCNRd4mR+u9syfMJAPa+QfjZXemzqI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-TrK9ADoRNWSxw1pmRJofjA-1; Tue, 06 Jul 2021 12:02:12 -0400
X-MC-Unique: TrK9ADoRNWSxw1pmRJofjA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABA2619200CD;
	Tue,  6 Jul 2021 16:02:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D05860864;
	Tue,  6 Jul 2021 16:02:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 892881809C99;
	Tue,  6 Jul 2021 16:02:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 166G21B2021461 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 6 Jul 2021 12:02:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C22AA200BA94; Tue,  6 Jul 2021 16:02:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD9AE2011C7B
	for <cluster-devel@redhat.com>; Tue,  6 Jul 2021 16:01:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A502802314
	for <cluster-devel@redhat.com>; Tue,  6 Jul 2021 16:01:53 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
	[209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-592-gHh9FGXlNjiGsYw9bdRoAg-1; Tue, 06 Jul 2021 12:01:48 -0400
X-MC-Unique: gHh9FGXlNjiGsYw9bdRoAg-1
Received: by mail-wr1-f72.google.com with SMTP id
	p4-20020a5d63840000b0290126f2836a61so7351717wru.6
	for <cluster-devel@redhat.com>; Tue, 06 Jul 2021 09:01:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2yfndmR2iaMQIWMAd4edCOEQikxHqB5a5e0OL47C4zE=;
	b=C4M/+cIgU0/4oKRtTQRbvQpFD7tuhUV+SC6lBfjSG7+6XcHWV/DB40bDKwvByR6nVj
	eHHBmv+7CAt+kjQhD0+XspNXKdHUeqOCKe+A9LxzzHBcJqlRRKEUcw39diKqjRwIUWxC
	JYIpuWzNGEplXmc6MDDz0EJHVYfr3IhACGq1mBswhf4PU/HxabvEtbdeEzLvM37CKHsm
	+WE4GPLl2PI8hva9U0XV0j97ijU2dr1gi6O1M1RLAqmgSBINdMous7aXp0onuky7rEsx
	W7iIyhuJT71oxoqsE7xY/yu6iTWmkYdI6tZNSenYIhQHMImcK3cS6Jo9PNRz2YZ7fg83
	K2Kg==
X-Gm-Message-State: AOAM5337AiRI4Nb94nNyrx/nPuTH5Sohu9ouFIKuOCpCcQkKTKty+mZ2
	5HoSbwBHGHRrF+B7j2lHr0/QO0TtJkIfGROf5TcFIg6jvqVot9KoKR4sLanhxInRaD0DZps262T
	yf3OljhlR15Yu8A9dxAkcEO50KiYGoJL7yHEbAA==
X-Received: by 2002:a1c:62c4:: with SMTP id w187mr4794437wmb.27.1625587306854; 
	Tue, 06 Jul 2021 09:01:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyf3SIjPzhBrTlg9BxLb8FhE5zoAaVaW0K9FFwNlBnAnkxzzGcrUqGlsbeH3InUge2TgjqNc6VPAXHKHt/Xe4Y=
X-Received: by 2002:a1c:62c4:: with SMTP id w187mr4794417wmb.27.1625587306675; 
	Tue, 06 Jul 2021 09:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210705181824.2174165-1-agruenba@redhat.com>
	<20210705181824.2174165-2-agruenba@redhat.com>
	<YOPkNnQ34vRiVYs6@infradead.org>
In-Reply-To: <YOPkNnQ34vRiVYs6@infradead.org>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 6 Jul 2021 18:01:35 +0200
Message-ID: <CAHc6FU5j7T31OknUk+_WejRw_1s9NCuq=59YExAHY2iWHCgZZA@mail.gmail.com>
To: Christoph Hellwig <hch@infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, "Darrick J . Wong" <djwong@kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH v2 1/2] iomap: Don't create iomap_page
	objects for inline files
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

On Tue, Jul 6, 2021 at 7:07 AM Christoph Hellwig <hch@infradead.org> wrote:
> On Mon, Jul 05, 2021 at 08:18:23PM +0200, Andreas Gruenbacher wrote:
> > In iomap_readpage_actor, don't create iop objects for inline inodes.
> > Otherwise, iomap_read_inline_data will set PageUptodate without setting
> > iop->uptodate, and iomap_page_release will eventually complain.
> >
> > To prevent this kind of bug from occurring in the future, make sure the
> > page doesn't have private data attached in iomap_read_inline_data.
> >
> > Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> > Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
>
> As mentioned last round I'd prefer to simply not create the iomap_page
> at all in the readpage/readpages path.

I've tried that by replacing the iomap_page_create with to_iomap_page
in iomap_readpage_actor and with that, I'm getting a
VM_BUG_ON_PAGE(!PageLocked(page)) in iomap_read_end_io -> unlock_page
with generic/029. So there's obviously more to it than just not
creating the iomap_page in iomap_readpage_actor.

Getting rid of the iomap_page_create in iomap_readpage_actor
completely isn't a necessary part of the bug fix. So can we focus on
the bug fix for now, and worry about the improvement later?

> Also this patch needs to go after the current patch 2 to be bisection clean.

Yes, makes sense.

Thanks,
Andreas

