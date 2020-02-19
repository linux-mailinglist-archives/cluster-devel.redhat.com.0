Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 6184C163A1B
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Feb 2020 03:25:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582079112;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kaO4RsWa7WldI8eeq7/RlWCR+VlsOQ5x8L8Pxbp21Hw=;
	b=QbSGwXyGBldxYMi+yyR9112gBvCSCFf8j5PGH/LUJO13zXNXYeP6orUsRs3EGNlvGDIzNz
	odT7oXoJZn/6D85JXBMLKunsqkWPZP2DfUvfcoFNCSTkgZrINWWU+nWsTy0Rvjgnc1tCYc
	kd8/bABUjh8/SeohyGQbrvv2R+M+8/M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-1kywMlNHO4Ch-BqQ9UU81Q-1; Tue, 18 Feb 2020 21:25:09 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7762D800EB2;
	Wed, 19 Feb 2020 02:25:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C20A90531;
	Wed, 19 Feb 2020 02:25:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 39DC71809567;
	Wed, 19 Feb 2020 02:25:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01J2NC2Q003295 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 21:23:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0C2F1100296E; Wed, 19 Feb 2020 02:23:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 070471000DAA
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 02:23:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 269FE101D245
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 02:23:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-305-BQ3yKTz0PiGuyeIU8-cJ8g-1; Tue, 18 Feb 2020 21:23:08 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j4F0v-0003R5-2P; Wed, 19 Feb 2020 02:23:01 +0000
Date: Tue, 18 Feb 2020 18:23:00 -0800
From: Matthew Wilcox <willy@infradead.org>
To: John Hubbard <jhubbard@nvidia.com>
Message-ID: <20200219022300.GJ24185@bombadil.infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-16-willy@infradead.org>
	<1263603d-f446-c447-2eac-697d105fa76c@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <1263603d-f446-c447-2eac-697d105fa76c@nvidia.com>
X-MC-Unique: BQ3yKTz0PiGuyeIU8-cJ8g-1
X-MC-Unique: 1kywMlNHO4Ch-BqQ9UU81Q-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01J2NC2Q003295
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Feb 18, 2020 at 05:32:31PM -0800, John Hubbard wrote:
> > +=09=09=09page_cache_readahead_limit(inode->i_mapping, NULL,
> > +=09=09=09=09=09index, LONG_MAX, num_ra_pages, 0);
>=20
>=20
> LONG_MAX seems bold at first, but then again I can't think of anything sm=
aller=20
> that makes any sense, and the previous code didn't have a limit either...=
OK.

Probably worth looking at Dave's review of this and what we've just
negotiated on the other subthread ... LONG_MAX is gone.

> I also wondered about the NULL file parameter, and wonder if we're stripp=
ing out
> information that is needed for authentication, given that that's what the=
 newly
> written kerneldoc says the "file" arg is for. But it seems that if we're =
this=20
> deep in the fs code's read routines, file system authentication has long =
since=20
> been addressed.

The authentication is for network filesystems.  Local filesystems
generally don't use the 'file' parameter, and since we're going to be
calling back into the filesystem's own readahead routine, we know it's
not needed.

> Any actually I don't yet (still working through the patches) see any auth=
entication,
> so maybe that parameter will turn out to be unnecessary.
>=20
> Anyway, It's nice to see this factored out into a single routine.

I'm kind of thinking about pushing the rac in the other direction too,
so page_cache_readahead_unlimited(rac, nr_to_read, lookahead_size).

> > +/**
> > + * page_cache_readahead_limit - Start readahead beyond a file's i_size=
.
>=20
>=20
> Maybe:=20
>=20
>     "Start readahead to a caller-specified end point" ?
>=20
> (It's only *potentially* beyond files's i_size.)

My current tree has:
 * page_cache_readahead_exceed - Start unchecked readahead.


> > + * @mapping: File address space.
> > + * @file: This instance of the open file; used for authentication.
> > + * @offset: First page index to read.
> > + * @end_index: The maximum page index to read.
> > + * @nr_to_read: The number of pages to read.
>=20
>=20
> How about:
>=20
>     "The number of pages to read, as long as end_index is not exceeded."

API change makes this irrelevant ;-)

> > + * @lookahead_size: Where to start the next readahead.
>=20
> Pre-existing, but...it's hard to understand how a size is "where to start=
".
> Should we rename this arg?

It should probably be lookahead_count.

> > + *
> > + * This function is for filesystems to call when they want to start
> > + * readahead potentially beyond a file's stated i_size.  If you want
> > + * to start readahead on a normal file, you probably want to call
> > + * page_cache_async_readahead() or page_cache_sync_readahead() instead=
.
> > + *
> > + * Context: File is referenced by caller.  Mutexes may be held by call=
er.
> > + * May sleep, but will not reenter filesystem to reclaim memory.
>=20
> In fact, can we say "must not reenter filesystem"?=20

I think it depends which side of the API you're looking at which wording
you prefer ;-)


