Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB43788C2D
	for <lists+cluster-devel@lfdr.de>; Fri, 25 Aug 2023 17:11:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692976287;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=RZbkUY9e8Wi7Z5FQEWEttp+LseNlXBERK1HYThFqoFg=;
	b=Li+mYX9oNv0o0QvHabPSuqCH8lclEKTofwRc7vX63AmEMppYYSdPfbs5R9305SfoKTlWoe
	64R/QBVEUMBaw1di0gZ5undVabFJYaVXXDfaw/R9oFPzwM399lpeX/Pt4mbVgub1T0+hSn
	6U7mqcc2x1vHhoKKwLYSUApHC75KZyM=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-OIbGL9kMNemp17LyfT0tSg-1; Fri, 25 Aug 2023 11:11:24 -0400
X-MC-Unique: OIbGL9kMNemp17LyfT0tSg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7A141293248C;
	Fri, 25 Aug 2023 15:11:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ED8052026D68;
	Fri, 25 Aug 2023 15:11:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A612419465B3;
	Fri, 25 Aug 2023 15:11:20 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 704DD19465A8 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 25 Aug 2023 15:11:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3F46E40C2079; Fri, 25 Aug 2023 15:11:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 370EE40C2073
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 15:11:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0EEC7800CB0
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 15:11:19 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-332-MfbzPobPOIGxyZzknjwSDQ-1; Fri, 25 Aug 2023 11:11:17 -0400
X-MC-Unique: MfbzPobPOIGxyZzknjwSDQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4DC0561D9A;
 Fri, 25 Aug 2023 15:11:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A51CFC433C7;
 Fri, 25 Aug 2023 15:11:15 +0000 (UTC)
Date: Fri, 25 Aug 2023 08:11:15 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Hao Xu <hao.xu@linux.dev>
Message-ID: <20230825151115.GB17891@frogsfrogsfrogs>
References: <20230825135431.1317785-1-hao.xu@linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230825135431.1317785-1-hao.xu@linux.dev>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Cluster-devel] [PATCH RFC v5 00/29] io_uring getdents
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
Cc: Wanpeng Li <wanpengli@tencent.com>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Dave Chinner <david@fromorbit.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-cachefs@redhat.com,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 linux-cifs@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 netdev@vger.kernel.org, samba-technical@lists.samba.org,
 linux-unionfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, bpf@vger.kernel.org,
 Pavel Begunkov <asml.silence@gmail.com>, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 25, 2023 at 09:54:02PM +0800, Hao Xu wrote:
> From: Hao Xu <howeyxu@tencent.com>
> 
> This series introduce getdents64 to io_uring, the code logic is similar
> with the snychronized version's. It first try nowait issue, and offload
> it to io-wq threads if the first try fails.

NAK on the entire series until Jens actually writes down what NOWAIT
does, so that we can check that the *existing* nowait code branches
actually behave how he says it should.

https://lore.kernel.org/all/e2d8e5f1-f794-38eb-cecf-ed30c571206b@kernel.dk/

--D

