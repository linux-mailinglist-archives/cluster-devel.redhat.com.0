Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 512B118EA60
	for <lists+cluster-devel@lfdr.de>; Sun, 22 Mar 2020 17:28:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584894528;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PbdTwRL3oURwdu8i4JE5PNw/PEHDWfLA4F/bHmXxY+c=;
	b=MDVI/BDXuGfxVVdSB6bXkMbMpqloqgndd51447ZbAQo7KcQDvVR5LrJtLinXUZtanb8qnj
	PHfKVgBC0wmNIgI2kDivR4Lds1IiGJkGpYGNtKNjOKfZ8WoKdPnTXtAsDANMWotZnKlJ4g
	gpdgj8K8UhTDjoKKVTS0QJmEFSL4G/w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-mqmn5f9zMB-0ocHUdCaypw-1; Sun, 22 Mar 2020 12:28:46 -0400
X-MC-Unique: mqmn5f9zMB-0ocHUdCaypw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AFB1100550D;
	Sun, 22 Mar 2020 16:28:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E45760BF1;
	Sun, 22 Mar 2020 16:28:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8F05718089C8;
	Sun, 22 Mar 2020 16:28:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02MGSSCQ022022 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 22 Mar 2020 12:28:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C140010EE78F; Sun, 22 Mar 2020 16:28:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD01610EE789
	for <cluster-devel@redhat.com>; Sun, 22 Mar 2020 16:28:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B1368007A4
	for <cluster-devel@redhat.com>; Sun, 22 Mar 2020 16:28:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-235-hWpVte9IMcmBGzERjfUvog-1; Sun, 22 Mar 2020 12:28:23 -0400
X-MC-Unique: hWpVte9IMcmBGzERjfUvog-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jG3SU-0000CF-PX; Sun, 22 Mar 2020 16:28:18 +0000
Date: Sun, 22 Mar 2020 09:28:18 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200322162818.GG4971@bombadil.infradead.org>
References: <20200320142231.2402-1-willy@infradead.org>
	<20200320142231.2402-13-willy@infradead.org>
	<20200320165828.GB851@sol.localdomain>
	<20200320173040.GB4971@bombadil.infradead.org>
	<20200320180017.GE851@sol.localdomain>
	<20200320181132.GD4971@bombadil.infradead.org>
	<20200320182452.GF851@sol.localdomain>
MIME-Version: 1.0
In-Reply-To: <20200320182452.GF851@sol.localdomain>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02MGSSCQ022022
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-mm@kvack.org,
	John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
	William Kucharski <william.kucharski@oracle.com>,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v9 12/25] mm: Move end_index check out
	of readahead loop
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Fri, Mar 20, 2020 at 11:24:52AM -0700, Eric Biggers wrote:
> On Fri, Mar 20, 2020 at 11:11:32AM -0700, Matthew Wilcox wrote:
> > On Fri, Mar 20, 2020 at 11:00:17AM -0700, Eric Biggers wrote:
> > > But then if someone passes index=3D0 and nr_to_read=3D0, this underfl=
ows and the
> > > entire file gets read.
> >=20
> > nr_to_read =3D=3D 0 doesn't make sense ... I thought we filtered that o=
ut
> > earlier, but I can't find anywhere that does that right now.  I'd
> > rather return early from __do_page_cache_readahead() to fix that.
> >=20
> > > The page cache isn't actually supposed to contain a page at index ULO=
NG_MAX,
> > > since MAX_LFS_FILESIZE is at most ((loff_t)ULONG_MAX << PAGE_SHIFT), =
right?  So
> > > I don't think we need to worry about reading the page with index ULON=
G_MAX.
> > > I.e. I think it's fine to limit nr_to_read to 'ULONG_MAX - index', if=
 that makes
> > > it easier to avoid an overflow or underflow in the next check.
> >=20
> > I think we can get a page at ULONG_MAX on 32-bit systems?  I mean, we c=
an buy
> > hard drives which are larger than 16TiB these days:
> > https://www.pcmag.com/news/seagate-will-ship-18tb-and-20tb-hard-drives-=
in-2020
> > (even ignoring RAID devices)
>=20
> The max file size is ((loff_t)ULONG_MAX << PAGE_SHIFT) which means the ma=
ximum
> page *index* is ULONG_MAX - 1, not ULONG_MAX.

I see where we set that for _files_ ... I can't find anywhere that we preve=
nt
i_size getting that big for block devices.  Maybe I'm missing something.

> Anyway, I think we may be making this much too complicated.  How about ju=
st:
>=20
> =09pgoff_t i_nrpages =3D DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
>=20
> =09if (index >=3D i_nrpages)
> =09=09return;
> =09/* Don't read past the end of the file */
> =09nr_to_read =3D min(nr_to_read, i_nrpages - index);
>=20
> That's 2 branches instead of 4.  (Note that assigning to i_nrpages can't
> overflow, since the max number of pages is ULONG_MAX not ULONG_MAX + 1.)

I like where you're going with this.  Just to be on the safe side, I'd
prefer to do this:

@@ -266,11 +266,8 @@ void __do_page_cache_readahead(struct address_space *m=
apping,
        end_index =3D (isize - 1) >> PAGE_SHIFT;
        if (index > end_index)
                return;
-       /* Avoid wrapping to the beginning of the file */
-       if (index + nr_to_read < index)
-               nr_to_read =3D ULONG_MAX - index + 1;
        /* Don't read past the page containing the last byte of the file */
-       if (index + nr_to_read >=3D end_index)
+       if (nr_to_read > end_index - index)
                nr_to_read =3D end_index - index + 1;
=20
        page_cache_readahead_unbounded(mapping, file, index, nr_to_read,

end_index - index + 1 could only overflow if end_index is ULONG_MAX
and index is 0.  But if end_index is ULONG_MAX and index is 0, then
nr_to_read is necessarily <=3D ULONG_MAX, so the condition is false.
And if nr_to_read is 0, then the condition is also false, so it won't
increase nr_to_read from 0 to 1.  It might assign x to nr_to_read when
nr_to_read is already x, but that's harmless.

Thanks!


