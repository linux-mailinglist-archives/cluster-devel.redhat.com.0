Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC0172CB99
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Jun 2023 18:34:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686587639;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XgGdLd3duc2JPgryrV202t0+5VLwtyIGriZ3avHiPmM=;
	b=EEf7H/SZBfn3ToM3DeaC+XQLcPLPdJChVSGXv1o3X+md/LWKUp/KXFmnwlDXoSWeTk35Hu
	LyqplS0zwsOBUiApihDfoIHzThi7CCGG7KUtbEX7UJy6r0XKqdqmr0+5xG5MtID4vabEa4
	VFTh4oKpySXLLnZTD8EgqONNZ0XhS5c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-530-3_-b8zY0N1KeyCbEwrVwUQ-1; Mon, 12 Jun 2023 12:33:52 -0400
X-MC-Unique: 3_-b8zY0N1KeyCbEwrVwUQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F2EA85A5BF;
	Mon, 12 Jun 2023 16:33:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9392E2166B26;
	Mon, 12 Jun 2023 16:33:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 668E319465B6;
	Mon, 12 Jun 2023 16:33:50 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8BBC8194658C for <cluster-devel@listman.corp.redhat.com>;
 Mon, 12 Jun 2023 16:33:49 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 70EC32026834; Mon, 12 Jun 2023 16:33:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (unknown [10.45.224.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E22142026833;
 Mon, 12 Jun 2023 16:33:48 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 12 Jun 2023 18:33:40 +0200
Message-Id: <20230612163347.1293077-2-agruenba@redhat.com>
In-Reply-To: <20230612163347.1293077-1-agruenba@redhat.com>
References: <20230612163347.1293077-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Cluster-devel] [PATCH 1/8] gfs2: Rename remaining "transaction"
 glock references
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The transaction glock was repurposed to serve as the new freeze glock
years ago.  Don't refer to it as the transaction glock anymore.

Also, to be more precise, call it the "freeze glock" instead of the
"freeze lock".  Ditto for the journal glock.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c      | 4 ++--
 fs/gfs2/ops_fstype.c | 2 +-
 fs/gfs2/recovery.c   | 8 ++++----
 fs/gfs2/super.c      | 2 +-
 fs/gfs2/util.c       | 2 +-
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 5adc7d85dbf3..1438e7465e30 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -145,8 +145,8 @@ static void gfs2_glock_dealloc(struct rcu_head *rcu)
  *
  * We need to allow some glocks to be enqueued, dequeued, promoted, and demoted
  * when we're withdrawn. For example, to maintain metadata integrity, we should
- * disallow the use of inode and rgrp glocks when withdrawn. Other glocks, like
- * iopen or the transaction glocks may be safely used because none of their
+ * disallow the use of inode and rgrp glocks when withdrawn. Other glocks like
+ * the iopen or freeze glock may be safely used because none of their
  * metadata goes through the journal. So in general, we should disallow all
  * glocks that are journaled, and allow all the others. One exception is:
  * we need to allow our active journal to be promoted and demoted so others
diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 9af9ddb61ca0..3b93e4a22dfd 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -434,7 +434,7 @@ static int init_locking(struct gfs2_sbd *sdp, struct gfs2_holder *mount_gh,
 	error = gfs2_glock_get(sdp, GFS2_FREEZE_LOCK, &gfs2_freeze_glops,
 			       CREATE, &sdp->sd_freeze_gl);
 	if (error) {
-		fs_err(sdp, "can't create transaction glock: %d\n", error);
+		fs_err(sdp, "can't create freeze glock: %d\n", error);
 		goto fail_rename;
 	}
 
diff --git a/fs/gfs2/recovery.c b/fs/gfs2/recovery.c
index 2bb085a72e8e..d8e522f389aa 100644
--- a/fs/gfs2/recovery.c
+++ b/fs/gfs2/recovery.c
@@ -420,10 +420,10 @@ void gfs2_recover_func(struct work_struct *work)
 	if (sdp->sd_args.ar_spectator)
 		goto fail;
 	if (jd->jd_jid != sdp->sd_lockstruct.ls_jid) {
-		fs_info(sdp, "jid=%u: Trying to acquire journal lock...\n",
+		fs_info(sdp, "jid=%u: Trying to acquire journal glock...\n",
 			jd->jd_jid);
 		jlocked = 1;
-		/* Acquire the journal lock so we can do recovery */
+		/* Acquire the journal glock so we can do recovery */
 
 		error = gfs2_glock_nq_num(sdp, jd->jd_jid, &gfs2_journal_glops,
 					  LM_ST_EXCLUSIVE,
@@ -465,10 +465,10 @@ void gfs2_recover_func(struct work_struct *work)
 		ktime_ms_delta(t_jhd, t_jlck));
 
 	if (!(head.lh_flags & GFS2_LOG_HEAD_UNMOUNT)) {
-		fs_info(sdp, "jid=%u: Acquiring the transaction lock...\n",
+		fs_info(sdp, "jid=%u: Acquiring the freeze glock...\n",
 			jd->jd_jid);
 
-		/* Acquire a shared hold on the freeze lock */
+		/* Acquire a shared hold on the freeze glock */
 
 		error = gfs2_freeze_lock(sdp, &thaw_gh, LM_FLAG_PRIORITY);
 		if (error)
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 3a7e7c31eb9c..03f45711100d 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -463,7 +463,7 @@ static int gfs2_write_inode(struct inode *inode, struct writeback_control *wbc)
  * @flags: The type of dirty
  *
  * Unfortunately it can be called under any combination of inode
- * glock and transaction lock, so we have to check carefully.
+ * glock and freeze glock, so we have to check carefully.
  *
  * At the moment this deals only with atime - it should be possible
  * to expand that role in future, once a review of the locking has
diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index 7a6aeffcdf5c..c84242ef4903 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -107,7 +107,7 @@ int gfs2_freeze_lock(struct gfs2_sbd *sdp, struct gfs2_holder *freeze_gh,
 	error = gfs2_glock_nq_init(sdp->sd_freeze_gl, LM_ST_SHARED, flags,
 				   freeze_gh);
 	if (error && error != GLR_TRYFAILED)
-		fs_err(sdp, "can't lock the freeze lock: %d\n", error);
+		fs_err(sdp, "can't lock the freeze glock: %d\n", error);
 	return error;
 }
 
-- 
2.40.0

