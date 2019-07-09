Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4C96377D
	for <lists+cluster-devel@lfdr.de>; Tue,  9 Jul 2019 16:09:10 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 14EC675734;
	Tue,  9 Jul 2019 14:08:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F33DC831D9;
	Tue,  9 Jul 2019 14:08:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D515B18184A5;
	Tue,  9 Jul 2019 14:08:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x69E7MPd016074 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 9 Jul 2019 10:07:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 59AF4831C5; Tue,  9 Jul 2019 14:07:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.205.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 60EE0831B7;
	Tue,  9 Jul 2019 14:07:18 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Tue,  9 Jul 2019 16:06:49 +0200
Message-Id: <20190709140657.19064-11-agruenba@redhat.com>
In-Reply-To: <20190709140657.19064-1-agruenba@redhat.com>
References: <20190709140657.19064-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 10/18] gfs2: replace more printk with
	calls to fs_info and friends
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Tue, 09 Jul 2019 14:09:09 +0000 (UTC)

From: Bob Peterson <rpeterso@redhat.com>

This patch replaces a few leftover printk errors with calls to
fs_info and similar, so that the file system having the error is
properly logged.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/bmap.c  |  5 ++---
 fs/gfs2/glops.c |  3 ++-
 fs/gfs2/rgrp.c  | 27 ++++++++++++++-------------
 fs/gfs2/super.c |  6 +++---
 4 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 93ea1d529aa3..3b761a0ba6ab 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -1862,9 +1862,8 @@ static int punch_hole(struct gfs2_inode *ip, u64 offset, u64 length)
 			gfs2_assert_withdraw(sdp, bh);
 			if (gfs2_assert_withdraw(sdp,
 						 prev_bnr != bh->b_blocknr)) {
-				printk(KERN_EMERG "GFS2: fsid=%s:inode %llu, "
-				       "block:%llu, i_h:%u, s_h:%u, mp_h:%u\n",
-				       sdp->sd_fsname,
+				fs_emerg(sdp, "inode %llu, block:%llu, i_h:%u,"
+					 "s_h:%u, mp_h:%u\n",
 				       (unsigned long long)ip->i_no_addr,
 				       prev_bnr, ip->i_height, strip_h, mp_h);
 			}
diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 68e2a2d4e6a6..ff213690e364 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -506,7 +506,8 @@ static void freeze_go_sync(struct gfs2_glock *gl)
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
index a60b36fdbdd6..49ac0a5e74ea 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -1112,32 +1112,33 @@ static int gfs2_rgrp_lvb_valid(struct gfs2_rgrpd *rgd)
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
index 3eae973d525f..0acc5834f653 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -978,14 +978,14 @@ void gfs2_freeze_func(struct work_struct *work)
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

