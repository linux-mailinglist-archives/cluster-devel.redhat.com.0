Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2D773169D03
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Feb 2020 05:34:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582518895;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=apfd6lNxY/rtpZ6zUIruSai2FS7trKHyTmXNKHYJ8Mc=;
	b=Wa+iQ9uL/NCcMFCKv8jrDrdKsOnSpjxUW68Hl9lLhYsAwhwpjNqydLwtvuPgzrlWec7Zvy
	nFcGdvhXA40NBiZUzv4Z7iHOjccm4eB2KLbA7u/ZS05uhtZGL0EXL9UGcUPIXavBYXGLa6
	NhuOsFXuyYp7hKzGdA8pEUp7KYrJ3pM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-94-BiIxxjDSNQK1QVVHv4ITbg-1; Sun, 23 Feb 2020 23:34:53 -0500
X-MC-Unique: BiIxxjDSNQK1QVVHv4ITbg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBA6B185734F;
	Mon, 24 Feb 2020 04:34:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 34ADE790DD;
	Mon, 24 Feb 2020 04:34:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B00D7860E5;
	Mon, 24 Feb 2020 04:34:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01O4YPtC016815 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 23 Feb 2020 23:34:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4CE202166B2B; Mon, 24 Feb 2020 04:34:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 484DB2166B2E
	for <cluster-devel@redhat.com>; Mon, 24 Feb 2020 04:34:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 166C5101A55E
	for <cluster-devel@redhat.com>; Mon, 24 Feb 2020 04:34:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-357-HvbEZSjLPZi0yEsouR5P4Q-1; Sun, 23 Feb 2020 23:34:21 -0500
X-MC-Unique: HvbEZSjLPZi0yEsouR5P4Q-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j65RL-0000Cd-GT; Mon, 24 Feb 2020 04:33:55 +0000
Date: Sun, 23 Feb 2020 20:33:55 -0800
From: Matthew Wilcox <willy@infradead.org>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Message-ID: <20200224043355.GL24185@bombadil.infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
	<20200219210103.32400-23-willy@infradead.org>
	<20200220154912.GC19577@infradead.org>
	<20200220165734.GZ24185@bombadil.infradead.org>
	<20200222010013.GH9506@magnolia>
MIME-Version: 1.0
In-Reply-To: <20200222010013.GH9506@magnolia>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01O4YPtC016815
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
	ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v7 22/24] iomap: Convert from readpages
	to readahead
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Fri, Feb 21, 2020 at 05:00:13PM -0800, Darrick J. Wong wrote:
> On Thu, Feb 20, 2020 at 08:57:34AM -0800, Matthew Wilcox wrote:
> > On Thu, Feb 20, 2020 at 07:49:12AM -0800, Christoph Hellwig wrote:
> > +/**
> > + * iomap_readahead - Attempt to read pages from a file.
> > + * @rac: Describes the pages to be read.
> > + * @ops: The operations vector for the filesystem.
> > + *
> > + * This function is for filesystems to call to implement their readahe=
ad
> > + * address_space operation.
> > + *
> > + * Context: The file is pinned by the caller, and the pages to be read=
 are
> > + * all locked and have an elevated refcount.  This function will unloc=
k
> > + * the pages (once I/O has completed on them, or I/O has been determin=
ed to
> > + * not be necessary).  It will also decrease the refcount once the pag=
es
> > + * have been submitted for I/O.  After this point, the page may be rem=
oved
> > + * from the page cache, and should not be referenced.
> > + */
> >=20
> > > Isn't the context documentation something that belongs into the aop
> > > documentation?  I've never really seen the value of duplicating this
> > > information in method instances, as it is just bound to be out of dat=
e
> > > rather sooner than later.
> >=20
> > I'm in two minds about it as well.  There's definitely no value in
> > providing kernel-doc for implementations of a common interface ... so
> > rather than fixing the nilfs2 kernel-doc, I just deleted it.  But this
> > isn't just the implementation, like nilfs2_readahead() is, it's a libra=
ry
> > function for filesystems to call, so it deserves documentation.  On the
> > other hand, there's no real thought to this on the part of the filesyst=
em;
> > the implementation just calls this with the appropriate ops pointer.
> >=20
> > Then again, I kind of feel like we need more documentation of iomap to
> > help filesystems convert to using it.  But maybe kernel-doc isn't the
> > mechanism to provide that.
>=20
> I think we need more documentation of the parts of iomap where it can
> call back into the filesystem (looking at you, iomap_dio_ops).
>=20
> I'm not opposed to letting this comment stay, though I don't see it as
> all that necessary since iomap_readahead implements a callout that's
> documented in vfs.rst and is thus subject to all the constraints listed
> in the (*readahead) documentation.

Right.  And that's not currently in kernel-doc format, but should be.
Something for a different patchset, IMO.

What we need documenting _here_ is the conditions under which the
iomap_ops are called so the filesystem author doesn't need to piece them
together from three different places.  Here's what I currently have:

 * Context: The @ops callbacks may submit I/O (eg to read the addresses of
 * blocks from disc), and may wait for it.  The caller may be trying to
 * access a different page, and so sleeping excessively should be avoided.
 * It may allocate memory, but should avoid large allocations.  This
 * function is called with memalloc_nofs set, so allocations will not cause
 * the filesystem to be reentered.


