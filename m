Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 332B448CBE8
	for <lists+cluster-devel@lfdr.de>; Wed, 12 Jan 2022 20:27:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642015652;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6gGqhuuypjAAaf+nn7+btQ8zBr04tyNtuJCyTz158oo=;
	b=X6DzhgOolM7IsKk9mORiW05hI0xKAPK9keyy1pLmEz/t9eiXoAeYbxkG9qn0z7jyhDFPvs
	SzVJPvZiZ1M4vLGEYseQCsXjuPYqsxo07ZL2E0ms8P0tfXeiFBhj9te1ElSYuBpN9npkzN
	Kle31OC0W4FnNZOjekWzWnsoC4jkN3Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-uAVOO-TmO26dKn4gP5r3ng-1; Wed, 12 Jan 2022 14:27:29 -0500
X-MC-Unique: uAVOO-TmO26dKn4gP5r3ng-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D92983DD20;
	Wed, 12 Jan 2022 19:27:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BD704E2A2;
	Wed, 12 Jan 2022 19:27:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4743C1806D2B;
	Wed, 12 Jan 2022 19:27:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20CJROih009365 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 12 Jan 2022 14:27:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C90D92B88B; Wed, 12 Jan 2022 19:27:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.37.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F6662B178
	for <cluster-devel@redhat.com>; Wed, 12 Jan 2022 19:27:13 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 12 Jan 2022 19:26:43 +0000
Message-Id: <20220112192650.1426415-12-anprice@redhat.com>
In-Reply-To: <20220112192650.1426415-1-anprice@redhat.com>
References: <20220112192650.1426415-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 11/18] libgfs2: Return the inode from
	build_quota()
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
 gfs2/convert/gfs2_convert.c |  5 +++--
 gfs2/fsck/initialize.c      | 17 +++++++++--------
 gfs2/fsck/pass1.c           | 11 ++++++++++-
 gfs2/libgfs2/libgfs2.h      |  2 +-
 gfs2/libgfs2/structures.c   | 20 +++++++-------------
 gfs2/mkfs/main_mkfs.c       |  9 +++++++--
 6 files changed, 37 insertions(+), 27 deletions(-)

diff --git a/gfs2/convert/gfs2_convert.c b/gfs2/convert/gfs2_convert.c
index 5a542e29..8667d8fb 100644
--- a/gfs2/convert/gfs2_convert.c
+++ b/gfs2/convert/gfs2_convert.c
@@ -2368,12 +2368,13 @@ int main(int argc, char **argv)
 		}
 		inode_put(&ip);
 		/* Create the quota file */
-		error = build_quota(&sb2);
-		if (error) {
+		ip = build_quota(&sb2);
+		if (ip == NULL) {
 			log_crit(_("Error building quota inode: %s\n"),
 			         strerror(error));
 			exit(-1);
 		}
+		inode_put(&ip);
 
 		/* Copy out the master dinode */
 		if (sb2.master_dir->i_bh->b_modified)
diff --git a/gfs2/fsck/initialize.c b/gfs2/fsck/initialize.c
index e1c71fc8..a2bc44c0 100644
--- a/gfs2/fsck/initialize.c
+++ b/gfs2/fsck/initialize.c
@@ -562,11 +562,12 @@ static int rebuild_master(struct gfs2_sbd *sdp)
 			exit(FSCK_ERROR);
 		}
 	} else {
-		err = build_quota(sdp);
-		if (err) {
-			log_crit(_("Error %d building quota inode\n"), err);
+		struct gfs2_inode *qip = build_quota(sdp);
+		if (qip == NULL) {
+			log_crit(_("Error building quota inode: %s\n"), strerror(errno));
 			exit(FSCK_ERROR);
 		}
+		inode_put(&qip);
 	}
 
 	log_err(_("Master directory rebuilt.\n"));
@@ -911,13 +912,13 @@ static int init_system_inodes(struct gfs2_sbd *sdp)
 				   "rebuilt.  Aborting.\n"));
 			goto fail;
 		}
