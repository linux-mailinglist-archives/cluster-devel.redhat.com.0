Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CC73C70E915
	for <lists+cluster-devel@lfdr.de>; Wed, 24 May 2023 00:27:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684880847;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=o+Mu9QUDJUPxCQ+nxaGfODHItInO1Mx21+1cY8P0+ko=;
	b=QdBLl96vq0TaFt0xNxcux0QEmK9EMq/laoF7frjpiFqPrsX0764K6YBqt2x0fU7lBqfOf0
	3GUBkSkNCE6AVswPaiqzyqakEKJ4iMj67NjUi8pvSfS83mU4TkonMDNhIcGJy/TwPi9U0P
	Y4XLqtXceHTBSpdhZPkAadHsbo0Gtq8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-411-qySkvNRpNs-Jt-HqeWmmzQ-1; Tue, 23 May 2023 18:27:24 -0400
X-MC-Unique: qySkvNRpNs-Jt-HqeWmmzQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9DE48802A55;
	Tue, 23 May 2023 22:27:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F0CB1140E95D;
	Tue, 23 May 2023 22:27:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8F32119465B3;
	Tue, 23 May 2023 22:27:21 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BAA4B19465A0 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 23 May 2023 22:27:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id ABD302166B26; Tue, 23 May 2023 22:27:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A33312166B25
 for <cluster-devel@redhat.com>; Tue, 23 May 2023 22:27:20 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86F80811E7C
 for <cluster-devel@redhat.com>; Tue, 23 May 2023 22:27:20 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-9YIrwRaoMxW4fta62o3UvA-1; Tue, 23 May 2023 18:27:18 -0400
X-MC-Unique: 9YIrwRaoMxW4fta62o3UvA-1
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-64a9335a8e7so52117b3a.0
 for <cluster-devel@redhat.com>; Tue, 23 May 2023 15:27:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684880837; x=1687472837;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o+Mu9QUDJUPxCQ+nxaGfODHItInO1Mx21+1cY8P0+ko=;
 b=NQs5Tz4ZT3bH+nQrKwy+nXZT8trx3mLOmEJwvBGYhVw7TrisW2sLk8vKfg0nT8It+q
 a8GSZ5aJvPYhG12v9SwBr4QF2DQ3lyy05iQrwwIaV1r+i9lyQlbtqemuk9xNZjRCrKOz
 dmDVP7t+Uxfmor+DzBxrMysSFC39mblS+Lab4B6m/gXREbCIv25Qj6Jq96nVJF818wlB
 AdE05O6aF4gyTZmkGQopjmsct00EXQjrUbzA8P1zqTEFEDH1fDiPxNBiqUm7DvIXabyS
 sBtpwt4keFP3MPRi5eG0vCqAX6jOocLS+zVFZVLe0+dxja61sBYHDGw9Fpj1yLUJ2i+/
 x5HA==
X-Gm-Message-State: AC+VfDwYtj+X6P4UaLSXQ4Dwq0t+saHSPobK1B6TR4CPKNY5PYko1wwC
 TCd/GrO6CfuZ1cXdyoWZnYplgw==
X-Google-Smtp-Source: ACHHUZ5+wDLkzWl5hqADeJv/K/pEdU5ftVoYvaXjN5yUsSSnEKzwjNvqAoa0WrZdkbq9aiPARCtcUw==
X-Received: by 2002:a05:6a20:3c8d:b0:10c:d5dd:c223 with SMTP id
 b13-20020a056a203c8d00b0010cd5ddc223mr1532145pzj.15.1684880837655; 
 Tue, 23 May 2023 15:27:17 -0700 (PDT)
Received: from dread.disaster.area (pa49-179-0-188.pa.nsw.optusnet.com.au.
 [49.179.0.188]) by smtp.gmail.com with ESMTPSA id
 d11-20020a63fd0b000000b005308b255502sm6443395pgh.68.2023.05.23.15.27.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 15:27:16 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
 (envelope-from <david@fromorbit.com>) id 1q1aTJ-0036Bu-2Z;
 Wed, 24 May 2023 08:27:13 +1000
Date: Wed, 24 May 2023 08:27:13 +1000
From: Dave Chinner <david@fromorbit.com>
To: Hannes Reinecke <hare@suse.de>
Message-ID: <ZG09wR4WOI8zDxJK@dread.disaster.area>
References: <20230424054926.26927-1-hch@lst.de>
 <20230424054926.26927-17-hch@lst.de>
 <b96b397e-2f5e-7910-3bb3-7405d0e293a7@suse.de>
