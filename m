Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E492216C43
	for <lists+cluster-devel@lfdr.de>; Tue,  7 May 2019 22:32:27 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 93F1730992B8;
	Tue,  7 May 2019 20:32:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 80B22173D5;
	Tue,  7 May 2019 20:32:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 626A241F3D;
	Tue,  7 May 2019 20:32:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x47KWOWY018897 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 7 May 2019 16:32:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4EB5218EE2; Tue,  7 May 2019 20:32:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.205.80])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 21A9817CC3;
	Tue,  7 May 2019 20:32:22 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Tue,  7 May 2019 22:32:03 +0200
Message-Id: <20190507203204.26008-11-agruenba@redhat.com>
In-Reply-To: <20190507203204.26008-1-agruenba@redhat.com>
References: <20190507203204.26008-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 11/12] gfs2: Fix iomap write page
	reclaim deadlock
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Tue, 07 May 2019 20:32:26 +0000 (UTC)

Since commit 64bc06bb32ee ("gfs2: iomap buffered write support"), gfs2 is doing
buffered writes by starting a transaction in iomap_begin, writing a range of
pages, and ending that transaction in iomap_end.  This approach suffers from
two problems:

  (1) Any allocations necessary for the write are done in iomap_begin, so when
  the data aren't journaled, there is no need for keeping the transaction open
  until iomap_end.

  (2) Transactions keep the gfs2 log flush lock held.  When
  iomap_file_buffered_write calls balance_dirty_pages, this can end up calling
  gfs2_write_inode, which will try to flush the log.  This requires taking the
  log flush lock which is already held, resulting in a deadlock.

Fix both of these issues by not keeping transactions open from iomap_begin to
iomap_end.  Instead, start a small transaction in page_prepare and end it in
page_done when necessary.

