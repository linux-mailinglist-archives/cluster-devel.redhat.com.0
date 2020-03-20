Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 03BFB18D525
	for <lists+cluster-devel@lfdr.de>; Fri, 20 Mar 2020 17:59:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584723557;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Nv9amfAfd2DFGHS/UoAJDciZGVntOaeA6lYOY/V+TL8=;
	b=iRuUqyC0FW4BYVZwBB8TAhqcTXAVcM9aY0+N9kccdvFLXNEQpIulZDvsvv5ZzHredjku0y
	yQ2BYf1JWL2JSY0ln4QG/LUp3JcVbniPb65f63/jUTWZ5e5W6yAeZjSMq5JS1AfwHMTnE9
	L6z/RWqoZhZgxbIG5zBWkvZkOfp+sIM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-NyukE_XyO5KLGMXqQUcxuw-1; Fri, 20 Mar 2020 12:59:15 -0400
X-MC-Unique: NyukE_XyO5KLGMXqQUcxuw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E7CC800D5F;
	Fri, 20 Mar 2020 16:59:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CDE905D9CD;
	Fri, 20 Mar 2020 16:59:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EAEE5942A2;
	Fri, 20 Mar 2020 16:59:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02KGwbh2028333 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 20 Mar 2020 12:58:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D0AB72166AE4; Fri, 20 Mar 2020 16:58:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CCFB62166B30
	for <cluster-devel@redhat.com>; Fri, 20 Mar 2020 16:58:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41131800298
	for <cluster-devel@redhat.com>; Fri, 20 Mar 2020 16:58:35 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-410-Fz9cp1b3OpKaJlZLg8E0Bg-1;
	Fri, 20 Mar 2020 12:58:32 -0400
X-MC-Unique: Fz9cp1b3OpKaJlZLg8E0Bg-1
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
	[107.3.166.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 6434C20753;
	Fri, 20 Mar 2020 16:58:30 +0000 (UTC)
Date: Fri, 20 Mar 2020 09:58:28 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200320165828.GB851@sol.localdomain>
References: <20200320142231.2402-1-willy@infradead.org>
	<20200320142231.2402-13-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200320142231.2402-13-willy@infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02KGwbh2028333
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Fri, Mar 20, 2020 at 07:22:18AM -0700, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>=20
> By reducing nr_to_read, we can eliminate this check from inside the loop.
>=20
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Reviewed-by: John Hubbard <jhubbard@nvidia.com>
> Reviewed-by: William Kucharski <william.kucharski@oracle.com>
> ---
>  mm/readahead.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
>=20
> diff --git a/mm/readahead.c b/mm/readahead.c
> index d01531ef9f3c..a37b68f66233 100644
> --- a/mm/readahead.c
> +++ b/mm/readahead.c
> @@ -167,8 +167,6 @@ void __do_page_cache_readahead(struct address_space *=
mapping,
>  =09=09unsigned long lookahead_size)
>  {
>  =09struct inode *inode =3D mapping->host;
> -=09struct page *page;
> -=09unsigned long end_index;=09/* The last page we want to read */
>  =09LIST_HEAD(page_pool);
>  =09loff_t isize =3D i_size_read(inode);
>  =09gfp_t gfp_mask =3D readahead_gfp_mask(mapping);
> @@ -178,22 +176,29 @@ void __do_page_cache_readahead(struct address_space=
 *mapping,
>  =09=09._index =3D index,
>  =09};
>  =09unsigned long i;
> +=09pgoff_t end_index;=09/* The last page we want to read */
> =20
>  =09if (isize =3D=3D 0)
>  =09=09return;
> =20
> -=09end_index =3D ((isize - 1) >> PAGE_SHIFT);
> +=09end_index =3D (isize - 1) >> PAGE_SHIFT;
> +=09if (index > end_index)
> +=09=09return;
> +=09/* Avoid wrapping to the beginning of the file */
> +=09if (index + nr_to_read < index)
> +=09=09nr_to_read =3D ULONG_MAX - index + 1;
> +=09/* Don't read past the page containing the last byte of the file */
> +=09if (index + nr_to_read >=3D end_index)
> +=09=09nr_to_read =3D end_index - index + 1;

There seem to be a couple off-by-one errors here.  Shouldn't it be:

=09/* Avoid wrapping to the beginning of the file */
=09if (index + nr_to_read < index)
=09=09nr_to_read =3D ULONG_MAX - index;
=09/* Don't read past the page containing the last byte of the file */
=09if (index + nr_to_read > end_index)
=09=09nr_to_read =3D end_index - index + 1;

I.e., 'ULONG_MAX - index' rather than 'ULONG_MAX - index + 1', so that
'index + nr_to_read' is then ULONG_MAX rather than overflowed to 0.

Then 'index + nr_to_read > end_index' rather 'index + nr_to_read >=3D end_i=
ndex',
since otherwise nr_to_read can be increased by 1 rather than decreased or s=
tay
the same as expected.

- Eric


