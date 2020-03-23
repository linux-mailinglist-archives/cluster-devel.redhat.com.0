Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id F052818FFD2
	for <lists+cluster-devel@lfdr.de>; Mon, 23 Mar 2020 21:50:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584996611;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7uOtKBx4BqUMxnpdCZ8rsykYaYVz9y87D/XZE/A9TiY=;
	b=IpWeCoemTtRLXCusEGeYPQFzrmRVVtUNtG5OaJUa3W7AXd80iH5E2bay2zUUtZ4uwC/M9f
	qEnD7xnPMG0HxbhyEB094+03fNjYEeegFte6rBphL28alVipqKk/uhRiTo2fdVMNWHyH8z
	gkuISujn5VlOsPYhqPXOqShPzCbn8ok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-8aTtEanaOaCsGulxlF0U1w-1; Mon, 23 Mar 2020 16:50:09 -0400
X-MC-Unique: 8aTtEanaOaCsGulxlF0U1w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BF07800D50;
	Mon, 23 Mar 2020 20:50:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 48B0E60BE0;
	Mon, 23 Mar 2020 20:50:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4ECC886382;
	Mon, 23 Mar 2020 20:50:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02NKo2Lx015826 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 23 Mar 2020 16:50:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 92AD62166B2B; Mon, 23 Mar 2020 20:50:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F1832166B2A
	for <cluster-devel@redhat.com>; Mon, 23 Mar 2020 20:50:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A027B8F782A
	for <cluster-devel@redhat.com>; Mon, 23 Mar 2020 20:50:00 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-484-4_2H1WzlO0iQFuEWgO-dSw-1;
	Mon, 23 Mar 2020 16:49:57 -0400
X-MC-Unique: 4_2H1WzlO0iQFuEWgO-dSw-1
Received: from gmail.com (unknown [104.132.1.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 2370A20719;
	Mon, 23 Mar 2020 20:49:56 +0000 (UTC)
Date: Mon, 23 Mar 2020 13:49:54 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200323204954.GB61708@gmail.com>
References: <20200323202259.13363-1-willy@infradead.org>
	<20200323202259.13363-13-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200323202259.13363-13-willy@infradead.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02NKo2Lx015826
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-mm@kvack.org,
	John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
	William Kucharski <william.kucharski@oracle.com>,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v10 12/25] mm: Move end_index check out
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Mon, Mar 23, 2020 at 01:22:46PM -0700, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>=20
> By reducing nr_to_read, we can eliminate this check from inside the loop.
>=20
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Reviewed-by: John Hubbard <jhubbard@nvidia.com>
> Reviewed-by: William Kucharski <william.kucharski@oracle.com>
> ---
>  mm/readahead.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>=20
> diff --git a/mm/readahead.c b/mm/readahead.c
> index d01531ef9f3c..998fdd23c0b1 100644
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
> @@ -178,22 +176,26 @@ void __do_page_cache_readahead(struct address_space=
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
> +=09/* Don't read past the page containing the last byte of the file */
> +=09if (nr_to_read > end_index - index)
> +=09=09nr_to_read =3D end_index - index + 1;
> =20
>  =09/*
>  =09 * Preallocate as many pages as we will need.
>  =09 */
>  =09for (i =3D 0; i < nr_to_read; i++) {
> -=09=09if (index + i > end_index)
> -=09=09=09break;
> +=09=09struct page *page =3D xa_load(&mapping->i_pages, index + i);
> =20
>  =09=09BUG_ON(index + i !=3D rac._index + rac._nr_pages);
> =20
> -=09=09page =3D xa_load(&mapping->i_pages, index + i);
>  =09=09if (page && !xa_is_value(page)) {
>  =09=09=09/*
>  =09=09=09 * Page already present?  Kick off the current batch of
> --=20

Reviewed-by: Eric Biggers <ebiggers@google.com>

- Eric


