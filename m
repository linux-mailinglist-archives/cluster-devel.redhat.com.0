Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id DED6E2D9466
	for <lists+cluster-devel@lfdr.de>; Mon, 14 Dec 2020 09:55:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607936106;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XtwHgX8UZM5FsSCrvKFDJ5xBU4B9ea/vmwGrMAB+9uA=;
	b=Ch83Ch/fSGgtJFRwU6RU0Rb53Sr5A3KeX3Eyr/64KhGiE30iQCqsR/fZr54nfvfbTH5lBe
	bIFuLrYEg89FRfrOkyaJel7MjEp7ptA3X+JJwpmAmW/VF1pRUHVfAeS8Yq7rduPGdNBII0
	GMtSach9Ur0+Ds6/6fO1hlIjSD4cBG8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-UkiZPjiSPRyjj6qHRFqb9A-1; Mon, 14 Dec 2020 03:55:04 -0500
X-MC-Unique: UkiZPjiSPRyjj6qHRFqb9A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4433107ACE6;
	Mon, 14 Dec 2020 08:55:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A37CE10023B7;
	Mon, 14 Dec 2020 08:55:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8C81E180954D;
	Mon, 14 Dec 2020 08:55:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BE8t1vq016472 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 14 Dec 2020 03:55:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 499AF6267D; Mon, 14 Dec 2020 08:55:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.194])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8689E62467;
	Mon, 14 Dec 2020 08:55:00 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 14 Dec 2020 09:54:39 +0100
Message-Id: <20201214085442.45467-10-agruenba@redhat.com>
In-Reply-To: <20201214085442.45467-1-agruenba@redhat.com>
References: <20201214085442.45467-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 09/12] gfs2: Move lock flush locking to
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
index 8c46f8f64c9e..b0d4ce4992ed 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -411,7 +411,6 @@ void gfs2_log_release(struct gfs2_sbd *sdp, unsigned int blks)
 	trace_gfs2_log_blocks(sdp, blks);
 	gfs2_assert_withdraw(sdp, atomic_read(&sdp->sd_log_blks_free) <=
 				  sdp->sd_jdesc->jd_blocks);
-	up_read(&sdp->sd_log_flush_lock);
 }
 
 /**
@@ -439,22 +438,16 @@ bool gfs2_log_is_empty(struct gfs2_sbd *sdp) {
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
index f483e706db3a..db3bb3564ea0 100644
--- a/fs/gfs2/log.h
+++ b/fs/gfs2/log.h
@@ -65,7 +65,7 @@ extern void gfs2_ordered_del_inode(struct gfs2_inode *ip);
 extern unsigned int gfs2_struct2blk(struct gfs2_sbd *sdp, unsigned int nstruct);
 extern void gfs2_remove_from_ail(struct gfs2_bufdata *bd);
 extern void gfs2_log_release(struct gfs2_sbd *sdp, unsigned int blks);
-extern int gfs2_log_reserve(struct gfs2_sbd *sdp, unsigned int blks);
+extern void gfs2_log_reserve(struct gfs2_sbd *sdp, unsigned int blks);
 extern bool gfs2_log_is_empty(struct gfs2_sbd *sdp);
 extern void gfs2_write_log_header(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd,
 				  u64 seq, u32 tail, u32 lblock, u32 flags,
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

