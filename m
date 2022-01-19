Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DA04938BE
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Jan 2022 11:43:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642589027;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qfwaimBbcLAjS/aIn7Lv2f3hyXNS5VoBaJ9q7a2Yegk=;
	b=Qak2w2LMk16ehRFk4O3FpwO+znLK+kEhHOfMKgi3ebieMUPpxEXz8adTuBJFiesLIb+odD
	CQnMyTzEE63QJKMGkxvZ6q+qvi4p0TYTZlYl1WdK7dfEBvokNTk5KvLeW+ZVjf/ic1lvUy
	EwPmprp+nvO361LphzcvTdDC3skm20A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-454-mMvjzYviPw2gWOdJb776FA-1; Wed, 19 Jan 2022 05:43:44 -0500
X-MC-Unique: mMvjzYviPw2gWOdJb776FA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19A8981424A;
	Wed, 19 Jan 2022 10:43:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 05582753C9;
	Wed, 19 Jan 2022 10:43:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DF87D1806D1C;
	Wed, 19 Jan 2022 10:43:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20JAhdvr024237 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Jan 2022 05:43:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 35F61794D2; Wed, 19 Jan 2022 10:43:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.37.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AF8578B18
	for <cluster-devel@redhat.com>; Wed, 19 Jan 2022 10:43:37 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 19 Jan 2022 10:43:02 +0000
Message-Id: <20220119104316.2489995-8-anprice@redhat.com>
In-Reply-To: <20220119104316.2489995-1-anprice@redhat.com>
References: <20220119104316.2489995-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 07/21] libgfs2: Namespace improvements -
	rgrp.c
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Use the lgfs2_ prefix in libgfs2 interface names.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/convert/gfs2_convert.c | 10 +++---
 gfs2/edit/hexedit.c         | 60 +++++++++++++++++-----------------
 gfs2/edit/journal.c         |  2 +-
 gfs2/edit/savemeta.c        |  2 +-
 gfs2/fsck/fs_recovery.c     |  2 +-
 gfs2/fsck/fsck.h            |  2 +-
 gfs2/fsck/initialize.c      |  6 ++--
 gfs2/fsck/metawalk.c        |  2 +-
 gfs2/fsck/pass1.c           |  2 +-
 gfs2/fsck/pass5.c           |  4 +--
 gfs2/fsck/rgrepair.c        | 64 ++++++++++++++++++-------------------
 gfs2/fsck/util.h            |  2 +-
 gfs2/libgfs2/fs_bits.c      |  2 +-
 gfs2/libgfs2/fs_ops.c       |  8 ++---
 gfs2/libgfs2/gfs2l.c        |  2 +-
 gfs2/libgfs2/lang.c         |  6 ++--
 gfs2/libgfs2/libgfs2.h      | 22 +++++--------
 gfs2/libgfs2/rgrp.c         | 22 ++++++-------
 gfs2/libgfs2/super.c        |  4 +--
 19 files changed, 109 insertions(+), 115 deletions(-)

diff --git a/gfs2/convert/gfs2_convert.c b/gfs2/convert/gfs2_convert.c
index 90964ae1..1608b1ad 100644
--- a/gfs2/convert/gfs2_convert.c
+++ b/gfs2/convert/gfs2_convert.c
@@ -1532,7 +1532,7 @@ static int gfs1_ri_update(struct gfs2_sbd *sdp, int *rgcount, int quiet)
 		next = osi_next(n);
 		rgd = (struct rgrp_tree *)n;
 		/* Read resource group header */
-		errblock = gfs2_rgrp_read(sdp, rgd);
+		errblock = lgfs2_rgrp_read(sdp, rgd);
 		if (errblock)
 			return errblock;
 		count2++;
@@ -1552,7 +1552,7 @@ static int gfs1_ri_update(struct gfs2_sbd *sdp, int *rgcount, int quiet)
 	return 0;
 
  fail:
-	gfs2_rgrp_free(sdp, &sdp->rgtree);
+	lgfs2_rgrp_free(sdp, &sdp->rgtree);
 	return -1;
 }
 
@@ -1848,7 +1848,7 @@ static int journ_space_to_rg(struct gfs2_sbd *sdp)
 		         ji_addr, rgdhigh->rt_addr);
 		ri_addr = ji_addr;
 		/* Allocate a new rgd entry which includes rg and ri. */
-		rgd = rgrp_insert(&sdp->rgtree, ri_addr);
+		rgd = lgfs2_rgrp_insert(&sdp->rgtree, ri_addr);
 		/* convert the gfs1 rgrp into a new gfs2 rgrp */
 		size = ji_nsegs * be32_to_cpu(gfs1_sb.sb_seg_size);
 		rgd->rt_flags = 0;
@@ -1866,7 +1866,7 @@ static int journ_space_to_rg(struct gfs2_sbd *sdp)
 		rgd->rt_free = rgd->rt_data;
 		rgd->rt_bitbytes = rgd->rt_data / GFS2_NBBY;
 
-		if (gfs2_compute_bitstructs(sdp->sd_bsize, rgd)) {
+		if (lgfs2_compute_bitstructs(sdp->sd_bsize, rgd)) {
 			log_crit(_("gfs2_convert: Error converting bitmaps.\n"));
 			exit(-1);
 		}
@@ -2382,7 +2382,7 @@ int main(int argc, char **argv)
 		fsync(sb2.device_fd); /* write the buffers to disk */
 
 		/* Now free all the in memory */
-		gfs2_rgrp_free(&sb2, &sb2.rgtree);
+		lgfs2_rgrp_free(&sb2, &sb2.rgtree);
 		log_notice(_("Committing changes to disk.\n"));
 		fflush(stdout);
 		/* Set filesystem type in superblock to gfs2.  We do this at the */
diff --git a/gfs2/edit/hexedit.c b/gfs2/edit/hexedit.c
index ffb714bf..b0f110c1 100644
--- a/gfs2/edit/hexedit.c
+++ b/gfs2/edit/hexedit.c
@@ -350,9 +350,9 @@ int display_block_type(char *buf, uint64_t addr, int from_restore)
 		int type;
 		struct rgrp_tree *rgd;
 
-		rgd = gfs2_blk2rgrpd(&sbd, block);
+		rgd = lgfs2_blk2rgrpd(&sbd, block);
 		if (rgd) {
-			gfs2_rgrp_read(&sbd, rgd);
+			lgfs2_rgrp_read(&sbd, rgd);
 			if ((be32_to_cpu(mh->mh_type) == GFS2_METATYPE_RG) ||
 			    (be32_to_cpu(mh->mh_type) == GFS2_METATYPE_RB))
 				type = 4;
@@ -428,7 +428,7 @@ int display_block_type(char *buf, uint64_t addr, int from_restore)
 			}
 		}
 		if (rgd)
