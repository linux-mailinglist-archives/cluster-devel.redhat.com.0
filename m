Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6BF8ECCB
	for <lists+cluster-devel@lfdr.de>; Thu, 15 Aug 2019 15:27:36 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CBD2D3001596;
	Thu, 15 Aug 2019 13:27:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 99A49841D1;
	Thu, 15 Aug 2019 13:27:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2A60418005A0;
	Thu, 15 Aug 2019 13:27:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7FDRPHa004930 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 15 Aug 2019 09:27:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E39C760CC0; Thu, 15 Aug 2019 13:27:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-117-77.phx2.redhat.com [10.3.117.77])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AEBBD95A42
	for <cluster-devel@redhat.com>; Thu, 15 Aug 2019 13:27:25 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 15 Aug 2019 08:27:21 -0500
Message-Id: <20190815132722.1522-2-rpeterso@redhat.com>
In-Reply-To: <20190815132722.1522-1-rpeterso@redhat.com>
References: <20190815132722.1522-1-rpeterso@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 1/2] gfs2: separate holder for rgrps in
	gfs2_rename
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Thu, 15 Aug 2019 13:27:35 +0000 (UTC)

Before this patch, gfs2_rename added a holder for the rgrp glock to
its array of holders, ghs. There's nothing wrong with that, but this
patch separates it into a separate holder. This was done to ensure
it's always locked last as per the proper glock lock ordering,
and also to pave the way for a future patch in which we will
lock the non-rgrp glocks asynchronously.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/inode.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index 2e2a8a2fb51d..1ced4d0a3b04 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -1348,7 +1348,7 @@ static int gfs2_rename(struct inode *odir, struct dentry *odentry,
 	struct gfs2_inode *ip = GFS2_I(d_inode(odentry));
 	struct gfs2_inode *nip = NULL;
 	struct gfs2_sbd *sdp = GFS2_SB(odir);
-	struct gfs2_holder ghs[5], r_gh;
+	struct gfs2_holder ghs[4], r_gh, rd_gh;
 	struct gfs2_rgrpd *nrgd;
 	unsigned int num_gh;
 	int dir_rename = 0;
@@ -1357,6 +1357,7 @@ static int gfs2_rename(struct inode *odir, struct dentry *odentry,
 	int error;
 
 	gfs2_holder_mark_uninitialized(&r_gh);
+	gfs2_holder_mark_uninitialized(&rd_gh);
 	if (d_really_is_positive(ndentry)) {
 		nip = GFS2_I(d_inode(ndentry));
 		if (ip == nip)
@@ -1404,7 +1405,8 @@ static int gfs2_rename(struct inode *odir, struct dentry *odentry,
 		 */
 		nrgd = gfs2_blk2rgrpd(sdp, nip->i_no_addr, 1);
 		if (nrgd)
-			gfs2_holder_init(nrgd->rd_gl, LM_ST_EXCLUSIVE, 0, ghs + num_gh++);
+			gfs2_holder_init(nrgd->rd_gl, LM_ST_EXCLUSIVE, 0,
+					 &rd_gh);
 	}
 
 	for (x = 0; x < num_gh; x++) {
@@ -1413,6 +1415,12 @@ static int gfs2_rename(struct inode *odir, struct dentry *odentry,
 			goto out_gunlock;
 	}
 
+	if (gfs2_holder_initialized(&rd_gh)) {
+		error = gfs2_glock_nq(&rd_gh);
+		if (error)
+			goto out_gunlock;
+	}
+
 	error = -ENOENT;
 	if (ip->i_inode.i_nlink == 0)
 		goto out_gunlock;
@@ -1541,6 +1549,9 @@ static int gfs2_rename(struct inode *odir, struct dentry *odentry,
 		gfs2_quota_unlock(ndip);
 out_gunlock:
 	gfs2_dir_no_add(&da);
+	if (gfs2_holder_initialized(&rd_gh))
+		gfs2_glock_dq_uninit(&rd_gh);
+
 	while (x--) {
 		gfs2_glock_dq(ghs + x);
 		gfs2_holder_uninit(ghs + x);
-- 
2.21.0

