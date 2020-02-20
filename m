Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 0B3E316615F
	for <lists+cluster-devel@lfdr.de>; Thu, 20 Feb 2020 16:49:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582213771;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iqoKBMHx7X31lUAvirsbTMIeGRmbqr+UlRJYf2nv3Ec=;
	b=S8GF02MfNhr9STVElzBPShRiZUz/vUy4Gu51H54gHJBjOAhMocWI2rW03Odmg3uBKvL2o+
	3EXud4hAjUcJ/mfp1pGlNXAlsnkR29ZyOYnC3jlDd7QoztVoPoKtklPgv7mOkX2foJ6pkk
	IYFLwy3yN0vngO3D4hDD4YSHZUz7ItU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-zefpnb56NCyGkOKj-lMNgw-1; Thu, 20 Feb 2020 10:49:29 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D46F800D53;
	Thu, 20 Feb 2020 15:49:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EF928ECFC;
	Thu, 20 Feb 2020 15:49:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4CB8918034E9;
	Thu, 20 Feb 2020 15:49:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01KFnL6o027651 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 20 Feb 2020 10:49:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 534441049499; Thu, 20 Feb 2020 15:49:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E8B51251C75
	for <cluster-devel@redhat.com>; Thu, 20 Feb 2020 15:49:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB46F800206
	for <cluster-devel@redhat.com>; Thu, 20 Feb 2020 15:49:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-265-tza-2_XtPVeMMjqIwMfNdg-1; Thu, 20 Feb 2020 10:49:15 -0500
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j4o4e-0005Ks-N5; Thu, 20 Feb 2020 15:49:12 +0000
Date: Thu, 20 Feb 2020 07:49:12 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200220154912.GC19577@infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
	<20200219210103.32400-23-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200219210103.32400-23-willy@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-MC-Unique: tza-2_XtPVeMMjqIwMfNdg-1
X-MC-Unique: zefpnb56NCyGkOKj-lMNgw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01KFnL6o027651
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v7 22/24] iomap: Convert from readpages
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wed, Feb 19, 2020 at 01:01:01PM -0800, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>=20
> Use the new readahead operation in iomap.  Convert XFS and ZoneFS to
> use it.
>=20
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  fs/iomap/buffered-io.c | 90 +++++++++++++++---------------------------
>  fs/iomap/trace.h       |  2 +-
>  fs/xfs/xfs_aops.c      | 13 +++---
>  fs/zonefs/super.c      |  7 ++--
>  include/linux/iomap.h  |  3 +-
>  5 files changed, 41 insertions(+), 74 deletions(-)
>=20
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index 31899e6cb0f8..66cf453f4bb7 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -214,9 +214,8 @@ iomap_read_end_io(struct bio *bio)
>  struct iomap_readpage_ctx {
>  =09struct page=09=09*cur_page;
>  =09bool=09=09=09cur_page_in_bio;
> -=09bool=09=09=09is_readahead;
>  =09struct bio=09=09*bio;
> -=09struct list_head=09*pages;
> +=09struct readahead_control *rac;
>  };
> =20
>  static void
> @@ -307,11 +306,11 @@ iomap_readpage_actor(struct inode *inode, loff_t po=
s, loff_t length, void *data,
>  =09=09if (ctx->bio)
>  =09=09=09submit_bio(ctx->bio);
> =20
> -=09=09if (ctx->is_readahead) /* same as readahead_gfp_mask */
> +=09=09if (ctx->rac) /* same as readahead_gfp_mask */
>  =09=09=09gfp |=3D __GFP_NORETRY | __GFP_NOWARN;
>  =09=09ctx->bio =3D bio_alloc(gfp, min(BIO_MAX_PAGES, nr_vecs));
>  =09=09ctx->bio->bi_opf =3D REQ_OP_READ;
> -=09=09if (ctx->is_readahead)
> +=09=09if (ctx->rac)
>  =09=09=09ctx->bio->bi_opf |=3D REQ_RAHEAD;
>  =09=09ctx->bio->bi_iter.bi_sector =3D sector;
>  =09=09bio_set_dev(ctx->bio, iomap->bdev);
> @@ -367,36 +366,8 @@ iomap_readpage(struct page *page, const struct iomap=
_ops *ops)
>  }
>  EXPORT_SYMBOL_GPL(iomap_readpage);
> =20
> -static struct page *
> -iomap_next_page(struct inode *inode, struct list_head *pages, loff_t pos=
,
> -=09=09loff_t length, loff_t *done)
> -{
> -=09while (!list_empty(pages)) {
> -=09=09struct page *page =3D lru_to_page(pages);
> -
> -=09=09if (page_offset(page) >=3D (u64)pos + length)
> -=09=09=09break;
> -
> -=09=09list_del(&page->lru);
> -=09=09if (!add_to_page_cache_lru(page, inode->i_mapping, page->index,
> -=09=09=09=09GFP_NOFS))
> -=09=09=09return page;
> -
> -=09=09/*
> -=09=09 * If we already have a page in the page cache at index we are
> -=09=09 * done.  Upper layers don't care if it is uptodate after the
> -=09=09 * readpages call itself as every page gets checked again once
> -=09=09 * actually needed.
> -=09=09 */
> -=09=09*done +=3D PAGE_SIZE;
> -=09=09put_page(page);
> -=09}
> -
> -=09return NULL;
> -}
> -
>  static loff_t
> -iomap_readpages_actor(struct inode *inode, loff_t pos, loff_t length,
> +iomap_readahead_actor(struct inode *inode, loff_t pos, loff_t length,
>  =09=09void *data, struct iomap *iomap, struct iomap *srcmap)
>  {
>  =09struct iomap_readpage_ctx *ctx =3D data;
> @@ -404,10 +375,7 @@ iomap_readpages_actor(struct inode *inode, loff_t po=
s, loff_t length,
> =20
>  =09while (done < length) {
>  =09=09if (!ctx->cur_page) {
> -=09=09=09ctx->cur_page =3D iomap_next_page(inode, ctx->pages,
> -=09=09=09=09=09pos, length, &done);
> -=09=09=09if (!ctx->cur_page)
> -=09=09=09=09break;
> +=09=09=09ctx->cur_page =3D readahead_page(ctx->rac);
>  =09=09=09ctx->cur_page_in_bio =3D false;
>  =09=09}
>  =09=09ret =3D iomap_readpage_actor(inode, pos + done, length - done,
> @@ -431,44 +399,48 @@ iomap_readpages_actor(struct inode *inode, loff_t p=
os, loff_t length,
>  =09return done;
>  }
> =20
> -int
> -iomap_readpages(struct address_space *mapping, struct list_head *pages,
> -=09=09unsigned nr_pages, const struct iomap_ops *ops)
> +/**
> + * iomap_readahead - Attempt to read pages from a file.
> + * @rac: Describes the pages to be read.
> + * @ops: The operations vector for the filesystem.
> + *
> + * This function is for filesystems to call to implement their readahead
> + * address_space operation.
> + *
> + * Context: The file is pinned by the caller, and the pages to be read a=
re
> + * all locked and have an elevated refcount.  This function will unlock
> + * the pages (once I/O has completed on them, or I/O has been determined=
 to
> + * not be necessary).  It will also decrease the refcount once the pages
> + * have been submitted for I/O.  After this point, the page may be remov=
ed
> + * from the page cache, and should not be referenced.
> + */

Isn't the context documentation something that belongs into the aop
documentation?  I've never really seen the value of duplicating this
information in method instances, as it is just bound to be out of date
rather sooner than later.


