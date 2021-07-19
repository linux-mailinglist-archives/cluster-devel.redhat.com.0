Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0CB433CE8FB
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Jul 2021 19:48:58 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-_Ph2KXWxMjCxaoZJKwnR9Q-1; Mon, 19 Jul 2021 13:48:56 -0400
X-MC-Unique: _Ph2KXWxMjCxaoZJKwnR9Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAB0D84BA08;
	Mon, 19 Jul 2021 17:48:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7583460916;
	Mon, 19 Jul 2021 17:48:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3BD241809C99;
	Mon, 19 Jul 2021 17:48:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16JHmrm5009480 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Jul 2021 13:48:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 05F4944069; Mon, 19 Jul 2021 17:48:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 013C44E3DA
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 17:48:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 184BC80B73C
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 17:48:50 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-201-XV9DhKPfMryNemjXQqFpMw-1;
	Mon, 19 Jul 2021 13:48:47 -0400
X-MC-Unique: XV9DhKPfMryNemjXQqFpMw-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B5896115B;
	Mon, 19 Jul 2021 17:48:46 +0000 (UTC)
Date: Mon, 19 Jul 2021 10:48:46 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20210719174846.GL22357@magnolia>
References: <20210719103520.495450-1-hch@lst.de>
	<20210719103520.495450-22-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20210719103520.495450-22-hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: nvdimm@lists.linux.dev, cluster-devel@redhat.com,
	Matthew Wilcox <willy@infradead.org>,
	Shiyang Ruan <ruansy.fnst@fujitsu.com>,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 21/27] iomap: remove iomap_apply
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 19, 2021 at 12:35:14PM +0200, Christoph Hellwig wrote:
> iomap_apply is unused now, so remove it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/iomap/Makefile     |  1 -
>  fs/iomap/apply.c      | 99 -------------------------------------------
>  fs/iomap/trace.h      | 40 -----------------
>  include/linux/iomap.h | 10 -----
>  4 files changed, 150 deletions(-)

mmm, negative LOC delta ;)
Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

