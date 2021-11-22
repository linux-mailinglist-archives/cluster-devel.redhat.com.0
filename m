Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DA07D4593BE
	for <lists+cluster-devel@lfdr.de>; Mon, 22 Nov 2021 18:13:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1637601184;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=V/DTZgI3wJOXYeUghCvBeTW8tanLedLrXGe0oQQ5deI=;
	b=T1uHxCfTQ4BbssOs/m+YJ8ekWZBIn8EJjrFljqVjMk5dIUxzfnKGayGIYxZK+2geQ/Pp15
	JlY4r3+yzlmMp8ZcURoH+vk6J7ezU0AwiuLkLIO5aPzGXVaFMIX6RBp0ScKxRmcBYkUTm4
	tMrq4Cau6qNJ/bBVRADvidYP1op52v8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-hjmhrCEpM5aL59bHotT3hA-1; Mon, 22 Nov 2021 12:13:01 -0500
X-MC-Unique: hjmhrCEpM5aL59bHotT3hA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 196E419200C5;
	Mon, 22 Nov 2021 17:12:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B1D360C7F;
	Mon, 22 Nov 2021 17:12:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C15D21832E8A;
	Mon, 22 Nov 2021 17:12:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AMHAwQm029094 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 22 Nov 2021 12:10:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0E76F1835B; Mon, 22 Nov 2021 17:10:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.192.62])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3CC5EADCD;
	Mon, 22 Nov 2021 17:10:57 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 22 Nov 2021 18:10:55 +0100
Message-Id: <20211122171055.315378-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: Fix remote demote of weak glock
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
index 4e04fc30b1ac..20a88b5f131e 100644
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
+			.gh_iflags = HIF_HOLDER
+		};
+
 		demote_incompat_holders(gl, &mock_gh);
 	}
 	handle_callback(gl, state, delay, true);
-- 
2.31.1

