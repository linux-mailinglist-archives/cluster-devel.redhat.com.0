Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B0B4130E1F3
	for <lists+cluster-devel@lfdr.de>; Wed,  3 Feb 2021 19:08:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612375698;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lbm+pO1lj7tcr3OcaIBZX76cKmVN7vTHCqsWuFxvD9w=;
	b=SdG2CVh8WPgBczyCSblIf3EW4tJs14yJRLSk7FVGMfn9fpTl664vKqDbW72w7ytslh0DZZ
	BdyhHdeSVv7D0FJhEsy4C+8TyGM4evi824y6s4mbuyFb0hWCCR3KzSMorYnou7m3siJREb
	cJNxF2e4DwyI889fip+AmkP271Twn4A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-vdRDaVwzPEGswaJy7M5U0Q-1; Wed, 03 Feb 2021 13:08:17 -0500
X-MC-Unique: vdRDaVwzPEGswaJy7M5U0Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B5D6AFAA1;
	Wed,  3 Feb 2021 18:08:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 428AC5D6A8;
	Wed,  3 Feb 2021 18:08:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2FD0C18095CB;
	Wed,  3 Feb 2021 18:08:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 113I8CcW028609 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 3 Feb 2021 13:08:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3663E60D07; Wed,  3 Feb 2021 18:08:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (ovpn-112-155.ams2.redhat.com [10.36.112.155])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 801BE779D9;
	Wed,  3 Feb 2021 18:08:11 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed,  3 Feb 2021 19:07:46 +0100
Message-Id: <20210203180755.246596-12-agruenba@redhat.com>
In-Reply-To: <20210203180755.246596-1-agruenba@redhat.com>
References: <20210203180755.246596-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v4 11/20] gfs2: Move lock flush locking to
	gfs2_trans_{begin, end}
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Move the read locking of sd_log_flush_lock from gfs2_log_reserve to
gfs2_trans_begin, and its unlocking from gfs2_log_release to
gfs2_trans_end.  Use gfs2_log_release in two places in which it was open
coded before.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/log.c   | 28 +++-------------------------
 fs/gfs2/log.h   |  2 +-
 fs/gfs2/trans.c | 19 ++++++++++++-------
 3 files changed, 16 insertions(+), 33 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 0da05492e8b8..e7183c84ffc0 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -420,7 +420,6 @@ void gfs2_log_release(struct gfs2_sbd *sdp, unsigned int blks)
 	trace_gfs2_log_blocks(sdp, blks);
 	gfs2_assert_withdraw(sdp, atomic_read(&sdp->sd_log_blks_free) <=
 				  sdp->sd_jdesc->jd_blocks);
-	up_read(&sdp->sd_log_flush_lock);
 }
 
 /**
@@ -439,22 +438,16 @@ void gfs2_log_release(struct gfs2_sbd *sdp, unsigned int blks)
  * with queued waiters, we use an exclusive wait. This means that when we
  * get woken with enough journal space to get our reservation, we need to
  * wake the next waiter on the list.
- *
- * Returns: errno
  */
 
