Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D434138CA09
	for <lists+cluster-devel@lfdr.de>; Fri, 21 May 2021 17:24:15 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-4VEwyLlzODCIwJ3URn4zxg-1; Fri, 21 May 2021 11:24:13 -0400
X-MC-Unique: 4VEwyLlzODCIwJ3URn4zxg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9603107ACE6;
	Fri, 21 May 2021 15:24:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FAC039A72;
	Fri, 21 May 2021 15:24:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0C06D44A62;
	Fri, 21 May 2021 15:24:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14LFO2OH013626 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 21 May 2021 11:24:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 15DEF20877D2; Fri, 21 May 2021 15:24:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 124252051B67
	for <cluster-devel@redhat.com>; Fri, 21 May 2021 15:23:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3CB4C833959
	for <cluster-devel@redhat.com>; Fri, 21 May 2021 15:23:58 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-166-kDkGe7p8OZuVaXxwSYRCmQ-1;
	Fri, 21 May 2021 11:23:54 -0400
X-MC-Unique: kDkGe7p8OZuVaXxwSYRCmQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B4FAEAD4D;
	Fri, 21 May 2021 15:23:52 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 56CFC1F2C73; Fri, 21 May 2021 17:23:52 +0200 (CEST)
Date: Fri, 21 May 2021 17:23:52 +0200
From: Jan Kara <jack@suse.cz>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20210521152352.GQ18952@quack2.suse.cz>
References: <20210520122536.1596602-1-agruenba@redhat.com>
	<20210520122536.1596602-7-agruenba@redhat.com>
	<20210520133015.GC18952@quack2.suse.cz>
	<CAHc6FU7ESASp+G59d218LekK8+YMBvH9GxbPr-qOVBhzyVmq4Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHc6FU7ESASp+G59d218LekK8+YMBvH9GxbPr-qOVBhzyVmq4Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, cluster-devel <cluster-devel@redhat.com>,
	Linux-MM <linux-mm@kvack.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
	Andy Lutomirski <luto@kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu 20-05-21 16:07:56, Andreas Gruenbacher wrote:
> On Thu, May 20, 2021 at 3:30 PM Jan Kara <jack@suse.cz> wrote:
> > On Thu 20-05-21 14:25:36, Andreas Gruenbacher wrote:
> > > Now that we handle self-recursion on the inode glock in gfs2_fault and
> > > gfs2_page_mkwrite, we need to take care of more complex deadlock
> > > scenarios like the following (example by Jan Kara):
> > >
> > > Two independent processes P1, P2. Two files F1, F2, and two mappings M1,
> > > M2 where M1 is a mapping of F1, M2 is a mapping of F2. Now P1 does DIO
> > > to F1 with M2 as a buffer, P2 does DIO to F2 with M1 as a buffer. They
> > > can race like:
> > >
> > > P1                                      P2
> > > read()                                  read()
> > >   gfs2_file_read_iter()                   gfs2_file_read_iter()
> > >     gfs2_file_direct_read()                 gfs2_file_direct_read()
> > >       locks glock of F1                       locks glock of F2
> > >       iomap_dio_rw()                          iomap_dio_rw()
> > >         bio_iov_iter_get_pages()                bio_iov_iter_get_pages()
> > >           <fault in M2>                           <fault in M1>
> > >             gfs2_fault()                            gfs2_fault()
> > >               tries to grab glock of F2               tries to grab glock of F1
> > >
> > > Those kinds of scenarios are much harder to reproduce than
> > > self-recursion.
> > >
> > > We deal with such situations by using the LM_FLAG_OUTER flag to mark
> > > "outer" glock taking.  Then, when taking an "inner" glock, we use the
> > > LM_FLAG_TRY flag so that locking attempts that don't immediately succeed
> > > will be aborted.  In case of a failed locking attempt, we "unroll" to
> > > where the "outer" glock was taken, drop the "outer" glock, and fault in
> > > the first offending user page.  This will re-trigger the "inner" locking
> > > attempt but without the LM_FLAG_TRY flag.  Once that has happened, we
> > > re-acquire the "outer" glock and retry the original operation.
> > >
> > > Reported-by: Jan Kara <jack@suse.cz>
> > > Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> >
> > ...
> >
> > > diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
> > > index 7d88abb4629b..8b26893f8dc6 100644
> > > --- a/fs/gfs2/file.c
> > > +++ b/fs/gfs2/file.c
> > > @@ -431,21 +431,30 @@ static vm_fault_t gfs2_page_mkwrite(struct vm_fault *vmf)
> > >       vm_fault_t ret = VM_FAULT_LOCKED;
> > >       struct gfs2_holder gh;
> > >       unsigned int length;
> > > +     u16 flags = 0;
> > >       loff_t size;
> > >       int err;
> > >
> > >       sb_start_pagefault(inode->i_sb);
> > >
> > > -     gfs2_holder_init(ip->i_gl, LM_ST_EXCLUSIVE, 0, &gh);
> > > +     if (current_holds_glock())
> > > +             flags |= LM_FLAG_TRY;
> > > +
> > > +     gfs2_holder_init(ip->i_gl, LM_ST_EXCLUSIVE, flags, &gh);
> > >       if (likely(!outer_gh)) {
> > >               err = gfs2_glock_nq(&gh);
> > >               if (err) {
> > >                       ret = block_page_mkwrite_return(err);
> > > +                     if (err == GLR_TRYFAILED) {
> > > +                             set_current_needs_retry(true);
> > > +                             ret = VM_FAULT_SIGBUS;
> > > +                     }
> >
> > I've checked to make sure but do_user_addr_fault() indeed calls do_sigbus()
> > which raises the SIGBUS signal. So if the application does not ignore
> > SIGBUS, your retry will be visible to the application and can cause all
> > sorts of interesting results...
> 
> I would have noticed that, but no SIGBUS signals were actually
> delivered. So we probably end up in kernelmode_fixup_or_oops() when in
> kernel mode, which just does nothing in that case.

Hum, but how would we get there? I don't think fatal_signal_pending() would
return true yet...

> > So you probably need to add a new VM_FAULT_
> > return code that will behave like VM_FAULT_SIGBUS except it will not raise
> > the signal.
> 
> A new VM_FAULT_* flag might make the code easier to read, but I don't
> know if we can have one.

Well, this is kernel-internal API and there's still plenty of space in
vm_fault_reason.
								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

