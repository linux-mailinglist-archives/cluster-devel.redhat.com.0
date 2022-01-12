Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD8248CBE6
	for <lists+cluster-devel@lfdr.de>; Wed, 12 Jan 2022 20:27:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642015639;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oioRMSI6s2IcJjC1b90Q6t0IEfuDyLqT2Aj1Q2aWUR8=;
	b=R5fc4SF6isS/XMDhsg41csmsjuM3NGAhjeJBSxORdrxYY1i1S35qMigYx82cXiQzI1ywR0
	X+LSgSJrBeDtn6g82krsVyxj35KAnxsOkIoEmonP66Sg0HN6N/Y1pfOC2w2K5HUD/PinmW
	CZRjVI6acxyj8csc8DMRLpF88fAYcxo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-6eClQCt1Mf-J5I-9rTUCkQ-1; Wed, 12 Jan 2022 14:27:16 -0500
X-MC-Unique: 6eClQCt1Mf-J5I-9rTUCkQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52552190B2A0;
	Wed, 12 Jan 2022 19:27:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4403760C9D;
	Wed, 12 Jan 2022 19:27:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2D3744A7C9;
	Wed, 12 Jan 2022 19:27:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20CJRCGY009340 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 12 Jan 2022 14:27:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4E8DA2B178; Wed, 12 Jan 2022 19:27:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.37.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 345BD60BD8
	for <cluster-devel@redhat.com>; Wed, 12 Jan 2022 19:27:10 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 12 Jan 2022 19:26:41 +0000
Message-Id: <20220112192650.1426415-10-anprice@redhat.com>
In-Reply-To: <20220112192650.1426415-1-anprice@redhat.com>
References: <20220112192650.1426415-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 09/18] libgfs2: Return the inode from
	build_statfs()
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
 gfs2/convert/gfs2_convert.c |  5 ++---
 gfs2/fsck/initialize.c      | 16 +++++++++-------
 gfs2/fsck/pass1.c           | 11 ++++++++++-
 gfs2/libgfs2/libgfs2.h      |  2 +-
 gfs2/libgfs2/structures.c   | 14 ++------------
 gfs2/mkfs/main_mkfs.c       |  9 ++++++---
 6 files changed, 30 insertions(+), 27 deletions(-)

diff --git a/gfs2/convert/gfs2_convert.c b/gfs2/convert/gfs2_convert.c
index 210528c9..93c9755b 100644
--- a/gfs2/convert/gfs2_convert.c
+++ b/gfs2/convert/gfs2_convert.c
@@ -2350,13 +2350,12 @@ int main(int argc, char **argv)
 			exit(-1);
 		}
 		/* Create the statfs file */
-		error = build_statfs(&sb2); /* Does not do inode_put */
-		if (error) {
+		sb2.md.statfs = build_statfs(&sb2); /* Does not do inode_put */
+		if (sb2.md.statfs == NULL) {
 			log_crit(_("Error building statfs inode: %s\n"),
 			         strerror(error));
 			exit(-1);
 		}
-		gfs2_lookupi(sb2.master_dir, "statfs", 6, &sb2.md.statfs);
 		do_init_statfs(&sb2);
 
 		/* Create the resource group index file */
diff --git a/gfs2/fsck/initialize.c b/gfs2/fsck/initialize.c
index a46d3ecb..bb2bcfb7 100644
--- a/gfs2/fsck/initialize.c
+++ b/gfs2/fsck/initialize.c
@@ -524,12 +524,14 @@ static int rebuild_master(struct gfs2_sbd *sdp)
 			exit(FSCK_ERROR);
 		}
 	} else {
-		err = build_statfs(sdp);
-		if (err) {
+		sdp->md.statfs = build_statfs(sdp);
+		if (sdp->md.statfs == NULL) {
 			log_crit(_("Error %d building statfs inode\n"), err);
 			exit(FSCK_ERROR);
 		}
-		gfs2_lookupi(sdp->master_dir, "statfs", 6, &sdp->md.statfs);
+		/* Write the inode but don't free it, to avoid doing an extra lookup */
+		lgfs2_dinode_out(sdp->md.statfs, sdp->md.statfs->i_bh->b_data);
+		bwrite(sdp->md.statfs->i_bh);
 	}
 
 	if (fix_md.riinode) {
@@ -851,13 +853,13 @@ static int init_system_inodes(struct gfs2_sbd *sdp)
 				   "statfs file; aborting.\n"));
 			goto fail;
 		}
