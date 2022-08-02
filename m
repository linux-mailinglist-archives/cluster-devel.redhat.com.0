Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB99588161
	for <lists+cluster-devel@lfdr.de>; Tue,  2 Aug 2022 19:58:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659463098;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Mlb9iYKHtBrm21rVmYucs6iJcoXebP/8XGZedfXne7Y=;
	b=bKDiuPh6dBVrJjwALeBtY57ejiuBfh0iOpnbjWYo8wksMRQKr5Q35CNVM5cy31NaVtL3QJ
	RpPxq37U4Ps/7Xowtb6fP0CruCxVuFcD4JH+UWI6icSQ+s7ePxhoIkRwe1EcbXIXZgTpQj
	4WfDae4c1c8NRKxwEIvjMpM1p3wcq7s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-lnOkSb0zOAi73Rryu1VtJw-1; Tue, 02 Aug 2022 13:58:16 -0400
X-MC-Unique: lnOkSb0zOAi73Rryu1VtJw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2AAB31C06EDA;
	Tue,  2 Aug 2022 17:58:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D335E14152E5;
	Tue,  2 Aug 2022 17:58:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 748EB1946A4A;
	Tue,  2 Aug 2022 17:58:14 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 454B61946A5E for <cluster-devel@listman.corp.redhat.com>;
 Tue,  2 Aug 2022 17:58:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 333C61415117; Tue,  2 Aug 2022 17:58:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.users.ipa.redhat.com (unknown [10.2.16.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B4811415116
 for <cluster-devel@redhat.com>; Tue,  2 Aug 2022 17:58:12 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue,  2 Aug 2022 12:58:11 -0500
Message-Id: <20220802175811.438067-4-rpeterso@redhat.com>
In-Reply-To: <20220802175811.438067-1-rpeterso@redhat.com>
References: <20220802175811.438067-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: [Cluster-devel] [PATCH 3/3] gfs2: Clear GLF_LOCK when withdraw
 prevents xmote
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

There are a couple places in function do_xmote where normal processing
is circumvented due to withdraws in progress. However, since we bypass
most of do_xmote() we bypass telling dlm to lock the dlm lock, which
means dlm will never respond with a completion callback. Since the
completion callback ordinarily clears GLF_LOCK, this patch changes
function do_xmote to handle those situations more gracefully so the
file system may be unmounted after withdraw.

A very similar situation happens with the GLF_DEMOTE_IN_PROGRESS flag,
which is cleared by function finish_xmote(). Since the withdraw causes
us to skip the majority of do_xmote, it therefore also skips the call
to finish_xmote() so the DEMOTE_IN_PROGRESS flag needs to be cleared
manually as well.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 0bfecffd71f1..d508d8fa0838 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -59,6 +59,8 @@ typedef void (*glock_examiner) (struct gfs2_glock * gl);
 
 static void do_xmote(struct gfs2_glock *gl, struct gfs2_holder *gh, unsigned int target);
 static void __gfs2_glock_dq(struct gfs2_holder *gh);
+static void handle_callback(struct gfs2_glock *gl, unsigned int state,
+			    unsigned long delay, bool remote);
 
 static struct dentry *gfs2_root;
 static struct workqueue_struct *glock_workqueue;
@@ -762,8 +764,21 @@ __acquires(&gl->gl_lockref.lock)
 	int ret;
 
 	if (target != LM_ST_UNLOCKED && glock_blocked_by_withdraw(gl) &&
-	    gh && !(gh->gh_flags & LM_FLAG_NOEXP))
+	    gh && !(gh->gh_flags & LM_FLAG_NOEXP)) {
+		/*
+		 * We won't tell dlm to perform the lock, so we won't get a
+		 * reply that would otherwise clear GLF_LOCK. So we clear it.
+		 */
+		handle_callback(gl, LM_ST_UNLOCKED, 0, false);
+		clear_bit(GLF_LOCK, &gl->gl_flags);
+		clear_bit(GLF_DEMOTE_IN_PROGRESS, &gl->gl_flags);
+		/*
+		 * Don't increment lockref here. The next time the worker runs it will do
+		 * glock_put, which will decrement it to 0, and free the glock.
+		 */
+		__gfs2_glock_queue_work(gl, GL_GLOCK_DFT_HOLD);
 		return;
+	}
 	lck_flags &= (LM_FLAG_TRY | LM_FLAG_TRY_1CB | LM_FLAG_NOEXP |
 		      LM_FLAG_PRIORITY);
 	GLOCK_BUG_ON(gl, gl->gl_state == target);
@@ -848,6 +863,8 @@ __acquires(&gl->gl_lockref.lock)
 	    (target != LM_ST_UNLOCKED ||
 	     test_bit(SDF_WITHDRAW_RECOVERY, &sdp->sd_flags))) {
 		if (!is_system_glock(gl)) {
+			clear_bit(GLF_LOCK, &gl->gl_flags);
+			clear_bit(GLF_DEMOTE_IN_PROGRESS, &gl->gl_flags);
 			gfs2_glock_queue_work(gl, GL_GLOCK_DFT_HOLD);
 			goto out;
 		} else {
-- 
2.36.1

