Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 2C08D1CDD6B
	for <lists+cluster-devel@lfdr.de>; Mon, 11 May 2020 16:41:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589208103;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rKGbq/59CVhEzDCC0H+047HXbF5B7updxt423SOhyI0=;
	b=UmOotgfqOsp6x6BVM0Wvhi+dDTI5Vw/6tjj1gGjd6OgbRZU+ez5YEpSjcxkIC8FWmMXCsj
	lGVH+NaUPmYpyyKtFgjjBY3wRXBiTSW6OTstosnNC3n7EpkJw/Fcl3JNjWin7SjZq6BuQ1
	gyYY2WS8JRRe2p1erQi0Ho2n/jnvUG4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-ff_QNTkcOSWHO0Nfq__gQw-1; Mon, 11 May 2020 10:41:40 -0400
X-MC-Unique: ff_QNTkcOSWHO0Nfq__gQw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 775BE8015D2;
	Mon, 11 May 2020 14:41:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 67E735D9DC;
	Mon, 11 May 2020 14:41:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A44F04CAA0;
	Mon, 11 May 2020 14:41:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04BEfZxE005596 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 11 May 2020 10:41:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A66B260BF4; Mon, 11 May 2020 14:41:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.212])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D8EC60CD1
	for <cluster-devel@redhat.com>; Mon, 11 May 2020 14:41:34 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 11 May 2020 15:41:22 +0100
Message-Id: <20200511144125.350891-3-anprice@redhat.com>
In-Reply-To: <20200511144125.350891-1-anprice@redhat.com>
References: <20200511144125.350891-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 2/5] libgfs2: Remove bi_bh from struct
	gfs2_bitmap
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Replace bi_bh with a pointer to the start of the block within the
multi-block buffer containing the whole resource group. That way we can
allocate and read the whole resource group in one go and we're not
limited to single-block i/o's. The bh.b_modified flag has been pushed
down into the gfs2_bitmap as bi_modified. This could be obsoleted in
future using more deterministic writeback strategies.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/convert/gfs2_convert.c |  48 ++++++------
 gfs2/edit/hexedit.c         |  46 ++++++------
 gfs2/edit/journal.c         |   8 +-
 gfs2/edit/savemeta.c        |  32 ++++----
 gfs2/fsck/fs_recovery.c     |  10 +--
 gfs2/fsck/initialize.c      |  30 ++++----
 gfs2/fsck/metawalk.c        |   6 +-
 gfs2/fsck/pass5.c           |   7 +-
 gfs2/fsck/rgrepair.c        | 126 ++++++++++++++++++--------------
 gfs2/fsck/util.c            |   5 +-
 gfs2/libgfs2/fs_bits.c      |   8 +-
 gfs2/libgfs2/fs_geometry.c  |  25 +------
 gfs2/libgfs2/fs_ops.c       |  24 +++---
 gfs2/libgfs2/gfs2l.c        |   2 +-
 gfs2/libgfs2/lang.c         |   2 +-
 gfs2/libgfs2/libgfs2.h      |  15 ++--
 gfs2/libgfs2/rgrp.c         | 141 ++++++++++++++++--------------------
 gfs2/libgfs2/structures.c   |   3 +-
 gfs2/libgfs2/super.c        |   2 +-
 tests/check_rgrp.c          |   6 +-
 20 files changed, 266 insertions(+), 280 deletions(-)

diff --git a/gfs2/convert/gfs2_convert.c b/gfs2/convert/gfs2_convert.c
index 17217ce5..7de0f924 100644
--- a/gfs2/convert/gfs2_convert.c
+++ b/gfs2/convert/gfs2_convert.c
@@ -149,11 +149,10 @@ static void convert_bitmaps(struct gfs2_sbd *sdp, struct rgrp_tree *rg)
 		bi = &rg->bits[blk];
 		for (; x < sdp->bsize; x++)
 			for (y = 0; y < GFS2_NBBY; y++) {
-				state = (bi->bi_bh->b_data[x] >>
-					 (GFS2_BIT_SIZE * y)) & 0x03;
+				state = (bi->bi_data[x] >> (GFS2_BIT_SIZE * y)) & 0x03;
 				if (state == 0x02) {/* unallocated metadata state invalid */
-					bi->bi_bh->b_data[x] &= ~(0x02 << (GFS2_BIT_SIZE * y));
-					bmodified(bi->bi_bh);
+					bi->bi_data[x] &= ~(0x02 << (GFS2_BIT_SIZE * y));
+					bi->bi_modified = 1;
 				}
 			}
 	}
@@ -190,8 +189,8 @@ static int convert_rgs(struct gfs2_sbd *sbp)
 		sbp->dinodes_alloced += rgd1->rg_useddi;
 		convert_bitmaps(sbp, rgd);
 		/* Write the updated rgrp to the gfs2 buffer */
-		gfs2_rgrp_out(&rgd->rg, rgd->bits[0].bi_bh->b_data);
-		bmodified(rgd->bits[0].bi_bh);
+		gfs2_rgrp_out(&rgd->rg, rgd->bits[0].bi_data);
+		rgd->bits[0].bi_modified = 1;
 		rgs++;
 		if (rgs % 100 == 0) {
 			printf(".");
@@ -986,7 +985,7 @@ static int next_rg_meta(struct rgrp_tree *rgd, uint64_t *block, int first)
 	}
 	for (; i < length; i++){
 		bits = &rgd->bits[i];
-		blk = gfs2_bitfit((uint8_t *)bits->bi_bh->b_data + bits->bi_offset,
+		blk = gfs2_bitfit((uint8_t *)bits->bi_data + bits->bi_offset,
 		                   bits->bi_len, blk, GFS2_BLKST_DINODE);
 		if(blk != BFITNOENT){
 			*block = blk + (bits->bi_start * GFS2_NBBY) +
@@ -1096,11 +1095,11 @@ static int inode_renumber(struct gfs2_sbd *sbp, uint64_t root_inode_addr, osi_li
 						sizeof(struct gfs2_rgrp);
 					/* if it's on this page */
 					if (buf_offset + bitmap_byte < sbp->bsize) {
-						bi->bi_bh->b_data[buf_offset + bitmap_byte] &=
-							~(0x03 << (GFS2_BIT_SIZE * byte_bit));
-						bi->bi_bh->b_data[buf_offset + bitmap_byte] |=
-							(0x01 << (GFS2_BIT_SIZE * byte_bit));
-						bmodified(bi->bi_bh);
+						bi->bi_data[buf_offset + bitmap_byte] &=
+						           ~(0x03 << (GFS2_BIT_SIZE * byte_bit));
+						bi->bi_data[buf_offset + bitmap_byte] |=
+						            (0x01 << (GFS2_BIT_SIZE * byte_bit));
+						bi->bi_modified = 1;
 						break;
 					}
 					bitmap_byte -= (sbp->bsize - buf_offset);
@@ -1806,7 +1805,7 @@ static uint64_t rgrp_length(uint64_t size, struct gfs2_sbd *sdp)
 static int journ_space_to_rg(struct gfs2_sbd *sdp)
 {
 	int error = 0;
-	int j, x;
+	int j;
 	struct gfs_jindex *jndx;
 	struct rgrp_tree *rgd, *rgdhigh;
 	struct osi_node *n, *next = NULL;
@@ -1873,16 +1872,21 @@ static int journ_space_to_rg(struct gfs2_sbd *sdp)
 			exit(-1);
 		}
 
-		for (x = 0; x < rgd->ri.ri_length; x++)
-			rgd->bits[x].bi_bh = bget(sdp, rgd->ri.ri_addr + x);
+		rgd->bits[0].bi_data = calloc(rgd->ri.ri_length, sdp->bsize);
+		if (rgd->bits[0].bi_data == NULL) {
+			perror("");
+			exit(-1);
+		}
+		for (unsigned i = 1; i < rgd->ri.ri_length; i++)
+			rgd->bits[i].bi_data = rgd->bits[0].bi_data + (i * sdp->bsize);
 
 		convert_bitmaps(sdp, rgd);
-		for (x = 0; x < rgd->ri.ri_length; x++) {
-			if (x)
-				gfs2_meta_header_out(&mh, rgd->bits[x].bi_bh->b_data);
-			else
-				gfs2_rgrp_out(&rgd->rg, rgd->bits[x].bi_bh->b_data);
-			bmodified(rgd->bits[x].bi_bh);
+		gfs2_rgrp_out(&rgd->rg, rgd->bits[0].bi_data);
+		rgd->bits[0].bi_modified = 1;
+
+		for (unsigned i = 1; i < rgd->ri.ri_length; i++) {
+			gfs2_meta_header_out(&mh, rgd->bits[i].bi_data);
+			rgd->bits[i].bi_modified = 1;
 		}
 	} /* for each journal */
 	return error;
@@ -2341,7 +2345,7 @@ int main(int argc, char **argv)
 		fsync(sb2.device_fd); /* write the buffers to disk */
 
 		/* Now free all the in memory */
-		gfs2_rgrp_free(&sb2.rgtree);
+		gfs2_rgrp_free(&sb2, &sb2.rgtree);
 		log_notice(_("Committing changes to disk.\n"));
 		fflush(stdout);
 		/* Set filesystem type in superblock to gfs2.  We do this at the */
diff --git a/gfs2/edit/hexedit.c b/gfs2/edit/hexedit.c
index ff357fc0..b31acd8b 100644
--- a/gfs2/edit/hexedit.c
+++ b/gfs2/edit/hexedit.c
@@ -485,7 +485,7 @@ int display_block_type(struct gfs2_buffer_head *dbh, int from_restore)
 			}
 		}
 		if (rgd)
-			gfs2_rgrp_relse(rgd);
+			gfs2_rgrp_relse(&sbd, rgd);
  	}
 	if (block == sbd.sd_sb.sb_root_dir.no_addr)
 		print_gfs2("--------------- Root directory ------------------");
@@ -761,7 +761,7 @@ static void rgcount(void)
 	       (unsigned long long)sbd.md.riinode->i_di.di_size /
 	       sizeof(struct gfs2_rindex));
 	inode_put(&sbd.md.riinode);
