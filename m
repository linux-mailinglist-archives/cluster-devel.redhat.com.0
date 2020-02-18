Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 2D037162003
	for <lists+cluster-devel@lfdr.de>; Tue, 18 Feb 2020 06:03:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582002202;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NkqnHPpPBYtkTM7ayDdTmG/ia3vKEIVtWwaYYO1JEdQ=;
	b=P+L9adcEQL7JFKHz8hhQ/9S0DXfxAdcr9WN1Fixawsgv+nfxrA87ovVMAkM/ASzKUjkiea
	j0YsJ5S574Pxcya0NOGgQTZI0hNdc6eACVTkSTOnfkPEOmi0JPOiEisEkmH1Txja5Dhkwz
	cCHX1R77VXPoNTOTRuDrEOirCCJV8j8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-hs_WZIBhPWGaA4a5Dvj1UA-1; Tue, 18 Feb 2020 00:03:20 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0426D107ACC4;
	Tue, 18 Feb 2020 05:03:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C6E85D9E2;
	Tue, 18 Feb 2020 05:03:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AD24B1809567;
	Tue, 18 Feb 2020 05:03:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01I538eO025404 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 00:03:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 326932166B29; Tue, 18 Feb 2020 05:03:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DDCC2166B27
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 05:03:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F726801563
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 05:03:06 +0000 (UTC)
Received: from mail104.syd.optusnet.com.au (mail104.syd.optusnet.com.au
	[211.29.132.246]) by relay.mimecast.com with ESMTP id
	us-mta-203-Iq-PvboSNsKDfLwHwguH9w-1; Tue, 18 Feb 2020 00:03:03 -0500
Received: from dread.disaster.area (pa49-179-138-28.pa.nsw.optusnet.com.au
	[49.179.138.28])
	by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id 7E1D17E99BC;
	Tue, 18 Feb 2020 16:03:01 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1j3v2C-0005rs-Ui; Tue, 18 Feb 2020 16:03:00 +1100
Date: Tue, 18 Feb 2020 16:03:00 +1100
From: Dave Chinner <david@fromorbit.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200218050300.GI10776@dread.disaster.area>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-4-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200217184613.19668-4-willy@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=X6os11be c=1 sm=1 tr=0
	a=zAxSp4fFY/GQY8/esVNjqw==:117 a=zAxSp4fFY/GQY8/esVNjqw==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=l697ptgUJYAA:10
	a=JfrnYn6hAAAA:8 a=7-415B0cAAAA:8 a=T1S5Ow7nDR_9LkHsJ_YA:9
	a=8UYMWJo80S1V5K9C:21 a=Xcujrn6zEerIh50R:21 a=CjuIK1q_8ugA:10
	a=1CNFftbPRP8L7MoqJWF3:22 a=biEYGPWJfzWAr4FL6Ov7:22
X-MC-Unique: Iq-PvboSNsKDfLwHwguH9w-1
X-MC-Unique: hs_WZIBhPWGaA4a5Dvj1UA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01I538eO025404
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v6 03/19] mm: Use readahead_control to
	pass arguments
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

