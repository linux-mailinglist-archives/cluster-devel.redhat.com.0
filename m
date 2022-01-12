Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E1E48CBE5
	for <lists+cluster-devel@lfdr.de>; Wed, 12 Jan 2022 20:27:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642015638;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=53v+0/TyYPPZIkvTvkIhSdiqJIzYQl0OlMzjtsyY970=;
	b=J4SPxNsF7A5E9mr+26sSD2EGGQfFekyA7xkBhgGV2z/qJFSWUbXWDdG3ByRmYwJMprXE4k
	YaY8vpDWM0rymjZjYTUwBvZQW4sKPtQWM4gWmup3sc2o8WJVMXmb7hRvP9GcyG9zD5FvMQ
	2/qUz+ydpFLt+Kw6QjoCWcqbcvU74PQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-375-GEMZYPLsO7We3BsZ2zwfNQ-1; Wed, 12 Jan 2022 14:27:15 -0500
X-MC-Unique: GEMZYPLsO7We3BsZ2zwfNQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7C15101AFAC;
	Wed, 12 Jan 2022 19:27:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D7E914BC47;
	Wed, 12 Jan 2022 19:27:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C061D1806D1C;
	Wed, 12 Jan 2022 19:27:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20CJR7c5009304 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 12 Jan 2022 14:27:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 021742B178; Wed, 12 Jan 2022 19:27:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.37.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 290AE60657
	for <cluster-devel@redhat.com>; Wed, 12 Jan 2022 19:27:05 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 12 Jan 2022 19:26:38 +0000
Message-Id: <20220112192650.1426415-7-anprice@redhat.com>
In-Reply-To: <20220112192650.1426415-1-anprice@redhat.com>
References: <20220112192650.1426415-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 06/18] libgfs2: Return the inode from
	build_statfs_change()
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
 gfs2/convert/gfs2_convert.c |  8 +++++---
 gfs2/fsck/pass1.c           |  8 +++++---
 gfs2/fsck/pass2.c           | 12 +++++++++++-
 gfs2/libgfs2/libgfs2.h      |  2 +-
 gfs2/libgfs2/structures.c   | 16 +++++-----------
 gfs2/mkfs/main_mkfs.c       | 12 +++++++++---
 6 files changed, 36 insertions(+), 22 deletions(-)

diff --git a/gfs2/convert/gfs2_convert.c b/gfs2/convert/gfs2_convert.c
index dd809e48..1cb2d6fa 100644
--- a/gfs2/convert/gfs2_convert.c
+++ b/gfs2/convert/gfs2_convert.c
@@ -2122,12 +2122,14 @@ static int build_per_node(struct gfs2_sbd *sdp)
 		}
 		inode_put(&ip);
 
