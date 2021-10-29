Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6454B43FCB9
	for <lists+cluster-devel@lfdr.de>; Fri, 29 Oct 2021 14:54:17 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-CFOVffMZPkSbhBNc-88zOg-1; Fri, 29 Oct 2021 08:54:13 -0400
X-MC-Unique: CFOVffMZPkSbhBNc-88zOg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 519418018AC;
	Fri, 29 Oct 2021 12:54:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1031A5F707;
	Fri, 29 Oct 2021 12:54:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 13990180BAD2;
	Fri, 29 Oct 2021 12:54:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19TCoI2S006988 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 29 Oct 2021 08:50:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 721CA2026D64; Fri, 29 Oct 2021 12:50:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D2742026D65
	for <cluster-devel@redhat.com>; Fri, 29 Oct 2021 12:50:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F1E3802A5E
	for <cluster-devel@redhat.com>; Fri, 29 Oct 2021 12:50:15 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-109-qxP1QAbtPxGo0nZuhEiAuQ-3;
	Fri, 29 Oct 2021 08:50:13 -0400
X-MC-Unique: qxP1QAbtPxGo0nZuhEiAuQ-3
Received: by mail.kernel.org (Postfix) with ESMTPSA id EAE10611CC;
	Fri, 29 Oct 2021 12:50:09 +0000 (UTC)
Date: Fri, 29 Oct 2021 13:50:06 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andreas =?iso-8859-1?Q?Gr=FCnbacher?= <andreas.gruenbacher@gmail.com>
Message-ID: <YXvt/mNABVv6a5nO@arm.com>
References: <CAHk-=wgP058PNY8eoWW=5uRMox-PuesDMrLsrCWPS+xXhzbQxQ@mail.gmail.com>
	<YXL9tRher7QVmq6N@arm.com>
	<CAHk-=wg4t2t1AaBDyMfOVhCCOiLLjCB5TFVgZcV4Pr8X2qptJw@mail.gmail.com>
	<CAHc6FU7BEfBJCpm8wC3P+8GTBcXxzDWcp6wAcgzQtuaJLHrqZA@mail.gmail.com>
	<YXhH0sBSyTyz5Eh2@arm.com>
	<CAHk-=wjWDsB-dDj+x4yr8h8f_VSkyB7MbgGqBzDRMNz125sZxw@mail.gmail.com>
	<YXmkvfL9B+4mQAIo@arm.com>
	<CAHk-=wjQqi9cw1Guz6a8oBB0xiQNF_jtFzs3gW0k7+fKN-mB1g@mail.gmail.com>
	<YXsUNMWFpmT1eQcX@arm.com>
	<CAHpGcMLeiXSjCJGY6SCJJ=bdNOspHLHofmTE8aC_sZtfHRG5ZA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHpGcMLeiXSjCJGY6SCJJ=bdNOspHLHofmTE8aC_sZtfHRG5ZA@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: kvm-ppc@vger.kernel.org, cluster-devel <cluster-devel@redhat.com>,
	Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>, Paul Mackerras <paulus@ozlabs.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-btrfs <linux-btrfs@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v8 00/17] gfs2: Fix mmap + page fault
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Oct 29, 2021 at 12:15:55AM +0200, Andreas Grünbacher wrote:
> Am Do., 28. Okt. 2021 um 23:21 Uhr schrieb Catalin Marinas
> <catalin.marinas@arm.com>:
> > I think for nested contexts we can save the uaccess fault state on
> > exception entry, restore it on return. Or (needs some thinking on
> > atomicity) save it in a local variable. The high-level API would look
> > something like:
> >
> >         unsigned long uaccess_flags;    /* we could use TIF_ flags */
> >
> >         uaccess_flags = begin_retriable_uaccess();
> >         copied = copy_page_from_iter_atomic(...);
> >         retry = end_retriable_uaccess(uaccess_flags);
> >         ...
> >
> >         if (!retry)
> >                 break;
> >
> > I think we'd need a TIF flag to mark the retriable region and another to
> > track whether a non-recoverable fault occurred. It needs prototyping.
> >
> > Anyway, if you don't like this approach, I'll look at error codes being
> > returned but rather than changing all copy_from_user() etc., introduce a
> > new API that returns different error codes depending on the fault
> > (e.g -EFAULT vs -EACCES). We already have copy_from_user_nofault(), we'd
> > need something for the iov_iter stuff to use in the fs code.
> 
> We won't need any of that on the filesystem read and write paths. The
> two cases there are buffered and direct I/O:

Thanks for the clarification, very useful.

> * In the buffered I/O case, the copying happens with page faults
> disabled, at a byte granularity. If that returns a short result, we
> need to enable page faults, check if the exact address that failed
> still fails (in which case we have a sub-page fault),  fault in the
> pages, disable page faults again, and repeat. No probing for sub-page
> faults beyond the first byte of the fault-in address is needed.
> Functions fault_in_{readable,writeable} implicitly have this behavior;
> for fault_in_safe_writeable() the choice we have is to either add
> probing of the first byte for sub-page faults to this function or
> force callers to do that probing separately. At this point, I'd vote
> for the former.

This sounds fine to me (and I have some draft patches already on top of
your series).

> * In the direct I/O case, the copying happens while we're holding page
> references, so the only page faults that can occur during copying are
> sub-page faults.

Does holding a page reference guarantee that the user pte pointing to
such page won't change, for example a pte_mkold()? I assume for direct
I/O, the PG_locked is not held. But see below, it may not be relevant.

> When iomap_dio_rw or its legacy counterpart is called
> with page faults disabled, we need to make sure that the caller can
> distinguish between page faults triggered during
> bio_iov_iter_get_pages() and during the copying, but that's a separate
> problem. (At the moment, when iomap_dio_rw fails with -EFAULT, the
> caller *cannot* distinguish between a bio_iov_iter_get_pages failure
> and a failure during synchronous copying, but that could be fixed by
> returning unique error codes from iomap_dio_rw.)

Since the direct I/O pins the pages in memory, does it even need to do a
uaccess? It could copy the data via the kernel mapping (kmap). For arm64
MTE, all such accesses are not checked (they use a match-all pointer
tag) since the kernel is not set up to handle such sub-page faults (no
copy_from/to_user but a direct access).

> So as far as I can see, the only problematic case we're left with is
> copying bigger than byte-size chunks with page faults disabled when we
> don't know whether the underlying pages are resident or not. My guess
> would be that in this case, if the copying fails, it would be
> perfectly acceptable to explicitly probe the entire chunk for sub-page
> faults.

Yeah, if there are only a couple of places left, we can add the explicit
probing (via some probe_user_writable function).

-- 
Catalin

