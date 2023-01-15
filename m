Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E409266B334
	for <lists+cluster-devel@lfdr.de>; Sun, 15 Jan 2023 18:30:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673803819;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7rAiVf8sbrrkQhZRDuAoNSI1z94pPtFP72LXcUBIK7I=;
	b=C3d/1hhSpChgq813WzpiSgFa/WtnE1TKxd9881vPhiriIzaaAdioCy+ibI5qpKWW+ruJHj
	4NfwoJL5Sfkr3v3r5i4H/zQxrirY30TxKAIgIACGJdUCZ9oxF0A8rzX7xrAqdwxdLfWdVt
	+yrwMykJgF3uZdXdidY3i531cd5wIEo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-3i4YgCmEPZSEJpWW6Fn6nQ-1; Sun, 15 Jan 2023 12:30:14 -0500
X-MC-Unique: 3i4YgCmEPZSEJpWW6Fn6nQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29C8180234E;
	Sun, 15 Jan 2023 17:30:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CAC6851E5;
	Sun, 15 Jan 2023 17:30:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9A1211946A6C;
	Sun, 15 Jan 2023 17:30:12 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1CD171946586 for <cluster-devel@listman.corp.redhat.com>;
 Sun, 15 Jan 2023 17:30:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CA19EC15BAD; Sun, 15 Jan 2023 17:30:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C2CABC15BA0
 for <cluster-devel@redhat.com>; Sun, 15 Jan 2023 17:30:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A340F101A52E
 for <cluster-devel@redhat.com>; Sun, 15 Jan 2023 17:30:11 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-108-pizc7g94Md2SckrPB89n-g-1; Sun, 15 Jan 2023 12:30:00 -0500
X-MC-Unique: pizc7g94Md2SckrPB89n-g-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2E3EE60DB6;
 Sun, 15 Jan 2023 17:29:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8661BC433EF;
 Sun, 15 Jan 2023 17:29:58 +0000 (UTC)
Date: Sun, 15 Jan 2023 09:29:58 -0800
From: "Darrick J. Wong" <djwong@kernel.org>
To: Andreas =?iso-8859-1?Q?Gr=FCnbacher?= <andreas.gruenbacher@gmail.com>
Message-ID: <Y8Q4FmhYehpQPZ3Z@magnolia>
References: <20230108194034.1444764-1-agruenba@redhat.com>
 <20230108194034.1444764-9-agruenba@redhat.com>
 <20230108215911.GP1971568@dread.disaster.area>
 <CAHc6FU4z1nC8zdM8NvUyMqU29_J7_oNu1pvBHuOvR+M6gq7F0Q@mail.gmail.com>
 <20230109225453.GQ1971568@dread.disaster.area>
 <CAHpGcM+urV5LYpTZQWTRoK6VWaLx0sxk3mDe_kd3VznMY9woVw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHpGcM+urV5LYpTZQWTRoK6VWaLx0sxk3mDe_kd3VznMY9woVw@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [RFC v6 08/10] iomap/xfs: Eliminate the
 iomap_valid handler
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: linux-xfs@vger.kernel.org, cluster-devel@redhat.com,
 Dave Chinner <david@fromorbit.com>, Matthew Wilcox <willy@infradead.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 10, 2023 at 02:09:07AM +0100, Andreas Gr=FCnbacher wrote:
> Am Mo., 9. Jan. 2023 um 23:58 Uhr schrieb Dave Chinner <david@fromorbit.c=
om>:
> > On Mon, Jan 09, 2023 at 07:45:27PM +0100, Andreas Gruenbacher wrote:
> > > On Sun, Jan 8, 2023 at 10:59 PM Dave Chinner <david@fromorbit.com> wr=
ote:
> > > > On Sun, Jan 08, 2023 at 08:40:32PM +0100, Andreas Gruenbacher wrote=
:
> > > > > Eliminate the ->iomap_valid() handler by switching to a ->get_fol=
io()
> > > > > handler and validating the mapping there.
> > > > >
> > > > > Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> > > >
> > > > I think this is wrong.
> > > >
> > > > The ->iomap_valid() function handles a fundamental architectural
> > > > issue with cached iomaps: the iomap can become stale at any time
> > > > whilst it is in use by the iomap core code.
> > > >
> > > > The current problem it solves in the iomap_write_begin() path has t=
o
> > > > do with writeback and memory reclaim races over unwritten extents,
> > > > but the general case is that we must be able to check the iomap
> > > > at any point in time to assess it's validity.
> > > >
> > > > Indeed, we also have this same "iomap valid check" functionality in=
 the
