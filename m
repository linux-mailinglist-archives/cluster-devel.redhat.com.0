Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id D321F163907
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Feb 2020 02:09:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582074539;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nN81wu0aKE40wYjxE4v8N5XE4kbeOTYsPbIXLtI1Qzw=;
	b=Bxq35WwDWwp6aKuqz5lBLOuAGKb5NBK/GXOj8j+wPiXS0ezCGO2kBQQ+LaipC3rxBWfH1P
	WRS95JWgYoqkUKDNLWWc/6yymHdcJLwFkpwSDfod830+mBDBHFrEPYkTJqggIF7nPCudhl
	FzcZ8NMhrjWK2EeluRGkbarP3Vj1jpg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-DgGxnVzxP1ORlFCnViOI5A-1; Tue, 18 Feb 2020 20:08:58 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7B058017CC;
	Wed, 19 Feb 2020 01:08:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 89F055C13C;
	Wed, 19 Feb 2020 01:08:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 135171809567;
	Wed, 19 Feb 2020 01:08:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01J18rbr032050 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 20:08:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E714F2166B28; Wed, 19 Feb 2020 01:08:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E30872166B27
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 01:08:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 77837801E67
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 01:08:50 +0000 (UTC)
Received: from mail105.syd.optusnet.com.au (mail105.syd.optusnet.com.au
	[211.29.132.249]) by relay.mimecast.com with ESMTP id
	us-mta-440-4bOr3Y-dNISFgdyDjcmXuQ-1; Tue, 18 Feb 2020 20:08:44 -0500
Received: from dread.disaster.area (pa49-179-138-28.pa.nsw.optusnet.com.au
	[49.179.138.28])
	by mail105.syd.optusnet.com.au (Postfix) with ESMTPS id 6590F3A3346;
	Wed, 19 Feb 2020 12:08:42 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1j4Dqy-0004dZ-Qv; Wed, 19 Feb 2020 12:08:40 +1100
Date: Wed, 19 Feb 2020 12:08:40 +1100
From: Dave Chinner <david@fromorbit.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200219010840.GX10776@dread.disaster.area>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-16-willy@infradead.org>
	<20200218063110.GO10776@dread.disaster.area>
	<20200218195404.GD24185@bombadil.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200218195404.GD24185@bombadil.infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=W5xGqiek c=1 sm=1 tr=0
	a=zAxSp4fFY/GQY8/esVNjqw==:117 a=zAxSp4fFY/GQY8/esVNjqw==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=l697ptgUJYAA:10
	a=JfrnYn6hAAAA:8 a=7-415B0cAAAA:8 a=pXOkKLco0wbfc50Nqe8A:9
	a=VBWjYGV6Kxsh7Hhu:21 a=T0X9MdoumZd6j53S:21 a=CjuIK1q_8ugA:10
	a=1CNFftbPRP8L7MoqJWF3:22 a=biEYGPWJfzWAr4FL6Ov7:22
X-MC-Unique: 4bOr3Y-dNISFgdyDjcmXuQ-1
X-MC-Unique: DgGxnVzxP1ORlFCnViOI5A-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01J18rbr032050
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v6 09/19] mm: Add
	page_cache_readahead_limit
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
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Feb 18, 2020 at 11:54:04AM -0800, Matthew Wilcox wrote:
> On Tue, Feb 18, 2020 at 05:31:10PM +1100, Dave Chinner wrote:
> > On Mon, Feb 17, 2020 at 10:45:56AM -0800, Matthew Wilcox wrote:
> > > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> > >=20
> > > ext4 and f2fs have duplicated the guts of the readahead code so
> > > they can read past i_size.  Instead, separate out the guts of the
> > > readahead code so they can call it directly.
> >=20
> > Gross and nasty (hosting non-stale data beyond EOF in the page
> > cache, that is).
>=20
> I thought you meant sneaking changes into the VFS (that were rejected) by
> copying VFS code and modifying it ...

