Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id A13F841B415
	for <lists+cluster-devel@lfdr.de>; Tue, 28 Sep 2021 18:41:57 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-TFvbbb76OZy0q1IjZ4IR-w-1; Tue, 28 Sep 2021 12:41:55 -0400
X-MC-Unique: TFvbbb76OZy0q1IjZ4IR-w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0490E835DE0;
	Tue, 28 Sep 2021 16:41:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DBF64EC7D;
	Tue, 28 Sep 2021 16:41:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1FD611803B30;
	Tue, 28 Sep 2021 16:41:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18SGfiid021804 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 28 Sep 2021 12:41:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 669B4111C4BD; Tue, 28 Sep 2021 16:41:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6198E111C4AB
	for <cluster-devel@redhat.com>; Tue, 28 Sep 2021 16:41:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A7951066682
	for <cluster-devel@redhat.com>; Tue, 28 Sep 2021 16:41:44 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-106-sVZgHKMEMluYXVTJA8NznQ-1; Tue, 28 Sep 2021 12:41:42 -0400
X-MC-Unique: sVZgHKMEMluYXVTJA8NznQ-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1mVG76-00B1nC-Up; Tue, 28 Sep 2021 16:38:06 +0000
Date: Tue, 28 Sep 2021 17:37:52 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <YVNE4HGKPb7bw+En@casper.infradead.org>
References: <20210827164926.1726765-1-agruenba@redhat.com>
	<20210827164926.1726765-4-agruenba@redhat.com>
	<CAL3q7H7PdBTuK28tN=3fGUyTP9wJU8Ydrq35YtNsfA_3xRQhzQ@mail.gmail.com>
	<CAHc6FU7rbdJxeuvoz0jov5y_GH_B4AtjkDnbNyOxeeNc1Zw5+A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHc6FU7rbdJxeuvoz0jov5y_GH_B4AtjkDnbNyOxeeNc1Zw5+A@mail.gmail.com>
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
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	fdmanana@gmail.com, "Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v7 03/19] gup: Turn
 fault_in_pages_{readable, writeable} into fault_in_{readable, writeable}
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

On Tue, Sep 28, 2021 at 05:02:43PM +0200, Andreas Gruenbacher wrote:
> On Fri, Sep 3, 2021 at 4:57 PM Filipe Manana <fdmanana@gmail.com> wrote:
> > On Fri, Aug 27, 2021 at 5:52 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
> > > +size_t fault_in_writeable(char __user *uaddr, size_t size)
> > > +{
> > > +       char __user *start = uaddr, *end;
> > > +
> > > +       if (unlikely(size == 0))
> > > +               return 0;
> > > +       if (!PAGE_ALIGNED(uaddr)) {
> > > +               if (unlikely(__put_user(0, uaddr) != 0))
> > > +                       return size;
> > > +               uaddr = (char __user *)PAGE_ALIGN((unsigned long)uaddr);
> > > +       }
> > > +       end = (char __user *)PAGE_ALIGN((unsigned long)start + size);
> > > +       if (unlikely(end < start))
> > > +               end = NULL;
> > > +       while (uaddr != end) {
> > > +               if (unlikely(__put_user(0, uaddr) != 0))
> > > +                       goto out;
> > > +               uaddr += PAGE_SIZE;
> >
> > Won't we loop endlessly or corrupt some unwanted page when 'end' was
> > set to NULL?
> 
> What do you mean? We set 'end' to NULL when start + size < start
> exactly so that the loop will stop when uaddr wraps around.

But think about x86-64.  The virtual address space (unless you have 5
level PTs) looks like:

[0, 2^47)		userspace
[2^47, 2^64 - 2^47)	hole
[2^64 - 2^47, 2^64)	kernel space

If we try to copy from the hole we'll get some kind of fault (I forget
the details).  We have to stop at the top of userspace.