-		err = build_statfs_change(per_node, j);
-		if (err) {
+		ip = build_statfs_change(per_node, j);
+		if (ip == NULL) {
 			log_crit(_("Error building '%s': %s\n"), "statfs_change",
 			         strerror(errno));
-			return err;
+			return 1;
 		}
+		inode_put(&ip);
+
 		err = build_quota_change(per_node, j);
 		if (err) {
 			log_crit(_("Error building '%s': %s\n"), "quota_change",
diff --git a/gfs2/fsck/pass1.c b/gfs2/fsck/pass1.c
index 8f576fe2..3df64de7 100644
--- a/gfs2/fsck/pass1.c
+++ b/gfs2/fsck/pass1.c
@@ -1600,12 +1600,14 @@ int build_per_node(struct gfs2_sbd *sdp)
 		}
 		inode_put(&ip);
 
-		err = build_statfs_change(per_node, j);
-		if (err) {
+		ip = build_statfs_change(per_node, j);
+		if (ip == NULL) {
 			log_err(_("Error building '%s': %s\n"), "statfs_change",
 			        strerror(errno));
-			return err;
+			return 1;
 		}
+		inode_put(&ip);
+
 		err = build_quota_change(per_node, j);
 		if (err) {
 			log_err(_("Error building '%s': %s\n"), "quota_change",
diff --git a/gfs2/fsck/pass2.c b/gfs2/fsck/pass2.c
index 229667fb..2e0c1bb7 100644
--- a/gfs2/fsck/pass2.c
+++ b/gfs2/fsck/pass2.c
@@ -1885,6 +1885,16 @@ static int fsck_build_inum_range(struct gfs2_inode *per_node, unsigned int n)
 	return 0;
 }
 
+static int fsck_build_statfs_change(struct gfs2_inode *per_node, unsigned int n)
+{
+	struct gfs2_inode *ip = build_statfs_change(per_node, n);
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
@@ -1972,7 +1982,7 @@ static int check_system_dir(struct gfs2_inode *sysinode, const char *dirname,
 						   NULL, fsck_build_inum_range);
 			sprintf(fn, "statfs_change%d", j);
 			error += check_pernode_for(j, sysinode, fn, 24, 0,
-						   NULL, build_statfs_change);
+						   NULL, fsck_build_statfs_change);
 			sprintf(fn, "quota_change%d", j);
 			error += check_pernode_for(j, sysinode, fn, 1048576, 1,
 						   &quota_change_fxns,
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index e9c51054..0c702df0 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -788,7 +788,7 @@ extern int gfs2_check_meta(const char *buf, int type);
 extern unsigned lgfs2_bm_scan(struct rgrp_tree *rgd, unsigned idx,
 			      uint64_t *buf, uint8_t state);
 extern struct gfs2_inode *build_inum_range(struct gfs2_inode *per_node, unsigned int n);
-extern int build_statfs_change(struct gfs2_inode *per_node, unsigned int j);
+extern struct gfs2_inode *build_statfs_change(struct gfs2_inode *per_node, unsigned int j);
 extern int build_quota_change(struct gfs2_inode *per_node, unsigned int j);
 
 /* super.c */
diff --git a/gfs2/libgfs2/structures.c b/gfs2/libgfs2/structures.c
index 96a62475..bd226e6d 100644
--- a/gfs2/libgfs2/structures.c
+++ b/gfs2/libgfs2/structures.c
@@ -296,7 +296,7 @@ struct gfs2_inode *build_inum_range(struct gfs2_inode *per_node, unsigned int j)
 	return ip;
 }
 
-int build_statfs_change(struct gfs2_inode *per_node, unsigned int j)
+struct gfs2_inode *build_statfs_change(struct gfs2_inode *per_node, unsigned int j)
 {
 	char name[256];
 	struct gfs2_inode *ip;
@@ -304,19 +304,13 @@ int build_statfs_change(struct gfs2_inode *per_node, unsigned int j)
 	sprintf(name, "statfs_change%u", j);
 	ip = createi(per_node, name, S_IFREG | 0600,
 		     GFS2_DIF_SYSTEM | GFS2_DIF_JDATA);
-	if (ip == NULL) {
-		return errno;
-	}
+	if (ip == NULL)
+		return NULL;
+
 	ip->i_size = sizeof(struct gfs2_statfs_change);
 	lgfs2_dinode_out(ip, ip->i_bh->b_data);
 	bmodified(ip->i_bh);
-	if (cfg_debug) {
-		printf("\nStatFS Change %u:\n", j);
-		lgfs2_dinode_print(ip->i_bh->b_data);
-	}
-
-	inode_put(&ip);
-	return 0;
+	return ip;
 }
 
 int build_quota_change(struct gfs2_inode *per_node, unsigned int j)
diff --git a/gfs2/mkfs/main_mkfs.c b/gfs2/mkfs/main_mkfs.c
index ea4a653f..e0f42c5a 100644
--- a/gfs2/mkfs/main_mkfs.c
+++ b/gfs2/mkfs/main_mkfs.c
@@ -708,12 +708,18 @@ static int build_per_node(struct gfs2_sbd *sdp, struct mkfs_opts *opts)
 		}
 		inode_put(&ip);
 
-		err = build_statfs_change(per_node, j);
-		if (err) {
+		ip = build_statfs_change(per_node, j);
+		if (ip == NULL) {
 			fprintf(stderr, _("Error building '%s': %s\n"), "statfs_change",
 			        strerror(errno));
-			return err;
+			return 1;
 		}
+		if (opts->debug) {
+			printf("\nStatFS Change %u:\n", j);
+			lgfs2_dinode_print(ip->i_bh->b_data);
+		}
+		inode_put(&ip);
+
 		err = build_quota_change(per_node, j);
 		if (err) {
 			fprintf(stderr, _("Error building '%s': %s\n"), "quota_change",
-- 
2.34.1