Well, now that you mention it... :P

> > > +/**
> > > + * page_cache_readahead_limit - Start readahead beyond a file's i_si=
ze.
> > > + * @mapping: File address space.
> > > + * @file: This instance of the open file; used for authentication.
> > > + * @offset: First page index to read.
> > > + * @end_index: The maximum page index to read.
> > > + * @nr_to_read: The number of pages to read.
> > > + * @lookahead_size: Where to start the next readahead.
> > > + *
> > > + * This function is for filesystems to call when they want to start
> > > + * readahead potentially beyond a file's stated i_size.  If you want
> > > + * to start readahead on a normal file, you probably want to call
> > > + * page_cache_async_readahead() or page_cache_sync_readahead() inste=
ad.
> > > + *
> > > + * Context: File is referenced by caller.  Mutexes may be held by ca=
ller.
> > > + * May sleep, but will not reenter filesystem to reclaim memory.
> > >   */
> > > -void __do_page_cache_readahead(struct address_space *mapping,
> > > -=09=09struct file *filp, pgoff_t offset, unsigned long nr_to_read,
> > > -=09=09unsigned long lookahead_size)
> > > +void page_cache_readahead_limit(struct address_space *mapping,
> >=20
> > ... I don't think the function name conveys it's purpose. It's
> > really a ranged readahead that ignores where i_size lies. i.e
> >=20
> > =09page_cache_readahead_range(mapping, start, end, nr_to_read)
> >=20
> > seems like a better API to me, and then you can drop the "start
> > readahead beyond i_size" comments and replace it with "Range is not
> > limited by the inode's i_size and hence can be used to read data
> > stored beyond EOF into the page cache."
>=20
> I'm concerned that calling it 'range' implies "I want to read between
> start and end" rather than "I want to read nr_to_read at start, oh but
> don't go past end".
>=20
> Maybe the right way to do this is have the three callers cap nr_to_read.
> Well, the one caller ... after all, f2fs and ext4 have no desire to
> cap the length.  Then we can call it page_cache_readahead_exceed() or
> page_cache_readahead_dangerous() or something else like that to make it
> clear that you shouldn't be calling it.

Fair point.

And in reading this, it occurred to me that what we are enabling is
an "out of bounds" readahead function. so
page_cache_readahead_OOB() or *_unbounded() might be a better name....

>   * Like add_to_page_cache_locked, but used to add newly allocated pages:
> diff --git a/mm/readahead.c b/mm/readahead.c
> index 9dd431fa16c9..cad26287ad8b 100644
> --- a/mm/readahead.c
> +++ b/mm/readahead.c
> @@ -142,45 +142,43 @@ static void read_pages(struct readahead_control *ra=
c, struct list_head *pages)
>  =09blk_finish_plug(&plug);
>  }
> =20
> -/*
> - * __do_page_cache_readahead() actually reads a chunk of disk.  It alloc=
ates
> - * the pages first, then submits them for I/O. This avoids the very bad
> - * behaviour which would occur if page allocations are causing VM writeb=
ack.
> - * We really don't want to intermingle reads and writes like that.
> +/**
> + * page_cache_readahead_exceed - Start unchecked readahead.
> + * @mapping: File address space.
> + * @file: This instance of the open file; used for authentication.
> + * @index: First page index to read.
> + * @nr_to_read: The number of pages to read.
> + * @lookahead_size: Where to start the next readahead.
> + *
> + * This function is for filesystems to call when they want to start
> + * readahead beyond a file's stated i_size.  This is almost certainly
> + * not the function you want to call.  Use page_cache_async_readahead()
> + * or page_cache_sync_readahead() instead.
> + *
> + * Context: File is referenced by caller.  Mutexes may be held by caller=
.
> + * May sleep, but will not reenter filesystem to reclaim memory.

Yup, looks much better.

Cheers,

Dave.
--=20
Dave Chinner
david@fromorbit.com


