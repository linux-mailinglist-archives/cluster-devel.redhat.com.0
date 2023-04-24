Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9806F6ED620
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Apr 2023 22:33:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682368407;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nrJOvD5ki07BgC1+m6zA5u3PXXHEIqqCNZygV4WG4uU=;
	b=YqnM1/DjjRoAc/ohu7Qr0dNA2ll6JRLBsO8ncXh6xRLfCGW1WjE26/PvzxkjCGJvfmkbyb
	8WI5CKvm4oSMGUyE+mCClzrt/TcONzkXJd6qzoJLUp0bxPWuCQcStSfFFcfcQiorlYL8eY
	UCnh82moLvW+K6L7LtIu05F+Vknp454=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-XKg51nvyPx6E8F59PrG02A-1; Mon, 24 Apr 2023 16:33:21 -0400
X-MC-Unique: XKg51nvyPx6E8F59PrG02A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED0EA185A7AE;
	Mon, 24 Apr 2023 20:33:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2C7F5492C13;
	Mon, 24 Apr 2023 20:33:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BCB4E1946595;
	Mon, 24 Apr 2023 20:33:19 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2E699194658D for <cluster-devel@listman.corp.redhat.com>;
 Mon, 24 Apr 2023 20:23:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0C01D1121319; Mon, 24 Apr 2023 20:23:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 03A471121318
 for <cluster-devel@redhat.com>; Mon, 24 Apr 2023 20:23:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DBD09280A321
 for <cluster-devel@redhat.com>; Mon, 24 Apr 2023 20:23:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-27-ebdcYiCxNKag3_EKmGG2SQ-1; Mon, 24 Apr 2023 16:23:01 -0400
X-MC-Unique: ebdcYiCxNKag3_EKmGG2SQ-1
Received: from [2601:1c2:980:9ec0::2764]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pr1lf-00H3HP-0y; Mon, 24 Apr 2023 19:22:31 +0000
Message-ID: <5f30b56e-b46b-1d3f-75fb-7f30ff6ca3e9@infradead.org>
Date: Mon, 24 Apr 2023 12:22:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20230424054926.26927-1-hch@lst.de>
 <20230424054926.26927-3-hch@lst.de>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230424054926.26927-3-hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] [PATCH 02/17] fs: remove the special
 !CONFIG_BLOCK def_blk_fops
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
Cc: linux-block@vger.kernel.org, linux-nfs@vger.kernel.org,
 cluster-devel@redhat.com, linux-xfs@vger.kernel.org,
 Miklos Szeredi <miklos@szeredi.hu>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 ceph-devel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: infradead.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/23/23 22:49, Christoph Hellwig wrote:
> def_blk_fops always returns -ENODEV, which dosn't match the return value
> of a non-existing block device with CONFIG_BLOCK, which is -ENXIO.
> Just remove the extra implementation and fall back to the default
> no_open_fops that always returns -ENXIO.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/Makefile   | 10 ++--------
>  fs/inode.c    |  3 ++-
>  fs/no-block.c | 19 -------------------
>  3 files changed, 4 insertions(+), 28 deletions(-)
>  delete mode 100644 fs/no-block.c
> 
> diff --git a/fs/Makefile b/fs/Makefile
> index 05f89b5c962f88..da21e7d0a1cf37 100644
> --- a/fs/Makefile
> +++ b/fs/Makefile
> @@ -18,14 +18,8 @@ obj-y :=	open.o read_write.o file_table.o super.o \
>  		fs_types.o fs_context.o fs_parser.o fsopen.o init.o \
>  		kernel_read_file.o mnt_idmapping.o remap_range.o
>  
> -ifeq ($(CONFIG_BLOCK),y)
> -obj-y +=	buffer.o mpage.o
> -else
> -obj-y +=	no-block.o
> -endif
> -
> -obj-$(CONFIG_PROC_FS) += proc_namespace.o
> -
> +obj-$(CONFIG_BLOCK)		+= buffer.o mpage.o
> +obj-$(CONFIG_PROC_FS)		+= proc_namespace.o
>  obj-$(CONFIG_LEGACY_DIRECT_IO)	+= direct-io.o
>  obj-y				+= notify/
>  obj-$(CONFIG_EPOLL)		+= eventpoll.o
> diff --git a/fs/inode.c b/fs/inode.c
> index 4558dc2f135573..d43f07f146eb73 100644
> --- a/fs/inode.c
> +++ b/fs/inode.c
> @@ -2265,7 +2265,8 @@ void init_special_inode(struct inode *inode, umode_t mode, dev_t rdev)
>  		inode->i_fop = &def_chr_fops;
>  		inode->i_rdev = rdev;
>  	} else if (S_ISBLK(mode)) {
> -		inode->i_fop = &def_blk_fops;
> +		if (IS_ENABLED(CONFIG_BLOCK))
> +			inode->i_fop = &def_blk_fops;

It looks like def_blk_fops is being removed (commit message and patch
fragment below), but here (above line) it is being used.

Am I just confused?

>  		inode->i_rdev = rdev;
>  	} else if (S_ISFIFO(mode))
>  		inode->i_fop = &pipefifo_fops;
> diff --git a/fs/no-block.c b/fs/no-block.c
> deleted file mode 100644
> index 481c0f0ab4bd2c..00000000000000
> --- a/fs/no-block.c
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/* no-block.c: implementation of routines required for non-BLOCK configuration
> - *
> - * Copyright (C) 2006 Red Hat, Inc. All Rights Reserved.
> - * Written by David Howells (dhowells@redhat.com)
> - */
> -
> -#include <linux/kernel.h>
> -#include <linux/fs.h>
> -
> -static int no_blkdev_open(struct inode * inode, struct file * filp)
> -{
> -	return -ENODEV;
> -}
> -
> -const struct file_operations def_blk_fops = {
> -	.open		= no_blkdev_open,
> -	.llseek		= noop_llseek,
> -};

-- 
~Randy

