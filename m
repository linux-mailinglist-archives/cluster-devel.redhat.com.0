Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0B0FA21D0E4
	for <lists+cluster-devel@lfdr.de>; Mon, 13 Jul 2020 09:51:21 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-eaUoeVadPkue0QxJF8_Yvw-1; Mon, 13 Jul 2020 03:51:19 -0400
X-MC-Unique: eaUoeVadPkue0QxJF8_Yvw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51922C7467;
	Mon, 13 Jul 2020 07:51:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A40811001B07;
	Mon, 13 Jul 2020 07:51:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8CB201809563;
	Mon, 13 Jul 2020 07:51:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06D7pCg2024865 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 13 Jul 2020 03:51:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 49100E5963; Mon, 13 Jul 2020 07:51:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B900E38D7
	for <cluster-devel@redhat.com>; Mon, 13 Jul 2020 07:51:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A00618056A1
	for <cluster-devel@redhat.com>; Mon, 13 Jul 2020 07:51:08 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-22--FpJdKjhNEeVqTWSZ7rJ6Q-1; Mon, 13 Jul 2020 03:51:05 -0400
X-MC-Unique: -FpJdKjhNEeVqTWSZ7rJ6Q-1
Received: from [2001:4bb8:188:5f50:c70:4a89:bc61:2] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jutEo-0001Hf-2U; Mon, 13 Jul 2020 07:50:58 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dave Chinner <david@fromorbit.com>, Goldwyn Rodrigues <rgoldwyn@suse.de>
Date: Mon, 13 Jul 2020 09:46:33 +0200
Message-Id: <20200713074633.875946-3-hch@lst.de>
In-Reply-To: <20200713074633.875946-1-hch@lst.de>
References: <20200713074633.875946-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org,
	Damien Le Moal <damien.lemoal@wdc.com>,
	linux-ext4@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	cluster-devel@redhat.com, linux-fsdevel@vger.kernel.org,
	Johannes Thumshirn <jth@kernel.org>, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH 2/2] iomap: fall back to buffered writes for
	invalidation failures
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Failing to invalid the page cache means data in incoherent, which is
a very bad state for the system.  Always fall back to buffered I/O
through the page cache if we can't invalidate mappings.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ext4/file.c       |  2 ++
 fs/gfs2/file.c       |  3 ++-
 fs/iomap/direct-io.c | 13 ++++++++-----
 fs/iomap/trace.h     |  1 +
 fs/xfs/xfs_file.c    |  4 ++--
 fs/zonefs/super.c    |  7 +++++--
 6 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/fs/ext4/file.c b/fs/ext4/file.c
index 2a01e31a032c4c..0da6c2a2c32c1e 100644
--- a/fs/ext4/file.c
+++ b/fs/ext4/file.c
@@ -544,6 +544,8 @@ static ssize_t ext4_dio_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		iomap_ops = &ext4_iomap_overwrite_ops;
 	ret = iomap_dio_rw(iocb, from, iomap_ops, &ext4_dio_write_ops,
 			   is_sync_kiocb(iocb) || unaligned_io || extend);
+	if (ret == -EREMCHG)
+		ret = 0;
 
 	if (extend)
 		ret = ext4_handle_inode_extension(inode, offset, ret, count);
diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index fe305e4bfd3734..c7907d40c61d17 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -814,7 +814,8 @@ static ssize_t gfs2_file_direct_write(struct kiocb *iocb, struct iov_iter *from)
 
 	ret = iomap_dio_rw(iocb, from, &gfs2_iomap_ops, NULL,
 			   is_sync_kiocb(iocb));
-
+	if (ret == -EREMCHG)
+		ret = 0;
 out:
 	gfs2_glock_dq(&gh);
 out_uninit:
diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
index 190967e87b69e4..62626235cdbe8d 100644
--- a/fs/iomap/direct-io.c
+++ b/fs/iomap/direct-io.c
@@ -10,6 +10,7 @@
 #include <linux/backing-dev.h>
 #include <linux/uio.h>
 #include <linux/task_io_accounting_ops.h>
+#include "trace.h"
 
 #include "../internal.h"
 
@@ -478,13 +479,15 @@ iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
 	if (iov_iter_rw(iter) == WRITE) {
 		/*
 		 * Try to invalidate cache pages for the range we are writing.
-		 * If this invalidation fails, tough, the write will still work,
-		 * but racing two incompatible write paths is a pretty crazy
-		 * thing to do, so we don't support it 100%.
+		 * If this invalidation fails, let the caller fall back to
+		 * buffered I/O.
 		 */
 		if (invalidate_inode_pages2_range(mapping, pos >> PAGE_SHIFT,
-				end >> PAGE_SHIFT))
-			dio_warn_stale_pagecache(iocb->ki_filp);
+				end >> PAGE_SHIFT)) {
+			trace_iomap_dio_invalidate_fail(inode, pos, count);
+			ret = -EREMCHG;
+			goto out_free_dio;
+		}
 
 		if (!wait_for_completion && !inode->i_sb->s_dio_done_wq) {
 			ret = sb_init_dio_done_wq(inode->i_sb);
diff --git a/fs/iomap/trace.h b/fs/iomap/trace.h
index 5693a39d52fb63..fdc7ae388476f5 100644
--- a/fs/iomap/trace.h
+++ b/fs/iomap/trace.h
@@ -74,6 +74,7 @@ DEFINE_EVENT(iomap_range_class, name,	\
 DEFINE_RANGE_EVENT(iomap_writepage);
 DEFINE_RANGE_EVENT(iomap_releasepage);
 DEFINE_RANGE_EVENT(iomap_invalidatepage);
+DEFINE_RANGE_EVENT(iomap_dio_invalidate_fail);
 
 #define IOMAP_TYPE_STRINGS \
 	{ IOMAP_HOLE,		"HOLE" }, \
diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index 00db81eac80d6c..551cca39fa3ba6 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -553,8 +553,8 @@ xfs_file_dio_aio_write(
 	xfs_iunlock(ip, iolock);
 
 	/*
-	 * No fallback to buffered IO on errors for XFS, direct IO will either
-	 * complete fully or fail.
+	 * No partial fallback to buffered IO on errors for XFS, direct IO will
+	 * either complete fully or fail.
 	 */
 	ASSERT(ret < 0 || ret == count);
 	return ret;
diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
index 07bc42d62673ce..793850454b752f 100644
--- a/fs/zonefs/super.c
+++ b/fs/zonefs/super.c
@@ -786,8 +786,11 @@ static ssize_t zonefs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	if (iocb->ki_pos >= ZONEFS_I(inode)->i_max_size)
 		return -EFBIG;
 
-	if (iocb->ki_flags & IOCB_DIRECT)
-		return zonefs_file_dio_write(iocb, from);
+	if (iocb->ki_flags & IOCB_DIRECT) {
+		ret = zonefs_file_dio_write(iocb, from);
+		if (ret != -EREMCHG)
+			return ret;
+	}
 
 	return zonefs_file_buffered_write(iocb, from);
 }
-- 
2.26.2

