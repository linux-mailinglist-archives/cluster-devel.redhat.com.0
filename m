Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A09848CBDF
	for <lists+cluster-devel@lfdr.de>; Wed, 12 Jan 2022 20:27:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642015635;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jCqjJU6HeJKsF1VRO6Tlx6r+Ldj/gLrDXuBT+q1wmEo=;
	b=Be+JwJaKu6ZEbzBPKEhIbhk5KymkqegSKmaJlOcMHykXBIDxLE9Ibm+YkkU/PdHG89XPNV
	IbIM28StTrhvNHDZwN8kZVWa1+rI/6DSU5wc86ieHgZc+k1UShJo/0e+jfLjsXwPzemDex
	79TVjaJggs1wioYRIeW/Q1vJ0zwMcQg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-372-6vkCzhJNMo-xBVntw4H17w-1; Wed, 12 Jan 2022 14:27:12 -0500
X-MC-Unique: 6vkCzhJNMo-xBVntw4H17w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11E94101AFA7;
	Wed, 12 Jan 2022 19:27:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C98FA4BC47;
	Wed, 12 Jan 2022 19:27:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 74E2B4CA9B;
	Wed, 12 Jan 2022 19:27:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20CJR5Xi009294 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 12 Jan 2022 14:27:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8A8EB2B178; Wed, 12 Jan 2022 19:27:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.37.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B3DCB45D67
	for <cluster-devel@redhat.com>; Wed, 12 Jan 2022 19:27:04 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 12 Jan 2022 19:26:37 +0000
Message-Id: <20220112192650.1426415-6-anprice@redhat.com>
In-Reply-To: <20220112192650.1426415-1-anprice@redhat.com>
References: <20220112192650.1426415-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 05/18] libgfs2: Return the inode from
	build_inum_range()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
 gfs2/convert/gfs2_convert.c | 10 +++++++---
 gfs2/fsck/pass1.c           | 10 +++++++---
 gfs2/fsck/pass2.c           | 12 +++++++++++-
 gfs2/libgfs2/libgfs2.h      |  2 +-
 gfs2/libgfs2/structures.c   | 16 +++++-----------
 gfs2/mkfs/main_mkfs.c       | 14 +++++++++++---
 6 files changed, 42 insertions(+), 22 deletions(-)

