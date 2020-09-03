Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 13E0825CCAE
	for <lists+cluster-devel@lfdr.de>; Thu,  3 Sep 2020 23:49:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599169771;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=oBrynNccaVwKMAHtYaWvrpJ0iV4f205Vo+3SkjyLb1M=;
	b=Q4MEFEYErkPOcCfvsTQ4po02Jm6Yu/u5A0a2pJHNvWFTqcV9NSKOMh2yMosIEEqXiuGJfn
	mWqWJR5eR93035lfVXFk2pFaaUKx09xbBjnxY24enOFXF72vMnDpxGm/nzlJ3oytU9wVNS
	gmEbur0vPyTalSPNKH4kI3Z4SM0lLE8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-bfSikMlgP9WMbx3qLcHywg-1; Thu, 03 Sep 2020 17:49:27 -0400
X-MC-Unique: bfSikMlgP9WMbx3qLcHywg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54DE8107464E;
	Thu,  3 Sep 2020 21:49:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D753C7EEB5;
	Thu,  3 Sep 2020 21:49:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5457779DAA;
	Thu,  3 Sep 2020 21:49:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 083Lm2Bu023910 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 3 Sep 2020 17:48:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 41F9D200A795; Thu,  3 Sep 2020 21:48:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D2AB20244F7
	for <cluster-devel@redhat.com>; Thu,  3 Sep 2020 21:47:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10BBC101A53F
	for <cluster-devel@redhat.com>; Thu,  3 Sep 2020 21:47:59 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
	[209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-430-odErDhvaMhiO00gjalEwKw-1; Thu, 03 Sep 2020 17:47:57 -0400
X-MC-Unique: odErDhvaMhiO00gjalEwKw-1
Received: by mail-wm1-f72.google.com with SMTP id c198so1433680wme.5
	for <cluster-devel@redhat.com>; Thu, 03 Sep 2020 14:47:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oBrynNccaVwKMAHtYaWvrpJ0iV4f205Vo+3SkjyLb1M=;
	b=p2ulnS8vKciyeyMFNBeJNlZxd1E/Cb+3OrQS1c6d97XI/1hOU5BGhYNhBQsaSsEQz2
	iIkIli7RdymRH87NiCHafvZUbLZHshLzFZCTORJWqo11g8HPS/SkAFn+l9uh8x1LeQ9Q
	GkO7IsCJmMjYPD2/NLsgz/orYpHkJjv3yh66vGnNbe1KKbpFNbgc5EplsArovUNArzko
	AJYLHbvsznRC302lHnY8HOUNby2eg3mtCWo2pQ0laha7DAU6m9ACWavNHz8lHUacOcxD
	7uZWEQ3EpqGb43AkMsBeRHgz70eDfL23Rd21WBXjgpZusGb7fv4xGvBTsFpAaxYzN/vu
	Ichg==
X-Gm-Message-State: AOAM531Ki1nYz8KVcmhbfAZP4jsSHSMNvOpEQALmREZT4+3ru9cQUZYB
	r3rSfVpdSaZ9UqQHSja5Jgv1UmCLx+Wj7x9nzFOSh9ZpciNbuUiilfhGIF3gYljtsz6PnEWxhB+
	l+XdN3d3bG3l+/E/U0zGurL6YKdSR9i0BseypwA==
X-Received: by 2002:a7b:c0c5:: with SMTP id s5mr4395614wmh.152.1599169676209; 
	Thu, 03 Sep 2020 14:47:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfurQNCgokDtRoLPRuHgAybZLnKZ8B+2PgntmWzIP1k1DncX3kyUDbDZW6vrGvGz+eL5DynJVwhOUzgUE9+X8=
X-Received: by 2002:a7b:c0c5:: with SMTP id s5mr4395604wmh.152.1599169676019; 
	Thu, 03 Sep 2020 14:47:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200903165632.1338996-1-agruenba@redhat.com>
	<695a418c-ba6d-d3e9-f521-7dfa059764db@sandeen.net>
In-Reply-To: <695a418c-ba6d-d3e9-f521-7dfa059764db@sandeen.net>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 3 Sep 2020 23:47:44 +0200
Message-ID: <CAHc6FU5zwQTBaGVban6tCH7kNwr+NiW-_oKC1j0vmqbWAWx50g@mail.gmail.com>
To: Eric Sandeen <sandeen@sandeen.net>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, cluster-devel <cluster-devel@redhat.com>,
	"Darrick J. Wong" <darrick.wong@oracle.com>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-ext4 <linux-ext4@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH] iomap: Fix direct I/O write consistency
	check
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 3, 2020 at 11:12 PM Eric Sandeen <sandeen@sandeen.net> wrote:
> On 9/3/20 11:56 AM, Andreas Gruenbacher wrote:
> > When a direct I/O write falls back to buffered I/O entirely, dio->size
> > will be 0 in iomap_dio_complete.  Function invalidate_inode_pages2_range
> > will try to invalidate the rest of the address space.
>
> (Because if ->size == 0 and offset == 0, then invalidating up to (0+0-1) will
> invalidate the entire range.)
>
>
>                 err = invalidate_inode_pages2_range(inode->i_mapping,
>                                 offset >> PAGE_SHIFT,
>                                 (offset + dio->size - 1) >> PAGE_SHIFT);
>
> so I guess this behavior is unique to writing to a hole at offset 0?
>
> FWIW, this same test yields the same results on ext3 when it falls back to
> buffered.

That's interesting. An ext3 formatted filesystem will invoke
dio_warn_stale_pagecache and thus log the error message, but the error
isn't immediately reported by the "pwrite 0 4k". It takes adding '-c
"fsync"' to the xfs_io command or similar to make it fail.

An ext4 formatted filesystem doesn't show any of these problems.

Thanks,
Andreas

> -Eric
>
> > If there are any
> > dirty pages in that range, the write will fail and a "Page cache
> > invalidation failure on direct I/O" error will be logged.
> >
> > On gfs2, this can be reproduced as follows:
> >
> >   xfs_io \
> >     -c "open -ft foo" -c "pwrite 4k 4k" -c "close" \
> >     -c "open -d foo" -c "pwrite 0 4k"
> >
> > Fix this by recognizing 0-length writes.
> >
> > Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> > ---
> >  fs/iomap/direct-io.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
> > index c1aafb2ab990..c9d6b4eecdb7 100644
> > --- a/fs/iomap/direct-io.c
> > +++ b/fs/iomap/direct-io.c
> > @@ -108,7 +108,7 @@ static ssize_t iomap_dio_complete(struct iomap_dio *dio)
> >        * ->end_io() when necessary, otherwise a racing buffer read would cache
> >        * zeros from unwritten extents.
> >        */
> > -     if (!dio->error &&
> > +     if (!dio->error && dio->size &&
> >           (dio->flags & IOMAP_DIO_WRITE) && inode->i_mapping->nrpages) {
> >               int err;
> >               err = invalidate_inode_pages2_range(inode->i_mapping,
> >
>

