Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 136F0546B3E
	for <lists+cluster-devel@lfdr.de>; Fri, 10 Jun 2022 19:06:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654880790;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NekdNrABcprCK4atgjm4eAkz4ycOcfvRXPtjPpq6TjU=;
	b=DdlDNW5VchvrxXTQODcHxAXPFz28qD8hIx6JUmCXIEuFZp6VEnI1zAFm0dKtsnVUW4Kvx1
	aYM3Z1wFT/RwFclRNFalhqAIM1E2GuRnnz1X+R//dFwZrCa0oxBfIj5QjbwYj1Jtfi4Doi
	xTLIzm9rZXzV58bYljBqi37nkrMhbUE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-410-QunVA5wsPEOtBT_D1ZJL2w-1; Fri, 10 Jun 2022 13:06:27 -0400
X-MC-Unique: QunVA5wsPEOtBT_D1ZJL2w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 530F12949BCD;
	Fri, 10 Jun 2022 17:06:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B309F1131A;
	Fri, 10 Jun 2022 17:06:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 11419194705E;
	Fri, 10 Jun 2022 17:06:24 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 41FB619466DF for <cluster-devel@listman.corp.redhat.com>;
 Fri, 10 Jun 2022 17:06:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2409718EA7; Fri, 10 Jun 2022 17:06:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05F1B1730C;
 Fri, 10 Jun 2022 17:06:23 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 10 Jun 2022 13:06:12 -0400
Message-Id: <20220610170616.3480642-4-aahringo@redhat.com>
In-Reply-To: <20220610170616.3480642-1-aahringo@redhat.com>
References: <20220610170616.3480642-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [Cluster-devel] [PATCH v5.19-rc1 3/7] fs: dlm: let new_lockspace()
 wait until recovery
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
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch changes the behaviour in dlm_new_lockspace() function to wait
until a recovery was successful or failed. Before a possible waiter in
ls_members_done was waiting until dlm_recover_members() was done
either if it was successful (inclusive interrupted) or failed. The result
was returned to the waiter of dlm_new_lockspace(), if success the caller
was able to use the lockspace at this point.

This behaviour is now changed to wait of a complete run of recovery
functionality which is done by ls_recover(). The result can be either
successful or failed and delivered back to a possible waiter of
ls_recovery_done. A possible waiter is then able to use the lockspace
or run error handling if failed. If recovery gets interrupted
e.g. checked at several places if dlm_locking_stopped() is true, a
possible waiter of ls_recovery_done is still waiting until ls_recover()
is successful or fails.

A reason why the recovery task gets interrupted is that an another
dlm_ls_stop() was called while ls_recover() runs. The call of an another
dlm_ls_stop() means that the recovery task will call ls_recover() again
with a possible new configuration delivered by the cluster manager.

Most dlm kernel users e.g. gfs2 or cluster-md have their own wait
handling to wait for recovery done after calling dlm_new_lockspace().
This becomes unnecessary now but still works. Users can update their code
because dlm takes care about it now.

An example to simple interrupt recovery can be done by calling
dlm_new_lockspace() and dlm_release_lockspace() in a loop on several
cluster nodes. This has the effect that the cluster manager will
interrupt the recovery with new membership information over and over
again.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/dlm_internal.h |  4 ++--
 fs/dlm/lockspace.c    |  9 +++++----
 fs/dlm/member.c       | 13 -------------
 fs/dlm/recoverd.c     | 13 +++++++++++++
 4 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index 776c3ed519f0..c03388a3875c 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -606,8 +606,8 @@ struct dlm_ls {
 
 	wait_queue_head_t	ls_uevent_wait;	/* user part of join/leave */
 	int			ls_uevent_result;
-	struct completion	ls_members_done;
-	int			ls_members_result;
+	struct completion	ls_recovery_done;
+	int			ls_recovery_result;
 
 	struct miscdevice       ls_device;
 
diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index 19ed41a5da93..0c3613d09c5e 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -548,8 +548,8 @@ static int new_lockspace(const char *name, const char *cluster,
 
 	init_waitqueue_head(&ls->ls_uevent_wait);
 	ls->ls_uevent_result = 0;
-	init_completion(&ls->ls_members_done);
-	ls->ls_members_result = -1;
+	init_completion(&ls->ls_recovery_done);
+	ls->ls_recovery_result = -1;
 
 	mutex_init(&ls->ls_cb_mutex);
 	INIT_LIST_HEAD(&ls->ls_cb_delay);
@@ -645,8 +645,9 @@ static int new_lockspace(const char *name, const char *cluster,
 	if (error)
 		goto out_recoverd;
 
-	wait_for_completion(&ls->ls_members_done);
-	error = ls->ls_members_result;
+	/* wait until recovery is successful or failed */
+	wait_for_completion(&ls->ls_recovery_done);
+	error = ls->ls_recovery_result;
 	if (error)
 		goto out_members;
 
diff --git a/fs/dlm/member.c b/fs/dlm/member.c
index 67b056634f03..2af2ccfe43a9 100644
--- a/fs/dlm/member.c
+++ b/fs/dlm/member.c
@@ -587,19 +587,6 @@ int dlm_recover_members(struct dlm_ls *ls, struct dlm_recover *rv, int *neg_out)
 	*neg_out = neg;
 
 	error = ping_members(ls);
-	/* error -EINTR means that a new recovery action is triggered.
-	 * We ignore this recovery action and let run the new one which might
-	 * have new member configuration.
-	 */
-	if (error == -EINTR)
-		error = 0;
-
-	/* new_lockspace() may be waiting to know if the config
-	 * is good or bad
-	 */
-	ls->ls_members_result = error;
-	complete(&ls->ls_members_done);
-
 	log_rinfo(ls, "dlm_recover_members %d nodes", ls->ls_num_nodes);
 	return error;
 }
diff --git a/fs/dlm/recoverd.c b/fs/dlm/recoverd.c
index b5b519cde20b..98c17f74927f 100644
--- a/fs/dlm/recoverd.c
+++ b/fs/dlm/recoverd.c
@@ -243,6 +243,9 @@ static int ls_recover(struct dlm_ls *ls, struct dlm_recover *rv)
 		  jiffies_to_msecs(jiffies - start));
 	mutex_unlock(&ls->ls_recoverd_active);
 
+	ls->ls_recovery_result = 0;
+	complete(&ls->ls_recovery_done);
+
 	dlm_lsop_recover_done(ls);
 	return 0;
 
@@ -251,6 +254,16 @@ static int ls_recover(struct dlm_ls *ls, struct dlm_recover *rv)
 	log_rinfo(ls, "dlm_recover %llu error %d",
 		  (unsigned long long)rv->seq, error);
 	mutex_unlock(&ls->ls_recoverd_active);
+
+	/* let new_lockspace() get aware of critical error if recovery
+	 * was interrupted -EINTR we wait for the next ls_recover()
+	 * iteration until it succeeds.
+	 */
+	if (error != -EINTR) {
+		ls->ls_recovery_result = error;
+		complete(&ls->ls_recovery_done);
+	}
+
 	return error;
 }
 
-- 
2.31.1

