Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0D948CBDE
	for <lists+cluster-devel@lfdr.de>; Wed, 12 Jan 2022 20:27:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642015634;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xBWeUfWK3dNpbFfribbA+BUJqi7Q5oidpQk2kFzZLSE=;
	b=GmSJkRk+ypMIoRkJLEuVpsbiIdeNzRikwHvdxrSN9hMruek1dtm3aEj5U5qOq2xPbupFS6
	18sXwAceB4hY1hFbEaQdsAarbOL51TUoVi05UfuFzQ2szACAqEZsfil7jPYTAkKmBcGbqK
	iZ3y4jxrUAc5S8Xus9RKIa2lOeH9wf0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-465-1PmFmS4kOJSVB2aqPUjMtA-1; Wed, 12 Jan 2022 14:27:12 -0500
X-MC-Unique: 1PmFmS4kOJSVB2aqPUjMtA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 475D9101AFA8;
	Wed, 12 Jan 2022 19:27:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3235D60843;
	Wed, 12 Jan 2022 19:27:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1DABB4A7C8;
	Wed, 12 Jan 2022 19:27:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20CJR8vN009320 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 12 Jan 2022 14:27:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B55BF45D6D; Wed, 12 Jan 2022 19:27:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.37.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC3B345D67
	for <cluster-devel@redhat.com>; Wed, 12 Jan 2022 19:27:07 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 12 Jan 2022 19:26:39 +0000
Message-Id: <20220112192650.1426415-8-anprice@redhat.com>
In-Reply-To: <20220112192650.1426415-1-anprice@redhat.com>
References: <20220112192650.1426415-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 07/18] libgfs2: Return the inode from
	build_quota_change()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This allows the caller to call inode_put() when it's convenient and also
allows the debug message printing to be moved out of the function.
fsck.gfs2 passes the function by reference so it needs a shim until the
other builder functions can be given the same signature.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/convert/gfs2_convert.c |  8 ++++----
 gfs2/fsck/pass1.c           |  8 ++++----
 gfs2/fsck/pass2.c           | 12 +++++++++++-
 gfs2/libgfs2/libgfs2.h      |  2 +-
 gfs2/libgfs2/structures.c   | 18 +++++-------------
 gfs2/mkfs/main_mkfs.c       | 12 ++++++++----
 6 files changed, 33 insertions(+), 27 deletions(-)

diff --git a/gfs2/convert/gfs2_convert.c b/gfs2/convert/gfs2_convert.c
index 1cb2d6fa..0953d2a7 100644
--- a/gfs2/convert/gfs2_convert.c
+++ b/gfs2/convert/gfs2_convert.c
@@ -2103,7 +2103,6 @@ static int build_per_node(struct gfs2_sbd *sdp)
 {
 	struct gfs2_inode *per_node;
 	unsigned int j;
-	int err;
 
 	per_node = createi(sdp->master_dir, "per_node", S_IFDIR | 0700,
 			   GFS2_DIF_SYSTEM);
@@ -2130,12 +2129,13 @@ static int build_per_node(struct gfs2_sbd *sdp)
 		}
 		inode_put(&ip);
 
-		err = build_quota_change(per_node, j);
-		if (err) {
+		ip = build_quota_change(per_node, j);
+		if (ip == NULL) {
 			log_crit(_("Error building '%s': %s\n"), "quota_change",
 			         strerror(errno));
-			return err;
+			return 1;
 		}
+		inode_put(&ip);
 	}
 	inode_put(&per_node);
 	return 0;
diff --git a/gfs2/fsck/pass1.c b/gfs2/fsck/pass1.c
index 3df64de7..a016f2a4 100644
--- a/gfs2/fsck/pass1.c
+++ b/gfs2/fsck/pass1.c
@@ -1581,7 +1581,6 @@ int build_per_node(struct gfs2_sbd *sdp)
 {
 	struct gfs2_inode *per_node;
 	unsigned int j;
-	int err;
 
 	per_node = createi(sdp->master_dir, "per_node", S_IFDIR | 0700,
 			   GFS2_DIF_SYSTEM);
@@ -1608,12 +1607,13 @@ int build_per_node(struct gfs2_sbd *sdp)
 		}
 		inode_put(&ip);
 
-		err = build_quota_change(per_node, j);
-		if (err) {
+		ip = build_quota_change(per_node, j);
+		if (ip == NULL) {
 			log_err(_("Error building '%s': %s\n"), "quota_change",
 			        strerror(errno));
-			return err;
+			return 1;
 		}
+		inode_put(&ip);
 	}
 	inode_put(&per_node);
 	return 0;
diff --git a/gfs2/fsck/pass2.c b/gfs2/fsck/pass2.c
index 2e0c1bb7..d82380a1 100644
--- a/gfs2/fsck/pass2.c
+++ b/gfs2/fsck/pass2.c
@@ -1895,6 +1895,16 @@ static int fsck_build_statfs_change(struct gfs2_inode *per_node, unsigned int n)
 	return 0;
 }
 
