Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 0699A18D69D
	for <lists+cluster-devel@lfdr.de>; Fri, 20 Mar 2020 19:12:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584727940;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hyRiFs/644B6Vp0kkpOzwTbL0pqTs5If28A5lIpiefA=;
	b=Zxux3TTaQ3ipk+DjCW0Px9UKZjgTJm9gkPETTh2RZughUqA+wDlmBeqsLTxAZBe4RSVvgs
	n/PgkOy9QUcLjIAWDjpg7x9rgLPSQGzZpmnqzj72T5RuQLvKBTmdk70ViqLjnKRcZwzThn
	jei6ED5n5R61dsNinmyCoOczlhD/4Nw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-uiKYbASUO--fLHlLbDyO_g-1; Fri, 20 Mar 2020 14:12:15 -0400
X-MC-Unique: uiKYbASUO--fLHlLbDyO_g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F7A5101FC88;
	Fri, 20 Mar 2020 18:12:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AB0F65E80;
	Fri, 20 Mar 2020 18:12:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A0840942A2;
	Fri, 20 Mar 2020 18:12:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02KIBfbq030709 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 20 Mar 2020 14:11:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CC13113D6F1; Fri, 20 Mar 2020 18:11:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C84A413D6EA
	for <cluster-devel@redhat.com>; Fri, 20 Mar 2020 18:11:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 560D88F68EF
	for <cluster-devel@redhat.com>; Fri, 20 Mar 2020 18:11:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-111-TRqHx0NxMvKw9zyqmi5Gmw-1; Fri, 20 Mar 2020 14:11:36 -0400
X-MC-Unique: TRqHx0NxMvKw9zyqmi5Gmw-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jFM7I-0001VF-Jx; Fri, 20 Mar 2020 18:11:32 +0000
Date: Fri, 20 Mar 2020 11:11:32 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200320181132.GD4971@bombadil.infradead.org>
References: <20200320142231.2402-1-willy@infradead.org>
	<20200320142231.2402-13-willy@infradead.org>
	<20200320165828.GB851@sol.localdomain>
	<20200320173040.GB4971@bombadil.infradead.org>
	<20200320180017.GE851@sol.localdomain>
MIME-Version: 1.0
In-Reply-To: <20200320180017.GE851@sol.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02KIBfbq030709
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Fri, Mar 20, 2020 at 11:00:17AM -0700, Eric Biggers wrote:
> On Fri, Mar 20, 2020 at 10:30:40AM -0700, Matthew Wilcox wrote:
> > On Fri, Mar 20, 2020 at 09:58:28AM -0700, Eric Biggers wrote:
> > > On Fri, Mar 20, 2020 at 07:22:18AM -0700, Matthew Wilcox wrote:
> > > > +=09/* Avoid wrapping to the beginning of the file */
> > > > +=09if (index + nr_to_read < index)
> > > > +=09=09nr_to_read =3D ULONG_MAX - index + 1;
> > > > +=09/* Don't read past the page containing the last byte of the fil=
e */
> > > > +=09if (index + nr_to_read >=3D end_index)
> > > > +=09=09nr_to_read =3D end_index - index + 1;
> > >=20
> > > There seem to be a couple off-by-one errors here.  Shouldn't it be:
> > >=20
> > > =09/* Avoid wrapping to the beginning of the file */
> > > =09if (index + nr_to_read < index)
> > > =09=09nr_to_read =3D ULONG_MAX - index;
> >=20
> > I think it's right.  Imagine that index is ULONG_MAX.  We should read o=
ne
> > page (the one at ULONG_MAX).  That would be ULONG_MAX - ULONG_MAX + 1.
> >=20
> > > =09/* Don't read past the page containing the last byte of the file *=
/
> > > =09if (index + nr_to_read > end_index)
> > > =09=09nr_to_read =3D end_index - index + 1;
> > >=20
> > > I.e., 'ULONG_MAX - index' rather than 'ULONG_MAX - index + 1', so tha=
t
> > > 'index + nr_to_read' is then ULONG_MAX rather than overflowed to 0.
> > >=20
> > > Then 'index + nr_to_read > end_index' rather 'index + nr_to_read >=3D=
 end_index',
> > > since otherwise nr_to_read can be increased by 1 rather than decrease=
d or stay
> > > the same as expected.
> >=20
> > Ooh, I missed the overflow case here.  It should be:
> >=20
> > +=09if (index + nr_to_read - 1 > end_index)
> > +=09=09nr_to_read =3D end_index - index + 1;
> >=20
>=20
> But then if someone passes index=3D0 and nr_to_read=3D0, this underflows =
and the
> entire file gets read.

nr_to_read =3D=3D 0 doesn't make sense ... I thought we filtered that out
earlier, but I can't find anywhere that does that right now.  I'd
rather return early from __do_page_cache_readahead() to fix that.

> The page cache isn't actually supposed to contain a page at index ULONG_M=
AX,
> since MAX_LFS_FILESIZE is at most ((loff_t)ULONG_MAX << PAGE_SHIFT), righ=
t?  So
> I don't think we need to worry about reading the page with index ULONG_MA=
X.
> I.e. I think it's fine to limit nr_to_read to 'ULONG_MAX - index', if tha=
t makes
> it easier to avoid an overflow or underflow in the next check.

I think we can get a page at ULONG_MAX on 32-bit systems?  I mean, we can b=
uy
hard drives which are larger than 16TiB these days:
https://www.pcmag.com/news/seagate-will-ship-18tb-and-20tb-hard-drives-in-2=
020
(even ignoring RAID devices)


