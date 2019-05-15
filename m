Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC7A1FB1F
	for <lists+cluster-devel@lfdr.de>; Wed, 15 May 2019 21:40:06 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1520988E64;
	Wed, 15 May 2019 19:40:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EDC861972D;
	Wed, 15 May 2019 19:40:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C7CC15B424;
	Wed, 15 May 2019 19:40:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4FJcUxi029147 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 May 2019 15:38:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A53E460F9C; Wed, 15 May 2019 19:38:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-119.phx2.redhat.com [10.3.116.119])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 70D6D60FB1
	for <cluster-devel@redhat.com>; Wed, 15 May 2019 19:38:30 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 15 May 2019 14:38:14 -0500
Message-Id: <20190515193818.7642-22-rpeterso@redhat.com>
In-Reply-To: <20190515193818.7642-1-rpeterso@redhat.com>
References: <20190515193818.7642-1-rpeterso@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 v4 PATCH 21/25] gfs2: Abort gfs2_freeze if io
	error is seen
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Wed, 15 May 2019 19:40:05 +0000 (UTC)

Before this patch, an io error, such as -EIO writing to the journal
would cause function gfs2_freeze to go into an infinite loop,
continuously retrying the freeze operation. But nothing ever clears
the -EIO except unmount after withdraw, which is impossible if the
freeze operation never ends (fails). Instead you get:

[ 6499.767994] gfs2: fsid=dm-32.0: error freezing FS: -5
[ 6499.773058] gfs2: fsid=dm-32.0: retrying...
[ 6500.791957] gfs2: fsid=dm-32.0: error freezing FS: -5
[ 6500.797015] gfs2: fsid=dm-32.0: retrying...

This patch adds a check for -EIO in gfs2_freeze, and if seen, it
dequeues the freeze glock, aborts the loop and returns the error.
Also, there's no need to pass the freeze holder to function
gfs2_lock_fs_check_clean since it's only called in one place and
it's a well-known superblock pointer, so this simplifies that.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/super.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 319e2d237056..1253fcf35910 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -654,8 +654,7 @@ struct lfcc {
  * Returns: errno
  */
 
-static int gfs2_lock_fs_check_clean(struct gfs2_sbd *sdp,
-				    struct gfs2_holder *freeze_gh)
+static int gfs2_lock_fs_check_clean(struct gfs2_sbd *sdp)
 {
 	struct gfs2_inode *ip;
 	struct gfs2_jdesc *jd;
@@ -680,7 +679,7 @@ static int gfs2_lock_fs_check_clean(struct gfs2_sbd *sdp,
 	}
 
 	error = gfs2_glock_nq_init(sdp->sd_freeze_gl, LM_ST_EXCLUSIVE,
-				   GL_NOCACHE, freeze_gh);
+				   GL_NOCACHE, &sdp->sd_freeze_gh);
 
 	list_for_each_entry(jd, &sdp->sd_jindex_list, jd_list) {
 		error = gfs2_jdesc_check(jd);
@@ -696,7 +695,7 @@ static int gfs2_lock_fs_check_clean(struct gfs2_sbd *sdp,
 	}
 
 	if (error)
-		gfs2_glock_dq_uninit(freeze_gh);
+		gfs2_glock_dq_uninit(&sdp->sd_freeze_gh);
 
 out:
 	while (!list_empty(&list)) {
@@ -1041,15 +1040,20 @@ static int gfs2_freeze(struct super_block *sb)
 			goto out;
 		}
 
-		error = gfs2_lock_fs_check_clean(sdp, &sdp->sd_freeze_gh);
+		error = gfs2_lock_fs_check_clean(sdp);
 		if (!error)
 			break;
 
 		if (error == -EBUSY)
 			fs_err(sdp, "waiting for recovery before freeze\n");
-		else
+		else if (error == -EIO) {
+			fs_err(sdp, "Fatel IO error: cannot freeze gfs2 at "
+			       "this time.\n");
+			gfs2_glock_dq_uninit(&sdp->sd_freeze_gh);
+			goto out;
+		} else {
 			fs_err(sdp, "error freezing FS: %d\n", error);
-
+		}
 		fs_err(sdp, "retrying...\n");
 		msleep(1000);
 	}
-- 
2.20.1

