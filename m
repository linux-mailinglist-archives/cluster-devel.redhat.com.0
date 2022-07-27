Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8492D582A73
	for <lists+cluster-devel@lfdr.de>; Wed, 27 Jul 2022 18:17:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658938624;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mqegY/0tKtzCe3j727gr5ZVzC9oncEOZPoF65aoI3Ik=;
	b=TOSCqsfe/q7Yjay7RLZtISfPKf/Lz5/N1lNHZySJoJVIb2Zumcr7Id1C2WGU89sCbe8MFr
	JUkChhUOD8i1zKpOgDCRw0i9cIiDn0WtmlfR9e0yqIXVPAqzrPCbFPhXRM567GOHzMpgUT
	zZf129XbjFmlHeaVMbEFDRm5eUs4/Ag=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478-MCb3eMWoM3mcTQESCx3mYA-1; Wed, 27 Jul 2022 12:17:01 -0400
X-MC-Unique: MCb3eMWoM3mcTQESCx3mYA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 358002801763;
	Wed, 27 Jul 2022 16:17:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 331C92166B26;
	Wed, 27 Jul 2022 16:16:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E3C711945DA9;
	Wed, 27 Jul 2022 16:16:56 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A957F1945DA2 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 27 Jul 2022 16:02:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9B03D40C1288; Wed, 27 Jul 2022 16:02:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.users.ipa.redhat.com (unknown [10.2.16.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73E4C403D0E0
 for <cluster-devel@redhat.com>; Wed, 27 Jul 2022 16:02:23 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 27 Jul 2022 11:02:22 -0500
Message-Id: <20220727160222.227803-4-rpeterso@redhat.com>
In-Reply-To: <20220727160222.227803-1-rpeterso@redhat.com>
References: <20220727160222.227803-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
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
manually.

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

