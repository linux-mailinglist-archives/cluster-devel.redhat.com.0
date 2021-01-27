Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id CC36F3065B8
	for <lists+cluster-devel@lfdr.de>; Wed, 27 Jan 2021 22:11:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611781917;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=12nvSKcjj6dbvtArRuOiGaMRgNZgxPfIuHpIKRJf6GA=;
	b=KEFQjYE+4kb5sYWum4ZWeni47K6xmteS7nmF41f+1cFUOQvU+9yEXbJG2bv2KhILhUFpSj
	m9idNqTnWrKFg2xeySh0T2rZOcmV9m9WgNMDaY/dDMv5tDAc4dSaDxdY+CyWq1AoEPnVzT
	IZ3ybc3kS/LBxgrI6vNXzAbpfQmpGmg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-QWw-g_aVONuuJJ6PnVo3Lg-1; Wed, 27 Jan 2021 16:11:56 -0500
X-MC-Unique: QWw-g_aVONuuJJ6PnVo3Lg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5544E1800D42;
	Wed, 27 Jan 2021 21:11:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45214104C47A;
	Wed, 27 Jan 2021 21:11:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 30E3F1809CAC;
	Wed, 27 Jan 2021 21:11:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10RL8FrN013888 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 27 Jan 2021 16:08:15 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 188216F456; Wed, 27 Jan 2021 21:08:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.195.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 516D86F92A;
	Wed, 27 Jan 2021 21:08:14 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 27 Jan 2021 22:07:44 +0100
Message-Id: <20210127210746.16958-19-agruenba@redhat.com>
In-Reply-To: <20210127210746.16958-1-agruenba@redhat.com>
References: <20210127210746.16958-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v3 18/20] gfs2: Remove sd_log_blks_reserved
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

