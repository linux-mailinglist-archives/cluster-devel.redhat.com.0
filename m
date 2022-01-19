Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 059304938D2
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Jan 2022 11:46:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642589204;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=n9U5HR5rgA3n6QGH4Jhqf4uDihLBbGcrhXT9FBTGJWI=;
	b=XvINfCAPMQkpz6m/53Wt9Avn1/GGSVxMHMR8wjqJbUJkBT6bqivLyH5pnPay6dUIAxDhbe
	qG2TmQ6yKhpoTRffiyZdPgC0GdIZ9e2FXZQ7MeKjmddYp2igIebfyzl7VDmi1UP2iEexR4
	Pju+PbGSzX5iStAkbrcB6USlgLQLZEI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-C8nVwbYhOi-dHA1OADqPbw-1; Wed, 19 Jan 2022 05:46:40 -0500
X-MC-Unique: C8nVwbYhOi-dHA1OADqPbw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8420F81424A;
	Wed, 19 Jan 2022 10:46:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 71227794D2;
	Wed, 19 Jan 2022 10:46:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5680F1806D1C;
	Wed, 19 Jan 2022 10:46:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20JAhW3m024173 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Jan 2022 05:43:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D59C3795B7; Wed, 19 Jan 2022 10:43:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.37.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB5537A226
	for <cluster-devel@redhat.com>; Wed, 19 Jan 2022 10:43:31 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 19 Jan 2022 10:42:57 +0000
Message-Id: <20220119104316.2489995-3-anprice@redhat.com>
In-Reply-To: <20220119104316.2489995-1-anprice@redhat.com>
References: <20220119104316.2489995-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 02/21] libgfs2: Namespace improvements -
	buf.c
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Use the lgfs2_ prefix in libgfs2 interface names.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/convert/gfs2_convert.c   |  76 +++++++--------
 gfs2/edit/extended.c          |  26 ++---
 gfs2/edit/gfs2hex.c           |   4 +-
 gfs2/edit/hexedit.c           |  48 +++++-----
 gfs2/edit/journal.c           |  40 ++++----
 gfs2/fsck/afterpass1_common.c |   8 +-
 gfs2/fsck/fs_recovery.c       |  62 ++++++------
 gfs2/fsck/initialize.c        |  44 ++++-----
 gfs2/fsck/lost_n_found.c      |   6 +-
 gfs2/fsck/metawalk.c          |  44 ++++-----
 gfs2/fsck/pass1.c             |  58 +++++------
 gfs2/fsck/pass1b.c            |  40 ++++----
 gfs2/fsck/pass2.c             |  76 +++++++--------
 gfs2/fsck/pass4.c             |   6 +-
 gfs2/fsck/pass5.c             |   4 +-
 gfs2/fsck/rgrepair.c          |  44 ++++-----
 gfs2/libgfs2/buf.c            |  18 ++--
 gfs2/libgfs2/fs_ops.c         | 176 +++++++++++++++++-----------------
 gfs2/libgfs2/gfs1.c           |  28 +++---
 gfs2/libgfs2/libgfs2.h        |  16 ++--
 gfs2/libgfs2/recovery.c       |  10 +-
 gfs2/libgfs2/structures.c     |  24 ++---
 gfs2/libgfs2/super.c          |  10 +-
 23 files changed, 434 insertions(+), 434 deletions(-)

diff --git a/gfs2/convert/gfs2_convert.c b/gfs2/convert/gfs2_convert.c
index 07fa9a10..5bfe8acd 100644
--- a/gfs2/convert/gfs2_convert.c
+++ b/gfs2/convert/gfs2_convert.c
@@ -285,15 +285,15 @@ static void fix_metatree(struct gfs2_sbd *sbp, struct gfs2_inode *ip,
 			new = 0;
 			lookup_block(ip, bh, h, &blk->mp, 1, &new, &block);
 			if (bh != ip->i_bh)
-				brelse(bh);
+				lgfs2_brelse(bh);
 			if (!block)
 				break;
 
-			bh = bread(sbp, block);
+			bh = lgfs2_bread(sbp, block);
 			if (new)
 				memset(bh->b_data, 0, sbp->sd_bsize);
 			memcpy(bh->b_data, &mh, sizeof(mh));
-			bmodified(bh);
+			lgfs2_bmodified(bh);
 		}
 
 		hdrsize = blk->height ? sizeof(struct gfs2_meta_header) :
@@ -304,9 +304,9 @@ static void fix_metatree(struct gfs2_sbd *sbp, struct gfs2_inode *ip,
 
 		memcpy(bh->b_data + hdrsize + ptramt, (char *)srcptr, amount);
 		srcptr += amount;
-		bmodified(bh);
+		lgfs2_bmodified(bh);
 		if (bh != ip->i_bh)
-			brelse(bh);
+			lgfs2_brelse(bh);
 
 		copied += amount;
 
@@ -443,16 +443,16 @@ static uint64_t fix_jdatatree(struct gfs2_sbd *sbp, struct gfs2_inode *ip,
 			new = 0;
 			lookup_block(ip, bh, h, &blk->mp, 1, &new, &block);
 			if (bh != ip->i_bh)
-				brelse(bh);
+				lgfs2_brelse(bh);
 			if (!block)
 				break;
 
-			bh = bread(sbp, block);
+			bh = lgfs2_bread(sbp, block);
 			if (new)
 				memset(bh->b_data, 0, sbp->sd_bsize);
 			if (h < (blk->height - 1)) {
 				memcpy(bh->b_data, &mh, sizeof(mh));
-				bmodified(bh);
+				lgfs2_bmodified(bh);
 			}
 		}
 
@@ -461,9 +461,9 @@ static uint64_t fix_jdatatree(struct gfs2_sbd *sbp, struct gfs2_inode *ip,
 
 		memcpy(bh->b_data + ptramt, (char *)srcptr, amount);
 		srcptr += amount;
-		bmodified(bh);
+		lgfs2_bmodified(bh);
 		if (bh != ip->i_bh)
-			brelse(bh);
+			lgfs2_brelse(bh);
 
 		copied += amount;
 
@@ -554,12 +554,12 @@ static int get_inode_metablocks(struct gfs2_sbd *sbp, struct gfs2_inode *ip, str
 			/* Queue it to be processed later on in the loop. */
 			osi_list_add_prev(&newblk->list, &blocks->list);
 			/* read the new metadata block's pointers */
-			bh = bread(sbp, block);
+			bh = lgfs2_bread(sbp, block);
 			memcpy(newblk->ptrbuf, bh->b_data + sizeof(struct gfs_indirect), bufsize);
 			/* Zero the buffer so we can fill it in later */
 			memset(bh->b_data + sizeof(struct gfs_indirect), 0, bufsize);
-			bmodified(bh);
-			brelse(bh);
+			lgfs2_bmodified(bh);
+			lgfs2_brelse(bh);
 			/* Free the block so we can reuse it. This allows us to
 			   convert a "full" file system. */
 			ip->i_blocks--;
@@ -654,14 +654,14 @@ static int fix_ind_jdata(struct gfs2_sbd *sbp, struct gfs2_inode *ip, uint32_t d
 		for (h=0; h < blk->height; h++)
 			newblk->mp.mp_list[h] = blk->mp.mp_list[h];
 		newblk->mp.mp_list[h] = ptrnum;
-		bh = bread(sbp, block);
+		bh = lgfs2_bread(sbp, block);
 		/* This is a data block. i.e newblk->height == ip->i_height */
 		/* read in the jdata block */
 		memcpy(newblk->ptrbuf, bh->b_data +
 		       sizeof(struct gfs2_meta_header), bufsize);
 		memset(bh->b_data + sizeof(struct gfs2_meta_header), 0, bufsize);
-		bmodified(bh);
-		brelse(bh);
+		lgfs2_bmodified(bh);
+		lgfs2_brelse(bh);
 		/* Free the block so we can reuse it. This allows us to
 		   convert a "full" file system */
 		ip->i_blocks--;
@@ -816,8 +816,8 @@ static int fix_xattr(struct gfs2_sbd *sbp, struct gfs2_buffer_head *bh, struct g
 	char *buf;
 
 	/* Read in the i_eattr block */
-	eabh = bread(sbp, ip->i_eattr);
-        if (!lgfs2_check_meta(eabh->b_data, GFS_METATYPE_IN)) {/* if it is an indirect block */
+	eabh = lgfs2_bread(sbp, ip->i_eattr);
+	if (!lgfs2_check_meta(eabh->b_data, GFS_METATYPE_IN)) {/* if it is an indirect block */
 		len = sbp->sd_bsize - sizeof(struct gfs_indirect);
 		buf = malloc(len);
 		if (!buf) {
@@ -831,9 +831,9 @@ static int fix_xattr(struct gfs2_sbd *sbp, struct gfs2_buffer_head *bh, struct g
 		memset(eabh->b_data + new_hdr_sz, 0, sbp->sd_bsize - new_hdr_sz);
 		memcpy(eabh->b_data + new_hdr_sz, buf, len);
 		free(buf);
-		bmodified(eabh);
+		lgfs2_bmodified(eabh);
 	}
-        brelse(eabh);
+	lgfs2_brelse(eabh);
 
 	return 0;
 }
@@ -940,7 +940,7 @@ static int adjust_inode(struct gfs2_sbd *sbp, struct gfs2_buffer_head *bh)
 		}
 	}
 
-	bmodified(inode->i_bh);
+	lgfs2_bmodified(inode->i_bh);
 	inode_put(&inode); /* does gfs2_dinode_out if modified */
 	sbp->md.next_inum++; /* update inode count */
 	return 0;
@@ -988,13 +988,13 @@ static int next_rg_metatype(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
 
 	do{
 		if (bh)
-			brelse(bh);
+			lgfs2_brelse(bh);
 		if (next_rg_meta(rgd, block, first))
 			return -1;
-		bh = bread(sdp, *block);
+		bh = lgfs2_bread(sdp, *block);
 		first = 0;
 	} while(lgfs2_check_meta(bh->b_data, type));
-	brelse(bh);
+	lgfs2_brelse(bh);
 	return 0;
 }
 
@@ -1051,7 +1051,7 @@ static int inode_renumber(struct gfs2_sbd *sbp, uint64_t root_inode_addr, osi_li
 				sbp->sd_root_dir.in_addr = block;
 				sbp->sd_root_dir.in_formal_ino = sbp->md.next_inum;
 			}
-			bh = bread(sbp, block);
+			bh = lgfs2_bread(sbp, block);
 			if (!lgfs2_check_meta(bh->b_data, GFS_METATYPE_DI)) {/* if it is an dinode */
 				/* Skip the rindex and jindex inodes for now. */
 				if (block != rindex_addr && block != jindex_addr) {
@@ -1086,7 +1086,7 @@ static int inode_renumber(struct gfs2_sbd *sbp, uint64_t root_inode_addr, osi_li
 					bitmap_byte -= (sbp->sd_bsize - buf_offset);
 				}
 			}
-			brelse(bh);
+			lgfs2_brelse(bh);
 			first = 0;
 		} /* while 1 */
 	} /* for all rgs */
@@ -1283,8 +1283,8 @@ static int fix_one_directory_exhash(struct gfs2_sbd *sbp, struct gfs2_inode *dip
 		}
 		leaf = (struct gfs2_leaf *)bh_leaf->b_data;
 		error = process_dirent_info(dip, sbp, bh_leaf, be16_to_cpu(leaf->lf_entries), dentmod);
-		bmodified(bh_leaf);
-		brelse(bh_leaf);
+		lgfs2_bmodified(bh_leaf);
+		lgfs2_brelse(bh_leaf);
 		if (dentmod && error == -EISDIR) /* dentmod was marked DT_DIR, break out */
 			break;
 		if (leaf->lf_next) { /* leaf has a leaf chain, process leaves in chain */
@@ -1319,7 +1319,7 @@ static int process_directory(struct gfs2_sbd *sbp, uint64_t dirblock, uint64_t d
 			return -1;
 		}
 	}
-	bmodified(dip->i_bh);
+	lgfs2_bmodified(dip->i_bh);
 	inode_put(&dip);
 	return 0;
 }
@@ -1413,8 +1413,8 @@ static int fix_cdpn_symlinks(struct gfs2_sbd *sbp, osi_list_t *cdpn_to_fix)
 			return -1;
 		fix_inode->i_eattr = eablk; /*fix extended attribute */
 		inode_put(&fix_inode);
-		bmodified(bh);
-		brelse(bh);
+		lgfs2_bmodified(bh);
+		lgfs2_brelse(bh);
 
 		/* fix the parent directory dirent entry for this inode */
 		error = process_directory(sbp, l_fix->di_paddr, l_fix->di_addr);
@@ -1590,7 +1590,7 @@ static int init(struct gfs2_sbd *sbp, struct gfs2_options *opts)
 		exit(-1);
 	}
 
-	bh = bread(sbp, GFS2_SB_ADDR >> sbp->sd_fsb2bb_shift);
+	bh = lgfs2_bread(sbp, GFS2_SB_ADDR >> sbp->sd_fsb2bb_shift);
 	memcpy(&gfs1_sb, bh->b_data, sizeof(struct gfs_sb));
 	lgfs2_sb_in(sbp, bh->b_data);
 
@@ -1604,7 +1604,7 @@ static int init(struct gfs2_sbd *sbp, struct gfs2_options *opts)
 	sbp->sd_diptrs = (sbp->sd_bsize - sizeof(struct gfs_dinode)) /
 		sizeof(uint64_t);
 	sbp->sd_jbsize = sbp->sd_bsize - sizeof(struct gfs2_meta_header);
-	brelse(bh);
+	lgfs2_brelse(bh);
 	if (compute_heightsize(sbp->sd_bsize, sbp->sd_heightsize, &sbp->sd_max_height,
 				sbp->sd_bsize, sbp->sd_diptrs, sbp->sd_inptrs)) {
 		log_crit("%s\n", _("Failed to compute file system constants"));
@@ -2162,10 +2162,10 @@ static void copy_quotas(struct gfs2_sbd *sdp)
 	oq_ip->i_height = 0;
 	oq_ip->i_size = 0;
 
-	bmodified(nq_ip->i_bh);
+	lgfs2_bmodified(nq_ip->i_bh);
 	inode_put(&nq_ip);
 
-	bmodified(oq_ip->i_bh);
+	lgfs2_bmodified(oq_ip->i_bh);
 	inode_put(&oq_ip);
 }
 
@@ -2389,12 +2389,12 @@ int main(int argc, char **argv)
 		/* end because if the tool is interrupted in the middle, we want */
 		/* it to not reject the partially converted fs as already done   */
 		/* when it's run a second time.                                  */
-		bh = bread(&sb2, LGFS2_SB_ADDR(&sb2));
+		bh = lgfs2_bread(&sb2, LGFS2_SB_ADDR(&sb2));
 		sb2.sd_fs_format = GFS2_FORMAT_FS;
 		sb2.sd_multihost_format = GFS2_FORMAT_MULTI;
 		lgfs2_sb_out(&sb2, bh->b_data);
-		bmodified(bh);
-		brelse(bh);
+		lgfs2_bmodified(bh);
+		lgfs2_brelse(bh);
 
 		error = fsync(sb2.device_fd);
 		if (error)
diff --git a/gfs2/edit/extended.c b/gfs2/edit/extended.c
index 6e2e16db..89720a53 100644
--- a/gfs2/edit/extended.c
+++ b/gfs2/edit/extended.c
@@ -628,13 +628,13 @@ int display_extended(void)
 	dsplines = termlines - line - 1;
 	/* Display any indirect pointers that we have. */
 	if (block_is_rindex(block)) {
-		tmp_bh = bread(&sbd, block);
+		tmp_bh = lgfs2_bread(&sbd, block);
 		tmp_inode = lgfs2_inode_get(&sbd, tmp_bh);
 		if (tmp_inode == NULL)
 			return -1;
 		parse_rindex(tmp_inode, TRUE);
 		inode_put(&tmp_inode);
-		brelse(tmp_bh);
+		lgfs2_brelse(tmp_bh);
 	} else if (block_is_journals(block)) {
 		if (sbd.gfs1)
 			block = sbd.sd_jindex_di.in_addr;
@@ -648,50 +648,50 @@ int display_extended(void)
 		return -1;
 	else if (block_is_rgtree(block)) {
 		if (sbd.gfs1)
-			tmp_bh = bread(&sbd, sbd.sd_rindex_di.in_addr);
+			tmp_bh = lgfs2_bread(&sbd, sbd.sd_rindex_di.in_addr);
 		else
-			tmp_bh = bread(&sbd, masterblock("rindex"));
+			tmp_bh = lgfs2_bread(&sbd, masterblock("rindex"));
 		tmp_inode = lgfs2_inode_get(&sbd, tmp_bh);
 		if (tmp_inode == NULL)
 			return -1;
 		parse_rindex(tmp_inode, FALSE);
 		inode_put(&tmp_inode);
-		brelse(tmp_bh);
+		lgfs2_brelse(tmp_bh);
 	} else if (block_is_jindex(block)) {
-		tmp_bh = bread(&sbd, block);
+		tmp_bh = lgfs2_bread(&sbd, block);
 		tmp_inode = lgfs2_inode_get(&sbd, tmp_bh);
 		if (tmp_inode == NULL)
 			return -1;
 		print_gfs_jindex(tmp_inode);
 		inode_put(&tmp_inode);
-		brelse(tmp_bh);
+		lgfs2_brelse(tmp_bh);
 	}
 	else if (block_is_inum_file(block)) {
-		tmp_bh = bread(&sbd, block);
+		tmp_bh = lgfs2_bread(&sbd, block);
 		tmp_inode = lgfs2_inode_get(&sbd, tmp_bh);
 		if (tmp_inode == NULL)
 			return -1;
 		print_inum(tmp_inode);
 		inode_put(&tmp_inode);
-		brelse(tmp_bh);
+		lgfs2_brelse(tmp_bh);
 	}
 	else if (block_is_statfs_file(block)) {
-		tmp_bh = bread(&sbd, block);
+		tmp_bh = lgfs2_bread(&sbd, block);
 		tmp_inode = lgfs2_inode_get(&sbd, tmp_bh);
 		if (tmp_inode == NULL)
 			return -1;
 		print_statfs(tmp_inode);
 		inode_put(&tmp_inode);
-		brelse(tmp_bh);
+		lgfs2_brelse(tmp_bh);
 	}
 	else if (block_is_quota_file(block)) {
-		tmp_bh = bread(&sbd, block);
+		tmp_bh = lgfs2_bread(&sbd, block);
 		tmp_inode = lgfs2_inode_get(&sbd, tmp_bh);
 		if (tmp_inode == NULL)
 			return -1;
 		print_quota(tmp_inode);
 		inode_put(&tmp_inode);
-		brelse(tmp_bh);
+		lgfs2_brelse(tmp_bh);
 	}
 	return 0;
 }
diff --git a/gfs2/edit/gfs2hex.c b/gfs2/edit/gfs2hex.c
index 610c7d2a..cdf22042 100644
--- a/gfs2/edit/gfs2hex.c
+++ b/gfs2/edit/gfs2hex.c
@@ -192,7 +192,7 @@ void do_dinode_extended(char *buf)
 
 				if (last >= max_block)
 					break;
-				tmp_bh = bread(&sbd, last);
+				tmp_bh = lgfs2_bread(&sbd, last);
 				indirect->ii[indirect_blocks].dirents = 0;
 				for (direntcount = 0, bufoffset = sizeof(struct gfs2_leaf);
 					 bufoffset < sbd.sd_bsize;
@@ -203,7 +203,7 @@ void do_dinode_extended(char *buf)
 					if (skip <= 0)
 						break;
 				}
-				brelse(tmp_bh);
+				lgfs2_brelse(tmp_bh);
 				indirect->ii[indirect_blocks].block = last;
 				indirect_blocks++;
 				last = p;
diff --git a/gfs2/edit/hexedit.c b/gfs2/edit/hexedit.c
index 0809db85..5521bf30 100644
--- a/gfs2/edit/hexedit.c
+++ b/gfs2/edit/hexedit.c
@@ -759,7 +759,7 @@ static void set_rgrp_flags(int rgnum, uint32_t new_flags, int modify, int full)
 	uint64_t rgblk;
 
 	rgblk = get_rg_addr(rgnum);
-	rbh = bread(&sbd, rgblk);
+	rbh = lgfs2_bread(&sbd, rgblk);
 	rg = (void *)rbh->b_data;
 
 	if (modify) {
@@ -768,7 +768,7 @@ static void set_rgrp_flags(int rgnum, uint32_t new_flags, int modify, int full)
 		printf("RG #%d (block %"PRIu64" / 0x%"PRIx64") rg_flags changed from 0x%08x to 0x%08x\n",
 		       rgnum, rgblk, rgblk, flags, new_flags);
 		rg->rg_flags = cpu_to_be32(new_flags);
-		bmodified(rbh);
+		lgfs2_bmodified(rbh);
 	} else {
 		if (full) {
 			print_gfs2("RG #%d", rgnum);
@@ -783,7 +783,7 @@ static void set_rgrp_flags(int rgnum, uint32_t new_flags, int modify, int full)
 			printf("RG #%d (block %"PRIu64" / 0x%"PRIx64") rg_flags = 0x%08x\n",
 			       rgnum, rgblk, rgblk, be32_to_cpu(rg->rg_flags));
 	}
-	brelse(rbh);
+	lgfs2_brelse(rbh);
 	if (modify)
 		fsync(sbd.device_fd);
 }
@@ -876,7 +876,7 @@ static void read_superblock(int fd)
 	memset(&sbd, 0, sizeof(struct gfs2_sbd));
 	sbd.sd_bsize = GFS2_DEFAULT_BSIZE;
 	sbd.device_fd = fd;
-	bh = bread(&sbd, 0x10);
+	bh = lgfs2_bread(&sbd, 0x10);
 	sbd.jsize = GFS2_DEFAULT_JSIZE;
 	sbd.rgsize = GFS2_DEFAULT_RGSIZE;
 	sbd.qcsize = GFS2_DEFAULT_QCSIZE;
@@ -928,7 +928,7 @@ static void read_superblock(int fd)
 			gfs2_lookupi(sbd.master_dir, "rindex", 6, &sbd.md.riinode);
 		}
 	}
