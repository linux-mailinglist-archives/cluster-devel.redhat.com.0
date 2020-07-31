Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 9C0A323474C
	for <lists+cluster-devel@lfdr.de>; Fri, 31 Jul 2020 16:04:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596204272;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=cps8/F9QZ13raGQ0LNt7ieXiXD83betUld/eJQwHa/g=;
	b=FCJZvI5SYVsHjbo0oH3M1ZV0JM0fFNr3U2KT+OZKzbCFFjrx76bpHBdv/SegpJzpgLBngL
	W6ZxGLET5D2UODcEbtLwl5GDV+H2DcG6xmZFwVLdTj8aKpYn6mvDXTunz/fv84ieSWlMEP
	ahqK9WWJ+yP17Wt8IIwnyuQRdthFSM0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-G3ifjAHrORG9clh05K8lwA-1; Fri, 31 Jul 2020 10:04:30 -0400
X-MC-Unique: G3ifjAHrORG9clh05K8lwA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55D8719057A0;
	Fri, 31 Jul 2020 14:04:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E2DD860BE2;
	Fri, 31 Jul 2020 14:04:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 10C0B95467;
	Fri, 31 Jul 2020 14:04:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06VE3lW8017283 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 31 Jul 2020 10:03:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C44522023283; Fri, 31 Jul 2020 14:03:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD61F20234B0
	for <cluster-devel@redhat.com>; Fri, 31 Jul 2020 14:03:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6EC241859189
	for <cluster-devel@redhat.com>; Fri, 31 Jul 2020 14:03:44 +0000 (UTC)
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
	[209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-130-uEJWMyxQOnSbC6LOLuVV0Q-1; Fri, 31 Jul 2020 10:03:27 -0400
X-MC-Unique: uEJWMyxQOnSbC6LOLuVV0Q-1
Received: by mail-ot1-f72.google.com with SMTP id n12so10077384ota.23
	for <cluster-devel@redhat.com>; Fri, 31 Jul 2020 07:03:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cps8/F9QZ13raGQ0LNt7ieXiXD83betUld/eJQwHa/g=;
	b=XTLLL3ri7OJYqLbGHGqYRvj4tXXJsYdLPIqge8dDJeuQ8abHaE5wMIKaEl695xL1Zm
	1ib++aQe8WBPI0JiSGWgFW+mi0oOB0Ii+uAmgBP0rRzuPLP7eLHZThrZ9Zy0R9pWvxY3
	AKKV0BgIAZER2oI1/F9NazX2QyXAagFuUZAYszMAKJiChlxNbcJIcJK+cK72vJwawS18
	fLDjQcVfPKBVjd7GFu7mW4TASxPCJ3vZOG2Qur+rRpcXQHOxhY6sDBrAGJtYt9LSIWh9
	/CAeb3ruZ63b3r55NcPCF1kssGCK3PGuvPit1KS2/CZK7MRmNjoqQHAO+AooGAE2uZt7
	y9tw==
X-Gm-Message-State: AOAM531tLBUFE6cbWw++MzbL8vj+jXheblLDmPntTOb2bYkprufAylTz
	pRVGG28gk5i/D9cGyIM4nmr9bb98NdGVpwBAaW38gjeDlfUO1aeCarlkS9map3b7f46KHuBGZWA
	rff6nZFu1dTL0ka5AXB8Q9T+TVPwUyHPzLnAQZA==
X-Received: by 2002:aca:5cc5:: with SMTP id q188mr2875447oib.10.1596204206000; 
	Fri, 31 Jul 2020 07:03:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2o1MCathljqcbxdIfvbrQ4AoMpjkC6t7vNA2UlmPa6Y8MaoCbcKN4WLZ9gni27APqI9VwD7WX0IkKlBrdOtU=
X-Received: by 2002:aca:5cc5:: with SMTP id q188mr2875387oib.10.1596204205391; 
	Fri, 31 Jul 2020 07:03:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200721183157.202276-1-hch@lst.de>
	<20200721183157.202276-4-hch@lst.de>
In-Reply-To: <20200721183157.202276-4-hch@lst.de>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 31 Jul 2020 16:03:13 +0200
Message-ID: <CAHc6FU4KpmW71xA1iX3rPp0evEPoYN3gjcSHt4de+K3R1ZKgEQ@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: Naohiro Aota <naohiro.aota@wdc.com>,
	cluster-devel <cluster-devel@redhat.com>,
	Damien Le Moal <damien.lemoal@wdc.com>,
	Johannes Thumshirn <jth@kernel.org>, Goldwyn Rodrigues <rgoldwyn@suse.de>,
	Dave Chinner <david@fromorbit.com>,
	Matthew Wilcox <willy@infradead.org>, linux-xfs@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-ext4 <linux-ext4@vger.kernel.org>,
	Goldwyn Rodrigues <rgoldwyn@suse.com>
Subject: Re: [Cluster-devel] [PATCH 3/3] iomap: fall back to buffered writes
 for invalidation failures
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 21, 2020 at 8:55 PM Christoph Hellwig <hch@lst.de> wrote:
> Failing to invalid the page cache means data in incoherent, which is
> a very bad state for the system.  Always fall back to buffered I/O
> through the page cache if we can't invalidate mappings.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Dave Chinner <dchinner@redhat.com>
> Reviewed-by: Goldwyn Rodrigues <rgoldwyn@suse.com>
> ---
>  fs/ext4/file.c       |  2 ++
>  fs/gfs2/file.c       |  3 ++-
>  fs/iomap/direct-io.c | 16 +++++++++++-----
>  fs/iomap/trace.h     |  1 +
>  fs/xfs/xfs_file.c    |  4 ++--
>  fs/zonefs/super.c    |  7 +++++--
>  6 files changed, 23 insertions(+), 10 deletions(-)
>
> diff --git a/fs/ext4/file.c b/fs/ext4/file.c
> index 2a01e31a032c4c..129cc1dd6b7952 100644
> --- a/fs/ext4/file.c
> +++ b/fs/ext4/file.c
> @@ -544,6 +544,8 @@ static ssize_t ext4_dio_write_iter(struct kiocb *iocb, struct iov_iter *from)
>                 iomap_ops = &ext4_iomap_overwrite_ops;
>         ret = iomap_dio_rw(iocb, from, iomap_ops, &ext4_dio_write_ops,
>                            is_sync_kiocb(iocb) || unaligned_io || extend);
> +       if (ret == -ENOTBLK)
> +               ret = 0;
>
>         if (extend)
>                 ret = ext4_handle_inode_extension(inode, offset, ret, count);
> diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
> index bebde537ac8cf2..b085a3bea4f0fd 100644
> --- a/fs/gfs2/file.c
> +++ b/fs/gfs2/file.c
> @@ -835,7 +835,8 @@ static ssize_t gfs2_file_direct_write(struct kiocb *iocb, struct iov_iter *from)
>
>         ret = iomap_dio_rw(iocb, from, &gfs2_iomap_ops, NULL,
>                            is_sync_kiocb(iocb));
> -
> +       if (ret == -ENOTBLK)
> +               ret = 0;
>  out:
>         gfs2_glock_dq(&gh);
>  out_uninit:
> diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
> index 190967e87b69e4..c1aafb2ab99072 100644
> --- a/fs/iomap/direct-io.c
> +++ b/fs/iomap/direct-io.c
> @@ -10,6 +10,7 @@
>  #include <linux/backing-dev.h>
>  #include <linux/uio.h>
>  #include <linux/task_io_accounting_ops.h>
> +#include "trace.h"
>
>  #include "../internal.h"
>
> @@ -401,6 +402,9 @@ iomap_dio_actor(struct inode *inode, loff_t pos, loff_t length,
>   * can be mapped into multiple disjoint IOs and only a subset of the IOs issued
>   * may be pure data writes. In that case, we still need to do a full data sync
>   * completion.
> + *
> + * Returns -ENOTBLK In case of a page invalidation invalidation failure for
> + * writes.  The callers needs to fall back to buffered I/O in this case.
>   */
>  ssize_t
>  iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
> @@ -478,13 +482,15 @@ iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
>         if (iov_iter_rw(iter) == WRITE) {
>                 /*
>                  * Try to invalidate cache pages for the range we are writing.
> -                * If this invalidation fails, tough, the write will still work,
> -                * but racing two incompatible write paths is a pretty crazy
> -                * thing to do, so we don't support it 100%.
> +                * If this invalidation fails, let the caller fall back to
> +                * buffered I/O.
>                  */
>                 if (invalidate_inode_pages2_range(mapping, pos >> PAGE_SHIFT,
> -                               end >> PAGE_SHIFT))
> -                       dio_warn_stale_pagecache(iocb->ki_filp);
> +                               end >> PAGE_SHIFT)) {
> +                       trace_iomap_dio_invalidate_fail(inode, pos, count);
> +                       ret = -ENOTBLK;
> +                       goto out_free_dio;
> +               }
>
>                 if (!wait_for_completion && !inode->i_sb->s_dio_done_wq) {
>                         ret = sb_init_dio_done_wq(inode->i_sb);
> diff --git a/fs/iomap/trace.h b/fs/iomap/trace.h
> index 5693a39d52fb63..fdc7ae388476f5 100644
> --- a/fs/iomap/trace.h
> +++ b/fs/iomap/trace.h
> @@ -74,6 +74,7 @@ DEFINE_EVENT(iomap_range_class, name, \
>  DEFINE_RANGE_EVENT(iomap_writepage);
>  DEFINE_RANGE_EVENT(iomap_releasepage);
>  DEFINE_RANGE_EVENT(iomap_invalidatepage);
> +DEFINE_RANGE_EVENT(iomap_dio_invalidate_fail);
>
>  #define IOMAP_TYPE_STRINGS \
>         { IOMAP_HOLE,           "HOLE" }, \
> diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
> index a6ef90457abf97..1b4517fc55f1b9 100644
> --- a/fs/xfs/xfs_file.c
> +++ b/fs/xfs/xfs_file.c
> @@ -553,8 +553,8 @@ xfs_file_dio_aio_write(
>         xfs_iunlock(ip, iolock);
>
>         /*
> -        * No fallback to buffered IO on errors for XFS, direct IO will either
> -        * complete fully or fail.
> +        * No fallback to buffered IO after short writes for XFS, direct I/O
> +        * will either complete fully or return an error.
>          */
>         ASSERT(ret < 0 || ret == count);
>         return ret;
> diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
> index 07bc42d62673ce..d0a04528a7e18e 100644
> --- a/fs/zonefs/super.c
> +++ b/fs/zonefs/super.c
> @@ -786,8 +786,11 @@ static ssize_t zonefs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>         if (iocb->ki_pos >= ZONEFS_I(inode)->i_max_size)
>                 return -EFBIG;
>
> -       if (iocb->ki_flags & IOCB_DIRECT)
> -               return zonefs_file_dio_write(iocb, from);
> +       if (iocb->ki_flags & IOCB_DIRECT) {
> +               ssize_t ret = zonefs_file_dio_write(iocb, from);
> +               if (ret != -ENOTBLK)
> +                       return ret;
> +       }
>
>         return zonefs_file_buffered_write(iocb, from);
>  }
> --
> 2.27.0
>

Reviewed-by: Andreas Gruenbacher <agruenba@redhat.com> # for gfs2

Thanks,
Andreas

