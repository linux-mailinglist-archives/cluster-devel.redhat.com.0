Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4E7AF3D4AAC
	for <lists+cluster-devel@lfdr.de>; Sun, 25 Jul 2021 01:40:04 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-aJzfcwBzMpq59ULb1iC5vg-1; Sat, 24 Jul 2021 19:40:02 -0400
X-MC-Unique: aJzfcwBzMpq59ULb1iC5vg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9255F8799EB;
	Sat, 24 Jul 2021 23:39:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E110A5D6BA;
	Sat, 24 Jul 2021 23:39:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 184674BB7C;
	Sat, 24 Jul 2021 23:39:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16ONdldt007822 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 24 Jul 2021 19:39:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1F4CA114B2E5; Sat, 24 Jul 2021 23:39:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AFC7114B2E1
	for <cluster-devel@redhat.com>; Sat, 24 Jul 2021 23:39:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0CEFA1857F0F
	for <cluster-devel@redhat.com>; Sat, 24 Jul 2021 23:39:42 +0000 (UTC)
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk
	[142.44.231.140]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-60-c-3fzg5VMIaZipp5HEcaKA-1; Sat, 24 Jul 2021 19:39:39 -0400
X-MC-Unique: c-3fzg5VMIaZipp5HEcaKA-1
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1m7REv-003hHv-87; Sat, 24 Jul 2021 23:39:29 +0000
Date: Sat, 24 Jul 2021 23:39:29 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <YPyksQ/53I8OGY/D@zeniv-ca.linux.org.uk>
References: <20210724193449.361667-1-agruenba@redhat.com>
	<20210724193449.361667-2-agruenba@redhat.com>
	<CAHk-=whodi=ZPhoJy_a47VD+-aFtz385B4_GHvQp8Bp9NdTKUg@mail.gmail.com>
	<YPx28cEvrVl6YrDk@zeniv-ca.linux.org.uk>
	<CAHc6FU5nGRn1_oc-8rSOCPfkasWknH1Wb3FeeQYP29zb_5fFGQ@mail.gmail.com>
	<YPyMyPCpZKGlfAGk@zeniv-ca.linux.org.uk>
	<CAHc6FU4aVL_g3LHEWng1fr8j3jJt+QVK3wAda2q6pfi+xRJcwg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHc6FU4aVL_g3LHEWng1fr8j3jJt+QVK3wAda2q6pfi+xRJcwg@mail.gmail.com>
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
	"Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v4 1/8] iov_iter: Introduce
 iov_iter_fault_in_writeable helper
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 25, 2021 at 12:06:41AM +0200, Andreas Gruenbacher wrote:
> On Sat, Jul 24, 2021 at 11:57 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
> > On Sat, Jul 24, 2021 at 11:38:20PM +0200, Andreas Gruenbacher wrote:
> >
> > > Hmm, how could we have sub-page failure areas when this is about if
> > > and how pages are mapped? If we return the number of bytes that are
> > > accessible, then users will know if they got nothing, something, or
> > > everything, and they can act accordingly.
> >
> > What I'm saying is that in situation when you have cacheline-sized
> > poisoned areas, there's no way to get an accurate count of readable
> > area other than try and copy it out.
> >
> > What's more, "something" is essentially useless information - the
> > pages might get unmapped right as your function returns; the caller
> > still needs to deal with partial copies.  And that's a slow path
> > by definition, so informing them of a partial fault-in is not
> > going to be useful.
> >
> > As far as callers are concerned, it's "nothing suitable in the
> > beginning of the area" vs. "something might be accessible".
> 
> Yes, and the third case would be "something might be accessible, but
> not all of it". There probably are callers that give up when they
> don't have it all.

Who cares?  Again,
	1) those callers *still* have to cope with copyin/copyout failures
halfway through.  Fully successful fault-in does not guarantee anything
whatsoever.  IOW, you won't get rid of any complexity that way.
	2) earlier bailout in rare error case is not worth bothering with.
If you'd been given an iov_iter spanning an unmapped/unreadable/unwritable
area of user memory, it's either a fucking rare race with truncate() of
an mmapped file or a pilot error.  Neither case is worth optimizing for.

	The difference between partially accessible and completely accessible
at the fault-in time is useless for callers.  Really.