On Mon, Feb 17, 2020 at 10:45:44AM -0800, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>=20
> In this patch, only between __do_page_cache_readahead() and
> read_pages(), but it will be extended in upcoming patches.  Also add
> the readahead_count() accessor.
>=20
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  include/linux/pagemap.h | 17 +++++++++++++++++
>  mm/readahead.c          | 36 +++++++++++++++++++++---------------
>  2 files changed, 38 insertions(+), 15 deletions(-)
>=20
> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> index ccb14b6a16b5..982ecda2d4a2 100644
> --- a/include/linux/pagemap.h
> +++ b/include/linux/pagemap.h
> @@ -630,6 +630,23 @@ static inline int add_to_page_cache(struct page *pag=
e,
>  =09return error;
>  }
> =20
> +/*
> + * Readahead is of a block of consecutive pages.
> + */
> +struct readahead_control {
> +=09struct file *file;
> +=09struct address_space *mapping;
> +/* private: use the readahead_* accessors instead */
> +=09pgoff_t _start;
> +=09unsigned int _nr_pages;
> +};
> +
> +/* The number of pages in this readahead block */
> +static inline unsigned int readahead_count(struct readahead_control *rac=
)
> +{
> +=09return rac->_nr_pages;
> +}
> +
>  static inline unsigned long dir_pages(struct inode *inode)
>  {
>  =09return (unsigned long)(inode->i_size + PAGE_SIZE - 1) >>
> diff --git a/mm/readahead.c b/mm/readahead.c
> index 12d13b7792da..15329309231f 100644
> --- a/mm/readahead.c
> +++ b/mm/readahead.c
> @@ -113,26 +113,29 @@ int read_cache_pages(struct address_space *mapping,=
 struct list_head *pages,
> =20
>  EXPORT_SYMBOL(read_cache_pages);
> =20
> -static void read_pages(struct address_space *mapping, struct file *filp,
> -=09=09struct list_head *pages, unsigned int nr_pages, gfp_t gfp)
> +static void read_pages(struct readahead_control *rac, struct list_head *=
pages,
> +=09=09gfp_t gfp)
>  {
> +=09const struct address_space_operations *aops =3D rac->mapping->a_ops;
>  =09struct blk_plug plug;
>  =09unsigned page_idx;

Splitting out the aops rather than the mapping here just looks
weird, especially as you need the mapping later in the function.
Using aops doesn't even reduce the code side....

> =20
>  =09blk_start_plug(&plug);
> =20
> -=09if (mapping->a_ops->readpages) {
> -=09=09mapping->a_ops->readpages(filp, mapping, pages, nr_pages);
> +=09if (aops->readpages) {
> +=09=09aops->readpages(rac->file, rac->mapping, pages,
> +=09=09=09=09readahead_count(rac));
>  =09=09/* Clean up the remaining pages */
>  =09=09put_pages_list(pages);
>  =09=09goto out;
>  =09}
> =20
> -=09for (page_idx =3D 0; page_idx < nr_pages; page_idx++) {
> +=09for (page_idx =3D 0; page_idx < readahead_count(rac); page_idx++) {
>  =09=09struct page *page =3D lru_to_page(pages);
>  =09=09list_del(&page->lru);
> -=09=09if (!add_to_page_cache_lru(page, mapping, page->index, gfp))
> -=09=09=09mapping->a_ops->readpage(filp, page);
> +=09=09if (!add_to_page_cache_lru(page, rac->mapping, page->index,
> +=09=09=09=09gfp))
> +=09=09=09aops->readpage(rac->file, page);

... it just makes this less readable by splitting the if() over two
lines...

>  =09=09put_page(page);
>  =09}
> =20
> @@ -155,9 +158,13 @@ void __do_page_cache_readahead(struct address_space =
*mapping,
>  =09unsigned long end_index;=09/* The last page we want to read */
>  =09LIST_HEAD(page_pool);
>  =09int page_idx;
> -=09unsigned int nr_pages =3D 0;
>  =09loff_t isize =3D i_size_read(inode);
>  =09gfp_t gfp_mask =3D readahead_gfp_mask(mapping);
> +=09struct readahead_control rac =3D {
> +=09=09.mapping =3D mapping,
> +=09=09.file =3D filp,
> +=09=09._nr_pages =3D 0,
> +=09};

No need to initialise _nr_pages to zero, leaving it out will do the
same thing.

> =20
>  =09if (isize =3D=3D 0)
>  =09=09return;
> @@ -180,10 +187,9 @@ void __do_page_cache_readahead(struct address_space =
*mapping,
>  =09=09=09 * contiguous pages before continuing with the next
>  =09=09=09 * batch.
>  =09=09=09 */
> -=09=09=09if (nr_pages)
> -=09=09=09=09read_pages(mapping, filp, &page_pool, nr_pages,
> -=09=09=09=09=09=09gfp_mask);
> -=09=09=09nr_pages =3D 0;
> +=09=09=09if (readahead_count(&rac))
> +=09=09=09=09read_pages(&rac, &page_pool, gfp_mask);
> +=09=09=09rac._nr_pages =3D 0;

Hmmm. Wondering ig it make sense to move the gfp_mask to the readahead
control structure - if we have to pass the gfp_mask down all the
way along side the rac, then I think it makes sense to do that...

Cheers,

Dave.
--=20
Dave Chinner
david@fromorbit.com


