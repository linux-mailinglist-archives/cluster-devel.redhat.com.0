Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E2748CBE2
	for <lists+cluster-devel@lfdr.de>; Wed, 12 Jan 2022 20:27:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642015636;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ADhdY2ZsZAeovfOhwGc+Hm71MlOlZZRXryXFA6LmSFE=;
	b=SHPoTtyhlW11ARQmdBKp2P8MyuKe4y027Sp5JeQxfqIDpNr7Tn4m0S+PiDOhZZ6YPgKe3z
	/0DQbgLh2+OkXvj2W8KN08rRl4j2HAeV4HHVc/s2x/mCIVNCDl8jU/ucxQ3JNPKw5ta6ke
	DYxmTQ1M9zgOTWDLV7Cf+6eAwFf36Ks=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-1zo5gWd5Po276A4EkRN0pw-1; Wed, 12 Jan 2022 14:27:13 -0500
X-MC-Unique: 1zo5gWd5Po276A4EkRN0pw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 329FE190B2A5;
	Wed, 12 Jan 2022 19:27:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 229DE60843;
	Wed, 12 Jan 2022 19:27:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0961E180BADA;
	Wed, 12 Jan 2022 19:27:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20CJR93E009328 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 12 Jan 2022 14:27:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DF5F645D6D; Wed, 12 Jan 2022 19:27:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.37.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BE6460657
	for <cluster-devel@redhat.com>; Wed, 12 Jan 2022 19:27:08 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 12 Jan 2022 19:26:40 +0000
Message-Id: <20220112192650.1426415-9-anprice@redhat.com>
In-Reply-To: <20220112192650.1426415-1-anprice@redhat.com>
References: <20220112192650.1426415-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 08/18] libgfs2: Return the inode from
	build_inum()
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
 gfs2/convert/gfs2_convert.c |  5 ++---
 gfs2/fsck/initialize.c      | 25 ++++++++++++-------------
 gfs2/fsck/pass1.c           | 11 ++++++++++-
 gfs2/libgfs2/libgfs2.h      |  2 +-
 gfs2/libgfs2/structures.c   | 14 ++------------
 gfs2/mkfs/main_mkfs.c       |  9 ++++++---
 6 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/gfs2/convert/gfs2_convert.c b/gfs2/convert/gfs2_convert.c
index 0953d2a7..210528c9 100644
--- a/gfs2/convert/gfs2_convert.c
+++ b/gfs2/convert/gfs2_convert.c
@@ -2343,13 +2343,12 @@ int main(int argc, char **argv)
 			exit(-1);
 		}
 		/* Create the empty inode number file */
-		error = build_inum(&sb2); /* Does not do inode_put */
-		if (error) {
+		sb2.md.inum = build_inum(&sb2); /* Does not do inode_put */
+		if (sb2.md.inum == NULL) {
 			log_crit(_("Error building inum inode: %s\n"),
 			         strerror(error));
 			exit(-1);
 		}
-		gfs2_lookupi(sb2.master_dir, "inum", 4, &sb2.md.inum);
 		/* Create the statfs file */
 		error = build_statfs(&sb2); /* Does not do inode_put */
 		if (error) {
diff --git a/gfs2/fsck/initialize.c b/gfs2/fsck/initialize.c
index b9db79b0..a46d3ecb 100644
--- a/gfs2/fsck/initialize.c
+++ b/gfs2/fsck/initialize.c
@@ -504,12 +504,14 @@ static int rebuild_master(struct gfs2_sbd *sdp)
 			exit(FSCK_ERROR);
 		}
 	} else {
-		err = build_inum(sdp);
-		if (err) {
-			log_crit(_("Error %d building inum inode\n"), err);
+		sdp->md.inum = build_inum(sdp);
+		if (sdp->md.inum == NULL) {
+			log_crit(_("Error building inum inode: %s\n"), strerror(errno));
 			exit(FSCK_ERROR);
 		}
-		gfs2_lookupi(sdp->master_dir, "inum", 4, &sdp->md.inum);
+		/* Write the inode but don't free it, to avoid doing an extra lookup */
+		lgfs2_dinode_out(sdp->md.inum, sdp->md.inum->i_bh->b_data);
+		bwrite(sdp->md.inum->i_bh);
 	}
 
 	if (fix_md.statfs) {
@@ -798,17 +800,14 @@ static int init_system_inodes(struct gfs2_sbd *sdp)
 					   "a valid inum file; aborting.\n"));
 				goto fail;
 			}
