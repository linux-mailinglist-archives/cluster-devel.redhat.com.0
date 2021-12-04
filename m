Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B70468407
	for <lists+cluster-devel@lfdr.de>; Sat,  4 Dec 2021 11:27:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638613661;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PVGnxbtl+XH8Jqr9BfpfRhiDoWtgF20PpYEPX1D8k1I=;
	b=Z7EX1V3BJMeLQ2q5oN33RiLvq3I/veQhbonTsHZU5Kc9cywds3jVZK8g3Uq+iVyijgNNSI
	81tm66YM7g02jBTOIVT05RUSHQpeDFqgR5v3bPNNYaV5uvSYmbtM8K+JaVzgOUgfErInjJ
	S9o5vBT6DFs7n32JYobIy6BNHKonRkc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-216-XTD-1s5DNiKdmlteaEvPBw-1; Sat, 04 Dec 2021 05:27:37 -0500
X-MC-Unique: XTD-1s5DNiKdmlteaEvPBw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4C4C10168C7;
	Sat,  4 Dec 2021 10:27:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 054C860BE5;
	Sat,  4 Dec 2021 10:27:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B79C14BB7C;
	Sat,  4 Dec 2021 10:27:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B4ARU7Z017286 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 4 Dec 2021 05:27:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CEBE85C642; Sat,  4 Dec 2021 10:27:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.localdomain (unknown [10.40.192.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 67DFF5C640;
	Sat,  4 Dec 2021 10:27:19 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Sat,  4 Dec 2021 11:27:15 +0100
Message-Id: <20211204102718.19482-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 1/4] gfs2: Fix remote demote of weak glock
	holders
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
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

When we mock up a temporary holder in gfs2_glock_cb to demote weak holders in
response to a remote locking conflict, we don't set the HIF_HOLDER flag.  This
causes function may_grant to BUG.  Fix by setting the missing HIF_HOLDER flag
in the mock glock holder.

In addition, define the mock glock holder where it is used.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 8dbd6fe66420..44a7a4288956 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -1857,7 +1857,6 @@ void gfs2_glock_dq_m(unsigned int num_gh, struct gfs2_holder *ghs)
 
 void gfs2_glock_cb(struct gfs2_glock *gl, unsigned int state)
 {
-	struct gfs2_holder mock_gh = { .gh_gl = gl, .gh_state = state, };
 	unsigned long delay = 0;
 	unsigned long holdtime;
 	unsigned long now = jiffies;
@@ -1890,8 +1889,13 @@ void gfs2_glock_cb(struct gfs2_glock *gl, unsigned int state)
 	 * keep the glock until the last strong holder is done with it.
 	 */
 	if (!find_first_strong_holder(gl)) {
-		if (state == LM_ST_UNLOCKED)
-			mock_gh.gh_state = LM_ST_EXCLUSIVE;
+		struct gfs2_holder mock_gh = {
+			.gh_gl = gl,
+			.gh_state = (state == LM_ST_UNLOCKED) ?
+				    LM_ST_EXCLUSIVE : state,
+			.gh_iflags = BIT(HIF_HOLDER)
+		};
+
 		demote_incompat_holders(gl, &mock_gh);
 	}
 	handle_callback(gl, state, delay, true);
-- 
2.33.1

