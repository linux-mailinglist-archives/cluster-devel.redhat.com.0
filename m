Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B5872CB98
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Jun 2023 18:33:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686587639;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BA6zXXV/HNNX017dQrFhuLdCuf2deM8uTNdyqZ0w7vc=;
	b=VFhct4xzQwsJL1jL8nEtTDJRvtOlaBluip80AKUYIMEksr8poKFscY4jJsUVoX/hl0sClC
	ig3ebvnSaFfNZFcoy6ndKB51QYeCKoTVaL5W5wZ7RLWKjDkWvNGani59RvNlkZfQzNlfSv
	aq5sg9RFldvvqCjKHnXsdY1vbEcLSRY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-19-b0N6cg7xMZmK1Qt0n7JUIA-1; Mon, 12 Jun 2023 12:33:54 -0400
X-MC-Unique: b0N6cg7xMZmK1Qt0n7JUIA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C27B4185A7A7;
	Mon, 12 Jun 2023 16:33:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B7AF010ED7;
	Mon, 12 Jun 2023 16:33:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8A3E019465B9;
	Mon, 12 Jun 2023 16:33:53 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9AF3F19465BB for <cluster-devel@listman.corp.redhat.com>;
 Mon, 12 Jun 2023 16:33:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9083A2024CCB; Mon, 12 Jun 2023 16:33:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (unknown [10.45.224.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0EA052026833;
 Mon, 12 Jun 2023 16:33:51 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 12 Jun 2023 18:33:44 +0200
Message-Id: <20230612163347.1293077-6-agruenba@redhat.com>
In-Reply-To: <20230612163347.1293077-1-agruenba@redhat.com>
References: <20230612163347.1293077-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Cluster-devel] [PATCH 5/8] gfs2: Rename SDF_{FS_FROZEN =>
 FREEZE_INITIATOR}
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Rename the SDF_FS_FROZEN flag to SDF_FREEZE_INITIATOR to indicate more
clearly that the node that has this flag set is the initiator of the
freeze.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com
---
 fs/gfs2/incore.h | 2 +-
 fs/gfs2/super.c  | 8 ++++----
 fs/gfs2/sys.c    | 2 +-
 fs/gfs2/util.c   | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 79485329118b..1f10529ebcf5 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -600,7 +600,7 @@ enum {
 	SDF_RORECOVERY		= 7, /* read only recovery */
 	SDF_SKIP_DLM_UNLOCK	= 8,
 	SDF_FORCE_AIL_FLUSH     = 9,
-	SDF_FS_FROZEN           = 10,
+	SDF_FREEZE_INITIATOR	= 10,
 	SDF_WITHDRAWING		= 11, /* Will withdraw eventually */
 	SDF_WITHDRAW_IN_PROG	= 12, /* Withdraw is in progress */
 	SDF_REMOTE_WITHDRAW	= 13, /* Performing remote recovery */
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 0fecd1887d0c..5f3e699ae922 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -691,8 +691,8 @@ void gfs2_freeze_func(struct work_struct *work)
 		gfs2_freeze_unlock(&freeze_gh);
 	}
 	deactivate_super(sb);
-	clear_bit_unlock(SDF_FS_FROZEN, &sdp->sd_flags);
-	wake_up_bit(&sdp->sd_flags, SDF_FS_FROZEN);
+	clear_bit_unlock(SDF_FREEZE_INITIATOR, &sdp->sd_flags);
+	wake_up_bit(&sdp->sd_flags, SDF_FREEZE_INITIATOR);
 	return;
 }
 
@@ -735,7 +735,7 @@ static int gfs2_freeze_super(struct super_block *sb)
 		fs_err(sdp, "retrying...\n");
 		msleep(1000);
 	}
-	set_bit(SDF_FS_FROZEN, &sdp->sd_flags);
+	set_bit(SDF_FREEZE_INITIATOR, &sdp->sd_flags);
 out:
 	mutex_unlock(&sdp->sd_freeze_mutex);
 	return error;
@@ -760,7 +760,7 @@ static int gfs2_thaw_super(struct super_block *sb)
 
 	gfs2_freeze_unlock(&sdp->sd_freeze_gh);
 	mutex_unlock(&sdp->sd_freeze_mutex);
-	return wait_on_bit(&sdp->sd_flags, SDF_FS_FROZEN, TASK_INTERRUPTIBLE);
+	return wait_on_bit(&sdp->sd_flags, SDF_FREEZE_INITIATOR, TASK_INTERRUPTIBLE);
 }
 
 /**
diff --git a/fs/gfs2/sys.c b/fs/gfs2/sys.c
index 454dc2ff8b5e..bc752de01573 100644
--- a/fs/gfs2/sys.c
+++ b/fs/gfs2/sys.c
@@ -111,7 +111,7 @@ static ssize_t status_show(struct gfs2_sbd *sdp, char *buf)
 		     test_bit(SDF_RORECOVERY, &f),
 		     test_bit(SDF_SKIP_DLM_UNLOCK, &f),
 		     test_bit(SDF_FORCE_AIL_FLUSH, &f),
-		     test_bit(SDF_FS_FROZEN, &f),
+		     test_bit(SDF_FREEZE_INITIATOR, &f),
 		     test_bit(SDF_WITHDRAWING, &f),
 		     test_bit(SDF_WITHDRAW_IN_PROG, &f),
 		     test_bit(SDF_REMOTE_WITHDRAW, &f),
diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index 817c4f42ae7b..1743caee5505 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -187,7 +187,7 @@ static void signal_our_withdraw(struct gfs2_sbd *sdp)
 	}
 	sdp->sd_jinode_gh.gh_flags |= GL_NOCACHE;
 	gfs2_glock_dq(&sdp->sd_jinode_gh);
-	if (test_bit(SDF_FS_FROZEN, &sdp->sd_flags)) {
+	if (test_bit(SDF_FREEZE_INITIATOR, &sdp->sd_flags)) {
 		/* Make sure gfs2_thaw_super works if partially-frozen */
 		flush_work(&sdp->sd_freeze_work);
 		atomic_set(&sdp->sd_freeze_state, SFS_FROZEN);
-- 
2.40.0

