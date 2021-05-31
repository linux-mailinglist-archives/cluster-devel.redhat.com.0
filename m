Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9D1B539664E
	for <lists+cluster-devel@lfdr.de>; Mon, 31 May 2021 19:01:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622480514;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZuCk8XxraBJqNOYV7fJvU8W8Idg517HlOMNk0BW//Tc=;
	b=eZB/0Cd4m3LjyJ7cuk99PH6OIeA56jGPofduf/fQoxMNFxWORgaJZ1dvelhVcEdRYS5m3d
	2J/yufE3OzFGigeIroBLF1uNWiwiT+S7I8HugKexL5lqZA60rR6R5/17u8o3P0dyhDMnOQ
	dkD6aVEZ46k8Kk8z2gVgJS7Shs20n4w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-tyetiGArPfG9t1CHSxKH8g-1; Mon, 31 May 2021 13:01:52 -0400
X-MC-Unique: tyetiGArPfG9t1CHSxKH8g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47E978049CD;
	Mon, 31 May 2021 17:01:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 368702BFDE;
	Mon, 31 May 2021 17:01:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 261771801029;
	Mon, 31 May 2021 17:01:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14VH1oCb019140 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 31 May 2021 13:01:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 238FB2BFDE; Mon, 31 May 2021 17:01:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.192.80])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 277B56062C;
	Mon, 31 May 2021 17:01:42 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 31 May 2021 19:01:20 +0200
Message-Id: <20210531170123.243771-7-agruenba@redhat.com>
In-Reply-To: <20210531170123.243771-1-agruenba@redhat.com>
References: <20210531170123.243771-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [Cluster-devel] [RFC 6/9] gfs2: Add wrappers for accessing
	journal_info
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

No longer access current->journal_info directly.  The next patch will
change the wrappers to encode additional information in the lower bits
of current->journal_info.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/aops.c    |  6 +++---
 fs/gfs2/bmap.c    | 28 ++++++++++++++--------------
 fs/gfs2/incore.h  | 10 ++++++++++
 fs/gfs2/inode.c   |  2 +-
 fs/gfs2/log.c     |  4 ++--
 fs/gfs2/lops.c    |  2 +-
 fs/gfs2/meta_io.c |  6 +++---
 fs/gfs2/super.c   |  2 +-
 fs/gfs2/trans.c   | 16 ++++++++--------
 9 files changed, 43 insertions(+), 33 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index 23b5be3db044..50dd1771d00c 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -95,7 +95,7 @@ static int gfs2_writepage(struct page *page, struct writeback_control *wbc)
 
 	if (gfs2_assert_withdraw(sdp, gfs2_glock_is_held_excl(ip->i_gl)))
 		goto out;
-	if (current->journal_info)
+	if (current_trans())
 		goto redirty;
 	return iomap_writepage(page, wbc, &wpc, &gfs2_writeback_ops);
 