Reported-by: Edwin Török <edvin.torok@citrix.com>
Fixes: 64bc06bb32ee ("gfs2: iomap buffered write support")
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/aops.c | 14 +++++---
 fs/gfs2/bmap.c | 88 +++++++++++++++++++++++++++-----------------------
 2 files changed, 58 insertions(+), 44 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index 05dd78f4b2b3..6210d4429d84 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -649,7 +649,7 @@ static int gfs2_readpages(struct file *file, struct address_space *mapping,
  */
 void adjust_fs_space(struct inode *inode)
 {
-	struct gfs2_sbd *sdp = inode->i_sb->s_fs_info;
+	struct gfs2_sbd *sdp = GFS2_SB(inode);
 	struct gfs2_inode *m_ip = GFS2_I(sdp->sd_statfs_inode);
 	struct gfs2_inode *l_ip = GFS2_I(sdp->sd_sc_inode);
 	struct gfs2_statfs_change_host *m_sc = &sdp->sd_statfs_master;
@@ -657,10 +657,13 @@ void adjust_fs_space(struct inode *inode)
 	struct buffer_head *m_bh, *l_bh;
 	u64 fs_total, new_free;
 
+	if (gfs2_trans_begin(sdp, 2 * RES_STATFS, 0) != 0)
+		return;
+
 	/* Total up the file system space, according to the latest rindex. */
 	fs_total = gfs2_ri_total(sdp);
 	if (gfs2_meta_inode_buffer(m_ip, &m_bh) != 0)
-		return;
+		goto out;
 
 	spin_lock(&sdp->sd_statfs_spin);
 	gfs2_statfs_change_in(m_sc, m_bh->b_data +
@@ -675,11 +678,14 @@ void adjust_fs_space(struct inode *inode)
 	gfs2_statfs_change(sdp, new_free, new_free, 0);
 
 	if (gfs2_meta_inode_buffer(l_ip, &l_bh) != 0)
-		goto out;
+		goto out2;
 	update_statfs(sdp, m_bh, l_bh);
 	brelse(l_bh);
-out:
+out2:
 	brelse(m_bh);
+out:
+	sdp->sd_rindex_uptodate = 0;
+	gfs2_trans_end(sdp);
 }
 
 /**
diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index aa014725f84a..27c82f4aaf32 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -991,17 +991,28 @@ static void gfs2_write_unlock(struct inode *inode)
 	gfs2_glock_dq_uninit(&ip->i_gh);
 }
 
+static int gfs2_iomap_page_prepare(struct inode *inode, loff_t pos,
+				   unsigned len, struct iomap *iomap)
+{
+	struct gfs2_sbd *sdp = GFS2_SB(inode);
+
+	return gfs2_trans_begin(sdp, RES_DINODE + (len >> inode->i_blkbits), 0);
+}
+
 static void gfs2_iomap_page_done(struct inode *inode, loff_t pos,
 				 unsigned copied, struct page *page,
 				 struct iomap *iomap)
 {
 	struct gfs2_inode *ip = GFS2_I(inode);
+	struct gfs2_sbd *sdp = GFS2_SB(inode);
 
-	if (page)
+	if (page && !gfs2_is_stuffed(ip))
 		gfs2_page_add_databufs(ip, page, offset_in_page(pos), copied);
+	gfs2_trans_end(sdp);
 }
 
 static const struct iomap_page_ops gfs2_iomap_page_ops = {
+	.page_prepare = gfs2_iomap_page_prepare,
 	.page_done = gfs2_iomap_page_done,
 };
 
@@ -1057,31 +1068,45 @@ static int gfs2_iomap_begin_write(struct inode *inode, loff_t pos,
 	if (alloc_required)
 		rblocks += gfs2_rg_blocks(ip, data_blocks + ind_blocks);
 
-	ret = gfs2_trans_begin(sdp, rblocks, iomap->length >> inode->i_blkbits);
-	if (ret)
-		goto out_trans_fail;
+	if (unstuff || iomap->type == IOMAP_HOLE) {
+		struct gfs2_trans *tr;
 
-	if (unstuff) {
-		ret = gfs2_unstuff_dinode(ip, NULL);
+		ret = gfs2_trans_begin(sdp, rblocks,
+				       iomap->length >> inode->i_blkbits);
 		if (ret)
-			goto out_trans_end;
-		release_metapath(mp);
-		ret = gfs2_iomap_get(inode, iomap->offset, iomap->length,
-				     flags, iomap, mp);
-		if (ret)
-			goto out_trans_end;
-	}
+			goto out_trans_fail;
 
-	if (iomap->type == IOMAP_HOLE) {
-		ret = gfs2_iomap_alloc(inode, iomap, flags, mp);
-		if (ret) {
-			gfs2_trans_end(sdp);
-			gfs2_inplace_release(ip);
-			punch_hole(ip, iomap->offset, iomap->length);
-			goto out_qunlock;
+		if (unstuff) {
+			ret = gfs2_unstuff_dinode(ip, NULL);
+			if (ret)
+				goto out_trans_end;
+			release_metapath(mp);
+			ret = gfs2_iomap_get(inode, iomap->offset,
+					     iomap->length, flags, iomap, mp);
+			if (ret)
+				goto out_trans_end;
+		}
+
+		if (iomap->type == IOMAP_HOLE) {
+			ret = gfs2_iomap_alloc(inode, iomap, flags, mp);
+			if (ret) {
+				gfs2_trans_end(sdp);
+				gfs2_inplace_release(ip);
+				punch_hole(ip, iomap->offset, iomap->length);
+				goto out_qunlock;
+			}
 		}
+
+		tr = current->journal_info;
+		if (tr->tr_num_buf_new)
+			__mark_inode_dirty(inode, I_DIRTY_DATASYNC);
+		else
+			gfs2_trans_add_meta(ip->i_gl, mp->mp_bh[0]);
+
+		gfs2_trans_end(sdp);
 	}
-	if (!gfs2_is_stuffed(ip) && gfs2_is_jdata(ip))
+
+	if (gfs2_is_stuffed(ip) || gfs2_is_jdata(ip))
 		iomap->page_ops = &gfs2_iomap_page_ops;
 	return 0;
 
@@ -1121,10 +1146,6 @@ static int gfs2_iomap_begin(struct inode *inode, loff_t pos, loff_t length,
 		    iomap->type != IOMAP_MAPPED)
 			ret = -ENOTBLK;
 	}
-	if (!ret) {
-		get_bh(mp.mp_bh[0]);
-		iomap->private = mp.mp_bh[0];
-	}
 	release_metapath(&mp);
 	trace_gfs2_iomap_end(ip, iomap, ret);
 	return ret;
@@ -1135,27 +1156,16 @@ static int gfs2_iomap_end(struct inode *inode, loff_t pos, loff_t length,
 {
 	struct gfs2_inode *ip = GFS2_I(inode);
 	struct gfs2_sbd *sdp = GFS2_SB(inode);
-	struct gfs2_trans *tr = current->journal_info;
-	struct buffer_head *dibh = iomap->private;
 
 	if ((flags & (IOMAP_WRITE | IOMAP_DIRECT)) != IOMAP_WRITE)
 		goto out;
 
-	if (iomap->type != IOMAP_INLINE) {
+	if (!gfs2_is_stuffed(ip))
 		gfs2_ordered_add_inode(ip);
 
-		if (tr->tr_num_buf_new)
-			__mark_inode_dirty(inode, I_DIRTY_DATASYNC);
-		else
-			gfs2_trans_add_meta(ip->i_gl, dibh);
-	}
-
-	if (inode == sdp->sd_rindex) {
+	if (inode == sdp->sd_rindex)
 		adjust_fs_space(inode);
-		sdp->sd_rindex_uptodate = 0;
-	}
 
-	gfs2_trans_end(sdp);
 	gfs2_inplace_release(ip);
 
 	if (length != written && (iomap->flags & IOMAP_F_NEW)) {
@@ -1175,8 +1185,6 @@ static int gfs2_iomap_end(struct inode *inode, loff_t pos, loff_t length,
 	gfs2_write_unlock(inode);
 
 out:
-	if (dibh)
-		brelse(dibh);
 	return 0;
 }
 
-- 
2.20.1

