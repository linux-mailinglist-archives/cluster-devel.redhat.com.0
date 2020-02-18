Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 97A78162A18
	for <lists+cluster-devel@lfdr.de>; Tue, 18 Feb 2020 17:10:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582042230;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=myfgkAhknkYwTQEll5y2KbUGKtm6Pg4pmZz/Ww9j45M=;
	b=PJ3So+3zgyo96mi9mOcDlQoTomzJhQ8e1YgNN1nqJGbgdxe772pW3ELuGKcSu44Kp961Q4
	FOe3j8i9yhpBOef5vCWzZty9bgUqi9TnvTo+l3oE7amUFxUqgdcpLDZ+uIwv1z9myy7E/C
	AifMsrJ4MSXj59ms48UX+gk5UosYsEQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-zwvbxr_BMR2JeoOiDxGpew-1; Tue, 18 Feb 2020 11:10:28 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF56A1005514;
	Tue, 18 Feb 2020 16:10:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 56BC61001920;
	Tue, 18 Feb 2020 16:10:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2490D18089C8;
	Tue, 18 Feb 2020 16:10:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01IGAJXK032605 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 11:10:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1ABEE1DB2C; Tue, 18 Feb 2020 16:10:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 16E2A9D43
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 16:10:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CA3986D70C
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 16:10:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-434-RSp5Oe0GP6StAZJKSz03eg-1; Tue, 18 Feb 2020 11:10:09 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j45Rk-0001Tm-Vv; Tue, 18 Feb 2020 16:10:04 +0000
Date: Tue, 18 Feb 2020 08:10:04 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20200218161004.GR7778@bombadil.infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-14-willy@infradead.org>
	<20200218062147.GN10776@dread.disaster.area>
MIME-Version: 1.0
In-Reply-To: <20200218062147.GN10776@dread.disaster.area>
X-MC-Unique: RSp5Oe0GP6StAZJKSz03eg-1
X-MC-Unique: zwvbxr_BMR2JeoOiDxGpew-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01IGAJXK032605
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
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Feb 18, 2020 at 05:21:47PM +1100, Dave Chinner wrote:
> On Mon, Feb 17, 2020 at 10:45:54AM -0800, Matthew Wilcox wrote:
> > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> >=20
> > This replaces ->readpages with a saner interface:
> >  - Return void instead of an ignored error code.
> >  - Pages are already in the page cache when ->readahead is called.
>=20
> Might read better as:
>=20
>  - Page cache is already populates with locked pages when
>    ->readahead is called.

Will do.

> >  - Implementation looks up the pages in the page cache instead of
> >    having them passed in a linked list.
>=20
> Add:
>=20
>  - cleanup of unused readahead handled by ->readahead caller, not
>    the method implementation.

The readpages caller does that cleanup too, so it's not an advantage
to the readahead interface.

        if (mapping->a_ops->readpages) {
                ret =3D mapping->a_ops->readpages(filp, mapping, pages, nr_=
pages);
                /* Clean up the remaining pages */
                put_pages_list(pages);
                goto out;
        }

> >  ``readpages``
> >  =09called by the VM to read pages associated with the address_space
> >  =09object.  This is essentially just a vector version of readpage.
> >  =09Instead of just one page, several pages are requested.
> >  =09readpages is only used for read-ahead, so read errors are
> >  =09ignored.  If anything goes wrong, feel free to give up.
> > +=09This interface is deprecated; implement readahead instead.
>=20
> What is the removal schedule for the deprecated interface?=20

I mentioned that in the cover letter; once Dave Howells has the fscache
branch merged, I'll do the remaining filesystems.  Should be within the
next couple of merge windows.

> > +/* The byte offset into the file of this readahead block */
> > +static inline loff_t readahead_offset(struct readahead_control *rac)
> > +{
> > +=09return (loff_t)rac->_start * PAGE_SIZE;
> > +}
>=20
> Urk. Didn't an early page use "offset" for the page index? That
> was was "mm: Remove 'page_offset' from readahead loop" did, right?
>=20
> That's just going to cause confusion to have different units for
> readahead "offsets"....

We are ... not consistent anywhere in the VM/VFS with our naming.
Unfortunately.

$ grep -n offset mm/filemap.c=20
391: * @start:=09offset in bytes where the range starts
...
815:=09pgoff_t offset =3D old->index;
...
2020:=09unsigned long offset;      /* offset into pagecache page */
...
2257:=09*ppos =3D ((loff_t)index << PAGE_SHIFT) + offset;

That last one's my favourite.  Not to mention the fine distinction you
and I discussed recently between offset_in_page() and page_offset().

Best of all, even our types encode the ambiguity of an 'offset'.  We have
pgoff_t and loff_t (replacing the earlier off_t).

So, new rule.  'pos' is the number of bytes into a file.  'index' is the
number of PAGE_SIZE pages into a file.  We don't use the word 'offset'
at all.  'length' as a byte count and 'count' as a page count seem like
fine names to me.

> > -=09if (aops->readpages) {
> > +=09if (aops->readahead) {
> > +=09=09aops->readahead(rac);
> > +=09=09readahead_for_each(rac, page) {
> > +=09=09=09unlock_page(page);
> > +=09=09=09put_page(page);
> > +=09=09}
>=20
> This needs a comment to explain the unwinding that needs to be done
> here. I'm not going to remember in a year's time that this is just
> for the pages that weren't submitted by ->readahead....

ACK.


