Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id AC9651A90D9
	for <lists+cluster-devel@lfdr.de>; Wed, 15 Apr 2020 04:18:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586917118;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MkKb+EYkgmuklBSuPX7zgxQfzb6Gc1Gv2USnTGzIkH8=;
	b=CQ/eicC9uP5I36O1UuUD0Vy1ByKuBMWH8gwFzDAgQ+dek3JqBUGHrH6Xk27vVwGnZQW97C
	0f66dRtbVmpnZF2J7czrt64R3Xh8GbgzsdJrS9MEQ6DQGWToSNQQRXy+d3uah9CsDqbyvz
	IXCDmAlsPimfyvAAFbuhJgjnWRAX6+M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-4BaZ2-TnODSHhydBv3yr2g-1; Tue, 14 Apr 2020 22:18:36 -0400
X-MC-Unique: 4BaZ2-TnODSHhydBv3yr2g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 620F28017FC;
	Wed, 15 Apr 2020 02:18:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1385E5E037;
	Wed, 15 Apr 2020 02:18:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B753093068;
	Wed, 15 Apr 2020 02:18:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03F2IQxY023195 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 14 Apr 2020 22:18:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D8E5D118DF4F; Wed, 15 Apr 2020 02:18:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D4A87118DF55
	for <cluster-devel@redhat.com>; Wed, 15 Apr 2020 02:18:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 20C0680028B
	for <cluster-devel@redhat.com>; Wed, 15 Apr 2020 02:18:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-47-pB1vkO6ZMRWRpdZ-zy5iyg-1; Tue, 14 Apr 2020 22:18:21 -0400
X-MC-Unique: pB1vkO6ZMRWRpdZ-zy5iyg-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jOXcu-0000tf-4k; Wed, 15 Apr 2020 02:18:11 +0000
Date: Tue, 14 Apr 2020 19:18:08 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Message-ID: <20200415021808.GA5820@bombadil.infradead.org>
References: <20200414150233.24495-1-willy@infradead.org>
	<20200414150233.24495-6-willy@infradead.org>
	<20200414181705.bfc4c0087092051a9475141e@linux-foundation.org>
MIME-Version: 1.0
In-Reply-To: <20200414181705.bfc4c0087092051a9475141e@linux-foundation.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03F2IQxY023195
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, William Kucharski <william.kucharski@oracle.com>,
	linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
	linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v11 05/25] mm: Add new readahead_control
	API
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
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Apr 14, 2020 at 06:17:05PM -0700, Andrew Morton wrote:
> On Tue, 14 Apr 2020 08:02:13 -0700 Matthew Wilcox <willy@infradead.org> w=
rote:
> > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> >=20
> > Filesystems which implement the upcoming ->readahead method will get
> > their pages by calling readahead_page() or readahead_page_batch().
> > These functions support large pages, even though none of the filesystem=
s
> > to be converted do yet.
> >=20
> > +static inline struct page *readahead_page(struct readahead_control *ra=
c)
> > +static inline unsigned int __readahead_batch(struct readahead_control =
*rac,
> > +=09=09struct page **array, unsigned int array_sz)
>=20
> These are large functions.  Was it correct to inline them?

Hmm.  They don't seem that big to me.

readahead_page, stripped of its sanity checks:

+       rac->_nr_pages -=3D rac->_batch_count;
+       rac->_index +=3D rac->_batch_count;
+       if (!rac->_nr_pages) {
+               rac->_batch_count =3D 0;
+               return NULL;
+       }
+       page =3D xa_load(&rac->mapping->i_pages, rac->_index);
+       rac->_batch_count =3D hpage_nr_pages(page);

__readahead_batch is much bigger, but it's only used by btrfs and fuse,
and it seemed unfair to make everybody pay the cost for a function only
used by two filesystems.

> The batching API only appears to be used by fuse?  If so, do we really
> need it?  Does it provide some functional need, or is it a performance
> thing?  If the latter, how significant is it?

I must confess to not knowing the performance impact.  If the code uses
xa_load() repeatedly, it costs O(log n) each time as we walk down the tree
(mitigated to a large extent by cache, of course).  Using xas_for_each()
keeps us at the bottom of the tree and each iteration is O(1).
I'm interested to see if filesystem maintainers start to use the batch
function or if they're happier sticking with the individual lookups.

The batch API was originally written for use with btrfs, but it was a
significant simplification to convert fuse to use it.

> The code adds quite a few (inlined!) VM_BUG_ONs.  Can we plan to remove
> them at some stage?  Such as, before Linus shouts at us :)

I'd be happy to remove them.  Various reviewers said things like "are you
sure this can't happen?"


