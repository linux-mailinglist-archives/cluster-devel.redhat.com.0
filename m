Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 80A314004F2
	for <lists+cluster-devel@lfdr.de>; Fri,  3 Sep 2021 20:33:45 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-5yHPNTfdPn2Q3Ue73UYK6g-1; Fri, 03 Sep 2021 14:33:43 -0400
X-MC-Unique: 5yHPNTfdPn2Q3Ue73UYK6g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61641835DE3;
	Fri,  3 Sep 2021 18:33:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BC3E10016F5;
	Fri,  3 Sep 2021 18:33:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6ED9918005A2;
	Fri,  3 Sep 2021 18:33:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 183IPuhk017806 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 3 Sep 2021 14:25:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8F4D32051CFF; Fri,  3 Sep 2021 18:25:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A8C52051D0E
	for <cluster-devel@redhat.com>; Fri,  3 Sep 2021 18:25:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D9096811E93
	for <cluster-devel@redhat.com>; Fri,  3 Sep 2021 18:25:53 +0000 (UTC)
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk
	[142.44.231.140]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-561-Ars0py0-NvWxcoGUXqz_-w-1; Fri, 03 Sep 2021 14:25:49 -0400
X-MC-Unique: Ars0py0-NvWxcoGUXqz_-w-1
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1mMDso-000qie-AY; Fri, 03 Sep 2021 18:25:46 +0000
Date: Fri, 3 Sep 2021 18:25:46 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YTJoqq0fVB+xAB7w@zeniv-ca.linux.org.uk>
References: <20210827164926.1726765-1-agruenba@redhat.com>
	<CAHk-=wiUtyoTWuzroNJQwQDM9GHRXvq4974VL=y8T_3tUxDbkA@mail.gmail.com>
	<CAHc6FU7K0Ho=nH6fCK+Amc7zEg2G31v+gE3920ric3NE4MfH=A@mail.gmail.com>
	<CAHk-=wjUs8qy3hTEy-7QX4L=SyS85jF58eiT2Yq2YMUdTFAgvA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHk-=wjUs8qy3hTEy-7QX4L=SyS85jF58eiT2Yq2YMUdTFAgvA@mail.gmail.com>
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
Cc: Paul Mackerras <paulus@ozlabs.org>,
	cluster-devel <cluster-devel@redhat.com>,
	Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>, kvm-ppc@vger.kernel.org,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v7 00/19] gfs2: Fix mmap + page fault
	deadlocks
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 03, 2021 at 08:52:00AM -0700, Linus Torvalds wrote:
> On Wed, Sep 1, 2021 at 12:53 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
> >
> > So there's a minor merge conflict between Christoph's iomap_iter
> > conversion and this patch queue now, and I should probably clarify the
> > description of "iomap: Add done_before argument to iomap_dio_rw" that
> > Darrick ran into. Then there are the user copy issues that Al has
> > pointed out. Fixing those will create superficial conflicts with this
> > patch queue, but probably nothing serious.
> >
> > So how should I proceed: do you expect a v8 of this patch queue on top
> > of the current mainline?
> 
> So if you rebase for fixes, it's going to be a "next merge window" thing again.
> 
> Personally, I'm ok with the series as is, and the conflict isn't an
> issue. So I'd take it as is, and then people can fix up niggling
> issues later.
> 
> But if somebody screams loudly..

FWIW, my objections regarding the calling conventions are still there.

Out of 3 callers that do want more than "success/failure", one is gone
(series by tglx) and one more is broken (regardless of the semantics,
btrfs on arm64).  Which leaves 1 caller (fault-in for read in FPU
handling on x86 sigreturn).  That caller turns out to be correct, but
IMO there are fairly strong arguments in favour of *not* using the
normal fault-in in that case.

	"how many bytes can we fault in" is misleading, unless we really
poke into every cacheline in the affected area.  Which might be a primitive
worth having, but it's a lot heavier than needed by the majority of callers.

