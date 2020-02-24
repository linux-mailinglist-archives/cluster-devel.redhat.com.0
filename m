Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D0AEF16B2D4
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Feb 2020 22:40:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582580457;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fPomq/xvt1TsBvjwQaarCNcdvokE349b1Qo599ZdUvM=;
	b=awcq5bq+Cp5pxmr2pDKL9866LR58w0i/RjjQHfaqp2wHFmplI7hjZ33hwZWvoJm2JdEVPR
	5kr6Jv5D/JHmB8cKSUx5HVztVRiKABiKSXV3U6lGRjAdah1GWzL8xyeWJzgiPyNkGiGUCc
	k+PIoVoS0wAzpCPEAelpkrCBXB6vRgI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-0RJmAR7jONSbHlDMb8pcNA-1; Mon, 24 Feb 2020 16:40:53 -0500
X-MC-Unique: 0RJmAR7jONSbHlDMb8pcNA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AF498017CC;
	Mon, 24 Feb 2020 21:40:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 269219CA3;
	Mon, 24 Feb 2020 21:40:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 55128860ED;
	Mon, 24 Feb 2020 21:40:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01OLemrd019373 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 24 Feb 2020 16:40:48 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3748610D14E6; Mon, 24 Feb 2020 21:40:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 324EE11701C3
	for <cluster-devel@redhat.com>; Mon, 24 Feb 2020 21:40:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29100800297
	for <cluster-devel@redhat.com>; Mon, 24 Feb 2020 21:40:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-225-bLlF_-45O5CeU9QlcK8xyA-1; Mon, 24 Feb 2020 16:40:42 -0500
X-MC-Unique: bLlF_-45O5CeU9QlcK8xyA-1
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j6LSx-0007AA-4f; Mon, 24 Feb 2020 21:40:39 +0000
Date: Mon, 24 Feb 2020 13:40:39 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200224214039.GF13895@infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
	<20200219210103.32400-10-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200219210103.32400-10-willy@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01OLemrd019373
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v7 09/24] mm: Put readahead pages in
	cache earlier
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

On Wed, Feb 19, 2020 at 01:00:48PM -0800, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>=20
> When populating the page cache for readahead, mappings that use
> ->readpages must populate the page cache themselves as the pages are
> passed on a linked list which would normally be used for the page cache's
> LRU.  For mappings that use ->readpage or the upcoming ->readahead method=
,
> we can put the pages into the page cache as soon as they're allocated,
> which solves a race between readahead and direct IO.  It also lets us
> remove the gfp argument from read_pages().
>=20
> Use the new readahead_page() API to implement the repeated calls to
> ->readpage(), just like most filesystems will.  This iterator also
> supports huge pages, even though none of the filesystems have been
> converted to use them yet.
>=20
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  include/linux/pagemap.h | 20 +++++++++++++++++
>  mm/readahead.c          | 48 +++++++++++++++++++++++++----------------
>  2 files changed, 49 insertions(+), 19 deletions(-)
>=20
> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> index 55fcea0249e6..4989d330fada 100644
> --- a/include/linux/pagemap.h
> +++ b/include/linux/pagemap.h
> @@ -647,8 +647,28 @@ struct readahead_control {
>  /* private: use the readahead_* accessors instead */
>  =09pgoff_t _index;
>  =09unsigned int _nr_pages;
> +=09unsigned int _batch_count;
>  };
> =20
> +static inline struct page *readahead_page(struct readahead_control *rac)
> +{
> +=09struct page *page;
> +
> +=09BUG_ON(rac->_batch_count > rac->_nr_pages);
> +=09rac->_nr_pages -=3D rac->_batch_count;
> +=09rac->_index +=3D rac->_batch_count;
> +=09rac->_batch_count =3D 0;
> +
> +=09if (!rac->_nr_pages)
> +=09=09return NULL;
> +
> +=09page =3D xa_load(&rac->mapping->i_pages, rac->_index);
> +=09VM_BUG_ON_PAGE(!PageLocked(page), page);
> +=09rac->_batch_count =3D hpage_nr_pages(page);
> +
> +=09return page;
> +}
> +
>  /* The number of pages in this readahead block */
>  static inline unsigned int readahead_count(struct readahead_control *rac=
)
>  {
> diff --git a/mm/readahead.c b/mm/readahead.c
> index 83df5c061d33..aaa209559ba2 100644
> --- a/mm/readahead.c
> +++ b/mm/readahead.c
> @@ -113,15 +113,14 @@ int read_cache_pages(struct address_space *mapping,=
 struct list_head *pages,
> =20
>  EXPORT_SYMBOL(read_cache_pages);
> =20
> -static void read_pages(struct readahead_control *rac, struct list_head *=
pages,
> -=09=09gfp_t gfp)
> +static void read_pages(struct readahead_control *rac, struct list_head *=
pages)
>  {
>  =09const struct address_space_operations *aops =3D rac->mapping->a_ops;
> +=09struct page *page;
>  =09struct blk_plug plug;
> -=09unsigned page_idx;
> =20
>  =09if (!readahead_count(rac))
> -=09=09return;
> +=09=09goto out;
> =20
>  =09blk_start_plug(&plug);
> =20
> @@ -130,23 +129,23 @@ static void read_pages(struct readahead_control *ra=
c, struct list_head *pages,
>  =09=09=09=09readahead_count(rac));
>  =09=09/* Clean up the remaining pages */
>  =09=09put_pages_list(pages);
> -=09=09goto out;
> -=09}
> -
> -=09for (page_idx =3D 0; page_idx < readahead_count(rac); page_idx++) {
> -=09=09struct page *page =3D lru_to_page(pages);
> -=09=09list_del(&page->lru);
> -=09=09if (!add_to_page_cache_lru(page, rac->mapping, page->index,
> -=09=09=09=09gfp))
> +=09=09rac->_index +=3D rac->_nr_pages;
> +=09=09rac->_nr_pages =3D 0;
> +=09} else {
> +=09=09while ((page =3D readahead_page(rac))) {
>  =09=09=09aops->readpage(rac->file, page);
> -=09=09put_page(page);
> +=09=09=09put_page(page);
> +=09=09}
>  =09}
> =20
> -out:
>  =09blk_finish_plug(&plug);
> =20
>  =09BUG_ON(!list_empty(pages));
> -=09rac->_nr_pages =3D 0;
> +=09BUG_ON(readahead_count(rac));
> +
> +out:
> +=09/* If we were called due to a conflicting page, skip over it */
> +=09rac->_index++;
>  }
> =20
>  /*
> @@ -165,9 +164,11 @@ void __do_page_cache_readahead(struct address_space =
*mapping,
>  =09LIST_HEAD(page_pool);
>  =09loff_t isize =3D i_size_read(inode);
>  =09gfp_t gfp_mask =3D readahead_gfp_mask(mapping);
> +=09bool use_list =3D mapping->a_ops->readpages;

I find this single use variable a little weird.  Not a dealbreaker,
but just checking the methods would seem a little more obvious to me.

Except for this and the other nitpick the patch looks good to me:

Reviewed-by: Christoph Hellwig <hch@lst.de>


