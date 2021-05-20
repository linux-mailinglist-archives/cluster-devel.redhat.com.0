Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2940D38B10E
	for <lists+cluster-devel@lfdr.de>; Thu, 20 May 2021 16:08:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621519711;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=It7btjJ0p3Yc2h3EMcw3zPNhica8EKGBJRqOiDF2YA8=;
	b=FYQX9hGQmHG5piq6LC4JAR3TuEdiTehkI7kV+edja7JFVe650jOVKagPJgKrGfzbbjiKT5
	h0i5+rzkJh13XcwCyOR2wBJtIW3IH772FFLB3hO6Am2+6ic4Q4bijGtNDeZ6i2r6C2QFlS
	T1FXeSeGYsmozo3u1Y9v5/7Fn6QSqT8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-okMB1tusMOuTT-H_weZjkA-1; Thu, 20 May 2021 10:08:29 -0400
X-MC-Unique: okMB1tusMOuTT-H_weZjkA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9BB2189C446;
	Thu, 20 May 2021 14:08:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DC106062F;
	Thu, 20 May 2021 14:08:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 14B2744A5D;
	Thu, 20 May 2021 14:08:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14KE8Eu2010869 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 20 May 2021 10:08:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A6E7520B6640; Thu, 20 May 2021 14:08:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A1CB520A8C48
	for <cluster-devel@redhat.com>; Thu, 20 May 2021 14:08:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E3073833A01
	for <cluster-devel@redhat.com>; Thu, 20 May 2021 14:08:11 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
	[209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-39-Qza-Dz1_Pd2sZ8boRe334A-1; Thu, 20 May 2021 10:08:10 -0400
X-MC-Unique: Qza-Dz1_Pd2sZ8boRe334A-1
Received: by mail-wm1-f71.google.com with SMTP id
	z1-20020a1c7e010000b0290179806d11d4so1266481wmc.3
	for <cluster-devel@redhat.com>; Thu, 20 May 2021 07:08:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=It7btjJ0p3Yc2h3EMcw3zPNhica8EKGBJRqOiDF2YA8=;
	b=ny4OuHfQ0HAfSiip9RrkT3832YqfvST9BEkaBgQnE88PJ4FVaGZE60YdIWW17wjVpw
	fCcQSIROh0nYupHeuCm2P2+cnfpXqz2tEWkB2Gl+NqmYONzIA76w60V63/FXtl29sgBA
	p+EFF2M9tgqckljglJDR46ZQPG/RZ6HE+iz3jalFn+N6nEh1P88jDt9SQ1KABDCjt13d
	ASdGlPuFn4Y6WkqK0qb4FEc1LtcAVZxMhcZFm9yHpUuKEJcBK9I4K32tDgZ4qXxmJ2x5
	lStQlbtvMGOOQJ6H9xuSBIbXQrms9O0+d+JCrcI+3V0SbiBZobihIkZYgaDLMlRhozpz
	vnOQ==
X-Gm-Message-State: AOAM5334zQNiCKH0TvgoP7RIqxYYIMw7Al64Mlghzc2D60igoSSETFEL
	G5cfFqhWBYsuuVYuyu3z2BJHxlhNQJPY2QLqirmXBud2AEYXLW9Ag8OWLoYafc3ExeCFQJH0kSp
	raM1LVOwZiYXf+phwU33Njm0LSaIHHbm3TxJORA==
X-Received: by 2002:adf:f54b:: with SMTP id j11mr4244094wrp.376.1621519688411; 
	Thu, 20 May 2021 07:08:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynUwLFZ6h5RolD2UQb7WF4s79K47EEkXJZu1PY0ld5PYQtlKR2A/3xR2UsNW2/X99LMni/DqLrlJC+9YY0p8E=
X-Received: by 2002:adf:f54b:: with SMTP id j11mr4244068wrp.376.1621519688151; 
	Thu, 20 May 2021 07:08:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210520122536.1596602-1-agruenba@redhat.com>
	<20210520122536.1596602-7-agruenba@redhat.com>
	<20210520133015.GC18952@quack2.suse.cz>
In-Reply-To: <20210520133015.GC18952@quack2.suse.cz>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 20 May 2021 16:07:56 +0200
Message-ID: <CAHc6FU7ESASp+G59d218LekK8+YMBvH9GxbPr-qOVBhzyVmq4Q@mail.gmail.com>
To: Jan Kara <jack@suse.cz>, Andy Lutomirski <luto@kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>, Linux-MM <linux-mm@kvack.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, May 20, 2021 at 3:30 PM Jan Kara <jack@suse.cz> wrote:
> On Thu 20-05-21 14:25:36, Andreas Gruenbacher wrote:
> > Now that we handle self-recursion on the inode glock in gfs2_fault and
> > gfs2_page_mkwrite, we need to take care of more complex deadlock
> > scenarios like the following (example by Jan Kara):
> >
> > Two independent processes P1, P2. Two files F1, F2, and two mappings M1,
> > M2 where M1 is a mapping of F1, M2 is a mapping of F2. Now P1 does DIO
> > to F1 with M2 as a buffer, P2 does DIO to F2 with M1 as a buffer. They
> > can race like:
> >
> > P1                                      P2
> > read()                                  read()
> >   gfs2_file_read_iter()                   gfs2_file_read_iter()
> >     gfs2_file_direct_read()                 gfs2_file_direct_read()
> >       locks glock of F1                       locks glock of F2
> >       iomap_dio_rw()                          iomap_dio_rw()
> >         bio_iov_iter_get_pages()                bio_iov_iter_get_pages()
> >           <fault in M2>                           <fault in M1>
> >             gfs2_fault()                            gfs2_fault()
> >               tries to grab glock of F2               tries to grab glock of F1
> >
> > Those kinds of scenarios are much harder to reproduce than
> > self-recursion.
> >
> > We deal with such situations by using the LM_FLAG_OUTER flag to mark
> > "outer" glock taking.  Then, when taking an "inner" glock, we use the
> > LM_FLAG_TRY flag so that locking attempts that don't immediately succeed
> > will be aborted.  In case of a failed locking attempt, we "unroll" to
> > where the "outer" glock was taken, drop the "outer" glock, and fault in
> > the first offending user page.  This will re-trigger the "inner" locking
> > attempt but without the LM_FLAG_TRY flag.  Once that has happened, we
> > re-acquire the "outer" glock and retry the original operation.
> >
> > Reported-by: Jan Kara <jack@suse.cz>
> > Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
>
> ...
>
> > diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
> > index 7d88abb4629b..8b26893f8dc6 100644
> > --- a/fs/gfs2/file.c
> > +++ b/fs/gfs2/file.c
> > @@ -431,21 +431,30 @@ static vm_fault_t gfs2_page_mkwrite(struct vm_fault *vmf)
> >       vm_fault_t ret = VM_FAULT_LOCKED;
> >       struct gfs2_holder gh;
> >       unsigned int length;
> > +     u16 flags = 0;
> >       loff_t size;
> >       int err;
> >
> >       sb_start_pagefault(inode->i_sb);
> >
> > -     gfs2_holder_init(ip->i_gl, LM_ST_EXCLUSIVE, 0, &gh);
> > +     if (current_holds_glock())
> > +             flags |= LM_FLAG_TRY;
> > +
> > +     gfs2_holder_init(ip->i_gl, LM_ST_EXCLUSIVE, flags, &gh);
> >       if (likely(!outer_gh)) {
> >               err = gfs2_glock_nq(&gh);
> >               if (err) {
> >                       ret = block_page_mkwrite_return(err);
> > +                     if (err == GLR_TRYFAILED) {
> > +                             set_current_needs_retry(true);
> > +                             ret = VM_FAULT_SIGBUS;
> > +                     }
>
> I've checked to make sure but do_user_addr_fault() indeed calls do_sigbus()
> which raises the SIGBUS signal. So if the application does not ignore
> SIGBUS, your retry will be visible to the application and can cause all
> sorts of interesting results...

I would have noticed that, but no SIGBUS signals were actually
delivered. So we probably end up in kernelmode_fixup_or_oops() when in
kernel mode, which just does nothing in that case.

Andy Lutomirski, you've been involved with this, could you please shed
some light?

> So you probably need to add a new VM_FAULT_
> return code that will behave like VM_FAULT_SIGBUS except it will not raise
> the signal.

A new VM_FAULT_* flag might make the code easier to read, but I don't
know if we can have one.

> Otherwise it seems to me your approach should work.

Thanks a lot,
Andreas

