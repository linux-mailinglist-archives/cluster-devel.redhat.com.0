Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE616EC637
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Apr 2023 08:22:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682317378;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DeEMnLNut18pjb9zsoS5o5eSPuPyLSQ1uVXA5zuWlvs=;
	b=Bn4oB5upM8bgGshgJdTRzwjbKSGd9ZnYrTq6a6dWvjth2Wt9zDvz4GGcuhVE0ouOgfQxrt
	gm+8gBxfjDfcjZFb6g9RaCpMrpI8PMhRdG9gBN5Bci40E7tjeqgtipoZpLV4juA600shb0
	xgQJlkxF7GSGFOPP12JL3/ectfm34e0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-GGYF4whyONu-zdwiVdg4Tw-1; Mon, 24 Apr 2023 02:22:55 -0400
X-MC-Unique: GGYF4whyONu-zdwiVdg4Tw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E714185A791;
	Mon, 24 Apr 2023 06:22:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 930DB14272BC;
	Mon, 24 Apr 2023 06:22:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 669721946589;
	Mon, 24 Apr 2023 06:22:54 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C302D1946586 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 24 Apr 2023 06:22:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A8821404DC43; Mon, 24 Apr 2023 06:22:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A0994404DC40
 for <cluster-devel@redhat.com>; Mon, 24 Apr 2023 06:22:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8576D811E7C
 for <cluster-devel@redhat.com>; Mon, 24 Apr 2023 06:22:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-f69cNfjmMb6n7kfZTnwXwQ-1; Mon, 24 Apr 2023 02:22:51 -0400
X-MC-Unique: f69cNfjmMb6n7kfZTnwXwQ-1
Received: from [2001:4bb8:189:a74f:e8a5:5f73:6d2:23b8] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pqp5e-00FPC9-1d; Mon, 24 Apr 2023 05:50:18 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 24 Apr 2023 07:49:25 +0200
Message-Id: <20230424054926.26927-17-hch@lst.de>
In-Reply-To: <20230424054926.26927-1-hch@lst.de>
References: <20230424054926.26927-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Cluster-devel] [PATCH 16/17] block: use iomap for writes to block
 devices
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Use iomap in buffer_head compat mode to write to block devices.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/Kconfig |  1 +
 block/fops.c  | 33 +++++++++++++++++++++++++++++----
 2 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/block/Kconfig b/block/Kconfig
index 941b2dca70db73..672b08f0096ab4 100644
--- a/block/Kconfig
+++ b/block/Kconfig
@@ -5,6 +5,7 @@
 menuconfig BLOCK
        bool "Enable the block layer" if EXPERT
        default y
+       select IOMAP
        select SBITMAP
        help
 	 Provide block layer support for the kernel.
diff --git a/block/fops.c b/block/fops.c
index 318247832a7bcf..7910636f8df33b 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -15,6 +15,7 @@
 #include <linux/falloc.h>
 #include <linux/suspend.h>
 #include <linux/fs.h>
+#include <linux/iomap.h>
 #include <linux/module.h>
 #include "blk.h"
 
@@ -386,6 +387,27 @@ static ssize_t blkdev_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
 	return __blkdev_direct_IO(iocb, iter, bio_max_segs(nr_pages));
 }
 
+static int blkdev_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
+		unsigned int flags, struct iomap *iomap, struct iomap *srcmap)
+{
+	struct block_device *bdev = I_BDEV(inode);
+	loff_t isize = i_size_read(inode);
+
+	iomap->bdev = bdev;
+	iomap->offset = ALIGN_DOWN(offset, bdev_logical_block_size(bdev));
+	if (WARN_ON_ONCE(iomap->offset >= isize))
+		return -EIO;
+	iomap->type = IOMAP_MAPPED;
+	iomap->addr = iomap->offset;
+	iomap->length = isize - iomap->offset;
+	iomap->flags |= IOMAP_F_BUFFER_HEAD;
+	return 0;
+}
+
+static const struct iomap_ops blkdev_iomap_ops = {
+	.iomap_begin		= blkdev_iomap_begin,
+};
+
 static int blkdev_writepage(struct page *page, struct writeback_control *wbc)
 {
 	return block_write_full_page(page, blkdev_get_block, wbc);
@@ -530,6 +552,11 @@ blkdev_direct_write(struct kiocb *iocb, struct iov_iter *from)
 	return written;
 }
 
+static ssize_t blkdev_buffered_write(struct kiocb *iocb, struct iov_iter *from)
+{
+	return iomap_file_buffered_write(iocb, from, &blkdev_iomap_ops);
+}
+
 /*
  * Write data to the block device.  Only intended for the block device itself
  * and the raw driver which basically is a fake block device.
@@ -575,16 +602,14 @@ static ssize_t blkdev_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		iov_iter_truncate(from, size);
 	}
 
-	current->backing_dev_info = bdev->bd_disk->bdi;
 	if (iocb->ki_flags & IOCB_DIRECT) {
 		ret = blkdev_direct_write(iocb, from);
 		if (ret >= 0 && iov_iter_count(from))
 			ret = direct_write_fallback(iocb, from, ret,
-					generic_perform_write(iocb, from));
+					blkdev_buffered_write(iocb, from));
 	} else {
-		ret = generic_perform_write(iocb, from);
+		ret = blkdev_buffered_write(iocb, from);
 	}
-	current->backing_dev_info = NULL;
 
 	if (ret > 0)
 		ret = generic_write_sync(iocb, ret);
-- 
2.39.2

