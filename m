Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 236BC48CBE4
	for <lists+cluster-devel@lfdr.de>; Wed, 12 Jan 2022 20:27:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642015637;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fQ7Jp5D7xtaQh3owh8y0UNd4FxRB7Wh/c32RI2CHkeg=;
	b=Quk7S1TP/gIPIgzMPvLRCv031pTzcNJtzu/OXFMgY/ACAW98AP1VBxhuwJlCZgPH2wAco2
	f4FLA/5QVGpZmpgedAWgLFORzogu/NNBqK/2xoh2b4/R6adU6Mts2aG0UXCJy2sGMkHjTH
	738fG1iM+bAHghD7qPoc2xk2CiE0WwI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-iOMrurQsPGaSrJUzmRRIgA-1; Wed, 12 Jan 2022 14:27:14 -0500
X-MC-Unique: iOMrurQsPGaSrJUzmRRIgA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D47383DD21;
	Wed, 12 Jan 2022 19:27:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E09960C9D;
	Wed, 12 Jan 2022 19:27:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 65A2C4A7C8;
	Wed, 12 Jan 2022 19:27:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20CJR47w009289 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 12 Jan 2022 14:27:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3B5182B178; Wed, 12 Jan 2022 19:27:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.37.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F2E1545D67
	for <cluster-devel@redhat.com>; Wed, 12 Jan 2022 19:27:02 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 12 Jan 2022 19:26:36 +0000
Message-Id: <20220112192650.1426415-5-anprice@redhat.com>
In-Reply-To: <20220112192650.1426415-1-anprice@redhat.com>
References: <20220112192650.1426415-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 04/18] libgfs2: Push down build_per_node()
	into the utils
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

The trouble with having this function in libgfs2 is that it creates
per_node and everything inside it, which means that it's difficult to
know where an error occurred and we don't have any control over how
debug/error messages are printed. It's also not necessarily the order
that we want to create the inodes in all utilities. Move
build_per_node() down into the utils and add error reporting to match.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/convert/gfs2_convert.c | 36 +++++++++++++++++++++++++++
 gfs2/fsck/fsck.h            |  1 +
 gfs2/fsck/pass1.c           | 36 +++++++++++++++++++++++++++
 gfs2/libgfs2/libgfs2.h      |  1 -
 gfs2/libgfs2/structures.c   | 36 ---------------------------
 gfs2/mkfs/main_mkfs.c       | 49 +++++++++++++++++++++++++++++++++----
 6 files changed, 117 insertions(+), 42 deletions(-)

diff --git a/gfs2/convert/gfs2_convert.c b/gfs2/convert/gfs2_convert.c
index 237160af..9a326e7f 100644
--- a/gfs2/convert/gfs2_convert.c
+++ b/gfs2/convert/gfs2_convert.c
@@ -2099,6 +2099,42 @@ static int check_fit(struct gfs2_sbd *sdp)
 	return blks_avail > blks_need;
 }
 
+static int build_per_node(struct gfs2_sbd *sdp)
+{
+	struct gfs2_inode *per_node;
+	unsigned int j;
+	int err;
+
+	per_node = createi(sdp->master_dir, "per_node", S_IFDIR | 0700,
+			   GFS2_DIF_SYSTEM);
+	if (per_node == NULL) {
+		log_crit(_("Error building '%s': %s\n"), "per_node", strerror(errno));
+		return -1;
+	}
+	for (j = 0; j < sdp->md.journals; j++) {
+		err = build_inum_range(per_node, j);
+		if (err) {
+			log_crit(_("Error building '%s': %s\n"), "inum_range",
+			         strerror(errno));
+			return err;
+		}
+		err = build_statfs_change(per_node, j);
+		if (err) {
+			log_crit(_("Error building '%s': %s\n"), "statfs_change",
+			         strerror(errno));
+			return err;
+		}
+		err = build_quota_change(per_node, j);
+		if (err) {
+			log_crit(_("Error building '%s': %s\n"), "quota_change",
+			         strerror(errno));
+			return err;
+		}
+	}
+	inode_put(&per_node);
+	return 0;
+}
+
 /* We fetch the old quota inode block and copy the contents of the block
  * (minus the struct gfs2_dinode) into the new quota block. We update the 
  * inode height/size of the new quota file to that of the old one and set the 
diff --git a/gfs2/fsck/fsck.h b/gfs2/fsck/fsck.h
index f6c7d1dd..7b991614 100644
--- a/gfs2/fsck/fsck.h
+++ b/gfs2/fsck/fsck.h
@@ -200,5 +200,6 @@ extern struct special_blocks *blockfind(struct special_blocks *blist, uint64_t n
 extern void gfs2_special_set(struct special_blocks *blocklist, uint64_t block);
 extern void gfs2_special_free(struct special_blocks *blist);
 extern int sb_fixed;
+extern int build_per_node(struct gfs2_sbd *sdp);
 
 #endif /* _FSCK_H */
diff --git a/gfs2/fsck/pass1.c b/gfs2/fsck/pass1.c
index e976149c..38da46a6 100644
--- a/gfs2/fsck/pass1.c
+++ b/gfs2/fsck/pass1.c
@@ -1577,6 +1577,42 @@ static int build_a_journal(struct gfs2_sbd *sdp)
 	return 0;
 }
 
