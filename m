Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D8627DA1
	for <lists+cluster-devel@lfdr.de>; Thu, 23 May 2019 15:05:32 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B31DBDF26;
	Thu, 23 May 2019 13:05:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 99CBA5B683;
	Thu, 23 May 2019 13:05:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7065C1806B12;
	Thu, 23 May 2019 13:05:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4ND4iwP010114 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 23 May 2019 09:04:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 806ED69188; Thu, 23 May 2019 13:04:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-117-25.phx2.redhat.com [10.3.117.25])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4CCA86090E
	for <cluster-devel@redhat.com>; Thu, 23 May 2019 13:04:42 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 23 May 2019 08:04:19 -0500
Message-Id: <20190523130421.21003-25-rpeterso@redhat.com>
In-Reply-To: <20190523130421.21003-1-rpeterso@redhat.com>
References: <20190523130421.21003-1-rpeterso@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH v6 24/26] gfs2: Issue revokes more
	intelligently
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Thu, 23 May 2019 13:05:31 +0000 (UTC)

Before this patch, function gfs2_write_revokes would call
gfs2_ail1_empty, then traverse the sd_ail1_list looking for
transactions that had bds which were no longer queued to a glock.
And if it found some, it would try to issue revokes for them, up to
a predetermined maximum. There were two problems with how it did
this. First was the fact that gfs2_ail1_empty moves transactions
which have nothing remaining on the ail1 list from the sd_ail1_list
to the sd_ail2_list, thus making its traversal of sd_ail1_list
miss them completely, and therefore, never issue revokes for them.
Second was the fact that there were three traversals (or partial
traversals) of the sd_ail1_list, each of which took and then
released the sd_ail_lock lock. (First inside gfs2_ail1_empty,
second to determine if there are any revokes to be issued, and
third to actually issue them. All this taking and releasing of the
sd_ail_lock meant other processes could modify the lists and the
conditions in which we're working.

This patch simplies the whole process by adding a new parameter
to function gfs2_ail1_empty, max_revokes. For normal calls, this
is passed in as 0, meaning we don't want to issue any revokes.
For function gfs2_write_revokes, we pass in the maximum number
of revokes we can, thus allowing gfs2_ail1_empty to add the
revokes where needed. This simplies the code, allows for a single
holding of the sd_ail_lock, and allows gfs2_ail1_empty to add
revokes for all the necessary bd items without missing any.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/log.c | 61 +++++++++++++++++++--------------------------------
 1 file changed, 22 insertions(+), 39 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 3e4640744c02..a8be92d10234 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -189,11 +189,13 @@ static void gfs2_ail1_start(struct gfs2_sbd *sdp)
 /**
  * gfs2_ail1_empty_one - Check whether or not a trans in the AIL has been synced
  * @sdp: the filesystem
- * @ai: the AIL entry
+ * @tr: the transaction
+ * @max_revokes: If nonzero, issue revokes for the bd items for written buffers
  *
  */
 
-static void gfs2_ail1_empty_one(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
+static void gfs2_ail1_empty_one(struct gfs2_sbd *sdp, struct gfs2_trans *tr,
+				int *max_revokes)
 {
 	struct gfs2_bufdata *bd, *s;
 	struct buffer_head *bh;
@@ -220,18 +222,28 @@ static void gfs2_ail1_empty_one(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 			gfs2_io_error_bh(sdp, bh);
 			set_bit(SDF_WITHDRAWING, &sdp->sd_flags);
 		}
-		list_move(&bd->bd_ail_st_list, &tr->tr_ail2_list);
+		/* If we have space for revokes and the bd is no longer on any
+		   buf list, we can just add a revoke for it here and avoid
+		   having to put it on the ail2 list, where it would need to
+		   be revoked later. */
+		if (*max_revokes && list_empty(&bd->bd_list)) {
+			gfs2_add_revoke(sdp, bd);
+			(*max_revokes)--;
+		} else {
+			list_move(&bd->bd_ail_st_list, &tr->tr_ail2_list);
+		}
 	}
 }
 
 /**
  * gfs2_ail1_empty - Try to empty the ail1 lists
  * @sdp: The superblock
+ * @max_revokes: If non-zero, add revokes where appropriate
  *
  * Tries to empty the ail1 lists, starting with the oldest first
  */
 
-static int gfs2_ail1_empty(struct gfs2_sbd *sdp)
+static int gfs2_ail1_empty(struct gfs2_sbd *sdp, int max_revokes)
 {
 	struct gfs2_trans *tr, *s;
 	int oldest_tr = 1;
@@ -239,7 +251,7 @@ static int gfs2_ail1_empty(struct gfs2_sbd *sdp)
 
 	spin_lock(&sdp->sd_ail_lock);
 	list_for_each_entry_safe_reverse(tr, s, &sdp->sd_ail1_list, tr_list) {
-		gfs2_ail1_empty_one(sdp, tr);
+		gfs2_ail1_empty_one(sdp, tr, &max_revokes);
 		if (list_empty(&tr->tr_ail1_list) && oldest_tr)
 			list_move(&tr->tr_list, &sdp->sd_ail2_list);
 		else
@@ -622,25 +634,9 @@ void gfs2_add_revoke(struct gfs2_sbd *sdp, struct gfs2_bufdata *bd)
 
 void gfs2_write_revokes(struct gfs2_sbd *sdp)
 {
-	struct gfs2_trans *tr;
-	struct gfs2_bufdata *bd, *tmp;
-	int have_revokes = 0;
 	int max_revokes = (sdp->sd_sb.sb_bsize - sizeof(struct gfs2_log_descriptor)) / sizeof(u64);
 
-	gfs2_ail1_empty(sdp);
-	spin_lock(&sdp->sd_ail_lock);
-	list_for_each_entry_reverse(tr, &sdp->sd_ail1_list, tr_list) {
-		list_for_each_entry(bd, &tr->tr_ail2_list, bd_ail_st_list) {
-			if (list_empty(&bd->bd_list)) {
-				have_revokes = 1;
-				goto done;
-			}
-		}
-	}
-done:
-	spin_unlock(&sdp->sd_ail_lock);
-	if (have_revokes == 0)
-		return;
+	gfs2_log_lock(sdp);
 	while (sdp->sd_log_num_revoke > max_revokes)
 		max_revokes += (sdp->sd_sb.sb_bsize - sizeof(struct gfs2_meta_header)) / sizeof(u64);
 	max_revokes -= sdp->sd_log_num_revoke;
@@ -651,20 +647,7 @@ void gfs2_write_revokes(struct gfs2_sbd *sdp)
 		if (!sdp->sd_log_blks_reserved)
 			atomic_dec(&sdp->sd_log_blks_free);
 	}
-	gfs2_log_lock(sdp);
-	spin_lock(&sdp->sd_ail_lock);
-	list_for_each_entry_reverse(tr, &sdp->sd_ail1_list, tr_list) {
-		list_for_each_entry_safe(bd, tmp, &tr->tr_ail2_list, bd_ail_st_list) {
-			if (max_revokes == 0)
-				goto out_of_blocks;
-			if (!list_empty(&bd->bd_list))
-				continue;
-			gfs2_add_revoke(sdp, bd);
-			max_revokes--;
-		}
-	}
-out_of_blocks:
-	spin_unlock(&sdp->sd_ail_lock);
+	gfs2_ail1_empty(sdp, max_revokes);
 	gfs2_log_unlock(sdp);
 
 	if (!sdp->sd_log_num_revoke) {
@@ -862,7 +845,7 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 			while (!gfs2_withdrawn(sdp)) {
 				gfs2_ail1_start(sdp);
 				gfs2_ail1_wait(sdp);
-				if (gfs2_ail1_empty(sdp))
+				if (gfs2_ail1_empty(sdp, 0))
 					break;
 			}
 			atomic_dec(&sdp->sd_log_blks_free); /* Adjust for unreserved buffer */
@@ -1032,7 +1015,7 @@ int gfs2_logd(void *data)
 			goto ignore_work;
 
 		if (gfs2_jrnl_flush_reqd(sdp) || t == 0) {
-			gfs2_ail1_empty(sdp);
+			gfs2_ail1_empty(sdp, 0);
 			gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_NORMAL |
 				       GFS2_LFC_LOGD_JFLUSH_REQD);
 			did_flush = true;
@@ -1041,7 +1024,7 @@ int gfs2_logd(void *data)
 		if (gfs2_ail_flush_reqd(sdp)) {
 			gfs2_ail1_start(sdp);
 			gfs2_ail1_wait(sdp);
-			gfs2_ail1_empty(sdp);
+			gfs2_ail1_empty(sdp, 0);
 			gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_NORMAL |
 				       GFS2_LFC_LOGD_AIL_FLUSH_REQD);
 			did_flush = true;
-- 
2.21.0

