Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3E21CDD6D
	for <lists+cluster-devel@lfdr.de>; Mon, 11 May 2020 16:41:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589208104;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/mPcV5qfHKhfuLz1y2zxR1NudfMp7lzwO33jZjRMOoA=;
	b=QZDuMJrMbUibDQOt21YhpCtEvuagZFXyRNF9qLK6suJ+NCo2mYhpddd1SrnEMai/20F+0i
	gsvty9qbxBgSVpdub87+v0+eX8fTpYbnpEaPNGF7eRFejLAQXjuC7T1nrjo9bRQ8COWbHL
	t6f2v+RZASO1fhyBE3hfMslzjz3/DSs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-twDK1s91Nfu3lpPJoh9D4Q-1; Mon, 11 May 2020 10:41:40 -0400
X-MC-Unique: twDK1s91Nfu3lpPJoh9D4Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 998F01054F99;
	Mon, 11 May 2020 14:41:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C58E6199D;
	Mon, 11 May 2020 14:41:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 06B224CAA7;
	Mon, 11 May 2020 14:41:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04BEfXeq005585 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 11 May 2020 10:41:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CD2BE60CD1; Mon, 11 May 2020 14:41:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.212])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 92BD160BF4
	for <cluster-devel@redhat.com>; Mon, 11 May 2020 14:41:32 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 11 May 2020 15:41:21 +0100
Message-Id: <20200511144125.350891-2-anprice@redhat.com>
In-Reply-To: <20200511144125.350891-1-anprice@redhat.com>
References: <20200511144125.350891-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 1/5] libgfs2: Don't use bh's in
	gfs_rgrp_in/out
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/extended.c    | 14 ++++++++------
 gfs2/edit/hexedit.c     |  4 ++--
 gfs2/edit/savemeta.c    |  2 +-
 gfs2/fsck/fs_recovery.c |  3 +--
 gfs2/fsck/initialize.c  | 15 ++++++++-------
 gfs2/fsck/metawalk.c    |  2 +-
 gfs2/fsck/pass5.c       |  2 +-
 gfs2/fsck/rgrepair.c    |  2 +-
 gfs2/libgfs2/fs_ops.c   |  6 +++---
 gfs2/libgfs2/gfs1.c     | 19 ++++++-------------
 gfs2/libgfs2/libgfs2.h  |  6 +++---
 gfs2/libgfs2/ondisk.c   |  4 ++--
 gfs2/libgfs2/rgrp.c     |  2 +-
 13 files changed, 38 insertions(+), 43 deletions(-)

diff --git a/gfs2/edit/extended.c b/gfs2/edit/extended.c
index f38fc7bf..0e5ecda4 100644
--- a/gfs2/edit/extended.c
+++ b/gfs2/edit/extended.c
@@ -554,19 +554,21 @@ static int parse_rindex(struct gfs2_inode *dip, int print_rindex)
 			if(print_rindex)
 				gfs2_rindex_print(&ri);
 			else {
-				struct gfs2_buffer_head *tmp_bh;
+				char buf[sizeof(struct gfs2_rgrp)] = {0};
+				ssize_t ret;
 
-				tmp_bh = bread(&sbd, ri.ri_addr);
-				if (sbd.gfs1) {
+				ret = pread(sbd.device_fd, buf, sizeof(buf), ri.ri_addr * sbd.bsize);
+				if (ret != sizeof(buf)) {
+					perror("Failed to read resource group");
+				} else if (sbd.gfs1) {
 					struct gfs_rgrp rg1;
-					gfs_rgrp_in(&rg1, tmp_bh);
+					gfs_rgrp_in(&rg1, buf);
 					gfs_rgrp_print(&rg1);
 				} else {
 					struct gfs2_rgrp rg;
-					gfs2_rgrp_in(&rg, tmp_bh->b_data);
+					gfs2_rgrp_in(&rg, buf);
 					gfs2_rgrp_print(&rg);
 				}
-				brelse(tmp_bh);
 			}
 			last_entry_onscreen[dmode] = print_entry_ndx;
 		}