> 
> Patch1 and Patch2 are some preparation
> Patch3 supports nowait for xfs getdents code
> Patch4-11 are vfs change, include adding helpers and trylock for locks
> Patch12-29 supports nowait for involved xfs journal stuff
> note, Patch24 and 27 are actually two questions, might be removed later.
> an xfs test may come later.
> 
> Tests I've done:
> a liburing test case for functional test:
> https://github.com/HowHsu/liburing/commit/39dc9a8e19c06a8cebf8c2301b85320eb45c061e?diff=unified
> 
> xfstests:
>     test/generic: 1 fails and 171 not run
>     test/xfs: 72 fails and 156 not run
> run the code before without this patchset, same result.
> I'll try to make the environment more right to run more tests here.
> 
> 
> Tested it with a liburing performance test:
> https://github.com/HowHsu/liburing/blob/getdents/test/getdents2.c
> 
> The test is controlled by the below script[2] which runs getdents2.t 100
> times and calulate the avg.
> The result show that io_uring version is about 2.6% faster:
> 
> note:
> [1] the number of getdents call/request in io_uring and normal sync version
> are made sure to be same beforehand.
> 
> [2] run_getdents.py
> 
> ```python3
> 
> import subprocess
> 
> N = 100
> sum = 0.0
> args = ["/data/home/howeyxu/tmpdir", "sync"]
> 
> for i in range(N):
>     output = subprocess.check_output(["./liburing/test/getdents2.t"] + args)
>     sum += float(output)
> 
> average = sum / N
> print("Average of sync:", average)
> 
> sum = 0.0
> args = ["/data/home/howeyxu/tmpdir", "iouring"]
> 
> for i in range(N):
>     output = subprocess.check_output(["./liburing/test/getdents2.t"] + args)
>     sum += float(output)
> 
> average = sum / N
> print("Average of iouring:", average)
> 
> ```
> 
> v4->v5:
>  - move atime update to the beginning of getdents operation
>  - trylock for i_rwsem
>  - nowait semantics for involved xfs journal stuff
> 
> v3->v4:
>  - add Dave's xfs nowait code and fix a deadlock problem, with some code
>    style tweak.
>  - disable fixed file to avoid a race problem for now
>  - add a test program.
> 
> v2->v3:
>  - removed the kernfs patches
>  - add f_pos_lock logic
>  - remove the "reduce last EOF getdents try" optimization since
>    Dominique reports that doesn't make difference
>  - remove the rewind logic, I think the right way is to introduce lseek
>    to io_uring not to patch this logic to getdents.
>  - add Singed-off-by of Stefan Roesch for patch 1 since checkpatch
>    complained that Co-developed-by someone should be accompanied with
>    Signed-off-by same person, I can remove them if Stefan thinks that's
>    not proper.
> 
> 
> Dominique Martinet (1):
>   fs: split off vfs_getdents function of getdents64 syscall
> 
> Hao Xu (28):
>   xfs: rename XBF_TRYLOCK to XBF_NOWAIT
>   xfs: add NOWAIT semantics for readdir
>   vfs: add nowait flag for struct dir_context
>   vfs: add a vfs helper for io_uring file pos lock
>   vfs: add file_pos_unlock() for io_uring usage
>   vfs: add a nowait parameter for touch_atime()
>   vfs: add nowait parameter for file_accessed()
>   vfs: move file_accessed() to the beginning of iterate_dir()
>   vfs: add S_NOWAIT for nowait time update
>   vfs: trylock inode->i_rwsem in iterate_dir() to support nowait
>   xfs: enforce GFP_NOIO implicitly during nowait time update
>   xfs: make xfs_trans_alloc() support nowait semantics
>   xfs: support nowait for xfs_log_reserve()
>   xfs: don't wait for free space in xlog_grant_head_check() in nowait
>     case
>   xfs: add nowait parameter for xfs_inode_item_init()
>   xfs: make xfs_trans_ijoin() error out -EAGAIN
>   xfs: set XBF_NOWAIT for xfs_buf_read_map if necessary
>   xfs: support nowait memory allocation in _xfs_buf_alloc()
>   xfs: distinguish error type of memory allocation failure for nowait
>     case
>   xfs: return -EAGAIN when bulk memory allocation fails in nowait case
>   xfs: comment page allocation for nowait case in xfs_buf_find_insert()
>   xfs: don't print warn info for -EAGAIN error in  xfs_buf_get_map()
>   xfs: support nowait for xfs_buf_read_map()
>   xfs: support nowait for xfs_buf_item_init()
>   xfs: return -EAGAIN when nowait meets sync in transaction commit
>   xfs: add a comment for xlog_kvmalloc()
>   xfs: support nowait semantics for xc_ctx_lock in xlog_cil_commit()
>   io_uring: add support for getdents
> 
>  arch/s390/hypfs/inode.c         |  2 +-
>  block/fops.c                    |  2 +-
>  fs/btrfs/file.c                 |  2 +-
>  fs/btrfs/inode.c                |  2 +-
>  fs/cachefiles/namei.c           |  2 +-
>  fs/coda/dir.c                   |  4 +--
>  fs/ecryptfs/file.c              |  4 +--
>  fs/ext2/file.c                  |  4 +--
>  fs/ext4/file.c                  |  6 ++--
>  fs/f2fs/file.c                  |  4 +--
>  fs/file.c                       | 13 +++++++
>  fs/fuse/dax.c                   |  2 +-
>  fs/fuse/file.c                  |  4 +--
>  fs/gfs2/file.c                  |  2 +-
>  fs/hugetlbfs/inode.c            |  2 +-
>  fs/inode.c                      | 10 +++---
>  fs/internal.h                   |  8 +++++
>  fs/namei.c                      |  4 +--
>  fs/nfsd/vfs.c                   |  2 +-
>  fs/nilfs2/file.c                |  2 +-
>  fs/orangefs/file.c              |  2 +-
>  fs/orangefs/inode.c             |  2 +-
>  fs/overlayfs/file.c             |  2 +-
>  fs/overlayfs/inode.c            |  2 +-
>  fs/pipe.c                       |  2 +-
>  fs/ramfs/file-nommu.c           |  2 +-
>  fs/readdir.c                    | 61 +++++++++++++++++++++++++--------
>  fs/smb/client/cifsfs.c          |  2 +-
>  fs/splice.c                     |  2 +-
>  fs/stat.c                       |  2 +-
>  fs/ubifs/file.c                 |  2 +-
>  fs/udf/file.c                   |  2 +-
>  fs/xfs/libxfs/xfs_alloc.c       |  2 +-
>  fs/xfs/libxfs/xfs_attr_remote.c |  2 +-
>  fs/xfs/libxfs/xfs_btree.c       |  2 +-
>  fs/xfs/libxfs/xfs_da_btree.c    | 16 +++++++++
>  fs/xfs/libxfs/xfs_da_btree.h    |  1 +
>  fs/xfs/libxfs/xfs_dir2_block.c  |  7 ++--
>  fs/xfs/libxfs/xfs_dir2_priv.h   |  2 +-
>  fs/xfs/libxfs/xfs_shared.h      |  2 ++
>  fs/xfs/libxfs/xfs_trans_inode.c | 12 +++++--
>  fs/xfs/scrub/dir.c              |  2 +-
>  fs/xfs/scrub/readdir.c          |  2 +-
>  fs/xfs/scrub/repair.c           |  2 +-
>  fs/xfs/xfs_buf.c                | 43 +++++++++++++++++------
>  fs/xfs/xfs_buf.h                |  4 +--
>  fs/xfs/xfs_buf_item.c           |  9 +++--
>  fs/xfs/xfs_buf_item.h           |  2 +-
>  fs/xfs/xfs_buf_item_recover.c   |  2 +-
>  fs/xfs/xfs_dir2_readdir.c       | 49 ++++++++++++++++++++------
>  fs/xfs/xfs_dquot.c              |  2 +-
>  fs/xfs/xfs_file.c               |  6 ++--
>  fs/xfs/xfs_inode.c              | 27 +++++++++++++++
>  fs/xfs/xfs_inode.h              | 17 +++++----
>  fs/xfs/xfs_inode_item.c         | 12 ++++---
>  fs/xfs/xfs_inode_item.h         |  3 +-
>  fs/xfs/xfs_iops.c               | 31 ++++++++++++++---
>  fs/xfs/xfs_log.c                | 33 ++++++++++++------
>  fs/xfs/xfs_log.h                |  5 +--
>  fs/xfs/xfs_log_cil.c            | 17 +++++++--
>  fs/xfs/xfs_log_priv.h           |  4 +--
>  fs/xfs/xfs_trans.c              | 44 ++++++++++++++++++++----
>  fs/xfs/xfs_trans.h              |  2 +-
>  fs/xfs/xfs_trans_buf.c          | 18 ++++++++--
>  fs/zonefs/file.c                |  4 +--
>  include/linux/file.h            |  7 ++++
>  include/linux/fs.h              | 16 +++++++--
>  include/uapi/linux/io_uring.h   |  1 +
>  io_uring/fs.c                   | 53 ++++++++++++++++++++++++++++
>  io_uring/fs.h                   |  3 ++
>  io_uring/opdef.c                |  8 +++++
>  kernel/bpf/inode.c              |  4 +--
>  mm/filemap.c                    |  8 ++---
>  mm/shmem.c                      |  6 ++--
>  net/unix/af_unix.c              |  4 +--
>  75 files changed, 499 insertions(+), 161 deletions(-)
> 
> -- 
> 2.25.1
> 

