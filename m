Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD55598B3E
	for <lists+cluster-devel@lfdr.de>; Thu, 18 Aug 2022 20:32:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660847570;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=N0wMjq61H2sLOmk8gMqzkLcZflPZM8wEECAboK/RgVA=;
	b=BgzUlkqZUFDIMZ2tMVuZg1R4NDtxqvAiJtDL9u5fnYEc8Km4PsoK3/s7pKWktIAr80luk0
	H3J4bYWRnaFgm1MdH9GcHQGfnbqb1277YOXTEf2cwq2XH71UcqkDfdFoQuykifRXLmJB41
	ItT8vN/mbCtWAYZ0wtpJByrHaxpeoLI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-fbCmfewMNLe6UIapKikNYw-1; Thu, 18 Aug 2022 14:32:45 -0400
X-MC-Unique: fbCmfewMNLe6UIapKikNYw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 360683C0D877;
	Thu, 18 Aug 2022 18:32:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7C22A14152E1;
	Thu, 18 Aug 2022 18:32:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 54B2B1946A43;
	Thu, 18 Aug 2022 18:32:42 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 55F56194E127 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 18 Aug 2022 18:32:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3B384C15BBD; Thu, 18 Aug 2022 18:32:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.users.ipa.redhat.com (unknown [10.2.17.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15AA0C15BBA
 for <cluster-devel@redhat.com>; Thu, 18 Aug 2022 18:32:40 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 18 Aug 2022 13:32:38 -0500
Message-Id: <20220818183238.121677-4-rpeterso@redhat.com>
In-Reply-To: <20220818183238.121677-1-rpeterso@redhat.com>
References: <20220818183238.121677-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: [Cluster-devel] [GFS2 v3 PATCH 3/3] gfs2: Clear flags when withdraw
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
manually.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 0ffe7d474cd5..8d84094555b3 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -59,6 +59,8 @@ typedef void (*glock_examiner) (struct gfs2_glock * gl);
 
 static void do_xmote(struct gfs2_glock *gl, struct gfs2_holder *gh, unsigned int target);
 static void __gfs2_glock_dq(struct gfs2_holder *gh);
+static void handle_callback(struct gfs2_glock *gl, unsigned int state,
+			    unsigned long delay, bool remote);
 
 static struct dentry *gfs2_root;
 static struct workqueue_struct *glock_workqueue;
@@ -730,7 +732,8 @@ static bool is_system_glock(struct gfs2_glock *gl)
  *
  */
 
-static void do_xmote(struct gfs2_glock *gl, struct gfs2_holder *gh, unsigned int target)
+static void do_xmote(struct gfs2_glock *gl, struct gfs2_holder *gh,
+					 unsigned int target)
 __releases(&gl->gl_lockref.lock)
 __acquires(&gl->gl_lockref.lock)
 {
@@ -741,7 +744,8 @@ __acquires(&gl->gl_lockref.lock)
 
 	if (target != LM_ST_UNLOCKED && glock_blocked_by_withdraw(gl) &&
 	    gh && !(gh->gh_flags & LM_FLAG_NOEXP))
-		return;
+		goto skip_inval;
+
 	lck_flags &= (LM_FLAG_TRY | LM_FLAG_TRY_1CB | LM_FLAG_NOEXP |
 		      LM_FLAG_PRIORITY);
 	GLOCK_BUG_ON(gl, gl->gl_state == target);
@@ -826,6 +830,20 @@ __acquires(&gl->gl_lockref.lock)
 	    (target != LM_ST_UNLOCKED ||
 	     test_bit(SDF_WITHDRAW_RECOVERY, &sdp->sd_flags))) {
 		if (!is_system_glock(gl)) {
+			handle_callback(gl, LM_ST_UNLOCKED, 0, false); /* sets demote */
+			/*
+			 * Ordinarily, we would call dlm and its callback would call
+			 * finish_xmote, which would call state_change() to the new state.
+			 * Since we withdrew, we won't call dlm, so call state_change
+			 * manually, but to the UNLOCKED state we desire.
+			 */
+			state_change(gl, LM_ST_UNLOCKED);
+			/*
+			 * We skip telling dlm to do the locking, so we won't get a
+			 * reply that would otherwise clear GLF_LOCK. So we clear it here.
+			 */
+			clear_bit(GLF_LOCK, &gl->gl_flags);
+			clear_bit(GLF_DEMOTE_IN_PROGRESS, &gl->gl_flags);
 			gfs2_glock_queue_work(gl, GL_GLOCK_DFT_HOLD);
 			goto out;
 		} else {
-- 
2.37.2

