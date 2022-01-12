Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9EC48CBE7
	for <lists+cluster-devel@lfdr.de>; Wed, 12 Jan 2022 20:27:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642015647;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XEjVm10IlleY1xpB32zDZjCpOZZE3n3RJr9NhcHo70o=;
	b=a3RMgWE/Xn2gpHpKzkp7JZDrbd1MfEC8gKAU9wIImQ40nuv/eYP/0oY6uJB8s4nFqseN9u
	fOLQ5uyCFelC5c0rWGY2uq8F39+ezW8ra/JuXh9vKUb9Pc0a81Qt8mdIR4OcJY+U4q9zmh
	VdzztnjqJidlQ1fKmxSXwX4mFvtStk4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-Yjgan4tpM_-NVfiSOQcA3w-1; Wed, 12 Jan 2022 14:27:19 -0500
X-MC-Unique: Yjgan4tpM_-NVfiSOQcA3w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E375190B2A1;
	Wed, 12 Jan 2022 19:27:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 00A1360C9D;
	Wed, 12 Jan 2022 19:27:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B4BE81806D1D;
	Wed, 12 Jan 2022 19:27:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20CJRDLO009347 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 12 Jan 2022 14:27:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7C5B92B178; Wed, 12 Jan 2022 19:27:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.37.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA41B60BD8
	for <cluster-devel@redhat.com>; Wed, 12 Jan 2022 19:27:12 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 12 Jan 2022 19:26:42 +0000
Message-Id: <20220112192650.1426415-11-anprice@redhat.com>
In-Reply-To: <20220112192650.1426415-1-anprice@redhat.com>
References: <20220112192650.1426415-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 10/18] libgfs2: Return the inode from
	build_rindex()
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

This allows the caller to call inode_put() when it's convenient and also
allows the debug message printing to be moved out of the function.
fsck.gfs2 passes the function by reference so it needs a shim until the
other builder functions can be given the same signature.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/convert/gfs2_convert.c |  8 +++++---
 gfs2/fsck/initialize.c      | 15 +++++++++------
 gfs2/fsck/pass1.c           | 11 ++++++++++-
 gfs2/libgfs2/libgfs2.h      |  2 +-
 gfs2/libgfs2/structures.c   | 20 +++++++-------------
 gfs2/mkfs/main_mkfs.c       | 10 ++++++++--
 6 files changed, 40 insertions(+), 26 deletions(-)