+int build_per_node(struct gfs2_sbd *sdp)
+{
+	struct gfs2_inode *per_node;
+	unsigned int j;
+	int err;
+
+	per_node = createi(sdp->master_dir, "per_node", S_IFDIR | 0700,
+			   GFS2_DIF_SYSTEM);
+	if (per_node == NULL) {
+		log_err(_("Error building '%s': %s\n"), "per_node", strerror(errno));
+		return -1;
+	}
+	for (j = 0; j < sdp->md.journals; j++) {
+		err = build_inum_range(per_node, j);
+		if (err) {
+			log_err(_("Error building '%s': %s\n"), "inum_range",
+			        strerror(errno));
+			return err;
+		}
+		err = build_statfs_change(per_node, j);
+		if (err) {
+			log_err(_("Error building '%s': %s\n"), "statfs_change",
+			        strerror(errno));
+			return err;
+		}
+		err = build_quota_change(per_node, j);
+		if (err) {
+			log_err(_("Error building '%s': %s\n"), "quota_change",
+			        strerror(errno));
+			return err;
+		}
+	}
+	inode_put(&per_node);
+	return 0;
+}
+
 static int check_system_inodes(struct gfs2_sbd *sdp)
 {
 	int journal_count;
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index 9a66b5b3..863b84e6 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -777,7 +777,6 @@ extern int lgfs2_sb_write(const struct gfs2_sbd *sdp, int fd);
 extern int build_journal(struct gfs2_sbd *sdp, int j,
 			 struct gfs2_inode *jindex);
 extern struct gfs2_inode *lgfs2_build_jindex(struct gfs2_inode *metafs, struct lgfs2_inum *jnls, size_t nmemb);
-extern int build_per_node(struct gfs2_sbd *sdp);
 extern int build_inum(struct gfs2_sbd *sdp);
 extern int build_statfs(struct gfs2_sbd *sdp);
 extern int build_rindex(struct gfs2_sbd *sdp);
diff --git a/gfs2/libgfs2/structures.c b/gfs2/libgfs2/structures.c
index 09d7041e..c9c31dd2 100644
--- a/gfs2/libgfs2/structures.c
+++ b/gfs2/libgfs2/structures.c
@@ -370,42 +370,6 @@ int build_quota_change(struct gfs2_inode *per_node, unsigned int j)
 	return 0;
 }
 
-int build_per_node(struct gfs2_sbd *sdp)
-{
-	struct gfs2_inode *per_node;
-	unsigned int j;
-	int err;
-
-	per_node = createi(sdp->master_dir, "per_node", S_IFDIR | 0700,
-			   GFS2_DIF_SYSTEM);
-	if (per_node == NULL) {
-		return errno;
-	}
-
-	for (j = 0; j < sdp->md.journals; j++) {
-		err = build_inum_range(per_node, j);
-		if (err) {
-			return err;
-		}
-		err = build_statfs_change(per_node, j);
-		if (err) {
-			return err;
-		}
-		err = build_quota_change(per_node, j);
-		if (err) {
-			return err;
-		}
-	}
-
-	if (cfg_debug) {
-		printf("\nper_node:\n");
-		lgfs2_dinode_print(per_node->i_bh->b_data);
-	}
-
-	inode_put(&per_node);
-	return 0;
-}
-
 int build_inum(struct gfs2_sbd *sdp)
 {
 	struct gfs2_inode *ip;
diff --git a/gfs2/mkfs/main_mkfs.c b/gfs2/mkfs/main_mkfs.c
index 17284976..9c9c3752 100644
--- a/gfs2/mkfs/main_mkfs.c
+++ b/gfs2/mkfs/main_mkfs.c
@@ -681,6 +681,46 @@ static int warn_of_destruction(const char *path)
 	return 0;
 }
 
+static int build_per_node(struct gfs2_sbd *sdp, struct mkfs_opts *opts)
+{
+	struct gfs2_inode *per_node;
+	unsigned int j;
+	int err;
+
+	per_node = createi(sdp->master_dir, "per_node", S_IFDIR | 0700,
+			   GFS2_DIF_SYSTEM);
+	if (per_node == NULL) {
+		fprintf(stderr, _("Error building '%s': %s\n"), "per_node", strerror(errno));
+		return -1;
+	}
+	for (j = 0; j < sdp->md.journals; j++) {
+		err = build_inum_range(per_node, j);
+		if (err) {
+			fprintf(stderr, _("Error building '%s': %s\n"), "inum_range",
+			        strerror(errno));
+			return err;
+		}
+		err = build_statfs_change(per_node, j);
+		if (err) {
+			fprintf(stderr, _("Error building '%s': %s\n"), "statfs_change",
+			        strerror(errno));
+			return err;
+		}
+		err = build_quota_change(per_node, j);
+		if (err) {
+			fprintf(stderr, _("Error building '%s': %s\n"), "quota_change",
+			        strerror(errno));
+			return err;
+		}
+	}
+	if (opts->debug) {
+		printf("\nper_node:\n");
+		lgfs2_dinode_print(per_node->i_bh->b_data);
+	}
+	inode_put(&per_node);
+	return 0;
+}
+
 static int zero_gap(struct gfs2_sbd *sdp, uint64_t addr, size_t blocks)
 {
 	struct iovec *iov;
@@ -1234,11 +1274,10 @@ int main(int argc, char *argv[])
 	if (error != 0)
 		exit(1);
 
-	error = build_per_node(&sbd);
-	if (error) {
-		fprintf(stderr, _("Error building '%s': %s\n"), "per_node", strerror(errno));
-		exit(EXIT_FAILURE);
-	}
+	error = build_per_node(&sbd, &opts);
+	if (error != 0)
+		exit(1);
+
 	error = build_inum(&sbd);
 	if (error) {
 		fprintf(stderr, _("Error building '%s': %s\n"), "inum", strerror(errno));
-- 
2.34.1

