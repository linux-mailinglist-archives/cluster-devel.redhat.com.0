Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id E481936F258
	for <lists+cluster-devel@lfdr.de>; Thu, 29 Apr 2021 23:54:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619733252;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=qKbVuKhNkr6dr83b3KaHtuT3ClD04Pysx1rwxAxAx0g=;
	b=hI8hejUWWeS7b6b2BRBplCrClj8jvAXXc8hctOYP3dq6d+MM7lodD7ZSssxJhAYtlTVWQR
	lcf57pA89hYYTNsRp8E3U9rX9o/oBPDNDTXhsuJZ/CjfSLpO96pnySnjy+Fw+y3eBKg50f
	AKN3KLpFAdDrB89Y5r16axjXqp76M1A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-HOChGtDrM_mkmdLVx6cMqQ-1; Thu, 29 Apr 2021 17:54:10 -0400
X-MC-Unique: HOChGtDrM_mkmdLVx6cMqQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D49D6D4E6;
	Thu, 29 Apr 2021 21:54:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0AB3D100AE4E;
	Thu, 29 Apr 2021 21:54:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CE8394ED7B;
	Thu, 29 Apr 2021 21:54:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13TLrxao016338 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 29 Apr 2021 17:53:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AA51F20B6631; Thu, 29 Apr 2021 21:53:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A633720B6652
	for <cluster-devel@redhat.com>; Thu, 29 Apr 2021 21:53:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5967910115E1
	for <cluster-devel@redhat.com>; Thu, 29 Apr 2021 21:53:57 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
	[209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-474-c5B8j_CvN_SIRLD2iTjJnA-1; Thu, 29 Apr 2021 17:53:55 -0400
X-MC-Unique: c5B8j_CvN_SIRLD2iTjJnA-1
Received: by mail-wm1-f69.google.com with SMTP id
	v2-20020a7bcb420000b0290146b609814dso371907wmj.0
	for <cluster-devel@redhat.com>; Thu, 29 Apr 2021 14:53:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qKbVuKhNkr6dr83b3KaHtuT3ClD04Pysx1rwxAxAx0g=;
	b=smLS7YOPNj9LMcE7SsvS1QKVfS7UtYZhiSH9/iMUK8br43eu8PfjIHCNJzANwfnSFv
	ZsIIKUtvZUImatnpmH/1eCkj7SgybauJ7tWZrUcjD1EQ6Dxeo+aH1LubzHiN052WhrCU
	mwEFoU8LB9+tXYpon5u34YOqTkEtb6/eCt1WH8L6C1DJ3iteOOLrBFhbo9mqkPpCXywd
	IzdcTuwa9ch6JaKk5FTpcDxE4R1+0xTBkHooTZUBEZOmfOo2no0jM5eI9Dsv8iNKesrn
	+6oTLwEKAV+FOgCIPJ3nm/NG1ffe4xmjvwYxWOxhnVKQx2XcoE4dGWikxwjhePbVsJva
	3JdA==
X-Gm-Message-State: AOAM531LCx9WSpIPYV207/8D+lqNrebnJrDFWih3kdki/hE3dqxj2GFT
	SI5tTV/CbZ9Z8ED1hn5WWBP4fGvF7J0Fp3Xp+BM/1GY0tTr/XA/3G18uzoUQu2iyiMdflfwxzNu
	dCJwDzc0TLjNXiQrypWNZmlA/zOQu2YFpCD//HQ==
X-Received: by 2002:a05:6000:144f:: with SMTP id
	v15mr2165230wrx.182.1619733234079; 
	Thu, 29 Apr 2021 14:53:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8VC9MT8eQwV1IdnbCFzQcKdv3bIvYryqFNXWycRQJ+GHJQ9pRxxxT5FuEexqPHrEr111gv6P93BWaGyZlG4s=
X-Received: by 2002:a05:6000:144f:: with SMTP id
	v15mr2165212wrx.182.1619733233890; 
	Thu, 29 Apr 2021 14:53:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210422112612.GF26221@quack2.suse.cz>
	<CAHc6FU7kFWtQDAAU16h3xkWkSV2dm9WWb-RbjXBusJ9+118GRw@mail.gmail.com>
	<20210422131419.GI26221@quack2.suse.cz>
	<619588401.12709186.1619107034528.JavaMail.zimbra@redhat.com>
In-Reply-To: <619588401.12709186.1619107034528.JavaMail.zimbra@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 29 Apr 2021 23:53:42 +0200
Message-ID: <CAHc6FU75JpoWkLkpLdMyOUPEsck+UbuT-OE6oaft_AQ3LcjHUQ@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>
Subject: Re: [Cluster-devel] Hole punch races in GFS2
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 22, 2021 at 5:57 PM Bob Peterson <rpeterso@redhat.com> wrote:
> ----- Original Message -----
> > OK, thanks for explanation! I missed that GFS2 glocks are task local. But
> > then I have another question. We have the following:
> >
> > gfs2_file_read_iter()
> >   grabs inode glock in shared mode
> >   generic_file_read_iter()
> >     filemap_read()
> >       copy_page_to_iter()
> >         <page fault>
> >         grabs mmap_sem
> >           gfs2_fault()
> >             - tries to grab inode glock again -> possible recursive locking
> >
> > And even if the locking isn't recursive, you have glock->mmap_sem and
> > mmap_sem->glock lock orderings so ABBA deadlocks are possible AFAICT.
> >
> > And there's a similar problem with the write path as well, just the lock is
> > grabbed exclusively.
> >
> >                                                               Honza
> > --
> > Jan Kara <jack@suse.com>
> > SUSE Labs, CR
>
> Hi Jan,
>
> IIRC, gfs2 tries to prevent the page fault by having gfs2_file_read_iter
> call into generic_file_read_iter twice:
>
> The first time without the glock held, but specifying IOCB_NOIO, which
> brings the pages in and returns -EAGAIN. Then it acquires the glock,
> then calls into generic_file_read_iter a second time.

The IOCB_NOIO generic_file_read_iter call is there for lockless reads,
not there for faulting pages in at all. See commit 20f829999c38
("gfs2: Rework read and page fault locking").

Andreas

