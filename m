Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DBE6814DA
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Jan 2023 16:21:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675092116;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iDCLjlmiiQ9y5tpNlC9Hxq3S1l/vYeBp5wQhbHO6OUk=;
	b=RDYZWAIhauaYK2gbOE+DNmDEt/D66X4eFWgwT0rDAFXOJ96N2Eal0XAkTuF3PUQg1PBfVJ
	Gx2xyP1MKnzj5wIhjijc5fr1qoEG1H6c1QGulL2w6SqkzN+9EZ2CBnoQLgwOi1O1lTMlAR
	sfJgYAxAGBLhT75mrzB24XSL270Rxzw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-JzruE8DQOWCEGt9_7mPxjw-1; Mon, 30 Jan 2023 10:21:53 -0500
X-MC-Unique: JzruE8DQOWCEGt9_7mPxjw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A4EE382C971;
	Mon, 30 Jan 2023 15:21:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1CF842166B29;
	Mon, 30 Jan 2023 15:21:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DC8791946594;
	Mon, 30 Jan 2023 15:21:51 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id ECC551946587 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 30 Jan 2023 15:21:49 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D057E40C2064; Mon, 30 Jan 2023 15:21:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from b.redhat.com (unknown [10.33.37.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E2CA40C2007
 for <cluster-devel@redhat.com>; Mon, 30 Jan 2023 15:21:49 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 30 Jan 2023 15:21:43 +0000
Message-Id: <20230130152146.633484-4-anprice@redhat.com>
In-Reply-To: <20230130152146.633484-1-anprice@redhat.com>
References: <20230130152146.633484-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Cluster-devel] [PATCH 3/6] libgfs2: Reorganise lgfs2_createi()
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

Move the lookup for an existing inode to lgfs2_createi itself and then
create the inode in __createi (renamed to do_createi) unconditionally.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/libgfs2/fs_ops.c | 80 ++++++++++++++++++++++++-------------------
 1 file changed, 45 insertions(+), 35 deletions(-)

diff --git a/gfs2/libgfs2/fs_ops.c b/gfs2/libgfs2/fs_ops.c
index 5003c1ae..0df78e5a 100644
--- a/gfs2/libgfs2/fs_ops.c
+++ b/gfs2/libgfs2/fs_ops.c
@@ -1497,9 +1497,10 @@ int lgfs2_write_filemeta(struct lgfs2_inode *ip)
 	return 0;
 }
 
-static struct lgfs2_inode *__createi(struct lgfs2_inode *dip, const char *filename,
-                                     unsigned int mode, uint32_t flags)
+static struct lgfs2_inode *do_createi(struct lgfs2_inode *dip, const char *filename,
+                                      unsigned int mode, uint32_t flags)
 {
+	struct lgfs2_inum parent = dip->i_num;
 	struct lgfs2_sbd *sdp = dip->i_sbd;
 	uint64_t bn;
 	struct lgfs2_inum inum;
@@ -1508,50 +1509,59 @@ static struct lgfs2_inode *__createi(struct lgfs2_inode *dip, const char *filena
 	int err = 0;
 	int is_dir;
 
-	ip = lgfs2_lookupi(dip, filename, strlen(filename));
-	if (!ip) {
-		struct lgfs2_inum parent = dip->i_num;
-
-		err = lgfs2_dinode_alloc(sdp, 1, &bn);
-		if (err != 0)
-			return NULL;
-
-		if (sdp->gfs1)
-			inum.in_formal_ino = bn;
-		else
-			inum.in_formal_ino = sdp->md.next_inum++;
-		inum.in_addr = bn;
-
-		err = lgfs2_dir_add(dip, filename, strlen(filename), &inum, IF2DT(mode));
-		if (err)
-			return NULL;
+	err = lgfs2_dinode_alloc(sdp, 1, &bn);
+	if (err != 0)
+		return NULL;
 
-		if (sdp->gfs1)
-			is_dir = (IF2DT(mode) == GFS_FILE_DIR);
-		else
-			is_dir = S_ISDIR(mode);
-		if (is_dir) {
-			lgfs2_bmodified(dip->i_bh);
-			dip->i_nlink++;
-		}
+	if (sdp->gfs1)
+		inum.in_formal_ino = bn;
+	else
+		inum.in_formal_ino = sdp->md.next_inum++;
+	inum.in_addr = bn;
 
-		err = __init_dinode(sdp, &bh, &inum, mode, flags, &parent, sdp->gfs1);
-		if (err != 0)
-			return NULL;
+	err = lgfs2_dir_add(dip, filename, strlen(filename), &inum, IF2DT(mode));
+	if (err)
+		return NULL;
 
-		ip = lgfs2_inode_get(sdp, bh);
-		if (ip == NULL)
-			return NULL;
-		lgfs2_bmodified(bh);
+	if (sdp->gfs1)
+		is_dir = (IF2DT(mode) == GFS_FILE_DIR);
+	else
+		is_dir = S_ISDIR(mode);
+	if (is_dir) {
+		lgfs2_bmodified(dip->i_bh);
+		dip->i_nlink++;
 	}
+	err = __init_dinode(sdp, &bh, &inum, mode, flags, &parent, sdp->gfs1);
+	if (err != 0)
+		return NULL;
+
+	ip = lgfs2_inode_get(sdp, bh);
+	if (ip == NULL)
+		return NULL;
+	lgfs2_bmodified(bh);
 	ip->bh_owned = 1;
 	return ip;
 }
 
+/**
+ * Create an inode and link it into a directory. If it already exists, return
+ * the existing inode. To create gfs1 inodes, dip->i_sbd->gfs1 must be set.
+ * @dip: The inode of the parent directory.
+ * @filename: The new inode's filename.
+ * @mode: The mode of the new inode.
+ * @flags: The flags of the new inode.
+ * Returns the new or existing inode on success or NULL on failure with errno set.
+ */
 struct lgfs2_inode *lgfs2_createi(struct lgfs2_inode *dip, const char *filename,
                                  unsigned int mode, uint32_t flags)
 {
-	return __createi(dip, filename, mode, flags);
+	struct lgfs2_inode *ip = lgfs2_lookupi(dip, filename, strlen(filename));
+
+	if (ip != NULL) {
+		ip->bh_owned = 1;
+		return ip;
+	}
+	return do_createi(dip, filename, mode, flags);
 }
 
 /**
-- 
2.39.0