>  delete mode 100644 fs/iomap/apply.c
> 
> diff --git a/fs/iomap/Makefile b/fs/iomap/Makefile
> index 85034deb5a2f19..ebd9866d80ae90 100644
> --- a/fs/iomap/Makefile
> +++ b/fs/iomap/Makefile
> @@ -9,7 +9,6 @@ ccflags-y += -I $(srctree)/$(src)		# needed for trace events
>  obj-$(CONFIG_FS_IOMAP)		+= iomap.o
>  
>  iomap-y				+= trace.o \
> -				   apply.o \
>  				   iter.o \
>  				   buffered-io.o \
>  				   direct-io.o \
> diff --git a/fs/iomap/apply.c b/fs/iomap/apply.c
> deleted file mode 100644
> index 26ab6563181fc6..00000000000000
> --- a/fs/iomap/apply.c
> +++ /dev/null
> @@ -1,99 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -/*
> - * Copyright (C) 2010 Red Hat, Inc.
> - * Copyright (c) 2016-2018 Christoph Hellwig.
> - */
> -#include <linux/module.h>
> -#include <linux/compiler.h>
> -#include <linux/fs.h>
> -#include <linux/iomap.h>
> -#include "trace.h"
> -
> -/*
> - * Execute a iomap write on a segment of the mapping that spans a
> - * contiguous range of pages that have identical block mapping state.
> - *
> - * This avoids the need to map pages individually, do individual allocations
> - * for each page and most importantly avoid the need for filesystem specific
> - * locking per page. Instead, all the operations are amortised over the entire
> - * range of pages. It is assumed that the filesystems will lock whatever
> - * resources they require in the iomap_begin call, and release them in the
> - * iomap_end call.
> - */
> -loff_t
> -iomap_apply(struct inode *inode, loff_t pos, loff_t length, unsigned flags,
> -		const struct iomap_ops *ops, void *data, iomap_actor_t actor)
> -{
> -	struct iomap iomap = { .type = IOMAP_HOLE };
> -	struct iomap srcmap = { .type = IOMAP_HOLE };
> -	loff_t written = 0, ret;
> -	u64 end;
> -
> -	trace_iomap_apply(inode, pos, length, flags, ops, actor, _RET_IP_);
> -
> -	/*
> -	 * Need to map a range from start position for length bytes. This can
> -	 * span multiple pages - it is only guaranteed to return a range of a
> -	 * single type of pages (e.g. all into a hole, all mapped or all
> -	 * unwritten). Failure at this point has nothing to undo.
> -	 *
> -	 * If allocation is required for this range, reserve the space now so
> -	 * that the allocation is guaranteed to succeed later on. Once we copy
> -	 * the data into the page cache pages, then we cannot fail otherwise we
> -	 * expose transient stale data. If the reserve fails, we can safely
> -	 * back out at this point as there is nothing to undo.
> -	 */
> -	ret = ops->iomap_begin(inode, pos, length, flags, &iomap, &srcmap);
> -	if (ret)
> -		return ret;
> -	if (WARN_ON(iomap.offset > pos)) {
> -		written = -EIO;
> -		goto out;
> -	}
> -	if (WARN_ON(iomap.length == 0)) {
> -		written = -EIO;
> -		goto out;
> -	}
> -
> -	trace_iomap_apply_dstmap(inode, &iomap);
> -	if (srcmap.type != IOMAP_HOLE)
> -		trace_iomap_apply_srcmap(inode, &srcmap);
> -
> -	/*
> -	 * Cut down the length to the one actually provided by the filesystem,
> -	 * as it might not be able to give us the whole size that we requested.
> -	 */
> -	end = iomap.offset + iomap.length;
> -	if (srcmap.type != IOMAP_HOLE)
> -		end = min(end, srcmap.offset + srcmap.length);
> -	if (pos + length > end)
> -		length = end - pos;
> -
> -	/*
> -	 * Now that we have guaranteed that the space allocation will succeed,
> -	 * we can do the copy-in page by page without having to worry about
> -	 * failures exposing transient data.
> -	 *
> -	 * To support COW operations, we read in data for partially blocks from
> -	 * the srcmap if the file system filled it in.  In that case we the
> -	 * length needs to be limited to the earlier of the ends of the iomaps.
> -	 * If the file system did not provide a srcmap we pass in the normal
> -	 * iomap into the actors so that they don't need to have special
> -	 * handling for the two cases.
> -	 */
> -	written = actor(inode, pos, length, data, &iomap,
> -			srcmap.type != IOMAP_HOLE ? &srcmap : &iomap);
> -
> -out:
> -	/*
> -	 * Now the data has been copied, commit the range we've copied.  This
> -	 * should not fail unless the filesystem has had a fatal error.
> -	 */
> -	if (ops->iomap_end) {
> -		ret = ops->iomap_end(inode, pos, length,
> -				     written > 0 ? written : 0,
> -				     flags, &iomap);
> -	}
> -
> -	return written ? written : ret;
> -}
> diff --git a/fs/iomap/trace.h b/fs/iomap/trace.h
> index 1012d7af6b689b..f1519f9a140320 100644
> --- a/fs/iomap/trace.h
> +++ b/fs/iomap/trace.h
> @@ -138,49 +138,9 @@ DECLARE_EVENT_CLASS(iomap_class,
>  DEFINE_EVENT(iomap_class, name,	\
>  	TP_PROTO(struct inode *inode, struct iomap *iomap), \
>  	TP_ARGS(inode, iomap))
> -DEFINE_IOMAP_EVENT(iomap_apply_dstmap);
> -DEFINE_IOMAP_EVENT(iomap_apply_srcmap);
>  DEFINE_IOMAP_EVENT(iomap_iter_dstmap);
>  DEFINE_IOMAP_EVENT(iomap_iter_srcmap);
>  
> -TRACE_EVENT(iomap_apply,
> -	TP_PROTO(struct inode *inode, loff_t pos, loff_t length,
> -		unsigned int flags, const void *ops, void *actor,
> -		unsigned long caller),
> -	TP_ARGS(inode, pos, length, flags, ops, actor, caller),
> -	TP_STRUCT__entry(
> -		__field(dev_t, dev)
> -		__field(u64, ino)
> -		__field(loff_t, pos)
> -		__field(loff_t, length)
> -		__field(unsigned int, flags)
> -		__field(const void *, ops)
> -		__field(void *, actor)
> -		__field(unsigned long, caller)
> -	),
> -	TP_fast_assign(
> -		__entry->dev = inode->i_sb->s_dev;
> -		__entry->ino = inode->i_ino;
> -		__entry->pos = pos;
> -		__entry->length = length;
> -		__entry->flags = flags;
> -		__entry->ops = ops;
> -		__entry->actor = actor;
> -		__entry->caller = caller;
> -	),
> -	TP_printk("dev %d:%d ino 0x%llx pos %lld length %lld flags %s (0x%x) "
> -		  "ops %ps caller %pS actor %ps",
> -		  MAJOR(__entry->dev), MINOR(__entry->dev),
> -		   __entry->ino,
> -		   __entry->pos,
> -		   __entry->length,
> -		   __print_flags(__entry->flags, "|", IOMAP_FLAGS_STRINGS),
> -		   __entry->flags,
> -		   __entry->ops,
> -		   (void *)__entry->caller,
> -		   __entry->actor)
> -);
> -
>  TRACE_EVENT(iomap_iter,
>  	TP_PROTO(struct iomap_iter *iter, const void *ops,
>  		 unsigned long caller),
> diff --git a/include/linux/iomap.h b/include/linux/iomap.h
> index da01226886eca4..2f13e34c2c0b0b 100644
> --- a/include/linux/iomap.h
> +++ b/include/linux/iomap.h
> @@ -199,16 +199,6 @@ static inline struct iomap *iomap_iter_srcmap(struct iomap_iter *i)
>  	return &i->iomap;
>  }
>  
> -/*
> - * Main iomap iterator function.
> - */
> -typedef loff_t (*iomap_actor_t)(struct inode *inode, loff_t pos, loff_t len,
> -		void *data, struct iomap *iomap, struct iomap *srcmap);
> -
> -loff_t iomap_apply(struct inode *inode, loff_t pos, loff_t length,
> -		unsigned flags, const struct iomap_ops *ops, void *data,
> -		iomap_actor_t actor);
> -
>  ssize_t iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *from,
>  		const struct iomap_ops *ops);
>  int iomap_readpage(struct page *page, const struct iomap_ops *ops);
> -- 
> 2.30.2
> 

