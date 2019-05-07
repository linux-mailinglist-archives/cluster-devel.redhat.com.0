Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E73716C3E
	for <lists+cluster-devel@lfdr.de>; Tue,  7 May 2019 22:32:19 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D583DC0578F8;
	Tue,  7 May 2019 20:32:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BDFE61001DCC;
	Tue,  7 May 2019 20:32:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A1DC718089CC;
	Tue,  7 May 2019 20:32:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x47KWGVG018839 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 7 May 2019 16:32:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4D90D18EE2; Tue,  7 May 2019 20:32:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.205.80])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 804B017CC3;
	Tue,  7 May 2019 20:32:15 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Tue,  7 May 2019 22:31:58 +0200
Message-Id: <20190507203204.26008-6-agruenba@redhat.com>
In-Reply-To: <20190507203204.26008-1-agruenba@redhat.com>
References: <20190507203204.26008-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 06/12] gfs2: Remove misleading comments
	in gfs2_evict_inode
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Tue, 07 May 2019 20:32:18 +0000 (UTC)

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/super.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index e20fa55715e2..a6a325b2a78b 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1630,8 +1630,6 @@ static void gfs2_evict_inode(struct inode *inode)
 			goto out_truncate;
 	}
 
-	/* Case 1 starts here */
-
 	if (S_ISDIR(inode->i_mode) &&
 	    (ip->i_diskflags & GFS2_DIF_EXHASH)) {
 		error = gfs2_dir_exhash_dealloc(ip);
@@ -1670,7 +1668,6 @@ static void gfs2_evict_inode(struct inode *inode)
 	write_inode_now(inode, 1);
 	gfs2_ail_flush(ip->i_gl, 0);
 
-	/* Case 2 starts here */
 	error = gfs2_trans_begin(sdp, 0, sdp->sd_jdesc->jd_blocks);
 	if (error)
 		goto out_unlock;
@@ -1680,7 +1677,6 @@ static void gfs2_evict_inode(struct inode *inode)
 	gfs2_trans_end(sdp);
 
 out_unlock:
-	/* Error path for case 1 */
 	if (gfs2_rs_active(&ip->i_res))
 		gfs2_rs_deltree(&ip->i_res);
 
@@ -1699,7 +1695,6 @@ static void gfs2_evict_inode(struct inode *inode)
 	if (error && error != GLR_TRYFAILED && error != -EROFS)
 		fs_warn(sdp, "gfs2_evict_inode: %d\n", error);
 out:
-	/* Case 3 starts here */
 	truncate_inode_pages_final(&inode->i_data);
 	gfs2_rsqa_delete(ip, NULL);
 	gfs2_ordered_del_inode(ip);
-- 
2.20.1

