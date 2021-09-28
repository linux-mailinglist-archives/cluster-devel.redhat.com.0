Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id B28CF41B29C
	for <lists+cluster-devel@lfdr.de>; Tue, 28 Sep 2021 17:06:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632841571;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=GTEeKi/UYmjYJkWNK0SGATQ/qYJFiOXPZZXq8sMSFeY=;
	b=Y41aEj30iL7xRdj8bOcsfCRL4vDWLdU2O+J6YZoYKlxcyH3B1APNbLPrNzK8o3YnezactG
	fYzj8aUXNxxdmv11G29dApVccZvhN5VJv2RUlg/TQletw8VYUPk5bJaL6W8wLthcymoggd
	hpwQ5OvV9zeSKbwgxaU8Ine9cLzeytg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-QDTOzh1zNdGJFTjQsrWydg-1; Tue, 28 Sep 2021 11:06:09 -0400
X-MC-Unique: QDTOzh1zNdGJFTjQsrWydg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A6128E4AA0;
	Tue, 28 Sep 2021 15:06:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CB7E604CC;
	Tue, 28 Sep 2021 15:06:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E76C31800B9E;
	Tue, 28 Sep 2021 15:06:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18SF63dx012799 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 28 Sep 2021 11:06:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 89D491112854; Tue, 28 Sep 2021 15:06:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 832F01112851
	for <cluster-devel@redhat.com>; Tue, 28 Sep 2021 15:06:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD3DE180074F
	for <cluster-devel@redhat.com>; Tue, 28 Sep 2021 15:06:00 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
	[209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-428-Z_X6xwpvOa6C8YdzVTH4uQ-1; Tue, 28 Sep 2021 11:05:59 -0400
X-MC-Unique: Z_X6xwpvOa6C8YdzVTH4uQ-1
Received: by mail-wr1-f71.google.com with SMTP id
	p12-20020a5d4e0c000000b001605e330b62so5399125wrt.5
	for <cluster-devel@redhat.com>; Tue, 28 Sep 2021 08:05:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GTEeKi/UYmjYJkWNK0SGATQ/qYJFiOXPZZXq8sMSFeY=;
	b=xz2rX2Q7/yR4KP03XpIOpMN64EShcIfp/+tvn668kdROAvYyEY0tR9ODFcfffMhhyL
	DxpkIm3JZg0TCdw4YRCDjmsuqFhTTCurjF82gJ2zDs0y4tDsLP19TOP9oFEmN57rSilL
	n7uAh4+Pa7Rezut1fLj9Rtk32xx0VuyEZjzEBmjSHlOr2lca7MSHpJeKI7gnvT4SoQc/
	6LFiRKpRQ5cu8b4jBD3jE7sioT6TGhNNIDyuS5t4XWKPfUT1IcNtCvA2v+7JRnmDJqKa
	Y8ZgDbbCzW6fdzU/P8dwVmJ4h/qYZbfxQT6bK6Mb99fXQ92ZjJGQg2c09zv3oCVozAqJ
	y/yA==
X-Gm-Message-State: AOAM531MQEJaji3xp9Jm6YgNsnK5g/P+lUjgHx5pO9tvnolF1uvpf24D
	5TsCen58PMlJCfRoqZ4kq3T5FE1vjTaLlKtTSCq1lTI0P03/5OV4fDuX7m5eaKHRnqez8BWjyev
	xCSHU0GTFmC6+Is2wyvdWPtziwcYsgIzQqrH9Zw==
X-Received: by 2002:a1c:192:: with SMTP id 140mr5194533wmb.186.1632841557826; 
	Tue, 28 Sep 2021 08:05:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz45bDVa7yHh7ZlDdOqmKGhDvsP9wWie0zsYCjSZRICnWeTnJ+JMvq9BqN1jrAgmwTyXD/iZRUEiGUwLJEUR9A=
X-Received: by 2002:a1c:192:: with SMTP id 140mr5194517wmb.186.1632841557678; 
	Tue, 28 Sep 2021 08:05:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210827164926.1726765-1-agruenba@redhat.com>
	<20210827164926.1726765-16-agruenba@redhat.com>
	<YTnuDhNlSN1Ie1MJ@infradead.org>
In-Reply-To: <YTnuDhNlSN1Ie1MJ@infradead.org>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 28 Sep 2021 17:05:46 +0200
Message-ID: <CAHc6FU4_3m-f2T360Vq-WF=nkqDq9Zc+dekRt+wrcjvbUR1oSQ@mail.gmail.com>
To: Christoph Hellwig <hch@infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>,
	cluster-devel <cluster-devel@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v7 15/19] iomap: Support partial direct
	I/O on user copy failures
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

On Thu, Sep 9, 2021 at 1:22 PM Christoph Hellwig <hch@infradead.org> wrote:
> On Fri, Aug 27, 2021 at 06:49:22PM +0200, Andreas Gruenbacher wrote:
> > In iomap_dio_rw, when iomap_apply returns an -EFAULT error and the
> > IOMAP_DIO_PARTIAL flag is set, complete the request synchronously and
> > return a partial result.  This allows the caller to deal with the page
> > fault and retry the remainder of the request.
> >
> > Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> > ---
> >  fs/iomap/direct-io.c  | 6 ++++++
> >  include/linux/iomap.h | 7 +++++++
> >  2 files changed, 13 insertions(+)
> >
> > diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
> > index 8054f5d6c273..ba88fe51b77a 100644
> > --- a/fs/iomap/direct-io.c
> > +++ b/fs/iomap/direct-io.c
> > @@ -561,6 +561,12 @@ __iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
> >               ret = iomap_apply(inode, pos, count, iomap_flags, ops, dio,
> >                               iomap_dio_actor);
> >               if (ret <= 0) {
> > +                     if (ret == -EFAULT && dio->size &&
> > +                         (dio_flags & IOMAP_DIO_PARTIAL)) {
> > +                             wait_for_completion = true;
> > +                             ret = 0;
>
> Do we need a NOWAIT check here to skip the wait_for_completion
> for that case?

Hmm, you're probably right, yes. I'll add that.

Thanks,
Andreas

