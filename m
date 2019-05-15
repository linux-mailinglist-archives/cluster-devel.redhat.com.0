Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E68E1FB24
	for <lists+cluster-devel@lfdr.de>; Wed, 15 May 2019 21:40:28 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2C61FC09AD17;
	Wed, 15 May 2019 19:40:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1487D60166;
	Wed, 15 May 2019 19:40:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EC2661806B0E;
	Wed, 15 May 2019 19:40:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4FJcNJi029006 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 May 2019 15:38:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A4EA960E39; Wed, 15 May 2019 19:38:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-119.phx2.redhat.com [10.3.116.119])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7104360BF7
	for <cluster-devel@redhat.com>; Wed, 15 May 2019 19:38:23 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 15 May 2019 14:38:01 -0500
Message-Id: <20190515193818.7642-9-rpeterso@redhat.com>
In-Reply-To: <20190515193818.7642-1-rpeterso@redhat.com>
References: <20190515193818.7642-1-rpeterso@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 v4 PATCH 08/25] gfs2: replace more printk
	with calls to fs_info and friends
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Wed, 15 May 2019 19:40:27 +0000 (UTC)

This patch replaces a few leftover printk errors with calls to
fs_info and similar, so that the file system having the error is
properly logged.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/bmap.c  |  2 +-
 fs/gfs2/glops.c |  3 ++-
 fs/gfs2/rgrp.c  | 27 ++++++++++++++-------------
 fs/gfs2/super.c |  6 +++---
 4 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index f42718dd292f..a809aa887521 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -1862,7 +1862,7 @@ static int punch_hole(struct gfs2_inode *ip, u64 offset, u64 length)
 			gfs2_assert_withdraw(sdp, bh);
 			if (gfs2_assert_withdraw(sdp,
 						 prev_bnr != bh->b_blocknr)) {
-				printk(KERN_EMERG "GFS2: fsid=%s:inode %llu, "
+				fs_emerg(sdp, "GFS2: fsid=%s:inode %llu, "
 				       "block:%llu, i_h:%u, s_h:%u, mp_h:%u\n",
 				       sdp->sd_fsname,
 				       (unsigned long long)ip->i_no_addr,
diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 84a403ed6e77..1e5720e50e9c 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -509,7 +509,8 @@ static void freeze_go_sync(struct gfs2_glock *gl)
 		atomic_set(&sdp->sd_freeze_state, SFS_STARTING_FREEZE);
 		error = freeze_super(sdp->sd_vfs);
 		if (error) {
-			printk(KERN_INFO "GFS2: couldn't freeze filesystem: %d\n", error);
+			fs_info(sdp, "GFS2: couldn't freeze filesystem: %d\n",
+				error);
 			gfs2_assert_withdraw(sdp, 0);
 		}
 		queue_work(gfs2_freeze_wq, &sdp->sd_freeze_work);
diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index ed3a6d3973a9..985d968b042c 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -1115,32 +1115,33 @@ static int gfs2_rgrp_lvb_valid(struct gfs2_rgrpd *rgd)
 {
 	struct gfs2_rgrp_lvb *rgl = rgd->rd_rgl;
 	struct gfs2_rgrp *str = (struct gfs2_rgrp *)rgd->rd_bits[0].bi_bh->b_data;
+	struct gfs2_sbd *sdp = rgd->rd_sbd;
 	int valid = 1;
 
 	if (rgl->rl_flags != str->rg_flags) {
-		printk(KERN_WARNING "GFS2: rgd: %llu lvb flag mismatch %u/%u",
-		       (unsigned long long)rgd->rd_addr,
+		fs_warn(sdp, "GFS2: rgd: %llu lvb flag mismatch %u/%u",
+			(unsigned long long)rgd->rd_addr,
 		       be32_to_cpu(rgl->rl_flags), be32_to_cpu(str->rg_flags));
 		valid = 0;
 	}
 	if (rgl->rl_free != str->rg_free) {
-		printk(KERN_WARNING "GFS2: rgd: %llu lvb free mismatch %u/%u",
-		       (unsigned long long)rgd->rd_addr,
-		       be32_to_cpu(rgl->rl_free), be32_to_cpu(str->rg_free));
+		fs_warn(sdp, "GFS2: rgd: %llu lvb free mismatch %u/%u",
+			(unsigned long long)rgd->rd_addr,
+			be32_to_cpu(rgl->rl_free), be32_to_cpu(str->rg_free));
 		valid = 0;
 	}
 	if (rgl->rl_dinodes != str->rg_dinodes) {
-		printk(KERN_WARNING "GFS2: rgd: %llu lvb dinode mismatch %u/%u",
-		       (unsigned long long)rgd->rd_addr,
-		       be32_to_cpu(rgl->rl_dinodes),
-		       be32_to_cpu(str->rg_dinodes));
+		fs_warn(sdp, "GFS2: rgd: %llu lvb dinode mismatch %u/%u",
+			(unsigned long long)rgd->rd_addr,
+			be32_to_cpu(rgl->rl_dinodes),
+			be32_to_cpu(str->rg_dinodes));
 		valid = 0;
 	}
 	if (rgl->rl_igeneration != str->rg_igeneration) {
-		printk(KERN_WARNING "GFS2: rgd: %llu lvb igen mismatch "
-		       "%llu/%llu", (unsigned long long)rgd->rd_addr,
-		       (unsigned long long)be64_to_cpu(rgl->rl_igeneration),
-		       (unsigned long long)be64_to_cpu(str->rg_igeneration));
+		fs_warn(sdp, "GFS2: rgd: %llu lvb igen mismatch %llu/%llu",
+			(unsigned long long)rgd->rd_addr,
+			(unsigned long long)be64_to_cpu(rgl->rl_igeneration),
+			(unsigned long long)be64_to_cpu(str->rg_igeneration));
 		valid = 0;
 	}
 	return valid;
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 6e3a318edccd..62cc451f30d5 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -981,14 +981,14 @@ void gfs2_freeze_func(struct work_struct *work)
 	error = gfs2_glock_nq_init(sdp->sd_freeze_gl, LM_ST_SHARED, 0,
 				   &freeze_gh);
 	if (error) {
-		printk(KERN_INFO "GFS2: couldn't get freeze lock : %d\n", error);
+		fs_info(sdp, "GFS2: couldn't get freeze lock : %d\n", error);
 		gfs2_assert_withdraw(sdp, 0);
 	} else {
 		atomic_set(&sdp->sd_freeze_state, SFS_UNFROZEN);
 		error = thaw_super(sb);
 		if (error) {
-			printk(KERN_INFO "GFS2: couldn't thaw filesystem: %d\n",
-			       error);
+			fs_info(sdp, "GFS2: couldn't thaw filesystem: %d\n",
+				error);
 			gfs2_assert_withdraw(sdp, 0);
 		}
 		if (!test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags))
-- 
2.20.1

