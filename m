Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2B4EC2D9463
	for <lists+cluster-devel@lfdr.de>; Mon, 14 Dec 2020 09:55:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607936103;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CaRJrlXFGXwFatX4lUW6qD2/LuU/RWeep1+DVP17pfU=;
	b=bJtfhTjKkGYHEfHeA271t26Hp616oOjTZPp2fpVusra2qg4HJSBIcqz5a5NNIABUlhztfP
	WLYoR1InsX0zPIq+Mrh69mACFH8EbFKjEdvzh1noAI2FVzw9WvllythQsw6HuCogJXWB3Y
	uo9jkqH7hteIPoTjLI4yFeYQoyjrMOU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-1Kdh9ht0Pqurum_xsVm4gw-1; Mon, 14 Dec 2020 03:55:01 -0500
X-MC-Unique: 1Kdh9ht0Pqurum_xsVm4gw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFD4419611AD;
	Mon, 14 Dec 2020 08:54:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E046C60C13;
	Mon, 14 Dec 2020 08:54:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C3A0D1809CA0;
	Mon, 14 Dec 2020 08:54:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BE8sv4l016440 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 14 Dec 2020 03:54:57 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DB56E62681; Mon, 14 Dec 2020 08:54:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.194])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 23C5E62688;
	Mon, 14 Dec 2020 08:54:54 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 14 Dec 2020 09:54:36 +0100
Message-Id: <20201214085442.45467-7-agruenba@redhat.com>
In-Reply-To: <20201214085442.45467-1-agruenba@redhat.com>
References: <20201214085442.45467-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 06/12] gfs2: Clean up ail2_empty
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

Clean up the logic in ail2_empty (no functional change).

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/log.c | 38 +++++++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index f7c225520c38..33f7b1544958 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -367,29 +367,33 @@ static void gfs2_ail_empty_tr(struct gfs2_sbd *sdp, struct gfs2_trans *tr,
 	}
 }
 
+static void __ail2_empty(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
+{
+	gfs2_ail_empty_tr(sdp, tr, &tr->tr_ail2_list);
+	list_del(&tr->tr_list);
+	gfs2_assert_warn(sdp, list_empty(&tr->tr_ail1_list));
+	gfs2_assert_warn(sdp, list_empty(&tr->tr_ail2_list));
+	gfs2_trans_free(sdp, tr);
+}
+
 static void ail2_empty(struct gfs2_sbd *sdp, unsigned int new_tail)
 {
-	struct gfs2_trans *tr, *safe;
+	struct list_head *ail2_list = &sdp->sd_ail2_list;
 	unsigned int old_tail = sdp->sd_log_tail;
-	int wrap = (new_tail < old_tail);
-	int a, b, rm;
+	struct gfs2_trans *tr, *safe;
 
 	spin_lock(&sdp->sd_ail_lock);
-
-	list_for_each_entry_safe(tr, safe, &sdp->sd_ail2_list, tr_list) {
-		a = (old_tail <= tr->tr_first);
-		b = (tr->tr_first < new_tail);
-		rm = (wrap) ? (a || b) : (a && b);
-		if (!rm)
-			continue;
-
-		gfs2_ail_empty_tr(sdp, tr, &tr->tr_ail2_list);
-		list_del(&tr->tr_list);
-		gfs2_assert_warn(sdp, list_empty(&tr->tr_ail1_list));
-		gfs2_assert_warn(sdp, list_empty(&tr->tr_ail2_list));
-		gfs2_trans_free(sdp, tr);
+	if (old_tail <= new_tail) {
+		list_for_each_entry_safe(tr, safe, ail2_list, tr_list) {
+			if (old_tail <= tr->tr_first && tr->tr_first < new_tail)
+				__ail2_empty(sdp, tr);
+		}
+	} else {
+		list_for_each_entry_safe(tr, safe, ail2_list, tr_list) {
+			if (old_tail <= tr->tr_first || tr->tr_first < new_tail)
+				__ail2_empty(sdp, tr);
+		}
 	}
-
 	spin_unlock(&sdp->sd_ail_lock);
 }
 
-- 
2.26.2