-	brelse(bh);
+	lgfs2_brelse(bh);
 	bh = NULL;
 }
 
@@ -952,7 +952,7 @@ static int read_master_dir(void)
 {
 	ioctl(sbd.device_fd, BLKFLSBUF, 0);
 
-	bh = bread(&sbd, sbd.sd_meta_dir.in_addr);
+	bh = lgfs2_bread(&sbd, sbd.sd_meta_dir.in_addr);
 	if (bh == NULL)
 		return 1;
 	di = (struct gfs2_dinode *)bh->b_data;
@@ -984,10 +984,10 @@ int display(int identify_only, int trunc_zeros, uint64_t flagref,
 	}
 	if (bh == NULL || bh->b_blocknr != blk) { /* If we changed blocks from the last read */
 		if (bh != NULL)
-			brelse(bh);
+			lgfs2_brelse(bh);
 		dev_offset = blk * sbd.sd_bsize;
 		ioctl(sbd.device_fd, BLKFLSBUF, 0);
-		if (!(bh = bread(&sbd, blk))) {
+		if (!(bh = lgfs2_bread(&sbd, blk))) {
 			fprintf(stderr, "read error: %s from %s:%d: "
 				"offset %"PRIu64" (0x%"PRIx64")\n",
 				strerror(errno), __FUNCTION__, __LINE__,
@@ -1134,17 +1134,17 @@ static uint64_t find_metablockoftype_slow(uint64_t startblk, int metatype, int p
 
 	last_fs_block = lseek(sbd.device_fd, 0, SEEK_END) / sbd.sd_bsize;
 	for (blk = startblk + 1; blk < last_fs_block; blk++) {
-		lbh = bread(&sbd, blk);
+		lbh = lgfs2_bread(&sbd, blk);
 		/* Can't use get_block_type here (returns false "none") */
 		if (lbh->b_data[0] == 0x01 && lbh->b_data[1] == 0x16 &&
 		    lbh->b_data[2] == 0x19 && lbh->b_data[3] == 0x70 &&
 		    lbh->b_data[4] == 0x00 && lbh->b_data[5] == 0x00 &&
 		    lbh->b_data[6] == 0x00 && lbh->b_data[7] == metatype) {
 			found = 1;
-			brelse(lbh);
+			lgfs2_brelse(lbh);
 			break;
 		}
-		brelse(lbh);
+		lgfs2_brelse(lbh);
 	}
 	if (!found)
 		blk = 0;
@@ -1172,9 +1172,9 @@ static int find_rg_metatype(struct rgrp_tree *rgd, uint64_t *blk, uint64_t start
 
 		for (j = 0; j < m; j++) {
 			*blk = ibuf[j];
-			bhp = bread(&sbd, *blk);
+			bhp = lgfs2_bread(&sbd, *blk);
 			found = (*blk > startblk) && !lgfs2_check_meta(bhp->b_data, mtype);
-			brelse(bhp);
+			lgfs2_brelse(bhp);
 			if (found) {
 				free(ibuf);
 				return 0;
@@ -1585,10 +1585,10 @@ static void find_print_block_type(void)
 	const struct lgfs2_metadata *type;
 
 	tblock = blockstack[blockhist % BLOCK_STACK_SIZE].block;
-	lbh = bread(&sbd, tblock);
+	lbh = lgfs2_bread(&sbd, tblock);
 	type = get_block_type(lbh->b_data);
 	print_block_type(tblock, type);
-	brelse(lbh);
+	lgfs2_brelse(lbh);
 	gfs2_rgrp_free(&sbd, &sbd.rgtree);
 	exit(0);
 }
@@ -1701,7 +1701,7 @@ static void process_field(const char *field, const char *nstr)
 	const struct lgfs2_metafield *mfield;
 
 	fblock = blockstack[blockhist % BLOCK_STACK_SIZE].block;
-	rbh = bread(&sbd, fblock);
+	rbh = lgfs2_bread(&sbd, fblock);
 	mtype = get_block_type(rbh->b_data);
 	if (mtype == NULL) {
 		fprintf(stderr, "Metadata type of block %"PRIx64" not recognised\n",
@@ -1732,7 +1732,7 @@ static void process_field(const char *field, const char *nstr)
 			        strerror(errno));
 			exit(1);
 		}
-		bmodified(rbh);
+		lgfs2_bmodified(rbh);
 	}
 
 	if (!termlines) {
@@ -1741,7 +1741,7 @@ static void process_field(const char *field, const char *nstr)
 		printf("%s\n", str);
 	}
 
-	brelse(rbh);
+	lgfs2_brelse(rbh);
 	fsync(sbd.device_fd);
 	exit(0);
 }
@@ -2131,7 +2131,7 @@ static int count_dinode_blks(struct rgrp_tree *rgd, int bitmap,
 		off = sizeof(struct gfs2_rgrp);
 
 	for (b = 0; b < rgd->bits[bitmap].bi_len << GFS2_BIT_SIZE; b++) {
-		tbh = bread(&sbd, rgd->rt_data0 +
+		tbh = lgfs2_bread(&sbd, rgd->rt_data0 +
 			    rgd->bits[bitmap].bi_start + b);
 		byte = rbh->b_data + off + (b / GFS2_NBBY);
 		bit = (b % GFS2_NBBY) * GFS2_BIT_SIZE;
@@ -2144,9 +2144,9 @@ static int count_dinode_blks(struct rgrp_tree *rgd, int bitmap,
 		cur_state = (*byte >> bit) & GFS2_BIT_MASK;
 		*byte ^= cur_state << bit;
 		*byte |= new_state << bit;
-		brelse(tbh);
+		lgfs2_brelse(tbh);
 	}
-	bmodified(rbh);
+	lgfs2_bmodified(rbh);
 	return dinodes;
 }
 
@@ -2204,7 +2204,7 @@ static void rg_repair(void)
 			struct gfs2_meta_header *mh;
 
 			printf("Bitmap #%d:", b);
-			rbh = bread(&sbd, rgd->rt_addr + b);
+			rbh = lgfs2_bread(&sbd, rgd->rt_addr + b);
 			if (lgfs2_check_meta(rbh->b_data, mtype)) { /* wrong type */
 				printf("Damaged. Repairing...");
 				/* Fix the meta header */
@@ -2218,7 +2218,7 @@ static void rg_repair(void)
 				else
 					mh->mh_format =
 						cpu_to_be32(GFS2_FORMAT_RG);
-				bmodified(rbh);
+				lgfs2_bmodified(rbh);
 				/* Count the dinode blocks */
 				dinodes_found = count_dinode_blks(rgd, b, rbh);
 			} else { /* bitmap info is okay: tally it. */
@@ -2231,7 +2231,7 @@ static void rg_repair(void)
 				rgd->rt_dinodes = dinodes_total;
 				rgd->rt_free = 0;
 			}
-			brelse(rbh);
+			lgfs2_brelse(rbh);
 		}
 		rgs_fixed++;
 	}
diff --git a/gfs2/edit/journal.c b/gfs2/edit/journal.c
index 11f9e032..29986c3e 100644
--- a/gfs2/edit/journal.c
+++ b/gfs2/edit/journal.c
@@ -47,7 +47,7 @@ uint64_t find_journal_block(const char *journal, uint64_t *j_size)
 	else
 		jindex_block = masterblock("jindex");
 	/* read in the block */
-	jindex_bh = bread(&sbd, jindex_block);
+	jindex_bh = lgfs2_bread(&sbd, jindex_block);
 	di = (struct gfs2_dinode *)jindex_bh->b_data;
 
 	if (!sbd.gfs1)
@@ -74,12 +74,12 @@ uint64_t find_journal_block(const char *journal, uint64_t *j_size)
 		if (journal_num > indirect->ii[0].dirents - 2)
 			return 0;
 		jblock = indirect->ii[0].dirent[journal_num + 2].inum.in_addr;
-		j_bh = bread(&sbd, jblock);
+		j_bh = lgfs2_bread(&sbd, jblock);
 		jdi = (struct gfs2_dinode *)j_bh->b_data;
 		*j_size = be64_to_cpu(jdi->di_size);
-		brelse(j_bh);
+		lgfs2_brelse(j_bh);
 	}
-	brelse(jindex_bh);
+	lgfs2_brelse(jindex_bh);
 	return jblock;
 }
 
@@ -147,7 +147,7 @@ static int fsck_readi(struct gfs2_inode *ip, void *rbuf, uint64_t roffset,
 			block_map(ip, lblock, &not_new, &dblock, &extlen,
 				  FALSE);
 		if (dblock) {
-			lbh = bread(sdp, dblock);
+			lbh = lgfs2_bread(sdp, dblock);
 			if (*abs_block == 0)
 				*abs_block = lbh->b_blocknr;
 			dblock++;
@@ -156,7 +156,7 @@ static int fsck_readi(struct gfs2_inode *ip, void *rbuf, uint64_t roffset,
 			lbh = NULL;
 		if (lbh) {
 			memcpy(rbuf, lbh->b_data + o, amount);
-			brelse(lbh);
+			lgfs2_brelse(lbh);
 		} else {
 			memset(rbuf, 0, amount);
 		}
@@ -220,12 +220,12 @@ static int print_ld_blks(const __be64 *b, const char *end, int start_line,
 			bcount++;
 			if (prnt) {
 				if (is_meta_ld) {
-					j_bmap_bh = bread(&sbd, abs_block +
+					j_bmap_bh = lgfs2_bread(&sbd, abs_block +
 							  bcount);
 					sprintf(str, "0x%"PRIx64" %2s",
 						be64_to_cpu(*b),
 						mtypes[lgfs2_get_block_type(j_bmap_bh->b_data)]);
-					brelse(j_bmap_bh);
+					lgfs2_brelse(j_bmap_bh);
 				} else {
 					sprintf(str, "0x%"PRIx64, be64_to_cpu(*b));
 				}
@@ -258,11 +258,11 @@ static int print_ld_blks(const __be64 *b, const char *end, int start_line,
 							* GFS2_NBBY;
 					bmap = o / sbd.sd_blocks_per_bitmap;
 					save_ptr = rgd->bits[bmap].bi_data;
-					j_bmap_bh = bread(&sbd, abs_block +
+					j_bmap_bh = lgfs2_bread(&sbd, abs_block +
 							  bcount);
 					rgd->bits[bmap].bi_data = j_bmap_bh->b_data;
 					type = lgfs2_get_bitmap(&sbd, tblk, rgd);
-					brelse(j_bmap_bh);
+					lgfs2_brelse(j_bmap_bh);
 					if (type < 0) {
 						perror("Error printing log descriptor blocks");
 						exit(1);
@@ -328,9 +328,9 @@ static uint64_t find_wrap_pt(struct gfs2_inode *ji, char *jbuf, uint64_t jblock,
 		if (sbd.gfs1) {
 			struct gfs2_buffer_head *j_bh;
 
-			j_bh = bread(&sbd, jblock + jb);
+			j_bh = lgfs2_bread(&sbd, jblock + jb);
 			found = is_wrap_pt(j_bh->b_data, &highest_seq);
-			brelse(j_bh);
+			lgfs2_brelse(j_bh);
 		} else {
 			int copied;
 			uint64_t abs_block;
@@ -415,7 +415,7 @@ static int meta_has_ref(uint64_t abs_block, int tblk)
 	__be64 *b;
 	struct gfs2_dinode *dinode;
 
-	mbh = bread(&sbd, abs_block);
+	mbh = lgfs2_bread(&sbd, abs_block);
 	mtype = get_block_type(mbh->b_data);
 	if (mtype != NULL) {
 		structlen = mtype->size;
@@ -431,7 +431,7 @@ static int meta_has_ref(uint64_t abs_block, int tblk)
 			has_ref = 1;
 		b++;
 	}
-	brelse(mbh);
+	lgfs2_brelse(mbh);
 	return has_ref;
 }
 
@@ -449,11 +449,11 @@ static uint64_t get_ldref(uint64_t abs_ld, int offset_from_ld)
 	uint64_t refblk;
 	__be64 *b;
 
-	jbh = bread(&sbd, abs_ld);
+	jbh = lgfs2_bread(&sbd, abs_ld);
 	b = (__be64 *)(jbh->b_data + sizeof(struct gfs2_log_descriptor));
 	b += offset_from_ld - 1;
 	refblk = be64_to_cpu(*b);
-	brelse(jbh);
+	lgfs2_brelse(jbh);
 	return refblk;
 }
 
@@ -530,7 +530,7 @@ void dump_journal(const char *journal, uint64_t tblk)
 		return;
 
 	if (!sbd.gfs1) {
-		j_bh = bread(&sbd, jblock);
+		j_bh = lgfs2_bread(&sbd, jblock);
 		j_inode = lgfs2_inode_get(&sbd, j_bh);
 		if (j_inode == NULL) {
 			fprintf(stderr, "Out of memory\n");
@@ -582,9 +582,9 @@ void dump_journal(const char *journal, uint64_t tblk)
 
 		if (sbd.gfs1) {
 			if (j_bh)
-				brelse(j_bh);
+				lgfs2_brelse(j_bh);
 			abs_block = jblock + ((jb + wrappt) % j_size);
-			j_bh = bread(&sbd, abs_block);
+			j_bh = lgfs2_bread(&sbd, abs_block);
 			buf = j_bh->b_data;
 		} else {
 			int error = fsck_readi(j_inode, (void *)jbuf,
@@ -644,7 +644,7 @@ void dump_journal(const char *journal, uint64_t tblk)
 	}
 	if (j_inode != NULL)
 		inode_put(&j_inode);
-	brelse(j_bh);
+	lgfs2_brelse(j_bh);
 	blockhist = -1; /* So we don't print anything else */
 	free(jbuf);
 	if (!termlines)
diff --git a/gfs2/fsck/afterpass1_common.c b/gfs2/fsck/afterpass1_common.c
index 12a9f647..952275a0 100644
--- a/gfs2/fsck/afterpass1_common.c
+++ b/gfs2/fsck/afterpass1_common.c
@@ -207,10 +207,10 @@ static int del_eattr_generic(struct gfs2_inode *ip, uint64_t block,
 		ret = delete_block_if_notdup(ip, block, NULL, eatype,
 					     NULL, private);
 		if (!ret) {
-			*bh = bread(ip->i_sbd, block);
+			*bh = lgfs2_bread(ip->i_sbd, block);
 			if (!was_free)
 				ip->i_blocks--;
-			bmodified(ip->i_bh);
+			lgfs2_bmodified(ip->i_bh);
 		}
 	}
 	/* Even if it's a duplicate reference, we want to eliminate the
@@ -218,7 +218,7 @@ static int del_eattr_generic(struct gfs2_inode *ip, uint64_t block,
 	if (ip->i_eattr) {
 		if (block == ip->i_eattr)
 			ip->i_eattr = 0;
-		bmodified(ip->i_bh);
+		lgfs2_bmodified(ip->i_bh);
 	}
 	return ret;
 }
@@ -294,7 +294,7 @@ int delete_eattr_extentry(struct gfs2_inode *ip, int i, __be64 *ea_data_ptr,
 			ea_hdr->ea_num_ptrs = i;
 			ea_hdr->ea_data_len = cpu_to_be32(tot_ealen);
 			*ea_data_ptr = 0;
-			bmodified(leaf_bh);
+			lgfs2_bmodified(leaf_bh);
 			/* Endianness doesn't matter in this case because it's
 			   a single byte. */
 			fsck_bitmap_set(ip, ip->i_eattr,
diff --git a/gfs2/fsck/fs_recovery.c b/gfs2/fsck/fs_recovery.c
index fdeb3c44..f8e4403e 100644
--- a/gfs2/fsck/fs_recovery.c
+++ b/gfs2/fsck/fs_recovery.c
@@ -153,7 +153,7 @@ static int buf_lo_scan_elements(struct gfs2_inode *ip, unsigned int start,
 
 		log_info(_("Journal replay writing metadata block #%"PRIu64" (0x%"PRIx64") for journal+0x%x\n"),
 		         blkno, blkno, start);
-		bh_ip = bget(sdp, blkno);
+		bh_ip = lgfs2_bget(sdp, blkno);
 		if (!bh_ip) {
 			log_err(_("Out of memory when replaying journals.\n"));
 			return FSCK_ERROR;
@@ -166,14 +166,14 @@ static int buf_lo_scan_elements(struct gfs2_inode *ip, unsigned int start,
 			        blkno, blkno, start);
 			error = -EIO;
 		} else {
-			bmodified(bh_ip);
+			lgfs2_bmodified(bh_ip);
 			rgd = gfs2_blk2rgrpd(sdp, blkno);
 			if (rgd && blkno < rgd->rt_data0)
 				refresh_rgrp(sdp, rgd, bh_ip, blkno);
 		}
 
-		brelse(bh_log);
-		brelse(bh_ip);
+		lgfs2_brelse(bh_log);
+		lgfs2_brelse(bh_ip);
 		if (error)
 			break;
 
@@ -224,8 +224,8 @@ static int revoke_lo_scan_elements(struct gfs2_inode *ip, unsigned int start,
 			offset += sizeof(uint64_t);
 		}
 
-		bmodified(bh);
-		brelse(bh);
+		lgfs2_bmodified(bh);
+		lgfs2_brelse(bh);
 		offset = sizeof(struct gfs2_meta_header);
 		first = 0;
 	}
@@ -264,7 +264,7 @@ static int databuf_lo_scan_elements(struct gfs2_inode *ip, unsigned int start,
 
 		log_info(_("Journal replay writing data block #%"PRIu64" (0x%"PRIx64") for journal+0x%x\n"),
 		         blkno, blkno, start);
-		bh_ip = bget(sdp, blkno);
+		bh_ip = lgfs2_bget(sdp, blkno);
 		if (!bh_ip) {
 			log_err(_("Out of memory when replaying journals.\n"));
 			return FSCK_ERROR;
@@ -277,9 +277,9 @@ static int databuf_lo_scan_elements(struct gfs2_inode *ip, unsigned int start,
 			*eptr = cpu_to_be32(GFS2_MAGIC);
 		}
 
-		brelse(bh_log);
-		bmodified(bh_ip);
-		brelse(bh_ip);
+		lgfs2_brelse(bh_log);
+		lgfs2_bmodified(bh_ip);
+		lgfs2_brelse(bh_ip);
 
 		sd_replayed_jblocks++;
 	}
@@ -318,8 +318,8 @@ static int foreach_descriptor(struct gfs2_inode *ip, unsigned int start,
 			return error;
 		mhp = (struct gfs2_meta_header *)bh->b_data;
 		if (be32_to_cpu(mhp->mh_magic) != GFS2_MAGIC) {
-			bmodified(bh);
-			brelse(bh);
+			lgfs2_bmodified(bh);
+			lgfs2_brelse(bh);
 			return -EIO;
 		}
 		ld = (struct gfs2_log_descriptor *)bh->b_data;
@@ -331,8 +331,8 @@ static int foreach_descriptor(struct gfs2_inode *ip, unsigned int start,
 			error = lgfs2_get_log_header(ip, start, &lh);
 			if (!error) {
 				gfs2_replay_incr_blk(ip, &start);
-				bmodified(bh);
-				brelse(bh);
+				lgfs2_bmodified(bh);
+				lgfs2_brelse(bh);
 				continue;
 			}
 			if (error == 1) {
@@ -340,39 +340,39 @@ static int foreach_descriptor(struct gfs2_inode *ip, unsigned int start,
 					  "journal+0x%x.\n"), start);
 				error = -EIO;
 			}
-			bmodified(bh);
-			brelse(bh);
+			lgfs2_bmodified(bh);
+			lgfs2_brelse(bh);
 			return error;
 		} else if (lgfs2_check_meta(bh->b_data, GFS2_METATYPE_LD)) {
-			bmodified(bh);
-			brelse(bh);
+			lgfs2_bmodified(bh);
+			lgfs2_brelse(bh);
 			return -EIO;
 		}
 		ptr = (__be64 *)(bh->b_data + offset);
 		error = databuf_lo_scan_elements(ip, start, ld, ptr, pass);
 		if (error) {
-			bmodified(bh);
-			brelse(bh);
+			lgfs2_bmodified(bh);
+			lgfs2_brelse(bh);
 			return error;
 		}
 		error = buf_lo_scan_elements(ip, start, ld, ptr, pass);
 		if (error) {
-			bmodified(bh);
-			brelse(bh);
+			lgfs2_bmodified(bh);
+			lgfs2_brelse(bh);
 			return error;
 		}
 		error = revoke_lo_scan_elements(ip, start, ld, ptr, pass);
 		if (error) {
-			bmodified(bh);
-			brelse(bh);
+			lgfs2_bmodified(bh);
+			lgfs2_brelse(bh);
 			return error;
 		}
 
 		while (length--)
 			gfs2_replay_incr_blk(ip, &start);
 
-		bmodified(bh);
-		brelse(bh);
+		lgfs2_bmodified(bh);
+		lgfs2_brelse(bh);
 	}
 
 	return 0;
@@ -428,10 +428,10 @@ static int check_journal_seq_no(struct gfs2_inode *ip, int fix)
 		prev_seq = highest_seq;
 		log_warn(_("Renumbering it as 0x%"PRIx64"\n"), highest_seq);
 		block_map(ip, blk, &new, &dblock, NULL, 0);
-		bh = bread(ip->i_sbd, dblock);
+		bh = lgfs2_bread(ip->i_sbd, dblock);
 		((struct gfs2_log_header *)bh->b_data)->lh_sequence = cpu_to_be64(highest_seq);
-		bmodified(bh);
-		brelse(bh);
+		lgfs2_bmodified(bh);
+		lgfs2_brelse(bh);
 	}
 	if (seq_errors && fix) {
 		log_err(_("%d sequence errors fixed.\n"), seq_errors);
@@ -632,7 +632,7 @@ static int rangecheck_jmeta(struct iptr iptr, struct gfs2_buffer_head **bh, int
 	*is_valid = 0;
 	rc = rangecheck_jblock(ip, block);
 	if (rc == META_IS_GOOD) {
-		*bh = bread(ip->i_sbd, block);
+		*bh = lgfs2_bread(ip->i_sbd, block);
 		*is_valid = (lgfs2_check_meta((*bh)->b_data, GFS2_METATYPE_IN) == 0);
 		if (!(*is_valid)) {
 			log_err( _("Journal at block %"PRIu64" (0x%"PRIx64") has a bad "
@@ -640,7 +640,7 @@ static int rangecheck_jmeta(struct iptr iptr, struct gfs2_buffer_head **bh, int
 				   "(points to something that is not an "
 				   "indirect block).\n"),
 			        ip->i_num.in_addr, ip->i_num.in_addr, block, block);
-			brelse(*bh);
+			lgfs2_brelse(*bh);
 			*bh = NULL;
 			return META_SKIP_FURTHER;
 		}
diff --git a/gfs2/fsck/initialize.c b/gfs2/fsck/initialize.c
index 7923e9c1..e65ec619 100644
--- a/gfs2/fsck/initialize.c
+++ b/gfs2/fsck/initialize.c
@@ -232,13 +232,13 @@ static void check_rgrp_integrity(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
 				}
 				if (state == GFS2_BLKST_DINODE) {
 					if (sdp->gfs1) {
-						bh = bread(sdp, diblock);
+						bh = lgfs2_bread(sdp, diblock);
 						if (!lgfs2_check_meta(bh->b_data,
 							GFS2_METATYPE_DI))
 							rg_useddi++;
 						else
 							rg_usedmeta++;
-						brelse(bh);
+						lgfs2_brelse(bh);
 					}
 					diblock++;
 					continue;
@@ -282,7 +282,7 @@ static void check_rgrp_integrity(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
 					rgd->rt_freemeta--;
 				log_info(_("Free metadata block %"PRIu64" (0x%"PRIx64") reclaimed.\n"),
 				         diblock, diblock);
-				bh = bread(sdp, diblock);
+				bh = lgfs2_bread(sdp, diblock);
 				if (!lgfs2_check_meta(bh->b_data, GFS2_METATYPE_DI)) {
 					struct gfs2_inode *ip =
 						fsck_inode_get(sdp, rgd, bh);
@@ -296,7 +296,7 @@ static void check_rgrp_integrity(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
 					}
 					fsck_inode_put(&ip);
 				}
-				brelse(bh);
+				lgfs2_brelse(bh);
 				diblock++;
 			}
 		}
@@ -511,7 +511,7 @@ static int rebuild_master(struct gfs2_sbd *sdp)
 		}
 		/* Write the inode but don't free it, to avoid doing an extra lookup */
 		lgfs2_dinode_out(sdp->md.inum, sdp->md.inum->i_bh->b_data);
-		bwrite(sdp->md.inum->i_bh);
+		lgfs2_bwrite(sdp->md.inum->i_bh);
 	}
 
 	if (fix_md.statfs) {
@@ -531,7 +531,7 @@ static int rebuild_master(struct gfs2_sbd *sdp)
 		}
 		/* Write the inode but don't free it, to avoid doing an extra lookup */
 		lgfs2_dinode_out(sdp->md.statfs, sdp->md.statfs->i_bh->b_data);
-		bwrite(sdp->md.statfs->i_bh);
+		lgfs2_bwrite(sdp->md.statfs->i_bh);
 	}
 
 	if (fix_md.riinode) {
@@ -810,7 +810,7 @@ static int init_system_inodes(struct gfs2_sbd *sdp)
 				exit(FSCK_ERROR);
 			}
 			lgfs2_dinode_out(sdp->md.inum, sdp->md.inum->i_bh->b_data);
-			if (bwrite(sdp->md.inum->i_bh) != 0) {
+			if (lgfs2_bwrite(sdp->md.inum->i_bh) != 0) {
 				log_crit(_("System inum inode was not rebuilt. Aborting.\n"));
 				goto fail;
 			}
@@ -861,7 +861,7 @@ static int init_system_inodes(struct gfs2_sbd *sdp)
 			exit(FSCK_ERROR);
 		}
 		lgfs2_dinode_out(sdp->md.statfs, sdp->md.statfs->i_bh->b_data);
-		if (bwrite(sdp->md.statfs->i_bh) != 0) {
+		if (lgfs2_bwrite(sdp->md.statfs->i_bh) != 0) {
 			log_err( _("Rebuild of statfs system file failed."));
 			log_err( _("fsck.gfs2 cannot continue without "
 				   "a valid statfs file; aborting.\n"));
@@ -918,7 +918,7 @@ static int init_system_inodes(struct gfs2_sbd *sdp)
 			exit(FSCK_ERROR);
 		}
 		lgfs2_dinode_out(sdp->md.qinode, sdp->md.qinode->i_bh->b_data);
-		if (bwrite(sdp->md.qinode->i_bh) != 0) {
+		if (lgfs2_bwrite(sdp->md.qinode->i_bh) != 0) {
 			log_crit(_("Unable to rebuild system quota file "
 				   "inode.  Aborting.\n"));
 			goto fail;
@@ -1087,10 +1087,10 @@ static void peruse_user_dinode(struct gfs2_sbd *sdp, struct gfs2_inode *ip)
 			log_err(_("Damaged root dinode not fixed.\n"));
 			return;
 		}
-		root_bh = bread(sdp, ip->i_num.in_addr);
+		root_bh = lgfs2_bread(sdp, ip->i_num.in_addr);
 		memcpy(root_bh->b_data, ip->i_bh->b_data, sdp->sd_bsize);
-		bmodified(root_bh);
-		brelse(root_bh);
+		lgfs2_bmodified(root_bh);
+		lgfs2_brelse(root_bh);
 		log_warn(_("Root directory copied from the journal.\n"));
 		return;
 	}
@@ -1135,7 +1135,7 @@ static int find_rgs_for_bsize(struct gfs2_sbd *sdp, uint64_t startblock,
 	/* Max RG size is 2GB. Max block size is 4K. 2G / 4K blks = 524288,
 	   So this is traversing 2GB in 4K block increments. */
 	for (blk = startblock; blk < startblock + max_rg_size; blk++) {
-		bh = bread(sdp, blk);
+		bh = lgfs2_bread(sdp, blk);
 		found_rg = 0;
 		for (bsize = 0; bsize < GFS2_DEFAULT_BSIZE; bsize += GFS2_BASIC_BLOCK) {
 			struct gfs2_meta_header *mhp;
@@ -1160,11 +1160,11 @@ static int find_rgs_for_bsize(struct gfs2_sbd *sdp, uint64_t startblock,
 				   (GFS2_DEFAULT_BSIZE / bsize2)) +
 				(bsize / bsize2) + 1;
 			sdp->sd_bsize = bsize2; /* temporarily */
-			rb_bh = bread(sdp, rb_addr);
+			rb_bh = lgfs2_bread(sdp, rb_addr);
 			mh = (struct gfs2_meta_header *)rb_bh->b_data;
 			is_rb = (be32_to_cpu(mh->mh_magic) == GFS2_MAGIC &&
 			         be32_to_cpu(mh->mh_type) == GFS2_METATYPE_RB);
-			brelse(rb_bh);
+			lgfs2_brelse(rb_bh);
 			if (is_rb) {
 				log_debug(_("boff:%d bsize2:%d rg:0x%"PRIx64", "
 					    "rb:0x%"PRIx64"\n"), bsize, bsize2,
@@ -1173,7 +1173,7 @@ static int find_rgs_for_bsize(struct gfs2_sbd *sdp, uint64_t startblock,
 				break;
 			}
 		}
-		brelse(bh);
+		lgfs2_brelse(bh);
 		if (!(*known_bsize)) {
 			sdp->sd_bsize = GFS2_DEFAULT_BSIZE;
 			continue;
@@ -1199,9 +1199,9 @@ static int peruse_metadata(struct gfs2_sbd *sdp, uint64_t startblock)
 	max_rg_size = 2147483648ull / sdp->sd_bsize;
 	/* Max RG size is 2GB. 2G / bsize. */
 	for (blk = startblock; blk < startblock + max_rg_size; blk++) {
-		bh = bread(sdp, blk);
+		bh = lgfs2_bread(sdp, blk);
 		if (lgfs2_check_meta(bh->b_data, GFS2_METATYPE_DI)) {
-			brelse(bh);
+			lgfs2_brelse(bh);
 			continue;
 		}
 		ip = lgfs2_inode_get(sdp, bh);
@@ -1292,7 +1292,7 @@ static int sb_repair(struct gfs2_sbd *sdp)
 			error = init_dinode(sdp, &bh, &inum, S_IFDIR | 0755, 0, &inum);
 			if (error != 0)
 				return -1;
-			brelse(bh);
+			lgfs2_brelse(bh);
 		}
 	}
 	/* Step 3 - Rebuild the lock protocol and file system table name */
@@ -1389,7 +1389,7 @@ static int reconstruct_single_journal(struct gfs2_sbd *sdp, int jnum,
 		struct gfs_log_header *lh;
 		char *p;
 
-		bh = bget(sdp, first); /* Zeroes the block */
+		bh = lgfs2_bget(sdp, first); /* Zeroes the block */
 		lh = (struct gfs_log_header *)bh->b_data;
 
 		lh->lh_header.mh_magic = cpu_to_be32(GFS2_MAGIC);
@@ -1402,8 +1402,8 @@ static int reconstruct_single_journal(struct gfs2_sbd *sdp, int jnum,
 
 		p = bh->b_data + GFS2_BASIC_BLOCK - sizeof(struct gfs_log_header);
 		memcpy(p, bh->b_data, sizeof(struct gfs_log_header));
-		bmodified(bh);
-		brelse(bh);
+		lgfs2_bmodified(bh);
+		lgfs2_brelse(bh);
 
 		if (++sequence == ji_nsegment)
 			sequence = 0;
diff --git a/gfs2/fsck/lost_n_found.c b/gfs2/fsck/lost_n_found.c
index 338f2a0a..65e13125 100644
--- a/gfs2/fsck/lost_n_found.c
+++ b/gfs2/fsck/lost_n_found.c
@@ -45,7 +45,7 @@ static void add_dotdot(struct gfs2_inode *ip)
 			  set_di_nlink(dip); /* keep inode tree in sync */
 			  log_debug(_("Decrementing its links to %d\n"),
 				    dip->i_nlink);
-			  bmodified(dip->i_bh);
+			  lgfs2_bmodified(dip->i_bh);
 			} else if (!dip->i_nlink) {
 			  log_debug(_("Its link count is zero.\n"));
 			} else {
@@ -53,7 +53,7 @@ static void add_dotdot(struct gfs2_inode *ip)
 			            dip->i_nlink);
 			  dip->i_nlink = 0;
 			  set_di_nlink(dip); /* keep inode tree in sync */
-			  bmodified(dip->i_bh);
+			  lgfs2_bmodified(dip->i_bh);
 			}
 		} else {
 			log_debug(_("Directory (0x%"PRIx64")'s link to parent "
@@ -243,6 +243,6 @@ int add_inode_to_lf(struct gfs2_inode *ip){
 	log_notice(_("Added inode #%"PRIu64" (0x%"PRIx64") to lost+found\n"),
 	           ip->i_num.in_addr, ip->i_num.in_addr);
 	lgfs2_dinode_out(lf_dip, lf_dip->i_bh->b_data);
-	bwrite(lf_dip->i_bh);
+	lgfs2_bwrite(lf_dip->i_bh);
 	return 0;
 }
diff --git a/gfs2/fsck/metawalk.c b/gfs2/fsck/metawalk.c
index 4b783648..2f0ba6c2 100644
--- a/gfs2/fsck/metawalk.c
+++ b/gfs2/fsck/metawalk.c
@@ -346,7 +346,7 @@ static int dirent_repair(struct gfs2_inode *ip, struct gfs2_buffer_head *bh,
 		d->dr_rec_len = GFS2_DIRENT_SIZE(d->dr_name_len);
 	}
 	lgfs2_dirent_out(d, dent);
-	bmodified(bh);
+	lgfs2_bmodified(bh);
 	return 0;
 }
 
@@ -365,7 +365,7 @@ static void dirblk_truncate(struct gfs2_inode *ip, struct gfs2_dirent *fixb,
 	lgfs2_dirent_in(&d, fixb);
 	d.dr_rec_len = bh_end - (char *)fixb;
 	lgfs2_dirent_out(&d, fixb);
-	bmodified(bh);
+	lgfs2_bmodified(bh);
 }
 
 /*
@@ -473,7 +473,7 @@ static int check_entries(struct gfs2_inode *ip, struct gfs2_buffer_head *bh,
 				d.dr_inum.in_addr = d.dr_inum.in_formal_ino;
 				d.dr_inum.in_formal_ino = 0;
 				lgfs2_dirent_out(&d, dent);
-				bmodified(bh);
+				lgfs2_bmodified(bh);
 				/* Mark dirent buffer as modified */
 				first = 0;
 			} else {
@@ -509,7 +509,7 @@ static int check_entries(struct gfs2_inode *ip, struct gfs2_buffer_head *bh,
 /**
  * check_leaf - check a leaf block for errors
  * Reads in the leaf block
- * Leaves the buffer around for further analysis (caller must brelse)
+ * Leaves the buffer around for further analysis (caller must lgfs2_brelse)
  */
 int check_leaf(struct gfs2_inode *ip, int lindex, struct metawalk_fxns *pass,
 	       uint64_t *leaf_no, struct lgfs2_leaf *leaf, int *ref_count)
@@ -533,7 +533,7 @@ int check_leaf(struct gfs2_inode *ip, int lindex, struct metawalk_fxns *pass,
 	}
 
 	/* Try to read in the leaf block. */
-	lbh = bread(sdp, *leaf_no);
+	lbh = lgfs2_bread(sdp, *leaf_no);
 	/* Make sure it's really a valid leaf block. */
 	if (lgfs2_check_meta(lbh->b_data, GFS2_METATYPE_LF)) {
 		msg = _("that is not really a leaf");
@@ -548,7 +548,7 @@ int check_leaf(struct gfs2_inode *ip, int lindex, struct metawalk_fxns *pass,
 			log_info(_("Previous reference to leaf %"PRIu64" (0x%"PRIx64") "
 				   "has already checked it; skipping.\n"),
 			         *leaf_no, *leaf_no);
-			brelse(lbh);
+			lgfs2_brelse(lbh);
 			return error;
 		}
 	}
@@ -563,7 +563,7 @@ int check_leaf(struct gfs2_inode *ip, int lindex, struct metawalk_fxns *pass,
 			     "\n"), *leaf_no);
 		leaf->lf_dirent_format = GFS2_FORMAT_DE;
 		lgfs2_leaf_out(leaf, lbh->b_data);
-		bmodified(lbh);
+		lgfs2_bmodified(lbh);
 		log_debug( _("Fixing lf_dirent_format.\n"));
 	}
 
@@ -594,8 +594,8 @@ int check_leaf(struct gfs2_inode *ip, int lindex, struct metawalk_fxns *pass,
 
 		/* release and re-read the leaf in case check_entries
 		   changed it. */
-		brelse(lbh);
-		lbh = bread(sdp, *leaf_no);
+		lgfs2_brelse(lbh);
+		lbh = lgfs2_bread(sdp, *leaf_no);
 		lgfs2_leaf_in(leaf, lbh->b_data);
 		if (count != leaf->lf_entries) {
 			log_err(_("Leaf %"PRIu64" (0x%"PRIx64") entry count in "
@@ -606,7 +606,7 @@ int check_leaf(struct gfs2_inode *ip, int lindex, struct metawalk_fxns *pass,
 			if (query( _("Update leaf entry count? (y/n) "))) {
 				leaf->lf_entries = count;
 				lgfs2_leaf_out(leaf, lbh->b_data);
-				bmodified(lbh);
+				lgfs2_bmodified(lbh);
 				log_warn( _("Leaf entry count updated\n"));
 			} else
 				log_err( _("Leaf entry count left in "
@@ -621,14 +621,14 @@ out:
 			  *ref_count, (*ref_count) << (ip->i_depth - di_depth));
 		(*ref_count) <<= (ip->i_depth - di_depth);
 	}
-	brelse(lbh);
+	lgfs2_brelse(lbh);
 	if (error < 0)
 		return error;
 	return 0;
 
 bad_leaf:
 	if (lbh)
-		brelse(lbh);
+		lgfs2_brelse(lbh);
 	if (pass->repair_leaf) {
 		/* The leaf we read in is bad so we need to repair it. */
 		fix = pass->repair_leaf(ip, leaf_no, lindex, *ref_count, msg);
@@ -732,14 +732,14 @@ int check_leaf_blks(struct gfs2_inode *ip, struct metawalk_fxns *pass)
 	for (lindex = 0; lindex < hsize; lindex++) {
 		leaf_no = be64_to_cpu(tbl[lindex]);
 		if (valid_block_ip(ip, leaf_no)) {
-			lbh = bread(sdp, leaf_no);
+			lbh = lgfs2_bread(sdp, leaf_no);
 			/* Make sure it's really a valid leaf block. */
 			if (lgfs2_check_meta(lbh->b_data, GFS2_METATYPE_LF) == 0) {
-				brelse(lbh);
+				lgfs2_brelse(lbh);
 				first_ok_leaf = leaf_no;
 				break;
 			}
-			brelse(lbh);
+			lgfs2_brelse(lbh);
 		}
 	}
 	if (first_ok_leaf == -1) { /* no valid leaf found */
@@ -932,12 +932,12 @@ static int check_leaf_eattr(struct gfs2_inode *ip, uint64_t block,
 		}
 		if (error > 0) {
 			if (bh)
-				brelse(bh);
+				lgfs2_brelse(bh);
 			return 1;
 		}
 		if (bh) {
 			error = check_eattr_entries(ip, bh, pass);
-			brelse(bh);
+			lgfs2_brelse(bh);
 		}
 		return error;
 	}
@@ -1007,7 +1007,7 @@ static int check_indirect_eattr(struct gfs2_inode *ip, uint64_t indirect,
 			   one. So we want: GGGG when we finish. To do that,
 			   we set di_eattr to 0 temporarily. */
 			ip->i_eattr = 0;
-			bmodified(ip->i_bh);
+			lgfs2_bmodified(ip->i_bh);
 		}
 		ea_leaf_ptr++;
 	}
@@ -1061,7 +1061,7 @@ int check_inode_eattr(struct gfs2_inode *ip, struct metawalk_fxns *pass)
 				stack;
 		}
 		if (indirect_buf)
-			brelse(indirect_buf);
+			lgfs2_brelse(indirect_buf);
 		return error;
 	}
 	error = check_leaf_eattr(ip, ip->i_eattr, ip->i_num.in_addr, pass);
@@ -1090,7 +1090,7 @@ static void free_metalist(struct gfs2_inode *ip, osi_list_t *mlp)
 			if (nbh == ip->i_bh)
 				osi_list_del_init(&nbh->b_altlist);
 			else
-				brelse(nbh);
+				lgfs2_brelse(nbh);
 		}
 	}
 }
@@ -1283,7 +1283,7 @@ static int build_and_check_metalist(struct gfs2_inode *ip, osi_list_t *mlp,
 				if (error == META_SKIP_ONE)
 					continue;
 				if (!nbh)
-					nbh = bread(ip->i_sbd, iptr_block(iptr));
+					nbh = lgfs2_bread(ip->i_sbd, iptr_block(iptr));
 				osi_list_add_prev(&nbh->b_altlist, cur_list);
 			} /* for all data on the indirect block */
 		} /* for blocks at that height */
@@ -1607,7 +1607,7 @@ undo_metalist:
 			if (bh == ip->i_bh)
 				osi_list_del(&bh->b_altlist);
 			else
-				brelse(bh);
+				lgfs2_brelse(bh);
 		}
 	}
 	/* There may be leftover duplicate records, so we need to delete them.
diff --git a/gfs2/fsck/pass1.c b/gfs2/fsck/pass1.c
index 0a55c512..0e67ee35 100644
--- a/gfs2/fsck/pass1.c
+++ b/gfs2/fsck/pass1.c
@@ -345,7 +345,7 @@ static int pass1_check_metalist(struct iptr iptr, struct gfs2_buffer_head **bh,
 			 block_type_string(q));
 		*was_duplicate = 1;
 	}
-	nbh = bread(ip->i_sbd, block);
+	nbh = lgfs2_bread(ip->i_sbd, block);
 
 	*is_valid = (lgfs2_check_meta(nbh->b_data, iblk_type) == 0);
 
@@ -356,11 +356,11 @@ static int pass1_check_metalist(struct iptr iptr, struct gfs2_buffer_head **bh,
 			 ip->i_num.in_addr, ip->i_num.in_addr, block, block, blktypedesc);
 		if (query(_("Zero the indirect block pointer? (y/n) "))){
 			*iptr_ptr(iptr) = 0;
-			bmodified(iptr.ipt_bh);
+			lgfs2_bmodified(iptr.ipt_bh);
 			*is_valid = 1;
 			return META_SKIP_ONE;
 		} else {
-			brelse(nbh);
+			lgfs2_brelse(nbh);
 			return META_SKIP_FURTHER;
 		}
 	}
@@ -369,7 +369,7 @@ static int pass1_check_metalist(struct iptr iptr, struct gfs2_buffer_head **bh,
 	if (*was_duplicate) {
 		add_duplicate_ref(ip, block, REF_AS_META, 0,
 				  *is_valid ? INODE_VALID : INODE_INVALID);
-		brelse(nbh);
+		lgfs2_brelse(nbh);
 	} else {
 		*bh = nbh;
 		fsck_blockmap_set(ip, block, _("indirect"), ip->i_sbd->gfs1 ?
@@ -474,7 +474,7 @@ static int blockmap_set_as_data(struct gfs2_inode *ip, uint64_t block)
 	error = 0;
 	/* The bitmap says it's a dinode, but a block reference begs to differ.
 	   So which is it? */
-	bh = bread(ip->i_sbd, block);
+	bh = lgfs2_bread(ip->i_sbd, block);
 	if (lgfs2_check_meta(bh->b_data, GFS2_METATYPE_DI) != 0)
 		goto out;
 
@@ -491,7 +491,7 @@ static int blockmap_set_as_data(struct gfs2_inode *ip, uint64_t block)
 out:
 	if (!error)
 		fsck_blockmap_set(ip, block, "data",  GFS2_BLKST_USED);
-	brelse(bh);
+	lgfs2_brelse(bh);
 	return error;
 }
 
@@ -546,10 +546,10 @@ static int pass1_check_data(struct gfs2_inode *ip, uint64_t metablock,
 					  INODE_VALID);
 			return 1;
 		case GFS2_BLKST_USED: /* tough decision: May be data or meta */
-			bh = bread(ip->i_sbd, block);
+			bh = lgfs2_bread(ip->i_sbd, block);
 			mh = (struct gfs2_meta_header *)bh->b_data;
 			mh_type = be32_to_cpu(mh->mh_type);
-			brelse(bh);
+			lgfs2_brelse(bh);
 			if (be32_to_cpu(mh->mh_magic) == GFS2_MAGIC &&
 			    mh_type >= GFS2_METATYPE_RG &&
 			    mh_type <= GFS2_METATYPE_QC &&
@@ -611,7 +611,7 @@ static int ask_remove_inode_eattr(struct gfs2_inode *ip,
 		bc->ea_count = 0;
 		ip->i_blocks = 1 + bc->indir_count + bc->data_count;
 		ip->i_flags &= ~GFS2_DIF_EA_INDIRECT;
-		bmodified(ip->i_bh);
+		lgfs2_bmodified(ip->i_bh);
 		log_err( _("Extended attributes were removed.\n"));
 	} else {
 		log_err( _("Extended attributes were not removed.\n"));
@@ -645,7 +645,7 @@ static int undo_eattr_indir_or_leaf(struct gfs2_inode *ip, uint64_t block,
 	if (q != (sdp->gfs1 ? GFS2_BLKST_DINODE : GFS2_BLKST_USED))
 		return 1;
 
-	*bh = bread(sdp, block);
+	*bh = lgfs2_bread(sdp, block);
 	return 0;
 }
 
@@ -686,7 +686,7 @@ static int check_eattr_indir(struct gfs2_inode *ip, uint64_t indirect,
 	   check if it really is an EA.  If it is, let duplicate
 	   handling sort it out.  If it isn't, clear it but don't
 	   count it as a duplicate. */
-	*bh = bread(sdp, indirect);
+	*bh = lgfs2_bread(sdp, indirect);
 	if (lgfs2_check_meta((*bh)->b_data, GFS2_METATYPE_IN)) {
 		bc->ea_count++;
 		if (q != GFS2_BLKST_FREE) { /* Duplicate? */
@@ -736,7 +736,7 @@ static int finish_eattr_indir(struct gfs2_inode *ip, int leaf_pointers,
 	        ip->i_num.in_addr, ip->i_num.in_addr);
 	if (query( _("Okay to fix the block count for the inode? (y/n) "))) {
 		ip->i_blocks = 1 + bc->indir_count + bc->data_count + bc->ea_count;
-		bmodified(ip->i_bh);
+		lgfs2_bmodified(ip->i_bh);
 		log_err(_("Block count fixed: 1+%"PRIu64"+%"PRIu64"+%"PRIu64" = %"PRIu64".\n"),
 		        bc->indir_count, bc->data_count, bc->ea_count, ip->i_blocks);
 		return 1;
@@ -760,7 +760,7 @@ static int check_ealeaf_block(struct gfs2_inode *ip, uint64_t block, int btype,
 	/* Special duplicate processing:  If we have an EA block, check if it
 	   really is an EA.  If it is, let duplicate handling sort it out.
 	   If it isn't, clear it but don't count it as a duplicate. */
-	leaf_bh = bread(sdp, block);
+	leaf_bh = lgfs2_bread(sdp, block);
 	if (lgfs2_check_meta(leaf_bh->b_data, btype)) {
 		bc->ea_count++;
 		if (q != GFS2_BLKST_FREE) { /* Duplicate? */
@@ -776,7 +776,7 @@ static int check_ealeaf_block(struct gfs2_inode *ip, uint64_t block, int btype,
 		}
 		complain_eas(ip, block, _("Extended Attribute leaf block has "
 					  "incorrect type"));
-		brelse(leaf_bh);
+		lgfs2_brelse(leaf_bh);
 		return 1;
 	}
 	if (q != GFS2_BLKST_FREE) { /* Duplicate? */
@@ -784,7 +784,7 @@ static int check_ealeaf_block(struct gfs2_inode *ip, uint64_t block, int btype,
 					  "duplicate found"));
 		add_duplicate_ref(ip, block, REF_AS_DATA, 0, INODE_VALID);
 		bc->ea_count++;
-		brelse(leaf_bh);
+		lgfs2_brelse(leaf_bh);
 		/* Return 0 here because if all that's wrong is a duplicate
 		   block reference, we want pass1b to figure it out. We don't
 		   want to delete all the extended attributes as if they are
@@ -838,7 +838,7 @@ static int check_extended_leaf_eattr(struct gfs2_inode *ip, int i,
 					   private);
 	}
 	if (bh)
-		brelse(bh);
+		lgfs2_brelse(bh);
 	if (error) {
 		log_err(_("Bad extended attribute found at block %"PRIu64" (0x%"PRIx64")"),
 		        be64_to_cpu(*data_ptr), be64_to_cpu(*data_ptr));
@@ -846,7 +846,7 @@ static int check_extended_leaf_eattr(struct gfs2_inode *ip, int i,
 			ea_hdr->ea_num_ptrs = i;
 			ea_hdr->ea_data_len = cpu_to_be32(tot_ealen);
 			*data_ptr = 0;
-			bmodified(leaf_bh);
+			lgfs2_bmodified(leaf_bh);
 			/* Endianness doesn't matter in this case because it's
 			   a single byte. */
 			fsck_blockmap_set(ip, ip->i_eattr,
@@ -908,7 +908,7 @@ static int ask_remove_eattr_entry(struct gfs2_sbd *sdp,
 	}
 	log_err(_("Bad Extended Attribute at block %"PRIu64" (0x%"PRIx64") removed.\n"),
 	        leaf_bh->b_blocknr, leaf_bh->b_blocknr);
-	bmodified(leaf_bh);
+	lgfs2_bmodified(leaf_bh);
 	return 1;
 }
 
@@ -1161,7 +1161,7 @@ static int alloc_metalist(struct iptr iptr, struct gfs2_buffer_head **bh, int h,
 	   after the bitmap has been set but before the blockmap has. */
 	*is_valid = 1;
 	*was_duplicate = 0;
-	*bh = bread(ip->i_sbd, block);
+	*bh = lgfs2_bread(ip->i_sbd, block);
 	q = bitmap_type(ip->i_sbd, block);
 	if (q == GFS2_BLKST_FREE) {
 		log_debug(_("%s reference to new metadata block %"PRIu64" (0x%"PRIx64") is now marked as indirect.\n"),
@@ -1358,7 +1358,7 @@ static int handle_ip(struct gfs2_sbd *sdp, struct gfs2_inode *ip)
 		         ip->i_blocks, bc.indir_count, bc.data_count, bc.ea_count);
 		if (query( _("Fix ondisk block count? (y/n) "))) {
 			ip->i_blocks = 1 + bc.indir_count + bc.data_count + bc.ea_count;
-			bmodified(ip->i_bh);
+			lgfs2_bmodified(ip->i_bh);
 			log_err(_("Block count for #%"PRIu64" (0x%"PRIx64") fixed\n"),
 			        ip->i_num.in_addr, ip->i_num.in_addr);
 		} else
@@ -1385,7 +1385,7 @@ static void check_i_goal(struct gfs2_sbd *sdp, struct gfs2_inode *ip)
 		if (query(_("Fix goal block in inode #%"PRIu64" (0x%"PRIx64")? (y/n) "),
 		          ip->i_num.in_addr, ip->i_num.in_addr)) {
 			ip->i_goal_meta = ip->i_num.in_addr;
-			bmodified(ip->i_bh);
+			lgfs2_bmodified(ip->i_bh);
 		} else
 			log_err(_("Allocation goal block in inode #%"PRIu64
 			          " (0x%"PRIx64") not fixed\n"),
@@ -1413,7 +1413,7 @@ static int handle_di(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
 		if (query(_("Fix address in inode at block #%"PRIu64" (0x%"PRIx64")? (y/n) "),
 		          block, block)) {
 			ip->i_num.in_addr = ip->i_num.in_formal_ino = block;
-			bmodified(ip->i_bh);
+			lgfs2_bmodified(ip->i_bh);
 		} else
 			log_err(_("Address in inode at block #%"PRIu64" (0x%"PRIx64" not fixed\n"),
 			        block, block);
@@ -1425,7 +1425,7 @@ static int handle_di(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
 		if (query(_("Fix formal inode number in inode #%"PRIu64" (0x%"PRIx64")? (y/n) "),
 		          block, block)) {
 			ip->i_num.in_formal_ino = block;
-			bmodified(ip->i_bh);
+			lgfs2_bmodified(ip->i_bh);
 		} else
 			log_err(_("Inode number in inode at block %"PRIu64" (0x%"PRIx64") not fixed\n"),
 			        block, block);
@@ -1797,7 +1797,7 @@ static int pass1_process_bitmap(struct gfs2_sbd *sdp, struct rgrp_tree *rgd, uin
 			continue;
 		}
 
-		bh = bread(sdp, block);
+		bh = lgfs2_bread(sdp, block);
 
 		is_inode = 0;
 		if (lgfs2_check_meta(bh->b_data, GFS2_METATYPE_DI) == 0)
@@ -1814,7 +1814,7 @@ static int pass1_process_bitmap(struct gfs2_sbd *sdp, struct rgrp_tree *rgd, uin
 					    "previously processed GFS1 "
 					    "non-dinode metadata.\n"),
 				          block);
-				brelse(bh);
+				lgfs2_brelse(bh);
 				continue;
 			}
 			log_err(_("Found a duplicate inode block at %"PRIu64" (0x%"PRIx64") "
@@ -1829,7 +1829,7 @@ static int pass1_process_bitmap(struct gfs2_sbd *sdp, struct rgrp_tree *rgd, uin
 					   "assume the bitmap is just "
 					   "wrong.\n"));
 			fsck_inode_put(&ip);
-			brelse(bh);
+			lgfs2_brelse(bh);
 			continue;
 		}
 
@@ -1848,7 +1848,7 @@ static int pass1_process_bitmap(struct gfs2_sbd *sdp, struct rgrp_tree *rgd, uin
 						     "%" PRIu64" (0x%"
 						     PRIx64 ")\n"),
 						   block, block);
-					brelse(bh);
+					lgfs2_brelse(bh);
 					continue;
 				}
 			}
@@ -1857,7 +1857,7 @@ static int pass1_process_bitmap(struct gfs2_sbd *sdp, struct rgrp_tree *rgd, uin
 			check_n_fix_bitmap(sdp, rgd, block, 0, GFS2_BLKST_FREE);
 		} else if (handle_di(sdp, rgd, bh) < 0) {
 			stack;
-			brelse(bh);
+			lgfs2_brelse(bh);
 			gfs2_special_free(&gfs1_rindex_blks);
 			return FSCK_ERROR;
 		}
@@ -1868,7 +1868,7 @@ static int pass1_process_bitmap(struct gfs2_sbd *sdp, struct rgrp_tree *rgd, uin
 		   as indirect blocks will be handled when the inode
 		   itself is processed, and if it's not, it should be
 		   caught in pass5. */
-		brelse(bh);
+		lgfs2_brelse(bh);
 	}
 
 	return 0;
diff --git a/gfs2/fsck/pass1b.c b/gfs2/fsck/pass1b.c
index 5b37478d..1fb1cc4c 100644
--- a/gfs2/fsck/pass1b.c
+++ b/gfs2/fsck/pass1b.c
@@ -114,17 +114,17 @@ static void clone_data_block(struct gfs2_sbd *sdp, struct duptree *dt,
 		log_err(_("Unable to clone data block.\n"));
 	} else {
 		if (metaref.metablock != id->block_no)
-			bh = bread(sdp, metaref.metablock);
+			bh = lgfs2_bread(sdp, metaref.metablock);
 		else
 			bh = ip->i_bh;
 		ptr = (__be64 *)bh->b_data + metaref.off;
 		clone_data(ip, 0, dt->block, &clone, bh, ptr);
 		if (metaref.metablock != id->block_no)
-			brelse(bh);
+			lgfs2_brelse(bh);
 		else
-			bmodified(ip->i_bh);
+			lgfs2_bmodified(ip->i_bh);
 	}
-	fsck_inode_put(&ip); /* out, brelse, free */
+	fsck_inode_put(&ip); /* out, lgfs2_brelse, free */
 }
 
 /* revise_dup_handler - get current information about a duplicate reference
@@ -311,7 +311,7 @@ static void resolve_dup_references(struct gfs2_sbd *sdp, struct duptree *dt,
 				if (ip->i_blocks > 0)
 					ip->i_blocks--;
 				ip->i_flags &= ~GFS2_DIF_EA_INDIRECT;
-				bmodified(ip->i_bh);
+				lgfs2_bmodified(ip->i_bh);
 				dup_listent_delete(dt, id);
 				(dh->ref_inode_count)--;
 			} else {
@@ -365,7 +365,7 @@ static void resolve_dup_references(struct gfs2_sbd *sdp, struct duptree *dt,
 		   still being referenced by a valid dinode. */
 		if (this_ref != REF_AS_EA)
 			delete_all_dups(ip);
-		fsck_inode_put(&ip); /* out, brelse, free */
+		fsck_inode_put(&ip); /* out, lgfs2_brelse, free */
 	}
 	return;
 }
@@ -378,7 +378,7 @@ static int clone_check_meta(struct iptr iptr, struct gfs2_buffer_head **bh, int
 
 	*was_duplicate = 0;
 	*is_valid = 1;
-	*bh = bread(ip->i_sbd, block);
+	*bh = lgfs2_bread(ip->i_sbd, block);
 	return 0;
 }
 
@@ -412,16 +412,16 @@ static int clone_data(struct gfs2_inode *ip, uint64_t metablock,
 	if (query( _("Okay to clone the duplicated reference? (y/n) "))) {
 		error = lgfs2_meta_alloc(ip, &cloneblock);
 		if (!error) {
-			clone_bh = bread(ip->i_sbd, clonet->dup_block);
+			clone_bh = lgfs2_bread(ip->i_sbd, clonet->dup_block);
 			if (clone_bh) {
 				fsck_bitmap_set(ip, cloneblock, _("data"),
 						GFS2_BLKST_USED);
 				clone_bh->b_blocknr = cloneblock;
-				bmodified(clone_bh);
-				brelse(clone_bh);
+				lgfs2_bmodified(clone_bh);
+				lgfs2_brelse(clone_bh);
 				/* Now fix the reference: */
 				*ptr = cpu_to_be64(cloneblock);
-				bmodified(bh);
+				lgfs2_bmodified(bh);
 				log_err(_("Duplicate reference to block %"PRIu64
 				          " (0x%"PRIx64") was cloned to block %"PRIu64
 					  " (0x%"PRIx64").\n"),
@@ -437,7 +437,7 @@ static int clone_data(struct gfs2_inode *ip, uint64_t metablock,
 			return 0;
 		}
 		*ptr = 0;
-		bmodified(bh);
+		lgfs2_bmodified(bh);
 		log_err(_("Duplicate reference to block %"PRIu64" (0x%"PRIx64") was zeroed.\n"),
 		        block, block);
 	} else {
@@ -579,7 +579,7 @@ static void resolve_last_reference(struct gfs2_sbd *sdp, struct duptree *dt,
 				ip->i_eattr = 0;
 				ip->i_flags &= ~GFS2_DIF_EA_INDIRECT;
 				ip->i_blocks--;
-				bmodified(ip->i_bh);
+				lgfs2_bmodified(ip->i_bh);
 				fsck_bitmap_set(ip, dt->block,
 						_("reference-repaired EA"),
 						GFS2_BLKST_FREE);
@@ -591,7 +591,7 @@ static void resolve_last_reference(struct gfs2_sbd *sdp, struct duptree *dt,
 			}
 		}
 	}
-	fsck_inode_put(&ip); /* out, brelse, free */
+	fsck_inode_put(&ip); /* out, lgfs2_brelse, free */
 	log_debug(_("Done with duplicate reference to block 0x%"PRIx64"\n"), dt->block);
 	dup_delete(dt);
 }
@@ -630,10 +630,10 @@ static int handle_dup_blk(struct gfs2_sbd *sdp, struct duptree *dt)
 	   references to it as metadata.  Dinodes with such references are
 	   clearly corrupt and need to be deleted.
 	   And if we're left with a single reference, problem solved. */
-	bh = bread(sdp, dt->block);
+	bh = lgfs2_bread(sdp, dt->block);
 	cmagic = ((struct gfs2_meta_header *)(bh->b_data))->mh_magic;
 	ctype = ((struct gfs2_meta_header *)(bh->b_data))->mh_type;
-	brelse(bh);
+	lgfs2_brelse(bh);
 
 	/* If this is a dinode, any references to it (except in directory
 	   entries) are invalid and should be deleted. */
@@ -763,7 +763,7 @@ static int check_eattr_indir_refs(struct gfs2_inode *ip, uint64_t block,
 
 	error = add_duplicate_ref(ip, block, REF_AS_EA, 1, INODE_VALID);
 	if (!error)
-		*bh = bread(sdp, block);
+		*bh = lgfs2_bread(sdp, block);
 
 	return error;
 }
@@ -777,7 +777,7 @@ static int check_eattr_leaf_refs(struct gfs2_inode *ip, uint64_t block,
 
 	error = add_duplicate_ref(ip, block, REF_AS_EA, 1, INODE_VALID);
 	if (!error)
-		*bh = bread(sdp, block);
+		*bh = lgfs2_bread(sdp, block);
 	return error;
 }
 
@@ -826,7 +826,7 @@ static int find_block_ref(struct gfs2_sbd *sdp, uint64_t inode)
 		.check_eattr_extentry = check_eattr_extentry_refs,
 	};
 
-	ip = fsck_load_inode(sdp, inode); /* bread, inode_get */
+	ip = fsck_load_inode(sdp, inode); /* lgfs2_bread, inode_get */
 
 	/* double-check the meta header just to be sure it's metadata */
 	if (ip->i_magic != GFS2_MAGIC ||
@@ -850,7 +850,7 @@ static int find_block_ref(struct gfs2_sbd *sdp, uint64_t inode)
 		error = check_inode_eattr(ip, &find_refs);
 
 out:
-	fsck_inode_put(&ip); /* out, brelse, free */
+	fsck_inode_put(&ip); /* out, lgfs2_brelse, free */
 	return error;
 }
 
diff --git a/gfs2/fsck/pass2.c b/gfs2/fsck/pass2.c
index a80aae2f..92c816ce 100644
--- a/gfs2/fsck/pass2.c
+++ b/gfs2/fsck/pass2.c
@@ -99,14 +99,14 @@ static int check_eattr_indir(struct gfs2_inode *ip, uint64_t block,
 			     uint64_t parent, struct gfs2_buffer_head **bh,
 			     void *private)
 {
-	*bh = bread(ip->i_sbd, block);
+	*bh = lgfs2_bread(ip->i_sbd, block);
 	return 0;
 }
 static int check_eattr_leaf(struct gfs2_inode *ip, uint64_t block,
 			    uint64_t parent, struct gfs2_buffer_head **bh,
 			    void *private)
 {
-	*bh = bread(ip->i_sbd, block);
+	*bh = lgfs2_bread(ip->i_sbd, block);
 	return 0;
 }
 
@@ -215,7 +215,7 @@ static int bad_formal_ino(struct gfs2_inode *ip, struct gfs2_dirent *dent,
 			entry.in_formal_ino = inum.in_formal_ino;
 			d->dr_inum.in_formal_ino = entry.in_formal_ino;
 			lgfs2_dirent_out(d, dent);
-			bmodified(bh);
+			lgfs2_bmodified(bh);
 			incr_link_count(entry, ip, _("fixed reference"));
 			set_parent_dir(sdp, entry, ip->i_num);
 		} else {
@@ -280,7 +280,7 @@ static int check_leaf_depth(struct gfs2_inode *ip, uint64_t leaf_no,
 	}
 
 	leaf->lf_depth = cpu_to_be16(correct_depth);
-	bmodified(lbh);
+	lgfs2_bmodified(lbh);
 	log_err( _("The leaf block depth was fixed.\n"));
 	return 1;
 }
@@ -331,9 +331,9 @@ static int wrong_leaf(struct gfs2_inode *ip, struct lgfs2_inum *entry,
 		else if (dest_ref)
 			break;
 	}
-	dest_lbh = bread(sdp, planned_leaf);
+	dest_lbh = lgfs2_bread(sdp, planned_leaf);
 	check_leaf_depth(ip, planned_leaf, dest_ref, dest_lbh);
-	brelse(dest_lbh);
+	lgfs2_brelse(dest_lbh);
 	free(tbl);
 
 	/* check if it's already on the correct leaf block */
@@ -487,7 +487,7 @@ static int basic_dentry_checks(struct gfs2_inode *ip, struct gfs2_dirent *dent,
 		}
 		d->dr_hash = calculated_hash;
 		lgfs2_dirent_out(d, dent);
-		bmodified(bh);
+		lgfs2_bmodified(bh);
 		log_err( _("Directory entry hash for %s fixed.\n"),
 			 tmp_name);
 	}
@@ -600,16 +600,16 @@ static int basic_dentry_checks(struct gfs2_inode *ip, struct gfs2_dirent *dent,
 	if (ii == NULL && di == NULL && sdp->gfs1) {
 		struct gfs2_buffer_head *tbh;
 
-		tbh = bread(sdp, entry->in_addr);
+		tbh = lgfs2_bread(sdp, entry->in_addr);
 		if (lgfs2_check_meta(tbh->b_data, GFS2_METATYPE_DI)) { /* not dinode */
 			log_err(_("Directory entry '%s' pointing to block %"PRIu64
 			          " (0x%"PRIx64") in directory %"PRIu64" (0x%"PRIx64") "
 				   "is not really a GFS1 dinode.\n"), tmp_name,
 			        entry->in_addr, entry->in_addr, ip->i_num.in_addr, ip->i_num.in_addr);
-			brelse(tbh);
+			lgfs2_brelse(tbh);
 			return 1;
 		}
-		brelse(tbh);
+		lgfs2_brelse(tbh);
 	}
 	return 0;
 }
@@ -972,8 +972,8 @@ static int write_new_leaf(struct gfs2_inode *dip, int start_lindex,
 		num_copies, num_copies,
 		before_or_after, start_lindex, start_lindex);
 	dip->i_blocks++;
-	bmodified(dip->i_bh);
-	nbh = bget(dip->i_sbd, *bn);
+	lgfs2_bmodified(dip->i_bh);
+	nbh = lgfs2_bget(dip->i_sbd, *bn);
 	memset(nbh->b_data, 0, dip->i_sbd->sd_bsize);
 	leaf = (struct gfs2_leaf *)nbh->b_data;
 	leaf->lf_header.mh_magic = cpu_to_be32(GFS2_MAGIC);
@@ -985,8 +985,8 @@ static int write_new_leaf(struct gfs2_inode *dip, int start_lindex,
 	dent = (struct gfs2_dirent *)(nbh->b_data + sizeof(struct gfs2_leaf));
 	dent->de_rec_len = cpu_to_be16(dip->i_sbd->sd_bsize -
 				       sizeof(struct gfs2_leaf));
-	bmodified(nbh);
-	brelse(nbh);
+	lgfs2_bmodified(nbh);
+	lgfs2_brelse(nbh);
 
 	/* pad the hash table with the new leaf block */
 	cpyptr = padbuf;
@@ -1155,7 +1155,7 @@ static int lost_leaf(struct gfs2_inode *ip, __be64 *tbl, uint64_t leafno,
 	/* Free the lost leaf. */
 	fsck_bitmap_set(ip, leafno, _("lost leaf"), GFS2_BLKST_FREE);
 	ip->i_blocks--;
-	bmodified(ip->i_bh);
+	lgfs2_bmodified(ip->i_bh);
 	/* Now we have to deal with the bad hash table entries pointing to the
 	   misplaced leaf block. But we can't just fill the gap with a single
 	   leaf. We have to write on nice power-of-two boundaries, and we have
@@ -1316,7 +1316,7 @@ static int fix_hashtable(struct gfs2_inode *ip, __be64 *tbl, unsigned hsize,
 		log_debug("Leaf repaired while fixing the hash table.\n");
 		error = 0;
 	}
-	lbh = bread(ip->i_sbd, leafblk);
+	lbh = lgfs2_bread(ip->i_sbd, leafblk);
 	/* If the leaf's depth is out of range for this dinode, it's obviously
 	   attached to the wrong dinode. Move the dirents to lost+found. */
 	if (leaf.lf_depth > ip->i_depth) {
@@ -1324,7 +1324,7 @@ static int fix_hashtable(struct gfs2_inode *ip, __be64 *tbl, unsigned hsize,
 			  "dinode's depth (%d)\n"),
 			leaf.lf_depth, ip->i_depth);
 		error = lost_leaf(ip, tbl, leafblk, len, lindex, lbh);
-		brelse(lbh);
+		lgfs2_brelse(lbh);
 		return error;
 	}
 
@@ -1335,7 +1335,7 @@ static int fix_hashtable(struct gfs2_inode *ip, __be64 *tbl, unsigned hsize,
 	/* If this is an empty leaf, we can just delete it and pad. */
 	if ((dentry.dr_rec_len == ip->i_sbd->sd_bsize - sizeof(struct gfs2_leaf)) &&
 	    (dentry.dr_inum.in_formal_ino == 0)) {
-		brelse(lbh);
+		lgfs2_brelse(lbh);
 		gfs2_free_block(ip->i_sbd, leafblk);
 		log_err(_("Out of place leaf block %"PRIu64" (0x%"PRIx64") had no "
 			"entries, so it was deleted.\n"),
@@ -1359,7 +1359,7 @@ static int fix_hashtable(struct gfs2_inode *ip, __be64 *tbl, unsigned hsize,
 			  "(%d - %d)\n"),
 			hash_index, lindex, lindex + *proper_len);
 		error = lost_leaf(ip, tbl, leafblk, len, lindex, lbh);
-		brelse(lbh);
+		lgfs2_brelse(lbh);
 		return error;
 	}
 
@@ -1371,7 +1371,7 @@ static int fix_hashtable(struct gfs2_inode *ip, __be64 *tbl, unsigned hsize,
 			  "(%x).\n"), lindex, lindex,
 			leaf_proper_start, leaf_proper_start);
 		pad_with_leafblks(ip, tbl, lindex, leaf_proper_start - lindex);
-		brelse(lbh);
+		lgfs2_brelse(lbh);
 		return 1; /* reprocess the starting lindex */
 	}
 	/* If the proper start according to the leaf's hash index is later
@@ -1386,7 +1386,7 @@ static int fix_hashtable(struct gfs2_inode *ip, __be64 *tbl, unsigned hsize,
 			  "0x%x in the hash table.\n"), leaf_proper_start,
 			proper_start);
 		error = lost_leaf(ip, tbl, leafblk, len, lindex, lbh);
-		brelse(lbh);
+		lgfs2_brelse(lbh);
 		return error;
 	}
 
@@ -1426,7 +1426,7 @@ static int fix_hashtable(struct gfs2_inode *ip, __be64 *tbl, unsigned hsize,
 		if (*proper_len < (len >> 1)) {
 			log_err(_("One leaf split is not enough. The hash "
 				  "table will need to be reprocessed.\n"));
-			brelse(lbh);
+			lgfs2_brelse(lbh);
 			return changes;
 		}
 		lindex += (*proper_len); /* skip the new leaf from the split */
@@ -1438,7 +1438,7 @@ static int fix_hashtable(struct gfs2_inode *ip, __be64 *tbl, unsigned hsize,
 			len, leafblk, leaf.lf_depth,
 			*proper_len);
 	}
-	brelse(lbh);
+	lgfs2_brelse(lbh);
 	/* At this point, lindex should be at the proper end of the pointers.
 	   Now we need to replace any extra duplicate pointers to the old
 	   (original) leafblk (that ran off the end) with new leaf blocks. */
@@ -1501,9 +1501,9 @@ static int check_hash_tbl_dups(struct gfs2_inode *ip, __be64 *tbl,
 		if (!valid_block_ip(ip, leaf_no)) /* Checked later */
 			continue;
 
-		lbh = bread(ip->i_sbd, leafblk);
+		lbh = lgfs2_bread(ip->i_sbd, leafblk);
 		if (lgfs2_check_meta(lbh->b_data, GFS2_METATYPE_LF)) { /* Chked later */
-			brelse(lbh);
+			lgfs2_brelse(lbh);
 			continue;
 		}
 
@@ -1511,7 +1511,7 @@ static int check_hash_tbl_dups(struct gfs2_inode *ip, __be64 *tbl,
 		de = (struct gfs2_dirent *)(lbh->b_data + sizeof(struct gfs2_leaf));
 		lgfs2_dirent_in(&dentry, de);
 		hash_index = hash_table_index(dentry.dr_hash, ip);
-		brelse(lbh);
+		lgfs2_brelse(lbh);
 		/* check the duplicate ref first */
 		if (hash_index < l ||  hash_index > l + len2) {
 			log_err(_("This leaf block has hash index %d, which "
@@ -1526,7 +1526,7 @@ static int check_hash_tbl_dups(struct gfs2_inode *ip, __be64 *tbl,
 			   pass1 would have counted them and adjusted the
 			   count to include them. So we must subtract them. */
 			ip->i_blocks--;
-			bmodified(ip->i_bh);
+			lgfs2_bmodified(ip->i_bh);
 			pad_with_leafblks(ip, tbl, l, len2);
 		} else {
 			log_debug(_("Hash index 0x%x is the proper reference to leaf 0x%"PRIx64".\n"),
@@ -1545,7 +1545,7 @@ static int check_hash_tbl_dups(struct gfs2_inode *ip, __be64 *tbl,
 				return 0;
 			}
 			ip->i_blocks--;
-			bmodified(ip->i_bh);
+			lgfs2_bmodified(ip->i_bh);
 			pad_with_leafblks(ip, tbl, lindex, len);
 			/* At this point we know both copies are bad, so we
 			   return to start fresh */
@@ -1684,12 +1684,12 @@ static int check_hash_tbl(struct gfs2_inode *ip, __be64 *tbl,
 				  "for leaf %"PRIu64" (0x%"PRIx64"). Valid boundary "
 				  "assumed to be %d (0x%x).\n"), len, len,
 				leafblk, leafblk, proper_len, proper_len);
-			lbh = bread(ip->i_sbd, leafblk);
+			lbh = lgfs2_bread(ip->i_sbd, leafblk);
 			lgfs2_leaf_in(&leaf, lbh->b_data);
 			if (lgfs2_check_meta(lbh->b_data, GFS2_METATYPE_LF) ||
 			    leaf.lf_depth > ip->i_depth)
 				leaf.lf_depth = factor;
-			brelse(lbh);
+			lgfs2_brelse(lbh);
 			changes = fix_hashtable(ip, tbl, hsize, leafblk,
 						lindex, lindex, len,
 						&proper_len, leaf.lf_depth);
@@ -1723,9 +1723,9 @@ static int check_hash_tbl(struct gfs2_inode *ip, __be64 *tbl,
 			changes++;
 			/* Now we have to determine if the hash table is
 			   corrupt, or if the leaf has the wrong depth. */
-			lbh = bread(ip->i_sbd, leafblk);
+			lbh = lgfs2_bread(ip->i_sbd, leafblk);
 			lgfs2_leaf_in(&leaf, lbh->b_data);
-			brelse(lbh);
+			lgfs2_brelse(lbh);
 			/* Calculate the expected pointer count based on the
 			   leaf depth. */
 			proper_len = 1 << (ip->i_depth - leaf.lf_depth);
@@ -1771,7 +1771,7 @@ static int check_metalist_qc(struct iptr iptr, struct gfs2_buffer_head **bh, int
 
 	*was_duplicate = 0;
 	*is_valid = 1;
-	*bh = bread(ip->i_sbd, block);
+	*bh = lgfs2_bread(ip->i_sbd, block);
 	return META_IS_GOOD;
 }
 
@@ -1786,15 +1786,15 @@ static int check_data_qc(struct gfs2_inode *ip, uint64_t metablock,
 	if (!valid_block_ip(ip, block))
 		return -1;
 
-	bh = bread(ip->i_sbd, block);
+	bh = lgfs2_bread(ip->i_sbd, block);
 	if (lgfs2_check_meta(bh->b_data, GFS2_METATYPE_QC) != 0) {
 		log_crit(_("Error: quota_change block at %"PRIu64" (0x%"PRIx64") is "
 			   "the wrong metadata type.\n"),
 		         block, block);
-		brelse(bh);
+		lgfs2_brelse(bh);
 		return -1;
 	}
-	brelse(bh);
+	lgfs2_brelse(bh);
 	return 0;
 }
 
@@ -1973,7 +1973,7 @@ static int check_system_dir(struct gfs2_inode *sysinode, const char *dirname,
 		if (query( _("Fix entries for %s inode %"PRIu64" (0x%"PRIx64")? (y/n) "),
 			  dirname, sysinode->i_num.in_addr, sysinode->i_num.in_addr)) {
 			sysinode->i_entries = ds.entry_count;
-			bmodified(sysinode->i_bh);
+			lgfs2_bmodified(sysinode->i_bh);
 			log_warn( _("Entries updated\n"));
 		} else {
 			log_err(_("Entries for inode %"PRIu64" (0x%"PRIx64") left out of sync\n"),
@@ -2087,7 +2087,7 @@ static int pass2_check_dir(struct gfs2_sbd *sdp, struct gfs2_inode *ip)
 		        ip->i_entries, ds.entry_count, ip->i_num.in_addr, ip->i_num.in_addr);
 		if (query(_("Fix the entry count? (y/n) "))) {
 			ip->i_entries = ds.entry_count;
-			bmodified(ip->i_bh);
+			lgfs2_bmodified(ip->i_bh);
 		} else {
 			log_err(_("The entry count was not fixed.\n"));
 		}
diff --git a/gfs2/fsck/pass4.c b/gfs2/fsck/pass4.c
index 78faf71d..25d756d9 100644
--- a/gfs2/fsck/pass4.c
+++ b/gfs2/fsck/pass4.c
@@ -33,7 +33,7 @@ static int fix_link_count(uint32_t counted_links, struct gfs2_inode *ip)
 	if (ip->i_nlink == counted_links)
 		return 0;
 	ip->i_nlink = counted_links;
-	bmodified(ip->i_bh);
+	lgfs2_bmodified(ip->i_bh);
 
 	log_debug(_("Changing inode %"PRIu64" (0x%"PRIx64") to have %u links\n"),
 	          ip->i_num.in_addr, ip->i_num.in_addr, counted_links);
@@ -128,10 +128,10 @@ static void handle_inconsist(struct gfs2_sbd *sdp, uint64_t no_addr,
 	          no_addr, no_addr)) {
 		struct gfs2_inode *ip;
 
-		ip = fsck_load_inode(sdp, no_addr); /* bread, inode_get */
+		ip = fsck_load_inode(sdp, no_addr); /* lgfs2_bread, inode_get */
 		fix_link_count(counted_links, ip);
 		*di_nlink = counted_links;
-		fsck_inode_put(&ip); /* out, brelse, free */
+		fsck_inode_put(&ip); /* out, lgfs2_brelse, free */
 		log_warn(_("Link count updated to %d for inode %"PRIu64" (0x%"PRIx64")\n"),
 		         *di_nlink, no_addr, no_addr);
 	} else {
diff --git a/gfs2/fsck/pass5.c b/gfs2/fsck/pass5.c
index 7d2e309d..9b8f8375 100644
--- a/gfs2/fsck/pass5.c
+++ b/gfs2/fsck/pass5.c
@@ -48,12 +48,12 @@ static int check_block_status(struct gfs2_sbd *sdp,  struct gfs2_bmap *bl,
 		if (sdp->gfs1 && q == GFS2_BLKST_DINODE) {
 			struct gfs2_buffer_head *bh;
 
-			bh = bread(sdp, block);
+			bh = lgfs2_bread(sdp, block);
 			if (lgfs2_check_meta(bh->b_data, GFS2_METATYPE_DI) == 0)
 				count[GFS2_BLKST_DINODE]++;
 			else
 				count[GFS1_BLKST_USEDMETA]++;
-			brelse(bh);
+			lgfs2_brelse(bh);
 		} else {
 			count[q]++;
 		}
diff --git a/gfs2/fsck/rgrepair.c b/gfs2/fsck/rgrepair.c
index b7bb8dd2..5dddaefb 100644
--- a/gfs2/fsck/rgrepair.c
+++ b/gfs2/fsck/rgrepair.c
@@ -67,13 +67,13 @@ static void find_journaled_rgs(struct gfs2_sbd *sdp)
 			block_map(ip, b, &new, &dblock, NULL, 0);
 			if (!dblock)
 				break;
-			bh = bread(sdp, dblock);
+			bh = lgfs2_bread(sdp, dblock);
 			if (!lgfs2_check_meta(bh->b_data, GFS2_METATYPE_RG)) {
 				/* False rgrp found at block dblock */
 				false_count++;
 				gfs2_special_set(&false_rgrps, dblock);
 			}
-			brelse(bh);
+			lgfs2_brelse(bh);
 		}
 		log_debug("\n%d false positives identified.\n", false_count);
 	}
@@ -123,9 +123,9 @@ static int find_shortest_rgdist(struct gfs2_sbd *sdp, uint64_t *dist_array,
 		else if (is_false_rg(blk))
 			is_rgrp = 0;
 		else {
-			bh = bread(sdp, blk);
+			bh = lgfs2_bread(sdp, blk);
 			is_rgrp = (lgfs2_check_meta(bh->b_data, GFS2_METATYPE_RG) == 0);
-			brelse(bh);
+			lgfs2_brelse(bh);
 		}
 		if (!is_rgrp) {
 			if (rgs_sampled >= 6) {
@@ -140,10 +140,10 @@ static int find_shortest_rgdist(struct gfs2_sbd *sdp, uint64_t *dist_array,
 				if (is_false_rg(nblk)) {
 					is_rgrp = 0;
 				} else {
-					bh = bread(sdp, nblk);
+					bh = lgfs2_bread(sdp, nblk);
 					is_rgrp = (((lgfs2_check_meta(bh->b_data,
 						GFS2_METATYPE_RG) == 0)));
-					brelse(bh);
+					lgfs2_brelse(bh);
 				}
 				if (is_rgrp) {
 					log_info(_("Next rgrp is intact, so "
@@ -353,12 +353,12 @@ static uint64_t find_next_rgrp_dist(struct gfs2_sbd *sdp, uint64_t blk,
 			break;
 		if (block >= prevrgd->rt_addr + twogigs)
 			break;
-		bh = bread(sdp, block);
+		bh = lgfs2_bread(sdp, block);
 		mh = (struct gfs2_meta_header *)bh->b_data;
 		if ((be32_to_cpu(mh->mh_magic) != GFS2_MAGIC) ||
 		    (first && be32_to_cpu(mh->mh_type) != GFS2_METATYPE_RG) ||
 		    (!first && be32_to_cpu(mh->mh_type) != GFS2_METATYPE_RB)) {
-			brelse(bh);
+			lgfs2_brelse(bh);
 			break;
 		}
 		if (first) {
@@ -371,7 +371,7 @@ static uint64_t find_next_rgrp_dist(struct gfs2_sbd *sdp, uint64_t blk,
 		first = 0;
 		block++;
 		length++;
-		brelse(bh);
+		lgfs2_brelse(bh);
 		/* Check if this distance points to an rgrp:
 		   We have to look for blocks that resemble rgrps and bitmaps.
 		   If they do, we need to count blocks used and free and see
@@ -386,7 +386,7 @@ static uint64_t find_next_rgrp_dist(struct gfs2_sbd *sdp, uint64_t blk,
 		for (b = 0; b <= length + GFS2_NBBY; b++) {
 			if (next_block + b >= sdp->device.length)
 				break;
-			bh = bread(sdp, next_block + b);
+			bh = lgfs2_bread(sdp, next_block + b);
 			mh = (struct gfs2_meta_header *)bh->b_data;
 			if (be32_to_cpu(mh->mh_magic) == GFS2_MAGIC) {
 				if (be32_to_cpu(mh->mh_type) == GFS2_METATYPE_RG)
@@ -399,7 +399,7 @@ static uint64_t find_next_rgrp_dist(struct gfs2_sbd *sdp, uint64_t blk,
 					rgrp_dist--;
 				}
 			}
-			brelse(bh);
+			lgfs2_brelse(bh);
 			if (found)
 				break;
 			rgrp_dist++;
@@ -432,16 +432,16 @@ static uint64_t hunt_and_peck(struct gfs2_sbd *sdp, uint64_t blk,
 	if (gfs2_check_range(sdp, blk + last_bump))
 		return sdp->fssize - blk;
 
-	bh = bread(sdp, blk + last_bump);
+	bh = lgfs2_bread(sdp, blk + last_bump);
 	mh = (struct gfs2_meta_header *)bh->b_data;
 	if (be32_to_cpu(mh->mh_magic) == GFS2_MAGIC &&
 	    be32_to_cpu(mh->mh_type) == GFS2_METATYPE_RG) {
 		log_info(_("rgrp found at 0x%"PRIx64", length=%"PRIu64"\n"),
 		         blk + last_bump, last_bump);
-		brelse(bh);
+		lgfs2_brelse(bh);
 		return last_bump;
 	}
-	brelse(bh);
+	lgfs2_brelse(bh);
 
 	rgrp_dist = AWAY_FROM_BITMAPS; /* Get away from any bitmaps
 					  associated with the previous rgrp */
@@ -462,11 +462,11 @@ static uint64_t hunt_and_peck(struct gfs2_sbd *sdp, uint64_t blk,
 	for (b = AWAY_FROM_BITMAPS; b < last_block; b++) {
 		uint32_t magic, type;
 
-		bh = bread(sdp, block + b);
+		bh = lgfs2_bread(sdp, block + b);
 		mh = (struct gfs2_meta_header *)bh->b_data;
 		magic = be32_to_cpu(mh->mh_magic);
 		type = be32_to_cpu(mh->mh_type);
-		brelse(bh);
+		lgfs2_brelse(bh);
 		if (magic == GFS2_MAGIC) {
 			if (type == GFS2_METATYPE_RG)
 				break;
@@ -553,9 +553,9 @@ static int rindex_rebuild(struct gfs2_sbd *sdp, int *num_rgs, int gfs_grow)
 	blk = LGFS2_SB_ADDR(sdp) + 1;
 	while (blk <= sdp->device.length) {
 		log_debug( _("Block 0x%"PRIx64"\n"), blk);
-		bh = bread(sdp, blk);
+		bh = lgfs2_bread(sdp, blk);
 		rg_was_fnd = (!lgfs2_check_meta(bh->b_data, GFS2_METATYPE_RG));
-		brelse(bh);
+		lgfs2_brelse(bh);
 		/* Allocate a new RG and index. */
 		calc_rgd = rgrp_insert(&rgcalc, blk);
 		if (!calc_rgd) {
@@ -583,9 +583,9 @@ static int rindex_rebuild(struct gfs2_sbd *sdp, int *num_rgs, int gfs_grow)
 		/* ------------------------------------------------ */
 		for (fwd_block = blk + 1; fwd_block < sdp->device.length; fwd_block++) {
 			int bitmap_was_fnd;
-			bh = bread(sdp, fwd_block);
+			bh = lgfs2_bread(sdp, fwd_block);
 			bitmap_was_fnd = !lgfs2_check_meta(bh->b_data, GFS2_METATYPE_RB);
-			brelse(bh);
+			lgfs2_brelse(bh);
 			if (bitmap_was_fnd) /* if a bitmap */
 				calc_rgd->rt_length++;
 			else
@@ -1010,7 +1010,7 @@ int rindex_repair(struct gfs2_sbd *sdp, int trust_lvl, int *ok)
 		}
 		sdp->md.riinode->i_size /= sizeof(struct gfs2_rindex);
 		sdp->md.riinode->i_size *= sizeof(struct gfs2_rindex);
-		bmodified(sdp->md.riinode->i_bh);
+		lgfs2_bmodified(sdp->md.riinode->i_bh);
 		log_err(_("Changing rindex size to %"PRIu64".\n"), sdp->md.riinode->i_size);
 	}
 	log_warn(_("L%d: number of rgs expected     = %"PRIu64".\n"), trust_lvl + 1,
@@ -1207,7 +1207,7 @@ int rindex_repair(struct gfs2_sbd *sdp, int trust_lvl, int *ok)
 	if (sdp->md.riinode->i_bh->b_modified) {
 		log_debug("Syncing rindex inode changes to disk.\n");
 		lgfs2_dinode_out(sdp->md.riinode, sdp->md.riinode->i_bh->b_data);
-		bwrite(sdp->md.riinode->i_bh);
+		lgfs2_bwrite(sdp->md.riinode->i_bh);
 	}
 	return 0;
 }
diff --git a/gfs2/libgfs2/buf.c b/gfs2/libgfs2/buf.c
index cd5fba82..c2cb7461 100644
--- a/gfs2/libgfs2/buf.c
+++ b/gfs2/libgfs2/buf.c
@@ -22,7 +22,7 @@
   #endif
 #endif
 
-struct gfs2_buffer_head *bget(struct gfs2_sbd *sdp, uint64_t num)
+struct gfs2_buffer_head *lgfs2_bget(struct gfs2_sbd *sdp, uint64_t num)
 {
 	struct gfs2_buffer_head *bh;
 
@@ -38,8 +38,8 @@ struct gfs2_buffer_head *bget(struct gfs2_sbd *sdp, uint64_t num)
 	return bh;
 }
 
-int __breadm(struct gfs2_sbd *sdp, struct gfs2_buffer_head **bhs, size_t n,
-	     uint64_t block, int line, const char *caller)
+int __lgfs2_breadm(struct gfs2_sbd *sdp, struct gfs2_buffer_head **bhs, size_t n,
+                   uint64_t block, int line, const char *caller)
 {
 	size_t v = (n < IOV_MAX) ? n : IOV_MAX;
 	struct iovec *iov = alloca(v * sizeof(struct iovec));
@@ -52,7 +52,7 @@ int __breadm(struct gfs2_sbd *sdp, struct gfs2_buffer_head **bhs, size_t n,
 		ssize_t size = 0;
 
 		for (j = 0; (i + j < n) && (j < IOV_MAX); j++) {
-			bhs[i + j] = bget(sdp, block + i + j);
+			bhs[i + j] = lgfs2_bget(sdp, block + i + j);
 			if (bhs[i + j] == NULL)
 				return -1;
 			iov[j] = bhs[i + j]->iov;
@@ -71,13 +71,13 @@ int __breadm(struct gfs2_sbd *sdp, struct gfs2_buffer_head **bhs, size_t n,
 	return 0;
 }
 
-struct gfs2_buffer_head *__bread(struct gfs2_sbd *sdp, uint64_t num, int line,
+struct gfs2_buffer_head *__lgfs2_bread(struct gfs2_sbd *sdp, uint64_t num, int line,
 				 const char *caller)
 {
 	struct gfs2_buffer_head *bh;
 	ssize_t ret;
 
-	bh = bget(sdp, num);
+	bh = lgfs2_bget(sdp, num);
 	if (bh == NULL)
 		return NULL;
 
@@ -91,7 +91,7 @@ struct gfs2_buffer_head *__bread(struct gfs2_sbd *sdp, uint64_t num, int line,
 	return bh;
 }
 
-int bwrite(struct gfs2_buffer_head *bh)
+int lgfs2_bwrite(struct gfs2_buffer_head *bh)
 {
 	struct gfs2_sbd *sdp = bh->sdp;
 
@@ -101,14 +101,14 @@ int bwrite(struct gfs2_buffer_head *bh)
 	return 0;
 }
 
-int brelse(struct gfs2_buffer_head *bh)
+int lgfs2_brelse(struct gfs2_buffer_head *bh)
 {
 	int error = 0;
 
 	if (bh->b_blocknr == -1)
 		printf("Double free!\n");
 	if (bh->b_modified)
-		error = bwrite(bh);
+		error = lgfs2_bwrite(bh);
 	bh->b_blocknr = -1;
 	if (bh->b_altlist.next && !osi_list_empty(&bh->b_altlist))
 		osi_list_del(&bh->b_altlist);
diff --git a/gfs2/libgfs2/fs_ops.c b/gfs2/libgfs2/fs_ops.c
index 0b127e26..a79c2d2e 100644
--- a/gfs2/libgfs2/fs_ops.c
+++ b/gfs2/libgfs2/fs_ops.c
@@ -47,16 +47,16 @@ struct gfs2_inode *lgfs2_inode_get(struct gfs2_sbd *sdp, struct gfs2_buffer_head
 struct gfs2_inode *lgfs2_inode_read(struct gfs2_sbd *sdp, uint64_t di_addr)
 {
 	struct gfs2_inode *ip;
-	struct gfs2_buffer_head *bh = bread(sdp, di_addr);
+	struct gfs2_buffer_head *bh = lgfs2_bread(sdp, di_addr);
 	if (bh == NULL) {
 		return NULL;
 	}
 	ip = lgfs2_inode_get(sdp, bh);
 	if (ip == NULL) {
-		brelse(bh);
+		lgfs2_brelse(bh);
 		return NULL;
 	}
-	ip->bh_owned = 1; /* We did the bread so we own the bh */
+	ip->bh_owned = 1; /* We did the lgfs2_bread so we own the bh */
 	return ip;
 }
 
@@ -100,7 +100,7 @@ void inode_put(struct gfs2_inode **ip_in)
 				fprintf(stderr, "Warning: Changes made to inode were discarded.\n");
 		}
 		if (ip->bh_owned)
-			brelse(ip->i_bh);
+			lgfs2_brelse(ip->i_bh);
 		ip->i_bh = NULL;
 	}
 	free(ip);
@@ -206,7 +206,7 @@ int lgfs2_meta_alloc(struct gfs2_inode *ip, uint64_t *blkno)
 			      GFS2_BLKST_USED, blkno, 0);
 	if (ret == 0) {
 		ip->i_goal_meta = *blkno;
-		bmodified(ip->i_bh);
+		lgfs2_bmodified(ip->i_bh);
 	}
 	return ret;
 }
@@ -215,7 +215,7 @@ static __inline__ void buffer_clear_tail(struct gfs2_sbd *sdp,
 					 struct gfs2_buffer_head *bh, int head)
 {
 	memset(bh->b_data + head, 0, sdp->sd_bsize - head);
-	bmodified(bh);
+	lgfs2_bmodified(bh);
 }
 
 static __inline__ void
@@ -227,7 +227,7 @@ buffer_copy_tail(struct gfs2_sbd *sdp,
 	       sdp->sd_bsize - from_head);
 	memset(to_bh->b_data + sdp->sd_bsize + to_head - from_head, 0,
 	       from_head - to_head);
-	bmodified(to_bh);
+	lgfs2_bmodified(to_bh);
 }
 
 void unstuff_dinode(struct gfs2_inode *ip)
@@ -247,20 +247,20 @@ void unstuff_dinode(struct gfs2_inode *ip)
 				.mh_format = cpu_to_be32(GFS2_FORMAT_JD)
 			};
 
-			bh = bget(sdp, block);
+			bh = lgfs2_bget(sdp, block);
 			memcpy(bh->b_data, &mh, sizeof(mh));
 			buffer_copy_tail(sdp, bh,
 					 sizeof(struct gfs2_meta_header),
 					 ip->i_bh, sizeof(struct gfs2_dinode));
 
-			bmodified(bh);
-			brelse(bh);
+			lgfs2_bmodified(bh);
+			lgfs2_brelse(bh);
 		} else {
-			bh = bget(sdp, block);
+			bh = lgfs2_bget(sdp, block);
 
 			buffer_copy_tail(sdp, bh, 0,
 					 ip->i_bh, sizeof(struct gfs2_dinode));
-			brelse(bh);
+			lgfs2_brelse(bh);
 		}
 	}
 
@@ -268,7 +268,7 @@ void unstuff_dinode(struct gfs2_inode *ip)
 
 	if (ip->i_size) {
 		*(__be64 *)(ip->i_bh->b_data + sizeof(struct gfs2_dinode)) = cpu_to_be64(block);
-		/* no need: bmodified(ip->i_bh); buffer_clear_tail does it */
+		/* no need: lgfs2_bmodified(ip->i_bh); buffer_clear_tail does it */
 		ip->i_blocks++;
 	}
 
@@ -402,20 +402,20 @@ void build_height(struct gfs2_inode *ip, int height)
 
 			if (lgfs2_meta_alloc(ip, &block))
 				exit(1);
-			bh = bget(sdp, block);
+			bh = lgfs2_bget(sdp, block);
 			memcpy(bh->b_data, &mh, sizeof(mh));
 			buffer_copy_tail(sdp, bh,
 					 sizeof(struct gfs2_meta_header),
 					 ip->i_bh, sizeof(struct gfs2_dinode));
-			bmodified(bh);
-			brelse(bh);
+			lgfs2_bmodified(bh);
+			lgfs2_brelse(bh);
 		}
 
 		buffer_clear_tail(sdp, ip->i_bh, sizeof(struct gfs2_dinode));
 
 		if (new_block) {
 			*(__be64 *)(ip->i_bh->b_data + sizeof(struct gfs2_dinode)) = cpu_to_be64(block);
-			/* no need: bmodified(ip->i_bh);*/
+			/* no need: lgfs2_bmodified(ip->i_bh);*/
 			ip->i_blocks++;
 		}
 
@@ -454,9 +454,9 @@ void lookup_block(struct gfs2_inode *ip, struct gfs2_buffer_head *bh,
 	if (lgfs2_meta_alloc(ip, block))
 		return;
 	*ptr = cpu_to_be64(*block);
-	bmodified(bh);
+	lgfs2_bmodified(bh);
 	ip->i_blocks++;
-	bmodified(ip->i_bh);
+	lgfs2_bmodified(ip->i_bh);
 
 	*new = 1;
 }
@@ -505,7 +505,7 @@ void block_map(struct gfs2_inode *ip, uint64_t lblock, int *new,
 	for (x = 0; x < end_of_metadata; x++) {
 		lookup_block(ip, bh, x, &mp, create, new, dblock);
 		if (bh != ip->i_bh)
-			brelse(bh);
+			lgfs2_brelse(bh);
 		if (!*dblock)
 			return;
 
@@ -515,14 +515,14 @@ void block_map(struct gfs2_inode *ip, uint64_t lblock, int *new,
 				.mh_type = cpu_to_be32(GFS2_METATYPE_IN),
 				.mh_format = cpu_to_be32(GFS2_FORMAT_IN)
 			};
-			bh = bget(sdp, *dblock);
+			bh = lgfs2_bget(sdp, *dblock);
 			memcpy(bh->b_data, &mh, sizeof(mh));
-			bmodified(bh);
+			lgfs2_bmodified(bh);
 		} else {
 			if (*dblock == ip->i_num.in_addr)
 				bh = ip->i_bh;
 			else
-				bh = bread(sdp, *dblock);
+				bh = lgfs2_bread(sdp, *dblock);
 		}
 	}
 
@@ -552,7 +552,7 @@ void block_map(struct gfs2_inode *ip, uint64_t lblock, int *new,
 	}
 
 	if (bh != ip->i_bh)
-		brelse(bh);
+		lgfs2_brelse(bh);
 }
 
 static void
@@ -624,7 +624,7 @@ int gfs2_readi(struct gfs2_inode *ip, void *buf,
 			if (dblock == ip->i_num.in_addr)
 				bh = ip->i_bh;
 			else
-				bh = bread(sdp, dblock);
+				bh = lgfs2_bread(sdp, dblock);
 			dblock++;
 			extlen--;
 		} else
@@ -632,7 +632,7 @@ int gfs2_readi(struct gfs2_inode *ip, void *buf,
 
 		copy2mem(bh, &buf, o, amount);
 		if (bh && bh != ip->i_bh)
-			brelse(bh);
+			lgfs2_brelse(bh);
 
 		copied += amount;
 		lblock++;
@@ -652,7 +652,7 @@ static void copy_from_mem(struct gfs2_buffer_head *bh, void **buf,
 	char **p = (char **)buf;
 
 	memcpy(bh->b_data + offset, *p, size);
-	bmodified(bh);
+	lgfs2_bmodified(bh);
 	*p += size;
 }
 
@@ -702,7 +702,7 @@ int __gfs2_writei(struct gfs2_inode *ip, void *buf,
 		}
 
 		if (new) {
-			bh = bget(sdp, dblock);
+			bh = lgfs2_bget(sdp, dblock);
 			if (isdir) {
 				struct gfs2_meta_header mh = {
 					.mh_magic = cpu_to_be32(GFS2_MAGIC),
@@ -710,17 +710,17 @@ int __gfs2_writei(struct gfs2_inode *ip, void *buf,
 					.mh_format = cpu_to_be32(GFS2_FORMAT_JD),
 				};
 				memcpy(bh->b_data, &mh, sizeof(mh));
-				bmodified(bh);
+				lgfs2_bmodified(bh);
 			}
 		} else {
 			if (dblock == ip->i_num.in_addr)
 				bh = ip->i_bh;
 			else
-				bh = bread(sdp, dblock);
+				bh = lgfs2_bread(sdp, dblock);
 		}
 		copy_from_mem(bh, &buf, o, amount);
 		if (bh != ip->i_bh)
-			brelse(bh);
+			lgfs2_brelse(bh);
 
 		copied += amount;
 		lblock++;
@@ -731,7 +731,7 @@ int __gfs2_writei(struct gfs2_inode *ip, void *buf,
 	}
 
 	if (resize && ip->i_size < start + copied) {
-		bmodified(ip->i_bh);
+		lgfs2_bmodified(ip->i_bh);
 		ip->i_size = start + copied;
 	}
 
@@ -797,10 +797,10 @@ static int dirent_alloc(struct gfs2_inode *dip, struct gfs2_buffer_head *bh,
 	if (!entries) {
 		dent->de_rec_len = cpu_to_be16(dip->i_sbd->sd_bsize - offset);
 		dent->de_name_len = cpu_to_be16(name_len);
-		bmodified(bh);
+		lgfs2_bmodified(bh);
 		*dent_out = dent;
 		dip->i_entries++;
-		bmodified(dip->i_bh);
+		lgfs2_bmodified(dip->i_bh);
 		return 0;
 	}
 
@@ -828,18 +828,18 @@ static int dirent_alloc(struct gfs2_inode *dip, struct gfs2_buffer_head *bh,
 				dent->de_rec_len = cpu_to_be16(cur_rec_len - new_rec_len);
 
 				*dent_out = new;
-				bmodified(bh);
+				lgfs2_bmodified(bh);
 				dip->i_entries++;
-				bmodified(dip->i_bh);
+				lgfs2_bmodified(dip->i_bh);
 				return 0;
 			}
 
 			dent->de_name_len = cpu_to_be16(name_len);
 
 			*dent_out = dent;
-			bmodified(bh);
+			lgfs2_bmodified(bh);
 			dip->i_entries++;
-			bmodified(dip->i_bh);
+			lgfs2_bmodified(dip->i_bh);
 			return 0;
 		}
 	} while (gfs2_dirent_next(dip, bh, &dent) == 0);
@@ -853,7 +853,7 @@ void dirent2_del(struct gfs2_inode *dip, struct gfs2_buffer_head *bh,
 {
 	uint16_t cur_rec_len, prev_rec_len;
 
-	bmodified(bh);
+	lgfs2_bmodified(bh);
 	if (lgfs2_check_meta(bh->b_data, GFS2_METATYPE_LF) == 0) {
 		struct gfs2_leaf *lf = (struct gfs2_leaf *)bh->b_data;
 		uint16_t entries;
@@ -863,7 +863,7 @@ void dirent2_del(struct gfs2_inode *dip, struct gfs2_buffer_head *bh,
 	}
 
 	if (dip->i_entries) {
-		bmodified(dip->i_bh);
+		lgfs2_bmodified(dip->i_bh);
 		dip->i_entries--;
 	}
 	if (!prev) {
@@ -906,7 +906,7 @@ void dir_split_leaf(struct gfs2_inode *dip, uint32_t start, uint64_t leaf_no,
 
 	if (lgfs2_meta_alloc(dip, &bn))
 		exit(1);
-	nbh = bget(dip->i_sbd, bn);
+	nbh = lgfs2_bget(dip->i_sbd, bn);
 	{
 		struct gfs2_meta_header mh = {
 			.mh_magic = cpu_to_be32(GFS2_MAGIC),
@@ -914,7 +914,7 @@ void dir_split_leaf(struct gfs2_inode *dip, uint32_t start, uint64_t leaf_no,
 			.mh_format = cpu_to_be32(GFS2_FORMAT_LF)
 		};
 		memcpy(nbh->b_data, &mh, sizeof(mh));
-		bmodified(nbh);
+		lgfs2_bmodified(nbh);
 		buffer_clear_tail(dip->i_sbd, nbh,
 				  sizeof(struct gfs2_meta_header));
 	}
@@ -1004,11 +1004,11 @@ void dir_split_leaf(struct gfs2_inode *dip, uint32_t start, uint64_t leaf_no,
 
 	nleaf->lf_inode = cpu_to_be64(dip->i_num.in_addr);
 	dip->i_blocks++;
-	bmodified(dip->i_bh);
+	lgfs2_bmodified(dip->i_bh);
 
-	bmodified(obh); /* Need to do this in case nothing was moved */
-	bmodified(nbh);
-	brelse(nbh);
+	lgfs2_bmodified(obh); /* Need to do this in case nothing was moved */
+	lgfs2_bmodified(nbh);
+	lgfs2_brelse(nbh);
 }
 
 static void dir_double_exhash(struct gfs2_inode *dip)
@@ -1060,7 +1060,7 @@ static void dir_double_exhash(struct gfs2_inode *dip)
 	free(buf);
 
 	dip->i_depth++;
-	bmodified(dip->i_bh);
+	lgfs2_bmodified(dip->i_bh);
 }
 
 /**
@@ -1077,10 +1077,10 @@ int gfs2_get_leaf(struct gfs2_inode *dip, uint64_t leaf_no,
 {
 	int error = 0;
 
-	*bhp = bread(dip->i_sbd, leaf_no);
+	*bhp = lgfs2_bread(dip->i_sbd, leaf_no);
 	error = lgfs2_check_meta((*bhp)->b_data, GFS2_METATYPE_LF);
 	if(error)
-		brelse(*bhp);
+		lgfs2_brelse(*bhp);
 	return error;
 }
 
@@ -1099,7 +1099,7 @@ static int get_first_leaf(struct gfs2_inode *dip, uint32_t lindex, struct gfs2_b
 
 	if (lgfs2_get_leaf_ptr(dip, lindex, &leaf_no) != 0)
 		return -1;
-	*bh_out = bread(dip->i_sbd, leaf_no);
+	*bh_out = lgfs2_bread(dip->i_sbd, leaf_no);
 	if (*bh_out == NULL)
 		return -1;
 	return 0;
@@ -1126,12 +1126,12 @@ static int get_next_leaf(struct gfs2_inode *dip,struct gfs2_buffer_head *bh_in,
 	/* Check for a leaf that points to itself as "next" */
 	if (be64_to_cpu(leaf->lf_next) == bh_in->b_blocknr)
 		return -1;
-	*bh_out = bread(dip->i_sbd, be64_to_cpu(leaf->lf_next));
+	*bh_out = lgfs2_bread(dip->i_sbd, be64_to_cpu(leaf->lf_next));
 	if (*bh_out == NULL)
 		return -ENOENT;
 	/* Check for a leaf pointing to a non-leaf */
 	if (lgfs2_check_meta((*bh_out)->b_data, GFS2_METATYPE_LF)) {
-		brelse(*bh_out);
+		lgfs2_brelse(*bh_out);
 		*bh_out = NULL;
 		return -ENOENT;
 	}
@@ -1164,7 +1164,7 @@ restart:
 	for (;;) {
 		uint16_t entries;
 
-		bh = bread(dip->i_sbd, leaf_no);
+		bh = lgfs2_bread(dip->i_sbd, leaf_no);
 		leaf = (struct gfs2_leaf *)bh->b_data;
 
 		if (dirent_alloc(dip, bh, len, &dent)) {
@@ -1174,17 +1174,17 @@ restart:
 					     be16_to_cpu(leaf->lf_depth));
 				dir_split_leaf(dip, lindex & ~(llen - 1),
 					       leaf_no, bh);
-				brelse(bh);
+				lgfs2_brelse(bh);
 				goto restart;
 
 			} else if (dip->i_depth < GFS2_DIR_MAX_DEPTH) {
-				brelse(bh);
+				lgfs2_brelse(bh);
 				dir_double_exhash(dip);
 				goto restart;
 
 			} else if (leaf->lf_next) {
 				leaf_no = be64_to_cpu(leaf->lf_next);
-				brelse(bh);
+				lgfs2_brelse(bh);
 				continue;
 
 			} else {
@@ -1195,9 +1195,9 @@ restart:
 				};
 				if (lgfs2_meta_alloc(dip, &bn))
 					exit(1);
-				nbh = bget(dip->i_sbd, bn);
+				nbh = lgfs2_bget(dip->i_sbd, bn);
 				memcpy(nbh->b_data, &mh, sizeof(mh));
-				bmodified(nbh);
+				lgfs2_bmodified(nbh);
 
 				leaf->lf_next = cpu_to_be64(bn);
 
@@ -1209,9 +1209,9 @@ restart:
 				if (err)
 					return err;
 				dip->i_blocks++;
-				bmodified(dip->i_bh);
-				bmodified(bh);
-				brelse(bh);
+				lgfs2_bmodified(dip->i_bh);
+				lgfs2_bmodified(bh);
+				lgfs2_brelse(bh);
 				bh = nbh;
 				leaf = nleaf;
 			}
@@ -1225,8 +1225,8 @@ restart:
 		entries = be16_to_cpu(leaf->lf_entries) + 1;
 		leaf->lf_entries = cpu_to_be16(entries);
 
-		bmodified(bh);
-		brelse(bh);
+		lgfs2_bmodified(bh);
+		lgfs2_brelse(bh);
 		return err;
 	}
 }
@@ -1245,7 +1245,7 @@ static void dir_make_exhash(struct gfs2_inode *dip)
 
 	if (lgfs2_meta_alloc(dip, &bn))
 		exit(1);
-	bh = bget(sdp, bn);
+	bh = lgfs2_bget(sdp, bn);
 	{
 		struct gfs2_meta_header mh = {
 			.mh_magic = cpu_to_be32(GFS2_MAGIC),
@@ -1253,7 +1253,7 @@ static void dir_make_exhash(struct gfs2_inode *dip)
 			.mh_format = cpu_to_be32(GFS2_FORMAT_LF)
 		};
 		memcpy(bh->b_data, &mh, sizeof(mh));
-		bmodified(bh);
+		lgfs2_bmodified(bh);
 	}
 
 	leaf = (struct gfs2_leaf *)bh->b_data;
@@ -1277,8 +1277,8 @@ static void dir_make_exhash(struct gfs2_inode *dip)
 		sizeof(struct gfs2_dinode) - sizeof(struct gfs2_leaf);
 	dent->de_rec_len = cpu_to_be16(rec_len);
 
-	/* no need to: bmodified(bh); (buffer_copy_tail does it) */
-	brelse(bh);
+	/* no need to: lgfs2_bmodified(bh); (buffer_copy_tail does it) */
+	lgfs2_brelse(bh);
 
 	buffer_clear_tail(sdp, dip->i_bh, sizeof(struct gfs2_dinode));
 
@@ -1291,13 +1291,13 @@ static void dir_make_exhash(struct gfs2_inode *dip)
 	dip->i_blocks++;
 	dip->i_flags |= GFS2_DIF_EXHASH;
 	dip->i_payload_format = 0;
-	/* no need: bmodified(dip->i_bh); buffer_clear_tail does it. */
+	/* no need: lgfs2_bmodified(dip->i_bh); buffer_clear_tail does it. */
 
 	for (x = sdp->sd_hash_ptrs, y = -1; x; x >>= 1, y++) ;
 	dip->i_depth = y;
 
 	lgfs2_dinode_out(dip, dip->i_bh->b_data);
-	bwrite(dip->i_bh);
+	lgfs2_bwrite(dip->i_bh);
 }
 
 static int dir_l_add(struct gfs2_inode *dip, const char *filename, int len,
@@ -1318,7 +1318,7 @@ static int dir_l_add(struct gfs2_inode *dip, const char *filename, int len,
 	dent->de_hash = cpu_to_be32(de_hash);
 	dent->de_type = cpu_to_be16(type);
 	memcpy((char *)(dent + 1), filename, len);
-	bmodified(dip->i_bh);
+	lgfs2_bmodified(dip->i_bh);
 	return err;
 }
 
@@ -1350,7 +1350,7 @@ static int __init_dinode(struct gfs2_sbd *sdp, struct gfs2_buffer_head **bhp, st
 		return 1;
 
 	if (*bhp == NULL) {
-		*bhp = bget(sdp, inum->in_addr);
+		*bhp = lgfs2_bget(sdp, inum->in_addr);
 		if (*bhp == NULL)
 			return 1;
 	}
@@ -1407,7 +1407,7 @@ static int __init_dinode(struct gfs2_sbd *sdp, struct gfs2_buffer_head **bhp, st
 		di->di_payload_format = cpu_to_be32(GFS2_FORMAT_DE);
 		di->di_entries = cpu_to_be32(2);
 	}
-	bmodified(bh);
+	lgfs2_bmodified(bh);
 	return 0;
 }
 
@@ -1448,7 +1448,7 @@ int lgfs2_write_filemeta(struct gfs2_inode *ip)
 		.mh_type = cpu_to_be32(GFS2_METATYPE_IN),
 		.mh_format = cpu_to_be32(GFS2_FORMAT_IN)
 	};
-	struct gfs2_buffer_head *bh = bget(sdp, ip->i_num.in_addr);
+	struct gfs2_buffer_head *bh = lgfs2_bget(sdp, ip->i_num.in_addr);
 	if (bh == NULL)
 		return 1;
 
@@ -1475,7 +1475,7 @@ int lgfs2_write_filemeta(struct gfs2_inode *ip)
 				memcpy(bh->b_data, &mh, sizeof(mh));
 			}
 			lgfs2_fill_indir(start, bh->b_data + sdp->sd_bsize, ptr0, ptrs, &p);
-			if (bwrite(bh)) {
+			if (lgfs2_bwrite(bh)) {
 				free(bh);
 				return 1;
 			}
@@ -1521,7 +1521,7 @@ static struct gfs2_inode *__createi(struct gfs2_inode *dip,
 		else
 			is_dir = S_ISDIR(mode);
 		if (is_dir) {
-			bmodified(dip->i_bh);
+			lgfs2_bmodified(dip->i_bh);
 			dip->i_nlink++;
 		}
 
@@ -1532,7 +1532,7 @@ static struct gfs2_inode *__createi(struct gfs2_inode *dip,
 		ip = lgfs2_inode_get(sdp, bh);
 		if (ip == NULL)
 			return NULL;
-		bmodified(bh);
+		lgfs2_bmodified(bh);
 	}
 	ip->bh_owned = 1;
 	return ip;
@@ -1663,7 +1663,7 @@ static int linked_leaf_search(struct gfs2_inode *dip, const char *filename,
 	/*  Find the entry  */
 	do{
 		if (bh && bh != dip->i_bh)
-			brelse(bh);
+			lgfs2_brelse(bh);
 
 		bh = bh_next;
 
@@ -1678,7 +1678,7 @@ static int linked_leaf_search(struct gfs2_inode *dip, const char *filename,
 
 		default:
 			if (bh && bh != dip->i_bh)
-				brelse(bh);
+				lgfs2_brelse(bh);
 			return error;
 		}
 
@@ -1686,7 +1686,7 @@ static int linked_leaf_search(struct gfs2_inode *dip, const char *filename,
 	} while (!error && bh_next != NULL);
 
 	if (bh && bh != dip->i_bh)
-		brelse(bh);
+		lgfs2_brelse(bh);
 
 	return error;
 }
@@ -1714,7 +1714,7 @@ static int dir_e_search(struct gfs2_inode *dip, const char *filename,
 	if (type)
 		*type = be16_to_cpu(dent->de_type);
 
-	brelse(bh);
+	lgfs2_brelse(bh);
 
 	return 0;
 }
@@ -1792,15 +1792,15 @@ static int dir_e_del(struct gfs2_inode *dip, const char *filename, int len)
 			return error;
 
 		while(leaf_no && !found){
-			bh = bread(dip->i_sbd, leaf_no);
+			bh = lgfs2_bread(dip->i_sbd, leaf_no);
 			error = leaf_search(dip, bh, filename, len, &cur, &prev);
 			if (error) {
 				if(error != -ENOENT){
-					brelse(bh);
+					lgfs2_brelse(bh);
 					return -1;
 				}
 				leaf_no = be64_to_cpu(((struct gfs2_leaf *)bh->b_data)->lf_next);
-				brelse(bh);
+				lgfs2_brelse(bh);
 			} else
 				found = 1;
 		}
@@ -1811,7 +1811,7 @@ static int dir_e_del(struct gfs2_inode *dip, const char *filename, int len)
 
 	if (bh) {
 		dirent2_del(dip, bh, prev, cur);
-		brelse(bh);
+		lgfs2_brelse(bh);
 	}
 	return 0;
 }
@@ -1859,7 +1859,7 @@ int gfs2_dirent_del(struct gfs2_inode *dip, const char *filename, int len)
 		error = dir_e_del(dip, filename, len);
 	else
 		error = dir_l_del(dip, filename, len);
-	bmodified(dip->i_bh);
+	lgfs2_bmodified(dip->i_bh);
 	return error;
 }
 
@@ -1933,7 +1933,7 @@ int gfs2_freedi(struct gfs2_sbd *sdp, uint64_t diblock)
 	for (h = 0; h < GFS2_MAX_META_HEIGHT; h++)
 		osi_list_init(&metalist[h]);
 
-	bh = bread(sdp, diblock);
+	bh = lgfs2_bread(sdp, diblock);
 	if (bh == NULL)
 		return -1;
 	ip = lgfs2_inode_get(sdp, bh);
@@ -1962,9 +1962,9 @@ int gfs2_freedi(struct gfs2_sbd *sdp, uint64_t diblock)
 				if (h == height - 1) /* if not metadata */
 					continue; /* don't queue it up */
 				/* Read the next metadata block in the chain */
-				nbh = bread(sdp, block);
+				nbh = lgfs2_bread(sdp, block);
 				osi_list_add(&nbh->b_altlist, next_list);
-				brelse(nbh);
+				lgfs2_brelse(nbh);
 			}
 		}
 	}
diff --git a/gfs2/libgfs2/gfs1.c b/gfs2/libgfs2/gfs1.c
index 850d7217..79da01a4 100644
--- a/gfs2/libgfs2/gfs1.c
+++ b/gfs2/libgfs2/gfs1.c
@@ -60,9 +60,9 @@ void gfs1_lookup_block(struct gfs2_inode *ip, struct gfs2_buffer_head *bh,
 	}
 
 	*ptr = cpu_to_be64(*block);
-	bmodified(bh);
+	lgfs2_bmodified(bh);
 	ip->i_blocks++;
-	bmodified(ip->i_bh);
+	lgfs2_bmodified(ip->i_bh);
 
 	*new = 1;
 }
@@ -111,7 +111,7 @@ void gfs1_block_map(struct gfs2_inode *ip, uint64_t lblock, int *new,
 	for (x = 0; x < end_of_metadata; x++) {
 		gfs1_lookup_block(ip, bh, x, &mp, create, new, dblock);
 		if (bh != ip->i_bh)
-			brelse(bh);
+			lgfs2_brelse(bh);
 		if (!*dblock)
 			return;
 
@@ -121,14 +121,14 @@ void gfs1_block_map(struct gfs2_inode *ip, uint64_t lblock, int *new,
 				.mh_type = cpu_to_be32(GFS2_METATYPE_IN),
 				.mh_format = cpu_to_be32(GFS2_FORMAT_IN)
 			};
-			bh = bget(sdp, *dblock);
+			bh = lgfs2_bget(sdp, *dblock);
 			memcpy(bh->b_data, &mh, sizeof(mh));
-			bmodified(bh);
+			lgfs2_bmodified(bh);
 		} else {
 			if (*dblock == ip->i_num.in_addr)
 				bh = ip->i_bh;
 			else
-				bh = bread(sdp, *dblock);
+				bh = lgfs2_bread(sdp, *dblock);
 		}
 	}
 
@@ -160,7 +160,7 @@ void gfs1_block_map(struct gfs2_inode *ip, uint64_t lblock, int *new,
 	}
 
 	if (bh != ip->i_bh)
-		brelse(bh);
+		lgfs2_brelse(bh);
 }
 
 int gfs1_writei(struct gfs2_inode *ip, void *buf, uint64_t offset,
@@ -211,7 +211,7 @@ int gfs1_writei(struct gfs2_inode *ip, void *buf, uint64_t offset,
 		if (dblock == ip->i_num.in_addr)
 			bh = ip->i_bh;
 		else
-			bh = bread(sdp, dblock);
+			bh = lgfs2_bread(sdp, dblock);
 
 		if (journaled && dblock != ip->i_num.in_addr ) {
 			struct gfs2_meta_header mh = {
@@ -223,9 +223,9 @@ int gfs1_writei(struct gfs2_inode *ip, void *buf, uint64_t offset,
 		}
 
 		memcpy(bh->b_data + offset, (char *)buf + copied, amount);
-		bmodified(bh);
+		lgfs2_bmodified(bh);
 		if (bh != ip->i_bh)
-			brelse(bh);
+			lgfs2_brelse(bh);
 
 		copied += amount;
 		lblock++;
@@ -236,12 +236,12 @@ int gfs1_writei(struct gfs2_inode *ip, void *buf, uint64_t offset,
 	}
 
 	if (ip->i_size < start + copied) {
-		bmodified(ip->i_bh);
+		lgfs2_bmodified(ip->i_bh);
 		ip->i_size = start + copied;
 	}
 	ip->i_mtime = ip->i_ctime = time(NULL);
 	lgfs2_dinode_out(ip, ip->i_bh->b_data);
-	bmodified(ip->i_bh);
+	lgfs2_bmodified(ip->i_bh);
 	return copied;
 }
 
@@ -294,11 +294,11 @@ struct gfs2_inode *lgfs2_gfs_inode_read(struct gfs2_sbd *sdp, uint64_t di_addr)
 	struct gfs2_buffer_head *bh;
 	struct gfs2_inode *ip;
 
-	bh = bget(sdp, di_addr);
+	bh = lgfs2_bget(sdp, di_addr);
 	if (bh == NULL)
 		return NULL;
 	if (pread(sdp->device_fd, bh->b_data, sdp->sd_bsize, di_addr * sdp->sd_bsize) != sdp->sd_bsize) {
-		brelse(bh);
+		lgfs2_brelse(bh);
 		return NULL;
 	}
 	ip = __gfs_inode_get(sdp, bh->b_data);
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index 6aa97053..05a90900 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -458,18 +458,18 @@ extern int lgfs2_field_str(char *str, const size_t size, const char *blk, const
 extern int lgfs2_field_assign(char *blk, const struct lgfs2_metafield *field, const void *val);
 
 /* buf.c */
-extern struct gfs2_buffer_head *bget(struct gfs2_sbd *sdp, uint64_t num);
-extern struct gfs2_buffer_head *__bread(struct gfs2_sbd *sdp, uint64_t num,
+extern struct gfs2_buffer_head *lgfs2_bget(struct gfs2_sbd *sdp, uint64_t num);
+extern struct gfs2_buffer_head *__lgfs2_bread(struct gfs2_sbd *sdp, uint64_t num,
 					int line, const char *caller);
-extern int __breadm(struct gfs2_sbd *sdp, struct gfs2_buffer_head **bhs, size_t n, uint64_t block, int line, const char *caller);
-extern int bwrite(struct gfs2_buffer_head *bh);
-extern int brelse(struct gfs2_buffer_head *bh);
+extern int __lgfs2_breadm(struct gfs2_sbd *sdp, struct gfs2_buffer_head **bhs, size_t n, uint64_t block, int line, const char *caller);
+extern int lgfs2_bwrite(struct gfs2_buffer_head *bh);
+extern int lgfs2_brelse(struct gfs2_buffer_head *bh);
 extern uint32_t lgfs2_get_block_type(const char *buf);
 
-#define bmodified(bh) do { bh->b_modified = 1; } while(0)
+#define lgfs2_bmodified(bh) do { bh->b_modified = 1; } while(0)
 
-#define bread(bl, num) __bread(bl, num, __LINE__, __FUNCTION__)
-#define breadm(bl, bhs, n, block) __breadm(bl, bhs, n, block, __LINE__, __FUNCTION__)
+#define lgfs2_bread(bl, num) __lgfs2_bread(bl, num, __LINE__, __FUNCTION__)
+#define lgfs2_breadm(bl, bhs, n, block) __lgfs2_breadm(bl, bhs, n, block, __LINE__, __FUNCTION__)
 
 /* device_geometry.c */
 extern int lgfs2_get_dev_info(int fd, struct lgfs2_dev_info *i);
diff --git a/gfs2/libgfs2/recovery.c b/gfs2/libgfs2/recovery.c
index f4cea511..2edfe120 100644
--- a/gfs2/libgfs2/recovery.c
+++ b/gfs2/libgfs2/recovery.c
@@ -32,7 +32,7 @@ int gfs2_replay_read_block(struct gfs2_inode *ip, unsigned int blk,
 	if (!dblock)
 		return -EIO;
 
-	*bh = bread(ip->i_sbd, dblock);
+	*bh = lgfs2_bread(ip->i_sbd, dblock);
 	return 0;
 }
 
@@ -88,7 +88,7 @@ int lgfs2_get_log_header(struct gfs2_inode *ip, unsigned int blk,
 	tmp->lh_hash = saved_hash;
 	crc = lgfs2_log_header_crc(bh->b_data, ip->i_sbd->sd_bsize);
 	log_header_in(&lh, bh->b_data);
-	brelse(bh);
+	lgfs2_brelse(bh);
 	lh_crc = lh.lh_crc;
 	if (error || lh.lh_blkno != blk || lh.lh_hash != hash)
 		return 1;
@@ -245,7 +245,7 @@ int lgfs2_clean_journal(struct gfs2_inode *ip, struct lgfs2_log_header *head)
 	if (!dblock)
 		return -EIO;
 
-	bh = bread(ip->i_sbd, dblock);
+	bh = lgfs2_bread(ip->i_sbd, dblock);
 	memset(bh->b_data, 0, ip->i_sbd->sd_bsize);
 
 	lh = (struct gfs2_log_header *)bh->b_data;
@@ -258,8 +258,8 @@ int lgfs2_clean_journal(struct gfs2_inode *ip, struct lgfs2_log_header *head)
 	lh->lh_blkno = cpu_to_be32(lblock);
 	hash = lgfs2_log_header_hash(bh->b_data);
 	lh->lh_hash = cpu_to_be32(hash);
-	bmodified(bh);
-	brelse(bh);
+	lgfs2_bmodified(bh);
+	lgfs2_brelse(bh);
 
 	return 0;
 }
diff --git a/gfs2/libgfs2/structures.c b/gfs2/libgfs2/structures.c
index 4029df43..3bf876ea 100644
--- a/gfs2/libgfs2/structures.c
+++ b/gfs2/libgfs2/structures.c
@@ -166,13 +166,13 @@ static struct gfs2_buffer_head *lgfs2_get_file_buf(struct gfs2_inode *ip, uint64
 
 	if (!prealloc && new &&
 	    ip->i_size < (lbn + 1) << sdp->sd_bsize_shift) {
-		bmodified(ip->i_bh);
+		lgfs2_bmodified(ip->i_bh);
 		ip->i_size = (lbn + 1) << sdp->sd_bsize_shift;
 	}
 	if (dbn == ip->i_num.in_addr)
 		return ip->i_bh;
 	else
-		return bread(sdp, dbn);
+		return lgfs2_bread(sdp, dbn);
 }
 
 int lgfs2_write_journal(struct gfs2_inode *jnl, unsigned bsize, unsigned int blocks)
@@ -192,8 +192,8 @@ int lgfs2_write_journal(struct gfs2_inode *jnl, unsigned bsize, unsigned int blo
 		struct gfs2_buffer_head *bh = lgfs2_get_file_buf(jnl, x, 1);
 		if (!bh)
 			return -1;
-		bmodified(bh);
-		brelse(bh);
+		lgfs2_bmodified(bh);
+		lgfs2_brelse(bh);
 	}
 	crc32c_optimization_init();
 	for (x = 0; x < blocks; x++) {
@@ -217,8 +217,8 @@ int lgfs2_write_journal(struct gfs2_inode *jnl, unsigned bsize, unsigned int blo
 
 		hash = lgfs2_log_header_crc(bh->b_data, bsize);
 		lh->lh_crc = cpu_to_be32(hash);
-		bmodified(bh);
-		brelse(bh);
+		lgfs2_bmodified(bh);
+		lgfs2_brelse(bh);
 
 		if (++seq == blocks)
 			seq = 0;
@@ -291,7 +291,7 @@ struct gfs2_inode *lgfs2_build_inum_range(struct gfs2_inode *per_node, unsigned
 
 	ip->i_size = sizeof(struct gfs2_inum_range);
 	lgfs2_dinode_out(ip, ip->i_bh->b_data);
-	bmodified(ip->i_bh);
+	lgfs2_bmodified(ip->i_bh);
 	return ip;
 }
 
@@ -308,7 +308,7 @@ struct gfs2_inode *lgfs2_build_statfs_change(struct gfs2_inode *per_node, unsign
 
 	ip->i_size = sizeof(struct gfs2_statfs_change);
 	lgfs2_dinode_out(ip, ip->i_bh->b_data);
-	bmodified(ip->i_bh);
+	lgfs2_bmodified(ip->i_bh);
 	return ip;
 }
 
@@ -343,8 +343,8 @@ struct gfs2_inode *lgfs2_build_quota_change(struct gfs2_inode *per_node, unsigne
 
 		memset(bh->b_data, 0, sdp->sd_bsize);
 		memcpy(bh->b_data, &mh, sizeof(mh));
-		bmodified(bh);
-		brelse(bh);
+		lgfs2_bmodified(bh);
+		lgfs2_brelse(bh);
 	}
 	return ip;
 }
@@ -381,7 +381,7 @@ struct gfs2_inode *lgfs2_build_rindex(struct gfs2_sbd *sdp)
 		return NULL;
 
 	ip->i_payload_format = GFS2_FORMAT_RI;
-	bmodified(ip->i_bh);
+	lgfs2_bmodified(ip->i_bh);
 
 	for (n = osi_first(&sdp->rgtree); n; n = next) {
 		next = osi_next(n);
@@ -413,7 +413,7 @@ struct gfs2_inode *lgfs2_build_quota(struct gfs2_sbd *sdp)
 		return NULL;
 
 	ip->i_payload_format = GFS2_FORMAT_QU;
-	bmodified(ip->i_bh);
+	lgfs2_bmodified(ip->i_bh);
 
 	memset(&qu, 0, sizeof(struct gfs2_quota));
 	qu.qu_value = cpu_to_be64(1);
diff --git a/gfs2/libgfs2/super.c b/gfs2/libgfs2/super.c
index 8dfeee57..119f1cd0 100644
--- a/gfs2/libgfs2/super.c
+++ b/gfs2/libgfs2/super.c
@@ -65,18 +65,18 @@ int read_sb(struct gfs2_sbd *sdp)
 	unsigned int x;
 	int ret;
 
-	bh = bread(sdp, GFS2_SB_ADDR >> sdp->sd_fsb2bb_shift);
+	bh = lgfs2_bread(sdp, GFS2_SB_ADDR >> sdp->sd_fsb2bb_shift);
 
 	ret = check_sb(bh->b_data);
 	if (ret < 0) {
-		brelse(bh);
+		lgfs2_brelse(bh);
 		return ret;
 	}
 	if (ret == 1)
 		sdp->gfs1 = 1;
 
 	lgfs2_sb_in(sdp, bh->b_data);
-	brelse(bh);
+	lgfs2_brelse(bh);
 	sdp->sd_fsb2bb_shift = sdp->sd_bsize_shift - GFS2_BASIC_BLOCK_SHIFT;
 	if (sdp->sd_bsize < 512 || sdp->sd_bsize != (sdp->sd_bsize & -sdp->sd_bsize)) {
 		return -1;
@@ -184,9 +184,9 @@ static int good_on_disk(struct gfs2_sbd *sdp, struct rgrp_tree *rgd)
 	struct gfs2_buffer_head *bh;
 	int is_rgrp;
 
-	bh = bread(sdp, rgd->rt_addr);
+	bh = lgfs2_bread(sdp, rgd->rt_addr);
 	is_rgrp = (lgfs2_check_meta(bh->b_data, GFS2_METATYPE_RG) == 0);
-	brelse(bh);
+	lgfs2_brelse(bh);
 	return is_rgrp;
 }
 
-- 
2.34.1

