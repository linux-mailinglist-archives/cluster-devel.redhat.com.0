Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3874938D3
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Jan 2022 11:46:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642589204;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+V+NyrYTxIHvrG36wDF1MmelNJ4z6QRPMXZYKhbmZvg=;
	b=dfgFjySL5eWPSE+hSB+LzmLe8oRt/MDe6Qy14rU05RYP1QUR+boTr2IEMixOm8EGGpRJ9/
	38J1GRhBmIkOIQnnfRoY2AzpL5PTggdIYnB+WQw9ZAUjzu5dNCYiuCLStosT0Unye3zc6R
	o/K3eYY8QhYHq3iX7L3JkQhKecDuXUM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-xVSo1o3qN7SDIy0n8wRgcA-1; Wed, 19 Jan 2022 05:46:41 -0500
X-MC-Unique: xVSo1o3qN7SDIy0n8wRgcA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38C3539381;
	Wed, 19 Jan 2022 10:46:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 28F087CAF8;
	Wed, 19 Jan 2022 10:46:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 145611806D2B;
	Wed, 19 Jan 2022 10:46:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20JAhenQ024242 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Jan 2022 05:43:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7B43B78B18; Wed, 19 Jan 2022 10:43:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.37.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD186795A1
	for <cluster-devel@redhat.com>; Wed, 19 Jan 2022 10:43:39 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 19 Jan 2022 10:43:03 +0000
Message-Id: <20220119104316.2489995-9-anprice@redhat.com>
In-Reply-To: <20220119104316.2489995-1-anprice@redhat.com>
References: <20220119104316.2489995-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 08/21] libgfs2: Namespace improvements -
	super.c
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

Use the lgfs2_ prefix in libgfs2 interface names.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/convert/gfs2_convert.c |  2 +-
 gfs2/edit/hexedit.c         |  2 +-
 gfs2/edit/savemeta.c        |  2 +-
 gfs2/fsck/initialize.c      |  6 +++---
 gfs2/fsck/rgrepair.c        |  2 +-
 gfs2/libgfs2/gfs2l.c        |  4 ++--
 gfs2/libgfs2/libgfs2.h      |  8 ++++----
 gfs2/libgfs2/super.c        | 14 +++++++-------
 gfs2/mkfs/main_grow.c       |  2 +-
 tests/nukerg.c              |  2 +-
 10 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/gfs2/convert/gfs2_convert.c b/gfs2/convert/gfs2_convert.c
index 1608b1ad..c6b388a6 100644
--- a/gfs2/convert/gfs2_convert.c
+++ b/gfs2/convert/gfs2_convert.c
@@ -1526,7 +1526,7 @@ static int gfs1_ri_update(struct gfs2_sbd *sdp, int *rgcount, int quiet)
 	struct osi_node *n, *next = NULL;
 	int ok;
 
