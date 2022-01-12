Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0213E48CBE0
	for <lists+cluster-devel@lfdr.de>; Wed, 12 Jan 2022 20:27:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642015636;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kagvi+Z1h5PVWt1YdV/MuCVPtt4Yh7dr67BrvDbWChY=;
	b=Dl3OJiDYYXc8C112BWVYw1TlcCgkLQg0OutY5WOJTWOScG2eRcDYZP1NeNkQCk9VNUCgx5
	ODWx5zFqVqAIoJy7cwrZhu1enx+Fschh557Rem6OU0ji/wXzCnjlVTvko0R1/+fYvgTt0F
	Gf5i5EsHfwapyicszyC4Xcz4RylXI5Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-465-koO_d0PIPtmtYyngo1iFGw-1; Wed, 12 Jan 2022 14:27:12 -0500
X-MC-Unique: koO_d0PIPtmtYyngo1iFGw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FF4A83DD22;
	Wed, 12 Jan 2022 19:27:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F0696100AE22;
	Wed, 12 Jan 2022 19:27:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 28ED61809CB9;
	Wed, 12 Jan 2022 19:27:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20CJR1dR009263 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 12 Jan 2022 14:27:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 419A72B178; Wed, 12 Jan 2022 19:27:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.37.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F0A660657
	for <cluster-devel@redhat.com>; Wed, 12 Jan 2022 19:27:00 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 12 Jan 2022 19:26:34 +0000
Message-Id: <20220112192650.1426415-3-anprice@redhat.com>
In-Reply-To: <20220112192650.1426415-1-anprice@redhat.com>
References: <20220112192650.1426415-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 02/18] libgfs2: Rework lgfs2_build_jindex()
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Return the inode instead of freeing it and move the debug printfs out of
libgfs2.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/libgfs2/libgfs2.h    |  2 +-
 gfs2/libgfs2/structures.c | 23 ++++++++---------------
 gfs2/mkfs/main_mkfs.c     | 27 ++++++++++++++++++++++-----
 3 files changed, 31 insertions(+), 21 deletions(-)

diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index 04e6ec0f..990a9d9e 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -777,7 +777,7 @@ extern int lgfs2_sb_write(const struct gfs2_sbd *sdp, int fd);
 extern int build_journal(struct gfs2_sbd *sdp, int j,
 			 struct gfs2_inode *jindex);
 extern int build_jindex(struct gfs2_sbd *sdp);
-extern int lgfs2_build_jindex(struct gfs2_inode *master, struct lgfs2_inum *jnls, size_t nmemb);
+extern struct gfs2_inode *lgfs2_build_jindex(struct gfs2_inode *metafs, struct lgfs2_inum *jnls, size_t nmemb);
 extern int build_per_node(struct gfs2_sbd *sdp);
 extern int build_inum(struct gfs2_sbd *sdp);
 extern int build_statfs(struct gfs2_sbd *sdp);
diff --git a/gfs2/libgfs2/structures.c b/gfs2/libgfs2/structures.c
index 95ad3ac9..de36c4e3 100644
--- a/gfs2/libgfs2/structures.c
+++ b/gfs2/libgfs2/structures.c
@@ -251,39 +251,32 @@ int build_journal(struct gfs2_sbd *sdp, int j, struct gfs2_inode *jindex)
  * nmemb: The number of entries in the list (number of journals).
  * Returns 0 on success or non-zero on error with errno set.
  */
-int lgfs2_build_jindex(struct gfs2_inode *master, struct lgfs2_inum *jnls, size_t nmemb)
+struct gfs2_inode *lgfs2_build_jindex(struct gfs2_inode *master, struct lgfs2_inum *jnls, size_t nmemb)
 {
 	char fname[GFS2_FNAMESIZE + 1];
 	struct gfs2_inode *jindex;
-	unsigned j;
-	int ret;
 
 	if (nmemb == 0 || jnls == NULL) {
 		errno = EINVAL;
-		return 1;
+		return NULL;
 	}
 	jindex = createi(master, "jindex", S_IFDIR | 0700, GFS2_DIF_SYSTEM);
 	if (jindex == NULL)
-		return 1;
+		return NULL;
 
 	fname[GFS2_FNAMESIZE] = '\0';
 
-	for (j = 0; j < nmemb; j++) {
+	for (unsigned j = 0; j < nmemb; j++) {
+		int ret;
+
 		snprintf(fname, GFS2_FNAMESIZE, "journal%u", j);
 		ret = dir_add(jindex, fname, strlen(fname), &jnls[j], IF2DT(S_IFREG | 0600));
 		if (ret) {
 			inode_put(&jindex);
-			return 1;
+			return NULL;
 		}
 	}
-
-	if (cfg_debug) {
-		printf("\nJindex:\n");
-		lgfs2_dinode_print(jindex->i_bh->b_data);
-	}
-
-	inode_put(&jindex);
-	return 0;
+	return jindex;
 }
 
 int build_jindex(struct gfs2_sbd *sdp)
diff --git a/gfs2/mkfs/main_mkfs.c b/gfs2/mkfs/main_mkfs.c
index dbee5cab..17284976 100644
--- a/gfs2/mkfs/main_mkfs.c
+++ b/gfs2/mkfs/main_mkfs.c
@@ -941,6 +941,24 @@ static int place_rgrps(struct gfs2_sbd *sdp, lgfs2_rgrps_t rgs, uint64_t *rgaddr
 	return 0;
 }
 
+static int create_jindex(struct gfs2_sbd *sdp, struct mkfs_opts *opts, struct lgfs2_inum *jnls)
+{
+	struct gfs2_inode *jindex;
+
+	jindex = lgfs2_build_jindex(sdp->master_dir, jnls, opts->journals);
+	if (jindex == NULL) {
+		fprintf(stderr, _("Error building '%s': %s\n"), "jindex", strerror(errno));
+		return 1;
+	}
+	if (opts->debug) {
+		printf("Jindex:\n");
+		lgfs2_dinode_print(jindex->i_bh->b_data);
+	}
+	inode_put(&jindex);
+	return 0;
+}
+
+
 /*
  * Find a reasonable journal file size (in blocks) given the number of blocks
  * in the filesystem.  For very small filesystems, it is not reasonable to
@@ -1211,12 +1229,11 @@ int main(int argc, char *argv[])
 	}
 	sbd.sd_meta_dir = sbd.master_dir->i_num;
 
-	error = lgfs2_build_jindex(sbd.master_dir, mkfs_journals, opts.journals);
-	if (error) {
-		fprintf(stderr, _("Error building '%s': %s\n"), "jindex", strerror(errno));
-		exit(EXIT_FAILURE);
-	}
+	error = create_jindex(&sbd, &opts, mkfs_journals);
 	free(mkfs_journals);
+	if (error != 0)
+		exit(1);
+
 	error = build_per_node(&sbd);
 	if (error) {
 		fprintf(stderr, _("Error building '%s': %s\n"), "per_node", strerror(errno));
-- 
2.34.1

