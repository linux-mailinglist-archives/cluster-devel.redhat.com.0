Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CC57A72CB94
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Jun 2023 18:33:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686587636;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9LZU+zY6HXMiw2X6GDGT9q1DLwUIL1K542fvIQSPNQw=;
	b=jIL/3+MEEfuUv3FVsFEvL6Bby6dC/G5LSJx47u/IsHDFN6aOc1zZsr+FFh//2RMV377vXr
	mbBKPo10GwCm8eC8ky3z3VwYuaOHizjgZtGokjGW+eQnMcVv+mIHlTq4PTRHejx2wbROzh
	LQO5u7kc+mwZcCD7D2U5ICckvXpZ6ls=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-Dx7ifKZ8N5Ky38EHyk0cTw-1; Mon, 12 Jun 2023 12:33:52 -0400
X-MC-Unique: Dx7ifKZ8N5Ky38EHyk0cTw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48740282CCA4;
	Mon, 12 Jun 2023 16:33:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 036E92026834;
	Mon, 12 Jun 2023 16:33:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CE4CE19465BD;
	Mon, 12 Jun 2023 16:33:50 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 58EA3194658C for <cluster-devel@listman.corp.redhat.com>;
 Mon, 12 Jun 2023 16:33:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 39FAF20234B3; Mon, 12 Jun 2023 16:33:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (unknown [10.45.224.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD85720234B8;
 Mon, 12 Jun 2023 16:33:49 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 12 Jun 2023 18:33:41 +0200
Message-Id: <20230612163347.1293077-3-agruenba@redhat.com>
In-Reply-To: <20230612163347.1293077-1-agruenba@redhat.com>
References: <20230612163347.1293077-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Cluster-devel] [PATCH 2/8] gfs2: Rename the {freeze,
 thaw}_super callbacks
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Rename gfs2_freeze to gfs2_freeze_super and gfs2_unfreeze to
gfs2_thaw_super to match the names of the corresponding super
operations.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/super.c | 12 ++++++------
 fs/gfs2/util.c  |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 03f45711100d..dbda7e253a9c 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -697,12 +697,12 @@ void gfs2_freeze_func(struct work_struct *work)
 }
 
 /**
- * gfs2_freeze - prevent further writes to the filesystem
+ * gfs2_freeze_super - prevent further writes to the filesystem
  * @sb: the VFS structure for the filesystem
  *
  */
 
-static int gfs2_freeze(struct super_block *sb)
+static int gfs2_freeze_super(struct super_block *sb)
 {
 	struct gfs2_sbd *sdp = sb->s_fs_info;
 	int error;
@@ -742,12 +742,12 @@ static int gfs2_freeze(struct super_block *sb)
 }
 
 /**
- * gfs2_unfreeze - reallow writes to the filesystem
+ * gfs2_thaw_super - reallow writes to the filesystem
  * @sb: the VFS structure for the filesystem
  *
  */
 
-static int gfs2_unfreeze(struct super_block *sb)
+static int gfs2_thaw_super(struct super_block *sb)
 {
 	struct gfs2_sbd *sdp = sb->s_fs_info;
 
@@ -1526,8 +1526,8 @@ const struct super_operations gfs2_super_ops = {
 	.evict_inode		= gfs2_evict_inode,
 	.put_super		= gfs2_put_super,
 	.sync_fs		= gfs2_sync_fs,
-	.freeze_super		= gfs2_freeze,
-	.thaw_super		= gfs2_unfreeze,
+	.freeze_super		= gfs2_freeze_super,
+	.thaw_super		= gfs2_thaw_super,
 	.statfs			= gfs2_statfs,
 	.drop_inode		= gfs2_drop_inode,
 	.show_options		= gfs2_show_options,
diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index c84242ef4903..16ac3b3e7b88 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -188,7 +188,7 @@ static void signal_our_withdraw(struct gfs2_sbd *sdp)
 	sdp->sd_jinode_gh.gh_flags |= GL_NOCACHE;
 	gfs2_glock_dq(&sdp->sd_jinode_gh);
 	if (test_bit(SDF_FS_FROZEN, &sdp->sd_flags)) {
-		/* Make sure gfs2_unfreeze works if partially-frozen */
+		/* Make sure gfs2_thaw_super works if partially-frozen */
 		flush_work(&sdp->sd_freeze_work);
 		atomic_set(&sdp->sd_freeze_state, SFS_FROZEN);
 		thaw_super(sdp->sd_vfs);
-- 
2.40.0

