Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 796FB18D672
	for <lists+cluster-devel@lfdr.de>; Fri, 20 Mar 2020 19:01:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584727273;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=z/OzBBFl/tFHFvSMeeKPtVMgZtxjL1MJM+xjisUQIy4=;
	b=NPmXQ6NQwM7eUj7OuM7R5Tt1+jv5dqpRGGdPr8k4il1w21UyRpqsoNAi0UmAsWIk9L+0n9
	CW1n7LDSRaAOyQr32yxVaY/AeMjl4IFzWm+UayTBJbR1YLwkm9yNsKT03nOFKN6gi6LgEG
	6yryzM+srFCt86trF9w/CKGsBD284Hk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-UUkRLDENO8mW7xISG3nN2w-1; Fri, 20 Mar 2020 14:01:10 -0400
X-MC-Unique: UUkRLDENO8mW7xISG3nN2w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14FAE107B7D5;
	Fri, 20 Mar 2020 18:01:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8062C8AC30;
	Fri, 20 Mar 2020 18:01:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 24D8118089CE;
	Fri, 20 Mar 2020 18:01:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02KI0Qej030363 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 20 Mar 2020 14:00:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 71585202A940; Fri, 20 Mar 2020 18:00:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D8742028DCC
	for <cluster-devel@redhat.com>; Fri, 20 Mar 2020 18:00:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 038A7185A793
	for <cluster-devel@redhat.com>; Fri, 20 Mar 2020 18:00:24 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-142-mOUrvbX6N8mW4wYQVJUA6w-1;
	Fri, 20 Mar 2020 14:00:21 -0400
X-MC-Unique: mOUrvbX6N8mW4wYQVJUA6w-1
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
	[107.3.166.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 678A120739;
	Fri, 20 Mar 2020 18:00:19 +0000 (UTC)
Date: Fri, 20 Mar 2020 11:00:17 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200320180017.GE851@sol.localdomain>
References: <20200320142231.2402-1-willy@infradead.org>
	<20200320142231.2402-13-willy@infradead.org>
	<20200320165828.GB851@sol.localdomain>
	<20200320173040.GB4971@bombadil.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200320173040.GB4971@bombadil.infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02KI0Qej030363
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Fri, Mar 20, 2020 at 10:30:40AM -0700, Matthew Wilcox wrote:
> On Fri, Mar 20, 2020 at 09:58:28AM -0700, Eric Biggers wrote:
> > On Fri, Mar 20, 2020 at 07:22:18AM -0700, Matthew Wilcox wrote:
> > > +=09/* Avoid wrapping to the beginning of the file */
> > > +=09if (index + nr_to_read < index)
> > > +=09=09nr_to_read =3D ULONG_MAX - index + 1;
> > > +=09/* Don't read past the page containing the last byte of the file =
*/
> > > +=09if (index + nr_to_read >=3D end_index)
> > > +=09=09nr_to_read =3D end_index - index + 1;
> >=20
> > There seem to be a couple off-by-one errors here.  Shouldn't it be:
> >=20
> > =09/* Avoid wrapping to the beginning of the file */
> > =09if (index + nr_to_read < index)
> > =09=09nr_to_read =3D ULONG_MAX - index;
>=20
> I think it's right.  Imagine that index is ULONG_MAX.  We should read one
> page (the one at ULONG_MAX).  That would be ULONG_MAX - ULONG_MAX + 1.
>=20
> > =09/* Don't read past the page containing the last byte of the file */
> > =09if (index + nr_to_read > end_index)
> > =09=09nr_to_read =3D end_index - index + 1;
> >=20
> > I.e., 'ULONG_MAX - index' rather than 'ULONG_MAX - index + 1', so that
> > 'index + nr_to_read' is then ULONG_MAX rather than overflowed to 0.
> >=20
> > Then 'index + nr_to_read > end_index' rather 'index + nr_to_read >=3D e=
nd_index',
> > since otherwise nr_to_read can be increased by 1 rather than decreased =
or stay
> > the same as expected.
>=20
> Ooh, I missed the overflow case here.  It should be:
>=20
> +=09if (index + nr_to_read - 1 > end_index)
> +=09=09nr_to_read =3D end_index - index + 1;
>=20

But then if someone passes index=3D0 and nr_to_read=3D0, this underflows an=
d the
entire file gets read.

The page cache isn't actually supposed to contain a page at index ULONG_MAX=
,
since MAX_LFS_FILESIZE is at most ((loff_t)ULONG_MAX << PAGE_SHIFT), right?=
  So
I don't think we need to worry about reading the page with index ULONG_MAX.
I.e. I think it's fine to limit nr_to_read to 'ULONG_MAX - index', if that =
makes
it easier to avoid an overflow or underflow in the next check.

- Eric


