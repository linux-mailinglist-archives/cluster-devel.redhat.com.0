Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 603FF3FA06C
	for <lists+cluster-devel@lfdr.de>; Fri, 27 Aug 2021 22:15:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630095338;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=HPb99jdBHWWwZoOoJx4DYlHRxXpqGr7CeJ8g3kuHA2w=;
	b=fGZtm6zRoT//1tddfyeDc2bwgz+33FlXjDzZVAMpBwcNNhpP9Qzo8jzEY3kvyBBs3t54G8
	XlMH6aIOYEjg/CgSuhi8bAycqdXp83k9EXswfPn76remBAwRUgWsSa0UMj0TF2af3R8BA/
	0gtjylgR+vDxe6gqlRmv11ofy/yXQ2g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-gV79y5HmNMKE6rY8lMZ-zw-1; Fri, 27 Aug 2021 16:15:37 -0400
X-MC-Unique: gV79y5HmNMKE6rY8lMZ-zw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 128F31012D90;
	Fri, 27 Aug 2021 20:15:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 68E8D608BA;
	Fri, 27 Aug 2021 20:15:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 85A44181A0F0;
	Fri, 27 Aug 2021 20:15:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17RKFUJ0023154 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 27 Aug 2021 16:15:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B4A7220A8C59; Fri, 27 Aug 2021 20:15:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B04D120BEDD4
	for <cluster-devel@redhat.com>; Fri, 27 Aug 2021 20:15:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E58D789C7DB
	for <cluster-devel@redhat.com>; Fri, 27 Aug 2021 20:15:27 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
	[209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-344-CXFcHH6pNLOiqMtf1QshVw-1; Fri, 27 Aug 2021 16:15:24 -0400
X-MC-Unique: CXFcHH6pNLOiqMtf1QshVw-1
Received: by mail-wm1-f70.google.com with SMTP id
	j33-20020a05600c48a100b002e879427915so2480047wmp.5
	for <cluster-devel@redhat.com>; Fri, 27 Aug 2021 13:15:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HPb99jdBHWWwZoOoJx4DYlHRxXpqGr7CeJ8g3kuHA2w=;
	b=rG4ZqK+gFh4B0DXPhJt2hBkZV/egCBlgpmaRm/IaEeji77Ocdtas4/QMQBJoLVAv0C
	a69DWXM3q8OF1nSkTY49yE/b9Mq6edKVtvCwIh/YzZ9AT/kwA0QxxS2TVN1Vtf5u7OIt
	cfm/GGoM4Lv9Umj/LFWwRBbcSDW+teelGbe9LT9REvD6SbyDcfBoZD0idzKg6vJudOXQ
	I5GafHp20rJ/kyv8NT3cSoDEu4MsvejHL6wtnkc3GV9vMSTgF//VpL96z2CwckNrs/hB
	rEzcMXgNcpwr2rEcJVS8RvBLm8YvNKuGfsnWZDeUTA6RMyS07lB6G1jMabwISCttAUNy
	+jxg==
X-Gm-Message-State: AOAM532PRSQAXhaYGvQHwxEIUeihmLWTd2pWm0sNLIGKeidaMpFrRoQG
	vZvDntT6fu9lpYzvaseAIaSDVpKNmvc+sJwHpcrp04YIpBaFKwvRXHtmP7WK5r4PJZTLxlcg/Qj
	tBv6NLNkSHXoM91et+zIK+KNbEgwnczWmypmQtw==
X-Received: by 2002:a5d:47a4:: with SMTP id 4mr12178829wrb.329.1630095323147; 
	Fri, 27 Aug 2021 13:15:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQuLJGTZkuQZAWubDFIrgljQpy/a8esqpgEQ1rq5xrxLzns1d6V0QwGi6NICYdNz2zs1b+2fAkaDaaEjwYthk=
X-Received: by 2002:a5d:47a4:: with SMTP id 4mr12178813wrb.329.1630095322929; 
	Fri, 27 Aug 2021 13:15:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210827164926.1726765-1-agruenba@redhat.com>
	<20210827164926.1726765-17-agruenba@redhat.com>
	<20210827183018.GJ12664@magnolia>
In-Reply-To: <20210827183018.GJ12664@magnolia>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 27 Aug 2021 22:15:11 +0200
Message-ID: <CAHc6FU44mGza=G4prXh08=RJZ0Wu7i6rBf53BjURj8oyX5Q8iA@mail.gmail.com>
To: "Darrick J. Wong" <djwong@kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	LKML <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v7 16/19] iomap: Add done_before
	argument to iomap_dio_rw
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

On Fri, Aug 27, 2021 at 8:30 PM Darrick J. Wong <djwong@kernel.org> wrote:
> On Fri, Aug 27, 2021 at 06:49:23PM +0200, Andreas Gruenbacher wrote:
> > Add a done_before argument to iomap_dio_rw that indicates how much of
> > the request has already been transferred.  When the request succeeds, we
> > report that done_before additional bytes were tranferred.  This is
> > useful for finishing a request asynchronously when part of the request
> > has already been completed synchronously.
> >
> > We'll use that to allow iomap_dio_rw to be used with page faults
> > disabled: when a page fault occurs while submitting a request, we
> > synchronously complete the part of the request that has already been
> > submitted.  The caller can then take care of the page fault and call
> > iomap_dio_rw again for the rest of the request, passing in the number of
> > bytes already tranferred.
> >
> > Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> > ---
> >  fs/btrfs/file.c       |  5 +++--
> >  fs/ext4/file.c        |  5 +++--
> >  fs/gfs2/file.c        |  4 ++--
> >  fs/iomap/direct-io.c  | 11 ++++++++---
> >  fs/xfs/xfs_file.c     |  6 +++---
> >  fs/zonefs/super.c     |  4 ++--
> >  include/linux/iomap.h |  4 ++--
> >  7 files changed, 23 insertions(+), 16 deletions(-)
> >
>
> <snip to the interesting parts>
>
> > diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
> > index ba88fe51b77a..dcf9a2b4381f 100644
> > --- a/fs/iomap/direct-io.c
> > +++ b/fs/iomap/direct-io.c
> > @@ -31,6 +31,7 @@ struct iomap_dio {
> >       atomic_t                ref;
> >       unsigned                flags;
> >       int                     error;
> > +     size_t                  done_before;
> >       bool                    wait_for_completion;
> >
> >       union {
> > @@ -126,6 +127,9 @@ ssize_t iomap_dio_complete(struct iomap_dio *dio)
> >       if (ret > 0 && (dio->flags & IOMAP_DIO_NEED_SYNC))
> >               ret = generic_write_sync(iocb, ret);
> >
> > +     if (ret > 0)
> > +             ret += dio->done_before;
>
> Pardon my ignorance since this is the first time I've had a crack at
> this patchset, but why is it necessary to carry the "bytes copied"
> count from the /previous/ iomap_dio_rw call all the way through to dio
> completion of the current call?

Consider the following situation:

 * A user submits an asynchronous read request.

 * The first page of the buffer is in memory, but the following
   pages are not. This isn't uncommon for consecutive reads
   into freshly allocated memory.

 * iomap_dio_rw writes into the first page. Then it
   hits the next page which is missing, so it returns a partial
   result, synchronously.

 * We then fault in the remaining pages and call iomap_dio_rw
   for the rest of the request.

 * The rest of the request completes asynchronously.

Does that answer your question?

Thanks,
Andreas

