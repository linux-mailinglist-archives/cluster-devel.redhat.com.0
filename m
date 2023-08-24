Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 646E4787A18
	for <lists+cluster-devel@lfdr.de>; Thu, 24 Aug 2023 23:19:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692911997;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JVN9jrsQBe67BmUWUD/YnBtEa6azTsC6LN1zv6uDY80=;
	b=byoOJa6HZOteG7OXMKz9sT4Vt2LJX5TvQUEsZ+UMNijwMb1D5TLX2Zi7IXazVYP10aChkL
	MMdK+NY01zkCH5CQQ026gSft3QMyIpo6TeIQyz7g5UufVzomZ2KonSKQgxOFUL4Bb98mQ+
	RvxOLtFaNPUopge3GAZirE3pMB/2KKI=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-33-4T1VmUxbO-SaIgwsoxEqOQ-1; Thu, 24 Aug 2023 17:19:55 -0400
X-MC-Unique: 4T1VmUxbO-SaIgwsoxEqOQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5BE12823808;
	Thu, 24 Aug 2023 21:19:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BA91740C2073;
	Thu, 24 Aug 2023 21:19:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6F46B19465A8;
	Thu, 24 Aug 2023 21:19:53 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4B04D1946589 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 24 Aug 2023 21:19:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1445DC1602E; Thu, 24 Aug 2023 21:19:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (unknown [10.45.224.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B1C8C1602B;
 Thu, 24 Aug 2023 21:19:51 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Thu, 24 Aug 2023 23:19:42 +0200
Message-Id: <20230824211948.3242607-4-agruenba@redhat.com>
In-Reply-To: <20230824211948.3242607-1-agruenba@redhat.com>
References: <20230824211948.3242607-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Cluster-devel] [PATCH 3/9] gfs2: Rename SDF_DEACTIVATING to
 SDF_KILL
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Rename the SDF_DEACTIVATING flag to SDF_KILL to make it more obvious
that this relates to the kill_sb filesystem operation.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c      | 4 ++--
 fs/gfs2/glops.c      | 2 +-
 fs/gfs2/incore.h     | 2 +-
 fs/gfs2/ops_fstype.c | 4 ++--
 fs/gfs2/super.c      | 2 +-
 fs/gfs2/sys.c        | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index e242745cf40f..9cbf8d98489a 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -1022,7 +1022,7 @@ static void delete_work_func(struct work_struct *work)
 		 * step entirely.
 		 */
 		if (gfs2_try_evict(gl)) {
-			if (test_bit(SDF_DEACTIVATING, &sdp->sd_flags))
+			if (test_bit(SDF_KILL, &sdp->sd_flags))
 				goto out;
 			if (gfs2_queue_verify_evict(gl))
 				return;
@@ -1035,7 +1035,7 @@ static void delete_work_func(struct work_struct *work)
 					    GFS2_BLKST_UNLINKED);
 		if (IS_ERR(inode)) {
 			if (PTR_ERR(inode) == -EAGAIN &&
-			    !test_bit(SDF_DEACTIVATING, &sdp->sd_flags) &&
+			    !test_bit(SDF_KILL, &sdp->sd_flags) &&
 			    gfs2_queue_verify_evict(gl))
 				return;
 		} else {
diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 54319328b16b..7d6cca467fa1 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -637,7 +637,7 @@ static void iopen_go_callback(struct gfs2_glock *gl, bool remote)
 	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
 
 	if (!remote || sb_rdonly(sdp->sd_vfs) ||
-	    test_bit(SDF_DEACTIVATING, &sdp->sd_flags))
+	    test_bit(SDF_KILL, &sdp->sd_flags))
 		return;
 
 	if (gl->gl_demote_state == LM_ST_UNLOCKED &&
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 7abb43bb8df0..ab857431dfa4 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -606,7 +606,7 @@ enum {
 	SDF_REMOTE_WITHDRAW	= 13, /* Performing remote recovery */
 	SDF_WITHDRAW_RECOVERY	= 14, /* Wait for journal recovery when we are
 					 withdrawing */
-	SDF_DEACTIVATING	= 15,
+	SDF_KILL		= 15,
 	SDF_EVICTING		= 16,
 	SDF_FROZEN		= 17,
 };
diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 19d19491c0d1..6ea295cee463 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -1786,9 +1786,9 @@ static void gfs2_kill_sb(struct super_block *sb)
 	/*
 	 * Flush and then drain the delete workqueue here (via
 	 * destroy_workqueue()) to ensure that any delete work that
-	 * may be running will also see the SDF_DEACTIVATING flag.
+	 * may be running will also see the SDF_KILL flag.
 	 */
-	set_bit(SDF_DEACTIVATING, &sdp->sd_flags);
+	set_bit(SDF_KILL, &sdp->sd_flags);
 	gfs2_flush_delete_work(sdp);
 	destroy_workqueue(sdp->sd_delete_wq);
 
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 9f4d5d6549ee..e0dceef3c9cc 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -546,7 +546,7 @@ void gfs2_make_fs_ro(struct gfs2_sbd *sdp)
 {
 	int log_write_allowed = test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
 
-	if (!test_bit(SDF_DEACTIVATING, &sdp->sd_flags))
+	if (!test_bit(SDF_KILL, &sdp->sd_flags))
 		gfs2_flush_delete_work(sdp);
 
 	if (!log_write_allowed && current == sdp->sd_quotad_process)
diff --git a/fs/gfs2/sys.c b/fs/gfs2/sys.c
index 2dfbe2f188dd..a85fe7b92911 100644
--- a/fs/gfs2/sys.c
+++ b/fs/gfs2/sys.c
@@ -118,7 +118,7 @@ static ssize_t status_show(struct gfs2_sbd *sdp, char *buf)
 		     test_bit(SDF_WITHDRAW_IN_PROG, &f),
 		     test_bit(SDF_REMOTE_WITHDRAW, &f),
 		     test_bit(SDF_WITHDRAW_RECOVERY, &f),
-		     test_bit(SDF_DEACTIVATING, &f),
+		     test_bit(SDF_KILL, &f),
 		     sdp->sd_log_error,
 		     rwsem_is_locked(&sdp->sd_log_flush_lock),
 		     sdp->sd_log_num_revoke,
-- 
2.40.1

