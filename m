Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1536E8193D
	for <lists+cluster-devel@lfdr.de>; Mon,  5 Aug 2019 14:26:17 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 139482BFD2;
	Mon,  5 Aug 2019 12:26:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 61E335D6C8;
	Mon,  5 Aug 2019 12:26:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 717E94E58A;
	Mon,  5 Aug 2019 12:26:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x75CPlHw016245 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 5 Aug 2019 08:25:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 789245DA8D; Mon,  5 Aug 2019 12:25:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.205.105])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B0EAD5DA8C;
	Mon,  5 Aug 2019 12:25:43 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon,  5 Aug 2019 14:25:41 +0200
Message-Id: <20190805122541.6676-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: gfs2_walk_metadata cleanup
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Mon, 05 Aug 2019 12:26:15 +0000 (UTC)

Simplify the code a bit and add an additional assertion.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/bmap.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 9fe1793ebf6f..5bfc20e9052d 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -471,7 +471,14 @@ static int gfs2_walk_metadata(struct inode *inode, sector_t lblock,
 		if (step >= len)
 			break;
 		len -= step;
+
+		if (mp != &clone) {
+			clone_metapath(&clone, mp);
+			mp = &clone;
+		}
+
 		if (ptr != WALK_NEXT) {
+			BUG_ON(mp->mp_aheight == mp->mp_fheight);
 			BUG_ON(!*ptr);
 			mp->mp_list[hgt] += ptr - start;
 			goto fill_up_metapath;
@@ -479,10 +486,6 @@ static int gfs2_walk_metadata(struct inode *inode, sector_t lblock,
 
 lower_metapath:
 		/* Decrease height of metapath. */
-		if (mp != &clone) {
-			clone_metapath(&clone, mp);
-			mp = &clone;
-		}
 		brelse(mp->mp_bh[hgt]);
 		mp->mp_bh[hgt] = NULL;
 		mp->mp_list[hgt] = 0;
@@ -503,10 +506,6 @@ static int gfs2_walk_metadata(struct inode *inode, sector_t lblock,
 
 fill_up_metapath:
 		/* Increase height of metapath. */
-		if (mp != &clone) {
-			clone_metapath(&clone, mp);
-			mp = &clone;
-		}
 		ret = fillup_metapath(ip, mp, ip->i_height - 1);
 		if (ret < 0)
 			break;
-- 
2.20.1

