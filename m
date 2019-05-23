Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E42C627DA9
	for <lists+cluster-devel@lfdr.de>; Thu, 23 May 2019 15:05:45 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 125DFC09AD0F;
	Thu, 23 May 2019 13:05:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED2CE6918E;
	Thu, 23 May 2019 13:05:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C8AB21806B15;
	Thu, 23 May 2019 13:05:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4ND4a1A010056 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 23 May 2019 09:04:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 216DD69188; Thu, 23 May 2019 13:04:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-117-25.phx2.redhat.com [10.3.117.25])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E10D269186
	for <cluster-devel@redhat.com>; Thu, 23 May 2019 13:04:33 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 23 May 2019 08:04:16 -0500
Message-Id: <20190523130421.21003-22-rpeterso@redhat.com>
In-Reply-To: <20190523130421.21003-1-rpeterso@redhat.com>
References: <20190523130421.21003-1-rpeterso@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH v6 21/26] gfs2: fix infinite loop when
	checking ail item count before go_inval
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Thu, 23 May 2019 13:05:44 +0000 (UTC)

Before this patch, the rgrp_go_inval and inode_go_inval functions each
checked if there were any items left on the ail count (by way of a
count), and if so, did a withdraw. But the withdraw code now uses
glocks when changing the file system to read-only status. So we can
not have glock functions withdrawing or a hang will likely result:
The glocks can't be serviced by the work_func if the work_func is
busy doing its own withdraw.

This patch removes the checks from the go_inval functions and adds
a centralized check in do_xmote to warn about the problem and not
withdraw, but flag the error so it's eventually caught when the logd
daemon eventually runs.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.c | 17 +++++++++++++++--
 fs/gfs2/glops.c |  3 ---
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 7202793056a8..cb378df8217b 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -570,9 +570,22 @@ __acquires(&gl->gl_lockref.lock)
 	spin_unlock(&gl->gl_lockref.lock);
 	if (glops->go_sync)
 		glops->go_sync(gl);
-	if (test_bit(GLF_INVALIDATE_IN_PROGRESS, &gl->gl_flags))
+	if (test_bit(GLF_INVALIDATE_IN_PROGRESS, &gl->gl_flags)) {
+		/**
+		 * The call to go_sync should have cleared out the ail list.
+		 * If there are still items, we have a problem. We ought to
+		 * withdraw, but we can't because the withdraw code also uses
+		 * glocks. Warn about the error, dump the glock, then fall
+		 * through and wait for logd to do the withdraw for us.
+		 */
+		if ((atomic_read(&gl->gl_ail_count) != 0) &&
+		    (!cmpxchg(&sdp->sd_log_error, 0, -EIO))) {
+			gfs2_assert_warn(sdp, !atomic_read(&gl->gl_ail_count));
+			gfs2_dump_glock(NULL, gl, true);
+		}
 		glops->go_inval(gl, target == LM_ST_DEFERRED ? 0 : DIO_METADATA);
-	clear_bit(GLF_INVALIDATE_IN_PROGRESS, &gl->gl_flags);
+		clear_bit(GLF_INVALIDATE_IN_PROGRESS, &gl->gl_flags);
+	}
 
 	gfs2_glock_hold(gl);
 	if (sdp->sd_lockstruct.ls_ops->lm_lock)	{
diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index db4d499ecf4f..5d4d2b6873e5 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -196,7 +196,6 @@ static void rgrp_go_inval(struct gfs2_glock *gl, int flags)
 		gfs2_rgrp_brelse(rgd);
 
 	WARN_ON_ONCE(!(flags & DIO_METADATA));
-	gfs2_assert_withdraw(sdp, !atomic_read(&gl->gl_ail_count));
 	truncate_inode_pages_range(mapping, gl->gl_vm.start, gl->gl_vm.end);
 
 	if (rgd)
@@ -296,8 +295,6 @@ static void inode_go_inval(struct gfs2_glock *gl, int flags)
 {
 	struct gfs2_inode *ip = gfs2_glock2inode(gl);
 
-	gfs2_assert_withdraw(gl->gl_name.ln_sbd, !atomic_read(&gl->gl_ail_count));
-
 	if (flags & DIO_METADATA) {
 		struct address_space *mapping = gfs2_glock2aspace(gl);
 		truncate_inode_pages(mapping, 0);
-- 
2.21.0

