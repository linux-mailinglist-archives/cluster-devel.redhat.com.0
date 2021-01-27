Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6416F3065B6
	for <lists+cluster-devel@lfdr.de>; Wed, 27 Jan 2021 22:11:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611781917;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EtFZm1RfuLxX3AoGrQFllBexpp+H/PwUpbZNbpGB3Kc=;
	b=GHW+/O4yH1/kcJtRfasMnfnhQfEbtsvsf7wLeqFSIBKDX6+SoQPM3BC0majrN2A/H5ljxs
	LK+XrKz/4phhqKMsZrd9Ukzp+eE001BWtUbNsTWMF6uybGRv/0UrKsXwpLQUwCV4Wu9JU4
	tYQ1shc7HFjKQ8RZ8/X1eojbAtcyfbc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-X98ZzgpiM_6lM5BQvC0Usw-1; Wed, 27 Jan 2021 16:11:56 -0500
X-MC-Unique: X98ZzgpiM_6lM5BQvC0Usw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F35161005504;
	Wed, 27 Jan 2021 21:11:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E0FCF6B545;
	Wed, 27 Jan 2021 21:11:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C34CA50039;
	Wed, 27 Jan 2021 21:11:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10RL8DY6013882 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 27 Jan 2021 16:08:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E8CA77047C; Wed, 27 Jan 2021 21:08:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.195.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2C6A86F92A;
	Wed, 27 Jan 2021 21:08:12 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 27 Jan 2021 22:07:43 +0100
Message-Id: <20210127210746.16958-18-agruenba@redhat.com>
In-Reply-To: <20210127210746.16958-1-agruenba@redhat.com>
References: <20210127210746.16958-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v3 17/20] gfs2: Remove
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
index fdf4d942bb1d..3589d02d1df9 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -820,7 +820,6 @@ struct gfs2_sbd {
 
 	struct gfs2_trans *sd_log_tr;
 	unsigned int sd_log_blks_reserved;
-	int sd_log_committed_revoke;
 
 	atomic_t sd_log_pinned;
 	unsigned int sd_log_num_revoke;
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 1fdc3b0dee5e..1ce4300aa81a 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -564,21 +564,15 @@ static inline unsigned int log_distance(struct gfs2_sbd *sdp, unsigned int newer
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
@@ -997,7 +991,8 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 		if (gfs2_assert_withdraw_delayed(sdp, !sdp->sd_log_num_revoke))
 			goto out_withdraw;
 	if (gfs2_assert_withdraw_delayed(sdp,
-			sdp->sd_log_num_revoke == sdp->sd_log_committed_revoke))
+			sdp->sd_log_num_revoke ==
+			(tr ? tr->tr_num_revoke - tr->tr_num_revoke_rm : 0)))
 		goto out_withdraw;
 
 	gfs2_ordered_write(sdp);
@@ -1025,7 +1020,6 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 	gfs2_log_lock(sdp);
 	gfs2_log_update_head(sdp);
 	sdp->sd_log_blks_reserved = 0;
-	sdp->sd_log_committed_revoke = 0;
 
 	spin_lock(&sdp->sd_ail_lock);
 	if (tr && !list_empty(&tr->tr_ail1_list)) {
@@ -1116,12 +1110,11 @@ static void log_refund(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 
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

