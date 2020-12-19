Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3E5492DF1A3
	for <lists+cluster-devel@lfdr.de>; Sat, 19 Dec 2020 21:49:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608410966;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bIyba1ZLFRM+oO+b4Crkf4S+2P5EaNKnN99pAQEoKUM=;
	b=BoWCL4MpysXCK/2GpwKm3KHqOX/mqJjwa94UD8NTMdlP7sVFipKx/rKscvjdqh7J6Vx0a+
	uvB7JuHVHKKoyAhfEamXqoLHmlSjevujDjb0GcHaRN+xvCX6H4VKzvhtkToLfW877iyQBI
	6EfZZ5/OYsZGdLFgIcvIppzpmsyMr4o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-jXD8BlnlPMuA1n66ZDaJSQ-1; Sat, 19 Dec 2020 15:49:24 -0500
X-MC-Unique: jXD8BlnlPMuA1n66ZDaJSQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3829AE75A;
	Sat, 19 Dec 2020 20:49:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2837F5C1B4;
	Sat, 19 Dec 2020 20:49:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 12E97180954D;
	Sat, 19 Dec 2020 20:49:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BJKnKqD020220 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 19 Dec 2020 15:49:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 329F239A60; Sat, 19 Dec 2020 20:49:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (ovpn-115-196.ams2.redhat.com [10.36.115.196])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 278C82DAD0;
	Sat, 19 Dec 2020 20:49:18 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Sat, 19 Dec 2020 21:48:38 +0100
Message-Id: <20201219204848.285781-11-agruenba@redhat.com>
In-Reply-To: <20201219204848.285781-1-agruenba@redhat.com>
References: <20201219204848.285781-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v2 10/20] gfs2: Move lock flush locking to
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
 fs/gfs2/trans.c | 23 ++++++++++++++++-------
 3 files changed, 20 insertions(+), 33 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 8fd93077a029..88f9d630fb96 100644
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
 
@@ -1125,10 +1106,7 @@ static void log_refund(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
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
index ed802b26fadc..fd44b107602b 100644
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
index e33cb8da056a..c9d8247ffa19 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -70,12 +70,22 @@ int __gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
 	INIT_LIST_HEAD(&tr->tr_ail1_list);
 	INIT_LIST_HEAD(&tr->tr_ail2_list);
 
+	if (gfs2_assert_warn(sdp, tr->tr_reserved <= sdp->sd_jdesc->jd_blocks)) {
+		error = -EINVAL;
+		goto fail;
+	}
+
 	sb_start_intwrite(sdp->sd_vfs);
 
-	error = gfs2_log_reserve(sdp, tr->tr_reserved);
-	if (error) {
-		if (error == -EROFS)
-			wake_up(&sdp->sd_log_waitq);
+	gfs2_log_reserve(sdp, tr->tr_reserved);
+
+	down_read(&sdp->sd_log_flush_lock);
+	if (unlikely(!test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags))) {
+		gfs2_log_release(sdp, tr->tr_reserved);
+		up_read(&sdp->sd_log_flush_lock);
+		sb_end_intwrite(sdp->sd_vfs);
+		wake_up(&sdp->sd_log_waitq);
+		error = -EROFS;
 		goto fail;
 	}
 
@@ -84,9 +94,7 @@ int __gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
 	return 0;
 
 fail:
-	sb_end_intwrite(sdp->sd_vfs);
 	kmem_cache_free(gfs2_trans_cachep, tr);
-
 	return error;
 }
 
@@ -105,8 +113,9 @@ void gfs2_trans_end(struct gfs2_sbd *sdp)
 
 	if (!test_bit(TR_TOUCHED, &tr->tr_flags)) {
 		gfs2_log_release(sdp, tr->tr_reserved);
-		gfs2_trans_free(sdp, tr);
+		up_read(&sdp->sd_log_flush_lock);
 		sb_end_intwrite(sdp->sd_vfs);
+		gfs2_trans_free(sdp, tr);
 		return;
 	}
 
-- 
2.26.2

