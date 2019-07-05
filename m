Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9512460E2F
	for <lists+cluster-devel@lfdr.de>; Sat,  6 Jul 2019 01:56:43 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4CB2630842AC;
	Fri,  5 Jul 2019 23:56:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 18D17514B0;
	Fri,  5 Jul 2019 23:56:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C32D841F63;
	Fri,  5 Jul 2019 23:56:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x65NuVmJ016787 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 5 Jul 2019 19:56:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 847E118948; Fri,  5 Jul 2019 23:56:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.205.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8D8F39CD0;
	Fri,  5 Jul 2019 23:56:30 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Date: Sat,  6 Jul 2019 01:56:22 +0200
Message-Id: <20190705235622.22368-3-agruenba@redhat.com>
In-Reply-To: <20190705235622.22368-1-agruenba@redhat.com>
References: <20190705235622.22368-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 2/2] gfs2: Add support for IOMAP_ZERO
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Fri, 05 Jul 2019 23:56:42 +0000 (UTC)

Add support for the IOMAP_ZERO flag, which indicates a request to write
zeroes into a file without filling holes.  Used by iomap_zero_range.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/bmap.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index e2c58c6a1276..aabd78a1ae59 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -1029,7 +1029,7 @@ static int __gfs2_iomap_begin(struct inode *inode, loff_t pos, loff_t length,
 	iomap->flags |= IOMAP_F_BUFFER_HEAD;
 
 	ret = gfs2_iomap_get(inode, pos, length, flags, iomap, mp);
-	if (ret || !(flags & IOMAP_WRITE))
+	if (ret || !(flags & (IOMAP_WRITE | IOMAP_ZERO)))
 		return ret;
 	if (flags & IOMAP_DIRECT) {
 		/*
@@ -1040,6 +1040,10 @@ static int __gfs2_iomap_begin(struct inode *inode, loff_t pos, loff_t length,
 			return -ENOTBLK;
 		return 0;
 	}
+	if (flags & IOMAP_ZERO) {
+		if (iomap->type == IOMAP_HOLE)
+			return 0;
+	}
 
 	unstuff = gfs2_is_stuffed(ip) &&
 		  pos + length > gfs2_max_stuffed_size(ip);
@@ -1156,8 +1160,12 @@ static int gfs2_iomap_end(struct inode *inode, loff_t pos, loff_t length,
 	struct gfs2_inode *ip = GFS2_I(inode);
 	struct gfs2_sbd *sdp = GFS2_SB(inode);
 
-	if (!(flags & IOMAP_WRITE) || (flags & IOMAP_DIRECT))
+	if (!(flags & (IOMAP_WRITE | IOMAP_ZERO)) || (flags & IOMAP_DIRECT))
 		goto out;
+	if (flags & IOMAP_ZERO) {
+		if (iomap->type == IOMAP_HOLE)
+			goto out;
+	}
 
 	if (!gfs2_is_stuffed(ip))
 		gfs2_ordered_add_inode(ip);
@@ -1181,7 +1189,8 @@ static int gfs2_iomap_end(struct inode *inode, loff_t pos, loff_t length,
 
 	if (ip->i_qadata && ip->i_qadata->qa_qd_num)
 		gfs2_quota_unlock(ip);
-	gfs2_write_unlock(inode);
+	if (flags & IOMAP_WRITE)
+		gfs2_write_unlock(inode);
 
 out:
 	return 0;
-- 
2.20.1

