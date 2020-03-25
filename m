Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 34166192C9B
	for <lists+cluster-devel@lfdr.de>; Wed, 25 Mar 2020 16:33:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585150380;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eBo8LgHFVKILP3oqmNNgX2vaLLi0TsLFS3OTzEgtSfQ=;
	b=CF98yx6TTJkkHPqUyfB1ZIXIDm2IPfCDJwgLQUXWIg7MZF1HycBqGDWPnJYZXgq7Xc+49f
	ESWy8p/70hi4UMIb+/oP8QdMRUPwi2ScNt4HeuuZ2LqimjQ8VmdKZ8EDIcBShYi6xvD4ER
	JgKE5Y5FI9aql4zW4HpyJwkNaQDIk4A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-5ZXKxjgPP4mU2YDD9QSLRA-1; Wed, 25 Mar 2020 11:32:52 -0400
X-MC-Unique: 5ZXKxjgPP4mU2YDD9QSLRA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0FF38064D1;
	Wed, 25 Mar 2020 15:32:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37A425C578;
	Wed, 25 Mar 2020 15:32:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7023186380;
	Wed, 25 Mar 2020 15:32:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02PFWe6a012438 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 25 Mar 2020 11:32:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D57252166B32; Wed, 25 Mar 2020 15:32:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D19272166B2C
	for <cluster-devel@redhat.com>; Wed, 25 Mar 2020 15:32:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99938101A55E
	for <cluster-devel@redhat.com>; Wed, 25 Mar 2020 15:32:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-482-ov-dSrApPb27kYA1nK8jCA-1; Wed, 25 Mar 2020 11:32:36 -0400
X-MC-Unique: ov-dSrApPb27kYA1nK8jCA-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jH816-0004oZ-U3; Wed, 25 Mar 2020 15:32:28 +0000
Date: Wed, 25 Mar 2020 08:32:28 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Miklos Szeredi <miklos@szeredi.hu>
Message-ID: <20200325153228.GB22483@bombadil.infradead.org>
References: <20200323202259.13363-1-willy@infradead.org>
	<20200323202259.13363-25-willy@infradead.org>
	<CAJfpegu7EFcWrg3bP+-2BX_kb52RrzBCo_U3QKYzUkZfe4EjDA@mail.gmail.com>
	<20200325120254.GA22483@bombadil.infradead.org>
	<CAJfpegshssCJiA8PBcq2XvBj3mR8dufHb0zWRFvvKKv82VQYsw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJfpegshssCJiA8PBcq2XvBj3mR8dufHb0zWRFvvKKv82VQYsw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02PFWe6a012438
X-loop: cluster-devel@redhat.com
Cc: linux-xfs <linux-xfs@vger.kernel.org>,
	William Kucharski <william.kucharski@oracle.com>,
	linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v10 24/25] fuse: Convert from readpages
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wed, Mar 25, 2020 at 03:43:02PM +0100, Miklos Szeredi wrote:
> >
> > -       while ((page =3D readahead_page(rac))) {
> > -               if (fuse_readpages_fill(&data, page) !=3D 0)
> > +               nr_pages =3D min(readahead_count(rac), fc->max_pages);
>=20
> Missing fc->max_read clamp.

Yeah, I realised that.  I ended up doing ...

+       unsigned int i, max_pages, nr_pages =3D 0;
...
+       max_pages =3D min(fc->max_pages, fc->max_read / PAGE_SIZE);

> > +               ia =3D fuse_io_alloc(NULL, nr_pages);
> > +               if (!ia)
> >                         return;
> > +               ap =3D &ia->ap;
> > +               __readahead_batch(rac, ap->pages, nr_pages);
>=20
> nr_pages =3D __readahead_batch(...)?

That's the other bug ... this was designed for btrfs which has a fixed-size
buffer.  But you want to dynamically allocate fuse_io_args(), so we need to
figure out the number of pages beforehand, which is a little awkward.  I've
settled on this for the moment:

        for (;;) {
               struct fuse_io_args *ia;
                struct fuse_args_pages *ap;

                nr_pages =3D readahead_count(rac) - nr_pages;
                if (nr_pages > max_pages)
                        nr_pages =3D max_pages;
                if (nr_pages =3D=3D 0)
                        break;
                ia =3D fuse_io_alloc(NULL, nr_pages);
                if (!ia)
                        return;
                ap =3D &ia->ap;
                __readahead_batch(rac, ap->pages, nr_pages);
                for (i =3D 0; i < nr_pages; i++) {
                        fuse_wait_on_page_writeback(inode,
                                                    readahead_index(rac) + =
i);
                        ap->descs[i].length =3D PAGE_SIZE;
                }
                ap->num_pages =3D nr_pages;
                fuse_send_readpages(ia, rac->file);
        }

but I'm not entirely happy with that either.  Pondering better options.

> This will give consecutive pages, right?

readpages() was already being called with consecutive pages.  Several
filesystems had code to cope with the pages being non-consecutive, but
that wasn't how the core code worked; if there was a discontiguity it
would send off the pages that were consecutive and start a new batch.

__readahead_batch() can't return fewer than nr_pages, so you don't need
to check for that.


