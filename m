Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C2D560754
	for <lists+cluster-devel@lfdr.de>; Wed, 29 Jun 2022 19:24:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656523483;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Sf3QeVF3m8nY8aWVHhg+tcYwuphiWYuBTLw2IyOttQo=;
	b=KsfjveceH5aal+BbwDZYBp4m9Wzti2f8A4ETdCwVNWMxqdwAS/0a/Wn52bfNCuokCOxUBw
	4gNP0r5kLvdnx3KrDNKA+8zED+eupm6aGt3RtLpumMAUIZKsfB3hGuk6JhWm7qWkf3PStW
	ios6Glu2J63IMaEGf6QrAeRna0RwPkc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-257-Q1Ss8NSVOwu3wW9BW1Eqxg-1; Wed, 29 Jun 2022 13:24:40 -0400
X-MC-Unique: Q1Ss8NSVOwu3wW9BW1Eqxg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74252381079E;
	Wed, 29 Jun 2022 17:24:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1FB3B2026D64;
	Wed, 29 Jun 2022 17:24:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B38991947068;
	Wed, 29 Jun 2022 17:24:38 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D67F21947058 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 29 Jun 2022 16:37:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BFC56492CA4; Wed, 29 Jun 2022 16:37:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.localdomain (unknown [10.40.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E22F492CA3;
 Wed, 29 Jun 2022 16:37:13 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 29 Jun 2022 18:37:03 +0200
Message-Id: <20220629163711.732931-2-agruenba@redhat.com>
In-Reply-To: <20220629163711.732931-1-agruenba@redhat.com>
References: <20220629163711.732931-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [Cluster-devel] [PATCH 1/9] gfs2: Fix up gfs2_glock_async_wait
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Since commit 1fc05c8d8426 ("gfs2: cancel timed-out glock requests"), a
pending locking request can be canceled by calling gfs2_glock_dq() on
the pending holder.  In gfs2_glock_async_wait(), when we time out, use
that to cancel the remaining locking requests and dequeue the locking
requests already granted.  That's simpler as well as more efficient than
waiting for all locking requests to eventually be granted and dequeuing
them then.

In addition, gfs2_glock_async_wait() promises that by the time the
function completes, all glocks are either granted or dequeued, but the
implementation doesn't keep that promise if individual locking requests
fail.  Fix that as well.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c | 53 ++++++++++++++-----------------------------------
 1 file changed, 15 insertions(+), 38 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index c992d53013d3..f8a98fcbc04c 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -1355,7 +1355,6 @@ int gfs2_glock_async_wait(unsigned int num_gh, struct gfs2_holder *ghs)
 	struct gfs2_sbd *sdp = ghs[0].gh_gl->gl_name.ln_sbd;
 	int i, ret = 0, timeout = 0;
 	unsigned long start_time = jiffies;
-	bool keep_waiting;
 
 	might_sleep();
 	/*
@@ -1365,53 +1364,31 @@ int gfs2_glock_async_wait(unsigned int num_gh, struct gfs2_holder *ghs)
 	for (i = 0; i < num_gh; i++)
 		timeout += ghs[i].gh_gl->gl_hold_time << 1;
 
-wait_for_dlm:
 	if (!wait_event_timeout(sdp->sd_async_glock_wait,
-				!glocks_pending(num_gh, ghs), timeout))
+				!glocks_pending(num_gh, ghs), timeout)) {
 		ret = -ESTALE; /* request timed out. */
+		goto out;
+	}
 
-	/*
-	 * If dlm granted all our requests, we need to adjust the glock
-	 * minimum hold time values according to how long we waited.
-	 *
-	 * If our request timed out, we need to repeatedly release any held
-	 * glocks we acquired thus far to allow dlm to acquire the remaining
-	 * glocks without deadlocking.  We cannot currently cancel outstanding
-	 * glock acquisitions.
-	 *
-	 * The HIF_WAIT bit tells us which requests still need a response from
-	 * dlm.
-	 *
-	 * If dlm sent us any errors, we return the first error we find.
-	 */
-	keep_waiting = false;
 	for (i = 0; i < num_gh; i++) {
-		/* Skip holders we have already dequeued below. */
-		if (!gfs2_holder_queued(&ghs[i]))
-			continue;
-		/* Skip holders with a pending DLM response. */
-		if (test_bit(HIF_WAIT, &ghs[i].gh_iflags)) {
-			keep_waiting = true;
-			continue;
-		}
+		struct gfs2_holder *gh = &ghs[i];
 
-		if (test_bit(HIF_HOLDER, &ghs[i].gh_iflags)) {
-			if (ret == -ESTALE)
-				gfs2_glock_dq(&ghs[i]);
-			else
-				gfs2_glock_update_hold_time(ghs[i].gh_gl,
-							    start_time);
+		if (test_bit(HIF_HOLDER, &gh->gh_iflags)) {
+			gfs2_glock_update_hold_time(gh->gh_gl,
+						    start_time);
 		}
 		if (!ret)
-			ret = ghs[i].gh_error;
+			ret = gh->gh_error;
 	}
 
-	if (keep_waiting)
-		goto wait_for_dlm;
+out:
+	if (ret) {
+		for (i = 0; i < num_gh; i++) {
+			struct gfs2_holder *gh = &ghs[i];
 
-	/*
-	 * At this point, we've either acquired all locks or released them all.
-	 */
+			gfs2_glock_dq(gh);
+		}
+	}
 	return ret;
 }
 
-- 
2.35.1

