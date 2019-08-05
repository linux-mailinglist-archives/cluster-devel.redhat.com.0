Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C34BA81940
	for <lists+cluster-devel@lfdr.de>; Mon,  5 Aug 2019 14:26:48 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 44DF7300DA30;
	Mon,  5 Aug 2019 12:26:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A43460C83;
	Mon,  5 Aug 2019 12:26:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 023534E58A;
	Mon,  5 Aug 2019 12:26:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x75CPO28016230 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 5 Aug 2019 08:25:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DF3206013A; Mon,  5 Aug 2019 12:25:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.205.105])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2362E6012D;
	Mon,  5 Aug 2019 12:25:21 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon,  5 Aug 2019 14:25:18 +0200
Message-Id: <20190805122518.6526-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: gfs2_walk_metadata fix
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Mon, 05 Aug 2019 12:26:47 +0000 (UTC)

In gfs2_walk_metadata, always reset mp->mp_list when decreasing the
current height.  Otherwise, gfs2_walk_metadata can end up skipping
metadata.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/bmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 327efee82060..9fe1793ebf6f 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -485,6 +485,7 @@ static int gfs2_walk_metadata(struct inode *inode, sector_t lblock,
 		}
 		brelse(mp->mp_bh[hgt]);
 		mp->mp_bh[hgt] = NULL;
+		mp->mp_list[hgt] = 0;
 		if (!hgt)
 			break;
 		hgt--;
@@ -495,7 +496,6 @@ static int gfs2_walk_metadata(struct inode *inode, sector_t lblock,
 		start = metapointer(hgt, mp);
 		end = metaend(hgt, mp);
 		if (start >= end) {
-			mp->mp_list[hgt] = 0;
 			if (!hgt)
 				break;
 			goto lower_metapath;
-- 
2.20.1

