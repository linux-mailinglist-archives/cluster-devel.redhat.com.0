Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA2910304
	for <lists+cluster-devel@lfdr.de>; Wed,  1 May 2019 01:03:31 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4B909307D851;
	Tue, 30 Apr 2019 23:03:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3475118979;
	Tue, 30 Apr 2019 23:03:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 12E343FB13;
	Tue, 30 Apr 2019 23:03:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3UN3P0p023036 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Apr 2019 19:03:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5A72181742; Tue, 30 Apr 2019 23:03:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-20.phx2.redhat.com [10.3.116.20])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 33FDB7C850
	for <cluster-devel@redhat.com>; Tue, 30 Apr 2019 23:03:25 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 30 Apr 2019 17:03:13 -0600
Message-Id: <20190430230319.10375-14-rpeterso@redhat.com>
In-Reply-To: <20190430230319.10375-1-rpeterso@redhat.com>
References: <20190430230319.10375-1-rpeterso@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH v3 13/19] gfs2: Make secondary
	withdrawers wait for first withdrawer
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Tue, 30 Apr 2019 23:03:30 +0000 (UTC)

Before this patch, if a process encountered an error and decided to
withdraw, if another process was already in the process of withdrawing,
the secondary withdraw would be silently ignored, which set it free
to proceed with its processing, unlock any locks, etc. That's correct
behavior if the original withdrawer encounters further errors down
the road. However, second withdrawers need to wait for the first
withdrawer to finish its withdraw before proceeding. If we don't wait
we could end up assuming everything is alright, unlock glocks and
telling other nodes they can have the glock, despite the fact that
a withdraw is still ongoing and may require a journal replay before
any locks are released. For example, if an rgrp glock is freed
by a process that didn't wait for the withdraw, a journal replay
could introduce file system corruption by replaying a rgrp block
that has already been granted to another node.

This patch makes secondary withdrawers wait until the primary
withdrawer is finished with its processing before proceeding.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/incore.h |  3 +++
 fs/gfs2/util.c   | 21 +++++++++++++++++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index b16b82e5b85a..0b283bbd20ea 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -628,6 +628,7 @@ enum {
 	SDF_SKIP_DLM_UNLOCK	= 8,
 	SDF_FORCE_AIL_FLUSH     = 9,
 	SDF_WITHDRAW		= 10, /* Will withdraw eventually */
+	SDF_WITHDRAW_IN_PROG	= 11, /* Withdraw is in progress */
 };
 
 enum gfs2_freeze_state {
@@ -837,6 +838,8 @@ struct gfs2_sbd {
 	struct bio *sd_log_bio;
 	wait_queue_head_t sd_log_flush_wait;
 	int sd_log_error; /* First log error */
+	atomic_t sd_withdrawer;
+	wait_queue_head_t sd_withdraw_wait;
 
 	atomic_t sd_reserving_log;
 	wait_queue_head_t sd_reserving_log_wait;
diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index 398d3cedb1a4..ad56f934ff0f 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -89,9 +89,23 @@ int gfs2_lm_withdraw(struct gfs2_sbd *sdp, const char *fmt, ...)
 	struct va_format vaf;
 
 	if (sdp->sd_args.ar_errors == GFS2_ERRORS_WITHDRAW &&
-	    test_and_set_bit(SDF_SHUTDOWN, &sdp->sd_flags))
-		return 0;
+	    test_and_set_bit(SDF_SHUTDOWN, &sdp->sd_flags)) {
+		if (!test_bit(SDF_WITHDRAW_IN_PROG, &sdp->sd_flags))
+			return -1;
+
+		fs_warn(sdp, "Pid %d waiting for process %d to withdraw.\n",
+			pid_nr(task_pid(current)),
+			atomic_read(&sdp->sd_withdrawer));
+		wait_on_bit(&sdp->sd_flags, SDF_WITHDRAW_IN_PROG,
+			    TASK_UNINTERRUPTIBLE);
+		fs_warn(sdp, "Pid %d done waiting for process %d.\n",
+			pid_nr(task_pid(current)),
+			atomic_read(&sdp->sd_withdrawer));
+		return -1;
+	}
 
+	set_bit(SDF_WITHDRAW_IN_PROG, &sdp->sd_flags);
+	atomic_set(&sdp->sd_withdrawer, pid_nr(task_pid(current)));
 	if (fmt) {
 		va_start(args, fmt);
 
@@ -119,6 +133,9 @@ int gfs2_lm_withdraw(struct gfs2_sbd *sdp, const char *fmt, ...)
 		set_bit(SDF_SKIP_DLM_UNLOCK, &sdp->sd_flags);
 		fs_err(sdp, "withdrawn\n");
 		dump_stack();
+		clear_bit(SDF_WITHDRAW_IN_PROG, &sdp->sd_flags);
+		smp_mb__after_atomic();
+		wake_up_bit(&sdp->sd_flags, SDF_WITHDRAW_IN_PROG);
 	}
 
 	if (sdp->sd_args.ar_errors == GFS2_ERRORS_PANIC)
-- 
2.20.1

