Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C631FB0F
	for <lists+cluster-devel@lfdr.de>; Wed, 15 May 2019 21:39:49 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 35E9781114;
	Wed, 15 May 2019 19:39:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E07DE60F9C;
	Wed, 15 May 2019 19:39:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EF4AF5B426;
	Wed, 15 May 2019 19:39:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4FJcOKs029025 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 May 2019 15:38:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5D0F160FAE; Wed, 15 May 2019 19:38:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-119.phx2.redhat.com [10.3.116.119])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2894B60BF7
	for <cluster-devel@redhat.com>; Wed, 15 May 2019 19:38:24 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 15 May 2019 14:38:03 -0500
Message-Id: <20190515193818.7642-11-rpeterso@redhat.com>
In-Reply-To: <20190515193818.7642-1-rpeterso@redhat.com>
References: <20190515193818.7642-1-rpeterso@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 v4 PATCH 10/25] gfs2: log error reform
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Wed, 15 May 2019 19:39:48 +0000 (UTC)

Before this patch, gfs2 kept track of journal io errors in two
places sd_log_error and the SDF_AIL1_IO_ERROR flag in sd_flags.
This patch consolidates the two into sd_log_error so that it
reflects the first error encountered writing to the journal.
In future patches, we will take advantage of this by checking
this value rather than having to check both when reacting to
io errors.

In addition, this fixes a tight loop in unmount: If buffers
get on the ail1 list and an io error occurs elsewhere, the
ail1 list would never be cleared because they were always busy.
So unmount would hang, waiting for the ail1 list to empty.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/incore.h |  7 +++----
 fs/gfs2/log.c    | 20 +++++++++++++++-----
 fs/gfs2/quota.c  |  2 +-
 3 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index b261168be298..39cec5361ba5 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -620,9 +620,8 @@ enum {
 	SDF_RORECOVERY		= 7, /* read only recovery */
 	SDF_SKIP_DLM_UNLOCK	= 8,
 	SDF_FORCE_AIL_FLUSH     = 9,
-	SDF_AIL1_IO_ERROR	= 10,
-	SDF_FS_FROZEN           = 11,
-	SDF_WITHDRAWING		= 12, /* Will withdraw eventually */
+	SDF_FS_FROZEN           = 10,
+	SDF_WITHDRAWING		= 11, /* Will withdraw eventually */
 };
 
 enum gfs2_freeze_state {
@@ -831,7 +830,7 @@ struct gfs2_sbd {
 	atomic_t sd_log_in_flight;
 	struct bio *sd_log_bio;
 	wait_queue_head_t sd_log_flush_wait;
-	int sd_log_error;
+	int sd_log_error; /* First log error */
 
 	atomic_t sd_reserving_log;
 	wait_queue_head_t sd_reserving_log_wait;
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 6ccc5d01b813..8dd07688728b 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -108,8 +108,7 @@ __acquires(&sdp->sd_ail_lock)
 
 		if (!buffer_busy(bh)) {
 			if (!buffer_uptodate(bh) &&
-			    !test_and_set_bit(SDF_AIL1_IO_ERROR,
-					      &sdp->sd_flags)) {
+			    !cmpxchg(&sdp->sd_log_error, 0, -EIO)) {
 				gfs2_io_error_bh(sdp, bh);
 				set_bit(SDF_WITHDRAWING, &sdp->sd_flags);
 			}
@@ -203,10 +202,21 @@ static void gfs2_ail1_empty_one(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 					 bd_ail_st_list) {
 		bh = bd->bd_bh;
 		gfs2_assert(sdp, bd->bd_tr == tr);
-		if (buffer_busy(bh))
+		/**
+		 * If another process flagged an io error, e.g. writing to the
+		 * journal, error all other bhs and move them off the ail1 to
+		 * prevent a tight loop when unmount tries to flush ail1,
+		 * regardless of whether they're still busy. If no outside
+		 * errors were found and the buffer is busy, move to the next.
+		 * If the ail buffer is not busy and caught an error, flag it
+		 * for others.
+		 */
+		if (sdp->sd_log_error) {
+			gfs2_io_error_bh(sdp, bh);
+		} else if (buffer_busy(bh)) {
 			continue;
-		if (!buffer_uptodate(bh) &&
-		    !test_and_set_bit(SDF_AIL1_IO_ERROR, &sdp->sd_flags)) {
+		} else if (!buffer_uptodate(bh) &&
+			   !cmpxchg(&sdp->sd_log_error, 0, -EIO)) {
 			gfs2_io_error_bh(sdp, bh);
 			set_bit(SDF_WITHDRAWING, &sdp->sd_flags);
 		}
diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index a8dfc86fd682..8871fca9102f 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -1480,7 +1480,7 @@ static void quotad_error(struct gfs2_sbd *sdp, const char *msg, int error)
 		return;
 	if (!gfs2_withdrawn(sdp)) {
 		fs_err(sdp, "gfs2_quotad: %s error %d\n", msg, error);
-		sdp->sd_log_error = error;
+		cmpxchg(&sdp->sd_log_error, 0, error);
 		wake_up(&sdp->sd_logd_waitq);
 	}
 }
-- 
2.20.1

