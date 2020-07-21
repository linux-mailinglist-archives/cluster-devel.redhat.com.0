Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2A06122889A
	for <lists+cluster-devel@lfdr.de>; Tue, 21 Jul 2020 20:55:43 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-7jHs6fe1Nau2MxdjlpIj_w-1; Tue, 21 Jul 2020 14:55:40 -0400
X-MC-Unique: 7jHs6fe1Nau2MxdjlpIj_w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 211D0800469;
	Tue, 21 Jul 2020 18:55:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 120A5710C3;
	Tue, 21 Jul 2020 18:55:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F31071809563;
	Tue, 21 Jul 2020 18:55:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06LItOxp022268 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 21 Jul 2020 14:55:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 837082157F23; Tue, 21 Jul 2020 18:55:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 724972166B28
	for <cluster-devel@redhat.com>; Tue, 21 Jul 2020 18:55:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58CE6924906
	for <cluster-devel@redhat.com>; Tue, 21 Jul 2020 18:55:24 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-11-1C6hZXogPKGHVfDwFfF_xQ-1; Tue, 21 Jul 2020 14:55:19 -0400
X-MC-Unique: 1C6hZXogPKGHVfDwFfF_xQ-1
Received: from [2001:4bb8:18c:2acc:5b1c:6483:bd6d:e406] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxx3c-00062e-DZ; Tue, 21 Jul 2020 18:32:05 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dave Chinner <david@fromorbit.com>, Goldwyn Rodrigues <rgoldwyn@suse.de>
Date: Tue, 21 Jul 2020 20:31:57 +0200
Message-Id: <20200721183157.202276-4-hch@lst.de>
In-Reply-To: <20200721183157.202276-1-hch@lst.de>
References: <20200721183157.202276-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org,
	Damien Le Moal <damien.lemoal@wdc.com>,
	linux-ext4@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	cluster-devel@redhat.com, Goldwyn Rodrigues <rgoldwyn@suse.com>,
	linux-fsdevel@vger.kernel.org,
	Johannes Thumshirn <jth@kernel.org>, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH 3/3] iomap: fall back to buffered writes for
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Failing to invalid the page cache means data in incoherent, which is
a very bad state for the system.  Always fall back to buffered I/O
through the page cache if we can't invalidate mappings.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Dave Chinner <dchinner@redhat.com>
Reviewed-by: Goldwyn Rodrigues <rgoldwyn@suse.com>
---
 fs/ext4/file.c       |  2 ++
 fs/gfs2/file.c       |  3 ++-
 fs/iomap/direct-io.c | 16 +++++++++++-----
 fs/iomap/trace.h     |  1 +
 fs/xfs/xfs_file.c    |  4 ++--
 fs/zonefs/super.c    |  7 +++++--
 6 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/fs/ext4/file.c b/fs/ext4/file.c
index 2a01e31a032c4c..129cc1dd6b7952 100644
--- a/fs/ext4/file.c
+++ b/fs/ext4/file.c
@@ -544,6 +544,8 @@ static ssize_t ext4_dio_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		iomap_ops = &ext4_iomap_overwrite_ops;
 	ret = iomap_dio_rw(iocb, from, iomap_ops, &ext4_dio_write_ops,
 			   is_sync_kiocb(iocb) || unaligned_io || extend);
+	if (ret == -ENOTBLK)
+		ret = 0;
 
 	if (extend)
 		ret = ext4_handle_inode_extension(inode, offset, ret, count);
diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index bebde537ac8cf2..b085a3bea4f0fd 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -835,7 +835,8 @@ static ssize_t gfs2_file_direct_write(struct kiocb *iocb, struct iov_iter *from)
 
 	ret = iomap_dio_rw(iocb, from, &gfs2_iomap_ops, NULL,
 			   is_sync_kiocb(iocb));
-
+	if (ret == -ENOTBLK)
+		ret = 0;
 out:
 	gfs2_glock_dq(&gh);
 out_uninit:
diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
index 190967e87b69e4..c1aafb2ab99072 100644
--- a/fs/iomap/direct-io.c
+++ b/fs/iomap/direct-io.c
@@ -10,6 +10,7 @@
 #include <linux/backing-dev.h>
 #include <linux/uio.h>
 #include <linux/task_io_accounting_ops.h>
+#include "trace.h"
 
 #include "../internal.h"
 
@@ -401,6 +402,9 @@ iomap_dio_actor(struct inode *inode, loff_t pos, loff_t length,
  * can be mapped into multiple disjoint IOs and only a subset of the IOs issued
  * may be pure data writes. In that case, we still need to do a full data sync
  * completion.
+ *
+ * Returns -ENOTBLK In case of a page invalidation invalidation failure for
+ * writes.  The callers needs to fall back to buffered I/O in this case.
  */
 ssize_t
 iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
@@ -478,13 +482,15 @@ iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
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
+			ret = -ENOTBLK;
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
index a6ef90457abf97..1b4517fc55f1b9 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -553,8 +553,8 @@ xfs_file_dio_aio_write(
 	xfs_iunlock(ip, iolock);
 
 	/*
-	 * No fallback to buffered IO on errors for XFS, direct IO will either
-	 * complete fully or fail.
+	 * No fallback to buffered IO after short writes for XFS, direct I/O
+	 * will either complete fully or return an error.
 	 */
 	ASSERT(ret < 0 || ret == count);
 	return ret;
diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
index 07bc42d62673ce..d0a04528a7e18e 100644
--- a/fs/zonefs/super.c
+++ b/fs/zonefs/super.c
@@ -786,8 +786,11 @@ static ssize_t zonefs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	if (iocb->ki_pos >= ZONEFS_I(inode)->i_max_size)
 		return -EFBIG;
 
-	if (iocb->ki_flags & IOCB_DIRECT)
-		return zonefs_file_dio_write(iocb, from);
+	if (iocb->ki_flags & IOCB_DIRECT) {
+		ssize_t ret = zonefs_file_dio_write(iocb, from);
+		if (ret != -ENOTBLK)
+			return ret;
+	}
 
 	return zonefs_file_buffered_write(iocb, from);
 }
-- 
2.27.0

