Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id C3A421A9219
	for <lists+cluster-devel@lfdr.de>; Wed, 15 Apr 2020 06:56:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586926599;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WRRoZJbZqHl2OTEhwVu0Qfn0J42Ws+jsUfotsuAaUqo=;
	b=G06s5jMmcFTxJX+oZ+5NAsgTyaslilv8IWVKnR7py8hIgm+nDae0ZOwaenEbYPnOufyfT2
	10hzMQeuf4y+2gM25TIpXIrDDrqANeOoW9DiH5RvF63DcJhOl1fiG2G34iPPWTQem6QXd7
	lsy+CEhEK/ej6sQK+m6cEngmxL4aW8E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-eHQrsVlrO-WsOk44B3nw_w-1; Wed, 15 Apr 2020 00:56:37 -0400
X-MC-Unique: eHQrsVlrO-WsOk44B3nw_w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A08F104FB63;
	Wed, 15 Apr 2020 04:56:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E3AF52619F;
	Wed, 15 Apr 2020 04:56:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 47BD718089C8;
	Wed, 15 Apr 2020 04:56:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03F4uOfa002239 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 Apr 2020 00:56:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F220A2166B2D; Wed, 15 Apr 2020 04:56:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE1002166B2B
	for <cluster-devel@redhat.com>; Wed, 15 Apr 2020 04:56:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CCC9868CB1
	for <cluster-devel@redhat.com>; Wed, 15 Apr 2020 04:56:21 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-454-wQFxIzhTMG6yrrzJ2CJb8Q-1;
	Wed, 15 Apr 2020 00:56:19 -0400
X-MC-Unique: wQFxIzhTMG6yrrzJ2CJb8Q-1
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
	[73.231.172.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 3BD0920784;
	Wed, 15 Apr 2020 04:56:17 +0000 (UTC)
Date: Tue, 14 Apr 2020 21:56:16 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Matthew Wilcox <willy@infradead.org>
Message-Id: <20200414215616.f665d12f8549f52606784d1e@linux-foundation.org>
In-Reply-To: <20200415021808.GA5820@bombadil.infradead.org>
References: <20200414150233.24495-1-willy@infradead.org>
	<20200414150233.24495-6-willy@infradead.org>
	<20200414181705.bfc4c0087092051a9475141e@linux-foundation.org>
	<20200415021808.GA5820@bombadil.infradead.org>
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03F4uOfa002239
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On Tue, 14 Apr 2020 19:18:08 -0700 Matthew Wilcox <willy@infradead.org> wro=
te:

> On Tue, Apr 14, 2020 at 06:17:05PM -0700, Andrew Morton wrote:
> > On Tue, 14 Apr 2020 08:02:13 -0700 Matthew Wilcox <willy@infradead.org>=
 wrote:
> > > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> > >=20
> > > Filesystems which implement the upcoming ->readahead method will get
> > > their pages by calling readahead_page() or readahead_page_batch().
> > > These functions support large pages, even though none of the filesyst=
ems
> > > to be converted do yet.
> > >=20
> > > +static inline struct page *readahead_page(struct readahead_control *=
rac)
> > > +static inline unsigned int __readahead_batch(struct readahead_contro=
l *rac,
> > > +=09=09struct page **array, unsigned int array_sz)
> >=20
> > These are large functions.  Was it correct to inline them?
>=20
> Hmm.  They don't seem that big to me.

They're really big!

> readahead_page, stripped of its sanity checks:

Well, the sanity checks still count for cache footprint.

otoh, I think a function which is expected to be called from a single
site per filesystem is OK to be inlined, because there's not likely to
be much icache benefit unless different filesystem types are
simultaneously being used heavily, which sounds unlikely.  Although
there's still a bit of overall code size bloat.

> +       rac->_index +=3D rac->_batch_count;
> +       if (!rac->_nr_pages) {
> +               rac->_batch_count =3D 0;
> +               return NULL;
> +       }
> +       page =3D xa_load(&rac->mapping->i_pages, rac->_index);
> +       rac->_batch_count =3D hpage_nr_pages(page);
>=20
> __readahead_batch is much bigger, but it's only used by btrfs and fuse,
> and it seemed unfair to make everybody pay the cost for a function only
> used by two filesystems.

Do we expect more filesystems to use these in the future?

These function are really big!

> > The batching API only appears to be used by fuse?  If so, do we really
> > need it?  Does it provide some functional need, or is it a performance
> > thing?  If the latter, how significant is it?
>=20
> I must confess to not knowing the performance impact.  If the code uses
> xa_load() repeatedly, it costs O(log n) each time as we walk down the tre=
e
> (mitigated to a large extent by cache, of course).  Using xas_for_each()
> keeps us at the bottom of the tree and each iteration is O(1).
> I'm interested to see if filesystem maintainers start to use the batch
> function or if they're happier sticking with the individual lookups.
>=20
> The batch API was originally written for use with btrfs, but it was a
> significant simplification to convert fuse to use it.

hm, OK.  It's not clear that its inclusion is justified?

> > The code adds quite a few (inlined!) VM_BUG_ONs.  Can we plan to remove
> > them at some stage?  Such as, before Linus shouts at us :)
>=20
> I'd be happy to remove them.  Various reviewers said things like "are you
> sure this can't happen?"

Yeah, these things tend to live for ever.  Please add a todo to remove
them after the code has matured?