-int gfs2_log_reserve(struct gfs2_sbd *sdp, unsigned int blks)
+void gfs2_log_reserve(struct gfs2_sbd *sdp, unsigned int blks)
 {
-	int ret = 0;
 	unsigned reserved_blks = 7 * (4096 / sdp->sd_vfs->s_blocksize);
 	unsigned wanted = blks + reserved_blks;
 	DEFINE_WAIT(wait);
 	int did_wait = 0;
 	unsigned int free_blocks;
 
-	if (gfs2_assert_warn(sdp, blks) ||
-	    gfs2_assert_warn(sdp, blks <= sdp->sd_jdesc->jd_blocks))
-		return -EINVAL;
 	atomic_add(blks, &sdp->sd_log_blks_needed);
 retry:
 	free_blocks = atomic_read(&sdp->sd_log_blks_free);
@@ -482,13 +475,6 @@ int gfs2_log_reserve(struct gfs2_sbd *sdp, unsigned int blks)
 	 */
 	if (unlikely(did_wait))
 		wake_up(&sdp->sd_log_waitq);
-
-	down_read(&sdp->sd_log_flush_lock);
-	if (unlikely(!test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags))) {
-		gfs2_log_release(sdp, blks);
-		ret = -EROFS;
-	}
-	return ret;
 }
 
 /**
@@ -585,12 +571,7 @@ static void log_pull_tail(struct gfs2_sbd *sdp, unsigned int new_tail)
 	unsigned int dist = log_distance(sdp, new_tail, sdp->sd_log_tail);
 
 	ail2_empty(sdp, new_tail);
-
-	atomic_add(dist, &sdp->sd_log_blks_free);
-	trace_gfs2_log_blocks(sdp, dist);
-	gfs2_assert_withdraw(sdp, atomic_read(&sdp->sd_log_blks_free) <=
-			     sdp->sd_jdesc->jd_blocks);
-
+	gfs2_log_release(sdp, dist);
 	sdp->sd_log_tail = new_tail;
 }
 
@@ -1127,10 +1108,7 @@ static void log_refund(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 	maxres = sdp->sd_log_blks_reserved + tr->tr_reserved;
 	gfs2_assert_withdraw(sdp, maxres >= reserved);
 	unused = maxres - reserved;
-	atomic_add(unused, &sdp->sd_log_blks_free);
-	trace_gfs2_log_blocks(sdp, unused);
-	gfs2_assert_withdraw(sdp, atomic_read(&sdp->sd_log_blks_free) <=
-			     sdp->sd_jdesc->jd_blocks);
+	gfs2_log_release(sdp, unused);
 	sdp->sd_log_blks_reserved = reserved;
 
 	gfs2_log_unlock(sdp);
diff --git a/fs/gfs2/log.h b/fs/gfs2/log.h
index 16efbe614279..cbc097ca9244 100644
--- a/fs/gfs2/log.h
+++ b/fs/gfs2/log.h
@@ -66,7 +66,7 @@ extern unsigned int gfs2_struct2blk(struct gfs2_sbd *sdp, unsigned int nstruct);
 extern void gfs2_remove_from_ail(struct gfs2_bufdata *bd);
 extern bool gfs2_log_is_empty(struct gfs2_sbd *sdp);
 extern void gfs2_log_release(struct gfs2_sbd *sdp, unsigned int blks);
-extern int gfs2_log_reserve(struct gfs2_sbd *sdp, unsigned int blks);
+extern void gfs2_log_reserve(struct gfs2_sbd *sdp, unsigned int blks);
 extern void gfs2_write_log_header(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd,
 				  u64 seq, u32 tail, u32 lblock, u32 flags,
 				  int op_flags);
diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index aefe450e009e..2269aa7ad69d 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -41,8 +41,6 @@ int __gfs2_trans_begin(struct gfs2_trans *tr, struct gfs2_sbd *sdp,
 		       unsigned int blocks, unsigned int revokes,
 		       unsigned long ip)
 {
-	int error;
-
 	if (current->journal_info) {
 		gfs2_print_trans(sdp, current->journal_info);
 		BUG();
@@ -66,14 +64,20 @@ int __gfs2_trans_begin(struct gfs2_trans *tr, struct gfs2_sbd *sdp,
 	INIT_LIST_HEAD(&tr->tr_ail1_list);
 	INIT_LIST_HEAD(&tr->tr_ail2_list);
 
+	if (gfs2_assert_warn(sdp, tr->tr_reserved <= sdp->sd_jdesc->jd_blocks))
+		return -EINVAL;
+
 	sb_start_intwrite(sdp->sd_vfs);
 
-	error = gfs2_log_reserve(sdp, tr->tr_reserved);
-	if (error) {
+	gfs2_log_reserve(sdp, tr->tr_reserved);
+
+	down_read(&sdp->sd_log_flush_lock);
+	if (unlikely(!test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags))) {
+		gfs2_log_release(sdp, tr->tr_reserved);
+		up_read(&sdp->sd_log_flush_lock);
 		sb_end_intwrite(sdp->sd_vfs);
-		if (error == -EROFS)
-			wake_up(&sdp->sd_log_waitq);
-		return error;
+		wake_up(&sdp->sd_log_waitq);
+		return -EROFS;
 	}
 
 	current->journal_info = tr;
@@ -105,6 +109,7 @@ void gfs2_trans_end(struct gfs2_sbd *sdp)
 
 	if (!test_bit(TR_TOUCHED, &tr->tr_flags)) {
 		gfs2_log_release(sdp, tr->tr_reserved);
+		up_read(&sdp->sd_log_flush_lock);
 		if (!test_bit(TR_ONSTACK, &tr->tr_flags))
 			gfs2_trans_free(sdp, tr);
 		sb_end_intwrite(sdp->sd_vfs);
-- 
2.26.2