> > > > writeback code as cached iomaps can become stale due to racing
> > > > writeback, truncated, etc. But you wouldn't know it by looking at t=
he iomap
> > > > writeback code - this is currently hidden by XFS by embedding
> > > > the checks into the iomap writeback ->map_blocks function.
> > > >
> > > > That is, the first thing that xfs_map_blocks() does is check if the
> > > > cached iomap is valid, and if it is valid it returns immediately an=
d
> > > > the iomap writeback code uses it without question.
> > > >
> > > > The reason that this is embedded like this is that the iomap did no=
t
> > > > have a validity cookie field in it, and so the validity information
> > > > was wrapped around the outside of the iomap_writepage_ctx and the
> > > > filesystem has to decode it from that private wrapping structure.
> > > >
> > > > However, the validity information iin the structure wrapper is
> > > > indentical to the iomap validity cookie,
> > >
> > > Then could that part of the xfs code be converted to use
> > > iomap->validity_cookie so that struct iomap_writepage_ctx can be
> > > eliminated?
> >
> > Yes, that is the plan.
> >
> > >
> > > > and so the direction I've
> > > > been working towards is to replace this implicit, hidden cached
> > > > iomap validity check with an explicit ->iomap_valid call and then
> > > > only call ->map_blocks if the validity check fails (or is not
> > > > implemented).
> > > >
> > > > I want to use the same code for all the iomap validity checks in al=
l
> > > > the iomap core code - this is an iomap issue, the conditions where
> > > > we need to check for iomap validity are different for depending on
> > > > the iomap context being run, and the checks are not necessarily
> > > > dependent on first having locked a folio.
> > > >
> > > > Yes, the validity cookie needs to be decoded by the filesystem, but
> > > > that does not dictate where the validity checking needs to be done
> > > > by the iomap core.
> > > >
> > > > Hence I think removing ->iomap_valid is a big step backwards for th=
e
> > > > iomap core code - the iomap core needs to be able to formally verif=
y
> > > > the iomap is valid at any point in time, not just at the point in
> > > > time a folio in the page cache has been locked...
> > >
> > > We don't need to validate an iomap "at any time". It's two specific
> > > places in the code in which we need to check, and we're not going to
> > > end up with ten more such places tomorrow.
> >
> > Not immediately, but that doesn't change the fact this is not a
> > filesystem specific issue - it's an inherent characteristic of
> > cached iomaps and unsynchronised extent state changes that occur
> > outside exclusive inode->i_rwsem IO context (e.g. in writeback and
> > IO completion contexts).
> >
> > Racing mmap + buffered writes can expose these state changes as the
> > iomap bufferred write IO path is not serialised against the iomap
> > mmap IO path except via folio locks. Hence a mmap page fault can
> > invalidate a cached buffered write iomap by causing a hole ->
> > unwritten, hole -> delalloc or hole -> written conversion in the
> > middle of the buffered write range. The buffered write still has a
> > hole mapping cached for that entire range, and it is now incorrect.
> >
> > If the mmap write happens to change extent state at the trailing
> > edge of a partial buffered write, data corruption will occur if we
> > race just right with writeback and memory reclaim. I'm pretty sure
> > that this corruption can be reporduced on gfs2 if we try hard enough
> > - generic/346 triggers the mmap/write race condition, all that is
> > needed from that point is for writeback and reclaiming pages at
> > exactly the right time...
> >
> > > I'd prefer to keep those
> > > filesystem internals in the filesystem specific code instead of
> > > exposing them to the iomap layer. But that's just me ...
> >
> > My point is that there is nothing XFS specific about these stale
> > cached iomap race conditions, nor is it specifically related to
> > folio locking. The folio locking inversions w.r.t. iomap caching and
> > the interactions with writeback and reclaim are simply the
> > manifestation that brought the issue to our attention.
> >
> > This is why I think hiding iomap validation filesystem specific page
> > cache allocation/lookup functions is entirely the wrong layer to be
> > doing iomap validity checks. Especially as it prevents us from
> > adding more validity checks in the core infrastructure when we need
> > them in future.
> >
> > AFAIC, an iomap must carry with it a method for checking
> > that it is still valid. We need it in the write path, we need it in
> > the writeback path. If we want to relax the restrictions on clone
> > operations (e.g. shared locking on the source file), we'll need to
> > be able to detect stale cached iomaps in those paths, too. And I
> > haven't really thought through all the implications of shared
> > locking on buffered writes yet, but that may well require more
> > checks in other places as well.
> >
> > > If we ignore this particular commit for now, do you have any
> > > objections to the patches in this series? If not, it would be great i=
f
> > > we could add the other patches to iomap-for-next.
> >
> > I still don't like moving page cache operations into individual
> > filesystems, but for the moment I can live with the IOMAP_NOCREATE
> > hack to drill iomap state through the filesystem without the
> > filesystem being aware of it.
>=20
> Alright, works for me. Darrick?

Works for me too.

I've wondered if IOMAP_NOCREATE could be useful for more things (e.g.
determining if part of a file has been cached) though I've not thought
of a good usecase for that.  Maybe something along the lines of a
"userspace wants us to redirty this critical file after fsync returned
EIO" type thing?

> > > By the way, I'm still not sure if gfs2 is affected by this whole ioma=
p
> > > validation drama given that it neither implements unwritten extents
> > > nor delayed allocation. This is a mess.
> >
> > See above - I'm pretty sure it will be, but it may be very difficult
> > to expose. After all, it's taken several years before anyone noticed
> > this issue with XFS, even though we were aware of the issue of stale
> > cached iomaps causing data corruption in the writeback path....
>=20
> Okay, that's all pretty ugly. Thanks a lot for the detailed explanation.

I don't have any objections to pulling everything except patches 8 and
10 for testing this week.  I find myself more in agreement with
Christoph and Andreas that whoever gets the folio is also responsible
for knowing if revalidating the mapping is necessary and then doing it.
However, I still have enough questions about the mapping revalidation to
make that a separate discussion.

Questions, namely:

1. Does zonefs need to revalidate mappings?  The mappings are 1:1 so I
don't think it does, but OTOH zone pointer management might complicate
that.

2. How about porting the writeback iomap validation to use this
mechanism?  (I suspect Dave might already be working on this...)

2. Do we need to revalidate mappings for directio writes?  I think the
answer is no (for xfs) because the ->iomap_begin call will allocate
whatever blocks are needed and truncate/punch/reflink block on the
iolock while the directio writes are pending, so you'll never end up
with a stale mapping.  But I don't know if that statement applies
generally...

--D

> Cheers,
> Andreas
>=20
> > Cheers,
> >
> > Dave.
> > --
> > Dave Chinner
> > david@fromorbit.com

