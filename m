Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1E74E2DF1AA
	for <lists+cluster-devel@lfdr.de>; Sat, 19 Dec 2020 21:49:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608410977;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ABM1yuPrsNUYRyivkjDq8t2OQz4QJbx9PXlUq5bHboA=;
	b=alxr0JNKxoLkoCV8w5Ze+yyWlL05JgRJdOy5rZdvTVU0CK7Rg6+msbJ1fKl7riS2tAtaGh
	8WkK+2s7D8TLupfCrmB5WKIr5M9QTFkjmxpGyeMMHMaEul8cn7I0PUeH845HwgQs6vye0y
	+5TFbEXZEbaFIuI58cnjtfXnjxyXSfQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-2H_-__W3N7qWru5K9G5qnQ-1; Sat, 19 Dec 2020 15:49:35 -0500
X-MC-Unique: 2H_-__W3N7qWru5K9G5qnQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAB34180A095;
	Sat, 19 Dec 2020 20:49:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB7665C1B4;
	Sat, 19 Dec 2020 20:49:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C8B021809CA0;
	Sat, 19 Dec 2020 20:49:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BJKnUUk020310 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 19 Dec 2020 15:49:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EAE6D2DAD0; Sat, 19 Dec 2020 20:49:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (ovpn-115-196.ams2.redhat.com [10.36.115.196])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D9CCF50ADB;
	Sat, 19 Dec 2020 20:49:29 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Sat, 19 Dec 2020 21:48:45 +0100
Message-Id: <20201219204848.285781-18-agruenba@redhat.com>
In-Reply-To: <20201219204848.285781-1-agruenba@redhat.com>
References: <20201219204848.285781-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v2 17/20] gfs2: Remove
	sd_log_committed_revoke
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

In gfs2_trans_end -> gfs2_log_commit -> gfs2_log_refund, if we don't have a
system transaction, always attach the new transaction even if it only accounts
for revokes.  That way, tr_num_revoke - tr_num_revoke_rm in the system transaction
(sdp->sd_log_tr) will be the number of revokes committed so far, and we can use
that in calc_reserved instead.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/incore.h |  1 -
 fs/gfs2/log.c    | 27 ++++++++++-----------------
 2 files changed, 10 insertions(+), 18 deletions(-)

diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index f1ad78dbd782..5489140a52cf 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -821,7 +821,6 @@ struct gfs2_sbd {
 
 	struct gfs2_trans *sd_log_tr;
 	unsigned int sd_log_blks_reserved;
-	int sd_log_committed_revoke;
 
 	atomic_t sd_log_pinned;
 	unsigned int sd_log_num_revoke;
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 14c5edf2bf51..2d4defc9129d 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -563,21 +563,15 @@ static inline unsigned int log_distance(struct gfs2_sbd *sdp, unsigned int newer
 static unsigned int calc_reserved(struct gfs2_sbd *sdp)
 {
 	unsigned int reserved = 0;
-	unsigned int mbuf;
-	unsigned int dbuf;
+	unsigned int blocks;
 	struct gfs2_trans *tr = sdp->sd_log_tr;
 
-	if (tr) {
-		mbuf = tr->tr_num_buf_new - tr->tr_num_buf_rm;
-		dbuf = tr->tr_num_databuf_new - tr->tr_num_databuf_rm;
-		reserved = mbuf + dbuf;
-		/* Account for header blocks */
-		reserved += DIV_ROUND_UP(mbuf, buf_limit(sdp));
-		reserved += DIV_ROUND_UP(dbuf, databuf_limit(sdp));
-	}
-
-	if (sdp->sd_log_committed_revoke > 0)
-		reserved += gfs2_struct2blk(sdp, sdp->sd_log_committed_revoke);
+	blocks = tr->tr_num_buf_new - tr->tr_num_buf_rm;
+	reserved += blocks + DIV_ROUND_UP(blocks, buf_limit(sdp));
+	blocks = tr->tr_num_databuf_new - tr->tr_num_databuf_rm;
+	reserved += blocks + DIV_ROUND_UP(blocks, databuf_limit(sdp));
+	if (tr->tr_num_revoke - tr->tr_num_revoke_rm)
+		reserved += gfs2_struct2blk(sdp, tr->tr_num_revoke - tr->tr_num_revoke_rm);
 	/* One for the overall header */
 	if (reserved)
 		reserved++;
@@ -996,7 +990,8 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 		if (gfs2_assert_withdraw_delayed(sdp, !sdp->sd_log_num_revoke))
 			goto out_withdraw;
 	if (gfs2_assert_withdraw_delayed(sdp,
-			sdp->sd_log_num_revoke == sdp->sd_log_committed_revoke))
+			sdp->sd_log_num_revoke ==
+			(tr ? tr->tr_num_revoke - tr->tr_num_revoke_rm : 0)))
 		goto out_withdraw;
 
 	gfs2_ordered_write(sdp);
@@ -1023,7 +1018,6 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 	gfs2_log_lock(sdp);
 	gfs2_log_update_head(sdp);
 	sdp->sd_log_blks_reserved = 0;
-	sdp->sd_log_committed_revoke = 0;
 
 	spin_lock(&sdp->sd_ail_lock);
 	if (tr && !list_empty(&tr->tr_ail1_list)) {
@@ -1114,12 +1108,11 @@ static void log_refund(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 
 	if (sdp->sd_log_tr) {
 		gfs2_merge_trans(sdp, tr);
-	} else if (tr->tr_num_buf_new || tr->tr_num_databuf_new) {
+	} else {
 		sdp->sd_log_tr = tr;
 		set_bit(TR_ATTACHED, &tr->tr_flags);
 	}
 
-	sdp->sd_log_committed_revoke += tr->tr_num_revoke - tr->tr_num_revoke_rm;
 	reserved = calc_reserved(sdp);
 	maxres = sdp->sd_log_blks_reserved + tr->tr_reserved;
 	gfs2_assert_withdraw(sdp, maxres >= reserved);
-- 
2.26.2

