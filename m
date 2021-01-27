Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 305013065BA
	for <lists+cluster-devel@lfdr.de>; Wed, 27 Jan 2021 22:12:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611781919;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Vaw9pK/n7Na71U5Gm6AZZg8Ub4Pnr0JnXg0/K8vL2GY=;
	b=ixyOLUDv86Zfu205kav/VSfUPvBWUY8sTBafLboC8I462aIroXU1Zmvyg0wxf/DsiOxR5j
	IBUa8Y3rtdEmhYDRjz+DBjMHBJhJ7dfVJnseLphdw1hTnRwQmMH0Xu50hgVPGf8NQzEnpu
	0SvKtE8LXxMIG9hK4gye79q/asEzWAk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-Ka9F0edqPYOp-ElP_Fv14A-1; Wed, 27 Jan 2021 16:11:55 -0500
X-MC-Unique: Ka9F0edqPYOp-ElP_Fv14A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F501100C601;
	Wed, 27 Jan 2021 21:11:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D0BD60C90;
	Wed, 27 Jan 2021 21:11:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 67B481809CAC;
	Wed, 27 Jan 2021 21:11:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10RL8BPE013865 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 27 Jan 2021 16:08:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A91526F456; Wed, 27 Jan 2021 21:08:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.195.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E53137047C;
	Wed, 27 Jan 2021 21:08:10 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 27 Jan 2021 22:07:41 +0100
Message-Id: <20210127210746.16958-16-agruenba@redhat.com>
In-Reply-To: <20210127210746.16958-1-agruenba@redhat.com>
References: <20210127210746.16958-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v3 15/20] gfs2: Move function
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
index 1ca5f2c468d5..f3b11bb78614 100644
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

