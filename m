Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id CDCAD1B07D9
	for <lists+cluster-devel@lfdr.de>; Mon, 20 Apr 2020 13:43:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587383005;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4VHDupDcpQyR/EslVGXdX1JWB1GEHg/8T1ITaNRNa5w=;
	b=dCoYbbUnN950hUTyKQ3A+7j0+yamOnNSqGoBo8RHGiWL5rjG9DloCbGW1/e8xtSsMBiF7M
	hXA4jvW69KsBhXOLnxQ2C9GasoVdDZRqBXekri5Z4xd4GSb018vz7pRYscks3o2EISJc++
	ruNQsZe0e1wE2Kp4bXU6/6yRHrkLxMQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-QJJde2kxN8mq5NJ1eBr8KQ-1; Mon, 20 Apr 2020 07:43:23 -0400
X-MC-Unique: QJJde2kxN8mq5NJ1eBr8KQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AE9D801A04;
	Mon, 20 Apr 2020 11:43:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 96D9060C63;
	Mon, 20 Apr 2020 11:43:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2CE2C18089C8;
	Mon, 20 Apr 2020 11:43:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03KBhDwn014783 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 20 Apr 2020 07:43:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 008699D5D; Mon, 20 Apr 2020 11:43:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F12486DCC1
	for <cluster-devel@redhat.com>; Mon, 20 Apr 2020 11:43:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B642E185A794
	for <cluster-devel@redhat.com>; Mon, 20 Apr 2020 11:43:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-30-Zzo1f0tcOluU80curfjtKg-1; Mon, 20 Apr 2020 07:43:08 -0400
X-MC-Unique: Zzo1f0tcOluU80curfjtKg-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jQUpI-0006Jo-4N; Mon, 20 Apr 2020 11:43:00 +0000
Date: Mon, 20 Apr 2020 04:43:00 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Miklos Szeredi <miklos@szeredi.hu>
Message-ID: <20200420114300.GB5820@bombadil.infradead.org>
References: <20200414150233.24495-1-willy@infradead.org>
	<20200414150233.24495-25-willy@infradead.org>
	<CAJfpegsZF=TFQ67vABkE5ghiZoTZF+=_u8tM5U_P6jZeAmv23A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJfpegsZF=TFQ67vABkE5ghiZoTZF+=_u8tM5U_P6jZeAmv23A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03KBhDwn014783
X-loop: cluster-devel@redhat.com
Cc: linux-xfs <linux-xfs@vger.kernel.org>,
	William Kucharski <william.kucharski@oracle.com>,
	linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v11 24/25] fuse: Convert from readpages
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Mon, Apr 20, 2020 at 01:14:17PM +0200, Miklos Szeredi wrote:
> > +       for (;;) {
> > +               struct fuse_io_args *ia;
> > +               struct fuse_args_pages *ap;
> > +
> > +               nr_pages =3D readahead_count(rac) - nr_pages;
>=20
> Hmm.  I see what's going on here, but it's confusing.   Why is
> __readahead_batch() decrementing the readahead count at the start,
> rather than at the end?
>=20
> At the very least it needs a comment about why nr_pages is calculated thi=
s way.

Because usually that's what we want.  See, for example, fs/mpage.c:

        while ((page =3D readahead_page(rac))) {
                prefetchw(&page->flags);
                args.page =3D page;
                args.nr_pages =3D readahead_count(rac);
                args.bio =3D do_mpage_readpage(&args);
                put_page(page);
        }

fuse is different because it's trying to allocate for the next batch,
not for the batch we're currently on.

I'm a little annoyed because I posted almost this exact loop here:

https://lore.kernel.org/linux-fsdevel/CAJfpegtrhGamoSqD-3Svfj3-iTdAbfD8TP44=
H_o+HE+g+CAnCA@mail.gmail.com/

and you said "I think that's fine", modified only by your concern
for it not being obvious that nr_pages couldn't be decremented by
__readahead_batch(), so I modified the loop slightly to assign to
nr_pages.  The part you're now complaining about is unchanged.

> > +               if (nr_pages > max_pages)
> > +                       nr_pages =3D max_pages;
> > +               if (nr_pages =3D=3D 0)
> > +                       break;
> > +               ia =3D fuse_io_alloc(NULL, nr_pages);
> > +               if (!ia)
> > +                       return;
> > +               ap =3D &ia->ap;
> > +               nr_pages =3D __readahead_batch(rac, ap->pages, nr_pages=
);
> > +               for (i =3D 0; i < nr_pages; i++) {
> > +                       fuse_wait_on_page_writeback(inode,
> > +                                                   readahead_index(rac=
) + i);
>=20
> What's wrong with ap->pages[i]->index?  Are we trying to wean off using -=
>index?

It saves reading from a cacheline?  I wouldn't be surprised if the
compiler hoisted the read from rac->_index to outside the loop and just
iterated from rac->_index to rac->_index + nr_pages.


