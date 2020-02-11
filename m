Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 17572158949
	for <lists+cluster-devel@lfdr.de>; Tue, 11 Feb 2020 05:56:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581397002;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0Fa2uclnSFXv5lx6V1jJmA9QTvGe3OvbUzD1selfjdE=;
	b=jL1pN4oDR2Cyu2g3T+sBGsVTsWbuJzAkeFCxMt0bWRRakuC2WI8jZTahbGAdIjEOtkvAq0
	CZtVedakbjx/kaeaLGS9tgUdciXCRP5pqHGpikfVIen+EB43nez4L83AYJXvEVYCiQkTb5
	1U93x8vXhkkVJ3D7XREzVjvdz6hGvsI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-V5qfm-6aPnWYlYMQ1A5F9w-1; Mon, 10 Feb 2020 23:56:40 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F203BDB63;
	Tue, 11 Feb 2020 04:56:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32C178EA1A;
	Tue, 11 Feb 2020 04:56:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 136AC1809567;
	Tue, 11 Feb 2020 04:56:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01B4qdMW028657 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 10 Feb 2020 23:52:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A72B92166B2C; Tue, 11 Feb 2020 04:52:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A29C32166B27
	for <cluster-devel@redhat.com>; Tue, 11 Feb 2020 04:52:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71BDB80206B
	for <cluster-devel@redhat.com>; Tue, 11 Feb 2020 04:52:37 +0000 (UTC)
Received: from mail104.syd.optusnet.com.au (mail104.syd.optusnet.com.au
	[211.29.132.246]) by relay.mimecast.com with ESMTP id
	us-mta-281-dTvQ6CuxNSaZADtjlYjJGg-1; Mon, 10 Feb 2020 23:52:34 -0500
Received: from dread.disaster.area (pa49-179-138-28.pa.nsw.optusnet.com.au
	[49.179.138.28])
	by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id 11F74820924;
	Tue, 11 Feb 2020 15:52:30 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1j1NXC-0005dw-7j; Tue, 11 Feb 2020 15:52:30 +1100
Date: Tue, 11 Feb 2020 15:52:30 +1100
From: Dave Chinner <david@fromorbit.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200211045230.GD10776@dread.disaster.area>
References: <20200211010348.6872-1-willy@infradead.org>
	<20200211010348.6872-5-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200211010348.6872-5-willy@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=W5xGqiek c=1 sm=1 tr=0
	a=zAxSp4fFY/GQY8/esVNjqw==:117 a=zAxSp4fFY/GQY8/esVNjqw==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=l697ptgUJYAA:10
	a=JfrnYn6hAAAA:8 a=7-415B0cAAAA:8 a=TWVYvH7QqZ0YkocKP0UA:9
	a=CjuIK1q_8ugA:10 a=1CNFftbPRP8L7MoqJWF3:22 a=biEYGPWJfzWAr4FL6Ov7:22
X-MC-Unique: dTvQ6CuxNSaZADtjlYjJGg-1
X-MC-Unique: V5qfm-6aPnWYlYMQ1A5F9w-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01B4qdMW028657
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Mon, Feb 10, 2020 at 05:03:39PM -0800, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>=20
> This replaces ->readpages with a saner interface:
>  - Return void instead of an ignored error code.
>  - Pages are already in the page cache when ->readahead is called.
>  - Implementation looks up the pages in the page cache instead of
>    having them passed in a linked list.
>=20
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

....

> =20
> +/*
> + * Readahead is of a block of consecutive pages.
> + */
> +struct readahead_control {
> +=09struct file *file;
> +=09struct address_space *mapping;
> +/* private: use the readahead_* accessors instead */
> +=09pgoff_t start;
> +=09unsigned int nr_pages;
> +=09unsigned int batch_count;
> +};
> +
> +static inline struct page *readahead_page(struct readahead_control *rac)
> +{
> +=09struct page *page;
> +
> +=09if (!rac->nr_pages)
> +=09=09return NULL;
> +
> +=09page =3D xa_load(&rac->mapping->i_pages, rac->start);
> +=09VM_BUG_ON_PAGE(!PageLocked(page), page);
> +=09rac->batch_count =3D hpage_nr_pages(page);
> +=09rac->start +=3D rac->batch_count;

There's no mention of large page support in the patch description
and I don't recall this sort of large page batching in previous
iterations.

This seems like new functionality to me, not directly related to
the initial ->readahead API change? What have I missed?

Cheers,

Dave.
--=20
Dave Chinner
david@fromorbit.com


