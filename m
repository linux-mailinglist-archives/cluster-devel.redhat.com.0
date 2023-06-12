Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4579072CB96
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Jun 2023 18:33:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686587638;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2oeoYEQsSVKCjZ6U9mFmnXqfMd1xEKGK+Tutu/BZLE4=;
	b=OwKNL6TgHeQ1oFjvBCcGcA3xxi0KHWEz7igPVocUOM0uTAF0ER6xtBS8G+LCU6U32XKf3P
	MiruIrKHBpgerzIBz9PQtHtydjP9N4dXPZDRRw6uNlmuU80C04zbd5tacga5KBKB8GJr7U
	dLPLDmTXSTKvF1dM5o0QWC4bNsAyXsc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-fRKzkErAPAqKdfS23FhkpA-1; Mon, 12 Jun 2023 12:33:57 -0400
X-MC-Unique: fRKzkErAPAqKdfS23FhkpA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0CC90282CCA2;
	Mon, 12 Jun 2023 16:33:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0252940C20F4;
	Mon, 12 Jun 2023 16:33:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D6E4119465BB;
	Mon, 12 Jun 2023 16:33:55 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2EFE5194658C for <cluster-devel@listman.corp.redhat.com>;
 Mon, 12 Jun 2023 16:33:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 11DA6202F352; Mon, 12 Jun 2023 16:33:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (unknown [10.45.224.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8344A20234B3;
 Mon, 12 Jun 2023 16:33:54 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 12 Jun 2023 18:33:47 +0200
Message-Id: <20230612163347.1293077-9-agruenba@redhat.com>
In-Reply-To: <20230612163347.1293077-1-agruenba@redhat.com>
References: <20230612163347.1293077-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Cluster-devel] [PATCH 8/8] gfs2: gfs2_freeze_lock_shared cleanup
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

All the remaining users of gfs2_freeze_lock_shared() set freeze_gh to
&sdp->sd_freeze_gh and flags to 0, so remove those two parameters.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/ops_fstype.c | 2 +-
 fs/gfs2/super.c      | 4 ++--
 fs/gfs2/util.c       | 9 +++------
 fs/gfs2/util.h       | 4 +---
 4 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 24acd17e530c..9375409fd0c5 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -1267,7 +1267,7 @@ static int gfs2_fill_super(struct super_block *sb, struct fs_context *fc)
 		}
 	}
 
-	error = gfs2_freeze_lock_shared(sdp, &sdp->sd_freeze_gh, 0);
+	error = gfs2_freeze_lock_shared(sdp);
 	if (error)
 		goto fail_per_node;
 
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 828297e9cbca..f2fa0fb80ee1 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -381,7 +381,7 @@ static int gfs2_lock_fs_check_clean(struct gfs2_sbd *sdp)
 	gfs2_freeze_unlock(&sdp->sd_freeze_gh);
 
 relock_shared:
-	error2 = gfs2_freeze_lock_shared(sdp, &sdp->sd_freeze_gh, 0);
+	error2 = gfs2_freeze_lock_shared(sdp);
 	gfs2_assert_withdraw(sdp, !error2);
 
 out:
@@ -709,7 +709,7 @@ static int gfs2_do_thaw(struct gfs2_sbd *sdp)
 	struct super_block *sb = sdp->sd_vfs;
 	int error;
 
-	error = gfs2_freeze_lock_shared(sdp, &sdp->sd_freeze_gh, 0);
+	error = gfs2_freeze_lock_shared(sdp);
 	if (error)
 		goto fail;
 	error = thaw_super(sb);
diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index 00494dffb47c..b9db034c7f58 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -95,17 +95,14 @@ int check_journal_clean(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd,
 /**
  * gfs2_freeze_lock_shared - hold the freeze glock
  * @sdp: the superblock
- * @freeze_gh: pointer to the requested holder
- * @caller_flags: any additional flags needed by the caller
  */
-int gfs2_freeze_lock_shared(struct gfs2_sbd *sdp, struct gfs2_holder *freeze_gh,
-			    int caller_flags)
+int gfs2_freeze_lock_shared(struct gfs2_sbd *sdp)
 {
-	int flags = LM_FLAG_NOEXP | GL_EXACT | caller_flags;
+	int flags = LM_FLAG_NOEXP | GL_EXACT;
 	int error;
 
 	error = gfs2_glock_nq_init(sdp->sd_freeze_gl, LM_ST_SHARED, flags,
-				   freeze_gh);
+				   &sdp->sd_freeze_gh);
 	if (error && error != GLR_TRYFAILED)
 		fs_err(sdp, "can't lock the freeze glock: %d\n", error);
 	return error;
diff --git a/fs/gfs2/util.h b/fs/gfs2/util.h
index 3291e33e81e9..cdb839529175 100644
--- a/fs/gfs2/util.h
+++ b/fs/gfs2/util.h
@@ -149,9 +149,7 @@ int gfs2_io_error_i(struct gfs2_sbd *sdp, const char *function,
 
 extern int check_journal_clean(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd,
 			       bool verbose);
-extern int gfs2_freeze_lock_shared(struct gfs2_sbd *sdp,
-				   struct gfs2_holder *freeze_gh,
-				   int caller_flags);
+extern int gfs2_freeze_lock_shared(struct gfs2_sbd *sdp);
 extern void gfs2_freeze_unlock(struct gfs2_holder *freeze_gh);
 
 #define gfs2_io_error(sdp) \
-- 
2.40.0

