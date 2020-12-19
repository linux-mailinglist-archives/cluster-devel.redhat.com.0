Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id ECD172DF1A9
	for <lists+cluster-devel@lfdr.de>; Sat, 19 Dec 2020 21:49:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608410975;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WRKQXuNf7xV8hE0AbGOo7OmTkm15CzadO/aqJMSNxqo=;
	b=i6tfSpbECzcf2Mgdp8sAvgicw1CvIVOrhKtZSfsTEA7scnkIK5JuDvETmMBqFzB9VyYhrX
	7w8nV1JwljC4gemMwYAxpu6u59a47Ev0Mj7JyKR6Qtb1MvyqK9/7quBIHlzM6vv7uwFw79
	xhxh7fbzHU4EhXhR6pr0QoTNltWOCmE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-5GduhQ-bO0eXFQc5Llc2rQ-1; Sat, 19 Dec 2020 15:49:33 -0500
X-MC-Unique: 5GduhQ-bO0eXFQc5Llc2rQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CB24E769;
	Sat, 19 Dec 2020 20:49:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C5A410016FB;
	Sat, 19 Dec 2020 20:49:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0A7011809C9F;
	Sat, 19 Dec 2020 20:49:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BJKnTdC020295 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 19 Dec 2020 15:49:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5FC4D2DAD0; Sat, 19 Dec 2020 20:49:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (ovpn-115-196.ams2.redhat.com [10.36.115.196])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6355B50A8B;
	Sat, 19 Dec 2020 20:49:28 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Sat, 19 Dec 2020 21:48:44 +0100
Message-Id: <20201219204848.285781-17-agruenba@redhat.com>
In-Reply-To: <20201219204848.285781-1-agruenba@redhat.com>
References: <20201219204848.285781-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v2 16/20] gfs2: No revokes for transactions
	at the tail of the log
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

In gfs2_log_flush, we're going through all active transactions.  For
each of the buffers in those transactions that has completed, we either
add a revoke to the active transaction immediately, or we move the
buffer to the transaction's ail2 list, which may result in a revoke
later.

However, whenever a transaction at the tail of the log completes, the
current tail of the log advances.  gfs2_log_flush writes out the log
header for the system transaction, with lh_tail set to that current tail
(sd_log_flush_head).  This implicitly revokes all previous blocks in the
log, so the revokes we've just written immediately become obsolete.
(This is not the case for transactions that haven't completed or aren't
at the tail of the log.)

Fix this by skipping completed transactions at the tail of the log
instead of writing revokes for them.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/log.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index b771575bce11..14c5edf2bf51 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -287,15 +287,31 @@ static void gfs2_ail_empty_tr(struct gfs2_sbd *sdp, struct gfs2_trans *tr,
  * @tr: the transaction
  * @max_revokes: If nonzero, issue revokes for the bd items for written buffers
  *
- * returns: the transaction's count of remaining active items
+ * Returns: true if the transaction has completed
  */
 
-static int gfs2_ail1_empty_one(struct gfs2_sbd *sdp, struct gfs2_trans *tr,
+static bool gfs2_ail1_empty_one(struct gfs2_sbd *sdp, struct gfs2_trans *tr,
 				int *max_revokes)
 {
 	struct gfs2_bufdata *bd, *s;
 	struct buffer_head *bh;
-	int active_count = 0;
+	bool empty = true;
+
+	if (!sdp->sd_log_error) {
+		list_for_each_entry_reverse(bd, &tr->tr_ail1_list, bd_ail_st_list) {
+			bh = bd->bd_bh;
+
+			if (buffer_busy(bh)) {
+				empty = false;
+				break;
+			}
+		}
+		if (empty) {
+			gfs2_ail_empty_tr(sdp, tr, &tr->tr_ail1_list);
+			gfs2_ail_empty_tr(sdp, tr, &tr->tr_ail2_list);
+			return empty;
+		}
+	}
 
 	list_for_each_entry_safe_reverse(bd, s, &tr->tr_ail1_list,
 					 bd_ail_st_list) {
@@ -311,7 +327,7 @@ static int gfs2_ail1_empty_one(struct gfs2_sbd *sdp, struct gfs2_trans *tr,
 		 * for others.
 		 */
 		if (!sdp->sd_log_error && buffer_busy(bh)) {
-			active_count++;
+			empty = false;
 			continue;
 		}
 		if (!buffer_uptodate(bh) &&
@@ -332,7 +348,7 @@ static int gfs2_ail1_empty_one(struct gfs2_sbd *sdp, struct gfs2_trans *tr,
 		}
 		list_move(&bd->bd_ail_st_list, &tr->tr_ail2_list);
 	}
-	return active_count;
+	return empty;
 }
 
 /**
@@ -351,7 +367,7 @@ static int gfs2_ail1_empty(struct gfs2_sbd *sdp, int max_revokes)
 
 	spin_lock(&sdp->sd_ail_lock);
 	list_for_each_entry_safe_reverse(tr, s, &sdp->sd_ail1_list, tr_list) {
-		if (!gfs2_ail1_empty_one(sdp, tr, &max_revokes) && oldest_tr)
+		if (gfs2_ail1_empty_one(sdp, tr, &max_revokes) && oldest_tr)
 			list_move(&tr->tr_list, &sdp->sd_ail2_list);
 		else
 			oldest_tr = 0;
-- 
2.26.2

