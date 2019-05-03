Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A6912CE7
	for <lists+cluster-devel@lfdr.de>; Fri,  3 May 2019 13:50:16 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1D9E2F74CF;
	Fri,  3 May 2019 11:50:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 18D56608C7;
	Fri,  3 May 2019 11:50:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1726041F3D;
	Fri,  3 May 2019 11:50:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x43Bo6KH001798 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 3 May 2019 07:50:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0038B2C168; Fri,  3 May 2019 11:50:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E92242C15B
	for <cluster-devel@redhat.com>; Fri,  3 May 2019 11:50:03 +0000 (UTC)
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
	[209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7685583F45
	for <cluster-devel@redhat.com>; Fri,  3 May 2019 11:50:03 +0000 (UTC)
Received: by mail-ot1-f70.google.com with SMTP id h4so2507953otl.7
	for <cluster-devel@redhat.com>; Fri, 03 May 2019 04:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=E6aLi/2HdrNIxROzJ+pRP11jgWTOep+9kKPkPCKpTSg=;
	b=uTbMs5V5ZBh2yYS6ROYCLSAmUUoaoePPyPO4EVlc6bttzeKu+PGWmUgt7ucXKZONQy
	klXOAfTX/Mf29LYu/5MCm9L76nf0pP2g7P8EMdt68BuRfiPXzrtqqaWelJJDu+yBSHgO
	80RlnM/dzt4wwaXtwrvUtxL5gYZuWHOwS+u4KVlw5HSXfqvegUXE+MtbfgcjGs0MYwD3
	RqWh93t21c1mZvoITCbLnfxnZxuidu/zmozQlnUwCBTTh9hQxheRsmaP56X+Ya4ceWt4
	LEZ+8kb0Iq8CbUr+p0GZXCwMb2Oz8T313LQr+mY3fb7Dogl09tWFaD6s0iZzqIhO1cJN
	z/oA==
X-Gm-Message-State: APjAAAUzMF+Qpviin4fSSZP/46Nz4xapEyTrr46NiVJQicNusPyPEHwC
	12fvqcJ6iBa+KlApy8kvqZ05bx6K1X3zV5EUF2nZfScvc3IOzVn/HSDNDB6pBSdzduhLG5p1hNB
	V0vVBILa6+aEW/EsF/XvB8tYasdtiBTvdz4t4qw==
X-Received: by 2002:aca:f086:: with SMTP id o128mr5329795oih.101.1556884202663;
	Fri, 03 May 2019 04:50:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxxgsB+9Pq0sCWnmduIx5gNrbYg0LrxkD89VhTXNRj9H2WVJEMAyrwU1bEFm8R+hO59Ums/91LyJfuio5iBV1Y=
X-Received: by 2002:aca:f086:: with SMTP id o128mr5329772oih.101.1556884202137;
	Fri, 03 May 2019 04:50:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190502191740.26169-1-adas@redhat.com>
In-Reply-To: <20190502191740.26169-1-adas@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 3 May 2019 13:49:50 +0200
Message-ID: <CAHc6FU4qf8iXZN3LB0MUhTaDWVL5-hZGN5uq8wcjqVQRJFvqBA@mail.gmail.com>
To: Abhi Das <adas@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH] gfs2: read journal in large chunks to
 locate the head
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Fri, 03 May 2019 11:50:15 +0000 (UTC)

On Thu, 2 May 2019 at 21:17, Abhi Das <adas@redhat.com> wrote:
> Use bio(s) to read in the journal sequentially in large chunks and
> locate the head of the journal.

I've tweaked the commit message a bit before pushing this into for-next.

Thanks,
Andreas

