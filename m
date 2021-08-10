Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 703E93E53C0
	for <lists+cluster-devel@lfdr.de>; Tue, 10 Aug 2021 08:45:27 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-yNju5oEZNku8UVX8-YpR_Q-1; Tue, 10 Aug 2021 02:45:25 -0400
X-MC-Unique: yNju5oEZNku8UVX8-YpR_Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37D2B87D544;
	Tue, 10 Aug 2021 06:45:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BF77189C7;
	Tue, 10 Aug 2021 06:45:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 67F10180BAB0;
	Tue, 10 Aug 2021 06:45:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17A6jG2T006697 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 10 Aug 2021 02:45:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6E548D7DE5; Tue, 10 Aug 2021 06:45:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6975FD7DF3
	for <cluster-devel@redhat.com>; Tue, 10 Aug 2021 06:45:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 60185101A52C
	for <cluster-devel@redhat.com>; Tue, 10 Aug 2021 06:45:13 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-216-DTV2I2kJP_e_aqdXf9eqtg-1;
	Tue, 10 Aug 2021 02:45:11 -0400
X-MC-Unique: DTV2I2kJP_e_aqdXf9eqtg-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 08FC161051;
	Tue, 10 Aug 2021 06:45:09 +0000 (UTC)
Date: Mon, 9 Aug 2021 23:45:09 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20210810064509.GI3601443@magnolia>
References: <20210809061244.1196573-1-hch@lst.de>
	<20210809061244.1196573-12-hch@lst.de>
	<20210809221047.GC3657114@dread.disaster.area>
MIME-Version: 1.0
In-Reply-To: <20210809221047.GC3657114@dread.disaster.area>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: nvdimm@lists.linux.dev, cluster-devel@redhat.com,
	Matthew Wilcox <willy@infradead.org>,
	Shiyang Ruan <ruansy.fnst@fujitsu.com>,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>,
	Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 11/30] iomap: add the new iomap_iter
	model
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

On Tue, Aug 10, 2021 at 08:10:47AM +1000, Dave Chinner wrote:
> On Mon, Aug 09, 2021 at 08:12:25AM +0200, Christoph Hellwig wrote:
> > The iomap_iter struct provides a convenient way to package up and
> > maintain all the arguments to the various mapping and operation
> > functions.  It is operated on using the iomap_iter() function that
> > is called in loop until the whole range has been processed.  Compared
> > to the existing iomap_apply() function this avoid an indirect call
> > for each iteration.
> > 
> > For now iomap_iter() calls back into the existing ->iomap_begin and
> > ->iomap_end methods, but in the future this could be further optimized
> > to avoid indirect calls entirely.
> > 
> > Based on an earlier patch from Matthew Wilcox <willy@infradead.org>.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > ---
> >  fs/iomap/Makefile     |  1 +
> >  fs/iomap/core.c       | 79 +++++++++++++++++++++++++++++++++++++++++++
> >  fs/iomap/trace.h      | 37 +++++++++++++++++++-
> >  include/linux/iomap.h | 56 ++++++++++++++++++++++++++++++
> >  4 files changed, 172 insertions(+), 1 deletion(-)
> >  create mode 100644 fs/iomap/core.c
> > 
> > diff --git a/fs/iomap/Makefile b/fs/iomap/Makefile
> > index eef2722d93a183..6b56b10ded347a 100644
> > --- a/fs/iomap/Makefile
> > +++ b/fs/iomap/Makefile
> > @@ -10,6 +10,7 @@ obj-$(CONFIG_FS_IOMAP)		+= iomap.o
> >  
> >  iomap-y				+= trace.o \
> >  				   apply.o \
> > +				   core.o \
> 
> This creates a discontinuity in the iomap git history. Can you add
> these new functions to iomap/apply.c, then when the old apply code
> is removed later in the series rename the file to core.c? At least
> that way 'git log --follow fs/iomap/core.c' will walk back into the
> current history of fs/iomap/apply.c and the older pre-disaggregation
> fs/iomap.c without having to take the tree back in time to find
> those files...

...or put the new code in apply.c, remove iomap_apply, and don't bother
with the renaming at all?

I don't see much reason to break the git history.  This is effectively a
new epoch in iomap, but that is plainly obvious from the function
declarations.

I'll wander through the rest of the unreviewed patches tomorrow morning,
these are merely my off-the-cuff impressions.

--D

> 
> Cheers,
> 
> Dave.
> -- 
> Dave Chinner
> david@fromorbit.com

