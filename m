Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 5924421D0E5
	for <lists+cluster-devel@lfdr.de>; Mon, 13 Jul 2020 09:51:23 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-4qYDOWcAPfS-slgXLU2eTA-1; Mon, 13 Jul 2020 03:51:20 -0400
X-MC-Unique: 4qYDOWcAPfS-slgXLU2eTA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57D6D18FF684;
	Mon, 13 Jul 2020 07:51:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A3EA357;
	Mon, 13 Jul 2020 07:51:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C49C172F50;
	Mon, 13 Jul 2020 07:51:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06D7p8mf024850 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 13 Jul 2020 03:51:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2B0CE10D14F0; Mon, 13 Jul 2020 07:51:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 26A6E10D14E6
	for <cluster-devel@redhat.com>; Mon, 13 Jul 2020 07:51:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1F60800399
	for <cluster-devel@redhat.com>; Mon, 13 Jul 2020 07:51:04 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-34-T9HzbY_YNVerqzgpPesq0A-1; Mon, 13 Jul 2020 03:51:02 -0400
X-MC-Unique: T9HzbY_YNVerqzgpPesq0A-1
Received: from 089144201169.atnat0010.highway.a1.net ([89.144.201.169]
	helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jutEl-0001HX-SP; Mon, 13 Jul 2020 07:50:56 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dave Chinner <david@fromorbit.com>, Goldwyn Rodrigues <rgoldwyn@suse.de>
Date: Mon, 13 Jul 2020 09:46:32 +0200
Message-Id: <20200713074633.875946-2-hch@lst.de>
In-Reply-To: <20200713074633.875946-1-hch@lst.de>
References: <20200713074633.875946-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org,
	Damien Le Moal <damien.lemoal@wdc.com>, linux-ext4@vger.kernel.org,
	"Darrick J . Wong" <darrick.wong@oracle.com>,
	Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
	linux-fsdevel@vger.kernel.org,
	Johannes Thumshirn <jth@kernel.org>, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH 1/2] iomap: Only invalidate page cache pages
	on direct IO writes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

From: Dave Chinner <dchinner@redhat.com>

The historic requirement for XFS to invalidate cached pages on
direct IO reads has been lost in the twisty pages of history - it was
inherited from Irix, which implemented page cache invalidation on
read as a method of working around problems synchronising page
cache state with uncached IO.

XFS has carried this ever since. In the initial linux ports it was
necessary to get mmap and DIO to play "ok" together and not
immediately corrupt data. This was the state of play until the linux
kernel had infrastructure to track unwritten extents and synchronise
page faults with allocations and unwritten extent conversions
(->page_mkwrite infrastructure). IOws, the page cache invalidation
on DIO read was necessary to prevent trivial data corruptions. This
didn't solve all the problems, though.

There were peformance problems if we didn't invalidate the entire
page cache over the file on read - we couldn't easily determine if
the cached pages were over the range of the IO, and invalidation
required taking a serialising lock (i_mutex) on the inode. This
serialising lock was an issue for XFS, as it was the only exclusive
lock in the direct Io read path.

Hence if there were any cached pages, we'd just invalidate the
entire file in one go so that subsequent IOs didn't need to take the
serialising lock. This was a problem that prevented ranged
invalidation from being particularly useful for avoiding the
remaining coherency issues. This was solved with the conversion of
i_mutex to i_rwsem and the conversion of the XFS inode IO lock to
use i_rwsem. Hence we could now just do ranged invalidation and the
performance problem went away.

However, page cache invalidation was still needed to serialise
sub-page/sub-block zeroing via direct IO against buffered IO because
bufferhead state attached to the cached page could get out of whack
when direct IOs were issued.  We've removed bufferheads from the
XFS code, and we don't carry any extent state on the cached pages
anymore, and so this problem has gone away, too.

IOWs, it would appear that we don't have any good reason to be
invalidating the page cache on DIO reads anymore. Hence remove the
invalidation on read because it is unnecessary overhead,
not needed to maintain coherency between mmap/buffered access and
direct IO anymore, and prevents anyone from using direct IO reads
from intentionally invalidating the page cache of a file.

Signed-off-by: Dave Chinner <dchinner@redhat.com>
Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>
Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/iomap/direct-io.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
index ec7b78e6fecaf9..190967e87b69e4 100644
--- a/fs/iomap/direct-io.c
+++ b/fs/iomap/direct-io.c
@@ -475,23 +475,22 @@ iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
 	if (ret)
 		goto out_free_dio;
 
-	/*
-	 * Try to invalidate cache pages for the range we're direct
-	 * writing.  If this invalidation fails, tough, the write will
-	 * still work, but racing two incompatible write paths is a
-	 * pretty crazy thing to do, so we don't support it 100%.
-	 */
-	ret = invalidate_inode_pages2_range(mapping,
-			pos >> PAGE_SHIFT, end >> PAGE_SHIFT);
-	if (ret)
-		dio_warn_stale_pagecache(iocb->ki_filp);
-	ret = 0;
+	if (iov_iter_rw(iter) == WRITE) {
+		/*
+		 * Try to invalidate cache pages for the range we are writing.
+		 * If this invalidation fails, tough, the write will still work,
+		 * but racing two incompatible write paths is a pretty crazy
+		 * thing to do, so we don't support it 100%.
+		 */
+		if (invalidate_inode_pages2_range(mapping, pos >> PAGE_SHIFT,
+				end >> PAGE_SHIFT))
+			dio_warn_stale_pagecache(iocb->ki_filp);
 
-	if (iov_iter_rw(iter) == WRITE && !wait_for_completion &&
-	    !inode->i_sb->s_dio_done_wq) {
-		ret = sb_init_dio_done_wq(inode->i_sb);
-		if (ret < 0)
-			goto out_free_dio;
+		if (!wait_for_completion && !inode->i_sb->s_dio_done_wq) {
+			ret = sb_init_dio_done_wq(inode->i_sb);
+			if (ret < 0)
+				goto out_free_dio;
+		}
 	}
 
 	inode_dio_begin(inode);
-- 
2.26.2