-			gfs2_rgrp_relse(&sbd, rgd);
+			lgfs2_rgrp_relse(&sbd, rgd);
  	}
 	if (block == sbd.sd_root_dir.in_addr)
 		print_gfs2("--------------- Root directory ------------------");
@@ -693,7 +693,7 @@ static void rgcount(void)
 	printf("%"PRId64" RGs in this file system.\n",
 	       sbd.md.riinode->i_size / sizeof(struct gfs2_rindex));
 	lgfs2_inode_put(&sbd.md.riinode);
-	gfs2_rgrp_free(&sbd, &sbd.rgtree);
+	lgfs2_rgrp_free(&sbd, &sbd.rgtree);
 	exit(EXIT_SUCCESS);
 }
 
@@ -1154,7 +1154,7 @@ static uint64_t find_metablockoftype_slow(uint64_t startblk, int metatype, int p
 		else
 			printf("%"PRIu64"\n", blk);
 	}
-	gfs2_rgrp_free(&sbd, &sbd.rgtree);
+	lgfs2_rgrp_free(&sbd, &sbd.rgtree);
 	if (print)
 		exit(0);
 	return blk;
@@ -1216,13 +1216,13 @@ static uint64_t find_metablockoftype_rg(uint64_t startblk, int metatype, int pri
 	if (!rgd) {
 		if (print)
 			printf("0\n");
-		gfs2_rgrp_free(&sbd, &sbd.rgtree);
+		lgfs2_rgrp_free(&sbd, &sbd.rgtree);
 		if (print)
 			exit(-1);
 	}
 	for (; !found && next; next = osi_next(next)){
 		rgd = (struct rgrp_tree *)next;
-		errblk = gfs2_rgrp_read(&sbd, rgd);
+		errblk = lgfs2_rgrp_read(&sbd, rgd);
 		if (errblk)
 			continue;
 
@@ -1230,7 +1230,7 @@ static uint64_t find_metablockoftype_rg(uint64_t startblk, int metatype, int pri
 		if (found)
 			break;
 
-		gfs2_rgrp_relse(&sbd, rgd);
+		lgfs2_rgrp_relse(&sbd, rgd);
 	}
 
 	if (!found)
@@ -1241,7 +1241,7 @@ static uint64_t find_metablockoftype_rg(uint64_t startblk, int metatype, int pri
 		else
 			printf("%"PRIu64"\n", blk);
 	}
-	gfs2_rgrp_free(&sbd, &sbd.rgtree);
+	lgfs2_rgrp_free(&sbd, &sbd.rgtree);
 	if (print)
 		exit(0);
 	return blk;
@@ -1275,7 +1275,7 @@ static uint64_t find_metablockoftype(const char *strtype, int print)
 			"specified: must be one of:\n");
 		fprintf(stderr, "sb rg rb di in lf jd lh ld"
 			" ea ed lb 13 qc\n");
-		gfs2_rgrp_free(&sbd, &sbd.rgtree);
+		lgfs2_rgrp_free(&sbd, &sbd.rgtree);
 		exit(-1);
 	}
 	return blk;
@@ -1589,7 +1589,7 @@ static void find_print_block_type(void)
 	type = get_block_type(lbh->b_data);
 	print_block_type(tblock, type);
 	lgfs2_brelse(lbh);
-	gfs2_rgrp_free(&sbd, &sbd.rgtree);
+	lgfs2_rgrp_free(&sbd, &sbd.rgtree);
 	exit(0);
 }
 
@@ -1606,7 +1606,7 @@ static void find_print_block_rg(int bitmap)
 	if (rblock == LGFS2_SB_ADDR(&sbd))
 		printf("0 (the superblock is not in the bitmap)\n");
 	else {
-		rgd = gfs2_blk2rgrpd(&sbd, rblock);
+		rgd = lgfs2_blk2rgrpd(&sbd, rblock);
 		if (rgd) {
 			rgblock = rgd->rt_addr;
 			if (bitmap) {
@@ -1632,7 +1632,7 @@ static void find_print_block_rg(int bitmap)
 			printf("-1 (block invalid or part of an rgrp).\n");
 		}
 	}
-	gfs2_rgrp_free(&sbd, &sbd.rgtree);
+	lgfs2_rgrp_free(&sbd, &sbd.rgtree);
 	exit(0);
 }
 
@@ -1653,16 +1653,16 @@ static void find_change_block_alloc(int *newval)
 		       *newval);
 		for (i = GFS2_BLKST_FREE; i <= GFS2_BLKST_DINODE; i++)
 			printf("%d - %s\n", i, allocdesc[sbd.gfs1][i]);
-		gfs2_rgrp_free(&sbd, &sbd.rgtree);
+		lgfs2_rgrp_free(&sbd, &sbd.rgtree);
 		exit(-1);
 	}
 	ablock = blockstack[blockhist % BLOCK_STACK_SIZE].block;
 	if (ablock == LGFS2_SB_ADDR(&sbd))
 		printf("3 (the superblock is not in the bitmap)\n");
 	else {
-		rgd = gfs2_blk2rgrpd(&sbd, ablock);
+		rgd = lgfs2_blk2rgrpd(&sbd, ablock);
 		if (rgd) {
-			gfs2_rgrp_read(&sbd, rgd);
+			lgfs2_rgrp_read(&sbd, rgd);
 			if (newval) {
 				if (lgfs2_set_bitmap(rgd, ablock, *newval))
 					printf("-1 (block invalid or part of an rgrp).\n");
@@ -1677,14 +1677,14 @@ static void find_change_block_alloc(int *newval)
 				}
 				printf("%d (%s)\n", type, allocdesc[sbd.gfs1][type]);
 			}
-			gfs2_rgrp_relse(&sbd, rgd);
+			lgfs2_rgrp_relse(&sbd, rgd);
 		} else {
-			gfs2_rgrp_free(&sbd, &sbd.rgtree);
+			lgfs2_rgrp_free(&sbd, &sbd.rgtree);
 			printf("-1 (block invalid or part of an rgrp).\n");
 			exit(-1);
 		}
 	}
-	gfs2_rgrp_free(&sbd, &sbd.rgtree);
+	lgfs2_rgrp_free(&sbd, &sbd.rgtree);
 	if (newval)
 		fsync(sbd.device_fd);
 	exit(0);
