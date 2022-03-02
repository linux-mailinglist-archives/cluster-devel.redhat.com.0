Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C15514CB2B8
	for <lists+cluster-devel@lfdr.de>; Thu,  3 Mar 2022 00:12:39 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-542-HTHjDxTiP9CC31mDKpexTQ-1; Wed, 02 Mar 2022 18:12:35 -0500
X-MC-Unique: HTHjDxTiP9CC31mDKpexTQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81A65801AAD;
	Wed,  2 Mar 2022 23:12:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A7D5F5E26C;
	Wed,  2 Mar 2022 23:12:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EA9374A701;
	Wed,  2 Mar 2022 23:12:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 222NCJln025088 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 2 Mar 2022 18:12:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 829311120ABD; Wed,  2 Mar 2022 23:12:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E7091120AB7
	for <cluster-devel@redhat.com>; Wed,  2 Mar 2022 23:12:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 241F4800B21
	for <cluster-devel@redhat.com>; Wed,  2 Mar 2022 23:12:16 +0000 (UTC)
Received: from mail104.syd.optusnet.com.au (mail104.syd.optusnet.com.au
	[211.29.132.246]) by relay.mimecast.com with ESMTP id
	us-mta-440-wJUbIkvsMs6GrxLbyoEeLQ-1; Wed, 02 Mar 2022 18:12:12 -0500
X-MC-Unique: wJUbIkvsMs6GrxLbyoEeLQ-1
Received: from dread.disaster.area (pa49-186-17-0.pa.vic.optusnet.com.au
	[49.186.17.0])
	by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id 5C23C5355EA;
	Thu,  3 Mar 2022 10:12:08 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1nPY8c-000nz7-NA; Thu, 03 Mar 2022 10:12:06 +1100
Date: Thu, 3 Mar 2022 10:12:06 +1100
From: Dave Chinner <david@fromorbit.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20220302231206.GV59715@dread.disaster.area>
References: <1f34c8435fed21e9583492661ceb20d642a75699.1646058596.git.fdmanana@suse.com>
	<20220228223830.GR59715@dread.disaster.area>
	<Yh9EHfl3sYJHeo3T@debian9.Home>
	<CAHc6FU7jBeUEAaB0BupypG1zdxf4shF5T56cHZCD_xXi-jeB+Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHc6FU7jBeUEAaB0BupypG1zdxf4shF5T56cHZCD_xXi-jeB+Q@mail.gmail.com>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.4 cv=e9dl9Yl/ c=1 sm=1 tr=0 ts=621ff9ca
	a=+dVDrTVfsjPpH/ci3UuFng==:117 a=+dVDrTVfsjPpH/ci3UuFng==:17
	a=kj9zAlcOel0A:10 a=o8Y5sQTvuykA:10 a=VwQbUJbxAAAA:8 a=iox4zFpeAAAA:8
	a=7-415B0cAAAA:8 a=kOgEMRnqgivgxslKRJ4A:9 a=CjuIK1q_8ugA:10
	a=AjGcO6oz07-iQ99wixmX:22 a=WzC6qhA0u3u7Ye7llzcV:22
	a=biEYGPWJfzWAr4FL6Ov7:22
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	Filipe Manana <fdmanana@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>,
	Michael Kerrisk <mtk@man7.org>,
	Josef Bacik <josef@toxicpanda.com>, linux-xfs@vger.kernel.org,
	Filipe Manana <fdmanana@suse.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-btrfs <linux-btrfs@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH] iomap: fix incomplete async dio reads
 when using IOMAP_DIO_PARTIAL
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 02, 2022 at 02:03:28PM +0100, Andreas Gruenbacher wrote:
> On Wed, Mar 2, 2022 at 11:17 AM Filipe Manana <fdmanana@kernel.org> wrote:
> > On Tue, Mar 01, 2022 at 09:38:30AM +1100, Dave Chinner wrote:
> > > On Mon, Feb 28, 2022 at 02:32:03PM +0000, fdmanana@kernel.org wrote:
> > > > From: Filipe Manana <fdmanana@suse.com>
> > > .....
> > >
> > > > 11) At iomap_dio_complete() we adjust the iocb->ki_pos from X to X + 4K
> > > >     and return 4K (the amount of io done) to iomap_dio_complete_work();
> > > >
> > > > 12) iomap_dio_complete_work() calls the iocb completion callback,
> > > >     iocb->ki_complete() with a second argument value of 4K (total io
> > > >     done) and the iocb with the adjust ki_pos of X + 4K. This results
> > > >     in completing the read request for io_uring, leaving it with a
> > > >     result of 4K bytes read, and only the first page of the buffer
> > > >     filled in, while the remaining 3 pages, corresponding to the other
> > > >     3 extents, were not filled;
> > > >
> > > > 13) For the application, the result is unexpected because if we ask
> > > >     to read N bytes, it expects to get N bytes read as long as those
> > > >     N bytes don't cross the EOF (i_size).
> > >
> > > Yeah, that's exactly the sort of problem we were having with XFS
> > > with partial DIO completions due to needing multiple iomap iteration
> > > loops to complete a single IO. Hence IOMAP_NOWAIT now triggers the
> > > above range check and aborts before we start...
> >
> > Interesting.
> 
> Dave, this seems to affect all users of iomap_dio_rw in the same way,
> so would it make sense to move this check there?

Perhaps, but I'm not sure it makes sense because filesystems need to
abort ->iomap_begin with -EAGAIN in IOMAP_NOWAIT contexts before
they make any changes.

Hence detecting short extents in the generic code becomes ...
difficult because we might now need to undo changes that have been
made in ->iomap_begin. e.g. if the filesystem allocates space and
the iomap core says "not long enough" because IOMAP_NOWAIT is set,
then we may have to punch out that allocation in ->iomap_end beforei
returning -EAGAIN.

That means filesystems like XFS may now need to supply a ->iomap_end
function to undo stuff the core decides it shouldn't have done,
instead of the filesystem ensuring it never does the operation it in
the first place...

IOWs, the correct behaviour here is for the filesystem ->iomap_begin
method to see that it needs to allocate and return -EAGAIN if
IOMAP_NOWAIT is set, not do the allocation and hope it that it ends
up being long enough to cover the entire IO we have to do.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