-	gfs2_rgrp_free(&sbd.rgtree);
+	gfs2_rgrp_free(&sbd, &sbd.rgtree);
 	exit(EXIT_SUCCESS);
 }
 
@@ -1256,7 +1256,7 @@ static uint64_t find_metablockoftype_slow(uint64_t startblk, int metatype, int p
 		else
 			printf("%llu\n", (unsigned long long)blk);
 	}
-	gfs2_rgrp_free(&sbd.rgtree);
+	gfs2_rgrp_free(&sbd, &sbd.rgtree);
 	if (print)
 		exit(0);
 	return blk;
@@ -1320,7 +1320,7 @@ static uint64_t find_metablockoftype_rg(uint64_t startblk, int metatype, int pri
 	if (!rgd) {
 		if (print)
 			printf("0\n");
-		gfs2_rgrp_free(&sbd.rgtree);
+		gfs2_rgrp_free(&sbd, &sbd.rgtree);
 		if (print)
 			exit(-1);
 	}
@@ -1334,7 +1334,7 @@ static uint64_t find_metablockoftype_rg(uint64_t startblk, int metatype, int pri
 		if (found)
 			break;
 
-		gfs2_rgrp_relse(rgd);
+		gfs2_rgrp_relse(&sbd, rgd);
 	}
 
 	if (!found)
@@ -1345,7 +1345,7 @@ static uint64_t find_metablockoftype_rg(uint64_t startblk, int metatype, int pri
 		else
 			printf("%llu\n", (unsigned long long)blk);
 	}
-	gfs2_rgrp_free(&sbd.rgtree);
+	gfs2_rgrp_free(&sbd, &sbd.rgtree);
 	if (print)
 		exit(0);
 	return blk;
@@ -1379,7 +1379,7 @@ static uint64_t find_metablockoftype(const char *strtype, int print)
 			"specified: must be one of:\n");
 		fprintf(stderr, "sb rg rb di in lf jd lh ld"
 			" ea ed lb 13 qc\n");
-		gfs2_rgrp_free(&sbd.rgtree);
+		gfs2_rgrp_free(&sbd, &sbd.rgtree);
 		exit(-1);
 	}
 	return blk;
@@ -1695,7 +1695,7 @@ static void find_print_block_type(void)
 	type = get_block_type(lbh, NULL);
 	print_block_type(tblock, type, "");
 	brelse(lbh);
-	gfs2_rgrp_free(&sbd.rgtree);
+	gfs2_rgrp_free(&sbd, &sbd.rgtree);
 	exit(0);
 }
 
@@ -1738,7 +1738,7 @@ static void find_print_block_rg(int bitmap)
 			printf("-1 (block invalid or part of an rgrp).\n");
 		}
 	}
-	gfs2_rgrp_free(&sbd.rgtree);
+	gfs2_rgrp_free(&sbd, &sbd.rgtree);
 	exit(0);
 }
 
@@ -1759,7 +1759,7 @@ static void find_change_block_alloc(int *newval)
 		       *newval);
 		for (i = GFS2_BLKST_FREE; i <= GFS2_BLKST_DINODE; i++)
 			printf("%d - %s\n", i, allocdesc[sbd.gfs1][i]);
-		gfs2_rgrp_free(&sbd.rgtree);
+		gfs2_rgrp_free(&sbd, &sbd.rgtree);
 		exit(-1);
 	}
 	ablock = blockstack[blockhist % BLOCK_STACK_SIZE].block;
@@ -1783,14 +1783,14 @@ static void find_change_block_alloc(int *newval)
 				}
 				printf("%d (%s)\n", type, allocdesc[sbd.gfs1][type]);
 			}
-			gfs2_rgrp_relse(rgd);
+			gfs2_rgrp_relse(&sbd, rgd);
 		} else {
-			gfs2_rgrp_free(&sbd.rgtree);
+			gfs2_rgrp_free(&sbd, &sbd.rgtree);
 			printf("-1 (block invalid or part of an rgrp).\n");
 			exit(-1);
 		}
 	}
-	gfs2_rgrp_free(&sbd.rgtree);
+	gfs2_rgrp_free(&sbd, &sbd.rgtree);
 	if (newval)
 		fsync(sbd.device_fd);
 	exit(0);