diff --git a/gfs2/edit/hexedit.c b/gfs2/edit/hexedit.c
index 655afc5c..ff357fc0 100644
--- a/gfs2/edit/hexedit.c
+++ b/gfs2/edit/hexedit.c
@@ -850,7 +850,7 @@ static void set_rgrp_flags(int rgnum, uint32_t new_flags, int modify, int full)
 	rgblk = get_rg_addr(rgnum);
 	rbh = bread(&sbd, rgblk);
 	if (sbd.gfs1)
-		gfs_rgrp_in(&rg.rg1, rbh);
+		gfs_rgrp_in(&rg.rg1, rbh->b_data);
 	else
 		gfs2_rgrp_in(&rg.rg2, rbh->b_data);
 	if (modify) {
@@ -859,7 +859,7 @@ static void set_rgrp_flags(int rgnum, uint32_t new_flags, int modify, int full)
 		       (unsigned long long)rgblk, rg.rg2.rg_flags, new_flags);
 		rg.rg2.rg_flags = new_flags;
 		if (sbd.gfs1)
-			gfs_rgrp_out(&rg.rg1, rbh);
+			gfs_rgrp_out(&rg.rg1, rbh->b_data);
 		else
 			gfs2_rgrp_out(&rg.rg2, rbh->b_data);
 		bmodified(rbh);
diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index 63cb91af..846b6150 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -914,7 +914,7 @@ static int rgrp_read(struct gfs2_sbd *sdp, struct rgrp_tree *rgd)
 		rgd->bits[x].bi_bh = bhs[x];
 
 	if (sdp->gfs1)
