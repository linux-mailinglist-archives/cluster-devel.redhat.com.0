Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFF4A3D08
	for <lists+cluster-devel@lfdr.de>; Fri, 30 Aug 2019 19:31:14 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BA789750C0;
	Fri, 30 Aug 2019 17:31:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A684560872;
	Fri, 30 Aug 2019 17:31:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8BA572551C;
	Fri, 30 Aug 2019 17:31:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7UHV6P5030288 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 30 Aug 2019 13:31:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0B55460A97; Fri, 30 Aug 2019 17:31:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-117-77.phx2.redhat.com [10.3.117.77])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CA8FC60872
	for <cluster-devel@redhat.com>; Fri, 30 Aug 2019 17:31:05 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 30 Aug 2019 12:31:01 -0500
Message-Id: <20190830173102.27437-3-rpeterso@redhat.com>
In-Reply-To: <20190830173102.27437-1-rpeterso@redhat.com>
References: <20190830173102.27437-1-rpeterso@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH v4 2/3] gfs2: create function
	gfs2_glock_update_hold_time
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Fri, 30 Aug 2019 17:31:12 +0000 (UTC)

From: Andreas Gruenbacher <agruenba@redhat.com>

This patch moves the code that updates glock minimum hold
time to a separate function. This will be called by a future
patch.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index a27dbd3dec01..661350989e98 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -931,6 +931,17 @@ void gfs2_holder_uninit(struct gfs2_holder *gh)
 	gh->gh_ip = 0;
 }
 
+static void gfs2_glock_update_hold_time(struct gfs2_glock *gl,
+					unsigned long start_time)
+{
+	/* Have we waited longer that a second? */
+	if (time_after(jiffies, start_time + HZ)) {
+		/* Lengthen the minimum hold time. */
+		gl->gl_hold_time = min(gl->gl_hold_time + GL_GLOCK_HOLD_INCR,
+				       GL_GLOCK_MAX_HOLD);
+	}
+}
+
 /**
  * gfs2_glock_wait - wait on a glock acquisition
  * @gh: the glock holder
@@ -940,15 +951,11 @@ void gfs2_holder_uninit(struct gfs2_holder *gh)
 
 int gfs2_glock_wait(struct gfs2_holder *gh)
 {
-	unsigned long time1 = jiffies;
+	unsigned long start_time = jiffies;
 
 	might_sleep();
 	wait_on_bit(&gh->gh_iflags, HIF_WAIT, TASK_UNINTERRUPTIBLE);
-	if (time_after(jiffies, time1 + HZ)) /* have we waited > a second? */
-		/* Lengthen the minimum hold time. */
-		gh->gh_gl->gl_hold_time = min(gh->gh_gl->gl_hold_time +
-					      GL_GLOCK_HOLD_INCR,
-					      GL_GLOCK_MAX_HOLD);
+	gfs2_glock_update_hold_time(gh->gh_gl, start_time);
 	return gh->gh_error;
 }
 
-- 
2.21.0

