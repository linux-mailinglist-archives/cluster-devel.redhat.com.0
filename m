Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5A779156A
	for <lists+cluster-devel@lfdr.de>; Mon,  4 Sep 2023 12:00:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693821615;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=nvdtva1hYdUWD+pnWTLRf+gQ4cX6KfLw6V6ddu9SaA4=;
	b=Fko/WBK638mJwug5Rfold/mGhZuesDdrcSnbmpH6Fy7uB1lpTLtgVlHQ/Fc7FpxEssCuYv
	4YDRrGH+7hW3OzETUONzNqXqs+ws3RZwkrYD7Arnz8/UpgDLbQPZwsMajMtPXPJRR9aVjP
	nz20xW7WE/oUk+k5HZkGSDuXDkVNJCc=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-322-fc__gsciMCaLsF_8-brI8g-1; Mon, 04 Sep 2023 06:00:11 -0400
X-MC-Unique: fc__gsciMCaLsF_8-brI8g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47D7329DD984;
	Mon,  4 Sep 2023 10:00:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E8A81493110;
	Mon,  4 Sep 2023 10:00:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id ABA9D19465BC;
	Mon,  4 Sep 2023 10:00:09 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CA23B1946595 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  4 Sep 2023 10:00:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 76069568FF; Mon,  4 Sep 2023 10:00:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DA651182E6
 for <cluster-devel@redhat.com>; Mon,  4 Sep 2023 10:00:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0BDC8EE7CA
 for <cluster-devel@redhat.com>; Mon,  4 Sep 2023 10:00:06 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-166-UqScAirMM8CbTrN0O28F_w-1; Mon,
 04 Sep 2023 06:00:04 -0400
X-MC-Unique: UqScAirMM8CbTrN0O28F_w-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id C4EA7CE0E30;
 Mon,  4 Sep 2023 09:51:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B855FC433C8;
 Mon,  4 Sep 2023 09:51:43 +0000 (UTC)
Date: Mon, 4 Sep 2023 11:51:40 +0200
From: Christian Brauner <brauner@kernel.org>
To: Hao Xu <hao.xu@linux.dev>
Message-ID: <20230904-trennen-gewettert-0b2dc5ba60bc@brauner>
References: <20230827132835.1373581-1-hao.xu@linux.dev>
 <20230827132835.1373581-8-hao.xu@linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230827132835.1373581-8-hao.xu@linux.dev>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Cluster-devel] [PATCH 07/11] vfs: add nowait parameter for
 file_accessed()
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
Cc: Wanpeng Li <wanpengli@tencent.com>, "Darrick J . Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Dave Chinner <david@fromorbit.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-cachefs@redhat.com,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 linux-cifs@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-block@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 io-uring@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 samba-technical@lists.samba.org, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 bpf@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, Aug 27, 2023 at 09:28:31PM +0800, Hao Xu wrote:
> From: Hao Xu <howeyxu@tencent.com>
> 
> Add a boolean parameter for file_accessed() to support nowait semantics.
> Currently it is true only with io_uring as its initial caller.
> 
> Signed-off-by: Hao Xu <howeyxu@tencent.com>
> ---
>  arch/s390/hypfs/inode.c | 2 +-
>  block/fops.c            | 2 +-
>  fs/btrfs/file.c         | 2 +-
>  fs/btrfs/inode.c        | 2 +-
>  fs/coda/dir.c           | 4 ++--
>  fs/ext2/file.c          | 4 ++--
>  fs/ext4/file.c          | 6 +++---
>  fs/f2fs/file.c          | 4 ++--
>  fs/fuse/dax.c           | 2 +-
>  fs/fuse/file.c          | 4 ++--
>  fs/gfs2/file.c          | 2 +-
>  fs/hugetlbfs/inode.c    | 2 +-
>  fs/nilfs2/file.c        | 2 +-
>  fs/orangefs/file.c      | 2 +-
>  fs/orangefs/inode.c     | 2 +-
>  fs/pipe.c               | 2 +-
>  fs/ramfs/file-nommu.c   | 2 +-
>  fs/readdir.c            | 2 +-
>  fs/smb/client/cifsfs.c  | 2 +-
>  fs/splice.c             | 2 +-
>  fs/ubifs/file.c         | 2 +-
>  fs/udf/file.c           | 2 +-
>  fs/xfs/xfs_file.c       | 6 +++---
>  fs/zonefs/file.c        | 4 ++--
>  include/linux/fs.h      | 5 +++--
>  mm/filemap.c            | 8 ++++----
>  mm/shmem.c              | 6 +++---
>  27 files changed, 43 insertions(+), 42 deletions(-)
> 
> diff --git a/arch/s390/hypfs/inode.c b/arch/s390/hypfs/inode.c
> index ee919bfc8186..55f562027c4f 100644
> --- a/arch/s390/hypfs/inode.c
> +++ b/arch/s390/hypfs/inode.c
> @@ -157,7 +157,7 @@ static ssize_t hypfs_read_iter(struct kiocb *iocb, struct iov_iter *to)
>  	if (!count)
>  		return -EFAULT;
>  	iocb->ki_pos = pos + count;
> -	file_accessed(file);
> +	file_accessed(file, false);

Why? If all you do is skip atime update anyway then just add something
like:

bool file_needs_atime(struct file *file)
{
       return !(file->f_flags & O_NOATIME) &&
              atime_needs_update(&file->f_path, d_inode(path->dentry));
}

and then

if (file_needs_atime(file) && IOURING_WANTS_ASYNC)
	return -EAGAIN;

instead of touching all this code.

