Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2330972CB92
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Jun 2023 18:33:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686587636;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sJXSQMnsNhahutejrGc/Wqt4L2xHT2cVsbWZXmPxMTQ=;
	b=Y8keWkQ7KCxcgUdkP9F1u8ijDf00QQETZ/Ngdvv5eRLSdu8PyCAZLTSPzpc34Kqh/hohoV
	S7BEPULi3g0b3SpWNhynNM1ATGZrM6cOE7TQAGGZg9wmLa6mmvprjkdI+0FF43Y4nsDQDO
	ONVvUb0b9KGgMa1orQA8/Eh95EfZGGU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-z2NPqE0TNAu9W9YlHXDxlg-1; Mon, 12 Jun 2023 12:33:53 -0400
X-MC-Unique: z2NPqE0TNAu9W9YlHXDxlg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AEFD93C0F428;
	Mon, 12 Jun 2023 16:33:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A4AF9422DE;
	Mon, 12 Jun 2023 16:33:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 749A319465B9;
	Mon, 12 Jun 2023 16:33:51 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1816C194658C for <cluster-devel@listman.corp.redhat.com>;
 Mon, 12 Jun 2023 16:33:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 07D04200A35F; Mon, 12 Jun 2023 16:33:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (unknown [10.45.224.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76F8A2026D20;
 Mon, 12 Jun 2023 16:33:50 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 12 Jun 2023 18:33:42 +0200
Message-Id: <20230612163347.1293077-4-agruenba@redhat.com>
In-Reply-To: <20230612163347.1293077-1-agruenba@redhat.com>
References: <20230612163347.1293077-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Cluster-devel] [PATCH 3/8] gfs2: Rename gfs2_freeze_lock{ =>
 _shared }
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

Rename gfs2_freeze_lock to gfs2_freeze_lock_shared to make it a bit more
obvious that this function establishes the "thawed" state of the freeze
glock.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/ops_fstype.c |  4 ++--
 fs/gfs2/recovery.c   |  2 +-
 fs/gfs2/super.c      |  2 +-
 fs/gfs2/util.c       | 10 +++++-----
 fs/gfs2/util.h       |  5 +++--
 5 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 3b93e4a22dfd..4fb25496e92f 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -1269,7 +1269,7 @@ static int gfs2_fill_super(struct super_block *sb, struct fs_context *fc)
 		}
 	}
 
-	error = gfs2_freeze_lock(sdp, &freeze_gh, 0);
+	error = gfs2_freeze_lock_shared(sdp, &freeze_gh, 0);
 	if (error)
 		goto fail_per_node;
 
@@ -1592,7 +1592,7 @@ static int gfs2_reconfigure(struct fs_context *fc)
 	if ((sb->s_flags ^ fc->sb_flags) & SB_RDONLY) {
 		struct gfs2_holder freeze_gh;
 
-		error = gfs2_freeze_lock(sdp, &freeze_gh, 0);
+		error = gfs2_freeze_lock_shared(sdp, &freeze_gh, 0);
 		if (error)
 			return -EINVAL;
 
diff --git a/fs/gfs2/recovery.c b/fs/gfs2/recovery.c
index d8e522f389aa..61ef07da40b2 100644
--- a/fs/gfs2/recovery.c
+++ b/fs/gfs2/recovery.c
@@ -470,7 +470,7 @@ void gfs2_recover_func(struct work_struct *work)
 
 		/* Acquire a shared hold on the freeze glock */
 
-		error = gfs2_freeze_lock(sdp, &thaw_gh, LM_FLAG_PRIORITY);
+		error = gfs2_freeze_lock_shared(sdp, &thaw_gh, LM_FLAG_PRIORITY);
 		if (error)
 			goto fail_gunlock_ji;
 
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index dbda7e253a9c..0fecd1887d0c 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -677,7 +677,7 @@ void gfs2_freeze_func(struct work_struct *work)
 	struct super_block *sb = sdp->sd_vfs;
 
 	atomic_inc(&sb->s_active);
-	error = gfs2_freeze_lock(sdp, &freeze_gh, 0);
+	error = gfs2_freeze_lock_shared(sdp, &freeze_gh, 0);
 	if (error) {
 		gfs2_assert_withdraw(sdp, 0);
 	} else {
diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index 16ac3b3e7b88..817c4f42ae7b 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -93,13 +93,13 @@ int check_journal_clean(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd,
 }
 
 /**
- * gfs2_freeze_lock - hold the freeze glock
+ * gfs2_freeze_lock_shared - hold the freeze glock
  * @sdp: the superblock
  * @freeze_gh: pointer to the requested holder
  * @caller_flags: any additional flags needed by the caller
  */
-int gfs2_freeze_lock(struct gfs2_sbd *sdp, struct gfs2_holder *freeze_gh,
-		     int caller_flags)
+int gfs2_freeze_lock_shared(struct gfs2_sbd *sdp, struct gfs2_holder *freeze_gh,
+			    int caller_flags)
 {
 	int flags = LM_FLAG_NOEXP | GL_EXACT | caller_flags;
 	int error;
@@ -157,8 +157,8 @@ static void signal_our_withdraw(struct gfs2_sbd *sdp)
 		gfs2_holder_mark_uninitialized(&freeze_gh);
 		if (sdp->sd_freeze_gl &&
 		    !gfs2_glock_is_locked_by_me(sdp->sd_freeze_gl)) {
-			ret = gfs2_freeze_lock(sdp, &freeze_gh,
-				       log_write_allowed ? 0 : LM_FLAG_TRY);
+			ret = gfs2_freeze_lock_shared(sdp, &freeze_gh,
+					log_write_allowed ? 0 : LM_FLAG_TRY);
 			if (ret == GLR_TRYFAILED)
 				ret = 0;
 		}
diff --git a/fs/gfs2/util.h b/fs/gfs2/util.h
index 78ec190f4155..3291e33e81e9 100644
--- a/fs/gfs2/util.h
+++ b/fs/gfs2/util.h
@@ -149,8 +149,9 @@ int gfs2_io_error_i(struct gfs2_sbd *sdp, const char *function,
 
 extern int check_journal_clean(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd,
 			       bool verbose);
-extern int gfs2_freeze_lock(struct gfs2_sbd *sdp,
-			    struct gfs2_holder *freeze_gh, int caller_flags);
+extern int gfs2_freeze_lock_shared(struct gfs2_sbd *sdp,
+				   struct gfs2_holder *freeze_gh,
+				   int caller_flags);
 extern void gfs2_freeze_unlock(struct gfs2_holder *freeze_gh);
 
 #define gfs2_io_error(sdp) \
-- 
2.40.0

