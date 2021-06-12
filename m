Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5EB473A50C9
	for <lists+cluster-devel@lfdr.de>; Sat, 12 Jun 2021 23:12:47 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-YwMOI8WFNr-b84vvF4elOw-1; Sat, 12 Jun 2021 17:12:45 -0400
X-MC-Unique: YwMOI8WFNr-b84vvF4elOw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DB68800D55;
	Sat, 12 Jun 2021 21:12:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3139560917;
	Sat, 12 Jun 2021 21:12:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1B6901809CAD;
	Sat, 12 Jun 2021 21:12:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15CLCeJW005600 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 12 Jun 2021 17:12:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8E2012166B4A; Sat, 12 Jun 2021 21:12:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 895702166B49
	for <cluster-devel@redhat.com>; Sat, 12 Jun 2021 21:12:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B81B857D08
	for <cluster-devel@redhat.com>; Sat, 12 Jun 2021 21:12:37 +0000 (UTC)
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk
	[142.44.231.140]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-236-7EiUhG9cMOCdx8KGHD5BUA-1; Sat, 12 Jun 2021 17:12:35 -0400
X-MC-Unique: 7EiUhG9cMOCdx8KGHD5BUA-1
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1lsAvh-007RAr-8b; Sat, 12 Jun 2021 21:12:33 +0000
Date: Sat, 12 Jun 2021 21:12:33 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <YMUjQYtBCIxHvsYV@zeniv-ca.linux.org.uk>
References: <20210531170123.243771-1-agruenba@redhat.com>
	<20210531170123.243771-6-agruenba@redhat.com>
	<YLUY/7pcFMibDnRn@zeniv-ca.linux.org.uk>
MIME-Version: 1.0
In-Reply-To: <YLUY/7pcFMibDnRn@zeniv-ca.linux.org.uk>
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
Cc: cluster-devel@redhat.com, Jan Kara <jack@suse.cz>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>
Subject: Re: [Cluster-devel] [RFC 5/9] iov_iter: Add
	iov_iter_fault_in_writeable()
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 31, 2021 at 05:12:31PM +0000, Al Viro wrote:

> > +int iov_iter_fault_in_writeable(struct iov_iter *i, size_t bytes)
> > +{
> > +	size_t skip = i->iov_offset;
> > +	const struct iovec *iov;
> > +	int err;
> > +	struct iovec v;
> > +
> > +	if (!(i->type & (ITER_BVEC|ITER_KVEC))) {
> > +		iterate_iovec(i, bytes, v, iov, skip, ({
> > +			err = fault_in_pages_writeable(v.iov_base, v.iov_len);
> > +			if (unlikely(err))
> > +				return err;
> > +		0;}))
> > +	}
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL(iov_iter_fault_in_writeable);
> 
> I really don't like that.  Conflicts with iov_iter patches are not hard to
> deal with, but (like fault_in_pages_writeable() itself) it's dangerous as
> hell - fault-in for read is non-destructive, but that is *not*.  Existing
> users have to be careful with it and there are very few of those.  Adding
> that as a new primitive is inviting trouble; at the very least it needs
> a big fat "Don't use unless you really know what you are doing" kind of
> warning.

Actually, is there any good way to make sure that write fault is triggered
_without_ modification of the data?  On x86 lock xadd (of 0, that is) would
probably do it and some of the other architectures could probably get away
with using cmpxchg and its relatives, but how reliable it is wrt always
triggering a write fault if the page is currently read-only?

I mean, something like
	do {
		r0 = r = *p
		atomically [if (*p == r) *p = r; r = *p;]
	} while (r != r0);
would look like a feasible candidate, but what if the processor
"optimizes" that cmpxchg to simple load, seeing that new value is
equal to expected old one?

