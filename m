Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4973070D011
	for <lists+cluster-devel@lfdr.de>; Tue, 23 May 2023 03:06:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684803995;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=2ej59/T/mMH9enC8u09fLhXt1y6kmoqAgjeImlgOrUg=;
	b=dqfsBAW8u0Ng7JCkIZiWDn6iwx8aAvm+ETGHfN7uZSMvR3BJEYZAnwZtoYWewkgSJ1x1hv
	A/N5z8SH8X8DphG4jJyzI6ofFARMokKOURykvbkKfmD2/dcVu8ECn0/KeopK3Bn3iJ8CbQ
	q5KWgcIEhJLWC7KA79amYnVMriCnzc4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-6SBkYsJSOnmCVSiS2utSkg-1; Mon, 22 May 2023 21:06:34 -0400
X-MC-Unique: 6SBkYsJSOnmCVSiS2utSkg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 131E129AA381;
	Tue, 23 May 2023 01:06:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 037F940D1B60;
	Tue, 23 May 2023 01:06:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A7D7A19465B1;
	Tue, 23 May 2023 01:06:32 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CBE061946595 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 23 May 2023 01:06:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 95ED51121315; Tue, 23 May 2023 01:06:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D7D71121314
 for <cluster-devel@redhat.com>; Tue, 23 May 2023 01:06:31 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73278185A78B
 for <cluster-devel@redhat.com>; Tue, 23 May 2023 01:06:31 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-578-XnUqnPqJOrO8IiAgUVWKaQ-1; Mon, 22 May 2023 21:06:29 -0400
X-MC-Unique: XnUqnPqJOrO8IiAgUVWKaQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8A5E662CFF;
 Tue, 23 May 2023 01:06:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5A8CC433EF;
 Tue, 23 May 2023 01:06:27 +0000 (UTC)
Date: Mon, 22 May 2023 18:06:27 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20230523010627.GD11598@frogsfrogsfrogs>
References: <20230519093521.133226-1-hch@lst.de>
 <20230519093521.133226-9-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20230519093521.133226-9-hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] [PATCH 08/13] iomap: assign
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
Cc: linux-mm@kvack.org, Miklos Szeredi <miklos@szeredi.hu>,
 Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Chao Yu <chao@kernel.org>, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 19, 2023 at 11:35:16AM +0200, Christoph Hellwig wrote:
> Move the assignment to current->backing_dev_info from the callers into
> iomap_file_buffered_write to reduce boiler plate code and reduce the
> scope to just around the page dirtying loop.
> 
> Note that zonefs was missing this assignment before.

I'm still wondering (a) what the hell current->backing_dev_info is for,
and (b) if we need it around the iomap_unshare operation.

$ git grep current..backing_dev_info
fs/btrfs/file.c:1148:   current->backing_dev_info = inode_to_bdi(inode);
fs/btrfs/file.c:1169:                   current->backing_dev_info = NULL;
fs/btrfs/file.c:1692:   current->backing_dev_info = NULL;
fs/ceph/file.c:1795:    current->backing_dev_info = inode_to_bdi(inode);
fs/ceph/file.c:1943:    current->backing_dev_info = NULL;
fs/ext4/file.c:288:     current->backing_dev_info = inode_to_bdi(inode);
fs/ext4/file.c:290:     current->backing_dev_info = NULL;
fs/f2fs/file.c:4520:    current->backing_dev_info = inode_to_bdi(inode);
fs/f2fs/file.c:4522:    current->backing_dev_info = NULL;
fs/fuse/file.c:1366:    current->backing_dev_info = inode_to_bdi(inode);
fs/fuse/file.c:1412:    current->backing_dev_info = NULL;
fs/gfs2/file.c:1044:    current->backing_dev_info = inode_to_bdi(inode);
fs/gfs2/file.c:1048:    current->backing_dev_info = NULL;
fs/nfs/file.c:652:              current->backing_dev_info = inode_to_bdi(inode);
fs/nfs/file.c:654:              current->backing_dev_info = NULL;
fs/ntfs/file.c:1914:    current->backing_dev_info = inode_to_bdi(vi);
fs/ntfs/file.c:1918:    current->backing_dev_info = NULL;
fs/ntfs3/file.c:823:    current->backing_dev_info = inode_to_bdi(inode);
fs/ntfs3/file.c:996:    current->backing_dev_info = NULL;
fs/xfs/xfs_file.c:721:  current->backing_dev_info = inode_to_bdi(inode);
fs/xfs/xfs_file.c:756:  current->backing_dev_info = NULL;
mm/filemap.c:3995:      current->backing_dev_info = inode_to_bdi(inode);
mm/filemap.c:4056:      current->backing_dev_info = NULL;

AFAICT nobody uses it at all?  Unless there's some bizarre user that
isn't extracting it from @current?

Oh, hey, new question (c) isn't this set incorrectly for xfs realtime
files?

--D

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/gfs2/file.c         | 3 ---
>  fs/iomap/buffered-io.c | 3 +++
>  fs/xfs/xfs_file.c      | 5 -----
>  3 files changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
> index 499ef174dec138..261897fcfbc495 100644
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
>  	if (ret > 0)
>  		written += ret;
>  
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index 550525a525c45c..b2779bd1f10611 100644
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
> @@ -869,8 +870,10 @@ iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *i,
>  	if (iocb->ki_flags & IOCB_NOWAIT)
>  		iter.flags |= IOMAP_NOWAIT;
>  
> +	current->backing_dev_info = inode_to_bdi(iter.inode);
>  	while ((ret = iomap_iter(&iter, ops)) > 0)
>  		iter.processed = iomap_write_iter(&iter, i);
> +	current->backing_dev_info = NULL;
>  
>  	if (unlikely(ret < 0))
>  		return ret;
> diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
> index bfba10e0b0f3c2..98d763cc3b114c 100644
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
> @@ -751,7 +747,6 @@ xfs_file_buffered_write(
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