diff --git a/gfs2/convert/gfs2_convert.c b/gfs2/convert/gfs2_convert.c
index 93c9755b..5a542e29 100644
--- a/gfs2/convert/gfs2_convert.c
+++ b/gfs2/convert/gfs2_convert.c
@@ -2308,6 +2308,7 @@ int main(int argc, char **argv)
 	/* Create our system files and directories.       */
 	/* ---------------------------------------------- */
 	if (!error) {
+		struct gfs2_inode *ip;
 		int jreduce = 0;
 
 		/* Now we've got to treat it as a gfs2 file system */
@@ -2359,12 +2360,13 @@ int main(int argc, char **argv)
 		do_init_statfs(&sb2);
 
 		/* Create the resource group index file */
-		error = build_rindex(&sb2);
-		if (error) {
+		ip = build_rindex(&sb2);
+		if (ip == NULL) {
 			log_crit(_("Error building rindex inode: %s\n"),
-			         strerror(error));
+			         strerror(errno));
 			exit(-1);
 		}
+		inode_put(&ip);
 		/* Create the quota file */
 		error = build_quota(&sb2);
 		if (error) {
diff --git a/gfs2/fsck/initialize.c b/gfs2/fsck/initialize.c
index bb2bcfb7..e1c71fc8 100644
--- a/gfs2/fsck/initialize.c
+++ b/gfs2/fsck/initialize.c
@@ -544,11 +544,12 @@ static int rebuild_master(struct gfs2_sbd *sdp)
 			exit(FSCK_ERROR);
 		}
 	} else {
-		err = build_rindex(sdp);
-		if (err) {
-			log_crit(_("Error %d building rindex inode\n"), err);
+		struct gfs2_inode *rip = build_rindex(sdp);
+		if (rip == NULL) {
+			log_crit(_("Error building rindex inode: %s\n"), strerror(errno));
 			exit(FSCK_ERROR);
 		}
+		inode_put(&rip);
 	}
 
 	if (fix_md.qinode) {
@@ -1514,7 +1515,7 @@ static int reconstruct_journals(struct gfs2_sbd *sdp)
  */
 static int init_rindex(struct gfs2_sbd *sdp)
 {
-	int err;
+	struct gfs2_inode *ip;
 
 	if (sdp->gfs1)
 		sdp->md.riinode = lgfs2_inode_read(sdp, sdp->sd_rindex_di.in_addr);
@@ -1529,10 +1530,12 @@ static int init_rindex(struct gfs2_sbd *sdp)
 		log_crit(_("Error: Cannot proceed without a valid rindex.\n"));
 		return -1;
 	}
-	if ((err = build_rindex(sdp))) {
-		log_crit(_("Error %d rebuilding rindex\n"), err);
+	ip = build_rindex(sdp);
+	if (ip == NULL) {
+		log_crit(_("Error rebuilding rindex: %s\n"), strerror(errno));
 		return -1;
 	}
+	inode_put(&ip);
 	return 0;
 }
 
diff --git a/gfs2/fsck/pass1.c b/gfs2/fsck/pass1.c
index b19292eb..389cfbe5 100644
--- a/gfs2/fsck/pass1.c
+++ b/gfs2/fsck/pass1.c
@@ -1637,6 +1637,15 @@ static int fsck_build_statfs(struct gfs2_sbd *sdp)
 	return 0;
 }
 
+static int fsck_build_rindex(struct gfs2_sbd *sdp)
+{
+	struct gfs2_inode *ip = build_rindex(sdp);
+	if (ip == NULL)
+		return -1;
+	inode_put(&ip);
+	return 0;
+}
+
 static int check_system_inodes(struct gfs2_sbd *sdp)
 {
 	int journal_count;
@@ -1682,7 +1691,7 @@ static int check_system_inodes(struct gfs2_sbd *sdp)
 		stack;
 		return -1;
 	}
-	if (check_system_inode(sdp, &sdp->md.riinode, "rindex", build_rindex,
+	if (check_system_inode(sdp, &sdp->md.riinode, "rindex", fsck_build_rindex,
 			       0, sdp->master_dir, !sdp->gfs1)) {
 		stack;
 		return -1;
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index 83fc90ce..3c1ec9b2 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -779,7 +779,7 @@ extern int build_journal(struct gfs2_sbd *sdp, int j,
 extern struct gfs2_inode *lgfs2_build_jindex(struct gfs2_inode *metafs, struct lgfs2_inum *jnls, size_t nmemb);
 extern struct gfs2_inode *build_inum(struct gfs2_sbd *sdp);
 extern struct gfs2_inode *build_statfs(struct gfs2_sbd *sdp);
-extern int build_rindex(struct gfs2_sbd *sdp);
+extern struct gfs2_inode *build_rindex(struct gfs2_sbd *sdp);
 extern int build_quota(struct gfs2_sbd *sdp);
 extern int build_root(struct gfs2_sbd *sdp);
 extern int do_init_inum(struct gfs2_sbd *sdp);
diff --git a/gfs2/libgfs2/structures.c b/gfs2/libgfs2/structures.c
index f790adcc..eb4bbe01 100644
--- a/gfs2/libgfs2/structures.c
+++ b/gfs2/libgfs2/structures.c
@@ -368,7 +368,7 @@ struct gfs2_inode *build_statfs(struct gfs2_sbd *sdp)
 	return ip;
 }
 
-int build_rindex(struct gfs2_sbd *sdp)
+struct gfs2_inode *build_rindex(struct gfs2_sbd *sdp)
 {
 	struct gfs2_inode *ip;
 	struct osi_node *n, *next = NULL;
@@ -378,9 +378,9 @@ int build_rindex(struct gfs2_sbd *sdp)
 
 	ip = createi(sdp->master_dir, "rindex", S_IFREG | 0600,
 		     GFS2_DIF_SYSTEM | GFS2_DIF_JDATA);
-	if (ip == NULL) {
-		return errno;
-	}
+	if (ip == NULL)
+		return NULL;
+
 	ip->i_payload_format = GFS2_FORMAT_RI;
 	bmodified(ip->i_bh);
 
@@ -392,20 +392,14 @@ int build_rindex(struct gfs2_sbd *sdp)
 
 		count = gfs2_writei(ip, buf, ip->i_size, sizeof(struct gfs2_rindex));
 		if (count != sizeof(struct gfs2_rindex))
-			return -1;
+			return NULL;
 	}
 	memset(buf, 0, sizeof(struct gfs2_rindex));
 	count = __gfs2_writei(ip, buf, ip->i_size, sizeof(struct gfs2_rindex), 0);
 	if (count != sizeof(struct gfs2_rindex))
-		return -1;
-
-	if (cfg_debug) {
-		printf("\nResource Index:\n");
-		lgfs2_dinode_print(ip->i_bh->b_data);
-	}
+		return NULL;
 
-	inode_put(&ip);
-	return 0;
+	return ip;
 }
 
 int build_quota(struct gfs2_sbd *sdp)
diff --git a/gfs2/mkfs/main_mkfs.c b/gfs2/mkfs/main_mkfs.c
index 647c969b..23d9f1ec 100644
--- a/gfs2/mkfs/main_mkfs.c
+++ b/gfs2/mkfs/main_mkfs.c
@@ -1198,6 +1198,7 @@ int main(int argc, char *argv[])
 {
 	struct gfs2_sbd sbd;
 	struct mkfs_opts opts;
+	struct gfs2_inode *ip;
 	lgfs2_rgrps_t rgs;
 	uint64_t rgaddr;
 	int error;
@@ -1314,11 +1315,16 @@ int main(int argc, char *argv[])
 		printf("\nStatFS Inode:\n");
 		lgfs2_dinode_print(sbd.md.statfs->i_bh->b_data);
 	}
-	error = build_rindex(&sbd);
-	if (error) {
+	ip = build_rindex(&sbd);
+	if (ip == NULL) {
 		fprintf(stderr, _("Error building '%s': %s\n"), "rindex", strerror(errno));
 		exit(EXIT_FAILURE);
 	}
+	if (opts.debug) {
+		printf("\nResource Index:\n");
+		lgfs2_dinode_print(ip->i_bh->b_data);
+	}
+	inode_put(&ip);
 	if (!opts.quiet) {
 		printf("%s", _("Creating quota file: "));
 		fflush(stdout);
-- 
2.34.1