@@ -2330,7 +2330,7 @@ static void rg_repair(void)
 	for (n = osi_first(&sbd.rgtree); n; n = osi_next(n)) {
 		rgd = (struct rgrp_tree *)n;
 		if (gfs2_rgrp_read(&sbd, rgd) == 0) { /* was read in okay */
-			gfs2_rgrp_relse(rgd);
+			gfs2_rgrp_relse(&sbd, rgd);
 			continue; /* ignore it */
 		}
 		/* If we get here, it's because we have an rgrp in the rindex
@@ -2522,7 +2522,7 @@ static void process_parameters(int argc, char *argv[], int pass)
 				printf("Error: field not specified.\n");
 				printf("Format is: %s -p <block> field "
 				       "<field> [newvalue]\n", argv[0]);
-				gfs2_rgrp_free(&sbd.rgtree);
+				gfs2_rgrp_free(&sbd, &sbd.rgtree);
 				exit(EXIT_FAILURE);
 			}
 			process_field(argv[i], argv[i + 1]);
@@ -2555,7 +2555,7 @@ static void process_parameters(int argc, char *argv[], int pass)
 				printf("Error: rg # not specified.\n");
 				printf("Format is: %s rgflags rgnum"
 				       "[newvalue]\n", argv[0]);
-				gfs2_rgrp_free(&sbd.rgtree);
+				gfs2_rgrp_free(&sbd, &sbd.rgtree);
 				exit(EXIT_FAILURE);
 			}
 			if (argv[i][0]=='0' && argv[i][1]=='x')
@@ -2572,16 +2572,16 @@ static void process_parameters(int argc, char *argv[], int pass)
 					new_flags = atoi(argv[i]);
 			}
 			set_rgrp_flags(rg, new_flags, set, FALSE);
-			gfs2_rgrp_free(&sbd.rgtree);
+			gfs2_rgrp_free(&sbd, &sbd.rgtree);
 			exit(EXIT_SUCCESS);
 		} else if (!strcmp(argv[i], "rg")) {
 			int rg;
-				
+
 			i++;
 			if (i >= argc - 1) {
 				printf("Error: rg # not specified.\n");
 				printf("Format is: %s rg rgnum\n", argv[0]);
-				gfs2_rgrp_free(&sbd.rgtree);
+				gfs2_rgrp_free(&sbd, &sbd.rgtree);
 				exit(EXIT_FAILURE);
 			}
 			rg = atoi(argv[i]);
@@ -2590,7 +2590,7 @@ static void process_parameters(int argc, char *argv[], int pass)
 				push_block(temp_blk);
 			} else {
 				set_rgrp_flags(rg, 0, FALSE, TRUE);
-				gfs2_rgrp_free(&sbd.rgtree);
+				gfs2_rgrp_free(&sbd, &sbd.rgtree);
 				exit(EXIT_SUCCESS);
 			}
 		} else if (!strcmp(argv[i], "rgbitmaps")) {
@@ -2603,7 +2603,7 @@ static void process_parameters(int argc, char *argv[], int pass)
 				printf("Error: rg # not specified.\n");
 				printf("Format is: %s rgbitmaps rgnum\n",
 				       argv[0]);
-				gfs2_rgrp_free(&sbd.rgtree);
+				gfs2_rgrp_free(&sbd, &sbd.rgtree);
 				exit(EXIT_FAILURE);
 			}
 			rg = atoi(argv[i]);
@@ -2611,7 +2611,7 @@ static void process_parameters(int argc, char *argv[], int pass)
 			rgd = gfs2_blk2rgrpd(&sbd, rgblk);
 			if (rgd == NULL) {
 				printf("Error: rg # is invalid.\n");
-				gfs2_rgrp_free(&sbd.rgtree);
+				gfs2_rgrp_free(&sbd, &sbd.rgtree);
 				exit(EXIT_FAILURE);
 			}
 			for (bmap = 0; bmap < rgd->ri.ri_length; bmap++)
@@ -2717,6 +2717,6 @@ int main(int argc, char *argv[])
 	close(fd);
 	if (indirect)
 		free(indirect);
-	gfs2_rgrp_free(&sbd.rgtree);
+	gfs2_rgrp_free(&sbd, &sbd.rgtree);
  	exit(EXIT_SUCCESS);
 }
diff --git a/gfs2/edit/journal.c b/gfs2/edit/journal.c
index 6364761f..9139855b 100644
--- a/gfs2/edit/journal.c
+++ b/gfs2/edit/journal.c
@@ -253,7 +253,7 @@ static int print_ld_blks(const uint64_t *b, const char *end, int start_line,
 			if (tblk && rgd && (be64_to_cpu(*b) == bitblk)) {
 				int type, bmap = 0;
 				uint64_t o;
-				struct gfs2_buffer_head *save_bh;
+				char *save_ptr;
 
 				found_bblk = 1;
 				print_gfs2("<-------------------------");
@@ -266,17 +266,17 @@ static int print_ld_blks(const uint64_t *b, const char *end, int start_line,
 						      sizeof(struct gfs2_meta_header))
 							* GFS2_NBBY;
 					bmap = o / sbd.sd_blocks_per_bitmap;
-					save_bh = rgd->bits[bmap].bi_bh;
+					save_ptr = rgd->bits[bmap].bi_data;
 					j_bmap_bh = bread(&sbd, abs_block +
 							  bcount);
-					rgd->bits[bmap].bi_bh = j_bmap_bh;
+					rgd->bits[bmap].bi_data = j_bmap_bh->b_data;
 					type = lgfs2_get_bitmap(&sbd, tblk, rgd);
 					brelse(j_bmap_bh);
 					if (type < 0) {
 						perror("Error printing log descriptor blocks");
 						exit(1);
 					}
-					rgd->bits[bmap].bi_bh = save_bh;
+					rgd->bits[bmap].bi_data = save_ptr;
 					print_gfs2("bit for blk 0x%llx is %d "
 						   "(%s)",
 						   (unsigned long long)tblk,
diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index 846b6150..11c83553 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -896,28 +896,28 @@ static void save_allocated(struct rgrp_tree *rgd, struct metafd *mfd)
    want to save rgrp headers even if they're corrupt. */
 static int rgrp_read(struct gfs2_sbd *sdp, struct rgrp_tree *rgd)
 {
-	unsigned x, length = rgd->ri.ri_length;
-	struct gfs2_buffer_head **bhs;
+	unsigned length = rgd->ri.ri_length * sdp->bsize;
+	off_t off = rgd->ri.ri_addr * sdp->bsize;
+	char *buf;
 
 	if (length == 0 || gfs2_check_range(sdp, rgd->ri.ri_addr))
 		return -1;
 
-	bhs = calloc(length, sizeof(struct gfs2_buffer_head *));
-	if (bhs == NULL)
+	buf = calloc(1, length);
+	if (buf == NULL)
 		return -1;
 
-	if (breadm(sdp, bhs, length, rgd->ri.ri_addr)) {
-		free(bhs);
+	if (pread(sdp->device_fd, buf, length, off) != length) {
+		free(buf);
 		return -1;
 	}
-	for (x = 0; x < length; x++)
-		rgd->bits[x].bi_bh = bhs[x];
+	for (unsigned i = 0; i < rgd->ri.ri_length; i++)
+		rgd->bits[i].bi_data = buf + (i * sdp->bsize);
 
 	if (sdp->gfs1)
-		gfs_rgrp_in((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_bh->b_data);
+		gfs_rgrp_in((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_data);
 	else
-		gfs2_rgrp_in(&rgd->rg, rgd->bits[0].bi_bh->b_data);
-	free(bhs);
+		gfs2_rgrp_in(&rgd->rg, rgd->bits[0].bi_data);
 	return 0;
 }
 
@@ -932,13 +932,17 @@ static void save_rgrp(struct metafd *mfd, struct rgrp_tree *rgd, int withcontent
 		  addr, addr, rgd->ri.ri_length);
 	/* Save the rg and bitmaps */
 	for (i = 0; i < rgd->ri.ri_length; i++) {
+		struct gfs2_buffer_head tmpbh = {
+			.b_data = rgd->bits[i].bi_data,
+			.b_blocknr = rgd->ri.ri_addr + i
+		};
 		warm_fuzzy_stuff(rgd->ri.ri_addr + i, FALSE);
-		save_bh(mfd, rgd->bits[i].bi_bh, 0, NULL);
+		save_bh(mfd, &tmpbh, 0, NULL);
 	}
 	/* Save the other metadata: inodes, etc. if mode is not 'savergs' */
 	if (withcontents)
 		save_allocated(rgd, mfd);
-	gfs2_rgrp_relse(rgd);
+	gfs2_rgrp_relse(&sbd, rgd);
 }
 
 static int save_header(struct metafd *mfd, uint64_t fsbytes)
@@ -1054,7 +1058,7 @@ void savemeta(char *out_fn, int saveoption, int gziplevel)
 	close(sbd.device_fd);
 	destroy_per_node_lookup();
 	free(indirect);
-	gfs2_rgrp_free(&sbd.rgtree);
+	gfs2_rgrp_free(&sbd, &sbd.rgtree);
 	exit(0);
 }
 
diff --git a/gfs2/fsck/fs_recovery.c b/gfs2/fsck/fs_recovery.c
index 0e029db0..bc9fec3a 100644
--- a/gfs2/fsck/fs_recovery.c
+++ b/gfs2/fsck/fs_recovery.c
@@ -104,16 +104,16 @@ static void refresh_rgrp(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
 	log_debug(_("Block is part of rgrp 0x%llx; refreshing the rgrp.\n"),
 		  (unsigned long long)rgd->ri.ri_addr);
 	for (i = 0; i < rgd->ri.ri_length; i++) {
-		if (rgd->bits[i].bi_bh->b_blocknr != blkno)
+		if (rgd->ri.ri_addr + i != blkno)
 			continue;
 
-		memcpy(rgd->bits[i].bi_bh->b_data, bh->b_data, sdp->bsize);
-		bmodified(rgd->bits[i].bi_bh);
+		memcpy(rgd->bits[i].bi_data, bh->b_data, sdp->bsize);
+		rgd->bits[i].bi_modified = 1;
 		if (i == 0) { /* this is the rgrp itself */
 			if (sdp->gfs1)
-				gfs_rgrp_in((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_bh->b_data);
+				gfs_rgrp_in((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_data);
 			else
-				gfs2_rgrp_in(&rgd->rg, rgd->bits[0].bi_bh->b_data);
+				gfs2_rgrp_in(&rgd->rg, rgd->bits[0].bi_data);
 		}
 		break;
 	}
diff --git a/gfs2/fsck/initialize.c b/gfs2/fsck/initialize.c
index 374117b7..ecda56e2 100644
--- a/gfs2/fsck/initialize.c
+++ b/gfs2/fsck/initialize.c
@@ -113,7 +113,7 @@ static void gfs2_inodetree_free(void)
 static void empty_super_block(struct gfs2_sbd *sdp)
 {
 	log_info( _("Freeing buffers.\n"));
-	gfs2_rgrp_free(&sdp->rgtree);
+	gfs2_rgrp_free(sdp, &sdp->rgtree);
 
 	gfs2_inodetree_free();
 	gfs2_dirtree_free();
@@ -223,7 +223,7 @@ static void check_rgrp_integrity(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
 		for (x = 0; x < bytes_to_check; x++) {
 			unsigned char *byte;
 
-			byte = (unsigned char *)&rgd->bits[rgb].bi_bh->b_data[off + x];
+			byte = (unsigned char *)&rgd->bits[rgb].bi_data[off + x];
 			if (*byte == 0x55) {
 				diblock += GFS2_NBBY;
 				continue;
@@ -287,7 +287,7 @@ static void check_rgrp_integrity(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
 				}
 				*byte &= ~(GFS2_BIT_MASK <<
 					   (GFS2_BIT_SIZE * y));
-				bmodified(rgd->bits[rgb].bi_bh);
+				rgd->bits[rgb].bi_modified = 1;
 				rg_reclaimed++;
 				rg_free++;
 				rgd->rg.rg_free++;
@@ -324,10 +324,10 @@ static void check_rgrp_integrity(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
 	   will be reported. */
 	if (rg_reclaimed && *fixit) {
 		if (sdp->gfs1)
-			gfs_rgrp_out((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_bh->b_data);
+			gfs_rgrp_out((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_data);
 		else
-			gfs2_rgrp_out(&rgd->rg, rgd->bits[0].bi_bh->b_data);
-		bmodified(rgd->bits[0].bi_bh);
+			gfs2_rgrp_out(&rgd->rg, rgd->bits[0].bi_data);
+		rgd->bits[0].bi_modified = 1;
 		*this_rg_cleaned = 1;
 		log_info( _("The rgrp at %lld (0x%llx) was cleaned of %d "
 			    "free metadata blocks.\n"),
@@ -346,10 +346,10 @@ static void check_rgrp_integrity(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
 		if (query( _("Fix the rgrp free blocks count? (y/n)"))) {
 			rgd->rg.rg_free = rg_free;
 			if (sdp->gfs1)
-				gfs_rgrp_out((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_bh->b_data);
+				gfs_rgrp_out((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_data);
 			else
-				gfs2_rgrp_out(&rgd->rg, rgd->bits[0].bi_bh->b_data);
-			bmodified(rgd->bits[0].bi_bh);
+				gfs2_rgrp_out(&rgd->rg, rgd->bits[0].bi_data);
+			rgd->bits[0].bi_modified = 1;
 			*this_rg_fixed = 1;
 			log_err( _("The rgrp was fixed.\n"));
 		} else
@@ -368,8 +368,8 @@ static void check_rgrp_integrity(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
 			 gfs1rg->rg_freemeta, rg_unlinked);
 		if (query( _("Fix the rgrp free meta blocks count? (y/n)"))) {
 			gfs1rg->rg_freemeta = rg_unlinked;
-			gfs_rgrp_out((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_bh->b_data);
-			bmodified(rgd->bits[0].bi_bh);
+			gfs_rgrp_out((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_data);
+			rgd->bits[0].bi_modified = 1;
 			*this_rg_fixed = 1;
 			log_err( _("The rgrp was fixed.\n"));
 		} else
@@ -385,8 +385,8 @@ static void check_rgrp_integrity(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
 			 gfs1rg->rg_useddi, rg_useddi);
 		if (query( _("Fix the rgrp used dinode block count? (y/n)"))) {
 			gfs1rg->rg_useddi = rg_useddi;
-			gfs_rgrp_out((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_bh->b_data);
-			bmodified(rgd->bits[0].bi_bh);
+			gfs_rgrp_out((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_data);
+			rgd->bits[0].bi_modified = 1;
 			*this_rg_fixed = 1;
 			log_err( _("The rgrp was fixed.\n"));
 		} else
@@ -402,8 +402,8 @@ static void check_rgrp_integrity(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
 			 gfs1rg->rg_usedmeta, rg_usedmeta);
 		if (query( _("Fix the rgrp used meta blocks count? (y/n)"))) {
 			gfs1rg->rg_usedmeta = rg_usedmeta;
-			gfs_rgrp_out((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_bh->b_data);
-			bmodified(rgd->bits[0].bi_bh);
+			gfs_rgrp_out((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_data);
+			rgd->bits[0].bi_modified = 1;
 			*this_rg_fixed = 1;
 			log_err( _("The rgrp was fixed.\n"));
 		} else
diff --git a/gfs2/fsck/metawalk.c b/gfs2/fsck/metawalk.c
index 8729d488..265fa760 100644
--- a/gfs2/fsck/metawalk.c
+++ b/gfs2/fsck/metawalk.c
@@ -155,10 +155,10 @@ int check_n_fix_bitmap(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
 	}
 	if (rewrite_rgrp) {
 		if (sdp->gfs1)
-			gfs_rgrp_out((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_bh->b_data);
+			gfs_rgrp_out((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_data);
 		else
-			gfs2_rgrp_out(&rgd->rg, rgd->bits[0].bi_bh->b_data);
-		bmodified(rgd->bits[0].bi_bh);
+			gfs2_rgrp_out(&rgd->rg, rgd->bits[0].bi_data);
+		rgd->bits[0].bi_modified = 1;
 	}
 	log_err( _("The bitmap was fixed.\n"));
 	return 0;
diff --git a/gfs2/fsck/pass5.c b/gfs2/fsck/pass5.c
index 8e3f37c1..33265bfa 100644
--- a/gfs2/fsck/pass5.c
+++ b/gfs2/fsck/pass5.c
@@ -139,7 +139,7 @@ static void update_rgrp(struct gfs2_sbd *sdp, struct rgrp_tree *rgp,
 		bits = &rgp->bits[i];
 
 		/* update the bitmaps */
-		if (check_block_status(sdp, bl, bits->bi_bh->b_data + bits->bi_offset,
+		if (check_block_status(sdp, bl, bits->bi_data + bits->bi_offset,
 		                       bits->bi_len, &rg_block, rgp->ri.ri_data0, count))
 			return;
 		if (skip_this_pass || fsck_abort) /* if asked to skip the rest */
@@ -201,9 +201,10 @@ static void update_rgrp(struct gfs2_sbd *sdp, struct rgrp_tree *rgp,
 			log_warn( _("Resource group counts updated\n"));
 			/* write out the rgrp */
 			if (sdp->gfs1)
-				gfs_rgrp_out(gfs1rg, rgp->bits[0].bi_bh->b_data);
+				gfs_rgrp_out(gfs1rg, rgp->bits[0].bi_data);
 			else
-				gfs2_rgrp_out(&rgp->rg, rgp->bits[0].bi_bh->b_data);
+				gfs2_rgrp_out(&rgp->rg, rgp->bits[0].bi_data);
+			rgp->bits[0].bi_modified = 1;
 		} else
 			log_err( _("Resource group counts left inconsistent\n"));
 	}
diff --git a/gfs2/fsck/rgrepair.c b/gfs2/fsck/rgrepair.c
index 97d3a907..ce0e48e0 100644
--- a/gfs2/fsck/rgrepair.c
+++ b/gfs2/fsck/rgrepair.c
@@ -490,8 +490,8 @@ static uint64_t hunt_and_peck(struct gfs2_sbd *sdp, uint64_t blk,
 }
 
 /*
- * gfs2_rindex_rebuild - rebuild a corrupt Resource Group (RG) index manually
- *                        where trust_lvl == distrust
+ * rindex_rebuild - rebuild a corrupt Resource Group (RG) index manually
+ *                  where trust_lvl == distrust
  *
  * If this routine is called, it means we have RGs in odd/unexpected places,
  * and there is a corrupt RG or RG index entry.  It also means we can't trust
@@ -517,8 +517,7 @@ static uint64_t hunt_and_peck(struct gfs2_sbd *sdp, uint64_t blk,
  * from gfs1 to gfs2 after a gfs_grow operation.  In that case, the rgrps
  * will not be on predictable boundaries.
  */
-static int gfs2_rindex_rebuild(struct gfs2_sbd *sdp, int *num_rgs,
-			       int gfs_grow)
+static int rindex_rebuild(struct gfs2_sbd *sdp, int *num_rgs, int gfs_grow)
 {
 	struct osi_node *n, *next = NULL;
 	struct gfs2_buffer_head *bh;
@@ -601,8 +600,7 @@ static int gfs2_rindex_rebuild(struct gfs2_sbd *sdp, int *num_rgs,
 			else
 				break; /* end of bitmap, so call it quits. */
 		} /* for subsequent bitmaps */
-		
-		gfs2_compute_bitstructs(sdp->sd_sb.sb_bsize, calc_rgd);
+
 		calc_rgd->ri.ri_data0 = calc_rgd->ri.ri_addr +
 			calc_rgd->ri.ri_length;
 		if (prev_rgd) {
@@ -700,6 +698,7 @@ static int gfs2_rindex_rebuild(struct gfs2_sbd *sdp, int *num_rgs,
 out:
 	for (j = 0; j < sdp->md.journals; j++)
 		inode_put(&sdp->md.journal[j]);
+	inode_put(&sdp->md.jiinode);
 	free(sdp->md.journal);
 	return error;
 }
@@ -865,7 +864,7 @@ static int gfs2_rindex_calculate(struct gfs2_sbd *sdp, int *num_rgs)
 	}
 	/* Compute the default resource group layout as mkfs would have done */
 	compute_rgrp_layout(sdp, &sdp->rgcalc, TRUE);
-	if (build_rgrps(sdp, FALSE)) { /* FALSE = calc but don't write to disk. */
+	if (build_rgrps(sdp)) { /* Calculate but don't write to disk. */
 		fprintf(stderr, _("Failed to build resource groups\n"));
 		exit(-1);
 	}
@@ -884,41 +883,60 @@ static int rewrite_rg_block(struct gfs2_sbd *sdp, struct rgrp_tree *rg,
 {
 	int x = errblock - rg->ri.ri_addr;
 	const char *typedesc = x ? "GFS2_METATYPE_RB" : "GFS2_METATYPE_RG";
+	ssize_t ret;
+	char *buf;
 
 	log_err( _("Block #%lld (0x%llx) (%d of %d) is not %s.\n"),
 		 (unsigned long long)rg->ri.ri_addr + x,
 		 (unsigned long long)rg->ri.ri_addr + x,
 		 (int)x+1, (int)rg->ri.ri_length, typedesc);
-	if (query( _("Fix the Resource Group? (y/n)"))) {
-		log_err( _("Attempting to repair the rgrp.\n"));
-		rg->bits[x].bi_bh = bread(sdp, rg->ri.ri_addr + x);
-		if (x) {
-			struct gfs2_meta_header mh;
-
-			mh.mh_magic = GFS2_MAGIC;
-			mh.mh_type = GFS2_METATYPE_RB;
-			mh.mh_format = GFS2_FORMAT_RB;
-			gfs2_meta_header_out(&mh, rg->bits[x].bi_bh->b_data);
-		} else {
-			if (sdp->gfs1)
-				memset(&rg->rg, 0, sizeof(struct gfs_rgrp));
-			else
-				memset(&rg->rg, 0, sizeof(struct gfs2_rgrp));
-			rg->rg.rg_header.mh_magic = GFS2_MAGIC;
-			rg->rg.rg_header.mh_type = GFS2_METATYPE_RG;
-			rg->rg.rg_header.mh_format = GFS2_FORMAT_RG;
-			rg->rg.rg_free = rg->ri.ri_data;
-			if (sdp->gfs1)
-				gfs_rgrp_out((struct gfs_rgrp *)&rg->rg, rg->bits[x].bi_bh->b_data);
-			else
-				gfs2_rgrp_out(&rg->rg, rg->bits[x].bi_bh->b_data);
-		}
-		bmodified(rg->bits[x].bi_bh);
-		brelse(rg->bits[x].bi_bh);
-		rg->bits[x].bi_bh = NULL;
-		return 0;
+	if (!query( _("Fix the resource group? (y/n)")))
+		return 1;
+
+	log_err(_("Attempting to repair the resource group.\n"));
+
+	buf = calloc(1, sdp->bsize);
+	if (buf == NULL) {
+		log_err(_("Failed to allocate resource group block: %s"), strerror(errno));
+		return 1;
 	}
-	return 1;
+	ret = pread(sdp->device_fd, buf, sdp->bsize, errblock * sdp->bsize);
+	if (ret != sdp->bsize) {
+		log_err(_("Failed to read resource group block %"PRIu64": %s\n"),
+		        errblock, strerror(errno));
+		free(buf);
+		return 1;
+	}
+	if (x) {
+		struct gfs2_meta_header mh = {
+			.mh_magic = GFS2_MAGIC,
+			.mh_type = GFS2_METATYPE_RB,
+			.mh_format = GFS2_FORMAT_RB
+		};
+		gfs2_meta_header_out(&mh, buf);
+	} else {
+		if (sdp->gfs1)
+			memset(&rg->rg, 0, sizeof(struct gfs_rgrp));
+		else
+			memset(&rg->rg, 0, sizeof(struct gfs2_rgrp));
+		rg->rg.rg_header.mh_magic = GFS2_MAGIC;
+		rg->rg.rg_header.mh_type = GFS2_METATYPE_RG;
+		rg->rg.rg_header.mh_format = GFS2_FORMAT_RG;
+		rg->rg.rg_free = rg->ri.ri_data;
+		if (sdp->gfs1)
+			gfs_rgrp_out((struct gfs_rgrp *)&rg->rg, buf);
+		else
+			gfs2_rgrp_out(&rg->rg, buf);
+	}
+	ret = pwrite(sdp->device_fd, buf, sdp->bsize, errblock * sdp->bsize);
+	if (ret != sdp->bsize) {
+		log_err(_("Failed to write resource group block %"PRIu64": %s\n"),
+		        errblock, strerror(errno));
+		free(buf);
+		return 1;
+	}
+	free(buf);
+	return 0;
 }
 
 /*
@@ -982,37 +1000,37 @@ int rg_repair(struct gfs2_sbd *sdp, int trust_lvl, int *rg_count, int *sane)
 		}
 		error = expect_rindex_sanity(sdp, &calc_rg_count);
 		if (error) {
-			gfs2_rgrp_free(&sdp->rgcalc);
+			gfs2_rgrp_free(sdp, &sdp->rgcalc);
 			return error;
 		}
 	} else if (trust_lvl == open_minded) { /* If we can't trust RG index */
 		/* Free previous incarnations in memory, if any. */
-		gfs2_rgrp_free(&sdp->rgtree);
+		gfs2_rgrp_free(sdp, &sdp->rgtree);
 
 		/* Calculate our own RG index for comparison */
 		error = gfs2_rindex_calculate(sdp, &calc_rg_count);
 		if (error) { /* If calculated RGs don't match the fs */
-			gfs2_rgrp_free(&sdp->rgcalc);
+			gfs2_rgrp_free(sdp, &sdp->rgcalc);
 			return -1;
 		}
 	} else if (trust_lvl == distrust) { /* If we can't trust RG index */
 		/* Free previous incarnations in memory, if any. */
-		gfs2_rgrp_free(&sdp->rgtree);
+		gfs2_rgrp_free(sdp, &sdp->rgtree);
 
-		error = gfs2_rindex_rebuild(sdp, &calc_rg_count, 0);
+		error = rindex_rebuild(sdp, &calc_rg_count, 0);
 		if (error) {
 			log_crit( _("Error rebuilding rgrp list.\n"));
-			gfs2_rgrp_free(&sdp->rgcalc);
+			gfs2_rgrp_free(sdp, &sdp->rgcalc);
 			return -1;
 		}
 	} else if (trust_lvl == indignation) { /* If we can't trust anything */
 		/* Free previous incarnations in memory, if any. */
-		gfs2_rgrp_free(&sdp->rgtree);
+		gfs2_rgrp_free(sdp, &sdp->rgtree);
 
-		error = gfs2_rindex_rebuild(sdp, &calc_rg_count, 1);
+		error = rindex_rebuild(sdp, &calc_rg_count, 1);
 		if (error) {
 			log_crit( _("Error rebuilding rgrp list.\n"));
-			gfs2_rgrp_free(&sdp->rgcalc);
+			gfs2_rgrp_free(sdp, &sdp->rgcalc);
 			return -1;
 		}
 	}
@@ -1023,8 +1041,8 @@ int rg_repair(struct gfs2_sbd *sdp, int trust_lvl, int *rg_count, int *sane)
 		log_warn( _("WARNING: rindex file has an invalid size.\n"));
 		if (!query( _("Truncate the rindex size? (y/n)"))) {
 			log_err(_("The rindex was not repaired.\n"));
-			gfs2_rgrp_free(&sdp->rgcalc);
-			gfs2_rgrp_free(&sdp->rgtree);
+			gfs2_rgrp_free(sdp, &sdp->rgcalc);
+			gfs2_rgrp_free(sdp, &sdp->rgtree);
 			return -1;
 		}
 		sdp->md.riinode->i_di.di_size /= sizeof(struct gfs2_rindex);
@@ -1048,8 +1066,8 @@ int rg_repair(struct gfs2_sbd *sdp, int trust_lvl, int *rg_count, int *sane)
 		   then try again with a little more distrust. */
 		if ((trust_lvl < distrust) ||
 		    !query( _("Attempt to use what rgrps we can? (y/n)"))) {
-			gfs2_rgrp_free(&sdp->rgcalc);
-			gfs2_rgrp_free(&sdp->rgtree);
+			gfs2_rgrp_free(sdp, &sdp->rgcalc);
+			gfs2_rgrp_free(sdp, &sdp->rgtree);
 			log_err(_("The rindex was not repaired.\n"));
 			return -1;
 		}
@@ -1118,8 +1136,8 @@ int rg_repair(struct gfs2_sbd *sdp, int trust_lvl, int *rg_count, int *sane)
 			log_warn( _("%d out of %d rgrps (%d percent) did not "
 				    "match what was expected.\n"),
 				  discrepancies, rg, percent);
-			gfs2_rgrp_free(&sdp->rgcalc);
-			gfs2_rgrp_free(&sdp->rgtree);
+			gfs2_rgrp_free(sdp, &sdp->rgcalc);
+			gfs2_rgrp_free(sdp, &sdp->rgtree);
 			return -1;
 		}
 	}
@@ -1224,15 +1242,15 @@ int rg_repair(struct gfs2_sbd *sdp, int trust_lvl, int *rg_count, int *sane)
 				prev_err = errblock;
 				rewrite_rg_block(sdp, rgd, errblock);
 			} else {
-				gfs2_rgrp_relse(rgd);
+				gfs2_rgrp_relse(sdp, rgd);
 				break;
 			}
 			i++;
 		} while (i < rgd->ri.ri_length);
 	}
 	*rg_count = rg;
-	gfs2_rgrp_free(&sdp->rgcalc);
-	gfs2_rgrp_free(&sdp->rgtree);
+	gfs2_rgrp_free(sdp, &sdp->rgcalc);
+	gfs2_rgrp_free(sdp, &sdp->rgtree);
 	/* We shouldn't need to worry about getting the user's permission to
 	   make changes here. If b_modified is true, they already gave their
 	   permission. */
diff --git a/gfs2/fsck/util.c b/gfs2/fsck/util.c
index 1c3ed9c3..0c3d68f5 100644
--- a/gfs2/fsck/util.c
+++ b/gfs2/fsck/util.c
@@ -555,7 +555,6 @@ uint64_t find_free_blk(struct gfs2_sbd *sdp)
 	struct gfs2_rgrp *rg;
 	unsigned int block, bn = 0, x = 0, y = 0;
 	unsigned int state;
-	struct gfs2_buffer_head *bh;
 
 	memset(&rg, 0, sizeof(rg));
 	for (n = osi_first(&sdp->rgtree); n; n = next) {
@@ -572,12 +571,12 @@ uint64_t find_free_blk(struct gfs2_sbd *sdp)
 	rg = &rl->rg;
 
 	for (block = 0; block < ri->ri_length; block++) {
-		bh = rl->bits[block].bi_bh;
+		char *buf = rl->bits[block].bi_data;
 		x = (block) ? sizeof(struct gfs2_meta_header) : sizeof(struct gfs2_rgrp);
 
 		for (; x < sdp->bsize; x++)
 			for (y = 0; y < GFS2_NBBY; y++) {
-				state = (bh->b_data[x] >> (GFS2_BIT_SIZE * y)) & 0x03;
+				state = (buf[x] >> (GFS2_BIT_SIZE * y)) & 0x03;
 				if (state == GFS2_BLKST_FREE)
 					return ri->ri_data0 + bn;
 				bn++;
diff --git a/gfs2/libgfs2/fs_bits.c b/gfs2/libgfs2/fs_bits.c
index e6aef558..f600f6eb 100644
--- a/gfs2/libgfs2/fs_bits.c
+++ b/gfs2/libgfs2/fs_bits.c
@@ -148,7 +148,7 @@ int gfs2_set_bitmap(lgfs2_rgrp_t rgd, uint64_t blkno, int state)
 
 	if (bits == NULL)
 		return -1;
-	byte = (unsigned char *)(bits->bi_bh->b_data + bits->bi_offset) +
+	byte = (unsigned char *)(bits->bi_data + bits->bi_offset) +
 		(rgrp_block/GFS2_NBBY - bits->bi_start);
 	bit = (rgrp_block % GFS2_NBBY) * GFS2_BIT_SIZE;
 
@@ -156,7 +156,7 @@ int gfs2_set_bitmap(lgfs2_rgrp_t rgd, uint64_t blkno, int state)
 	*byte ^= cur_state << bit;
 	*byte |= state << bit;
 
-	bmodified(bits->bi_bh);
+	bits->bi_modified = 1;
 	return 0;
 }
 
@@ -207,10 +207,10 @@ int lgfs2_get_bitmap(struct gfs2_sbd *sdp, uint64_t blkno, struct rgrp_tree *rgd
 	}
 
 	bi = &rgd->bits[i];
-	if (!bi->bi_bh)
+	if (bi->bi_data == NULL)
 		return GFS2_BLKST_FREE;
 
-	byte = (bi->bi_bh->b_data + bi->bi_offset) + (offset/GFS2_NBBY);
+	byte = (bi->bi_data + bi->bi_offset) + (offset/GFS2_NBBY);
 	bit = (offset % GFS2_NBBY) * GFS2_BIT_SIZE;
 
 	return (*byte >> bit) & GFS2_BIT_MASK;
diff --git a/gfs2/libgfs2/fs_geometry.c b/gfs2/libgfs2/fs_geometry.c
index df8a13a9..7de6e777 100644
--- a/gfs2/libgfs2/fs_geometry.c
+++ b/gfs2/libgfs2/fs_geometry.c
@@ -46,24 +46,14 @@ uint32_t rgblocks2bitblocks(const unsigned int bsize, const uint32_t rgblocks, u
  * If fd > 0, write the data to the given file handle.
  * Otherwise, use gfs2 buffering in buf.c.
  */
-int build_rgrps(struct gfs2_sbd *sdp, int do_write)
+int build_rgrps(struct gfs2_sbd *sdp)
 {
 	struct osi_node *n, *next = NULL;
 	struct rgrp_tree *rl;
 	uint32_t rgblocks, bitblocks;
 	struct gfs2_rindex *ri;
-	struct gfs2_meta_header mh;
-	unsigned int x;
 
-	mh.mh_magic = GFS2_MAGIC;
-	mh.mh_type = GFS2_METATYPE_RB;
-	mh.mh_format = GFS2_FORMAT_RB;
-	if (do_write)
-		n = osi_first(&sdp->rgtree);
-	else
-		n = osi_first(&sdp->rgcalc);
-
-	for (; n; n = next) {
+	for (n = osi_first(&sdp->rgcalc); n; n = next) {
 		next = osi_next(n);
 		rl = (struct rgrp_tree *)n;
 		ri = &rl->ri;
@@ -85,17 +75,6 @@ int build_rgrps(struct gfs2_sbd *sdp, int do_write)
 		if (gfs2_compute_bitstructs(sdp->sd_sb.sb_bsize, rl))
 			return -1;
 
-		if (do_write) {
-			for (x = 0; x < bitblocks; x++) {
-				rl->bits[x].bi_bh = bget(sdp, rl->start + x);
-				if (x)
-					gfs2_meta_header_out(&mh, rl->bits[x].bi_bh->b_data);
-				else
-					gfs2_rgrp_out(&rl->rg, rl->bits[x].bi_bh->b_data);
-				bmodified(rl->bits[x].bi_bh);
-			}
-		}
-
 		if (cfg_debug) {
 			printf("\n");
 			gfs2_rindex_print(ri);
diff --git a/gfs2/libgfs2/fs_ops.c b/gfs2/libgfs2/fs_ops.c
index b2ea0036..b5363c05 100644
--- a/gfs2/libgfs2/fs_ops.c
+++ b/gfs2/libgfs2/fs_ops.c
@@ -127,7 +127,7 @@ static uint64_t find_free_block(struct rgrp_tree *rgd)
 		unsigned long blk = 0;
 		struct gfs2_bitmap *bits = &rgd->bits[bm];
 
-		blk = gfs2_bitfit((uint8_t *)bits->bi_bh->b_data + bits->bi_offset,
+		blk = gfs2_bitfit((uint8_t *)bits->bi_data + bits->bi_offset,
 		                  bits->bi_len, blk, GFS2_BLKST_FREE);
 		if (blk != BFITNOENT) {
 			blkno = blk + (bits->bi_start * GFS2_NBBY) + rgd->ri.ri_data0;
@@ -156,10 +156,10 @@ static int blk_alloc_in_rg(struct gfs2_sbd *sdp, unsigned state, struct rgrp_tre
 
 	rgd->rg.rg_free--;
 	if (sdp->gfs1)
-		gfs_rgrp_out((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_bh->b_data);
+		gfs_rgrp_out((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_data);
 	else
-		gfs2_rgrp_out(&rgd->rg, rgd->bits[0].bi_bh->b_data);
-	bmodified(rgd->bits[0].bi_bh);
+		gfs2_rgrp_out(&rgd->rg, rgd->bits[0].bi_data);
+	rgd->bits[0].bi_modified = 1;
 	sdp->blks_alloced++;
 	return 0;
 }
@@ -185,7 +185,7 @@ static int block_alloc(struct gfs2_sbd *sdp, const uint64_t blksreq, int state,
 	if (rgt == NULL)
 		return -1;
 
-	if (rgt->bits[0].bi_bh == NULL) {
+	if (rgt->bits[0].bi_data == NULL) {
 		if (gfs2_rgrp_read(sdp, rgt))
 			return -1;
 		release = 1;
@@ -194,7 +194,7 @@ static int block_alloc(struct gfs2_sbd *sdp, const uint64_t blksreq, int state,
 	bn = find_free_block(rgt);
 	ret = blk_alloc_in_rg(sdp, state, rgt, bn, dinode);
 	if (release)
-		gfs2_rgrp_relse(rgt);
+		gfs2_rgrp_relse(sdp, rgt);
 	*blkno = bn;
 	return ret;
 }
@@ -1928,10 +1928,10 @@ void gfs2_free_block(struct gfs2_sbd *sdp, uint64_t block)
 		gfs2_set_bitmap(rgd, block, GFS2_BLKST_FREE);
 		rgd->rg.rg_free++; /* adjust the free count */
 		if (sdp->gfs1)
-			gfs_rgrp_out((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_bh->b_data);
+			gfs_rgrp_out((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_data);
 		else
-			gfs2_rgrp_out(&rgd->rg, rgd->bits[0].bi_bh->b_data);
-		bmodified(rgd->bits[0].bi_bh);
+			gfs2_rgrp_out(&rgd->rg, rgd->bits[0].bi_data);
+		rgd->bits[0].bi_modified = 1;
 		sdp->blks_alloced--;
 	}
 }
@@ -1998,10 +1998,10 @@ int gfs2_freedi(struct gfs2_sbd *sdp, uint64_t diblock)
 	rgd->rg.rg_free++;
 	rgd->rg.rg_dinodes--;
 	if (sdp->gfs1)
-		gfs_rgrp_out((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_bh->b_data);
+		gfs_rgrp_out((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_data);
 	else
-		gfs2_rgrp_out(&rgd->rg, rgd->bits[0].bi_bh->b_data);
-	bmodified(rgd->bits[0].bi_bh);
+		gfs2_rgrp_out(&rgd->rg, rgd->bits[0].bi_data);
+	rgd->bits[0].bi_modified = 1;
 	sdp->dinodes_alloced--;
 	return 0;
 }
diff --git a/gfs2/libgfs2/gfs2l.c b/gfs2/libgfs2/gfs2l.c
index a8aa5fa6..ba2d5f15 100644
--- a/gfs2/libgfs2/gfs2l.c
+++ b/gfs2/libgfs2/gfs2l.c
@@ -182,7 +182,7 @@ int main(int argc, char *argv[])
 		lgfs2_lang_result_free(&result);
 	}
 
-	gfs2_rgrp_free(&sbd.rgtree);
+	gfs2_rgrp_free(&sbd, &sbd.rgtree);
 	inode_put(&sbd.md.riinode);
 	inode_put(&sbd.master_dir);
 	lgfs2_lang_free(&state);
diff --git a/gfs2/libgfs2/lang.c b/gfs2/libgfs2/lang.c
index 62ad2ab7..69a98aad 100644
--- a/gfs2/libgfs2/lang.c
+++ b/gfs2/libgfs2/lang.c
@@ -386,7 +386,7 @@ static int ast_get_bitstate(uint64_t bn, struct gfs2_sbd *sbd)
 		return -1;
 	}
 
-	gfs2_rgrp_relse(rgd);
+	gfs2_rgrp_relse(sbd, rgd);
 	return state;
 }
 
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index 0f2ddf47..cf225af5 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -171,10 +171,11 @@ struct device {
 
 struct gfs2_bitmap
 {
-	struct gfs2_buffer_head *bi_bh;
-	uint32_t   bi_offset;  /* The offset in the buffer of the first byte */
-	uint32_t   bi_start;   /* The position of the first byte in this block */
-	uint32_t   bi_len;     /* The number of bytes in this block */
+	char *bi_data;
+	uint32_t bi_offset;  /* The offset in the buffer of the first byte */
+	uint32_t bi_start;   /* The position of the first byte in this block */
+	uint32_t bi_len;     /* The number of bytes in this block */
+	unsigned bi_modified:1;
 };
 
 struct gfs2_sbd;
@@ -403,7 +404,7 @@ extern int gfs2_set_bitmap(lgfs2_rgrp_t rg, uint64_t blkno, int state);
 /* fs_geometry.c */
 extern uint32_t rgblocks2bitblocks(const unsigned int bsize, const uint32_t rgblocks,
                                     uint32_t *ri_data) __attribute__((nonnull(3)));
-extern int build_rgrps(struct gfs2_sbd *sdp, int write);
+extern int build_rgrps(struct gfs2_sbd *sdp);
 
 /* fs_ops.c */
 #define IS_LEAF     (1)
@@ -673,10 +674,10 @@ extern struct rgrp_tree *gfs2_blk2rgrpd(struct gfs2_sbd *sdp, uint64_t blk);
 extern int lgfs2_rgrp_crc_check(char *buf);
 extern void lgfs2_rgrp_crc_set(char *buf);
 extern uint64_t gfs2_rgrp_read(struct gfs2_sbd *sdp, struct rgrp_tree *rgd);
-extern void gfs2_rgrp_relse(struct rgrp_tree *rgd);
+extern void gfs2_rgrp_relse(struct gfs2_sbd *sdp, struct rgrp_tree *rgd);
 extern struct rgrp_tree *rgrp_insert(struct osi_root *rgtree,
 				     uint64_t rgblock);
-extern void gfs2_rgrp_free(struct osi_root *rgrp_tree);
+extern void gfs2_rgrp_free(struct gfs2_sbd *sdp, struct osi_root *rgrp_tree);
 /* figure out the size of the given resource group, in blocks */
 static inline unsigned int rgrp_size(struct rgrp_tree *rgrp)
 {
diff --git a/gfs2/libgfs2/rgrp.c b/gfs2/libgfs2/rgrp.c
index 164b3415..7f7f83fd 100644
--- a/gfs2/libgfs2/rgrp.c
+++ b/gfs2/libgfs2/rgrp.c
@@ -10,7 +10,6 @@
 #include "libgfs2.h"
 #include "rgrp.h"
 
-#define RG_SYNC_TOLERANCE 1000
 #define ROUND_UP(N, S) ((((N) + (S) - 1) / (S)) * (S))
 
 static void compute_bitmaps(lgfs2_rgrp_t rg, const unsigned bsize)
@@ -61,7 +60,7 @@ int gfs2_compute_bitstructs(const uint32_t bsize, struct rgrp_tree *rgd)
 
 	compute_bitmaps(rgd, bsize);
 	bytes_left = rgd->ri.ri_bitbytes - (rgd->bits[rgd->ri.ri_length - 1].bi_start +
-	                                   rgd->bits[rgd->ri.ri_length - 1].bi_len);
+	                                    rgd->bits[rgd->ri.ri_length - 1].bi_len);
 	errno = EINVAL;
 	if(bytes_left)
 		goto errbits;
@@ -110,7 +109,6 @@ struct rgrp_tree *gfs2_blk2rgrpd(struct gfs2_sbd *sdp, uint64_t blk)
 int lgfs2_rgrp_bitbuf_alloc(lgfs2_rgrp_t rg)
 {
 	struct gfs2_sbd *sdp = rg->rgrps->sdp;
-	struct gfs2_buffer_head *bhs;
 	size_t len = rg->ri.ri_length * sdp->bsize;
 	unsigned long io_align = sdp->bsize;
 	unsigned i;
@@ -120,23 +118,15 @@ int lgfs2_rgrp_bitbuf_alloc(lgfs2_rgrp_t rg)
 		len = ROUND_UP(len, rg->rgrps->align * sdp->bsize);
 		io_align = rg->rgrps->align_off * sdp->bsize;
 	}
-	bhs = calloc(rg->ri.ri_length, sizeof(struct gfs2_buffer_head));
-	if (bhs == NULL)
-		return 1;
-
 	if (posix_memalign((void **)&bufs, io_align, len) != 0) {
 		errno = ENOMEM;
-		free(bhs);
 		return 1;
 	}
 	memset(bufs, 0, len);
 
 	for (i = 0; i < rg->ri.ri_length; i++) {
-		rg->bits[i].bi_bh = bhs + i;
-		rg->bits[i].bi_bh->iov.iov_base = bufs + (i * sdp->bsize);
-		rg->bits[i].bi_bh->iov.iov_len = sdp->bsize;
-		rg->bits[i].bi_bh->b_blocknr = rg->ri.ri_addr + i;
-		rg->bits[i].bi_bh->sdp = sdp;
+		rg->bits[i].bi_data = bufs + (i * sdp->bsize);
+		rg->bits[i].bi_modified = 0;
 	}
 	return 0;
 }
@@ -151,10 +141,12 @@ int lgfs2_rgrp_bitbuf_alloc(lgfs2_rgrp_t rg)
 void lgfs2_rgrp_bitbuf_free(lgfs2_rgrp_t rg)
 {
 	unsigned i;
-	free(rg->bits[0].bi_bh->iov.iov_base);
-	free(rg->bits[0].bi_bh);
-	for (i = 0; i < rg->ri.ri_length; i++)
-		rg->bits[i].bi_bh = NULL;
+
+	free(rg->bits[0].bi_data);
+	for (i = 0; i < rg->ri.ri_length; i++) {
+		rg->bits[i].bi_data = NULL;
+		rg->bits[i].bi_modified = 0;
+	}
 }
 
 /**
@@ -201,61 +193,64 @@ void lgfs2_rgrp_crc_set(char *buf)
  */
 uint64_t gfs2_rgrp_read(struct gfs2_sbd *sdp, struct rgrp_tree *rgd)
 {
-	unsigned x, length = rgd->ri.ri_length;
-	struct gfs2_buffer_head **bhs;
+	unsigned length = rgd->ri.ri_length * sdp->bsize;
+	off_t offset = rgd->ri.ri_addr * sdp->bsize;
+	char *buf;
 
 	if (length == 0 || gfs2_check_range(sdp, rgd->ri.ri_addr))
 		return -1;
 
-	bhs = calloc(length, sizeof(struct gfs2_buffer_head *));
-	if (bhs == NULL)
+	buf = calloc(1, length);
+	if (buf == NULL)
 		return -1;
 
-	if (breadm(sdp, bhs, length, rgd->ri.ri_addr)) {
-		free(bhs);
+	if (pread(sdp->device_fd, buf, length, offset) != length) {
+		free(buf);
 		return -1;
 	}
 
-	for (x = 0; x < length; x++) {
-		struct gfs2_bitmap *bi = &rgd->bits[x];
-		int mtype = (x ? GFS2_METATYPE_RB : GFS2_METATYPE_RG);
-
-		bi->bi_bh = bhs[x];
-		if (gfs2_check_meta(bi->bi_bh->b_data, mtype)) {
-			unsigned err = x;
-			do {
-				brelse(rgd->bits[x].bi_bh);
-				rgd->bits[x].bi_bh = NULL;
-			} while (x-- != 0);
-			free(bhs);
-			return rgd->ri.ri_addr + err;
+	for (unsigned i = 0; i < rgd->ri.ri_length; i++) {
+		int mtype = (i ? GFS2_METATYPE_RB : GFS2_METATYPE_RG);
+
+		rgd->bits[i].bi_data = buf + (i * sdp->bsize);
+		if (gfs2_check_meta(rgd->bits[i].bi_data, mtype)) {
+			free(buf);
+			return rgd->ri.ri_addr + i;
 		}
 	}
 	if (sdp->gfs1)
-		gfs_rgrp_in((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_bh->b_data);
+		gfs_rgrp_in((struct gfs_rgrp *)&rgd->rg, buf);
 	else {
-		if (lgfs2_rgrp_crc_check(rgd->bits[0].bi_bh->b_data)) {
-			free(bhs);
+		if (lgfs2_rgrp_crc_check(buf)) {
+			free(buf);
 			return rgd->ri.ri_addr;
 		}
-		gfs2_rgrp_in(&rgd->rg, rgd->bits[0].bi_bh->b_data);
+		gfs2_rgrp_in(&rgd->rg, buf);
 	}
-	free(bhs);
 	return 0;
 }
 
-void gfs2_rgrp_relse(struct rgrp_tree *rgd)
+void gfs2_rgrp_relse(struct gfs2_sbd *sdp, struct rgrp_tree *rgd)
 {
-	int x, length = rgd->ri.ri_length;
-
 	if (rgd->bits == NULL)
 		return;
-	for (x = 0; x < length; x++) {
-		if (rgd->bits[x].bi_bh && rgd->bits[x].bi_bh->b_data) {
-			brelse(rgd->bits[x].bi_bh);
-			rgd->bits[x].bi_bh = NULL;
+	for (unsigned i = 0; i < rgd->ri.ri_length; i++) {
+		off_t offset = sdp->bsize * (rgd->ri.ri_addr + i);
+		ssize_t ret;
+
+		if (rgd->bits[i].bi_data == NULL || !rgd->bits[i].bi_modified)
+			continue;
+
+		ret = pwrite(sdp->device_fd, rgd->bits[i].bi_data, sdp->bsize, offset);
+		if (ret != sdp->bsize) {
+			fprintf(stderr, "Failed to write modified resource group at block %"PRIu64": %s\n",
+			        (uint64_t)rgd->ri.ri_addr, strerror(errno));
 		}
+		rgd->bits[i].bi_modified = 0;
 	}
+	free(rgd->bits[0].bi_data);
+	for (unsigned i = 0; i < rgd->ri.ri_length; i++)
+		rgd->bits[i].bi_data = NULL;
 }
 
 struct rgrp_tree *rgrp_insert(struct osi_root *rgtree, uint64_t rgblock)
@@ -287,31 +282,19 @@ struct rgrp_tree *rgrp_insert(struct osi_root *rgtree, uint64_t rgblock)
 	return data;
 }
 
-void gfs2_rgrp_free(struct osi_root *rgrp_tree)
+void gfs2_rgrp_free(struct gfs2_sbd *sdp, struct osi_root *rgrp_tree)
 {
 	struct rgrp_tree *rgd;
-	int rgs_since_sync = 0;
 	struct osi_node *n;
-	struct gfs2_sbd *sdp = NULL;
 
 	if (OSI_EMPTY_ROOT(rgrp_tree))
 		return;
 	while ((n = osi_first(rgrp_tree))) {
 		rgd = (struct rgrp_tree *)n;
 
-		if (rgd->bits) {
-			if (rgd->bits[0].bi_bh) { /* if a buffer exists */
-				rgs_since_sync++;
-				if (rgs_since_sync >= RG_SYNC_TOLERANCE) {
-					if (!sdp)
-						sdp = rgd->bits[0].bi_bh->sdp;
-					fsync(sdp->device_fd);
-					rgs_since_sync = 0;
-				}
-				gfs2_rgrp_relse(rgd); /* free them all. */
-			}
-			free(rgd->bits);
-		}
+		gfs2_rgrp_relse(sdp, rgd);
+		free(rgd->bits);
+		rgd->bits = NULL;
 		osi_erase(&rgd->node, rgrp_tree);
 		free(rgd);
 	}
@@ -530,11 +513,9 @@ void lgfs2_rgrps_free(lgfs2_rgrps_t *rgs)
 
 	while ((rg = (struct rgrp_tree *)osi_first(tree))) {
 		int i;
+		free(rg->bits[0].bi_data);
 		for (i = 0; i < rg->ri.ri_length; i++) {
-			if (rg->bits[i].bi_bh != NULL) {
-				free(rg->bits[i].bi_bh);
-				rg->bits[i].bi_bh = NULL;
-			}
+			rg->bits[i].bi_data = NULL;
 		}
 		osi_erase(&rg->node, tree);
 		free(rg);
@@ -697,21 +678,21 @@ int lgfs2_rgrp_write(int fd, const lgfs2_rgrp_t rg)
 	ssize_t ret;
 	size_t len;
 
-	if (rg->bits[0].bi_bh == NULL) {
+	if (rg->bits[0].bi_data == NULL) {
 		freebufs = 1;
 		if (lgfs2_rgrp_bitbuf_alloc(rg) != 0)
 			return -1;
 	}
-	gfs2_rgrp_out(&rg->rg, rg->bits[0].bi_bh->b_data);
-	for (i = 1; i < rg->ri.ri_length; i++)
-		gfs2_meta_header_out(&bmh, rg->bits[i].bi_bh->b_data);
+	gfs2_rgrp_out(&rg->rg, rg->bits[0].bi_data);
+	for (i = 1; i < rg->ri.ri_length; i++) {
+		gfs2_meta_header_out(&bmh, rg->bits[i].bi_data);
+	}
 
 	len = sdp->bsize * rg->ri.ri_length;
 	if (rg->rgrps->align > 0)
 		len = ROUND_UP(len, rg->rgrps->align * sdp->bsize);
 
-	ret = pwrite(sdp->device_fd, rg->bits[0].bi_bh->b_data, len,
-	             rg->bits[0].bi_bh->b_blocknr * sdp->bsize);
+	ret = pwrite(sdp->device_fd, rg->bits[0].bi_data, len, rg->ri.ri_addr * sdp->bsize);
 
 	if (freebufs)
 		lgfs2_rgrp_bitbuf_free(rg);
@@ -754,7 +735,7 @@ lgfs2_rgrp_t lgfs2_rgrp_last(lgfs2_rgrps_t rgs)
 int lgfs2_rbm_from_block(struct lgfs2_rbm *rbm, uint64_t block)
 {
 	uint64_t rblock = block - rbm->rgd->ri.ri_data0;
-	struct gfs2_sbd *sdp = rbm_bi(rbm)->bi_bh->sdp;
+	struct gfs2_sbd *sdp = rbm->rgd->rgrps->sdp;
 
 	if (rblock > UINT_MAX) {
 		errno = EINVAL;
@@ -813,7 +794,7 @@ static int lgfs2_rbm_incr(struct lgfs2_rbm *rbm)
 static inline uint8_t lgfs2_testbit(const struct lgfs2_rbm *rbm)
 {
 	struct gfs2_bitmap *bi = rbm_bi(rbm);
-	const uint8_t *buffer = (uint8_t *)bi->bi_bh->b_data + bi->bi_offset;
+	const uint8_t *buffer = (uint8_t *)bi->bi_data + bi->bi_offset;
 	const uint8_t *byte;
 	unsigned int bit;
 
@@ -885,6 +866,7 @@ static uint32_t lgfs2_free_extlen(const struct lgfs2_rbm *rrbm, uint32_t len)
 	uint8_t *ptr, *start, *end;
 	uint64_t block;
 	struct gfs2_bitmap *bi;
+	struct gfs2_sbd *sdp = rbm.rgd->rgrps->sdp;
 
 	if (n_unaligned &&
 	    lgfs2_unaligned_extlen(&rbm, 4 - n_unaligned, &len))
@@ -894,8 +876,8 @@ static uint32_t lgfs2_free_extlen(const struct lgfs2_rbm *rrbm, uint32_t len)
 	/* Start is now byte aligned */
 	while (len > 3) {
 		bi = rbm_bi(&rbm);
-		start = (uint8_t *)bi->bi_bh->b_data;
-		end = start + bi->bi_bh->sdp->bsize;
+		start = (uint8_t *)bi->bi_data;
+		end = start + sdp->bsize;
 		start += bi->bi_offset;
 		start += (rbm.offset / GFS2_NBBY);
 		bytes = (len / GFS2_NBBY) < (end - start) ? (len / GFS2_NBBY):(end - start);
@@ -948,8 +930,7 @@ int lgfs2_rbm_find(struct lgfs2_rbm *rbm, uint8_t state, uint32_t *minext)
 
 	for (n = 0; n < iters; n++) {
 		struct gfs2_bitmap *bi = rbm_bi(rbm);
-		struct gfs2_buffer_head *bh = bi->bi_bh;
-		uint8_t *buf = (uint8_t *)bh->b_data + bi->bi_offset;
+		uint8_t *buf = (uint8_t *)bi->bi_data + bi->bi_offset;
 		uint64_t block;
 		int ret;
 
diff --git a/gfs2/libgfs2/structures.c b/gfs2/libgfs2/structures.c
index b00c2a90..36e02c2f 100644
--- a/gfs2/libgfs2/structures.c
+++ b/gfs2/libgfs2/structures.c
@@ -667,13 +667,12 @@ unsigned lgfs2_bm_scan(struct rgrp_tree *rgd, unsigned idx, uint64_t *buf, uint8
 	uint32_t blk = 0;
 
 	while(blk < (bi->bi_len * GFS2_NBBY)) {
-		blk = gfs2_bitfit((uint8_t *)bi->bi_bh->b_data + bi->bi_offset,
+		blk = gfs2_bitfit((uint8_t *)bi->bi_data + bi->bi_offset,
 				  bi->bi_len, blk, state);
 		if (blk == BFITNOENT)
 			break;
 		buf[n++] = blk + (bi->bi_start * GFS2_NBBY) + rgd->ri.ri_data0;
 		blk++;
 	}
-
 	return n;
 }
diff --git a/gfs2/libgfs2/super.c b/gfs2/libgfs2/super.c
index 6fe29add..f38c3d72 100644
--- a/gfs2/libgfs2/super.c
+++ b/gfs2/libgfs2/super.c
@@ -346,7 +346,7 @@ static int __ri_update(struct gfs2_sbd *sdp, int fd, int *rgcount, int *sane,
 
  fail:
 	posix_fadvise(sdp->device_fd, 0, 0, POSIX_FADV_NORMAL);
-	gfs2_rgrp_free(&sdp->rgtree);
+	gfs2_rgrp_free(sdp, &sdp->rgtree);
 	return -1;
 }
 
diff --git a/tests/check_rgrp.c b/tests/check_rgrp.c
index 0360d3c8..30461a93 100644
--- a/tests/check_rgrp.c
+++ b/tests/check_rgrp.c
@@ -35,8 +35,8 @@ static lgfs2_rgrps_t mockup_rgrp(void)
 	fail_unless(rg != NULL);
 
 	for (i = 0; i < rg->ri.ri_length; i++) {
-		rg->bits[i].bi_bh = bget(sdp, rg->ri.ri_addr + i);
-		fail_unless(rg->bits[i].bi_bh != NULL);
+		rg->bits[i].bi_data = calloc(1, sdp->bsize);
+		fail_unless(rg->bits[i].bi_data != NULL);
 	}
 	return rgs;
 }
@@ -100,7 +100,7 @@ START_TEST(test_rbm_find_lastblock)
 
 	/* Flag all blocks as allocated... */
 	for (i = 0; i < rg->ri.ri_length; i++)
-		memset(rg->bits[i].bi_bh->b_data, 0xff, rgs->sdp->bsize);
+		memset(rg->bits[i].bi_data, 0xff, rgs->sdp->bsize);
 
 	/* ...except the final one */
 	err = gfs2_set_bitmap(rg, rg->ri.ri_data0 + rg->ri.ri_data - 1, GFS2_BLKST_FREE);
-- 
2.26.2