Now that sdp->sd_log_tr is defined even when the transaction only
indicates revokes, tr_reserved is equivalent to sd_log_blks_reserved,
so we can remove it.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/incore.h |  1 -
 fs/gfs2/log.c    | 21 ++++++++++-----------
 fs/gfs2/log.h    |  2 +-
 fs/gfs2/lops.c   |  2 +-
 4 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 3589d02d1df9..5d50c3695f17 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -819,7 +819,6 @@ struct gfs2_sbd {
 	spinlock_t sd_log_lock;
 
 	struct gfs2_trans *sd_log_tr;
-	unsigned int sd_log_blks_reserved;
 
 	atomic_t sd_log_pinned;
 	unsigned int sd_log_num_revoke;
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 1ce4300aa81a..34c8291c9131 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -703,6 +703,7 @@ void gfs2_glock_remove_revoke(struct gfs2_glock *gl)
 /**
  * gfs2_flush_revokes - Add as many revokes to the system transaction as we can
  * @sdp: The GFS2 superblock
+ * @tr: The transaction
  *
  * Our usual strategy is to defer writing revokes as much as we can in the hope
  * that we'll eventually overwrite the journal, which will make those revokes
@@ -712,7 +713,7 @@ void gfs2_glock_remove_revoke(struct gfs2_glock *gl)
  * been written back.  This will basically come at no cost now, and will save
  * us from having to keep track of those blocks on the AIL2 list later.
  */
-void gfs2_flush_revokes(struct gfs2_sbd *sdp)
+void gfs2_flush_revokes(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 {
 	/* number of revokes we still have room for */
 	unsigned int max_revokes;
@@ -727,7 +728,7 @@ void gfs2_flush_revokes(struct gfs2_sbd *sdp)
 		atomic_dec(&sdp->sd_log_blks_free);
 		/* If no blocks have been reserved, we need to also
 		 * reserve a block for the header */
-		if (!sdp->sd_log_blks_reserved) {
+		if (!tr) {
 			atomic_dec(&sdp->sd_log_blks_free);
 			trace_gfs2_log_blocks(sdp, -2);
 		} else {
@@ -739,7 +740,7 @@ void gfs2_flush_revokes(struct gfs2_sbd *sdp)
 
 	if (!sdp->sd_log_num_revoke) {
 		atomic_inc(&sdp->sd_log_blks_free);
-		if (!sdp->sd_log_blks_reserved) {
+		if (!tr) {
 			atomic_inc(&sdp->sd_log_blks_free);
 			trace_gfs2_log_blocks(sdp, 2);
 		} else {
@@ -1019,7 +1020,6 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 
 	gfs2_log_lock(sdp);
 	gfs2_log_update_head(sdp);
-	sdp->sd_log_blks_reserved = 0;
 
 	spin_lock(&sdp->sd_ail_lock);
 	if (tr && !list_empty(&tr->tr_ail1_list)) {
@@ -1084,6 +1084,7 @@ static void gfs2_merge_trans(struct gfs2_sbd *sdp, struct gfs2_trans *new)
 
 	WARN_ON_ONCE(!test_bit(TR_ATTACHED, &old->tr_flags));
 
+	old->tr_reserved	+= new->tr_reserved;
 	old->tr_num_buf_new	+= new->tr_num_buf_new;
 	old->tr_num_databuf_new	+= new->tr_num_databuf_new;
 	old->tr_num_buf_rm	+= new->tr_num_buf_rm;
@@ -1104,24 +1105,23 @@ static void log_refund(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 {
 	unsigned int reserved;
 	unsigned int unused;
-	unsigned int maxres;
 
 	gfs2_log_lock(sdp);
 
 	if (sdp->sd_log_tr) {
 		gfs2_merge_trans(sdp, tr);
+		tr = sdp->sd_log_tr;
 	} else {
 		sdp->sd_log_tr = tr;
 		set_bit(TR_ATTACHED, &tr->tr_flags);
 	}
 
-	reserved = calc_reserved(sdp);
-	maxres = sdp->sd_log_blks_reserved + tr->tr_reserved;
-	gfs2_assert_withdraw(sdp, maxres >= reserved);
-	unused = maxres - reserved;
+	reserved = tr->tr_reserved;
+	tr->tr_reserved = calc_reserved(sdp);
+	gfs2_assert_withdraw(sdp, reserved >= tr->tr_reserved);
+	unused = reserved - tr->tr_reserved;
 	if (unused)
 		gfs2_log_release(sdp, unused);
-	sdp->sd_log_blks_reserved = reserved;
 
 	gfs2_log_unlock(sdp);
 }
@@ -1159,7 +1159,6 @@ void gfs2_log_commit(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 
 static void gfs2_log_shutdown(struct gfs2_sbd *sdp)
 {
-	gfs2_assert_withdraw(sdp, !sdp->sd_log_blks_reserved);
 	gfs2_assert_withdraw(sdp, !sdp->sd_log_num_revoke);
 	gfs2_assert_withdraw(sdp, list_empty(&sdp->sd_ail1_list));
 
diff --git a/fs/gfs2/log.h b/fs/gfs2/log.h
index b36a3539f352..f3c8e4285ec9 100644
--- a/fs/gfs2/log.h
+++ b/fs/gfs2/log.h
@@ -81,6 +81,6 @@ extern void log_flush_wait(struct gfs2_sbd *sdp);
 extern int gfs2_logd(void *data);
 extern void gfs2_add_revoke(struct gfs2_sbd *sdp, struct gfs2_bufdata *bd);
 extern void gfs2_glock_remove_revoke(struct gfs2_glock *gl);
-extern void gfs2_flush_revokes(struct gfs2_sbd *sdp);
+extern void gfs2_flush_revokes(struct gfs2_sbd *sdp, struct gfs2_trans *tr);
 
 #endif /* __LOG_DOT_H__ */
diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index 8658ebbcb4a9..db554f7623ec 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -845,7 +845,7 @@ static void revoke_lo_before_commit(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 	struct page *page;
 	unsigned int length;
 
-	gfs2_flush_revokes(sdp);
+	gfs2_flush_revokes(sdp, tr);
 	if (!sdp->sd_log_num_revoke)
 		return;
 
-- 
2.26.2

