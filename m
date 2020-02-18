Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id C3B03163371
	for <lists+cluster-devel@lfdr.de>; Tue, 18 Feb 2020 21:49:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582058973;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sSzUuAsXGIrXy4vQ0zTAGyf0jed9sNlmwz2tpEx8I1w=;
	b=VLCxUfKZL47lDW9lNpRzHI66HY3DNknJNknBGxB54pgWErfOerBmZUNf5/Zyl+kGjPM8nS
	k34LOmM3gdPRBcN8q/sJgDJP7Dl2IhP/VbPuNVOBtYGykxXaHdJIhHqFUWr1zTRN6Cf5vT
	LuJmgWihOawFCgqBkWfTOZ2benxgISk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-ch6BdO72N_mne04Bmc8hlg-1; Tue, 18 Feb 2020 15:49:27 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F401800D54;
	Tue, 18 Feb 2020 20:49:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1941960BE1;
	Tue, 18 Feb 2020 20:49:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 54CE518089CD;
	Tue, 18 Feb 2020 20:49:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01IKnLPG016942 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 15:49:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2407F10C5620; Tue, 18 Feb 2020 20:49:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DF4810C5623
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 20:49:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A5D7867460
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 20:49:19 +0000 (UTC)
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
	[216.228.121.64]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-235-dTBbBEzJObas_Hmta-qOnw-1; Tue, 18 Feb 2020 15:49:12 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
	hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
	id <B5e4c4da80000>; Tue, 18 Feb 2020 12:48:40 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
	by hqpgpgate101.nvidia.com (PGP Universal service);
	Tue, 18 Feb 2020 12:49:11 -0800
X-PGP-Universal: processed;
	by hqpgpgate101.nvidia.com on Tue, 18 Feb 2020 12:49:11 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
	(172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Tue, 18 Feb 2020 20:49:11 +0000
To: Matthew Wilcox <willy@infradead.org>, <linux-fsdevel@vger.kernel.org>
References: <20200217184613.19668-1-willy@infradead.org>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <80d98657-2f93-da92-a541-707429a6fcdf@nvidia.com>
Date: Tue, 18 Feb 2020 12:49:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200217184613.19668-1-willy@infradead.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
	HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-MC-Unique: dTBbBEzJObas_Hmta-qOnw-1
X-MC-Unique: ch6BdO72N_mne04Bmc8hlg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v6 00/19] Change readahead API
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 2/17/20 10:45 AM, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> 
> This series adds a readahead address_space operation to eventually
> replace the readpages operation.  The key difference is that
> pages are added to the page cache as they are allocated (and
> then looked up by the filesystem) instead of passing them on a
> list to the readpages operation and having the filesystem add
> them to the page cache.  It's a net reduction in code for each
> implementation, more efficient than walking a list, and solves
> the direct-write vs buffered-read problem reported by yu kuai at
> https://lore.kernel.org/linux-fsdevel/20200116063601.39201-1-yukuai3@huawei.com/
> 
> The only unconverted filesystems are those which use fscache.
> Their conversion is pending Dave Howells' rewrite which will make the
> conversion substantially easier.

Hi Matthew,

I see that Dave Chinner is reviewing this series, but I'm trying out his recent
advice about code reviews [1], and so I'm not going to read his comments first.
So you may see some duplication or contradictions this time around.


[1] Somewhere in this thread, "[LSF/MM/BPF TOPIC] FS Maintainers Don't Scale": 
https://lore.kernel.org/r/20200131052520.GC6869@magnolia


thanks,
-- 
John Hubbard
NVIDIA