-		err = build_quota(sdp);
-		if (err) {
-			log_crit(_("Error %d rebuilding quota inode\n"), err);
+		sdp->md.qinode = build_quota(sdp);
+		if (sdp->md.qinode == NULL) {
+			log_crit(_("Error rebuilding quota inode: %s\n"), strerror(errno));
 			exit(FSCK_ERROR);
 		}
-		gfs2_lookupi(sdp->master_dir, "quota", 5, &sdp->md.qinode);
-		if (!sdp->md.qinode) {
+		lgfs2_dinode_out(sdp->md.qinode, sdp->md.qinode->i_bh->b_data);
+		if (bwrite(sdp->md.qinode->i_bh) != 0) {
 			log_crit(_("Unable to rebuild system quota file "
 				   "inode.  Aborting.\n"));
 			goto fail;
diff --git a/gfs2/fsck/pass1.c b/gfs2/fsck/pass1.c
index 389cfbe5..ad16971e 100644
--- a/gfs2/fsck/pass1.c
+++ b/gfs2/fsck/pass1.c
@@ -1646,6 +1646,15 @@ static int fsck_build_rindex(struct gfs2_sbd *sdp)
 	return 0;
 }
 
+static int fsck_build_quota(struct gfs2_sbd *sdp)
+{
+	struct gfs2_inode *ip = build_quota(sdp);
+	if (ip == NULL)
+		return -1;
+	inode_put(&ip);
+	return 0;
+}
+
 static int check_system_inodes(struct gfs2_sbd *sdp)
 {
 	int journal_count;
@@ -1696,7 +1705,7 @@ static int check_system_inodes(struct gfs2_sbd *sdp)
 		stack;
 		return -1;
 	}
-	if (check_system_inode(sdp, &sdp->md.qinode, "quota", build_quota,
+	if (check_system_inode(sdp, &sdp->md.qinode, "quota", fsck_build_quota,
 			       0, sdp->master_dir, !sdp->gfs1)) {
 		stack;
 		return -1;
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index 3c1ec9b2..3396ddb0 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -780,7 +780,7 @@ extern struct gfs2_inode *lgfs2_build_jindex(struct gfs2_inode *metafs, struct l
 extern struct gfs2_inode *build_inum(struct gfs2_sbd *sdp);
 extern struct gfs2_inode *build_statfs(struct gfs2_sbd *sdp);
 extern struct gfs2_inode *build_rindex(struct gfs2_sbd *sdp);
-extern int build_quota(struct gfs2_sbd *sdp);
+extern struct gfs2_inode *build_quota(struct gfs2_sbd *sdp);
 extern int build_root(struct gfs2_sbd *sdp);
 extern int do_init_inum(struct gfs2_sbd *sdp);
 extern int do_init_statfs(struct gfs2_sbd *sdp);
diff --git a/gfs2/libgfs2/structures.c b/gfs2/libgfs2/structures.c
index eb4bbe01..6cc0a8dd 100644
--- a/gfs2/libgfs2/structures.c
+++ b/gfs2/libgfs2/structures.c
@@ -402,7 +402,7 @@ struct gfs2_inode *build_rindex(struct gfs2_sbd *sdp)
 	return ip;
 }
 
-int build_quota(struct gfs2_sbd *sdp)
+struct gfs2_inode *build_quota(struct gfs2_sbd *sdp)
 {
 	struct gfs2_inode *ip;
 	struct gfs2_quota qu;
@@ -410,9 +410,9 @@ int build_quota(struct gfs2_sbd *sdp)
 
 	ip = createi(sdp->master_dir, "quota", S_IFREG | 0600,
 		     GFS2_DIF_SYSTEM | GFS2_DIF_JDATA);
-	if (ip == NULL) {
-		return errno;
-	}
+	if (ip == NULL)
+		return NULL;
+
 	ip->i_payload_format = GFS2_FORMAT_QU;
 	bmodified(ip->i_bh);
 
@@ -421,18 +421,12 @@ int build_quota(struct gfs2_sbd *sdp)
 
 	count = gfs2_writei(ip, &qu, ip->i_size, sizeof(struct gfs2_quota));
 	if (count != sizeof(struct gfs2_quota))
-		return -1;
+		return NULL;
 	count = gfs2_writei(ip, &qu, ip->i_size, sizeof(struct gfs2_quota));
 	if (count != sizeof(struct gfs2_quota))
-		return -1;
-
-	if (cfg_debug) {
-		printf("\nRoot quota:\n");
-		lgfs2_quota_print(&qu);
-	}
+		return NULL;
 
-	inode_put(&ip);
-	return 0;
+	return ip;
 }
 
 int build_root(struct gfs2_sbd *sdp)
diff --git a/gfs2/mkfs/main_mkfs.c b/gfs2/mkfs/main_mkfs.c
index 23d9f1ec..56a3b7d2 100644
--- a/gfs2/mkfs/main_mkfs.c
+++ b/gfs2/mkfs/main_mkfs.c
@@ -1329,11 +1329,16 @@ int main(int argc, char *argv[])
 		printf("%s", _("Creating quota file: "));
 		fflush(stdout);
 	}
-	error = build_quota(&sbd);
-	if (error) {
+	ip = build_quota(&sbd);
+	if (ip == NULL) {
 		fprintf(stderr, _("Error building '%s': %s\n"), "quota", strerror(errno));
 		exit(EXIT_FAILURE);
 	}
+	if (opts.debug) {
+		printf("\nQuota:\n");
+		lgfs2_dinode_print(ip->i_bh->b_data);
+	}
+	inode_put(&ip);
 	if (!opts.quiet)
 		printf("%s", _("Done\n"));
 
-- 
2.34.1