> Signed-off-by: Abhi Das <adas@redhat.com>
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> ---
>  fs/gfs2/glops.c      |   3 +-
>  fs/gfs2/log.c        |   4 +-
>  fs/gfs2/lops.c       | 212 +++++++++++++++++++++++++++++++++++++++++--
>  fs/gfs2/lops.h       |   4 +-
>  fs/gfs2/ops_fstype.c |   3 +-
>  fs/gfs2/recovery.c   | 125 +------------------------
>  fs/gfs2/recovery.h   |   2 -
>  fs/gfs2/super.c      |   5 +-
>  8 files changed, 219 insertions(+), 139 deletions(-)
>
> diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
> index 78510ab91835..24ada3ccc525 100644
> --- a/fs/gfs2/glops.c
> +++ b/fs/gfs2/glops.c
> @@ -28,6 +28,7 @@
>  #include "util.h"
>  #include "trans.h"
>  #include "dir.h"
> +#include "lops.h"
>
>  struct workqueue_struct *gfs2_freeze_wq;
>
> @@ -531,7 +532,7 @@ static int freeze_go_xmote_bh(struct gfs2_glock *gl, struct gfs2_holder *gh)
>         if (test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags)) {
>                 j_gl->gl_ops->go_inval(j_gl, DIO_METADATA);
>
> -               error = gfs2_find_jhead(sdp->sd_jdesc, &head);
> +               error = gfs2_find_jhead(sdp->sd_jdesc, &head, false);
>                 if (error)
>                         gfs2_consist(sdp);
>                 if (!(head.lh_flags & GFS2_LOG_HEAD_UNMOUNT))
> diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
> index a7febb4bd400..a2e1df488df0 100644
> --- a/fs/gfs2/log.c
> +++ b/fs/gfs2/log.c
> @@ -744,7 +744,7 @@ void gfs2_write_log_header(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd,
>         lh->lh_crc = cpu_to_be32(crc);
>
>         gfs2_log_write(sdp, page, sb->s_blocksize, 0, dblock);
> -       gfs2_log_submit_bio(&sdp->sd_log_bio, REQ_OP_WRITE, op_flags);
> +       gfs2_log_submit_bio(&sdp->sd_log_bio, REQ_OP_WRITE | op_flags);
>         log_flush_wait(sdp);
>  }
>
> @@ -821,7 +821,7 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
>
>         gfs2_ordered_write(sdp);
>         lops_before_commit(sdp, tr);
> -       gfs2_log_submit_bio(&sdp->sd_log_bio, REQ_OP_WRITE, 0);
> +       gfs2_log_submit_bio(&sdp->sd_log_bio, REQ_OP_WRITE);
>
>         if (sdp->sd_log_head != sdp->sd_log_flush_head) {
>                 log_flush_wait(sdp);
> diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
> index 6af6a3cea967..ce048a9e058d 100644
> --- a/fs/gfs2/lops.c
> +++ b/fs/gfs2/lops.c
> @@ -17,7 +17,9 @@
>  #include <linux/bio.h>
>  #include <linux/fs.h>
>  #include <linux/list_sort.h>
> +#include <linux/blkdev.h>
>
> +#include "bmap.h"
>  #include "dir.h"
>  #include "gfs2.h"
>  #include "incore.h"
> @@ -194,7 +196,6 @@ static void gfs2_end_log_write_bh(struct gfs2_sbd *sdp,
>  /**
>   * gfs2_end_log_write - end of i/o to the log
>   * @bio: The bio
> - * @error: Status of i/o request
>   *
>   * Each bio_vec contains either data from the pagecache or data
>   * relating to the log itself. Here we iterate over the bio_vec
> @@ -232,20 +233,19 @@ static void gfs2_end_log_write(struct bio *bio)
>  /**
>   * gfs2_log_submit_bio - Submit any pending log bio
>   * @biop: Address of the bio pointer
> - * @op: REQ_OP
> - * @op_flags: req_flag_bits
> + * @opf: REQ_OP | op_flags
>   *
>   * Submit any pending part-built or full bio to the block device. If
>   * there is no pending bio, then this is a no-op.
>   */
>
> -void gfs2_log_submit_bio(struct bio **biop, int op, int op_flags)
> +void gfs2_log_submit_bio(struct bio **biop, int opf)
>  {
>         struct bio *bio = *biop;
>         if (bio) {
>                 struct gfs2_sbd *sdp = bio->bi_private;
>                 atomic_inc(&sdp->sd_log_in_flight);
> -               bio_set_op_attrs(bio, op, op_flags);
> +               bio->bi_opf = opf;
>                 submit_bio(bio);
>                 *biop = NULL;
>         }
> @@ -306,7 +306,7 @@ static struct bio *gfs2_log_get_bio(struct gfs2_sbd *sdp, u64 blkno,
>                 nblk >>= sdp->sd_fsb2bb_shift;
>                 if (blkno == nblk && !flush)
>                         return bio;
> -               gfs2_log_submit_bio(biop, op, 0);
> +               gfs2_log_submit_bio(biop, op);
>         }
>
>         *biop = gfs2_log_alloc_bio(sdp, blkno, end_io);
> @@ -377,6 +377,206 @@ void gfs2_log_write_page(struct gfs2_sbd *sdp, struct page *page)
>                        gfs2_log_bmap(sdp));
>  }
>
> +/**
> + * gfs2_end_log_read - end I/O callback for reads from the log
> + * @bio: The bio
> + *
> + * Simply unlock the pages in the bio. The main thread will wait on them and
> + * process them in order as necessary.
> + */
> +
> +static void gfs2_end_log_read(struct bio *bio)
> +{
> +       struct page *page;
> +       struct bio_vec *bvec;
> +       int i;
> +       struct bvec_iter_all iter_all;
> +
> +       bio_for_each_segment_all(bvec, bio, i, iter_all) {
> +               page = bvec->bv_page;
> +               if (bio->bi_status) {
> +                       int err = blk_status_to_errno(bio->bi_status);
> +
> +                       SetPageError(page);
> +                       mapping_set_error(page->mapping, err);
> +               }
> +               unlock_page(page);
> +       }
> +
> +       bio_put(bio);
> +}
> +
> +/**
> + * gfs2_jhead_pg_srch - Look for the journal head in a given page.
> + * @jd: The journal descriptor
> + * @page: The page to look in
> + *
> + * Returns: 1 if found, 0 otherwise.
> + */
> +
> +static bool gfs2_jhead_pg_srch(struct gfs2_jdesc *jd,
> +                             struct gfs2_log_header_host *head,
> +                             struct page *page)
> +{
> +       struct gfs2_sbd *sdp = GFS2_SB(jd->jd_inode);
> +       struct gfs2_log_header_host uninitialized_var(lh);
> +       void *kaddr = kmap_atomic(page);
> +       unsigned int offset;
> +       bool ret = false;
> +
> +       for (offset = 0; offset < PAGE_SIZE; offset += sdp->sd_sb.sb_bsize) {
> +               if (!__get_log_header(sdp, kaddr + offset, 0, &lh)) {
> +                       if (lh.lh_sequence > head->lh_sequence)
> +                               *head = lh;
> +                       else {
> +                               ret = true;
> +                               break;
> +                       }
> +               }
> +       }
> +       kunmap_atomic(kaddr);
> +       return ret;
> +}
> +
> +/**
> + * gfs2_jhead_process_page - Search/cleanup a page
> + * @jd: The journal descriptor
> + * @index: Index of the page to look into
> + * @done: If set, perform only cleanup, else search and set if found.
> + *
> + * Find the page with 'index' in the journal's mapping. Search the page for
> + * the journal head if requested (cleanup == false). Release refs on the
> + * page so the page cache can reclaim it (put_page() twice). We grabbed a
> + * reference on this page two times, first when we did a find_or_create_page()
> + * to obtain the page to add it to the bio and second when we do a
> + * find_get_page() here to get the page to wait on while I/O on it is being
> + * completed.
> + * This function is also used to free up a page we might've grabbed but not
> + * used. Maybe we added it to a bio, but not submitted it for I/O. Or we
> + * submitted the I/O, but we already found the jhead so we only need to drop
> + * our references to the page.
> + */
> +
> +static void gfs2_jhead_process_page(struct gfs2_jdesc *jd, unsigned long index,
> +                                   struct gfs2_log_header_host *head,
> +                                   bool *done)
> +{
> +       struct page *page;
> +
> +       page = find_get_page(jd->jd_inode->i_mapping, index);
> +       wait_on_page_locked(page);
> +
> +       if (PageError(page))
> +               *done = true;
> +
> +       if (!*done)
> +               *done = gfs2_jhead_pg_srch(jd, head, page);
> +
> +       put_page(page); /* Once for find_get_page */
> +       put_page(page); /* Once more for find_or_create_page */
> +}
> +
> +/**
> + * gfs2_find_jhead - find the head of a log
> + * @jd: The journal descriptor
> + * @head: The log descriptor for the head of the log is returned here
> + *
> + * Do a search of a journal by reading it in large chunks using bios and find
> + * the valid log entry with the highest sequence number.  (i.e. the log head)
> + *
> + * Returns: 0 on success, errno otherwise
> + */
> +int gfs2_find_jhead(struct gfs2_jdesc *jd, struct gfs2_log_header_host *head,
> +                   bool keep_cache)
> +{
> +       struct gfs2_sbd *sdp = GFS2_SB(jd->jd_inode);
> +       struct address_space *mapping = jd->jd_inode->i_mapping;
> +       unsigned int block = 0, blocks_submitted = 0, blocks_read = 0;
> +       unsigned int bsize = sdp->sd_sb.sb_bsize;
> +       unsigned int bsize_shift = sdp->sd_sb.sb_bsize_shift;
> +       unsigned int shift = PAGE_SHIFT - bsize_shift;
> +       unsigned int readhead_blocks = BIO_MAX_PAGES << shift;
> +       struct gfs2_journal_extent *je;
> +       int sz, ret = 0;
> +       struct bio *bio = NULL;
> +       struct page *page = NULL;
> +       bool done = false;
> +       errseq_t since;
> +
> +       memset(head, 0, sizeof(*head));
> +       if (list_empty(&jd->extent_list))
> +               gfs2_map_journal_extents(sdp, jd);
> +
> +       since = filemap_sample_wb_err(mapping);
> +       list_for_each_entry(je, &jd->extent_list, list) {
> +               for (; block < je->lblock + je->blocks; block++) {
> +                       u64 dblock;
> +
> +                       if (!page) {
> +                               page = find_or_create_page(mapping,
> +                                               block >> shift, GFP_NOFS);
> +                               if (!page) {
> +                                       ret = -ENOMEM;
> +                                       done = true;
> +                                       goto out;
> +                               }
> +                       }
> +
> +                       if (bio) {
> +                               unsigned int off;
> +
> +                               off = (block << bsize_shift) & ~PAGE_MASK;
> +                               sz = bio_add_page(bio, page, bsize, off);
> +                               if (sz == bsize) { /* block added */
> +                                       if (off + bsize == PAGE_SIZE) {
> +                                               page = NULL;
> +                                               goto page_added;
> +                                       }
> +                                       continue;
> +                               }
> +                               blocks_submitted = block + 1;
> +                               submit_bio(bio);
> +                               bio = NULL;
> +                       }
> +
> +                       dblock = je->dblock + (block - je->lblock);
> +                       bio = gfs2_log_alloc_bio(sdp, dblock, gfs2_end_log_read);
> +                       bio->bi_opf = REQ_OP_READ;
> +                       sz = bio_add_page(bio, page, bsize, 0);
> +                       gfs2_assert_warn(sdp, sz == bsize);
> +                       if (bsize == PAGE_SIZE)
> +                               page = NULL;
> +
> +page_added:
> +                       if (blocks_submitted < blocks_read + readhead_blocks) {
> +                               /* Keep at least one bio in flight */
> +                               continue;
> +                       }
> +
> +                       gfs2_jhead_process_page(jd, blocks_read >> shift, head, &done);
> +                       blocks_read += PAGE_SIZE >> bsize_shift;
> +                       if (done)
> +                               goto out;  /* found */
> +               }
> +       }
> +
> +out:
> +       if (bio)
> +               submit_bio(bio);
> +       while (blocks_read < block) {
> +               gfs2_jhead_process_page(jd, blocks_read >> shift, head, &done);
> +               blocks_read += PAGE_SIZE >> bsize_shift;
> +       }
> +
> +       if (!ret)
> +               ret = filemap_check_wb_err(mapping, since);
> +
> +       if (!keep_cache)
> +               truncate_inode_pages(mapping, 0);
> +
> +       return ret;
> +}
> +
>  static struct page *gfs2_get_log_desc(struct gfs2_sbd *sdp, u32 ld_type,
>                                       u32 ld_length, u32 ld_data1)
>  {
> diff --git a/fs/gfs2/lops.h b/fs/gfs2/lops.h
> index 320fbf28d2fb..f195ffb435ac 100644
> --- a/fs/gfs2/lops.h
> +++ b/fs/gfs2/lops.h
> @@ -25,8 +25,10 @@ extern u64 gfs2_log_bmap(struct gfs2_sbd *sdp);
>  extern void gfs2_log_write(struct gfs2_sbd *sdp, struct page *page,
>                            unsigned size, unsigned offset, u64 blkno);
>  extern void gfs2_log_write_page(struct gfs2_sbd *sdp, struct page *page);
> -extern void gfs2_log_submit_bio(struct bio **biop, int op, int op_flags);
> +extern void gfs2_log_submit_bio(struct bio **biop, int opf);
>  extern void gfs2_pin(struct gfs2_sbd *sdp, struct buffer_head *bh);
> +extern int gfs2_find_jhead(struct gfs2_jdesc *jd,
> +                          struct gfs2_log_header_host *head, bool keep_cache);
>
>  static inline unsigned int buf_limit(struct gfs2_sbd *sdp)
>  {
> diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
> index abfaecde0e3d..46f6615eaf12 100644
> --- a/fs/gfs2/ops_fstype.c
> +++ b/fs/gfs2/ops_fstype.c
> @@ -41,6 +41,7 @@
>  #include "dir.h"
>  #include "meta_io.h"
>  #include "trace_gfs2.h"
> +#include "lops.h"
>
>  #define DO 0
>  #define UNDO 1
> @@ -616,7 +617,7 @@ static int check_journal_clean(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd)
>                 fs_err(sdp, "Error checking journal for spectator mount.\n");
>                 goto out_unlock;
>         }
> -       error = gfs2_find_jhead(jd, &head);
> +       error = gfs2_find_jhead(jd, &head, false);
>         if (error) {
>                 fs_err(sdp, "Error parsing journal for spectator mount.\n");
>                 goto out_unlock;
> diff --git a/fs/gfs2/recovery.c b/fs/gfs2/recovery.c
> index fa575d1676b9..389b3ef77e20 100644
> --- a/fs/gfs2/recovery.c
> +++ b/fs/gfs2/recovery.c
> @@ -181,129 +181,6 @@ static int get_log_header(struct gfs2_jdesc *jd, unsigned int blk,
>         return error;
>  }
>
> -/**
> - * find_good_lh - find a good log header
> - * @jd: the journal
> - * @blk: the segment to start searching from
> - * @lh: the log header to fill in
> - * @forward: if true search forward in the log, else search backward
> - *
> - * Call get_log_header() to get a log header for a segment, but if the
> - * segment is bad, either scan forward or backward until we find a good one.
> - *
> - * Returns: errno
> - */
> -
> -static int find_good_lh(struct gfs2_jdesc *jd, unsigned int *blk,
> -                       struct gfs2_log_header_host *head)
> -{
> -       unsigned int orig_blk = *blk;
> -       int error;
> -
> -       for (;;) {
> -               error = get_log_header(jd, *blk, head);
> -               if (error <= 0)
> -                       return error;
> -
> -               if (++*blk == jd->jd_blocks)
> -                       *blk = 0;
> -
> -               if (*blk == orig_blk) {
> -                       gfs2_consist_inode(GFS2_I(jd->jd_inode));
> -                       return -EIO;
> -               }
> -       }
> -}
> -
> -/**
> - * jhead_scan - make sure we've found the head of the log
> - * @jd: the journal
> - * @head: this is filled in with the log descriptor of the head
> - *
> - * At this point, seg and lh should be either the head of the log or just
> - * before.  Scan forward until we find the head.
> - *
> - * Returns: errno
> - */
> -
> -static int jhead_scan(struct gfs2_jdesc *jd, struct gfs2_log_header_host *head)
> -{
> -       unsigned int blk = head->lh_blkno;
> -       struct gfs2_log_header_host lh;
> -       int error;
> -
> -       for (;;) {
> -               if (++blk == jd->jd_blocks)
> -                       blk = 0;
> -
> -               error = get_log_header(jd, blk, &lh);
> -               if (error < 0)
> -                       return error;
> -               if (error == 1)
> -                       continue;
> -
> -               if (lh.lh_sequence == head->lh_sequence) {
> -                       gfs2_consist_inode(GFS2_I(jd->jd_inode));
> -                       return -EIO;
> -               }
> -               if (lh.lh_sequence < head->lh_sequence)
> -                       break;
> -
> -               *head = lh;
> -       }
> -
> -       return 0;
> -}
> -
> -/**
> - * gfs2_find_jhead - find the head of a log
> - * @jd: the journal
> - * @head: the log descriptor for the head of the log is returned here
> - *
> - * Do a binary search of a journal and find the valid log entry with the
> - * highest sequence number.  (i.e. the log head)
> - *
> - * Returns: errno
> - */
> -
> -int gfs2_find_jhead(struct gfs2_jdesc *jd, struct gfs2_log_header_host *head)
> -{
> -       struct gfs2_log_header_host lh_1, lh_m;
> -       u32 blk_1, blk_2, blk_m;
> -       int error;
> -
> -       blk_1 = 0;
> -       blk_2 = jd->jd_blocks - 1;
> -
> -       for (;;) {
> -               blk_m = (blk_1 + blk_2) / 2;
> -
> -               error = find_good_lh(jd, &blk_1, &lh_1);
> -               if (error)
> -                       return error;
> -
> -               error = find_good_lh(jd, &blk_m, &lh_m);
> -               if (error)
> -                       return error;
> -
> -               if (blk_1 == blk_m || blk_m == blk_2)
> -                       break;
> -
> -               if (lh_1.lh_sequence <= lh_m.lh_sequence)
> -                       blk_1 = blk_m;
> -               else
> -                       blk_2 = blk_m;
> -       }
> -
> -       error = jhead_scan(jd, &lh_1);
> -       if (error)
> -               return error;
> -
> -       *head = lh_1;
> -
> -       return error;
> -}
> -
>  /**
>   * foreach_descriptor - go through the active part of the log
>   * @jd: the journal
> @@ -469,7 +346,7 @@ void gfs2_recover_func(struct work_struct *work)
>         if (error)
>                 goto fail_gunlock_ji;
>
> -       error = gfs2_find_jhead(jd, &head);
> +       error = gfs2_find_jhead(jd, &head, true);
>         if (error)
>                 goto fail_gunlock_ji;
>         t_jhd = ktime_get();
> diff --git a/fs/gfs2/recovery.h b/fs/gfs2/recovery.h
> index 5932d4b6f43e..1831a1974c8c 100644
> --- a/fs/gfs2/recovery.h
> +++ b/fs/gfs2/recovery.h
> @@ -27,8 +27,6 @@ extern int gfs2_revoke_add(struct gfs2_jdesc *jd, u64 blkno, unsigned int where)
>  extern int gfs2_revoke_check(struct gfs2_jdesc *jd, u64 blkno, unsigned int where);
>  extern void gfs2_revoke_clean(struct gfs2_jdesc *jd);
>
> -extern int gfs2_find_jhead(struct gfs2_jdesc *jd,
> -                   struct gfs2_log_header_host *head);
>  extern int gfs2_recover_journal(struct gfs2_jdesc *gfs2_jd, bool wait);
>  extern void gfs2_recover_func(struct work_struct *work);
>  extern int __get_log_header(struct gfs2_sbd *sdp,
> diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
> index ceec631efa49..43e7c2c87014 100644
> --- a/fs/gfs2/super.c
> +++ b/fs/gfs2/super.c
> @@ -45,6 +45,7 @@
>  #include "util.h"
>  #include "sys.h"
>  #include "xattr.h"
> +#include "lops.h"
>
>  #define args_neq(a1, a2, x) ((a1)->ar_##x != (a2)->ar_##x)
>
> @@ -425,7 +426,7 @@ int gfs2_make_fs_rw(struct gfs2_sbd *sdp)
>
>         j_gl->gl_ops->go_inval(j_gl, DIO_METADATA);
>
> -       error = gfs2_find_jhead(sdp->sd_jdesc, &head);
> +       error = gfs2_find_jhead(sdp->sd_jdesc, &head, false);
>         if (error)
>                 goto fail;
>
> @@ -680,7 +681,7 @@ static int gfs2_lock_fs_check_clean(struct gfs2_sbd *sdp,
>                 error = gfs2_jdesc_check(jd);
>                 if (error)
>                         break;
> -               error = gfs2_find_jhead(jd, &lh);
> +               error = gfs2_find_jhead(jd, &lh, false);
>                 if (error)
>                         break;
>                 if (!(lh.lh_flags & GFS2_LOG_HEAD_UNMOUNT)) {
> --
> 2.20.1
>

