Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id AB3363FA037
	for <lists+cluster-devel@lfdr.de>; Fri, 27 Aug 2021 21:59:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630094379;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=sd/3n0607wJTjqztLgFnu0bOLL0OQcH0TvNvy1LbLr8=;
	b=SCRKPzvAtaksxy5I6LyM8n5fD4QJfovDAKx50ftaT1tzBXzDcIGEhdpVLAmJEDi+OCzvwe
	gmm1y5YSEiwSbGBMUVvOXYrGp4YxWW8SQmNmQNM+GFDZvxF4u51PTX5skSQxmfbxbPie69
	7klCkd0CH7kPfO2oR/7g0+XEkp9LpA8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-4i8FesN_O6aSqc0hSJKy7A-1; Fri, 27 Aug 2021 15:59:38 -0400
X-MC-Unique: 4i8FesN_O6aSqc0hSJKy7A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98C17185302C;
	Fri, 27 Aug 2021 19:59:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6550A604CC;
	Fri, 27 Aug 2021 19:59:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1D99A4BB7C;
	Fri, 27 Aug 2021 19:59:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17RJuSKf021732 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 27 Aug 2021 15:56:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1DE2919A766; Fri, 27 Aug 2021 19:56:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 181841A91EC
	for <cluster-devel@redhat.com>; Fri, 27 Aug 2021 19:56:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65652101A52C
	for <cluster-devel@redhat.com>; Fri, 27 Aug 2021 19:56:25 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
	[209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-478-qbHquD6XNx-y3dJreiZvYQ-1; Fri, 27 Aug 2021 15:56:23 -0400
X-MC-Unique: qbHquD6XNx-y3dJreiZvYQ-1
Received: by mail-wm1-f72.google.com with SMTP id
	m22-20020a7bca56000000b002e7508f3faeso2468231wml.2
	for <cluster-devel@redhat.com>; Fri, 27 Aug 2021 12:56:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sd/3n0607wJTjqztLgFnu0bOLL0OQcH0TvNvy1LbLr8=;
	b=nVNGA22sWuduMS+nw4OvzDl+ZuMbrk6qgf+GhzPrmNuhiLhhz2Xu5oJj3Ye426pc7C
	3aF8i2AidpfAq11NIe7TWwvtIirvfkWrbb3SoxlQCpzcA9eEe07PBiCdqHy2AmITZxuJ
	GxZkYzZYXV71yVovCD5Bv2TLEwyO9OFYrSrf1JxQdHBuPiQpIxAy2+TcSqkbCA9XVfqW
	KQ7ftGmMV5IqpBKbLjwjvpf5IICKSCD3kc3VxxrTcxH4Ya4Qa1VFETP427TuaYSWlAbG
	G8WEKNYSirFiyE8yWkXXP/N29nmCZq6UX/EkHMU3fZGWM+ATR3BSD4l4z98gPCWJPwNl
	E5kQ==
X-Gm-Message-State: AOAM533DyrQMtyPyNWLTLmpe/VMQ9/2BwiERoFiApd7OwxPeQJrwFxw/
	NgOIa+kX1gs3q/9wzvlZt20CXXLhgElQosty3vpD2iWUY5ula2wzz0Afeah81DZX6nuO4u96g3H
	2XAcdqetSKdBcVx6rUWSiuuEPDnI/tIENMOufCg==
X-Received: by 2002:a5d:47a4:: with SMTP id 4mr12104536wrb.329.1630094182743; 
	Fri, 27 Aug 2021 12:56:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydEhO4+TbNABovpa3HgGNECXB3WhRpPNdamPW7spcpayLjxbNmB0mkBEQta0WVv1DaGiTw07KdhCXl6aFWwBE=
X-Received: by 2002:a5d:47a4:: with SMTP id 4mr12104517wrb.329.1630094182497; 
	Fri, 27 Aug 2021 12:56:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210827164926.1726765-1-agruenba@redhat.com>
	<20210827164926.1726765-19-agruenba@redhat.com>
	<YSkzSHSp8lld6dwW@zeniv-ca.linux.org.uk>
In-Reply-To: <YSkzSHSp8lld6dwW@zeniv-ca.linux.org.uk>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 27 Aug 2021 21:56:10 +0200
Message-ID: <CAHc6FU47cApVzAcVrkCLfoV7AGzs7T-cBGejVXRtfHWVdhXfxA@mail.gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v7 18/19] iov_iter: Introduce nofault
	flag to disable page faults
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 27, 2021 at 8:47 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
> On Fri, Aug 27, 2021 at 06:49:25PM +0200, Andreas Gruenbacher wrote:
> > Introduce a new nofault flag to indicate to get_user_pages to use the
> > FOLL_NOFAULT flag.  This will cause get_user_pages to fail when it
> > would otherwise fault in a page.
> >
> > Currently, the noio flag is only checked in iov_iter_get_pages and
> > iov_iter_get_pages_alloc.  This is enough for iomaop_dio_rw, but it
> > may make sense to check in other contexts as well.
>
> I can live with that, but
>         * direct assignments (as in the next patch) are fucking hard to
> grep for.  Is it intended to be "we set it for duration of primitive",
> or...?

It's for this kind of pattern:

       pagefault_disable();
       to->nofault = true;
       ret = iomap_dio_rw(iocb, to, &gfs2_iomap_ops, NULL,
                          IOMAP_DIO_PARTIAL, written);
       to->nofault = false;
       pagefault_enable();

Clearing the flag at the end isn't strictly necessary, but it kind of
documents that the flag pertains to iomap_dio_rw and not something
else.

>         * it would be nice to have a description of intended semantics
> for that thing.  This "may make sense to check in other contexts" really
> needs to be elaborated (and agreed) upon.  Details, please.

Maybe the description should just be something like:

"Introduce a new nofault flag to indicate to iov_iter_get_pages not to
fault in user pages.

This is implemented by passing the FOLL_NOFAULT flag to get_user_pages,
which causes get_user_pages to fail when it would otherwise fault in a
page. We'll use the ->nofault flag to prevent iomap_dio_rw from faulting
in pages when page faults are not allowed."

Thanks,
Andreas

