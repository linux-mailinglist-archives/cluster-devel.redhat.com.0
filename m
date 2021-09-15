Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id AE9B640CE5E
	for <lists+cluster-devel@lfdr.de>; Wed, 15 Sep 2021 22:43:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631738622;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GKhiGjD+I0P39pxM0gXpYLU4kpjOsJbozRHWMdqJOns=;
	b=WkAF2LpYv0Cbep9JLKE5+rabsHH0kPjqVF7cwpXZ+mV7LWeC0w+J1E6U0y762vjjXUG43X
	TFPTpSNq1UFqg3SppX5gcfBGoxImN/040AhD1Zp22jWEFtikb27g66boZ/rFqUTdpczy7z
	cbvwT7NDCHr5PkUXo+OEHSOIKRDMiyU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-_xHsikExMUuKmYYrqqaEMQ-1; Wed, 15 Sep 2021 16:43:40 -0400
X-MC-Unique: _xHsikExMUuKmYYrqqaEMQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B27A102CB29;
	Wed, 15 Sep 2021 20:43:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C1EB60C81;
	Wed, 15 Sep 2021 20:43:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 767E01805989;
	Wed, 15 Sep 2021 20:43:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18FKdTjk032322 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 Sep 2021 16:39:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BD391604CC; Wed, 15 Sep 2021 20:39:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7D77860BD8;
	Wed, 15 Sep 2021 20:39:29 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 15 Sep 2021 16:39:16 -0400
Message-Id: <20210915203916.3661690-4-aahringo@redhat.com>
In-Reply-To: <20210915203916.3661690-1-aahringo@redhat.com>
References: <20210915203916.3661690-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 3/3] fs: dlm: let new_lockspace()
	wait until recovery
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
index 5f57538b5d45..de6c9fb5dd30 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -610,8 +610,8 @@ struct dlm_ls {
 
 	wait_queue_head_t	ls_uevent_wait;	/* user part of join/leave */
 	int			ls_uevent_result;
-	struct completion	ls_members_done;
-	int			ls_members_result;
+	struct completion	ls_recovery_done;
+	int			ls_recovery_result;
 
 	struct miscdevice       ls_device;
 
diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index 10eddfa6c3d7..0feffdeeb329 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -547,8 +547,8 @@ static int new_lockspace(const char *name, const char *cluster,
 
 	init_waitqueue_head(&ls->ls_uevent_wait);
 	ls->ls_uevent_result = 0;
-	init_completion(&ls->ls_members_done);
-	ls->ls_members_result = -1;
+	init_completion(&ls->ls_recovery_done);
+	ls->ls_recovery_result = -1;
 
 	mutex_init(&ls->ls_cb_mutex);
 	INIT_LIST_HEAD(&ls->ls_cb_delay);
@@ -642,8 +642,9 @@ static int new_lockspace(const char *name, const char *cluster,
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
index 446e1635229d..3122c5a718c4 100644
--- a/fs/dlm/member.c
+++ b/fs/dlm/member.c
@@ -593,19 +593,6 @@ int dlm_recover_members(struct dlm_ls *ls, struct dlm_recover *rv, int *neg_out)
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
index 208b69f46baf..eaf310fdcb7d 100644
--- a/fs/dlm/recoverd.c
+++ b/fs/dlm/recoverd.c
@@ -244,6 +244,9 @@ static int ls_recover(struct dlm_ls *ls, struct dlm_recover *rv)
 		  jiffies_to_msecs(jiffies - start));
 	mutex_unlock(&ls->ls_recoverd_active);
 
+	ls->ls_recovery_result = 0;
+	complete(&ls->ls_recovery_done);
+
 	dlm_lsop_recover_done(ls);
 	return 0;
 
@@ -252,6 +255,16 @@ static int ls_recover(struct dlm_ls *ls, struct dlm_recover *rv)
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
2.27.0