> 
> v6:
>  - Name the private members of readahead_control with a leading underscore
>    (suggested by Christoph Hellwig)
>  - Fix whitespace in rst file
>  - Remove misleading comment in btrfs patch
>  - Add readahead_next() API and use it in iomap
>  - Add iomap_readahead kerneldoc.
>  - Fix the mpage_readahead kerneldoc
>  - Make various readahead functions return void
>  - Keep readahead_index() and readahead_offset() pointing to the start of
>    this batch through the body.  No current user requires this, but it's
>    less surprising.
>  - Add kerneldoc for page_cache_readahead_limit
>  - Make page_idx an unsigned long, and rename it to just 'i'
>  - Get rid of page_offset local variable
>  - Add patch to call memalloc_nofs_save() before allocating pages (suggested
>    by Michal Hocko)
>  - Resplit a lot of patches for more logical progression and easier review
>    (suggested by John Hubbard)
>  - Added sign-offs where received, and I deemed still relevant
> 
> v5 switched to passing a readahead_control struct (mirroring the
> writepages_control struct passed to writepages).  This has a number of
> advantages:
>  - It fixes a number of bugs in various implementations, eg forgetting to
>    increment 'start', an off-by-one error in 'nr_pages' or treating 'start'
>    as a byte offset instead of a page offset.
>  - It allows us to change the arguments without changing all the
>    implementations of ->readahead which just call mpage_readahead() or
>    iomap_readahead()
>  - Figuring out which pages haven't been attempted by the implementation
>    is more natural this way.
>  - There's less code in each implementation.
> 
> Matthew Wilcox (Oracle) (19):
>   mm: Return void from various readahead functions
>   mm: Ignore return value of ->readpages
>   mm: Use readahead_control to pass arguments
>   mm: Rearrange readahead loop
>   mm: Remove 'page_offset' from readahead loop
>   mm: rename readahead loop variable to 'i'
>   mm: Put readahead pages in cache earlier
>   mm: Add readahead address space operation
>   mm: Add page_cache_readahead_limit
>   fs: Convert mpage_readpages to mpage_readahead
>   btrfs: Convert from readpages to readahead
>   erofs: Convert uncompressed files from readpages to readahead
>   erofs: Convert compressed files from readpages to readahead
>   ext4: Convert from readpages to readahead
>   f2fs: Convert from readpages to readahead
>   fuse: Convert from readpages to readahead
>   iomap: Restructure iomap_readpages_actor
>   iomap: Convert from readpages to readahead
>   mm: Use memalloc_nofs_save in readahead path
> 
>  Documentation/filesystems/locking.rst |   6 +-
>  Documentation/filesystems/vfs.rst     |  13 ++
>  drivers/staging/exfat/exfat_super.c   |   7 +-
>  fs/block_dev.c                        |   7 +-
>  fs/btrfs/extent_io.c                  |  46 ++-----
>  fs/btrfs/extent_io.h                  |   3 +-
>  fs/btrfs/inode.c                      |  16 +--
>  fs/erofs/data.c                       |  39 ++----
>  fs/erofs/zdata.c                      |  29 ++--
>  fs/ext2/inode.c                       |  10 +-
>  fs/ext4/ext4.h                        |   3 +-
>  fs/ext4/inode.c                       |  23 ++--
>  fs/ext4/readpage.c                    |  22 ++-
>  fs/ext4/verity.c                      |  35 +----
>  fs/f2fs/data.c                        |  50 +++----
>  fs/f2fs/f2fs.h                        |   5 +-
>  fs/f2fs/verity.c                      |  35 +----
>  fs/fat/inode.c                        |   7 +-
>  fs/fuse/file.c                        |  46 +++----
>  fs/gfs2/aops.c                        |  23 ++--
>  fs/hpfs/file.c                        |   7 +-
>  fs/iomap/buffered-io.c                | 118 +++++++----------
>  fs/iomap/trace.h                      |   2 +-
>  fs/isofs/inode.c                      |   7 +-
>  fs/jfs/inode.c                        |   7 +-
>  fs/mpage.c                            |  38 ++----
>  fs/nilfs2/inode.c                     |  15 +--
>  fs/ocfs2/aops.c                       |  34 ++---
>  fs/omfs/file.c                        |   7 +-
>  fs/qnx6/inode.c                       |   7 +-
>  fs/reiserfs/inode.c                   |   8 +-
>  fs/udf/inode.c                        |   7 +-
>  fs/xfs/xfs_aops.c                     |  13 +-
>  fs/zonefs/super.c                     |   7 +-
>  include/linux/fs.h                    |   2 +
>  include/linux/iomap.h                 |   3 +-
>  include/linux/mpage.h                 |   4 +-
>  include/linux/pagemap.h               |  90 +++++++++++++
>  include/trace/events/erofs.h          |   6 +-
>  include/trace/events/f2fs.h           |   6 +-
>  mm/internal.h                         |   8 +-
>  mm/migrate.c                          |   2 +-
>  mm/readahead.c                        | 184 +++++++++++++++++---------
>  43 files changed, 474 insertions(+), 533 deletions(-)
> 
> 
> base-commit: 11a48a5a18c63fd7621bb050228cebf13566e4d8
> 

