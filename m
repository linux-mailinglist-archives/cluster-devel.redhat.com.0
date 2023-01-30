Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D986814D8
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Jan 2023 16:21:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675092117;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=t2HUf4Bwnl0OhaW/yvjgXhCAvbzKZyKjQnmbviFlxjI=;
	b=A/3nGd8I9Pzser7fTA5RGrFnbq2flmFeqtj9stAahx5xOEPQSJqP4MsOCL87n0s5YuyHlv
	deE9vdXkudvBIqF4VmLVW256DROLlGLkQfl29H5xeFYmcPZ3vTP0RoI/BK59yndA33btIw
	xCqkxa7mhmafXvCTDVRVqJKYsCGxtmE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-FuYCcmvhPN-EF0oezK-7gA-1; Mon, 30 Jan 2023 10:21:53 -0500
X-MC-Unique: FuYCcmvhPN-EF0oezK-7gA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D55F8030D2;
	Mon, 30 Jan 2023 15:21:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CED31140EBF6;
	Mon, 30 Jan 2023 15:21:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9B0FD19465B1;
	Mon, 30 Jan 2023 15:21:50 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 71CA51946587 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 30 Jan 2023 15:21:49 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4A28E40C2004; Mon, 30 Jan 2023 15:21:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from b.redhat.com (unknown [10.33.37.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB94840C2064
 for <cluster-devel@redhat.com>; Mon, 30 Jan 2023 15:21:48 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 30 Jan 2023 15:21:42 +0000
Message-Id: <20230130152146.633484-3-anprice@redhat.com>
In-Reply-To: <20230130152146.633484-1-anprice@redhat.com>
References: <20230130152146.633484-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Cluster-devel] [PATCH 2/6] libgfs2: Remove lgfs2_gfs_createi()
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The one caller sets sdp->gfs1 and modifies the mode itself so we can use
sdp->gfs1 in __createi() and update the caller to use lgfs2_createi()
instead.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/fsck/lost_n_found.c |  6 +-----
 gfs2/libgfs2/fs_ops.c    | 19 ++++++-------------
 gfs2/libgfs2/libgfs2.h   |  3 ---
 3 files changed, 7 insertions(+), 21 deletions(-)

diff --git a/gfs2/fsck/lost_n_found.c b/gfs2/fsck/lost_n_found.c
index ca5ab89e..97fc16b0 100644
--- a/gfs2/fsck/lost_n_found.c
+++ b/gfs2/fsck/lost_n_found.c
@@ -109,11 +109,7 @@ void make_sure_lf_exists(struct fsck_cx *cx, struct lgfs2_inode *ip)
 	if (sdp->gfs1)
 		sdp->md.next_inum = find_free_blk(sdp);
 	mode = (sdp->gfs1 ? DT2IF(GFS_FILE_DIR) : S_IFDIR) | 0700;
-	if (sdp->gfs1)
-		lf_dip = lgfs2_gfs_createi(sdp->md.rooti, "lost+found", mode, 0);
-	else
-		lf_dip = lgfs2_createi(sdp->md.rooti, "lost+found",
-				 S_IFDIR | 0700, 0);
+	lf_dip = lgfs2_createi(sdp->md.rooti, "lost+found", mode, 0);
 	if (lf_dip == NULL) {
 		log_crit(_("Error creating lost+found: %s\n"),
 			 strerror(errno));
diff --git a/gfs2/libgfs2/fs_ops.c b/gfs2/libgfs2/fs_ops.c
index e72871ed..5003c1ae 100644
--- a/gfs2/libgfs2/fs_ops.c
+++ b/gfs2/libgfs2/fs_ops.c
@@ -1497,9 +1497,8 @@ int lgfs2_write_filemeta(struct lgfs2_inode *ip)
 	return 0;
 }
 
-static struct lgfs2_inode *__createi(struct lgfs2_inode *dip,
-				    const char *filename, unsigned int mode,
-				    uint32_t flags, int if_gfs1)
+static struct lgfs2_inode *__createi(struct lgfs2_inode *dip, const char *filename,
+                                     unsigned int mode, uint32_t flags)
 {
 	struct lgfs2_sbd *sdp = dip->i_sbd;
 	uint64_t bn;
@@ -1517,7 +1516,7 @@ static struct lgfs2_inode *__createi(struct lgfs2_inode *dip,
 		if (err != 0)
 			return NULL;
 
-		if (if_gfs1)
+		if (sdp->gfs1)
 			inum.in_formal_ino = bn;
 		else
 			inum.in_formal_ino = sdp->md.next_inum++;
@@ -1527,7 +1526,7 @@ static struct lgfs2_inode *__createi(struct lgfs2_inode *dip,
 		if (err)
 			return NULL;
 
-		if (if_gfs1)
+		if (sdp->gfs1)
 			is_dir = (IF2DT(mode) == GFS_FILE_DIR);
 		else
 			is_dir = S_ISDIR(mode);
@@ -1536,7 +1535,7 @@ static struct lgfs2_inode *__createi(struct lgfs2_inode *dip,
 			dip->i_nlink++;
 		}
 
-		err = __init_dinode(sdp, &bh, &inum, mode, flags, &parent, if_gfs1);
+		err = __init_dinode(sdp, &bh, &inum, mode, flags, &parent, sdp->gfs1);
 		if (err != 0)
 			return NULL;
 
@@ -1552,13 +1551,7 @@ static struct lgfs2_inode *__createi(struct lgfs2_inode *dip,
 struct lgfs2_inode *lgfs2_createi(struct lgfs2_inode *dip, const char *filename,
                                  unsigned int mode, uint32_t flags)
 {
-	return __createi(dip, filename, mode, flags, 0);
-}
-
-struct lgfs2_inode *lgfs2_gfs_createi(struct lgfs2_inode *dip, const char *filename,
-                                     unsigned int mode, uint32_t flags)
-{
-	return __createi(dip, filename, mode, flags, 1);
+	return __createi(dip, filename, mode, flags);
 }
 
 /**
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index bcbc5e47..69a7552f 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -515,9 +515,6 @@ extern int lgfs2_init_dinode(struct lgfs2_sbd *sdp, struct lgfs2_buffer_head **b
                        unsigned int mode, uint32_t flags, struct lgfs2_inum *parent);
 extern struct lgfs2_inode *lgfs2_createi(struct lgfs2_inode *dip, const char *filename,
 				  unsigned int mode, uint32_t flags);
-extern struct lgfs2_inode *lgfs2_gfs_createi(struct lgfs2_inode *dip,
-				      const char *filename, unsigned int mode,
-				      uint32_t flags);
 extern void lgfs2_dirent2_del(struct lgfs2_inode *dip, struct lgfs2_buffer_head *bh,
 			struct gfs2_dirent *prev, struct gfs2_dirent *cur);
 extern int lgfs2_dir_search(struct lgfs2_inode *dip, const char *filename, int len,
-- 
2.39.0

