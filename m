Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3490DAC1AE
	for <lists+cluster-devel@lfdr.de>; Fri,  6 Sep 2019 22:53:47 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 647F030821EC;
	Fri,  6 Sep 2019 20:53:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B19315C1D8;
	Fri,  6 Sep 2019 20:53:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 96F172551B;
	Fri,  6 Sep 2019 20:53:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x86KrLg0029990 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 6 Sep 2019 16:53:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5D0866D0BD; Fri,  6 Sep 2019 20:53:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (ovpn-204-227.brq.redhat.com [10.40.204.227])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CF04C5DC1B;
	Fri,  6 Sep 2019 20:52:42 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Date: Fri,  6 Sep 2019 22:52:41 +0200
Message-Id: <20190906205241.2292-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: Lukas Czerner <lczerner@redhat.com>, Christoph Hellwig <hch@lst.de>,
	Dave Chinner <david@fromorbit.com>,
	"Darrick J . Wong" <darrick.wong@oracle.com>
Subject: [Cluster-devel] [Q] gfs2: mmap write vs. punch_hole consistency
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Fri, 06 Sep 2019 20:53:46 +0000 (UTC)

Hi,

I've just fixed a mmap write vs. truncate consistency issue on gfs on
filesystems with a block size smaller that the page size [1].

It turns out that the same problem exists between mmap write and hole
punching, and since xfstests doesn't seem to cover that, I've written a
new test [2].  Ext4 and xfs both pass that test; they both apparently
mark the pages that have a hole punched in them as read-only so that
page_mkwrite is called before those pages can be written to again.

gfs2 fails that: for some reason, the partially block-mapped pages are
not marked read-only on gfs2, and so page_mkwrite is not called for the
partially block-mapped pages, and the hole is not filled in correctly.

The attached patch fixes the problem, but this really doesn't look right
as neither ext4 nor xfs require this kind of hack.  So what am I
overlooking, how does this work on ext4 and xfs?

Thanks,
Andreas

[1] gfs2: Improve mmap write vs. truncate consistency
https://www.redhat.com/archives/cluster-devel/2019-September/msg00009.html

[2] generic/567: test mmap write vs. hole punching
https://www.spinics.net/lists/fstests/msg12474.html

[PATCH] gfs2: Improve mmap write vs. punch_hole consistency

Fixes xfstest generic/567.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/bmap.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 9ef543dd38e2..e677e813be4c 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -2475,6 +2475,13 @@ int __gfs2_punch_hole(struct file *file, loff_t offset, loff_t length)
 			if (error)
 				goto out;
 		}
+		/*
+		 * If the first or last page partially lies in the hole, mark
+		 * the page read-only so that memory-mapped writes will trigger
+		 * page_mkwrite.
+		 */
+		pagecache_isize_extended(inode, offset, inode->i_size);
+		pagecache_isize_extended(inode, offset + length, inode->i_size);
 	}
 
 	if (gfs2_is_jdata(ip)) {
-- 
2.20.1

