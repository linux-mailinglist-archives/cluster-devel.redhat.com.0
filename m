Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C506EC611
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Apr 2023 08:18:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682317116;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=m8/vbs/KZ4kG3rGa6EPpInm5hn+HmPY26T8rCn74t/Q=;
	b=gteTZ4mKJjhPIsfHB9MiEXH/b7cQMRDXZS7vHsnz+a6tLxl49o38nA4P14GeOuSFK6qHnJ
	TsG8SbOrq/vNPjjgUsKmdIinBvMBHP96qLwLVb3PsDmKqm4jUqa9idAarfOD2Gp66kJYvA
	651IUU4n6p4ygxLTC15jhM2PnE4CnEA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-322-_TOOY9ICPIWvbN5-0jLMrQ-1; Mon, 24 Apr 2023 02:18:32 -0400
X-MC-Unique: _TOOY9ICPIWvbN5-0jLMrQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF0708996F2;
	Mon, 24 Apr 2023 06:18:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9EA582027043;
	Mon, 24 Apr 2023 06:18:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8208B1946589;
	Mon, 24 Apr 2023 06:18:31 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 298EF1946586 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 24 Apr 2023 06:18:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0141814171BB; Mon, 24 Apr 2023 06:18:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ECC7A14171BA
 for <cluster-devel@redhat.com>; Mon, 24 Apr 2023 06:18:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C76E7101A552
 for <cluster-devel@redhat.com>; Mon, 24 Apr 2023 06:18:29 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-pj2NhVGBNYGzWTqXBLKIuQ-1; Mon, 24 Apr 2023 02:18:27 -0400
X-MC-Unique: pj2NhVGBNYGzWTqXBLKIuQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B3E21617E4;
 Mon, 24 Apr 2023 06:18:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16E9EC433D2;
 Mon, 24 Apr 2023 06:18:26 +0000 (UTC)
Date: Sun, 23 Apr 2023 23:18:25 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20230424061825.GO360889@frogsfrogsfrogs>
References: <20230424054926.26927-1-hch@lst.de>
 <20230424054926.26927-12-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20230424054926.26927-12-hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Cluster-devel] [PATCH 11/17] iomap: assign
 current->backing_dev_info in iomap_file_buffered_write
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 linux-nfs@vger.kernel.org, cluster-devel@redhat.com, linux-xfs@vger.kernel.org,
 Miklos Szeredi <miklos@szeredi.hu>, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-ext4@vger.kernel.org, ceph-devel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 24, 2023 at 07:49:20AM +0200, Christoph Hellwig wrote:
> Move the assignment to current->backing_dev_info from the callers into
> iomap_file_buffered_write.  Note that zonefs was missing this assignment
> before.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/gfs2/file.c         | 3 ---
>  fs/iomap/buffered-io.c | 4 ++++
>  fs/xfs/xfs_file.c      | 5 -----
>  3 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
> index 8c4fad359ff538..4d88c6080b3e30 100644
> --- a/fs/gfs2/file.c
> +++ b/fs/gfs2/file.c
> @@ -25,7 +25,6 @@
>  #include <linux/dlm.h>
>  #include <linux/dlm_plock.h>
>  #include <linux/delay.h>
> -#include <linux/backing-dev.h>
>  #include <linux/fileattr.h>
>  
>  #include "gfs2.h"
> @@ -1041,11 +1040,9 @@ static ssize_t gfs2_file_buffered_write(struct kiocb *iocb,
>  			goto out_unlock;
>  	}
>  
> -	current->backing_dev_info = inode_to_bdi(inode);
>  	pagefault_disable();
>  	ret = iomap_file_buffered_write(iocb, from, &gfs2_iomap_ops);
>  	pagefault_enable();
> -	current->backing_dev_info = NULL;
>  	if (ret > 0) {
>  		iocb->ki_pos += ret;
>  		written += ret;
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index 2986be63d2bea6..3d5042efda202a 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -3,6 +3,7 @@
>   * Copyright (C) 2010 Red Hat, Inc.
>   * Copyright (C) 2016-2019 Christoph Hellwig.
>   */
> +#include <linux/backing-dev.h>
>  #include <linux/module.h>
>  #include <linux/compiler.h>
>  #include <linux/fs.h>
> @@ -876,8 +877,11 @@ iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *i,
>  	if (iocb->ki_flags & IOCB_NOWAIT)
>  		iter.flags |= IOMAP_NOWAIT;
>  
> +	current->backing_dev_info = inode_to_bdi(iter.inode);

Dumb question from me late on a Sunday night, but does the iomap_unshare
code need to set this too?  Since it works by dirtying pagecache folios
without actually changing the contents?

--D

>  	while ((ret = iomap_iter(&iter, ops)) > 0)
>  		iter.processed = iomap_write_iter(&iter, i);
> +	current->backing_dev_info = NULL;
> +
>  	if (iter.pos == iocb->ki_pos)
>  		return ret;
>  	return iter.pos - iocb->ki_pos;
> diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
> index 705250f9f90a1b..f5442e689baf15 100644
> --- a/fs/xfs/xfs_file.c
> +++ b/fs/xfs/xfs_file.c
> @@ -27,7 +27,6 @@
>  
>  #include <linux/dax.h>
>  #include <linux/falloc.h>
> -#include <linux/backing-dev.h>
>  #include <linux/mman.h>
>  #include <linux/fadvise.h>
>  #include <linux/mount.h>
> @@ -717,9 +716,6 @@ xfs_file_buffered_write(
>  	if (ret)
>  		goto out;
>  
> -	/* We can write back this queue in page reclaim */
> -	current->backing_dev_info = inode_to_bdi(inode);
> -
>  	trace_xfs_file_buffered_write(iocb, from);
>  	ret = iomap_file_buffered_write(iocb, from,
>  			&xfs_buffered_write_iomap_ops);
> @@ -753,7 +749,6 @@ xfs_file_buffered_write(
>  		goto write_retry;
>  	}
>  
> -	current->backing_dev_info = NULL;
>  out:
>  	if (iolock)
>  		xfs_iunlock(ip, iolock);
> -- 
> 2.39.2
> 

