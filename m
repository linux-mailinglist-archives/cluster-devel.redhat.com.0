Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9124F158F56
	for <lists+cluster-devel@lfdr.de>; Tue, 11 Feb 2020 13:58:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581425910;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=O8hI1n3XdMgaZeDXgyuLkONcqxKkl3Xv1nv8I++TXVI=;
	b=LUVKMMuJ2Kc/zBIuk8ojEFrPKUaqNErKHPaFKPJgS9/rFB9FpP9zsYVyTvOzFW+rZE8AqT
	QTs5EUX5Toe6xJ4CUdSGKXb63PxWf7PMLiRim9sx930Yq7I6oy8U4g4yLqGMLYiuOKimWr
	Sks1mv6OiqI8nFyxjO5tIU7j+u9Aclw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-pOJqojejNumox0yY0LYIqg-1; Tue, 11 Feb 2020 07:58:28 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03A46800EB2;
	Tue, 11 Feb 2020 12:58:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6299E100032E;
	Tue, 11 Feb 2020 12:58:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 13F9818089CD;
	Tue, 11 Feb 2020 12:58:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01BCsRno025821 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 11 Feb 2020 07:54:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8ED6310AF9DE; Tue, 11 Feb 2020 12:54:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8914810AF9D9
	for <cluster-devel@redhat.com>; Tue, 11 Feb 2020 12:54:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 788A08012C5
	for <cluster-devel@redhat.com>; Tue, 11 Feb 2020 12:54:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-405-Fu3HCu9kMrifOzsgzLGl0g-1; Tue, 11 Feb 2020 07:54:22 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j1V3O-0006U6-1C; Tue, 11 Feb 2020 12:54:14 +0000
Date: Tue, 11 Feb 2020 04:54:13 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20200211125413.GU8731@bombadil.infradead.org>
References: <20200211010348.6872-1-willy@infradead.org>
	<20200211010348.6872-5-willy@infradead.org>
	<20200211045230.GD10776@dread.disaster.area>
MIME-Version: 1.0
In-Reply-To: <20200211045230.GD10776@dread.disaster.area>
X-MC-Unique: Fu3HCu9kMrifOzsgzLGl0g-1
X-MC-Unique: pOJqojejNumox0yY0LYIqg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01BCsRno025821
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v5 04/13] mm: Add readahead address
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

On Tue, Feb 11, 2020 at 03:52:30PM +1100, Dave Chinner wrote:
> > +struct readahead_control {
> > +=09struct file *file;
> > +=09struct address_space *mapping;
> > +/* private: use the readahead_* accessors instead */
> > +=09pgoff_t start;
> > +=09unsigned int nr_pages;
> > +=09unsigned int batch_count;
> > +};
> > +
> > +static inline struct page *readahead_page(struct readahead_control *ra=
c)
> > +{
> > +=09struct page *page;
> > +
> > +=09if (!rac->nr_pages)
> > +=09=09return NULL;
> > +
> > +=09page =3D xa_load(&rac->mapping->i_pages, rac->start);
> > +=09VM_BUG_ON_PAGE(!PageLocked(page), page);
> > +=09rac->batch_count =3D hpage_nr_pages(page);
> > +=09rac->start +=3D rac->batch_count;
>=20
> There's no mention of large page support in the patch description
> and I don't recall this sort of large page batching in previous
> iterations.
>=20
> This seems like new functionality to me, not directly related to
> the initial ->readahead API change? What have I missed?

I had a crisis of confidence when I was working on this -- the loop
originally looked like this:

#define readahead_for_each(rac, page)                                   \
        for (; (page =3D readahead_page(rac)); rac->nr_pages--)

and then I started thinking about what I'd need to do to support large
pages, and that turned into

#define readahead_for_each(rac, page)                                   \
        for (; (page =3D readahead_page(rac));=09=09=09=09\
=09=09rac->nr_pages -=3D hpage_nr_pages(page))

but I realised that was potentially a use-after-free because 'page' has
certainly had put_page() called on it by then.  I had a brief period
where I looked at moving put_page() away from being the filesystem's
responsibility and into the iterator, but that would introduce more
changes into the patchset, as well as causing problems for filesystems
that want to break out of the loop.

By this point, I was also looking at the readahead_for_each_batch()
iterator that btrfs uses, and so we have the batch count anyway, and we
might as well use it to store the number of subpages of the large page.
And so it became easier to just put the whole ball of wax into the initial
patch set, rather than introduce the iterator now and then fix it up in
the patch set that I'm basing on this.

So yes, there's a certain amount of excess functionality in this patch
set ... I can remove it for the next release.