MIME-Version: 1.0
In-Reply-To: <b96b397e-2f5e-7910-3bb3-7405d0e293a7@suse.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 linux-nfs@vger.kernel.org, cluster-devel@redhat.com, linux-xfs@vger.kernel.org,
 Miklos Szeredi <miklos@szeredi.hu>, "Darrick J. Wong" <djwong@kernel.org>,
 ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: fromorbit.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 19, 2023 at 04:22:01PM +0200, Hannes Reinecke wrote:
> On 4/24/23 07:49, Christoph Hellwig wrote:
> > Use iomap in buffer_head compat mode to write to block devices.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > ---
> >   block/Kconfig |  1 +
> >   block/fops.c  | 33 +++++++++++++++++++++++++++++----
> >   2 files changed, 30 insertions(+), 4 deletions(-)
> > 
> > diff --git a/block/Kconfig b/block/Kconfig
> > index 941b2dca70db73..672b08f0096ab4 100644
> > --- a/block/Kconfig
> > +++ b/block/Kconfig
> > @@ -5,6 +5,7 @@
> >   menuconfig BLOCK
> >          bool "Enable the block layer" if EXPERT
> >          default y
> > +       select IOMAP
> >          select SBITMAP
> >          help
> >   	 Provide block layer support for the kernel.
> > diff --git a/block/fops.c b/block/fops.c
> > index 318247832a7bcf..7910636f8df33b 100644
> > --- a/block/fops.c
> > +++ b/block/fops.c
> > @@ -15,6 +15,7 @@
> >   #include <linux/falloc.h>
> >   #include <linux/suspend.h>
> >   #include <linux/fs.h>
> > +#include <linux/iomap.h>
> >   #include <linux/module.h>
> >   #include "blk.h"
> > @@ -386,6 +387,27 @@ static ssize_t blkdev_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
> >   	return __blkdev_direct_IO(iocb, iter, bio_max_segs(nr_pages));
> >   }
> > +static int blkdev_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
> > +		unsigned int flags, struct iomap *iomap, struct iomap *srcmap)
> > +{
> > +	struct block_device *bdev = I_BDEV(inode);
> > +	loff_t isize = i_size_read(inode);
> > +
> > +	iomap->bdev = bdev;
> > +	iomap->offset = ALIGN_DOWN(offset, bdev_logical_block_size(bdev));
> > +	if (WARN_ON_ONCE(iomap->offset >= isize))
> > +		return -EIO;
> 
> I'm hitting this during booting:
> [    5.016324]  <TASK>
> [    5.030256]  iomap_iter+0x11a/0x350
> [    5.030264]  iomap_readahead+0x1eb/0x2c0
> [    5.030272]  read_pages+0x5d/0x220
> [    5.030279]  page_cache_ra_unbounded+0x131/0x180
> [    5.030284]  filemap_get_pages+0xff/0x5a0

Why is filemap_get_pages() using unbounded readahead? Surely
readahead should be limited to reading within EOF....

> [    5.030292]  filemap_read+0xca/0x320
> [    5.030296]  ? aa_file_perm+0x126/0x500
> [    5.040216]  ? touch_atime+0xc8/0x150
> [    5.040224]  blkdev_read_iter+0xb0/0x150
> [    5.040228]  vfs_read+0x226/0x2d0
> [    5.040234]  ksys_read+0xa5/0xe0
> [    5.040238]  do_syscall_64+0x5b/0x80
> 
> Maybe we should consider this patch:
> 
> diff --git a/block/fops.c b/block/fops.c
> index 524b8a828aad..d202fb663f25 100644
> --- a/block/fops.c
> +++ b/block/fops.c
> @@ -386,10 +386,13 @@ static int blkdev_iomap_begin(struct inode *inode,
> loff_t offset, loff_t length,
> 
>         iomap->bdev = bdev;
>         iomap->offset = ALIGN_DOWN(offset, bdev_logical_block_size(bdev));
> -       if (WARN_ON_ONCE(iomap->offset >= isize))
> -               return -EIO;
> -       iomap->type = IOMAP_MAPPED;
> -       iomap->addr = iomap->offset;
> +       if (WARN_ON_ONCE(iomap->offset >= isize)) {
> +               iomap->type = IOMAP_HOLE;
> +               iomap->addr = IOMAP_NULL_ADDR;
> +       } else {
> +               iomap->type = IOMAP_MAPPED;
> +               iomap->addr = iomap->offset;
> +       }

I think Christoph's code is correct. IMO, any attempt to read beyond
the end of the device should throw out a warning and return an
error, not silently return zeros.

If readahead is trying to read beyond the end of the device, then it
really seems to me like the problem here is readahead, not the iomap
code detecting the OOB read request....

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

