Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B71C7099A9
	for <lists+cluster-devel@lfdr.de>; Fri, 19 May 2023 16:29:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684506539;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WlcBct/wzp7TvW6xV2C5NZk4K9r7Xb2dIshCQXz8B/o=;
	b=IAmY9kBsR1F7WzyjLzyONpF+puMZNLF1NzN2m+f8NDVNvyZVJ/oo+ZPLzQqyB9v6APVcqt
	TWxZ9sxE/qBC2p4tdHGWYEatZUuhIVKjTPDnJKe+PY3g6itX4ky4iOMRBR5pwckcUHT6Ne
	OHOKOy8ZTZNEJL7MkmOQcKP+GFbgd+k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-F0GbysU2OsCoPM-U1JiS4g-1; Fri, 19 May 2023 10:28:54 -0400
X-MC-Unique: F0GbysU2OsCoPM-U1JiS4g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86F8A85A5BE;
	Fri, 19 May 2023 14:28:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 98E5E407DEC0;
	Fri, 19 May 2023 14:28:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A02A219465B7;
	Fri, 19 May 2023 14:28:31 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6E5F119465A4 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 19 May 2023 14:22:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 52D7C140E955; Fri, 19 May 2023 14:22:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AE5A140E954
 for <cluster-devel@redhat.com>; Fri, 19 May 2023 14:22:09 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2FDE185A5BF
 for <cluster-devel@redhat.com>; Fri, 19 May 2023 14:22:09 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-390-zJJCntgbOBiR240xPCjZZg-1; Fri,
 19 May 2023 10:22:04 -0400
X-MC-Unique: zJJCntgbOBiR240xPCjZZg-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D51C11FDA9;
 Fri, 19 May 2023 14:22:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 23E2213A12;
 Fri, 19 May 2023 14:22:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zjpzBgqGZ2TWHwAAMHmgww
 (envelope-from <hare@suse.de>); Fri, 19 May 2023 14:22:02 +0000
Message-ID: <b96b397e-2f5e-7910-3bb3-7405d0e293a7@suse.de>
Date: Fri, 19 May 2023 16:22:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20230424054926.26927-1-hch@lst.de>
 <20230424054926.26927-17-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20230424054926.26927-17-hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mailman-Approved-At: Fri, 19 May 2023 14:28:30 +0000
Subject: Re: [Cluster-devel] [PATCH 16/17] block: use iomap for writes to
 block devices
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: suse.de
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/24/23 07:49, Christoph Hellwig wrote:
> Use iomap in buffer_head compat mode to write to block devices.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   block/Kconfig |  1 +
>   block/fops.c  | 33 +++++++++++++++++++++++++++++----
>   2 files changed, 30 insertions(+), 4 deletions(-)
> 
> diff --git a/block/Kconfig b/block/Kconfig
> index 941b2dca70db73..672b08f0096ab4 100644
> --- a/block/Kconfig
> +++ b/block/Kconfig
> @@ -5,6 +5,7 @@
>   menuconfig BLOCK
>          bool "Enable the block layer" if EXPERT
>          default y
> +       select IOMAP
>          select SBITMAP
>          help
>   	 Provide block layer support for the kernel.
> diff --git a/block/fops.c b/block/fops.c
> index 318247832a7bcf..7910636f8df33b 100644
> --- a/block/fops.c
> +++ b/block/fops.c
> @@ -15,6 +15,7 @@
>   #include <linux/falloc.h>
>   #include <linux/suspend.h>
>   #include <linux/fs.h>
> +#include <linux/iomap.h>
>   #include <linux/module.h>
>   #include "blk.h"
>   
> @@ -386,6 +387,27 @@ static ssize_t blkdev_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
>   	return __blkdev_direct_IO(iocb, iter, bio_max_segs(nr_pages));
>   }
>   
> +static int blkdev_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
> +		unsigned int flags, struct iomap *iomap, struct iomap *srcmap)
> +{
> +	struct block_device *bdev = I_BDEV(inode);
> +	loff_t isize = i_size_read(inode);
> +
> +	iomap->bdev = bdev;
> +	iomap->offset = ALIGN_DOWN(offset, bdev_logical_block_size(bdev));
> +	if (WARN_ON_ONCE(iomap->offset >= isize))
> +		return -EIO;

I'm hitting this during booting:
[    5.016324]  <TASK>
[    5.030256]  iomap_iter+0x11a/0x350
[    5.030264]  iomap_readahead+0x1eb/0x2c0
[    5.030272]  read_pages+0x5d/0x220
[    5.030279]  page_cache_ra_unbounded+0x131/0x180
[    5.030284]  filemap_get_pages+0xff/0x5a0
[    5.030292]  filemap_read+0xca/0x320
[    5.030296]  ? aa_file_perm+0x126/0x500
[    5.040216]  ? touch_atime+0xc8/0x150
[    5.040224]  blkdev_read_iter+0xb0/0x150
[    5.040228]  vfs_read+0x226/0x2d0
[    5.040234]  ksys_read+0xa5/0xe0
[    5.040238]  do_syscall_64+0x5b/0x80

Maybe we should consider this patch:

diff --git a/block/fops.c b/block/fops.c
index 524b8a828aad..d202fb663f25 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -386,10 +386,13 @@ static int blkdev_iomap_begin(struct inode *inode, 
loff_t offset, loff_t length,

         iomap->bdev = bdev;
         iomap->offset = ALIGN_DOWN(offset, bdev_logical_block_size(bdev));
-       if (WARN_ON_ONCE(iomap->offset >= isize))
-               return -EIO;
-       iomap->type = IOMAP_MAPPED;
-       iomap->addr = iomap->offset;
+       if (WARN_ON_ONCE(iomap->offset >= isize)) {
+               iomap->type = IOMAP_HOLE;
+               iomap->addr = IOMAP_NULL_ADDR;
+       } else {
+               iomap->type = IOMAP_MAPPED;
+               iomap->addr = iomap->offset;
+       }
         iomap->length = isize - iomap->offset;
         if (IS_ENABLED(CONFIG_BUFFER_HEAD))
                 iomap->flags |= IOMAP_F_BUFFER_HEAD;


Other that the the system seems fine.

Cheers,

Hannes