+static int fsck_build_quota_change(struct gfs2_inode *per_node, unsigned int n)
+{
+	struct gfs2_inode *ip = build_quota_change(per_node, n);
+
+	if (ip == NULL)
+		return 1;
+	inode_put(&ip);
+	return 0;
+}
+
 /* Check system directory inode                                           */
 /* Should work for all system directories: root, master, jindex, per_node */
 static int check_system_dir(struct gfs2_inode *sysinode, const char *dirname,
@@ -1986,7 +1996,7 @@ static int check_system_dir(struct gfs2_inode *sysinode, const char *dirname,
 			sprintf(fn, "quota_change%d", j);
 			error += check_pernode_for(j, sysinode, fn, 1048576, 1,
 						   &quota_change_fxns,
-						   build_quota_change);
+						   fsck_build_quota_change);
 		}
 	}
 	return error;
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index 0c702df0..a928e1ab 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -789,7 +789,7 @@ extern unsigned lgfs2_bm_scan(struct rgrp_tree *rgd, unsigned idx,
 			      uint64_t *buf, uint8_t state);
 extern struct gfs2_inode *build_inum_range(struct gfs2_inode *per_node, unsigned int n);
 extern struct gfs2_inode *build_statfs_change(struct gfs2_inode *per_node, unsigned int j);
-extern int build_quota_change(struct gfs2_inode *per_node, unsigned int j);
+extern struct gfs2_inode *build_quota_change(struct gfs2_inode *per_node, unsigned int j);
 
 /* super.c */
 extern int check_sb(void *sbp);
diff --git a/gfs2/libgfs2/structures.c b/gfs2/libgfs2/structures.c
index bd226e6d..1d4635ab 100644
--- a/gfs2/libgfs2/structures.c
+++ b/gfs2/libgfs2/structures.c
@@ -313,7 +313,7 @@ struct gfs2_inode *build_statfs_change(struct gfs2_inode *per_node, unsigned int
 	return ip;
 }
 
-int build_quota_change(struct gfs2_inode *per_node, unsigned int j)
+struct gfs2_inode *build_quota_change(struct gfs2_inode *per_node, unsigned int j)
 {
 	struct gfs2_sbd *sdp = per_node->i_sbd;
 	struct gfs2_meta_header mh;
@@ -331,9 +331,8 @@ int build_quota_change(struct gfs2_inode *per_node, unsigned int j)
 
 	sprintf(name, "quota_change%u", j);
 	ip = createi(per_node, name, S_IFREG | 0600, GFS2_DIF_SYSTEM);
-	if (ip == NULL) {
-		return errno;
-	}
+	if (ip == NULL)
+		return NULL;
 
 	hgt = calc_tree_height(ip, (blocks + 1) * sdp->sd_bsize);
 	build_height(ip, hgt);
@@ -341,21 +340,14 @@ int build_quota_change(struct gfs2_inode *per_node, unsigned int j)
 	for (x = 0; x < blocks; x++) {
 		bh = get_file_buf(ip, x, 0);
 		if (!bh)
-			return -1;
+			return NULL;
 
 		memset(bh->b_data, 0, sdp->sd_bsize);
 		memcpy(bh->b_data, &mh, sizeof(mh));
 		bmodified(bh);
 		brelse(bh);
 	}
-
-	if (cfg_debug) {
-		printf("\nQuota Change %u:\n", j);
-		lgfs2_dinode_print(ip->i_bh->b_data);
-	}
-
-	inode_put(&ip);
-	return 0;
+	return ip;
 }
 
 int build_inum(struct gfs2_sbd *sdp)
diff --git a/gfs2/mkfs/main_mkfs.c b/gfs2/mkfs/main_mkfs.c
index e0f42c5a..c4415ee3 100644
--- a/gfs2/mkfs/main_mkfs.c
+++ b/gfs2/mkfs/main_mkfs.c
@@ -685,7 +685,6 @@ static int build_per_node(struct gfs2_sbd *sdp, struct mkfs_opts *opts)
 {
 	struct gfs2_inode *per_node;
 	unsigned int j;
-	int err;
 
 	per_node = createi(sdp->master_dir, "per_node", S_IFDIR | 0700,
 			   GFS2_DIF_SYSTEM);
@@ -720,12 +719,17 @@ static int build_per_node(struct gfs2_sbd *sdp, struct mkfs_opts *opts)
 		}
 		inode_put(&ip);
 
-		err = build_quota_change(per_node, j);
-		if (err) {
+		ip = build_quota_change(per_node, j);
+		if (ip == NULL) {
 			fprintf(stderr, _("Error building '%s': %s\n"), "quota_change",
 			        strerror(errno));
-			return err;
+			return 1;
+		}
+		if (opts->debug) {
+			printf("\nQuota Change %u:\n", j);
+			lgfs2_dinode_print(ip->i_bh->b_data);
 		}
+		inode_put(&ip);
 	}
 	if (opts->debug) {
 		printf("\nper_node:\n");
-- 
2.34.1

