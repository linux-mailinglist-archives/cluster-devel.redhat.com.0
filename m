Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7C3C42DF1A8
	for <lists+cluster-devel@lfdr.de>; Sat, 19 Dec 2020 21:49:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608410973;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LMeNcKMvSQmcXfpuzaB/btsgmG2QgOLlJf7R4zedLuY=;
	b=cEaY/z9eIOFI+OPD5t8SizgVRF3F2PouwHsG2YKvWCYRh5+YrWcvxiXdhchOOkd+V+Y1fG
	6hAsRDUnFaIhGHcn3SjXBXG3vfkeSipwlhuGCWN832eCcSVXQ1ZXHOamDXT7gk94Y5B6xW
	s1g6Q6K6D183upqUdsQBy1ux6f1TjW0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-6ukgE3U2Nym_1n1ky_skrg-1; Sat, 19 Dec 2020 15:49:31 -0500
X-MC-Unique: 6ukgE3U2Nym_1n1ky_skrg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B88BC59;
	Sat, 19 Dec 2020 20:49:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A84B660C05;
	Sat, 19 Dec 2020 20:49:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 943BE180954D;
	Sat, 19 Dec 2020 20:49:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BJKnRSd020286 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 19 Dec 2020 15:49:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D7C6A39A60; Sat, 19 Dec 2020 20:49:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (ovpn-115-196.ams2.redhat.com [10.36.115.196])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D04002DAD0;
	Sat, 19 Dec 2020 20:49:26 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Sat, 19 Dec 2020 21:48:43 +0100
Message-Id: <20201219204848.285781-16-agruenba@redhat.com>
In-Reply-To: <20201219204848.285781-1-agruenba@redhat.com>
References: <20201219204848.285781-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v2 15/20] gfs2: Move function
	gfs2_ail_empty_tr
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Move this function further up in log.c so that we can use it in the next patch.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/log.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 47a25833acf3..b771575bce11 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -264,6 +264,23 @@ static void gfs2_log_update_head(struct gfs2_sbd *sdp)
 	sdp->sd_log_head = new_head;
 }
 
+/**
+ * gfs2_ail_empty_tr - empty one of the ail lists of a transaction
+ */
+
+static void gfs2_ail_empty_tr(struct gfs2_sbd *sdp, struct gfs2_trans *tr,
+			      struct list_head *head)
+{
+	struct gfs2_bufdata *bd;
+
+	while (!list_empty(head)) {
+		bd = list_first_entry(head, struct gfs2_bufdata,
+				      bd_ail_st_list);
+		gfs2_assert(sdp, bd->bd_tr == tr);
+		gfs2_remove_from_ail(bd);
+	}
+}
+
 /**
  * gfs2_ail1_empty_one - Check whether or not a trans in the AIL has been synced
  * @sdp: the filesystem
@@ -373,23 +390,6 @@ static void gfs2_ail1_wait(struct gfs2_sbd *sdp)
 	spin_unlock(&sdp->sd_ail_lock);
 }
 
-/**
- * gfs2_ail_empty_tr - empty one of the ail lists for a transaction
- */
-
-static void gfs2_ail_empty_tr(struct gfs2_sbd *sdp, struct gfs2_trans *tr,
-			      struct list_head *head)
-{
-	struct gfs2_bufdata *bd;
-
-	while (!list_empty(head)) {
-		bd = list_first_entry(head, struct gfs2_bufdata,
-				      bd_ail_st_list);
-		gfs2_assert(sdp, bd->bd_tr == tr);
-		gfs2_remove_from_ail(bd);
-	}
-}
-
 static void __ail2_empty(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 {
 	gfs2_ail_empty_tr(sdp, tr, &tr->tr_ail2_list);
-- 
2.26.2

