Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3FB464EE
	for <lists+cluster-devel@lfdr.de>; Fri, 14 Jun 2019 18:49:02 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1757930C1208;
	Fri, 14 Jun 2019 16:48:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 30B5F1001B1B;
	Fri, 14 Jun 2019 16:48:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 79B30206D1;
	Fri, 14 Jun 2019 16:48:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5EGk7K7032085 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 14 Jun 2019 12:46:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 421E9196B1; Fri, 14 Jun 2019 16:46:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (ovpn-204-142.brq.redhat.com [10.40.204.142])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7A08619C67;
	Fri, 14 Jun 2019 16:46:04 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Fri, 14 Jun 2019 18:46:01 +0200
Message-Id: <20190614164601.12939-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: Fix rounding error in
	gfs2_iomap_page_prepare
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Fri, 14 Jun 2019 16:49:00 +0000 (UTC)

The pos and len arguments to the iomap page_prepare callback are not
block aligned, so we need to take that into account when computing the
number of blocks.

Fixes: d0a22a4b03b8 ("gfs2: Fix iomap write page reclaim deadlock")
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/bmap.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index f42718dd292f..8bae7531e883 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -994,9 +994,12 @@ static void gfs2_write_unlock(struct inode *inode)
 static int gfs2_iomap_page_prepare(struct inode *inode, loff_t pos,
 				   unsigned len, struct iomap *iomap)
 {
+	unsigned int blockmask = i_blocksize(inode) - 1;
 	struct gfs2_sbd *sdp = GFS2_SB(inode);
+	unsigned int blocks;
 
-	return gfs2_trans_begin(sdp, RES_DINODE + (len >> inode->i_blkbits), 0);
+	blocks = ((pos & blockmask) + len + blockmask) >> inode->i_blkbits;
+	return gfs2_trans_begin(sdp, RES_DINODE + blocks, 0);
 }
 
 static void gfs2_iomap_page_done(struct inode *inode, loff_t pos,
-- 
2.20.1

