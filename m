Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C476B23DADE
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Aug 2020 15:38:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596721122;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XuACeeJ8bw48jpsrgsljEikcn/OpxohYE2sgRRMIEJY=;
	b=cTKGSohXWwETRwUjHWzgHX4t81YamceBQb1rQOAD6fkv36HHOubefFNKr+tfkUhtnvRnxh
	QmaFM2+0V6gHZEhBTE99v3P5Or/y216xjDV4/lqsfBuo8GzAQyTKRFDZGxAiND60cUPs+Z
	xEO2IovCMctcgv/hNkOQJqZLFUDpgdo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347--_B-Mj3HNv-GCs5BdbH4Yw-1; Thu, 06 Aug 2020 09:38:41 -0400
X-MC-Unique: -_B-Mj3HNv-GCs5BdbH4Yw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 891D4800470;
	Thu,  6 Aug 2020 13:38:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7728C5D9DC;
	Thu,  6 Aug 2020 13:38:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6528A1809554;
	Thu,  6 Aug 2020 13:38:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 076Dca6Q030827 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 6 Aug 2020 09:38:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D73A660BF1; Thu,  6 Aug 2020 13:38:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 584266111F
	for <cluster-devel@redhat.com>; Thu,  6 Aug 2020 13:38:36 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  6 Aug 2020 14:37:51 +0100
Message-Id: <20200806133807.111280-17-anprice@redhat.com>
In-Reply-To: <20200806133807.111280-1-anprice@redhat.com>
References: <20200806133807.111280-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 16/32] gfs2_edit: Don't use gfs2_buffer_head
	in display_gfs2()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Now we can finally get rid of that dummy_bh in restore_data()

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/gfs2hex.c  | 37 ++++++++++++++++++-------------------
 gfs2/edit/gfs2hex.h  |  2 +-
 gfs2/edit/hexedit.c  |  2 +-
 gfs2/edit/savemeta.c |  6 +-----
 4 files changed, 21 insertions(+), 26 deletions(-)

diff --git a/gfs2/edit/gfs2hex.c b/gfs2/edit/gfs2hex.c
index 7274303c..3204577a 100644
--- a/gfs2/edit/gfs2hex.c
+++ b/gfs2/edit/gfs2hex.c
@@ -351,7 +351,7 @@ uint64_t do_leaf_extended(char *dlebuf, struct iinfo *indir)
 	return indir->ii[0].lf.lf_next;
 }
 
-static void do_eattr_extended(struct gfs2_buffer_head *ebh)
+static void do_eattr_extended(char *buf)
 {
 	struct gfs2_ea_header ea;
 	unsigned int x;
@@ -364,9 +364,8 @@ static void do_eattr_extended(struct gfs2_buffer_head *ebh)
 	     x += ea.ea_rec_len)
 	{
 		eol(0);
-		gfs2_ea_header_in(&ea, ebh->b_data + x);
-		gfs2_ea_header_print(&ea, ebh->b_data + x +
-				     sizeof(struct gfs2_ea_header));
+		gfs2_ea_header_in(&ea, buf + x);
+		gfs2_ea_header_print(&ea, buf + x + sizeof(struct gfs2_ea_header));
 	}
 }
 
@@ -429,11 +428,11 @@ static void gfs2_sb_print2(struct gfs2_sb *sbp2)
 /**
  * gfs1_rgrp_in - read in a gfs1 rgrp
  */
-static void gfs1_rgrp_in(struct gfs_rgrp *rgrp, struct gfs2_buffer_head *rbh)
+static void gfs1_rgrp_in(struct gfs_rgrp *rgrp, const char *buf)
 {
-        struct gfs_rgrp *str = (struct gfs_rgrp *)rbh->b_data;
+        struct gfs_rgrp *str = (struct gfs_rgrp *)buf;
 
-        gfs2_meta_header_in(&rgrp->rg_header, rbh->b_data);
+        gfs2_meta_header_in(&rgrp->rg_header, buf);
         rgrp->rg_flags = be32_to_cpu(str->rg_flags);
         rgrp->rg_free = be32_to_cpu(str->rg_free);
         rgrp->rg_useddi = be32_to_cpu(str->rg_useddi);
@@ -460,7 +459,7 @@ static void gfs1_rgrp_print(struct gfs_rgrp *rg)
         pv(rg, rg_freemeta, "%u", "0x%x");
 }
 
