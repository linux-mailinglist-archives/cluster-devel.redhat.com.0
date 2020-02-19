Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 204B0163D1E
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Feb 2020 07:40:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582094429;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XgROWwTlgMLjwVIC0xrtZW2F25kz4Cwgj2QwocTcg14=;
	b=RMQ88gls3Kpt9fa2nIENbxDKt0JaAeMnl0YO1V7j9K3da3pYH3DvdVV4/GQL9HqL/fR24L
	6g60rsBP8zGLU96xxpvY3cqLIFbGBMhJPesSPdPv+nJXxfLfu7rsJdfpokfSXE9HTSnTrG
	eTp+ShUJ+rqVFxxw8rB9VZwdRN0AWKs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-VT6ov3ZxO-6uP2ESkwUXIQ-1; Wed, 19 Feb 2020 01:40:27 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15367800D55;
	Wed, 19 Feb 2020 06:40:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AEDAB90F65;
	Wed, 19 Feb 2020 06:40:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D7E8235AF3;
	Wed, 19 Feb 2020 06:40:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01J6eFFw015174 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 01:40:15 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5A53A2166B27; Wed, 19 Feb 2020 06:40:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 562432166B29
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 06:40:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D3EF867B13
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 06:40:12 +0000 (UTC)
Received: from mail105.syd.optusnet.com.au (mail105.syd.optusnet.com.au
	[211.29.132.249]) by relay.mimecast.com with ESMTP id
	us-mta-48-bKYb5wvGMHqM5fblO6I4SA-1; Wed, 19 Feb 2020 01:40:09 -0500
Received: from dread.disaster.area (pa49-179-138-28.pa.nsw.optusnet.com.au
	[49.179.138.28])
	by mail105.syd.optusnet.com.au (Postfix) with ESMTPS id 93B223A38C1;
	Wed, 19 Feb 2020 17:40:06 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1j4J1h-0006cP-MZ; Wed, 19 Feb 2020 17:40:05 +1100
Date: Wed, 19 Feb 2020 17:40:05 +1100
From: Dave Chinner <david@fromorbit.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200219064005.GL10776@dread.disaster.area>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-31-willy@infradead.org>
	<20200219032900.GE10776@dread.disaster.area>
	<20200219060415.GO24185@bombadil.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200219060415.GO24185@bombadil.infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=W5xGqiek c=1 sm=1 tr=0
	a=zAxSp4fFY/GQY8/esVNjqw==:117 a=zAxSp4fFY/GQY8/esVNjqw==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=l697ptgUJYAA:10
	a=7-415B0cAAAA:8 a=r7nCFNou5KQKI5VhP1MA:9 a=-52OSV3k6aGjHW0a:21
	a=qFaRso0K34Rwt0Du:21 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
X-MC-Unique: bKYb5wvGMHqM5fblO6I4SA-1
X-MC-Unique: VT6ov3ZxO-6uP2ESkwUXIQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01J6eFFw015174
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v6 17/19] iomap: Restructure
	iomap_readpages_actor
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

On Tue, Feb 18, 2020 at 10:04:15PM -0800, Matthew Wilcox wrote:
> On Wed, Feb 19, 2020 at 02:29:00PM +1100, Dave Chinner wrote:
> > On Mon, Feb 17, 2020 at 10:46:11AM -0800, Matthew Wilcox wrote:
> > > @@ -418,6 +412,15 @@ iomap_readpages_actor(struct inode *inode, loff_=
t pos, loff_t length,
> > >  =09=09}
> > >  =09=09ret =3D iomap_readpage_actor(inode, pos + done, length - done,
> > >  =09=09=09=09ctx, iomap, srcmap);
> > > +=09=09if (WARN_ON(ret =3D=3D 0))
> > > +=09=09=09break;
> >=20
> > This error case now leaks ctx->cur_page....
>=20
> Yes ... and I see the consequence.  I mean, this is a "shouldn't happen",
> so do we want to put effort into cleanup here ...

Well, the normal thing for XFS is that a production kernel cleans up
and handles the error gracefully with a WARN_ON_ONCE, while a debug
kernel build will chuck a tanty and burn the house down so to make
the developers aware that there is a "should not happen" situation
occurring....

> > > @@ -451,11 +454,7 @@ iomap_readpages(struct address_space *mapping, s=
truct list_head *pages,
> > >  done:
> > >  =09if (ctx.bio)
> > >  =09=09submit_bio(ctx.bio);
> > > -=09if (ctx.cur_page) {
> > > -=09=09if (!ctx.cur_page_in_bio)
> > > -=09=09=09unlock_page(ctx.cur_page);
> > > -=09=09put_page(ctx.cur_page);
> > > -=09}
> > > +=09BUG_ON(ctx.cur_page);
> >=20
> > And so will now trigger both a warn and a bug....
>=20
> ... or do we just want to run slap bang into this bug?
>=20
> Option 1: Remove the check for 'ret =3D=3D 0' altogether, as we had it be=
fore.
> That puts us into endless loop territory for a failure mode, and it's not
> parallel with iomap_readpage().
>=20
> Option 2: Remove the WARN_ON from the check.  Then we just hit the BUG_ON=
,
> but we don't know why we did it.
>=20
> Option 3: Set cur_page to NULL.  We'll hit the WARN_ON, avoid the BUG_ON,
> might end up with a page in the page cache which is never unlocked.

None of these are appealing.

> Option 4: Do the unlock/put page dance before setting the cur_page to NUL=
L.
> We might double-unlock the page.

why would we double unlock the page?

Oh, the readahead cursor doesn't handle the case of partial page
submission, which would result in IO completion unlocking the page.

Ok, that's what the ctx.cur_page_in_bio check is used to detect i.e.
if we've got a page that the readahead cursor points at, and we
haven't actually added it to a bio, then we can leave it to the
read_pages() to unlock and clean up. If it's in a bio, then IO
completion will unlock it and so we only have to drop the submission
reference and move the readahead cursor forwards so read_pages()
doesn't try to unlock this page. i.e:

=09/* clean up partial page submission failures */
=09if (ctx.cur_page && ctx.cur_page_in_bio) {
=09=09put_page(ctx.cur_page);
=09=09readahead_next(rac);
=09}

looks to me like it will handle the case of "ret =3D=3D 0" in the actor
function just fine.

Cheers,

Dave.

--=20
Dave Chinner
david@fromorbit.com


