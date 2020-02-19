Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id EEB4A1638F6
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Feb 2020 02:04:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582074288;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FqP7m5LziY5w6mlr3qXlKsoW+2/5SlIhOQHkqMIBMW8=;
	b=bFdaM/qZ72GSbmf3DWAK7depMYxaJ7/K9WgPzuAh4Mjp20HFzbp72ngyB9w9++bCK6yqvp
	Z+4dtLiXlxxUjS47jO6UY/k/7JGr2U/7TTWWS2QgAZ2xqsLz5wKz1RatE0yOay4+0jGGIr
	QTAd7jbbdrJl/TK2deVM4vVg9VQ38iU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-unMhBKzoN5iSpvNP3HcdEg-1; Tue, 18 Feb 2020 20:04:47 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 993B7800D50;
	Wed, 19 Feb 2020 01:04:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A0A4100194E;
	Wed, 19 Feb 2020 01:04:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F33571809567;
	Wed, 19 Feb 2020 01:04:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01J14fmA031874 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 20:04:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 028922026D69; Wed, 19 Feb 2020 01:04:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F14392026D67
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 01:04:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FD4F80288D
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 01:04:38 +0000 (UTC)
Received: from mail105.syd.optusnet.com.au (mail105.syd.optusnet.com.au
	[211.29.132.249]) by relay.mimecast.com with ESMTP id
	us-mta-238-TEaQ7jO4NwOqG29FU75QCg-1; Tue, 18 Feb 2020 20:04:36 -0500
Received: from dread.disaster.area (pa49-179-138-28.pa.nsw.optusnet.com.au
	[49.179.138.28])
	by mail105.syd.optusnet.com.au (Postfix) with ESMTPS id 832B83A331C;
	Wed, 19 Feb 2020 12:04:32 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1j4Dmx-0004dF-Ul; Wed, 19 Feb 2020 12:04:31 +1100
Date: Wed, 19 Feb 2020 12:04:31 +1100
From: Dave Chinner <david@fromorbit.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200219010431.GW10776@dread.disaster.area>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-14-willy@infradead.org>
	<20200218062147.GN10776@dread.disaster.area>
	<20200218161004.GR7778@bombadil.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200218161004.GR7778@bombadil.infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=W5xGqiek c=1 sm=1 tr=0
	a=zAxSp4fFY/GQY8/esVNjqw==:117 a=zAxSp4fFY/GQY8/esVNjqw==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=l697ptgUJYAA:10
	a=JfrnYn6hAAAA:8 a=7-415B0cAAAA:8 a=J8tHrh_ofsGOLyDWh6kA:9
	a=ffwTswad_GV-5CZc:21 a=o0rOaByW-dbbsVyy:21 a=CjuIK1q_8ugA:10
	a=1CNFftbPRP8L7MoqJWF3:22 a=biEYGPWJfzWAr4FL6Ov7:22
X-MC-Unique: TEaQ7jO4NwOqG29FU75QCg-1
X-MC-Unique: unMhBKzoN5iSpvNP3HcdEg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01J14fmA031874
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v6 08/19] mm: Add readahead address
	space operation
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Feb 18, 2020 at 08:10:04AM -0800, Matthew Wilcox wrote:
> On Tue, Feb 18, 2020 at 05:21:47PM +1100, Dave Chinner wrote:
> > On Mon, Feb 17, 2020 at 10:45:54AM -0800, Matthew Wilcox wrote:
> > > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> > >=20
> > > This replaces ->readpages with a saner interface:
> > >  - Return void instead of an ignored error code.
> > >  - Pages are already in the page cache when ->readahead is called.
> >=20
> > Might read better as:
> >=20
> >  - Page cache is already populates with locked pages when
> >    ->readahead is called.
>=20
> Will do.
>=20
> > >  - Implementation looks up the pages in the page cache instead of
> > >    having them passed in a linked list.
> >=20
> > Add:
> >=20
> >  - cleanup of unused readahead handled by ->readahead caller, not
> >    the method implementation.
>=20
> The readpages caller does that cleanup too, so it's not an advantage
> to the readahead interface.

Right. I kinda of read the list as "the reasons the new API is sane"
not as "how readahead is different to readpages"....

> > >  ``readpages``
> > >  =09called by the VM to read pages associated with the address_space
> > >  =09object.  This is essentially just a vector version of readpage.
> > >  =09Instead of just one page, several pages are requested.
> > >  =09readpages is only used for read-ahead, so read errors are
> > >  =09ignored.  If anything goes wrong, feel free to give up.
> > > +=09This interface is deprecated; implement readahead instead.
> >=20
> > What is the removal schedule for the deprecated interface?=20
>=20
> I mentioned that in the cover letter; once Dave Howells has the fscache
> branch merged, I'll do the remaining filesystems.  Should be within the
> next couple of merge windows.

Sure, but I like to see actual release tags with the deprecation
notice so that it's obvious to the reader as to whether this is
something new and/or when they can expect it to go away.

> > > +/* The byte offset into the file of this readahead block */
> > > +static inline loff_t readahead_offset(struct readahead_control *rac)
> > > +{
> > > +=09return (loff_t)rac->_start * PAGE_SIZE;
> > > +}
> >=20
> > Urk. Didn't an early page use "offset" for the page index? That
> > was was "mm: Remove 'page_offset' from readahead loop" did, right?
> >=20
> > That's just going to cause confusion to have different units for
> > readahead "offsets"....
>=20
> We are ... not consistent anywhere in the VM/VFS with our naming.
> Unfortunately.
>=20
> $ grep -n offset mm/filemap.c=20
> 391: * @start:=09offset in bytes where the range starts
> ...
> 815:=09pgoff_t offset =3D old->index;
> ...
> 2020:=09unsigned long offset;      /* offset into pagecache page */
> ...
> 2257:=09*ppos =3D ((loff_t)index << PAGE_SHIFT) + offset;
>=20
> That last one's my favourite.  Not to mention the fine distinction you
> and I discussed recently between offset_in_page() and page_offset().
>=20
> Best of all, even our types encode the ambiguity of an 'offset'.  We have
> pgoff_t and loff_t (replacing the earlier off_t).
>=20
> So, new rule.  'pos' is the number of bytes into a file.  'index' is the
> number of PAGE_SIZE pages into a file.  We don't use the word 'offset'
> at all.  'length' as a byte count and 'count' as a page count seem like
> fine names to me.

That sounds very reasonable to me. Another patchset in the making? :)

Cheers,

Dave.
--=20
Dave Chinner
david@fromorbit.com


