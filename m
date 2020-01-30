Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 80A0614D731
	for <lists+cluster-devel@lfdr.de>; Thu, 30 Jan 2020 09:00:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580371239;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OoAmcJ91yAHaLipQSShMKCRWS9kWBxJTQ1NqG57x8sA=;
	b=X5kzgYNX+WYl5cEaJsbvmv8D0GEvxdYwIWnuYEMBIxBCNmhyZF8VQEnYSj96tg7JnAD0fr
	WAQQw2owkHlGLbm1KZiWRMK2k1qOAcyw5OvAQorf7dMWrCXngC8kHbHDrODiGfOXD9bInY
	wH0jCoS41N8fF9ep1HAShLwEYdU6D4A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-ijETX0nGN-W9ks3Be8rssQ-1; Thu, 30 Jan 2020 03:00:37 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D1E41882CD3;
	Thu, 30 Jan 2020 08:00:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C13FA83861;
	Thu, 30 Jan 2020 08:00:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 96FC587A7D;
	Thu, 30 Jan 2020 08:00:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00U80RQV011385 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 30 Jan 2020 03:00:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E5BA72093CE1; Thu, 30 Jan 2020 08:00:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E088F2093CE0
	for <cluster-devel@redhat.com>; Thu, 30 Jan 2020 08:00:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF3BC1011A93
	for <cluster-devel@redhat.com>; Thu, 30 Jan 2020 08:00:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-358-eC8tMtwCPQ6FFBZigfhRwg-1; Thu, 30 Jan 2020 03:00:23 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1ix4kH-0004zP-OW; Thu, 30 Jan 2020 08:00:13 +0000
Date: Thu, 30 Jan 2020 00:00:13 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20200130080013.GK6615@bombadil.infradead.org>
References: <20200125013553.24899-1-willy@infradead.org>
	<20200125013553.24899-5-willy@infradead.org>
	<20200129002456.GH18610@dread.disaster.area>
MIME-Version: 1.0
In-Reply-To: <20200129002456.GH18610@dread.disaster.area>
X-MC-Unique: eC8tMtwCPQ6FFBZigfhRwg-1
X-MC-Unique: ijETX0nGN-W9ks3Be8rssQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00U80RQV011385
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, linux-mm@kvack.org,
	ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 04/12] mm: Add readahead address space
	operation
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
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wed, Jan 29, 2020 at 11:24:56AM +1100, Dave Chinner wrote:
> On Fri, Jan 24, 2020 at 05:35:45PM -0800, Matthew Wilcox wrote:
> > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> >=20
> > This replaces ->readpages with a saner interface:
> >  - Return the number of pages not read instead of an ignored error code=
.
> >  - Pages are already in the page cache when ->readahead is called.
> >  - Implementation looks up the pages in the page cache instead of
> >    having them passed in a linked list.
> ....
> > diff --git a/mm/readahead.c b/mm/readahead.c
> > index 5a6676640f20..6d65dae6dad0 100644
> > --- a/mm/readahead.c
> > +++ b/mm/readahead.c
> > @@ -121,7 +121,18 @@ static void read_pages(struct address_space *mappi=
ng, struct file *filp,
> > =20
> >  =09blk_start_plug(&plug);
> > =20
> > -=09if (mapping->a_ops->readpages) {
> > +=09if (mapping->a_ops->readahead) {
> > +=09=09unsigned left =3D mapping->a_ops->readahead(filp, mapping,
> > +=09=09=09=09start, nr_pages);
> > +
> > +=09=09while (left) {
> > +=09=09=09struct page *page =3D readahead_page(mapping,
> > +=09=09=09=09=09start + nr_pages - left - 1);
>=20
> Off by one? start =3D 2, nr_pages =3D 2, left =3D 1, this looks up the
> page at index 2, which is the one we issued IO on, not the one we
> "left behind" which is at index 3.

Yup.  I originally had:

=09=09while (left--) ...

decided that was too confusing and didn't quite complete that thought.