@@ -2184,8 +2184,8 @@ static void rg_repair(void)
 	/* Walk through the resource groups saving everything within */
 	for (n = osi_first(&sbd.rgtree); n; n = osi_next(n)) {
 		rgd = (struct rgrp_tree *)n;
-		if (gfs2_rgrp_read(&sbd, rgd) == 0) { /* was read in okay */
-			gfs2_rgrp_relse(&sbd, rgd);
+		if (lgfs2_rgrp_read(&sbd, rgd) == 0) { /* was read in okay */
+			lgfs2_rgrp_relse(&sbd, rgd);
 			continue; /* ignore it */
 		}
 		/* If we get here, it's because we have an rgrp in the rindex
@@ -2374,7 +2374,7 @@ static void process_parameters(int argc, char *argv[], int pass)
 				printf("Error: field not specified.\n");
 				printf("Format is: %s -p <block> field "
 				       "<field> [newvalue]\n", argv[0]);
-				gfs2_rgrp_free(&sbd, &sbd.rgtree);
+				lgfs2_rgrp_free(&sbd, &sbd.rgtree);
 				exit(EXIT_FAILURE);
 			}
 			process_field(argv[i], argv[i + 1]);
@@ -2407,7 +2407,7 @@ static void process_parameters(int argc, char *argv[], int pass)
 				printf("Error: rg # not specified.\n");
 				printf("Format is: %s rgflags rgnum"
 				       "[newvalue]\n", argv[0]);
-				gfs2_rgrp_free(&sbd, &sbd.rgtree);
+				lgfs2_rgrp_free(&sbd, &sbd.rgtree);
 				exit(EXIT_FAILURE);
 			}
 			if (argv[i][0]=='0' && argv[i][1]=='x')
@@ -2424,7 +2424,7 @@ static void process_parameters(int argc, char *argv[], int pass)
 					new_flags = atoi(argv[i]);
 			}
 			set_rgrp_flags(rg, new_flags, set, FALSE);
-			gfs2_rgrp_free(&sbd, &sbd.rgtree);
+			lgfs2_rgrp_free(&sbd, &sbd.rgtree);
 			exit(EXIT_SUCCESS);
 		} else if (!strcmp(argv[i], "rg")) {
 			int rg;
@@ -2433,7 +2433,7 @@ static void process_parameters(int argc, char *argv[], int pass)
 			if (i >= argc - 1) {
 				printf("Error: rg # not specified.\n");
 				printf("Format is: %s rg rgnum\n", argv[0]);
-				gfs2_rgrp_free(&sbd, &sbd.rgtree);
+				lgfs2_rgrp_free(&sbd, &sbd.rgtree);
 				exit(EXIT_FAILURE);
 			}
 			rg = atoi(argv[i]);
@@ -2442,7 +2442,7 @@ static void process_parameters(int argc, char *argv[], int pass)
 				push_block(temp_blk);
 			} else {
 				set_rgrp_flags(rg, 0, FALSE, TRUE);
-				gfs2_rgrp_free(&sbd, &sbd.rgtree);
+				lgfs2_rgrp_free(&sbd, &sbd.rgtree);
 				exit(EXIT_SUCCESS);
 			}
 		} else if (!strcmp(argv[i], "rgbitmaps")) {
@@ -2455,15 +2455,15 @@ static void process_parameters(int argc, char *argv[], int pass)
 				printf("Error: rg # not specified.\n");
 				printf("Format is: %s rgbitmaps rgnum\n",
 				       argv[0]);
-				gfs2_rgrp_free(&sbd, &sbd.rgtree);
+				lgfs2_rgrp_free(&sbd, &sbd.rgtree);
 				exit(EXIT_FAILURE);
 			}
 			rg = atoi(argv[i]);
 			rgblk = get_rg_addr(rg);
-			rgd = gfs2_blk2rgrpd(&sbd, rgblk);
+			rgd = lgfs2_blk2rgrpd(&sbd, rgblk);
 			if (rgd == NULL) {
 				printf("Error: rg # is invalid.\n");
-				gfs2_rgrp_free(&sbd, &sbd.rgtree);
+				lgfs2_rgrp_free(&sbd, &sbd.rgtree);
 				exit(EXIT_FAILURE);
 			}
 			for (bmap = 0; bmap < rgd->rt_length; bmap++)
@@ -2574,7 +2574,7 @@ int main(int argc, char *argv[])
 	close(fd);
 	if (indirect)
 		free(indirect);
-	gfs2_rgrp_free(&sbd, &sbd.rgtree);
+	lgfs2_rgrp_free(&sbd, &sbd.rgtree);
  	exit(EXIT_SUCCESS);
 }
 #endif /* UNITTESTS */
diff --git a/gfs2/edit/journal.c b/gfs2/edit/journal.c
index 91d0a925..2bc94514 100644
--- a/gfs2/edit/journal.c
+++ b/gfs2/edit/journal.c
@@ -546,7 +546,7 @@ void dump_journal(const char *journal, uint64_t tblk)
 	if (tblk) {
 		uint64_t wp;
 
-		rgd = gfs2_blk2rgrpd(&sbd, tblk);
+		rgd = lgfs2_blk2rgrpd(&sbd, tblk);
 		if (!rgd) {
 			print_gfs2("Can't locate the rgrp for block 0x%"PRIx64,
 				   tblk);
diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index 1d22df2e..21c67989 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -1207,7 +1207,7 @@ void savemeta(char *out_fn, int saveoption, int gziplevel)
 	close(sbd.device_fd);
 	destroy_per_node_lookup();
 	free(indirect);
-	gfs2_rgrp_free(&sbd, &sbd.rgtree);
+	lgfs2_rgrp_free(&sbd, &sbd.rgtree);
 	exit(0);
 }
 
diff --git a/gfs2/fsck/fs_recovery.c b/gfs2/fsck/fs_recovery.c
index 6f186c92..bd0fd731 100644
--- a/gfs2/fsck/fs_recovery.c
+++ b/gfs2/fsck/fs_recovery.c
@@ -167,7 +167,7 @@ static int buf_lo_scan_elements(struct gfs2_inode *ip, unsigned int start,
 			error = -EIO;
 		} else {
 			lgfs2_bmodified(bh_ip);
-			rgd = gfs2_blk2rgrpd(sdp, blkno);
+			rgd = lgfs2_blk2rgrpd(sdp, blkno);
 			if (rgd && blkno < rgd->rt_data0)
 				refresh_rgrp(sdp, rgd, bh_ip, blkno);
 		}
diff --git a/gfs2/fsck/fsck.h b/gfs2/fsck/fsck.h
index 7b991614..055ae975 100644
--- a/gfs2/fsck/fsck.h
+++ b/gfs2/fsck/fsck.h
@@ -183,7 +183,7 @@ static inline int valid_block_ip(struct gfs2_inode *ip, uint64_t blk)
 	if (blk <= LGFS2_SB_ADDR(sdp))
 		return 0;
 	if (rgd == NULL || !rgrp_contains_block(rgd, blk)) {
-		rgd = gfs2_blk2rgrpd(sdp, blk);
+		rgd = lgfs2_blk2rgrpd(sdp, blk);
 		if (rgd == NULL)
 			return 0;
 	}
diff --git a/gfs2/fsck/initialize.c b/gfs2/fsck/initialize.c
index f1586374..18522a35 100644
--- a/gfs2/fsck/initialize.c
+++ b/gfs2/fsck/initialize.c
@@ -112,7 +112,7 @@ static void gfs2_inodetree_free(void)
 static void empty_super_block(struct gfs2_sbd *sdp)
 {
 	log_info( _("Freeing buffers.\n"));
-	gfs2_rgrp_free(sdp, &sdp->rgtree);
+	lgfs2_rgrp_free(sdp, &sdp->rgtree);
 
 	gfs2_inodetree_free();
 	gfs2_dirtree_free();
@@ -675,7 +675,7 @@ static int read_rgrps(struct gfs2_sbd *sdp, uint64_t expected)
 		if (ra_window < RA_WINDOW/2)
 			ra_window = gfs2_rgrp_reada(sdp, ra_window, n);
 		/* Read resource group header */
-		errblock = gfs2_rgrp_read(sdp, rgd);
+		errblock = lgfs2_rgrp_read(sdp, rgd);
 		if (errblock)
 			return errblock;
 		ra_window--;
@@ -693,7 +693,7 @@ static int read_rgrps(struct gfs2_sbd *sdp, uint64_t expected)
 
  fail:
 	posix_fadvise(sdp->device_fd, 0, 0, POSIX_FADV_NORMAL);
-	gfs2_rgrp_free(sdp, &sdp->rgtree);
+	lgfs2_rgrp_free(sdp, &sdp->rgtree);
 	return -1;
 }
 
diff --git a/gfs2/fsck/metawalk.c b/gfs2/fsck/metawalk.c
index a401e792..2612b0cb 100644
--- a/gfs2/fsck/metawalk.c
+++ b/gfs2/fsck/metawalk.c
@@ -44,7 +44,7 @@ int check_n_fix_bitmap(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
 	if (prevrgd && rgrp_contains_block(prevrgd, blk)) {
 		rgd = prevrgd;
 	} else if (rgd == NULL || !rgrp_contains_block(rgd, blk)) {
-		rgd = gfs2_blk2rgrpd(sdp, blk);
+		rgd = lgfs2_blk2rgrpd(sdp, blk);
 		prevrgd = rgd;
 	}
 	old_state = lgfs2_get_bitmap(sdp, blk, rgd);
diff --git a/gfs2/fsck/pass1.c b/gfs2/fsck/pass1.c
index 2b3379a7..f747a7a5 100644
--- a/gfs2/fsck/pass1.c
+++ b/gfs2/fsck/pass1.c
@@ -430,7 +430,7 @@ static int undo_reference(struct gfs2_inode *ip, uint64_t block, int meta,
 		}
 	}
 	if (!meta) {
-		rgd = gfs2_blk2rgrpd(ip->i_sbd, block);
+		rgd = lgfs2_blk2rgrpd(ip->i_sbd, block);
 		old_bitmap_state = lgfs2_get_bitmap(ip->i_sbd, block, rgd);
 		if (old_bitmap_state == GFS2_BLKST_DINODE)
 			return -1;
diff --git a/gfs2/fsck/pass5.c b/gfs2/fsck/pass5.c
index 976c8641..9aba38e6 100644
--- a/gfs2/fsck/pass5.c
+++ b/gfs2/fsck/pass5.c
@@ -68,7 +68,7 @@ static int check_block_status(struct gfs2_sbd *sdp,  struct gfs2_bmap *bl,
 			        block, block);
 			if (query(_("Do you want to reclaim the block? "
 				   "(y/n) "))) {
-				lgfs2_rgrp_t rg = gfs2_blk2rgrpd(sdp, block);
+				lgfs2_rgrp_t rg = lgfs2_blk2rgrpd(sdp, block);
 				if (lgfs2_set_bitmap(rg, block, GFS2_BLKST_FREE))
 					log_err(_("Unlinked block %"PRIu64" (0x%"PRIx64") bitmap not fixed.\n"),
 					        block, block);
@@ -93,7 +93,7 @@ static int check_block_status(struct gfs2_sbd *sdp,  struct gfs2_bmap *bl,
 
 			if (query(_("Fix bitmap for block %"PRIu64" (0x%"PRIx64")? (y/n) "),
 			          block, block)) {
-				lgfs2_rgrp_t rg = gfs2_blk2rgrpd(sdp, block);
+				lgfs2_rgrp_t rg = lgfs2_blk2rgrpd(sdp, block);
 				if (lgfs2_set_bitmap(rg, block, q))
 					log_err( _("Repair failed.\n"));
 				else
diff --git a/gfs2/fsck/rgrepair.c b/gfs2/fsck/rgrepair.c
index 6f15d2d4..8c2dd35d 100644
--- a/gfs2/fsck/rgrepair.c
+++ b/gfs2/fsck/rgrepair.c
@@ -557,7 +557,7 @@ static int rindex_rebuild(struct gfs2_sbd *sdp, int *num_rgs, int gfs_grow)
 		rg_was_fnd = (!lgfs2_check_meta(bh->b_data, GFS2_METATYPE_RG));
 		lgfs2_brelse(bh);
 		/* Allocate a new RG and index. */
-		calc_rgd = rgrp_insert(&rgcalc, blk);
+		calc_rgd = lgfs2_rgrp_insert(&rgcalc, blk);
 		if (!calc_rgd) {
 			log_crit( _("Can't allocate memory for rgrp repair.\n"));
 			goto out;
@@ -597,7 +597,7 @@ static int rindex_rebuild(struct gfs2_sbd *sdp, int *num_rgs, int gfs_grow)
 		if (prev_rgd) {
 			uint32_t rgblocks;
 
-			prev_rgd->rt_length = rgblocks2bitblocks(sdp->sd_bsize, block_bump, &rgblocks);
+			prev_rgd->rt_length = lgfs2_rgblocks2bitblocks(sdp->sd_bsize, block_bump, &rgblocks);
 			prev_rgd->rt_data = rgblocks;
 			prev_rgd->rt_data0 = prev_rgd->rt_addr +
 				prev_rgd->rt_length;
@@ -657,7 +657,7 @@ static int rindex_rebuild(struct gfs2_sbd *sdp, int *num_rgs, int gfs_grow)
 	if (prev_rgd && !prev_rgd->rt_data) {
 		uint32_t rgblocks;
 
-		prev_rgd->rt_length = rgblocks2bitblocks(sdp->sd_bsize, block_bump, &rgblocks);
+		prev_rgd->rt_length = lgfs2_rgblocks2bitblocks(sdp->sd_bsize, block_bump, &rgblocks);
 		prev_rgd->rt_data0 = prev_rgd->rt_addr + prev_rgd->rt_length;
 		prev_rgd->rt_data = rgblocks;
 		prev_rgd->rt_data -= prev_rgd->rt_data % GFS2_NBBY;
@@ -705,9 +705,9 @@ static uint64_t how_many_rgrps(struct gfs2_sbd *sdp, struct device *dev)
 		nrgrp = DIV_RU(dev->length, (sdp->rgsize << 20) / sdp->sd_bsize);
 
 		/* check to see if the rg length overflows max # bitblks */
-		bitblocksn = rgblocks2bitblocks(sdp->sd_bsize, dev->length / nrgrp, &rgblocksn);
+		bitblocksn = lgfs2_rgblocks2bitblocks(sdp->sd_bsize, dev->length / nrgrp, &rgblocksn);
 		/* calculate size of the first rgrp */
-		bitblocks1 = rgblocks2bitblocks(sdp->sd_bsize, dev->length - (nrgrp - 1) * (dev->length / nrgrp),
+		bitblocks1 = lgfs2_rgblocks2bitblocks(sdp->sd_bsize, dev->length - (nrgrp - 1) * (dev->length / nrgrp),
 		                                &rgblocks1);
 		if (bitblocks1 <= 2149 && bitblocksn <= 2149)
 			break;
@@ -749,11 +749,11 @@ static struct osi_root compute_rgrp_layout(struct gfs2_sbd *sdp)
 	for (; rgrp < nrgrp; rgrp++) {
 		if (rgrp) {
 			rgaddr = rlast->rt_addr + rlast->rt_skip;
-			rl = rgrp_insert(&rgtree, rgaddr);
+			rl = lgfs2_rgrp_insert(&rgtree, rgaddr);
 			rl->rt_skip = rglength;
 		} else {
 			rgaddr = LGFS2_SB_ADDR(sdp) + 1;
-			rl = rgrp_insert(&rgtree, rgaddr);
+			rl = lgfs2_rgrp_insert(&rgtree, rgaddr);
 			rl->rt_skip = dev->length -
 				(nrgrp - 1) * (dev->length / nrgrp);
 		}
@@ -774,7 +774,7 @@ static int calc_rgrps(struct gfs2_sbd *sdp)
 		next = osi_next(n);
 		rl = (struct rgrp_tree *)n;
 
-		bitblocks = rgblocks2bitblocks(sdp->sd_bsize, rl->rt_skip, &rgblocks);
+		bitblocks = lgfs2_rgblocks2bitblocks(sdp->sd_bsize, rl->rt_skip, &rgblocks);
 
 		rl->rt_length = bitblocks;
 		rl->rt_data0 = rl->rt_addr + bitblocks;
@@ -782,7 +782,7 @@ static int calc_rgrps(struct gfs2_sbd *sdp)
 		rl->rt_bitbytes = rgblocks / GFS2_NBBY;
 		rl->rt_free = rgblocks;
 
-		if (gfs2_compute_bitstructs(sdp->sd_bsize, rl))
+		if (lgfs2_compute_bitstructs(sdp->sd_bsize, rl))
 			return -1;
 
 		sdp->blks_total += rgblocks;
@@ -911,7 +911,7 @@ static int expect_rindex_sanity(struct gfs2_sbd *sdp, int *num_rgs)
 	for (n = osi_first(&sdp->rgtree); n; n = next) {
 		next = osi_next(n);
 		rgd = (struct rgrp_tree *)n;
-		exp = rgrp_insert(&rgcalc, rgd->rt_addr);
+		exp = lgfs2_rgrp_insert(&rgcalc, rgd->rt_addr);
 		if (exp == NULL) {
 			fprintf(stderr, "Out of memory in %s\n", __FUNCTION__);
 			exit(-1);
@@ -926,7 +926,7 @@ static int expect_rindex_sanity(struct gfs2_sbd *sdp, int *num_rgs)
 		exp->rt_dinodes = rgd->rt_dinodes;
 		exp->rt_skip = rgd->rt_skip;
 		exp->bits = NULL;
-		gfs2_compute_bitstructs(sdp->sd_bsize, exp);
+		lgfs2_compute_bitstructs(sdp->sd_bsize, exp);
 	}
 	sdp->rgrps = *num_rgs;
 	return 0;
@@ -955,7 +955,7 @@ int rindex_repair(struct gfs2_sbd *sdp, int trust_lvl, int *ok)
 	if (trust_lvl == YE_OF_LITTLE_FAITH) { /* if rindex seems sane */
 		/* Don't free previous incarnations in memory, if any.
 		 * We need them to copy in the next function:
-		 * gfs2_rgrp_free(&sdp->rglist); */
+		 * lgfs2_rgrp_free(&sdp->rglist); */
 		if (!(*ok)) {
 			log_err(_("The rindex file does not meet our "
 				  "expectations.\n"));
@@ -963,37 +963,37 @@ int rindex_repair(struct gfs2_sbd *sdp, int trust_lvl, int *ok)
 		}
 		error = expect_rindex_sanity(sdp, &calc_rg_count);
 		if (error) {
-			gfs2_rgrp_free(sdp, &rgcalc);
+			lgfs2_rgrp_free(sdp, &rgcalc);
 			return error;
 		}
 	} else if (trust_lvl == OPEN_MINDED) { /* If we can't trust RG index */
 		/* Free previous incarnations in memory, if any. */
-		gfs2_rgrp_free(sdp, &sdp->rgtree);
+		lgfs2_rgrp_free(sdp, &sdp->rgtree);
 
 		/* Calculate our own RG index for comparison */
 		error = gfs2_rindex_calculate(sdp, &calc_rg_count);
 		if (error) { /* If calculated RGs don't match the fs */
-			gfs2_rgrp_free(sdp, &rgcalc);
+			lgfs2_rgrp_free(sdp, &rgcalc);
 			return -1;
 		}
 	} else if (trust_lvl == DISTRUST) { /* If we can't trust RG index */
 		/* Free previous incarnations in memory, if any. */
-		gfs2_rgrp_free(sdp, &sdp->rgtree);
+		lgfs2_rgrp_free(sdp, &sdp->rgtree);
 
 		error = rindex_rebuild(sdp, &calc_rg_count, 0);
 		if (error) {
 			log_crit( _("Error rebuilding rgrp list.\n"));
-			gfs2_rgrp_free(sdp, &rgcalc);
+			lgfs2_rgrp_free(sdp, &rgcalc);
 			return -1;
 		}
 	} else if (trust_lvl == INDIGNATION) { /* If we can't trust anything */
 		/* Free previous incarnations in memory, if any. */
-		gfs2_rgrp_free(sdp, &sdp->rgtree);
+		lgfs2_rgrp_free(sdp, &sdp->rgtree);
 
 		error = rindex_rebuild(sdp, &calc_rg_count, 1);
 		if (error) {
 			log_crit( _("Error rebuilding rgrp list.\n"));
-			gfs2_rgrp_free(sdp, &rgcalc);
+			lgfs2_rgrp_free(sdp, &rgcalc);
 			return -1;
 		}
 	}
@@ -1004,8 +1004,8 @@ int rindex_repair(struct gfs2_sbd *sdp, int trust_lvl, int *ok)
 		log_warn( _("WARNING: rindex file has an invalid size.\n"));
 		if (!query( _("Truncate the rindex size? (y/n)"))) {
 			log_err(_("The rindex was not repaired.\n"));
-			gfs2_rgrp_free(sdp, &rgcalc);
-			gfs2_rgrp_free(sdp, &sdp->rgtree);
+			lgfs2_rgrp_free(sdp, &rgcalc);
+			lgfs2_rgrp_free(sdp, &sdp->rgtree);
 			return -1;
 		}
 		sdp->md.riinode->i_size /= sizeof(struct gfs2_rindex);
@@ -1028,8 +1028,8 @@ int rindex_repair(struct gfs2_sbd *sdp, int trust_lvl, int *ok)
 		   then try again with a little more DISTRUST. */
 		if ((trust_lvl < DISTRUST) ||
 		    !query( _("Attempt to use what rgrps we can? (y/n)"))) {
-			gfs2_rgrp_free(sdp, &rgcalc);
-			gfs2_rgrp_free(sdp, &sdp->rgtree);
+			lgfs2_rgrp_free(sdp, &rgcalc);
+			lgfs2_rgrp_free(sdp, &sdp->rgtree);
 			log_err(_("The rindex was not repaired.\n"));
 			return -1;
 		}
@@ -1094,8 +1094,8 @@ int rindex_repair(struct gfs2_sbd *sdp, int trust_lvl, int *ok)
 			log_warn( _("%d out of %d rgrps (%d percent) did not "
 				    "match what was expected.\n"),
 				  discrepancies, rg, percent);
-			gfs2_rgrp_free(sdp, &rgcalc);
-			gfs2_rgrp_free(sdp, &sdp->rgtree);
+			lgfs2_rgrp_free(sdp, &rgcalc);
+			lgfs2_rgrp_free(sdp, &sdp->rgtree);
 			return -1;
 		}
 	}
@@ -1124,7 +1124,7 @@ int rindex_repair(struct gfs2_sbd *sdp, int trust_lvl, int *ok)
 		    expected->rt_addr < actual->rt_addr) {
 			log_err(_("Entry missing from rindex: 0x%"PRIx64"\n"),
 			        expected->rt_addr);
-			actual = rgrp_insert(&sdp->rgtree, expected->rt_addr);
+			actual = lgfs2_rgrp_insert(&sdp->rgtree, expected->rt_addr);
 			if (!actual) {
 				log_err(_("Out of memory!\n"));
 				break;
@@ -1152,7 +1152,7 @@ int rindex_repair(struct gfs2_sbd *sdp, int trust_lvl, int *ok)
 				actual->rt_data = expected->rt_data;
 				actual->rt_bitbytes = expected->rt_bitbytes;
 				/* If our rindex was hosed, ri_length is bad */
-				/* Therefore, gfs2_compute_bitstructs might  */
+				/* Therefore, lgfs2_compute_bitstructs might  */
 				/* have malloced the wrong length for bitmap */
 				/* buffers.  So we have to redo it.          */
 				if (actual->bits) {
@@ -1162,7 +1162,7 @@ int rindex_repair(struct gfs2_sbd *sdp, int trust_lvl, int *ok)
 			}
 			else
 				log_err( _("rindex not fixed.\n"));
-			gfs2_compute_bitstructs(sdp->sd_bsize, actual);
+			lgfs2_compute_bitstructs(sdp->sd_bsize, actual);
 			rindex_modified = 0;
 		}
 		e = enext;
@@ -1186,21 +1186,21 @@ int rindex_repair(struct gfs2_sbd *sdp, int trust_lvl, int *ok)
 		i = 0;
 		do {
 			rgd = (struct rgrp_tree *)n;
-			errblock = gfs2_rgrp_read(sdp, rgd);
+			errblock = lgfs2_rgrp_read(sdp, rgd);
 			if (errblock) {
 				if (errblock == prev_err)
 					break;
 				prev_err = errblock;
 				rewrite_rg_block(sdp, rgd, errblock);
 			} else {
-				gfs2_rgrp_relse(sdp, rgd);
+				lgfs2_rgrp_relse(sdp, rgd);
 				break;
 			}
 			i++;
 		} while (i < rgd->rt_length);
 	}
-	gfs2_rgrp_free(sdp, &rgcalc);
-	gfs2_rgrp_free(sdp, &sdp->rgtree);
+	lgfs2_rgrp_free(sdp, &rgcalc);
+	lgfs2_rgrp_free(sdp, &sdp->rgtree);
 	/* We shouldn't need to worry about getting the user's permission to
 	   make changes here. If b_modified is true, they already gave their
 	   permission. */
diff --git a/gfs2/fsck/util.h b/gfs2/fsck/util.h
index ae654bf4..278ac139 100644
--- a/gfs2/fsck/util.h
+++ b/gfs2/fsck/util.h
@@ -68,7 +68,7 @@ static inline int bitmap_type(struct gfs2_sbd *sdp, uint64_t bblock)
 {
 	struct rgrp_tree *rgd;
 
-	rgd = gfs2_blk2rgrpd(sdp, bblock);
+	rgd = lgfs2_blk2rgrpd(sdp, bblock);
 	return lgfs2_get_bitmap(sdp, bblock, rgd);
 }
 
diff --git a/gfs2/libgfs2/fs_bits.c b/gfs2/libgfs2/fs_bits.c
index 940ebf3c..db5e2772 100644
--- a/gfs2/libgfs2/fs_bits.c
+++ b/gfs2/libgfs2/fs_bits.c
@@ -183,7 +183,7 @@ int lgfs2_get_bitmap(struct gfs2_sbd *sdp, uint64_t blkno, struct rgrp_tree *rgd
 	struct gfs2_bitmap *bi;
 
 	if (rgd == NULL) {
-		rgd = gfs2_blk2rgrpd(sdp, blkno);
+		rgd = lgfs2_blk2rgrpd(sdp, blkno);
 		if(rgd == NULL)
 			return -1;
 	}
diff --git a/gfs2/libgfs2/fs_ops.c b/gfs2/libgfs2/fs_ops.c
index 1d5ef8e6..4e10ab4f 100644
--- a/gfs2/libgfs2/fs_ops.c
+++ b/gfs2/libgfs2/fs_ops.c
@@ -178,7 +178,7 @@ static int block_alloc(struct gfs2_sbd *sdp, const uint64_t blksreq, int state,
 		return -1;
 
 	if (rgt->bits[0].bi_data == NULL) {
-		if (gfs2_rgrp_read(sdp, rgt))
+		if (lgfs2_rgrp_read(sdp, rgt))
 			return -1;
 		release = 1;
 	}
@@ -186,7 +186,7 @@ static int block_alloc(struct gfs2_sbd *sdp, const uint64_t blksreq, int state,
 	bn = find_free_block(rgt);
 	ret = blk_alloc_in_rg(sdp, state, rgt, bn, dinode);
 	if (release)
-		gfs2_rgrp_relse(sdp, rgt);
+		lgfs2_rgrp_relse(sdp, rgt);
 	*blkno = bn;
 	return ret;
 }
@@ -1900,7 +1900,7 @@ void lgfs2_free_block(struct gfs2_sbd *sdp, uint64_t block)
 	struct rgrp_tree *rgd;
 
 	/* Adjust the free space count for the freed block */
-	rgd = gfs2_blk2rgrpd(sdp, block); /* find the rg for indir block */
+	rgd = lgfs2_blk2rgrpd(sdp, block); /* find the rg for indir block */
 	if (rgd) {
 		lgfs2_set_bitmap(rgd, block, GFS2_BLKST_FREE);
 		rgd->rt_free++; /* adjust the free count */
@@ -1967,7 +1967,7 @@ int lgfs2_freedi(struct gfs2_sbd *sdp, uint64_t diblock)
 			}
 		}
 	}
-	rgd = gfs2_blk2rgrpd(sdp, diblock);
+	rgd = lgfs2_blk2rgrpd(sdp, diblock);
 	lgfs2_set_bitmap(rgd, diblock, GFS2_BLKST_FREE);
 	lgfs2_inode_put(&ip);
 	/* lgfs2_inode_put deallocated the extra block used by the disk inode, */
diff --git a/gfs2/libgfs2/gfs2l.c b/gfs2/libgfs2/gfs2l.c
index c31748b0..2ec4a1a1 100644
--- a/gfs2/libgfs2/gfs2l.c
+++ b/gfs2/libgfs2/gfs2l.c
@@ -190,7 +190,7 @@ int main(int argc, char *argv[])
 		lgfs2_lang_result_free(&result);
 	}
 
-	gfs2_rgrp_free(&sbd, &sbd.rgtree);
+	lgfs2_rgrp_free(&sbd, &sbd.rgtree);
 	lgfs2_inode_put(&sbd.md.riinode);
 	lgfs2_inode_put(&sbd.master_dir);
 	lgfs2_lang_free(&state);
diff --git a/gfs2/libgfs2/lang.c b/gfs2/libgfs2/lang.c
index 57849e60..e1c5aba0 100644
--- a/gfs2/libgfs2/lang.c
+++ b/gfs2/libgfs2/lang.c
@@ -365,13 +365,13 @@ static int ast_get_bitstate(uint64_t bn, struct gfs2_sbd *sbd)
 {
 	int ret = 0;
 	int state = 0;
-	struct rgrp_tree *rgd = gfs2_blk2rgrpd(sbd, bn);
+	struct rgrp_tree *rgd = lgfs2_blk2rgrpd(sbd, bn);
 	if (rgd == NULL) {
 		fprintf(stderr, "Could not find resource group for block %"PRIu64"\n", bn);
 		return -1;
 	}
 
-	ret = gfs2_rgrp_read(sbd, rgd);
+	ret = lgfs2_rgrp_read(sbd, rgd);
 	if (ret != 0) {
 		fprintf(stderr, "Failed to read resource group for block %"PRIu64": %d\n", bn, ret);
 		return -1;
@@ -383,7 +383,7 @@ static int ast_get_bitstate(uint64_t bn, struct gfs2_sbd *sbd)
 		return -1;
 	}
 
-	gfs2_rgrp_relse(sbd, rgd);
+	lgfs2_rgrp_relse(sbd, rgd);
 	return state;
 }
 
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index 5eb08baf..b204b763 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -490,9 +490,6 @@ extern int lgfs2_check_range(struct gfs2_sbd *sdp, uint64_t blkno);
 extern int lgfs2_get_bitmap(struct gfs2_sbd *sdp, uint64_t blkno, struct rgrp_tree *rgd);
 extern int lgfs2_set_bitmap(lgfs2_rgrp_t rg, uint64_t blkno, int state);
 
-extern uint32_t rgblocks2bitblocks(const unsigned int bsize, const uint32_t rgblocks,
-                                    uint32_t *ri_data) __attribute__((nonnull(3)));
-
 /* fs_ops.c */
 #define IS_LEAF     (1)
 #define IS_DINODE   (2)
@@ -746,20 +743,17 @@ extern int lgfs2_find_jhead(struct gfs2_inode *ip, struct lgfs2_log_header *head
 extern int lgfs2_clean_journal(struct gfs2_inode *ip, struct lgfs2_log_header *head);
 
 /* rgrp.c */
-extern int gfs2_compute_bitstructs(const uint32_t bsize, struct rgrp_tree *rgd);
-extern struct rgrp_tree *gfs2_blk2rgrpd(struct gfs2_sbd *sdp, uint64_t blk);
+extern uint32_t lgfs2_rgblocks2bitblocks(const unsigned int bsize, const uint32_t rgblocks,
+                                    uint32_t *ri_data) __attribute__((nonnull(3)));
+extern int lgfs2_compute_bitstructs(const uint32_t bsize, struct rgrp_tree *rgd);
+extern struct rgrp_tree *lgfs2_blk2rgrpd(struct gfs2_sbd *sdp, uint64_t blk);
 extern int lgfs2_rgrp_crc_check(char *buf);
 extern void lgfs2_rgrp_crc_set(char *buf);
-extern uint64_t gfs2_rgrp_read(struct gfs2_sbd *sdp, struct rgrp_tree *rgd);
-extern void gfs2_rgrp_relse(struct gfs2_sbd *sdp, struct rgrp_tree *rgd);
-extern struct rgrp_tree *rgrp_insert(struct osi_root *rgtree,
+extern uint64_t lgfs2_rgrp_read(struct gfs2_sbd *sdp, struct rgrp_tree *rgd);
+extern void lgfs2_rgrp_relse(struct gfs2_sbd *sdp, struct rgrp_tree *rgd);
+extern struct rgrp_tree *lgfs2_rgrp_insert(struct osi_root *rgtree,
 				     uint64_t rgblock);
-extern void gfs2_rgrp_free(struct gfs2_sbd *sdp, struct osi_root *rgrp_tree);
-/* figure out the size of the given resource group, in blocks */
-static inline unsigned int rgrp_size(struct rgrp_tree *rgrp)
-{
-	return rgrp->rt_data + rgrp->rt_length;
-}
+extern void lgfs2_rgrp_free(struct gfs2_sbd *sdp, struct osi_root *rgrp_tree);
 
 /* structures.c */
 extern int lgfs2_build_master(struct gfs2_sbd *sdp);
diff --git a/gfs2/libgfs2/rgrp.c b/gfs2/libgfs2/rgrp.c
index 39b8b69b..a359f2fe 100644
--- a/gfs2/libgfs2/rgrp.c
+++ b/gfs2/libgfs2/rgrp.c
@@ -30,12 +30,12 @@ static void compute_bitmaps(lgfs2_rgrp_t rg, const unsigned bsize)
 }
 
 /**
- * gfs2_compute_bitstructs - Compute the bitmap sizes
+ * lgfs2_compute_bitstructs - Compute the bitmap sizes
  * bsize: Block size
  * rgd: The resource group descriptor
  * Returns: 0 on success, -1 on error
  */
-int gfs2_compute_bitstructs(const uint32_t bsize, struct rgrp_tree *rgd)
+int lgfs2_compute_bitstructs(const uint32_t bsize, struct rgrp_tree *rgd)
 {
 	uint32_t length = rgd->rt_length;
 	uint32_t bytes_left;
@@ -86,7 +86,7 @@ errbits:
  *
  * Returns: Ths resource group, or NULL if not found
  */
-struct rgrp_tree *gfs2_blk2rgrpd(struct gfs2_sbd *sdp, uint64_t blk)
+struct rgrp_tree *lgfs2_blk2rgrpd(struct gfs2_sbd *sdp, uint64_t blk)
 {
 	struct rgrp_tree *rgd = (struct rgrp_tree *)sdp->rgtree.osi_node;
 	while (rgd) {
@@ -183,11 +183,11 @@ void lgfs2_rgrp_crc_set(char *buf)
 }
 
 /**
- * gfs2_rgrp_read - read in the resource group information from disk.
+ * lgfs2_rgrp_read - read in the resource group information from disk.
  * @rgd - resource group structure
  * returns: 0 if no error, otherwise the block number that failed
  */
-uint64_t gfs2_rgrp_read(struct gfs2_sbd *sdp, struct rgrp_tree *rgd)
+uint64_t lgfs2_rgrp_read(struct gfs2_sbd *sdp, struct rgrp_tree *rgd)
 {
 	unsigned length = rgd->rt_length * sdp->sd_bsize;
 	off_t offset = rgd->rt_addr * sdp->sd_bsize;
@@ -227,7 +227,7 @@ uint64_t gfs2_rgrp_read(struct gfs2_sbd *sdp, struct rgrp_tree *rgd)
 	return 0;
 }
 
-void gfs2_rgrp_relse(struct gfs2_sbd *sdp, struct rgrp_tree *rgd)
+void lgfs2_rgrp_relse(struct gfs2_sbd *sdp, struct rgrp_tree *rgd)
 {
 	if (rgd->bits == NULL)
 		return;
@@ -250,7 +250,7 @@ void gfs2_rgrp_relse(struct gfs2_sbd *sdp, struct rgrp_tree *rgd)
 		rgd->bits[i].bi_data = NULL;
 }
 
-struct rgrp_tree *rgrp_insert(struct osi_root *rgtree, uint64_t rgblock)
+struct rgrp_tree *lgfs2_rgrp_insert(struct osi_root *rgtree, uint64_t rgblock)
 {
 	struct osi_node **newn = &rgtree->osi_node, *parent = NULL;
 	struct rgrp_tree *data;
@@ -279,7 +279,7 @@ struct rgrp_tree *rgrp_insert(struct osi_root *rgtree, uint64_t rgblock)
 	return data;
 }
 
-void gfs2_rgrp_free(struct gfs2_sbd *sdp, struct osi_root *rgrp_tree)
+void lgfs2_rgrp_free(struct gfs2_sbd *sdp, struct osi_root *rgrp_tree)
 {
 	struct rgrp_tree *rgd;
 	struct osi_node *n;
@@ -289,7 +289,7 @@ void gfs2_rgrp_free(struct gfs2_sbd *sdp, struct osi_root *rgrp_tree)
 	while ((n = osi_first(rgrp_tree))) {
 		rgd = (struct rgrp_tree *)n;
 
-		gfs2_rgrp_relse(sdp, rgd);
+		lgfs2_rgrp_relse(sdp, rgd);
 		free(rgd->bits);
 		rgd->bits = NULL;
 		osi_erase(&rgd->node, rgrp_tree);
@@ -523,7 +523,7 @@ void lgfs2_rgrps_free(lgfs2_rgrps_t *rgs)
  * needed for bitmaps. Also calculate the adjusted number of free data blocks
  * in the resource group and store it in *ri_data.
  */
-uint32_t rgblocks2bitblocks(const unsigned int bsize, const uint32_t rgblocks, uint32_t *ri_data)
+uint32_t lgfs2_rgblocks2bitblocks(const unsigned int bsize, const uint32_t rgblocks, uint32_t *ri_data)
 {
 	uint32_t mappable = 0;
 	uint32_t bitblocks = 0;
@@ -579,7 +579,7 @@ uint64_t lgfs2_rindex_entry_new(lgfs2_rgrps_t rgs, struct gfs2_rindex *ri, uint6
 	if (addr + len > rgs->sdp->device.length)
 		return 0;
 
-	ri_length = rgblocks2bitblocks(rgs->sdp->sd_bsize, len, &ri_data);
+	ri_length = lgfs2_rgblocks2bitblocks(rgs->sdp->sd_bsize, len, &ri_data);
 	ri->ri_addr = cpu_to_be64(addr);
 	ri->ri_length = cpu_to_be32(ri_length);
 	ri->ri_data = cpu_to_be32(ri_data);
diff --git a/gfs2/libgfs2/super.c b/gfs2/libgfs2/super.c
index 15f89a30..da605ded 100644
--- a/gfs2/libgfs2/super.c
+++ b/gfs2/libgfs2/super.c
@@ -228,7 +228,7 @@ int rindex_read(struct gfs2_sbd *sdp, uint64_t *rgcount, int *ok)
 				continue;
 			addr = prev_rgd->rt_data0 + prev_rgd->rt_data;
 		}
-		rgd = rgrp_insert(&sdp->rgtree, addr);
+		rgd = lgfs2_rgrp_insert(&sdp->rgtree, addr);
 		rgd->rt_length = be32_to_cpu(ri.ri_length);
 		rgd->rt_data0 = be64_to_cpu(ri.ri_data0);
 		rgd->rt_data = be32_to_cpu(ri.ri_data);
@@ -248,7 +248,7 @@ int rindex_read(struct gfs2_sbd *sdp, uint64_t *rgcount, int *ok)
 			prev_length = rgd->rt_addr - prev_rgd->rt_addr;
 		}
 
-		if(gfs2_compute_bitstructs(sdp->sd_bsize, rgd))
+		if(lgfs2_compute_bitstructs(sdp->sd_bsize, rgd))
 			*ok = 0;
 
 		(*rgcount)++;
-- 
2.34.1