-int display_gfs2(struct gfs2_buffer_head *dbh)
+int display_gfs2(char *buf)
 {
 	struct gfs2_meta_header mh;
 	struct gfs2_rgrp rg;
@@ -472,12 +471,12 @@ int display_gfs2(struct gfs2_buffer_head *dbh)
 
 	uint32_t magic;
 
-	magic = be32_to_cpu(*(uint32_t *)dbh->b_data);
+	magic = be32_to_cpu(*(uint32_t *)buf);
 
 	switch (magic)
 	{
 	case GFS2_MAGIC:
-		gfs2_meta_header_in(&mh, dbh->b_data);
+		gfs2_meta_header_in(&mh, buf);
 		if (mh.mh_type > GFS2_METATYPE_QC)
 			print_gfs2("Unknown metadata type");
 		else
@@ -487,7 +486,7 @@ int display_gfs2(struct gfs2_buffer_head *dbh)
 		switch (mh.mh_type)
 		{
 		case GFS2_METATYPE_SB:
-			gfs2_sb_in(&sbd.sd_sb, dbh->b_data);
+			gfs2_sb_in(&sbd.sd_sb, buf);
 			gfs2_sb_print2(&sbd.sd_sb);
 			break;
 
@@ -495,10 +494,10 @@ int display_gfs2(struct gfs2_buffer_head *dbh)
 			if (sbd.gfs1) {
 				struct gfs_rgrp rg1;
 
-				gfs1_rgrp_in(&rg1, dbh);
+				gfs1_rgrp_in(&rg1, buf);
 				gfs1_rgrp_print(&rg1);
 			} else {
-				gfs2_rgrp_in(&rg, dbh->b_data);
+				gfs2_rgrp_in(&rg, buf);
 				gfs2_rgrp_print(&rg);
 			}
 			break;
@@ -516,7 +515,7 @@ int display_gfs2(struct gfs2_buffer_head *dbh)
 			break;
 
 		case GFS2_METATYPE_LF:
-			gfs2_leaf_in(&lf, dbh->b_data);
+			gfs2_leaf_in(&lf, buf);
 			gfs2_leaf_print(&lf);
 			break;
 
@@ -526,21 +525,21 @@ int display_gfs2(struct gfs2_buffer_head *dbh)
 
 		case GFS2_METATYPE_LH:
 			if (sbd.gfs1) {
-				gfs_log_header_in(&lh1, dbh->b_data);
+				gfs_log_header_in(&lh1, buf);
 				gfs_log_header_print(&lh1);
 			} else {
-				gfs2_log_header_in(&lh, dbh->b_data);
+				gfs2_log_header_in(&lh, buf);
 				gfs2_log_header_print(&lh);
 			}
 			break;
 
 		case GFS2_METATYPE_LD:
-			gfs2_log_descriptor_in(&ld, dbh->b_data);
+			gfs2_log_descriptor_in(&ld, buf);
 			gfs2_log_descriptor_print(&ld);
 			break;
 
 		case GFS2_METATYPE_EA:
-			do_eattr_extended(dbh);
+			do_eattr_extended(buf);
 			break;
 
 		case GFS2_METATYPE_ED:
@@ -552,7 +551,7 @@ int display_gfs2(struct gfs2_buffer_head *dbh)
 			break;
 
 		case GFS2_METATYPE_QC:
-			gfs2_quota_change_in(&qc, dbh->b_data);
+			gfs2_quota_change_in(&qc, buf);
 			gfs2_quota_change_print(&qc);
 			break;
 
diff --git a/gfs2/edit/gfs2hex.h b/gfs2/edit/gfs2hex.h
index 6c6ddde3..878ab801 100644
--- a/gfs2/edit/gfs2hex.h
+++ b/gfs2/edit/gfs2hex.h
@@ -3,7 +3,7 @@
 
 #include "hexedit.h"
 
-extern int display_gfs2(struct gfs2_buffer_head *dbh);
+extern int display_gfs2(char *buf);
 extern int edit_gfs2(void);
 extern void do_dinode_extended(struct gfs2_dinode *di, char *buf);
 extern void print_gfs2(const char *fmt, ...) __attribute__((format (printf, 1, 2)));
diff --git a/gfs2/edit/hexedit.c b/gfs2/edit/hexedit.c
index 6019996d..f8b6f67c 100644
--- a/gfs2/edit/hexedit.c
+++ b/gfs2/edit/hexedit.c
@@ -1099,7 +1099,7 @@ int display(int identify_only, int trunc_zeros, uint64_t flagref,
 		        flagref, ref_blk);
 	else if (dmode == GFS2_MODE) { /* if structure display */
 		if (block != JOURNALS_DUMMY_BLOCK)
-			display_gfs2(bh);  /* display the gfs2 structure */
+			display_gfs2(bh->b_data);
 	} else
 		display_extended();        /* display extended blocks       */
 	/* No else here because display_extended can switch back to hex mode */
diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index f3c85b0d..43ac4251 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -1148,13 +1148,9 @@ static int restore_data(int fd, struct metafd *mfd, int printonly)
 		}
 
 		if (printonly) {
-			struct gfs2_buffer_head dummy_bh = {
-				.b_data = bp,
-				.b_blocknr = savedata.blk,
-			};
 			if (printonly > 1 && printonly == savedata.blk) {
 				display_block_type(bp, savedata.blk, TRUE);
-				display_gfs2(&dummy_bh);
+				display_gfs2(bp);
 				break;
 			} else if (printonly == 1) {
 				print_gfs2("%"PRId64" (l=0x%x): ", blks_saved, savedata.siglen);
-- 
2.26.2