-	if (rindex_read(sdp, &count1, &ok))
+	if (lgfs2_rindex_read(sdp, &count1, &ok))
 		goto fail;
 	for (n = osi_first(&sdp->rgtree); n; n = next) {
 		next = osi_next(n);
diff --git a/gfs2/edit/hexedit.c b/gfs2/edit/hexedit.c
index b0f110c1..fc1b5f4f 100644
--- a/gfs2/edit/hexedit.c
+++ b/gfs2/edit/hexedit.c
@@ -939,7 +939,7 @@ static int read_rindex(void)
 
 	sbd.fssize = sbd.device.length;
 	if (sbd.md.riinode) /* If we found the rindex */
-		rindex_read(&sbd, &count, &ok);
+		lgfs2_rindex_read(&sbd, &count, &ok);
 
 	if (!OSI_EMPTY_ROOT(&sbd.rgtree)) {
 		struct rgrp_tree *rg = (struct rgrp_tree *)osi_last(&sbd.rgtree);
diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index 21c67989..ffb11342 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -1254,7 +1254,7 @@ static int restore_super(struct metafd *mfd, void *buf, int printonly)
 	int ret;
 
 	lgfs2_sb_in(&sbd, buf);
-	ret = check_sb(buf);
+	ret = lgfs2_check_sb(buf);
 	if (ret < 0) {
 		fprintf(stderr, "Error: Invalid superblock in metadata file.\n");
 		return -1;
diff --git a/gfs2/fsck/initialize.c b/gfs2/fsck/initialize.c
index 18522a35..2740fa7d 100644
--- a/gfs2/fsck/initialize.c
+++ b/gfs2/fsck/initialize.c
@@ -721,7 +721,7 @@ static int fetch_rgrps_level(struct gfs2_sbd *sdp, enum rgindex_trust_level lvl,
 	if (rindex_repair(sdp, lvl, ok) != 0)
 		goto fail;
 
-	if (rindex_read(sdp, count, ok) != 0 || !*ok)
+	if (lgfs2_rindex_read(sdp, count, ok) != 0 || !*ok)
 		goto fail;
 
 	ret = read_rgrps(sdp, *count);
@@ -1345,12 +1345,12 @@ static int fill_super_block(struct gfs2_sbd *sdp)
 		log_crit("%s\n", _("Failed to compute file system constants"));
 		return FSCK_ERROR;
 	}
-	ret = read_sb(sdp);
+	ret = lgfs2_read_sb(sdp);
 	if (ret < 0) {
 		if (sb_repair(sdp) != 0)
 			return -1; /* unrepairable, so exit */
 		/* Now that we've tried to repair it, re-read it. */
-		ret = read_sb(sdp);
+		ret = lgfs2_read_sb(sdp);
 		if (ret < 0)
 			return FSCK_ERROR;
 	}
diff --git a/gfs2/fsck/rgrepair.c b/gfs2/fsck/rgrepair.c
index 8c2dd35d..333a77a5 100644
--- a/gfs2/fsck/rgrepair.c
+++ b/gfs2/fsck/rgrepair.c
@@ -999,7 +999,7 @@ int rindex_repair(struct gfs2_sbd *sdp, int trust_lvl, int *ok)
 	}
 	/* Read in the rindex */
 	sdp->rgtree.osi_node = NULL; /* Just to be safe */
-	rindex_read(sdp, &sdp->rgrps, ok);
+	lgfs2_rindex_read(sdp, &sdp->rgrps, ok);
 	if (sdp->md.riinode->i_size % sizeof(struct gfs2_rindex)) {
 		log_warn( _("WARNING: rindex file has an invalid size.\n"));
 		if (!query( _("Truncate the rindex size? (y/n)"))) {
diff --git a/gfs2/libgfs2/gfs2l.c b/gfs2/libgfs2/gfs2l.c
index 2ec4a1a1..a247bed2 100644
--- a/gfs2/libgfs2/gfs2l.c
+++ b/gfs2/libgfs2/gfs2l.c
@@ -132,7 +132,7 @@ static int openfs(const char *path, struct gfs2_sbd *sdp)
 	}
 	fix_device_geometry(sdp);
 
-	ret = read_sb(sdp);
+	ret = lgfs2_read_sb(sdp);
 	if (ret != 0) {
 		perror("Could not read sb");
 		return 1;
@@ -142,7 +142,7 @@ static int openfs(const char *path, struct gfs2_sbd *sdp)
 	lgfs2_lookupi(sdp->master_dir, "rindex", 6, &sdp->md.riinode);
 	sdp->fssize = sdp->device.length;
 	if (sdp->md.riinode) {
-		rindex_read(sdp, &count, &ok);
+		lgfs2_rindex_read(sdp, &count, &ok);
 	} else {
 		perror("Failed to look up rindex");
 		return 1;
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index b204b763..aede5cda 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -778,10 +778,10 @@ extern struct gfs2_inode *lgfs2_build_statfs_change(struct gfs2_inode *per_node,
 extern struct gfs2_inode *lgfs2_build_quota_change(struct gfs2_inode *per_node, unsigned int j);
 
 /* super.c */
-extern int check_sb(void *sbp);
-extern int read_sb(struct gfs2_sbd *sdp);
-extern int rindex_read(struct gfs2_sbd *sdp, uint64_t *rgcount, int *ok);
-extern int write_sb(struct gfs2_sbd *sdp);
+extern int lgfs2_check_sb(void *sbp);
+extern int lgfs2_read_sb(struct gfs2_sbd *sdp);
+extern int lgfs2_rindex_read(struct gfs2_sbd *sdp, uint64_t *rgcount, int *ok);
+extern int lgfs2_write_sb(struct gfs2_sbd *sdp);
 
 /* ondisk.c */
 extern uint32_t gfs2_disk_hash(const char *data, int len);
diff --git a/gfs2/libgfs2/super.c b/gfs2/libgfs2/super.c
index da605ded..c8186b20 100644
--- a/gfs2/libgfs2/super.c
+++ b/gfs2/libgfs2/super.c
@@ -13,7 +13,7 @@
 #include "osi_list.h"
 
 /**
- * check_sb - Check superblock
+ * lgfs2_check_sb - Check superblock
  * @sb: The superblock
  *
  * Checks the version code of the FS is one that we understand how to
@@ -22,7 +22,7 @@
  *
  * Returns: -1 on failure, 1 if this is gfs (gfs1), 2 if this is gfs2
  */
-int check_sb(void *sbp)
+int lgfs2_check_sb(void *sbp)
 {
 	struct gfs2_sb *sb = sbp;
 
@@ -48,7 +48,7 @@ int check_sb(void *sbp)
 
 
 /*
- * read_sb: read the super block from disk
+ * lgfs2_read_sb: read the super block from disk
  * sdp: in-core super block
  *
  * This function reads in the super block from disk and
@@ -58,7 +58,7 @@ int check_sb(void *sbp)
  * Returns: 0 on success, -1 on failure
  * sdp->gfs1 will be set if this is gfs (gfs1)
  */
-int read_sb(struct gfs2_sbd *sdp)
+int lgfs2_read_sb(struct gfs2_sbd *sdp)
 {
 	struct gfs2_buffer_head *bh;
 	uint64_t space = 0;
@@ -67,7 +67,7 @@ int read_sb(struct gfs2_sbd *sdp)
 
 	bh = lgfs2_bread(sdp, GFS2_SB_ADDR >> sdp->sd_fsb2bb_shift);
 
-	ret = check_sb(bh->b_data);
+	ret = lgfs2_check_sb(bh->b_data);
 	if (ret < 0) {
 		lgfs2_brelse(bh);
 		return ret;
@@ -191,14 +191,14 @@ static int good_on_disk(struct gfs2_sbd *sdp, struct rgrp_tree *rgd)
 }
 
 /**
- * rindex_read - read in the rg index file
+ * lgfs2_rindex_read - read in the rg index file
  * @sdp: the incore superblock pointer
  * @rgcount: return count of the rgs.
  * @ok: return whether rindex is consistent
  *
  * Returns: 0 on success, -1 on failure
  */
-int rindex_read(struct gfs2_sbd *sdp, uint64_t *rgcount, int *ok)
+int lgfs2_rindex_read(struct gfs2_sbd *sdp, uint64_t *rgcount, int *ok)
 {
 	unsigned int rg;
 	int error;
diff --git a/gfs2/mkfs/main_grow.c b/gfs2/mkfs/main_grow.c
index 4ce24c90..298ba2a6 100644
--- a/gfs2/mkfs/main_grow.c
+++ b/gfs2/mkfs/main_grow.c
@@ -398,7 +398,7 @@ int main(int argc, char *argv[])
 			log_crit("%s\n", _("Failed to compute file system constants"));
 			exit(EXIT_FAILURE);
 		}
-		if (read_sb(sdp) < 0) {
+		if (lgfs2_read_sb(sdp) < 0) {
 			fprintf(stderr, _("Error reading superblock.\n"));
 			exit(EXIT_FAILURE);
 		}
diff --git a/tests/nukerg.c b/tests/nukerg.c
index 49bbda74..e24151ef 100644
--- a/tests/nukerg.c
+++ b/tests/nukerg.c
@@ -284,7 +284,7 @@ static int fill_super_block(struct gfs2_sbd *sdp)
 		fprintf(stderr, "Failed to compute file system constants.\n");
 		return 1;
 	}
-	if (read_sb(sdp) != 0) {
+	if (lgfs2_read_sb(sdp) != 0) {
 		perror("Failed to read superblock\n");
 		return 1;
 	}
-- 
2.34.1