diff --git a/gfs2/convert/gfs2_convert.c b/gfs2/convert/gfs2_convert.c
index 9a326e7f..dd809e48 100644
--- a/gfs2/convert/gfs2_convert.c
+++ b/gfs2/convert/gfs2_convert.c
@@ -2112,12 +2112,16 @@ static int build_per_node(struct gfs2_sbd *sdp)
 		return -1;
 	}
 	for (j = 0; j < sdp->md.journals; j++) {
-		err = build_inum_range(per_node, j);
-		if (err) {
+		struct gfs2_inode *ip;
+
+		ip = build_inum_range(per_node, j);
+		if (ip == NULL) {
 			log_crit(_("Error building '%s': %s\n"), "inum_range",
 			         strerror(errno));
-			return err;
+			return 1;
 		}
+		inode_put(&ip);
+
 		err = build_statfs_change(per_node, j);
 		if (err) {
 			log_crit(_("Error building '%s': %s\n"), "statfs_change",
diff --git a/gfs2/fsck/pass1.c b/gfs2/fsck/pass1.c
index 38da46a6..8f576fe2 100644
--- a/gfs2/fsck/pass1.c
+++ b/gfs2/fsck/pass1.c
@@ -1590,12 +1590,16 @@ int build_per_node(struct gfs2_sbd *sdp)
 		return -1;
 	}
 	for (j = 0; j < sdp->md.journals; j++) {
-		err = build_inum_range(per_node, j);
-		if (err) {
+		struct gfs2_inode *ip;
+
+		ip = build_inum_range(per_node, j);
+		if (ip == NULL) {
 			log_err(_("Error building '%s': %s\n"), "inum_range",
 			        strerror(errno));
-			return err;
+			return 1;
 		}
+		inode_put(&ip);
+
 		err = build_statfs_change(per_node, j);
 		if (err) {
 			log_err(_("Error building '%s': %s\n"), "statfs_change",
diff --git a/gfs2/fsck/pass2.c b/gfs2/fsck/pass2.c
index 0ab35b55..229667fb 100644
--- a/gfs2/fsck/pass2.c
+++ b/gfs2/fsck/pass2.c
@@ -1875,6 +1875,16 @@ build_it:
 	goto out_good;
 }
 
+static int fsck_build_inum_range(struct gfs2_inode *per_node, unsigned int n)
+{
+	struct gfs2_inode *ip = build_inum_range(per_node, n);
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
@@ -1959,7 +1969,7 @@ static int check_system_dir(struct gfs2_inode *sysinode, const char *dirname,
 		for (j = 0; j < sysinode->i_sbd->md.journals; j++) {
 			sprintf(fn, "inum_range%d", j);
 			error += check_pernode_for(j, sysinode, fn, 16, 0,
-						   NULL, build_inum_range);
+						   NULL, fsck_build_inum_range);
 			sprintf(fn, "statfs_change%d", j);
 			error += check_pernode_for(j, sysinode, fn, 24, 0,
 						   NULL, build_statfs_change);
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index 863b84e6..e9c51054 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -787,7 +787,7 @@ extern int do_init_statfs(struct gfs2_sbd *sdp);
 extern int gfs2_check_meta(const char *buf, int type);
 extern unsigned lgfs2_bm_scan(struct rgrp_tree *rgd, unsigned idx,
 			      uint64_t *buf, uint8_t state);
-extern int build_inum_range(struct gfs2_inode *per_node, unsigned int j);
+extern struct gfs2_inode *build_inum_range(struct gfs2_inode *per_node, unsigned int n);
 extern int build_statfs_change(struct gfs2_inode *per_node, unsigned int j);
 extern int build_quota_change(struct gfs2_inode *per_node, unsigned int j);
 
diff --git a/gfs2/libgfs2/structures.c b/gfs2/libgfs2/structures.c
index c9c31dd2..96a62475 100644
--- a/gfs2/libgfs2/structures.c
+++ b/gfs2/libgfs2/structures.c
@@ -279,7 +279,7 @@ struct gfs2_inode *lgfs2_build_jindex(struct gfs2_inode *master, struct lgfs2_in
 	return jindex;
 }
 
-int build_inum_range(struct gfs2_inode *per_node, unsigned int j)
+struct gfs2_inode *build_inum_range(struct gfs2_inode *per_node, unsigned int j)
 {
 	char name[256];
 	struct gfs2_inode *ip;
@@ -287,19 +287,13 @@ int build_inum_range(struct gfs2_inode *per_node, unsigned int j)
 	sprintf(name, "inum_range%u", j);
 	ip = createi(per_node, name, S_IFREG | 0600,
 		     GFS2_DIF_SYSTEM | GFS2_DIF_JDATA);
-	if (ip == NULL) {
-		return errno;
-	}
+	if (ip == NULL)
+		return NULL;
+
 	ip->i_size = sizeof(struct gfs2_inum_range);
 	lgfs2_dinode_out(ip, ip->i_bh->b_data);
 	bmodified(ip->i_bh);
-	if (cfg_debug) {
-		printf("\nInum Range %u:\n", j);
-		lgfs2_dinode_print(ip->i_bh->b_data);
-	}
-
-	inode_put(&ip);
-	return 0;
+	return ip;
 }
 
 int build_statfs_change(struct gfs2_inode *per_node, unsigned int j)
diff --git a/gfs2/mkfs/main_mkfs.c b/gfs2/mkfs/main_mkfs.c
index 9c9c3752..ea4a653f 100644
--- a/gfs2/mkfs/main_mkfs.c
+++ b/gfs2/mkfs/main_mkfs.c
@@ -694,12 +694,20 @@ static int build_per_node(struct gfs2_sbd *sdp, struct mkfs_opts *opts)
 		return -1;
 	}
 	for (j = 0; j < sdp->md.journals; j++) {
-		err = build_inum_range(per_node, j);
-		if (err) {
+		struct gfs2_inode *ip;
+
+		ip = build_inum_range(per_node, j);
+		if (ip == NULL) {
 			fprintf(stderr, _("Error building '%s': %s\n"), "inum_range",
 			        strerror(errno));
-			return err;
+			return 1;
+		}
+		if (opts->debug) {
+			printf("\nInum Range %u:\n", j);
+			lgfs2_dinode_print(ip->i_bh->b_data);
 		}
+		inode_put(&ip);
+
 		err = build_statfs_change(per_node, j);
 		if (err) {
 			fprintf(stderr, _("Error building '%s': %s\n"), "statfs_change",
-- 
2.34.1