-		gfs_rgrp_in((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_bh);
+		gfs_rgrp_in((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_bh->b_data);
 	else
 		gfs2_rgrp_in(&rgd->rg, rgd->bits[0].bi_bh->b_data);
 	free(bhs);
diff --git a/gfs2/fsck/fs_recovery.c b/gfs2/fsck/fs_recovery.c
index 84cd4cc9..0e029db0 100644
--- a/gfs2/fsck/fs_recovery.c
+++ b/gfs2/fsck/fs_recovery.c
@@ -111,8 +111,7 @@ static void refresh_rgrp(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
 		bmodified(rgd->bits[i].bi_bh);
 		if (i == 0) { /* this is the rgrp itself */
 			if (sdp->gfs1)
-				gfs_rgrp_in((struct gfs_rgrp *)&rgd->rg,
-					    rgd->bits[0].bi_bh);
+				gfs_rgrp_in((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_bh->b_data);
 			else
 				gfs2_rgrp_in(&rgd->rg, rgd->bits[0].bi_bh->b_data);
 		}
diff --git a/gfs2/fsck/initialize.c b/gfs2/fsck/initialize.c
index ed6954d9..374117b7 100644
--- a/gfs2/fsck/initialize.c
+++ b/gfs2/fsck/initialize.c
@@ -324,7 +324,7 @@ static void check_rgrp_integrity(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
 	   will be reported. */
 	if (rg_reclaimed && *fixit) {
 		if (sdp->gfs1)
-			gfs_rgrp_out((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_bh);
+			gfs_rgrp_out((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_bh->b_data);
 		else
 			gfs2_rgrp_out(&rgd->rg, rgd->bits[0].bi_bh->b_data);
 		bmodified(rgd->bits[0].bi_bh);
@@ -346,7 +346,7 @@ static void check_rgrp_integrity(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
 		if (query( _("Fix the rgrp free blocks count? (y/n)"))) {
 			rgd->rg.rg_free = rg_free;
 			if (sdp->gfs1)
-				gfs_rgrp_out((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_bh);
+				gfs_rgrp_out((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_bh->b_data);
 			else
 				gfs2_rgrp_out(&rgd->rg, rgd->bits[0].bi_bh->b_data);
 			bmodified(rgd->bits[0].bi_bh);
@@ -368,7 +368,8 @@ static void check_rgrp_integrity(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
 			 gfs1rg->rg_freemeta, rg_unlinked);
 		if (query( _("Fix the rgrp free meta blocks count? (y/n)"))) {
 			gfs1rg->rg_freemeta = rg_unlinked;
-			gfs_rgrp_out((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_bh);
+			gfs_rgrp_out((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_bh->b_data);
+			bmodified(rgd->bits[0].bi_bh);
 			*this_rg_fixed = 1;
 			log_err( _("The rgrp was fixed.\n"));
 		} else
@@ -384,8 +385,8 @@ static void check_rgrp_integrity(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
 			 gfs1rg->rg_useddi, rg_useddi);
 		if (query( _("Fix the rgrp used dinode block count? (y/n)"))) {
 			gfs1rg->rg_useddi = rg_useddi;
-			gfs_rgrp_out((struct gfs_rgrp *)&rgd->rg,
-				     rgd->bits[0].bi_bh);
+			gfs_rgrp_out((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_bh->b_data);
+			bmodified(rgd->bits[0].bi_bh);
 			*this_rg_fixed = 1;
 			log_err( _("The rgrp was fixed.\n"));
 		} else
@@ -401,8 +402,8 @@ static void check_rgrp_integrity(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
 			 gfs1rg->rg_usedmeta, rg_usedmeta);
 		if (query( _("Fix the rgrp used meta blocks count? (y/n)"))) {
 			gfs1rg->rg_usedmeta = rg_usedmeta;
-			gfs_rgrp_out((struct gfs_rgrp *)&rgd->rg,
-				     rgd->bits[0].bi_bh);
+			gfs_rgrp_out((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_bh->b_data);
+			bmodified(rgd->bits[0].bi_bh);
 			*this_rg_fixed = 1;
 			log_err( _("The rgrp was fixed.\n"));
 		} else
diff --git a/gfs2/fsck/metawalk.c b/gfs2/fsck/metawalk.c
index d8bc211c..8729d488 100644
--- a/gfs2/fsck/metawalk.c
+++ b/gfs2/fsck/metawalk.c
@@ -155,7 +155,7 @@ int check_n_fix_bitmap(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
 	}
 	if (rewrite_rgrp) {
 		if (sdp->gfs1)
-			gfs_rgrp_out((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_bh);
+			gfs_rgrp_out((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_bh->b_data);
 		else
 			gfs2_rgrp_out(&rgd->rg, rgd->bits[0].bi_bh->b_data);
 		bmodified(rgd->bits[0].bi_bh);
diff --git a/gfs2/fsck/pass5.c b/gfs2/fsck/pass5.c
index d284ab57..8e3f37c1 100644
--- a/gfs2/fsck/pass5.c
+++ b/gfs2/fsck/pass5.c
@@ -201,7 +201,7 @@ static void update_rgrp(struct gfs2_sbd *sdp, struct rgrp_tree *rgp,
 			log_warn( _("Resource group counts updated\n"));
 			/* write out the rgrp */
 			if (sdp->gfs1)
-				gfs_rgrp_out(gfs1rg, rgp->bits[0].bi_bh);
+				gfs_rgrp_out(gfs1rg, rgp->bits[0].bi_bh->b_data);
 			else
 				gfs2_rgrp_out(&rgp->rg, rgp->bits[0].bi_bh->b_data);
 		} else
diff --git a/gfs2/fsck/rgrepair.c b/gfs2/fsck/rgrepair.c
index ac44efd2..97d3a907 100644
--- a/gfs2/fsck/rgrepair.c
+++ b/gfs2/fsck/rgrepair.c
@@ -909,7 +909,7 @@ static int rewrite_rg_block(struct gfs2_sbd *sdp, struct rgrp_tree *rg,
 			rg->rg.rg_header.mh_format = GFS2_FORMAT_RG;
 			rg->rg.rg_free = rg->ri.ri_data;
 			if (sdp->gfs1)
-				gfs_rgrp_out((struct gfs_rgrp *)&rg->rg, rg->bits[x].bi_bh);
+				gfs_rgrp_out((struct gfs_rgrp *)&rg->rg, rg->bits[x].bi_bh->b_data);
 			else
 				gfs2_rgrp_out(&rg->rg, rg->bits[x].bi_bh->b_data);
 		}
diff --git a/gfs2/libgfs2/fs_ops.c b/gfs2/libgfs2/fs_ops.c
index 0acd59bf..b2ea0036 100644
--- a/gfs2/libgfs2/fs_ops.c
+++ b/gfs2/libgfs2/fs_ops.c
@@ -156,7 +156,7 @@ static int blk_alloc_in_rg(struct gfs2_sbd *sdp, unsigned state, struct rgrp_tre
 
 	rgd->rg.rg_free--;
 	if (sdp->gfs1)
-		gfs_rgrp_out((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_bh);
+		gfs_rgrp_out((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_bh->b_data);
 	else
 		gfs2_rgrp_out(&rgd->rg, rgd->bits[0].bi_bh->b_data);
 	bmodified(rgd->bits[0].bi_bh);
@@ -1928,7 +1928,7 @@ void gfs2_free_block(struct gfs2_sbd *sdp, uint64_t block)
 		gfs2_set_bitmap(rgd, block, GFS2_BLKST_FREE);
 		rgd->rg.rg_free++; /* adjust the free count */
 		if (sdp->gfs1)
-			gfs_rgrp_out((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_bh);
+			gfs_rgrp_out((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_bh->b_data);
 		else
 			gfs2_rgrp_out(&rgd->rg, rgd->bits[0].bi_bh->b_data);
 		bmodified(rgd->bits[0].bi_bh);
@@ -1998,7 +1998,7 @@ int gfs2_freedi(struct gfs2_sbd *sdp, uint64_t diblock)
 	rgd->rg.rg_free++;
 	rgd->rg.rg_dinodes--;
 	if (sdp->gfs1)
-		gfs_rgrp_out((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_bh);
+		gfs_rgrp_out((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_bh->b_data);
 	else
 		gfs2_rgrp_out(&rgd->rg, rgd->bits[0].bi_bh->b_data);
 	bmodified(rgd->bits[0].bi_bh);
diff --git a/gfs2/libgfs2/gfs1.c b/gfs2/libgfs2/gfs1.c
index b91cce5e..16c183b5 100644
--- a/gfs2/libgfs2/gfs1.c
+++ b/gfs2/libgfs2/gfs1.c
@@ -351,14 +351,11 @@ void gfs_jindex_in(struct gfs_jindex *jindex, char *jbuf)
 	memcpy(jindex->ji_reserved, str->ji_reserved, 64);
 }
 
-/* ------------------------------------------------------------------------ */
-/* gfs_rgrp_in - Read in a resource group header                            */
-/* ------------------------------------------------------------------------ */
-void gfs_rgrp_in(struct gfs_rgrp *rgrp, struct gfs2_buffer_head *rbh)
+void gfs_rgrp_in(struct gfs_rgrp *rgrp, const char *buf)
 {
-	struct gfs_rgrp *str = (struct gfs_rgrp *)rbh->b_data;
+	struct gfs_rgrp *str = (struct gfs_rgrp *)buf;
 
-	gfs2_meta_header_in(&rgrp->rg_header, rbh->b_data);
+	gfs2_meta_header_in(&rgrp->rg_header, buf);
 	rgrp->rg_flags = be32_to_cpu(str->rg_flags);
 	rgrp->rg_free = be32_to_cpu(str->rg_free);
 	rgrp->rg_useddi = be32_to_cpu(str->rg_useddi);
@@ -370,14 +367,11 @@ void gfs_rgrp_in(struct gfs_rgrp *rgrp, struct gfs2_buffer_head *rbh)
 	memcpy(rgrp->rg_reserved, str->rg_reserved, 64);
 }
 
-/* ------------------------------------------------------------------------ */
-/* gfs_rgrp_out */
-/* ------------------------------------------------------------------------ */
-void gfs_rgrp_out(struct gfs_rgrp *rgrp, struct gfs2_buffer_head *rbh)
+void gfs_rgrp_out(const struct gfs_rgrp *rgrp, char *buf)
 {
-	struct gfs_rgrp *str = (struct gfs_rgrp *)rbh->b_data;
+	struct gfs_rgrp *str = (struct gfs_rgrp *)buf;
 
-	gfs2_meta_header_out(&rgrp->rg_header, rbh->b_data);
+	gfs2_meta_header_out(&rgrp->rg_header, buf);
 	str->rg_flags = cpu_to_be32(rgrp->rg_flags);
 	str->rg_free = cpu_to_be32(rgrp->rg_free);
 	str->rg_useddi = cpu_to_be32(rgrp->rg_useddi);
@@ -387,5 +381,4 @@ void gfs_rgrp_out(struct gfs_rgrp *rgrp, struct gfs2_buffer_head *rbh)
 	str->rg_freemeta = cpu_to_be32(rgrp->rg_freemeta);
 
 	memcpy(str->rg_reserved, rgrp->rg_reserved, 64);
-	bmodified(rbh);
 }
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index fc0afed0..0f2ddf47 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -643,8 +643,8 @@ extern struct gfs2_inode *lgfs2_gfs_inode_get(struct gfs2_sbd *sdp,
 extern struct gfs2_inode *lgfs2_gfs_inode_read(struct gfs2_sbd *sdp,
 					 uint64_t di_addr);
 extern void gfs_jindex_in(struct gfs_jindex *jindex, char *buf);
-extern void gfs_rgrp_in(struct gfs_rgrp *rg, struct gfs2_buffer_head *bh);
-extern void gfs_rgrp_out(struct gfs_rgrp *rg, struct gfs2_buffer_head *bh);
+extern void gfs_rgrp_in(struct gfs_rgrp *rg, const char *buf);
+extern void gfs_rgrp_out(const struct gfs_rgrp *rg, char *buf);
 
 /* misc.c */
 extern int compute_heightsize(unsigned bsize, uint64_t *heightsize,
@@ -723,7 +723,7 @@ extern void print_it(const char *label, const char *fmt, const char *fmt2, ...)
 
 extern void gfs2_inum_in(struct gfs2_inum *no, char *buf);
 extern void gfs2_inum_out(const struct gfs2_inum *no, char *buf);
-extern void gfs2_meta_header_in(struct gfs2_meta_header *mh, char *buf);
+extern void gfs2_meta_header_in(struct gfs2_meta_header *mh, const char *buf);
 extern void gfs2_meta_header_out(const struct gfs2_meta_header *mh, char *buf);
 extern void gfs2_sb_in(struct gfs2_sb *sb, char *buf);
 extern void gfs2_sb_out(const struct gfs2_sb *sb, char *buf);
diff --git a/gfs2/libgfs2/ondisk.c b/gfs2/libgfs2/ondisk.c
index 648a9142..b7b47deb 100644
--- a/gfs2/libgfs2/ondisk.c
+++ b/gfs2/libgfs2/ondisk.c
@@ -64,9 +64,9 @@ void gfs2_inum_print(const struct gfs2_inum *no)
 	pv(no, no_addr, "%llu", "0x%llx");
 }
 
-void gfs2_meta_header_in(struct gfs2_meta_header *mh, char *buf)
+void gfs2_meta_header_in(struct gfs2_meta_header *mh, const char *buf)
 {
-	struct gfs2_meta_header *str = (struct gfs2_meta_header *)buf;
+	const struct gfs2_meta_header *str = (struct gfs2_meta_header *)buf;
 
 	CPIN_32(mh, str, mh_magic);
 	CPIN_32(mh, str, mh_type);
diff --git a/gfs2/libgfs2/rgrp.c b/gfs2/libgfs2/rgrp.c
index bd69301f..164b3415 100644
--- a/gfs2/libgfs2/rgrp.c
+++ b/gfs2/libgfs2/rgrp.c
@@ -232,7 +232,7 @@ uint64_t gfs2_rgrp_read(struct gfs2_sbd *sdp, struct rgrp_tree *rgd)
 		}
 	}
 	if (sdp->gfs1)
-		gfs_rgrp_in((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_bh);
+		gfs_rgrp_in((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_bh->b_data);
 	else {
 		if (lgfs2_rgrp_crc_check(rgd->bits[0].bi_bh->b_data)) {
 			free(bhs);
-- 
2.26.2

