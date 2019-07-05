Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DD660E31
	for <lists+cluster-devel@lfdr.de>; Sat,  6 Jul 2019 01:56:43 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1B4C38665F;
	Fri,  5 Jul 2019 23:56:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D5FBC9CD0;
	Fri,  5 Jul 2019 23:56:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 79A6718184B6;
	Fri,  5 Jul 2019 23:56:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x65NuU3W016777 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 5 Jul 2019 19:56:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2FB252B9E6; Fri,  5 Jul 2019 23:56:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.205.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 391919CD0;
	Fri,  5 Jul 2019 23:56:29 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Date: Sat,  6 Jul 2019 01:56:21 +0200
Message-Id: <20190705235622.22368-2-agruenba@redhat.com>
In-Reply-To: <20190705235622.22368-1-agruenba@redhat.com>
References: <20190705235622.22368-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 1/2] gfs2: gfs2_iomap_begin cleanup
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Fri, 05 Jul 2019 23:56:42 +0000 (UTC)

Turn function gfs2_iomap_begin_write into something all iomap functions
will go through (and rename it to __gfs2_iomap_begin).  This will
simplify adding support for IOMAP_ZERO.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/bmap.c | 53 +++++++++++++++++++++++++-------------------------
 1 file changed, 26 insertions(+), 27 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 3b761a0ba6ab..e2c58c6a1276 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -1016,10 +1016,9 @@ static const struct iomap_page_ops gfs2_iomap_page_ops = {
 	.page_done = gfs2_iomap_page_done,
 };
 
-static int gfs2_iomap_begin_write(struct inode *inode, loff_t pos,
-				  loff_t length, unsigned flags,
-				  struct iomap *iomap,
-				  struct metapath *mp)
+static int __gfs2_iomap_begin(struct inode *inode, loff_t pos, loff_t length,
+			      unsigned flags, struct iomap *iomap,
+			      struct metapath *mp)
 {
 	struct gfs2_inode *ip = GFS2_I(inode);
 	struct gfs2_sbd *sdp = GFS2_SB(inode);
@@ -1027,17 +1026,23 @@ static int gfs2_iomap_begin_write(struct inode *inode, loff_t pos,
 	bool unstuff, alloc_required;
 	int ret;
 
-	ret = gfs2_write_lock(inode);
-	if (ret)
+	iomap->flags |= IOMAP_F_BUFFER_HEAD;
+
+	ret = gfs2_iomap_get(inode, pos, length, flags, iomap, mp);
+	if (ret || !(flags & IOMAP_WRITE))
 		return ret;
+	if (flags & IOMAP_DIRECT) {
+		/*
+		 * Silently fall back to buffered I/O for stuffed files or if
+		 * we've got a hole (see gfs2_file_direct_write).
+		 */
+		if (iomap->type != IOMAP_MAPPED)
+			return -ENOTBLK;
+		return 0;
+	}
 
 	unstuff = gfs2_is_stuffed(ip) &&
 		  pos + length > gfs2_max_stuffed_size(ip);
-
-	ret = gfs2_iomap_get(inode, pos, length, flags, iomap, mp);
-	if (ret)
-		goto out_unlock;
-
 	alloc_required = unstuff || iomap->type == IOMAP_HOLE;
 
 	if (alloc_required || gfs2_is_jdata(ip))
@@ -1051,7 +1056,7 @@ static int gfs2_iomap_begin_write(struct inode *inode, loff_t pos,
 
 		ret = gfs2_quota_lock_check(ip, &ap);
 		if (ret)
-			goto out_unlock;
+			return ret;
 
 		ret = gfs2_inplace_reserve(ip, &ap);
 		if (ret)
@@ -1118,8 +1123,6 @@ static int gfs2_iomap_begin_write(struct inode *inode, loff_t pos,
 out_qunlock:
 	if (alloc_required)
 		gfs2_quota_unlock(ip);
-out_unlock:
-	gfs2_write_unlock(inode);
 	return ret;
 }
 
@@ -1130,23 +1133,19 @@ static int gfs2_iomap_begin(struct inode *inode, loff_t pos, loff_t length,
 	struct metapath mp = { .mp_aheight = 1, };
 	int ret;
 
-	iomap->flags |= IOMAP_F_BUFFER_HEAD;
-
 	trace_gfs2_iomap_start(ip, pos, length, flags);
 	if ((flags & IOMAP_WRITE) && !(flags & IOMAP_DIRECT)) {
-		ret = gfs2_iomap_begin_write(inode, pos, length, flags, iomap, &mp);
+		ret = gfs2_write_lock(inode);
+		if (ret)
+			goto out;
+		ret = __gfs2_iomap_begin(inode, pos, length, flags, iomap, &mp);
+		if (ret)
+			gfs2_write_unlock(inode);
 	} else {
-		ret = gfs2_iomap_get(inode, pos, length, flags, iomap, &mp);
-
-		/*
-		 * Silently fall back to buffered I/O for stuffed files or if
-		 * we've hot a hole (see gfs2_file_direct_write).
-		 */
-		if ((flags & IOMAP_WRITE) && (flags & IOMAP_DIRECT) &&
-		    iomap->type != IOMAP_MAPPED)
-			ret = -ENOTBLK;
+		ret = __gfs2_iomap_begin(inode, pos, length, flags, iomap, &mp);
 	}
 	release_metapath(&mp);
+out:
 	trace_gfs2_iomap_end(ip, iomap, ret);
 	return ret;
 }
@@ -1157,7 +1156,7 @@ static int gfs2_iomap_end(struct inode *inode, loff_t pos, loff_t length,
 	struct gfs2_inode *ip = GFS2_I(inode);
 	struct gfs2_sbd *sdp = GFS2_SB(inode);
 
-	if ((flags & (IOMAP_WRITE | IOMAP_DIRECT)) != IOMAP_WRITE)
+	if (!(flags & IOMAP_WRITE) || (flags & IOMAP_DIRECT))
 		goto out;
 
 	if (!gfs2_is_stuffed(ip))
-- 
2.20.1

