Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1BB812DF1AB
	for <lists+cluster-devel@lfdr.de>; Sat, 19 Dec 2020 21:49:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608410982;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lkjUAHVQwo7lY9m5sJdjzw5Me/lpjKuQZ7igpv/EH70=;
	b=SM9yfrVj+N0pM8+gJyoBdLbsoez+TSWpaEj2OPlGUHOyPnI5VQ9OOVDBtLC85gdHQYZoiF
	ARybtveh8mvvXWgfyfWrBdPVlBBNHrgcbjJNkd8fBt3SEV1r4syswfndTuosWogQhAmVEz
	exDvNsiKv2YdacrDWzUUVsl9YmAHw2k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-R2fjYZ0WOVas_ztG4jgPZQ-1; Sat, 19 Dec 2020 15:49:40 -0500
X-MC-Unique: R2fjYZ0WOVas_ztG4jgPZQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CD1DE763;
	Sat, 19 Dec 2020 20:49:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AAB471D66;
	Sat, 19 Dec 2020 20:49:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 26A6F5002C;
	Sat, 19 Dec 2020 20:49:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BJKna4i020335 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 19 Dec 2020 15:49:36 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 668232DAD0; Sat, 19 Dec 2020 20:49:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (ovpn-115-196.ams2.redhat.com [10.36.115.196])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 68E675B4BE;
	Sat, 19 Dec 2020 20:49:31 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Sat, 19 Dec 2020 21:48:46 +0100
Message-Id: <20201219204848.285781-19-agruenba@redhat.com>
In-Reply-To: <20201219204848.285781-1-agruenba@redhat.com>
References: <20201219204848.285781-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v2 18/20] gfs2: Remove sd_log_blks_reserved
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
index 5489140a52cf..4298df94768a 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -820,7 +820,6 @@ struct gfs2_sbd {
 	spinlock_t sd_log_lock;
 
 	struct gfs2_trans *sd_log_tr;
-	unsigned int sd_log_blks_reserved;
 
 	atomic_t sd_log_pinned;
 	unsigned int sd_log_num_revoke;
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 2d4defc9129d..2fed4b4a7a02 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -702,6 +702,7 @@ void gfs2_glock_remove_revoke(struct gfs2_glock *gl)
 /**
  * gfs2_add_aux_revokes - Add as many revokes to the system transaction as we can
  * @sdp: The GFS2 superblock
+ * @tr: The transaction
  *
  * Our usual strategy is to defer writing revokes as much as we can in the hope
  * that we'll eventually overwrite the journal, which will make those revokes
@@ -711,7 +712,7 @@ void gfs2_glock_remove_revoke(struct gfs2_glock *gl)
  * been written back.  This will basically come at no cost now, and will save
  * us from having to keep track of those blocks on the AIL2 list later.
  */
-void gfs2_add_aux_revokes(struct gfs2_sbd *sdp)
+void gfs2_add_aux_revokes(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 {
 	/* number of revokes we still have room for */
 	unsigned int max_revokes;
@@ -726,7 +727,7 @@ void gfs2_add_aux_revokes(struct gfs2_sbd *sdp)
 		atomic_dec(&sdp->sd_log_blks_free);
 		/* If no blocks have been reserved, we need to also
 		 * reserve a block for the header */
-		if (!sdp->sd_log_blks_reserved) {
+		if (!tr) {
 			atomic_dec(&sdp->sd_log_blks_free);
 			trace_gfs2_log_blocks(sdp, -2);
 		} else {
@@ -738,7 +739,7 @@ void gfs2_add_aux_revokes(struct gfs2_sbd *sdp)
 
 	if (!sdp->sd_log_num_revoke) {
 		atomic_inc(&sdp->sd_log_blks_free);
-		if (!sdp->sd_log_blks_reserved) {
+		if (!tr) {
 			atomic_inc(&sdp->sd_log_blks_free);
 			trace_gfs2_log_blocks(sdp, 2);
 		} else {
@@ -1017,7 +1018,6 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 
 	gfs2_log_lock(sdp);
 	gfs2_log_update_head(sdp);
-	sdp->sd_log_blks_reserved = 0;
 
 	spin_lock(&sdp->sd_ail_lock);
 	if (tr && !list_empty(&tr->tr_ail1_list)) {
@@ -1082,6 +1082,7 @@ static void gfs2_merge_trans(struct gfs2_sbd *sdp, struct gfs2_trans *new)
 
 	WARN_ON_ONCE(!test_bit(TR_ATTACHED, &old->tr_flags));
 
+	old->tr_reserved	+= new->tr_reserved;
 	old->tr_num_buf_new	+= new->tr_num_buf_new;
 	old->tr_num_databuf_new	+= new->tr_num_databuf_new;
 	old->tr_num_buf_rm	+= new->tr_num_buf_rm;
@@ -1102,23 +1103,22 @@ static void log_refund(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
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
 	gfs2_log_release(sdp, unused);
-	sdp->sd_log_blks_reserved = reserved;
 
 	gfs2_log_unlock(sdp);
 }
@@ -1156,7 +1156,6 @@ void gfs2_log_commit(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 
 static void gfs2_log_shutdown(struct gfs2_sbd *sdp)
 {
-	gfs2_assert_withdraw(sdp, !sdp->sd_log_blks_reserved);
 	gfs2_assert_withdraw(sdp, !sdp->sd_log_num_revoke);
 	gfs2_assert_withdraw(sdp, list_empty(&sdp->sd_ail1_list));
 
diff --git a/fs/gfs2/log.h b/fs/gfs2/log.h
index c7f894168600..911276be0e01 100644
--- a/fs/gfs2/log.h
+++ b/fs/gfs2/log.h
@@ -81,6 +81,6 @@ extern void log_flush_wait(struct gfs2_sbd *sdp);
 extern int gfs2_logd(void *data);
 extern void gfs2_add_revoke(struct gfs2_sbd *sdp, struct gfs2_bufdata *bd);
 extern void gfs2_glock_remove_revoke(struct gfs2_glock *gl);
-extern void gfs2_add_aux_revokes(struct gfs2_sbd *sdp);
+extern void gfs2_add_aux_revokes(struct gfs2_sbd *sdp, struct gfs2_trans *tr);
 
 #endif /* __LOG_DOT_H__ */
diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index 3b4e51089bbd..4266195d1f1e 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -845,7 +845,7 @@ static void revoke_lo_before_commit(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 	struct page *page;
 	unsigned int length;
 
-	gfs2_add_aux_revokes(sdp);
+	gfs2_add_aux_revokes(sdp, tr);
 	if (!sdp->sd_log_num_revoke)
 		return;
 
-- 
2.26.2