-		err = build_statfs(sdp);
-		if (err) {
+		sdp->md.statfs = build_statfs(sdp);
+		if (sdp->md.statfs == NULL) {
 			log_crit(_("Error %d rebuilding statfs inode\n"), err);
 			exit(FSCK_ERROR);
 		}
-		gfs2_lookupi(sdp->master_dir, "statfs", 6, &sdp->md.statfs);
-		if (!sdp->md.statfs) {
+		lgfs2_dinode_out(sdp->md.statfs, sdp->md.statfs->i_bh->b_data);
+		if (bwrite(sdp->md.statfs->i_bh) != 0) {
 			log_err( _("Rebuild of statfs system file failed."));
 			log_err( _("fsck.gfs2 cannot continue without "
 				   "a valid statfs file; aborting.\n"));
diff --git a/gfs2/fsck/pass1.c b/gfs2/fsck/pass1.c
index acd9929f..b19292eb 100644
--- a/gfs2/fsck/pass1.c
+++ b/gfs2/fsck/pass1.c
@@ -1628,6 +1628,15 @@ static int fsck_build_inum(struct gfs2_sbd *sdp)
 	return 0;
 }
 
+static int fsck_build_statfs(struct gfs2_sbd *sdp)
+{
+	struct gfs2_inode *ip = build_statfs(sdp);
+	if (ip == NULL)
+		return -1;
+	inode_put(&ip);
+	return 0;
+}
+
 static int check_system_inodes(struct gfs2_sbd *sdp)
 {
 	int journal_count;
@@ -1662,7 +1671,7 @@ static int check_system_inodes(struct gfs2_sbd *sdp)
 		stack;
 		return -1;
 	}
-	if (check_system_inode(sdp, &sdp->md.statfs, "statfs", build_statfs, 0,
+	if (check_system_inode(sdp, &sdp->md.statfs, "statfs", fsck_build_statfs, 0,
 			       sdp->master_dir, !sdp->gfs1)) {
 		stack;
 		return -1;
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index aea2b676..83fc90ce 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -778,7 +778,7 @@ extern int build_journal(struct gfs2_sbd *sdp, int j,
 			 struct gfs2_inode *jindex);
 extern struct gfs2_inode *lgfs2_build_jindex(struct gfs2_inode *metafs, struct lgfs2_inum *jnls, size_t nmemb);
 extern struct gfs2_inode *build_inum(struct gfs2_sbd *sdp);
-extern int build_statfs(struct gfs2_sbd *sdp);
+extern struct gfs2_inode *build_statfs(struct gfs2_sbd *sdp);
 extern int build_rindex(struct gfs2_sbd *sdp);
 extern int build_quota(struct gfs2_sbd *sdp);
 extern int build_root(struct gfs2_sbd *sdp);
diff --git a/gfs2/libgfs2/structures.c b/gfs2/libgfs2/structures.c
index 69cce676..f790adcc 100644
--- a/gfs2/libgfs2/structures.c
+++ b/gfs2/libgfs2/structures.c
@@ -359,23 +359,13 @@ struct gfs2_inode *build_inum(struct gfs2_sbd *sdp)
 	return ip;
 }
 
-int build_statfs(struct gfs2_sbd *sdp)
+struct gfs2_inode *build_statfs(struct gfs2_sbd *sdp)
 {
 	struct gfs2_inode *ip;
 
 	ip = createi(sdp->master_dir, "statfs", S_IFREG | 0600,
 		     GFS2_DIF_SYSTEM | GFS2_DIF_JDATA);
-	if (ip == NULL) {
-		return errno;
-	}
-
-	if (cfg_debug) {
-		printf("\nStatFS Inode:\n");
-		lgfs2_dinode_print(ip->i_bh->b_data);
-	}
-
-	inode_put(&ip);
-	return 0;
+	return ip;
 }
 
 int build_rindex(struct gfs2_sbd *sdp)
diff --git a/gfs2/mkfs/main_mkfs.c b/gfs2/mkfs/main_mkfs.c
index 0aff266f..647c969b 100644
--- a/gfs2/mkfs/main_mkfs.c
+++ b/gfs2/mkfs/main_mkfs.c
@@ -1305,12 +1305,15 @@ int main(int argc, char *argv[])
 		printf("\nInum Inode:\n");
 		lgfs2_dinode_print(sbd.md.inum->i_bh->b_data);
 	}
-	error = build_statfs(&sbd);
-	if (error) {
+	sbd.md.statfs = build_statfs(&sbd);
+	if (sbd.md.statfs == NULL) {
 		fprintf(stderr, _("Error building '%s': %s\n"), "statfs", strerror(errno));
 		exit(EXIT_FAILURE);
 	}
-	gfs2_lookupi(sbd.master_dir, "statfs", 6, &sbd.md.statfs);
+	if (opts.debug) {
+		printf("\nStatFS Inode:\n");
+		lgfs2_dinode_print(sbd.md.statfs->i_bh->b_data);
+	}
 	error = build_rindex(&sbd);
 	if (error) {
 		fprintf(stderr, _("Error building '%s': %s\n"), "rindex", strerror(errno));
-- 
2.34.1

