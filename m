Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B59F81949
	for <lists+cluster-devel@lfdr.de>; Mon,  5 Aug 2019 14:27:58 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E50823CA03;
	Mon,  5 Aug 2019 12:27:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9ABC760605;
	Mon,  5 Aug 2019 12:27:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4835C18089C8;
	Mon,  5 Aug 2019 12:27:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x75CRZfe016920 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 5 Aug 2019 08:27:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D23235D713; Mon,  5 Aug 2019 12:27:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD6165D6C8
	for <cluster-devel@redhat.com>; Mon,  5 Aug 2019 12:27:33 +0000 (UTC)
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
	[209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7D6933DE04
	for <cluster-devel@redhat.com>; Mon,  5 Aug 2019 12:27:33 +0000 (UTC)
Received: by mail-ot1-f72.google.com with SMTP id l7so46128347otj.16
	for <cluster-devel@redhat.com>; Mon, 05 Aug 2019 05:27:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KVCEhbTn/48JXYgq2Q8G3IwBgkUowoGCyifyVUUVu/k=;
	b=emG47D8kRoj37FNrLQkiT+4F7YmzGE3kA81t3f+WnaOOKph0C1tyIOwJfBiuF3QToN
	b9DxD91R6CjuSaozWQhmyY2odpWbR5YZPeWY8rrFrEvmIDi2D7Gery1rSKnQNH2zjl3H
	4HXRfW3bbNLoHTA13A7+G1Sj9DyD16zcrO3295nGbGGO1HTQqVHaVEww0vmkPQs9Ifpv
	ShiclKT4JKQTHDl8MftaMDXrAevAlKcJM/L2raoI3nh9ky4lk2X1E9ETwxDfTEVb/7lY
	q1tfWZ7AGP+nEU2YCqB2yp9MOsK5FdfXCxXqdE9FVx8a3cX8YYpBcji0efnipD+6RQyH
	5VEA==
X-Gm-Message-State: APjAAAUFuhJ9VdqlB8ooF8/iWAvvPSNv/Yz7xocfSsDzqOHolvSTIyiX
	ip87i3m+K7Jxe0PD8JT7kYMWqY9MHUH8dxHxrvZZHvZVBe0uFku20Qoq30C+05TeFrnfpXA25z8
	wva1+5cr8dCnsMgqmcZsG9jlH3nYTAr3MTYinfw==
X-Received: by 2002:aca:b58b:: with SMTP id
	e133mr10708481oif.147.1565008052941; 
	Mon, 05 Aug 2019 05:27:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwFMtzO9uo4q0Wf+7fEJAonIpdFGoXUYPhdGfhe2BMn308FCVJ6/AiRf1m/OP/8hU8N0O/gg0P0VvvTtKCA2y0=
X-Received: by 2002:aca:b58b:: with SMTP id
	e133mr10708475oif.147.1565008052686; 
	Mon, 05 Aug 2019 05:27:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190701215439.19162-1-hch@lst.de>
	<20190701215439.19162-16-hch@lst.de>
In-Reply-To: <20190701215439.19162-16-hch@lst.de>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 5 Aug 2019 14:27:21 +0200
Message-ID: <CAHc6FU4wtDwLv_TU6xydtO2h8P8jE1ddPjVqs8=NDFFDNEpiLA@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	cluster-devel <cluster-devel@redhat.com>,
	"Darrick J . Wong" <darrick.wong@oracle.com>
Subject: Re: [Cluster-devel] [PATCH 15/15] gfs2: use iomap for buffered I/O
 in ordered and writeback mode
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Mon, 05 Aug 2019 12:27:57 +0000 (UTC)

Christoph,

thanks again for this patch and the rest of the patch queue. There's
one minor bug here (see below). With that and the gfs2_walk_metadata
fix I've just posted to cluster-devel, this is now all working nicely.

On Mon, 1 Jul 2019 at 23:56, Christoph Hellwig <hch@lst.de> wrote:
> Switch to using the iomap readpage and writepage helpers for all I/O in
> the ordered and writeback modes, and thus eliminate using buffer_heads
> for I/O in these cases.  The journaled data mode is left untouched.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/gfs2/aops.c | 59 +++++++++++++++++++++++---------------------------
>  fs/gfs2/bmap.c | 47 ++++++++++++++++++++++++++++++----------
>  fs/gfs2/bmap.h |  1 +
>  3 files changed, 63 insertions(+), 44 deletions(-)
>
> diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
> index 15a234fb8f88..9cdd61a44379 100644
> --- a/fs/gfs2/aops.c
> +++ b/fs/gfs2/aops.c
> @@ -91,22 +91,13 @@ static int gfs2_writepage(struct page *page, struct writeback_control *wbc)
>         struct inode *inode = page->mapping->host;
>         struct gfs2_inode *ip = GFS2_I(inode);
>         struct gfs2_sbd *sdp = GFS2_SB(inode);
> -       loff_t i_size = i_size_read(inode);
> -       pgoff_t end_index = i_size >> PAGE_SHIFT;
> -       unsigned offset;
> +       struct iomap_writepage_ctx wpc = { };
>
>         if (gfs2_assert_withdraw(sdp, gfs2_glock_is_held_excl(ip->i_gl)))
>                 goto out;
>         if (current->journal_info)
>                 goto redirty;
> -       /* Is the page fully outside i_size? (truncate in progress) */
> -       offset = i_size & (PAGE_SIZE-1);
> -       if (page->index > end_index || (page->index == end_index && !offset)) {
> -               page->mapping->a_ops->invalidatepage(page, 0, PAGE_SIZE);
> -               goto out;
> -       }
> -
> -       return nobh_writepage(page, gfs2_get_block_noalloc, wbc);
> +       return iomap_writepage(page, wbc, &wpc, &gfs2_writeback_ops);
>
>  redirty:
>         redirty_page_for_writepage(wbc, page);
> @@ -210,7 +201,8 @@ static int gfs2_writepages(struct address_space *mapping,
>                            struct writeback_control *wbc)
>  {
>         struct gfs2_sbd *sdp = gfs2_mapping2sbd(mapping);
> -       int ret = mpage_writepages(mapping, wbc, gfs2_get_block_noalloc);
> +       struct iomap_writepage_ctx wpc = { };
> +       int ret;
>
>         /*
>          * Even if we didn't write any pages here, we might still be holding
> @@ -218,9 +210,9 @@ static int gfs2_writepages(struct address_space *mapping,
>          * want balance_dirty_pages() to loop indefinitely trying to write out
>          * pages held in the ail that it can't find.
>          */
> +       ret = iomap_writepages(mapping, wbc, &wpc, &gfs2_writeback_ops);
>         if (ret == 0)
>                 set_bit(SDF_FORCE_AIL_FLUSH, &sdp->sd_flags);
> -
>         return ret;
>  }
>
> @@ -469,7 +461,6 @@ static int stuffed_readpage(struct gfs2_inode *ip, struct page *page)
>         return 0;
>  }
>
> -
>  /**
>   * __gfs2_readpage - readpage
>   * @file: The file to read a page for
> @@ -479,16 +470,15 @@ static int stuffed_readpage(struct gfs2_inode *ip, struct page *page)
>   * reading code as in that case we already hold the glock. Also it's
>   * called by gfs2_readpage() once the required lock has been granted.
>   */
> -
>  static int __gfs2_readpage(void *file, struct page *page)
>  {
> -       struct gfs2_inode *ip = GFS2_I(page->mapping->host);
> -       struct gfs2_sbd *sdp = GFS2_SB(page->mapping->host);
> -
> +       struct inode *inode = page->mapping->host;
> +       struct gfs2_inode *ip = GFS2_I(inode);
> +       struct gfs2_sbd *sdp = GFS2_SB(inode);
>         int error;
>
> -       if (i_blocksize(page->mapping->host) == PAGE_SIZE &&
> -           !page_has_buffers(page)) {
> +       if (!gfs2_is_jdata(ip) ||
> +           (i_blocksize(inode) == PAGE_SIZE && !page_has_buffers(page))) {
>                 error = iomap_readpage(page, &gfs2_iomap_ops);
>         } else if (gfs2_is_stuffed(ip)) {
>                 error = stuffed_readpage(ip, page);
> @@ -609,8 +599,12 @@ static int gfs2_readpages(struct file *file, struct address_space *mapping,
>         ret = gfs2_glock_nq(&gh);
>         if (unlikely(ret))
>                 goto out_uninit;
> -       if (!gfs2_is_stuffed(ip))
> +       if (gfs2_is_stuffed(ip))
> +               ;
> +       else if (gfs2_is_jdata(ip))
>                 ret = mpage_readpages(mapping, pages, nr_pages, gfs2_block_map);
> +       else
> +               ret = iomap_readpages(mapping, pages, nr_pages, &gfs2_iomap_ops);
>         gfs2_glock_dq(&gh);
>  out_uninit:
>         gfs2_holder_uninit(&gh);
> @@ -827,17 +821,18 @@ int gfs2_releasepage(struct page *page, gfp_t gfp_mask)
>  }
>
>  static const struct address_space_operations gfs2_aops = {
> -       .writepage = gfs2_writepage,
> -       .writepages = gfs2_writepages,
> -       .readpage = gfs2_readpage,
> -       .readpages = gfs2_readpages,
> -       .bmap = gfs2_bmap,
> -       .invalidatepage = gfs2_invalidatepage,
> -       .releasepage = gfs2_releasepage,
> -       .direct_IO = noop_direct_IO,
> -       .migratepage = buffer_migrate_page,
> -       .is_partially_uptodate = block_is_partially_uptodate,
> -       .error_remove_page = generic_error_remove_page,
> +       .writepage              = gfs2_writepage,
> +       .writepages             = gfs2_writepages,
> +       .readpage               = gfs2_readpage,
> +       .readpages              = gfs2_readpages,
> +       .set_page_dirty         = iomap_set_page_dirty,
> +       .releasepage            = iomap_releasepage,
> +       .invalidatepage         = iomap_invalidatepage,
> +       .bmap                   = gfs2_bmap,
> +       .direct_IO              = noop_direct_IO,
> +       .migratepage            = iomap_migrate_page,
> +       .is_partially_uptodate  = iomap_is_partially_uptodate,
> +       .error_remove_page      = generic_error_remove_page,
>  };
>
>  static const struct address_space_operations gfs2_jdata_aops = {
> diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
> index b7bd811872cb..b8d795d277c9 100644
> --- a/fs/gfs2/bmap.c
> +++ b/fs/gfs2/bmap.c
> @@ -56,7 +56,6 @@ static int gfs2_unstuffer_page(struct gfs2_inode *ip, struct buffer_head *dibh,
>                                u64 block, struct page *page)
>  {
>         struct inode *inode = &ip->i_inode;
> -       struct buffer_head *bh;
>         int release = 0;
>
>         if (!page || page->index) {
> @@ -80,20 +79,20 @@ static int gfs2_unstuffer_page(struct gfs2_inode *ip, struct buffer_head *dibh,
>                 SetPageUptodate(page);
>         }
>
> -       if (!page_has_buffers(page))
> -               create_empty_buffers(page, BIT(inode->i_blkbits),
> -                                    BIT(BH_Uptodate));
> +       if (gfs2_is_jdata(ip)) {
> +               struct buffer_head *bh;
>
> -       bh = page_buffers(page);
> +               if (!page_has_buffers(page))
> +                       create_empty_buffers(page, BIT(inode->i_blkbits),
> +                                            BIT(BH_Uptodate));
>
> -       if (!buffer_mapped(bh))
> -               map_bh(bh, inode->i_sb, block);
> +               bh = page_buffers(page);
> +               if (!buffer_mapped(bh))
> +                       map_bh(bh, inode->i_sb, block);
>
> -       set_buffer_uptodate(bh);
> -       if (gfs2_is_jdata(ip))
> +               set_buffer_uptodate(bh);
>                 gfs2_trans_add_data(ip->i_gl, bh);
> -       else {
> -               mark_buffer_dirty(bh);

We need to turn mark_buffer_dirty(bh) into set_page_dirty(page) here
instead of just removing it.

> +       } else {
>                 gfs2_ordered_add_inode(ip);
>         }
>
> @@ -1127,7 +1126,8 @@ static int gfs2_iomap_begin(struct inode *inode, loff_t pos, loff_t length,
>         struct metapath mp = { .mp_aheight = 1, };
>         int ret;
>
> -       iomap->flags |= IOMAP_F_BUFFER_HEAD;
> +       if (gfs2_is_jdata(ip))
> +               iomap->flags |= IOMAP_F_BUFFER_HEAD;
>
>         trace_gfs2_iomap_start(ip, pos, length, flags);
>         if ((flags & IOMAP_WRITE) && !(flags & IOMAP_DIRECT)) {
> @@ -2431,3 +2431,26 @@ int __gfs2_punch_hole(struct file *file, loff_t offset, loff_t length)
>                 gfs2_trans_end(sdp);
>         return error;
>  }
> +
> +static int gfs2_map_blocks(struct iomap_writepage_ctx *wpc, struct inode *inode,
> +               loff_t offset)
> +{
> +       struct metapath mp = { .mp_aheight = 1, };
> +       int ret;
> +
> +       if (WARN_ON_ONCE(gfs2_is_stuffed(GFS2_I(inode))))
> +               return -EIO;
> +
> +       if (offset >= wpc->iomap.offset &&
> +           offset < wpc->iomap.offset + wpc->iomap.length)
> +               return 0;
> +
> +       memset(&wpc->iomap, 0, sizeof(wpc->iomap));
> +       ret = gfs2_iomap_get(inode, offset, INT_MAX, 0, &wpc->iomap, &mp);
> +       release_metapath(&mp);
> +       return ret;
> +}
> +
> +const struct iomap_writeback_ops gfs2_writeback_ops = {
> +       .map_blocks             = gfs2_map_blocks,
> +};
> diff --git a/fs/gfs2/bmap.h b/fs/gfs2/bmap.h
> index b88fd45ab79f..aed4632d47d3 100644
> --- a/fs/gfs2/bmap.h
> +++ b/fs/gfs2/bmap.h
> @@ -44,6 +44,7 @@ static inline void gfs2_write_calc_reserv(const struct gfs2_inode *ip,
>  }
>
>  extern const struct iomap_ops gfs2_iomap_ops;
> +extern const struct iomap_writeback_ops gfs2_writeback_ops;
>
>  extern int gfs2_unstuff_dinode(struct gfs2_inode *ip, struct page *page);
>  extern int gfs2_block_map(struct inode *inode, sector_t lblock,
> --
> 2.20.1
>

Thanks,
Andreas

