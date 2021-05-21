Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D799438CA61
	for <lists+cluster-devel@lfdr.de>; Fri, 21 May 2021 17:46:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621611988;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Oiv5CMTfVr5fGq4A95QHsr3IkiN3wgJIlDUHsc03NSs=;
	b=D6UWCgjghtRHXwDm0eI0z4T3kIzP2wuQfExldC0KxGE03dYuQDdlE2igTGrD2CA2uCyL18
	Vy73itF198/G1sSp48WbONmgJIe7NAn07q3/KoxhhSahrW4Ro/4IeHQKwxkrLVLUr1gc63
	WZ7XtuWljdb5+i+lp4HAK32S4fqQoMg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-sX2ymtRsOviE3JPQBYkmCQ-1; Fri, 21 May 2021 11:46:27 -0400
X-MC-Unique: sX2ymtRsOviE3JPQBYkmCQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3B6A180FD6D;
	Fri, 21 May 2021 15:46:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B68094536;
	Fri, 21 May 2021 15:46:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5A1CA44A61;
	Fri, 21 May 2021 15:46:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14LFkLJo016049 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 21 May 2021 11:46:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D8A0920A8C0B; Fri, 21 May 2021 15:46:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D44E1212AA9C
	for <cluster-devel@redhat.com>; Fri, 21 May 2021 15:46:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1AA56833942
	for <cluster-devel@redhat.com>; Fri, 21 May 2021 15:46:19 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
	[209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-375-1zlQOXRwMWecvxas_GZYYQ-1; Fri, 21 May 2021 11:46:17 -0400
X-MC-Unique: 1zlQOXRwMWecvxas_GZYYQ-1
Received: by mail-wr1-f72.google.com with SMTP id
	7-20020adf95070000b02901104ad3ef04so9629586wrs.16
	for <cluster-devel@redhat.com>; Fri, 21 May 2021 08:46:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Oiv5CMTfVr5fGq4A95QHsr3IkiN3wgJIlDUHsc03NSs=;
	b=PY9r0CRgXJ+xyLE5Edn4nP/OHGi2+pJO8J3wVmQSEDacMKT2tFVP5J75Y7bGlIYky9
	s2svu6+Fj3EyduIHjuH5APd8fGBtOdLXppw9PFPp7h3wE59CGlwmLuoo4OIGCFQXMHhT
	m0q1g+3Difa46V7lXKNXU3IyDQZ4nVkpTOPJB5fxvOdMZV+mSYDTlLrNuxJwRqxCutLz
	QQpi/2GxWSNySZdNcU3wiWqjUVEWr+bSKTWkrT6+V/56nCpr6Rs4UhfFOHxXhSTx3hc7
	Tv2vbfsglGZ9EIlDq/wsfStQLfhyIbvzmIF9ZI+lWrEZ1gfuPIQA6r/7npaUOWQmbcYC
	t+jA==
X-Gm-Message-State: AOAM531vchaEixaghKqUMYPZouWZTPS90XZ2LHVQPizxtf1zJ81fn3aW
	1kapNoSMlAO8QsinLlyYO2OdmP/4L9Fqcq6BFLfHWrzz0iQ0Iz5ek9cmVTe1m65MOSBwXbzYxuR
	y+Uy6rgZOqWx5sU5tL6QYC6fVyZgX0OnRMVw8GQ==
X-Received: by 2002:a05:600c:4f4e:: with SMTP id
	m14mr9769344wmq.164.1621611976426; 
	Fri, 21 May 2021 08:46:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNiKyNNQUg0ROCG/SSOfEtN4zmZrv2U5Ehc2HYyxeDqg4kgiTzYPVs1QJPabytJJQk6QNyxHUQkFNSA09pUs4=
X-Received: by 2002:a05:600c:4f4e:: with SMTP id
	m14mr9769331wmq.164.1621611976235; 
	Fri, 21 May 2021 08:46:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210520122536.1596602-1-agruenba@redhat.com>
	<20210520122536.1596602-7-agruenba@redhat.com>
	<20210520133015.GC18952@quack2.suse.cz>
	<CAHc6FU7ESASp+G59d218LekK8+YMBvH9GxbPr-qOVBhzyVmq4Q@mail.gmail.com>
	<20210521152352.GQ18952@quack2.suse.cz>
In-Reply-To: <20210521152352.GQ18952@quack2.suse.cz>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 21 May 2021 17:46:04 +0200
Message-ID: <CAHc6FU6df7cBbjmYOZE35v_FALWRO62cYjg2Y9rY+Hd6x5yeyw@mail.gmail.com>
To: Jan Kara <jack@suse.cz>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Andy Lutomirski <luto@kernel.org>, Linux-MM <linux-mm@kvack.org>
Subject: Re: [Cluster-devel] [PATCH 6/6] gfs2: Fix mmap + page fault
	deadlocks (part 2)
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, May 21, 2021 at 5:23 PM Jan Kara <jack@suse.cz> wrote:
> On Thu 20-05-21 16:07:56, Andreas Gruenbacher wrote:
> > On Thu, May 20, 2021 at 3:30 PM Jan Kara <jack@suse.cz> wrote:
> > > On Thu 20-05-21 14:25:36, Andreas Gruenbacher wrote:
> > > > Now that we handle self-recursion on the inode glock in gfs2_fault and
> > > > gfs2_page_mkwrite, we need to take care of more complex deadlock
> > > > scenarios like the following (example by Jan Kara):
> > > >
> > > > Two independent processes P1, P2. Two files F1, F2, and two mappings M1,
> > > > M2 where M1 is a mapping of F1, M2 is a mapping of F2. Now P1 does DIO
> > > > to F1 with M2 as a buffer, P2 does DIO to F2 with M1 as a buffer. They
> > > > can race like:
> > > >
> > > > P1                                      P2
> > > > read()                                  read()
> > > >   gfs2_file_read_iter()                   gfs2_file_read_iter()
> > > >     gfs2_file_direct_read()                 gfs2_file_direct_read()
> > > >       locks glock of F1                       locks glock of F2
> > > >       iomap_dio_rw()                          iomap_dio_rw()
> > > >         bio_iov_iter_get_pages()                bio_iov_iter_get_pages()
> > > >           <fault in M2>                           <fault in M1>
> > > >             gfs2_fault()                            gfs2_fault()
> > > >               tries to grab glock of F2               tries to grab glock of F1
> > > >
> > > > Those kinds of scenarios are much harder to reproduce than
> > > > self-recursion.
> > > >
> > > > We deal with such situations by using the LM_FLAG_OUTER flag to mark
> > > > "outer" glock taking.  Then, when taking an "inner" glock, we use the
> > > > LM_FLAG_TRY flag so that locking attempts that don't immediately succeed
> > > > will be aborted.  In case of a failed locking attempt, we "unroll" to
> > > > where the "outer" glock was taken, drop the "outer" glock, and fault in
> > > > the first offending user page.  This will re-trigger the "inner" locking
> > > > attempt but without the LM_FLAG_TRY flag.  Once that has happened, we
> > > > re-acquire the "outer" glock and retry the original operation.
> > > >
> > > > Reported-by: Jan Kara <jack@suse.cz>
> > > > Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> > >
> > > ...
> > >
> > > > diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
> > > > index 7d88abb4629b..8b26893f8dc6 100644
> > > > --- a/fs/gfs2/file.c
> > > > +++ b/fs/gfs2/file.c
> > > > @@ -431,21 +431,30 @@ static vm_fault_t gfs2_page_mkwrite(struct vm_fault *vmf)
> > > >       vm_fault_t ret = VM_FAULT_LOCKED;
> > > >       struct gfs2_holder gh;
> > > >       unsigned int length;
> > > > +     u16 flags = 0;
> > > >       loff_t size;
> > > >       int err;
> > > >
> > > >       sb_start_pagefault(inode->i_sb);
> > > >
> > > > -     gfs2_holder_init(ip->i_gl, LM_ST_EXCLUSIVE, 0, &gh);
> > > > +     if (current_holds_glock())
> > > > +             flags |= LM_FLAG_TRY;
> > > > +
> > > > +     gfs2_holder_init(ip->i_gl, LM_ST_EXCLUSIVE, flags, &gh);
> > > >       if (likely(!outer_gh)) {
> > > >               err = gfs2_glock_nq(&gh);
> > > >               if (err) {
> > > >                       ret = block_page_mkwrite_return(err);
> > > > +                     if (err == GLR_TRYFAILED) {
> > > > +                             set_current_needs_retry(true);
> > > > +                             ret = VM_FAULT_SIGBUS;
> > > > +                     }
> > >
> > > I've checked to make sure but do_user_addr_fault() indeed calls do_sigbus()
> > > which raises the SIGBUS signal. So if the application does not ignore
> > > SIGBUS, your retry will be visible to the application and can cause all
> > > sorts of interesting results...
> >
> > I would have noticed that, but no SIGBUS signals were actually
> > delivered. So we probably end up in kernelmode_fixup_or_oops() when in
> > kernel mode, which just does nothing in that case.
>
> Hum, but how would we get there? I don't think fatal_signal_pending() would
> return true yet...

Hmm, right ...

> > > So you probably need to add a new VM_FAULT_
> > > return code that will behave like VM_FAULT_SIGBUS except it will not raise
> > > the signal.
> >
> > A new VM_FAULT_* flag might make the code easier to read, but I don't
> > know if we can have one.
>
> Well, this is kernel-internal API and there's still plenty of space in
> vm_fault_reason.

That's in the context of the page fault. The other issue is how to
propagate that out through iov_iter_fault_in_readable ->
fault_in_pages_readable -> __get_user, for example. I don't think
there's much of a chance to get an additional error code out of
__get_user and __put_user.

Thanks,
Andreas