-			err = build_inum(sdp);
-			if (err) {
-				log_crit(_("Error %d rebuilding inum inode\n"),
-					 err);
+			sdp->md.inum = build_inum(sdp);
+			if (sdp->md.inum == NULL) {
+				log_crit(_("Error rebuilding inum inode: %s\n"), strerror(errno));
 				exit(FSCK_ERROR);
 			}
-			gfs2_lookupi(sdp->master_dir, "inum", 4,
-				     &sdp->md.inum);
-			if (!sdp->md.inum) {
-				log_crit(_("System inum inode was not rebuilt."
-					   " Aborting.\n"));
+			lgfs2_dinode_out(sdp->md.inum, sdp->md.inum->i_bh->b_data);
+			if (bwrite(sdp->md.inum->i_bh) != 0) {
+				log_crit(_("System inum inode was not rebuilt. Aborting.\n"));
 				goto fail;
 			}
 		}
diff --git a/gfs2/fsck/pass1.c b/gfs2/fsck/pass1.c
index a016f2a4..acd9929f 100644
--- a/gfs2/fsck/pass1.c
+++ b/gfs2/fsck/pass1.c
@@ -1619,6 +1619,15 @@ int build_per_node(struct gfs2_sbd *sdp)
 	return 0;
 }
 
+static int fsck_build_inum(struct gfs2_sbd *sdp)
+{
+	struct gfs2_inode *ip = build_inum(sdp);
+	if (ip == NULL)
+		return -1;
+	inode_put(&ip);
+	return 0;
+}
+
 static int check_system_inodes(struct gfs2_sbd *sdp)
 {
 	int journal_count;
@@ -1648,7 +1657,7 @@ static int check_system_inodes(struct gfs2_sbd *sdp)
 		return -1;
 	}
 	if (!sdp->gfs1 &&
-	    check_system_inode(sdp, &sdp->md.inum, "inum", build_inum, 0,
+	    check_system_inode(sdp, &sdp->md.inum, "inum", fsck_build_inum, 0,
 			       sdp->master_dir, 1)) {
 		stack;
 		return -1;
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index a928e1ab..aea2b676 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -777,7 +777,7 @@ extern int lgfs2_sb_write(const struct gfs2_sbd *sdp, int fd);
 extern int build_journal(struct gfs2_sbd *sdp, int j,
 			 struct gfs2_inode *jindex);
 extern struct gfs2_inode *lgfs2_build_jindex(struct gfs2_inode *metafs, struct lgfs2_inum *jnls, size_t nmemb);
-extern int build_inum(struct gfs2_sbd *sdp);
+extern struct gfs2_inode *build_inum(struct gfs2_sbd *sdp);
 extern int build_statfs(struct gfs2_sbd *sdp);
 extern int build_rindex(struct gfs2_sbd *sdp);
 extern int build_quota(struct gfs2_sbd *sdp);
diff --git a/gfs2/libgfs2/structures.c b/gfs2/libgfs2/structures.c
index 1d4635ab..69cce676 100644
--- a/gfs2/libgfs2/structures.c
+++ b/gfs2/libgfs2/structures.c
@@ -350,23 +350,13 @@ struct gfs2_inode *build_quota_change(struct gfs2_inode *per_node, unsigned int
 	return ip;
 }
 
-int build_inum(struct gfs2_sbd *sdp)
+struct gfs2_inode *build_inum(struct gfs2_sbd *sdp)
 {
 	struct gfs2_inode *ip;
 
 	ip = createi(sdp->master_dir, "inum", S_IFREG | 0600,
 		     GFS2_DIF_SYSTEM | GFS2_DIF_JDATA);
-	if (ip == NULL) {
-		return errno;
-	}
-
-	if (cfg_debug) {
-		printf("\nInum Inode:\n");
-		lgfs2_dinode_print(ip->i_bh->b_data);
-	}
-
-	inode_put(&ip);
-	return 0;
+	return ip;
 }
 
 int build_statfs(struct gfs2_sbd *sdp)
diff --git a/gfs2/mkfs/main_mkfs.c b/gfs2/mkfs/main_mkfs.c
index c4415ee3..0aff266f 100644
--- a/gfs2/mkfs/main_mkfs.c
+++ b/gfs2/mkfs/main_mkfs.c
@@ -1296,12 +1296,15 @@ int main(int argc, char *argv[])
 	if (error != 0)
 		exit(1);
 
-	error = build_inum(&sbd);
-	if (error) {
+	sbd.md.inum = build_inum(&sbd);
+	if (sbd.md.inum == NULL) {
 		fprintf(stderr, _("Error building '%s': %s\n"), "inum", strerror(errno));
 		exit(EXIT_FAILURE);
 	}
-	gfs2_lookupi(sbd.master_dir, "inum", 4, &sbd.md.inum);
+	if (opts.debug) {
+		printf("\nInum Inode:\n");
+		lgfs2_dinode_print(sbd.md.inum->i_bh->b_data);
+	}
 	error = build_statfs(&sbd);
 	if (error) {
 		fprintf(stderr, _("Error building '%s': %s\n"), "statfs", strerror(errno));
-- 
2.34.1

