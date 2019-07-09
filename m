Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CAF6377C
	for <lists+cluster-devel@lfdr.de>; Tue,  9 Jul 2019 16:09:09 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 968FA309C390;
	Tue,  9 Jul 2019 14:08:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 812161001DDD;
	Tue,  9 Jul 2019 14:08:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 15AD7206D2;
	Tue,  9 Jul 2019 14:08:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x69E7mNx016167 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 9 Jul 2019 10:07:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5E361831B7; Tue,  9 Jul 2019 14:07:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.205.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9220F831D7;
	Tue,  9 Jul 2019 14:07:45 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Tue,  9 Jul 2019 16:06:57 +0200
Message-Id: <20190709140657.19064-19-agruenba@redhat.com>
In-Reply-To: <20190709140657.19064-1-agruenba@redhat.com>
References: <20190709140657.19064-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 18/18] gfs2: Remove unused
	gfs2_iomap_alloc argument
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Tue, 09 Jul 2019 14:09:08 +0000 (UTC)

Remove the unused flags argument of gfs2_iomap_alloc.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/bmap.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 3b761a0ba6ab..bd0b0cd38dbe 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -595,7 +595,6 @@ enum alloc_state {
  * gfs2_iomap_alloc - Build a metadata tree of the requested height
  * @inode: The GFS2 inode
  * @iomap: The iomap structure
- * @flags: iomap flags
  * @mp: The metapath, with proper height information calculated
  *
  * In this routine we may have to alloc:
@@ -622,7 +621,7 @@ enum alloc_state {
  */
 
 static int gfs2_iomap_alloc(struct inode *inode, struct iomap *iomap,
-			    unsigned flags, struct metapath *mp)
+			    struct metapath *mp)
 {
 	struct gfs2_inode *ip = GFS2_I(inode);
 	struct gfs2_sbd *sdp = GFS2_SB(inode);
@@ -1088,7 +1087,7 @@ static int gfs2_iomap_begin_write(struct inode *inode, loff_t pos,
 		}
 
 		if (iomap->type == IOMAP_HOLE) {
-			ret = gfs2_iomap_alloc(inode, iomap, flags, mp);
+			ret = gfs2_iomap_alloc(inode, iomap, mp);
 			if (ret) {
 				gfs2_trans_end(sdp);
 				gfs2_inplace_release(ip);
@@ -1232,7 +1231,7 @@ int gfs2_block_map(struct inode *inode, sector_t lblock,
 	if (create) {
 		ret = gfs2_iomap_get(inode, pos, length, IOMAP_WRITE, &iomap, &mp);
 		if (!ret && iomap.type == IOMAP_HOLE)
-			ret = gfs2_iomap_alloc(inode, &iomap, IOMAP_WRITE, &mp);
+			ret = gfs2_iomap_alloc(inode, &iomap, &mp);
 		release_metapath(&mp);
 	} else {
 		ret = gfs2_iomap_get(inode, pos, length, 0, &iomap, &mp);
@@ -1462,7 +1461,7 @@ int gfs2_iomap_get_alloc(struct inode *inode, loff_t pos, loff_t length,
 
 	ret = gfs2_iomap_get(inode, pos, length, IOMAP_WRITE, iomap, &mp);
 	if (!ret && iomap->type == IOMAP_HOLE)
-		ret = gfs2_iomap_alloc(inode, iomap, IOMAP_WRITE, &mp);
+		ret = gfs2_iomap_alloc(inode, iomap, &mp);
 	release_metapath(&mp);
 	return ret;
 }
-- 
2.20.1