@@ -182,7 +182,7 @@ static int gfs2_jdata_writepage(struct page *page, struct writeback_control *wbc
 
 	if (gfs2_assert_withdraw(sdp, gfs2_glock_is_held_excl(ip->i_gl)))
 		goto out;
-	if (PageChecked(page) || current->journal_info)
+	if (PageChecked(page) || current_trans())
 		goto out_ignore;
 	return __gfs2_jdata_writepage(page, wbc);
 
@@ -620,7 +620,7 @@ void adjust_fs_space(struct inode *inode)
  
 static int jdata_set_page_dirty(struct page *page)
 {
-	if (current->journal_info)
+	if (current_trans())
 		SetPageChecked(page);
 	return __set_page_dirty_buffers(page);
 }
diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 0bcf11a9987b..2ff501c413f4 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -1016,7 +1016,7 @@ static void gfs2_iomap_page_done(struct inode *inode, loff_t pos,
 				 unsigned copied, struct page *page,
 				 struct iomap *iomap)
 {
-	struct gfs2_trans *tr = current->journal_info;
+	struct gfs2_trans *tr = current_trans();
 	struct gfs2_inode *ip = GFS2_I(inode);
 	struct gfs2_sbd *sdp = GFS2_SB(inode);
 
@@ -1099,7 +1099,7 @@ static int gfs2_iomap_begin_write(struct inode *inode, loff_t pos,
 			}
 		}
 
-		tr = current->journal_info;
+		tr = current_trans();
 		if (tr->tr_num_buf_new)
 			__mark_inode_dirty(inode, I_DIRTY_DATASYNC);
 
@@ -1347,7 +1347,7 @@ int gfs2_alloc_extent(struct inode *inode, u64 lblock, u64 *dblock,
 static int gfs2_block_zero_range(struct inode *inode, loff_t from,
 				 unsigned int length)
 {
-	BUG_ON(current->journal_info);
+	BUG_ON(current_trans());
 	return iomap_zero_range(inode, from, length, NULL, &gfs2_iomap_ops);
 }
 
@@ -1386,7 +1386,7 @@ static int gfs2_journaled_truncate(struct inode *inode, u64 oldsize, u64 newsize
 		truncate_pagecache(inode, oldsize - chunk);
 		oldsize -= chunk;
 
-		tr = current->journal_info;
+		tr = current_trans();
 		if (!test_bit(TR_TOUCHED, &tr->tr_flags))
 			continue;
 
@@ -1447,7 +1447,7 @@ static int trunc_start(struct inode *inode, u64 newsize)
 
 out:
 	brelse(dibh);
-	if (current->journal_info)
+	if (current_trans())
 		gfs2_trans_end(sdp);
 	return error;
 }
@@ -1555,7 +1555,7 @@ static int sweep_bh_for_rgrps(struct gfs2_inode *ip, struct gfs2_holder *rd_gh,
 		   the rgrp. So we estimate. We know it can't be more than
 		   the dinode's i_blocks and we don't want to exceed the
 		   journal flush threshold, sd_log_thresh2. */
-		if (current->journal_info == NULL) {
+		if (!current_trans()) {
 			unsigned int jblocks_rqsted, revokes;
 
 			jblocks_rqsted = rgd->rd_length + RES_DINODE +
@@ -1577,7 +1577,7 @@ static int sweep_bh_for_rgrps(struct gfs2_inode *ip, struct gfs2_holder *rd_gh,
 			down_write(&ip->i_rw_mutex);
 		}
 		/* check if we will exceed the transaction blocks requested */
-		tr = current->journal_info;
+		tr = current_trans();
 		if (tr->tr_num_buf_new + RES_STATFS +
 		    RES_QUOTA >= atomic_read(&sdp->sd_log_thresh2)) {
 			/* We set blks_outside_rgrp to ensure the loop will
@@ -1625,7 +1625,7 @@ static int sweep_bh_for_rgrps(struct gfs2_inode *ip, struct gfs2_holder *rd_gh,
 	if (!ret && blks_outside_rgrp) { /* If buffer still has non-zero blocks
 					    outside the rgrp we just processed,
 					    do it all over again. */
-		if (current->journal_info) {
+		if (current_trans()) {
 			struct buffer_head *dibh;
 
 			ret = gfs2_meta_inode_buffer(ip, &dibh);
@@ -1991,7 +1991,7 @@ static int punch_hole(struct gfs2_inode *ip, u64 offset, u64 length)
 	}
 
 	if (btotal) {
-		if (current->journal_info == NULL) {
+		if (!current_trans()) {
 			ret = gfs2_trans_begin(sdp, RES_DINODE + RES_STATFS +
 					       RES_QUOTA, 0);
 			if (ret)
@@ -2011,7 +2011,7 @@ static int punch_hole(struct gfs2_inode *ip, u64 offset, u64 length)
 out:
 	if (gfs2_holder_initialized(&rd_gh))
 		gfs2_glock_dq_uninit(&rd_gh);
-	if (current->journal_info) {
+	if (current_trans()) {
 		up_write(&ip->i_rw_mutex);
 		gfs2_trans_end(sdp);
 		cond_resched();
@@ -2436,7 +2436,7 @@ static int gfs2_journaled_truncate_range(struct inode *inode, loff_t offset,
 		offset += chunk;
 		length -= chunk;
 
-		tr = current->journal_info;
+		tr = current_trans();
 		if (!test_bit(TR_TOUCHED, &tr->tr_flags))
 			continue;
 
@@ -2501,7 +2501,7 @@ int __gfs2_punch_hole(struct file *file, loff_t offset, loff_t length)
 	}
 
 	if (gfs2_is_jdata(ip)) {
-		BUG_ON(!current->journal_info);
+		BUG_ON(!current_trans());
 		gfs2_journaled_truncate_range(inode, offset, length);
 	} else
 		truncate_pagecache_range(inode, offset, offset + length - 1);
@@ -2509,14 +2509,14 @@ int __gfs2_punch_hole(struct file *file, loff_t offset, loff_t length)
 	file_update_time(file);
 	mark_inode_dirty(inode);
 
-	if (current->journal_info)
+	if (current_trans())
 		gfs2_trans_end(sdp);
 
 	if (!gfs2_is_stuffed(ip))
 		error = punch_hole(ip, offset, length);
 
 out:
-	if (current->journal_info)
+	if (current_trans())
 		gfs2_trans_end(sdp);
 	return error;
 }
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index e6f820f146cb..aa8d1a23132d 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -871,5 +871,15 @@ static inline unsigned gfs2_max_stuffed_size(const struct gfs2_inode *ip)
 	return GFS2_SB(&ip->i_inode)->sd_sb.sb_bsize - sizeof(struct gfs2_dinode);
 }
 
+static inline struct gfs2_trans *current_trans(void)
+{
+	return current->journal_info;
+}
+
+static inline void set_current_trans(struct gfs2_trans *tr)
+{
+	current->journal_info = tr;
+}
+
 #endif /* __INCORE_DOT_H__ */
 
diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index 6e15434b23ac..1b94cbdc00cc 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -1883,7 +1883,7 @@ static int gfs2_setattr_simple(struct inode *inode, struct iattr *attr)
 {
 	int error;
 
-	if (current->journal_info)
+	if (current_trans())
 		return __gfs2_setattr_simple(inode, attr);
 
 	error = gfs2_trans_begin(GFS2_SB(inode), RES_DINODE, 0);
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 42c15cfc0821..3ee29045ab90 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -204,7 +204,7 @@ void gfs2_ail1_flush(struct gfs2_sbd *sdp, struct writeback_control *wbc)
 	ret = 0;
 	if (time_after(jiffies, flush_start + (HZ * 600))) {
 		fs_err(sdp, "Error: In %s for ten minutes! t=%d\n",
-		       __func__, current->journal_info ? 1 : 0);
+		       __func__, current_trans() ? 1 : 0);
 		dump_ail_list(sdp);
 		goto out;
 	}
@@ -971,7 +971,7 @@ static void empty_ail1_list(struct gfs2_sbd *sdp)
 	for (;;) {
 		if (time_after(jiffies, start + (HZ * 600))) {
 			fs_err(sdp, "Error: In %s for 10 minutes! t=%d\n",
-			       __func__, current->journal_info ? 1 : 0);
+			       __func__, current_trans() ? 1 : 0);
 			dump_ail_list(sdp);
 			return;
 		}
diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index 8ee05d25dfa6..9bd080e5db43 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -43,7 +43,7 @@ void gfs2_pin(struct gfs2_sbd *sdp, struct buffer_head *bh)
 {
 	struct gfs2_bufdata *bd;
 
-	BUG_ON(!current->journal_info);
+	BUG_ON(!current_trans());
 
 	clear_buffer_dirty(bh);
 	if (test_set_buffer_pinned(bh))
diff --git a/fs/gfs2/meta_io.c b/fs/gfs2/meta_io.c
index d68184ebbfdd..f5622393de63 100644
--- a/fs/gfs2/meta_io.c
+++ b/fs/gfs2/meta_io.c
@@ -294,7 +294,7 @@ int gfs2_meta_read(struct gfs2_glock *gl, u64 blkno, int flags,
 	bh = *bhp;
 	wait_on_buffer(bh);
 	if (unlikely(!buffer_uptodate(bh))) {
-		struct gfs2_trans *tr = current->journal_info;
+		struct gfs2_trans *tr = current_trans();
 		if (tr && test_bit(TR_TOUCHED, &tr->tr_flags))
 			gfs2_io_error_bh_wd(sdp, bh);
 		brelse(bh);
@@ -321,7 +321,7 @@ int gfs2_meta_wait(struct gfs2_sbd *sdp, struct buffer_head *bh)
 	wait_on_buffer(bh);
 
 	if (!buffer_uptodate(bh)) {
-		struct gfs2_trans *tr = current->journal_info;
+		struct gfs2_trans *tr = current_trans();
 		if (tr && test_bit(TR_TOUCHED, &tr->tr_flags))
 			gfs2_io_error_bh_wd(sdp, bh);
 		return -EIO;
@@ -337,7 +337,7 @@ void gfs2_remove_from_journal(struct buffer_head *bh, int meta)
 	struct address_space *mapping = bh->b_page->mapping;
 	struct gfs2_sbd *sdp = gfs2_mapping2sbd(mapping);
 	struct gfs2_bufdata *bd = bh->b_private;
-	struct gfs2_trans *tr = current->journal_info;
+	struct gfs2_trans *tr = current_trans();
 	int was_pinned = 0;
 
 	if (test_clear_buffer_pinned(bh)) {
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 4d4ceb0b6903..5cb823e58d01 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -557,7 +557,7 @@ static void gfs2_dirty_inode(struct inode *inode, int flags)
 	} else if (WARN_ON_ONCE(ip->i_gl->gl_state != LM_ST_EXCLUSIVE))
 		return;
 
-	if (current->journal_info == NULL) {
+	if (!current_trans()) {
 		ret = gfs2_trans_begin(sdp, RES_DINODE, 0);
 		if (ret) {
 			fs_err(sdp, "dirty_inode: gfs2_trans_begin %d\n", ret);
diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index 63fec11ef2ce..7681fbb12050 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -43,8 +43,8 @@ int __gfs2_trans_begin(struct gfs2_trans *tr, struct gfs2_sbd *sdp,
 {
 	unsigned int extra_revokes;
 
-	if (current->journal_info) {
-		gfs2_print_trans(sdp, current->journal_info);
+	if (current_trans()) {
+		gfs2_print_trans(sdp, current_trans());
 		BUG();
 	}
 	BUG_ON(blocks == 0 && revokes == 0);
@@ -101,7 +101,7 @@ int __gfs2_trans_begin(struct gfs2_trans *tr, struct gfs2_sbd *sdp,
 		return -EROFS;
 	}
 
-	current->journal_info = tr;
+	set_current_trans(tr);
 
 	return 0;
 }
@@ -123,10 +123,10 @@ int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
 
 void gfs2_trans_end(struct gfs2_sbd *sdp)
 {
-	struct gfs2_trans *tr = current->journal_info;
+	struct gfs2_trans *tr = current_trans();
 	s64 nbuf;
 
-	current->journal_info = NULL;
+	set_current_trans(NULL);
 
 	if (!test_bit(TR_TOUCHED, &tr->tr_flags)) {
 		gfs2_log_release_revokes(sdp, tr->tr_revokes);
@@ -191,7 +191,7 @@ static struct gfs2_bufdata *gfs2_alloc_bufdata(struct gfs2_glock *gl,
  */
 void gfs2_trans_add_data(struct gfs2_glock *gl, struct buffer_head *bh)
 {
-	struct gfs2_trans *tr = current->journal_info;
+	struct gfs2_trans *tr = current_trans();
 	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
 	struct gfs2_bufdata *bd;
 
@@ -232,7 +232,7 @@ void gfs2_trans_add_meta(struct gfs2_glock *gl, struct buffer_head *bh)
 	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
 	struct gfs2_bufdata *bd;
 	struct gfs2_meta_header *mh;
-	struct gfs2_trans *tr = current->journal_info;
+	struct gfs2_trans *tr = current_trans();
 	enum gfs2_freeze_state state = atomic_read(&sdp->sd_freeze_state);
 
 	lock_buffer(bh);
@@ -288,7 +288,7 @@ void gfs2_trans_add_meta(struct gfs2_glock *gl, struct buffer_head *bh)
 
 void gfs2_trans_add_revoke(struct gfs2_sbd *sdp, struct gfs2_bufdata *bd)
 {
-	struct gfs2_trans *tr = current->journal_info;
+	struct gfs2_trans *tr = current_trans();
 
 	BUG_ON(!list_empty(&bd->bd_list));
 	gfs2_add_revoke(sdp, bd);
-- 
2.26.3

