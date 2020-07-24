Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 5D95522CDD5
	for <lists+cluster-devel@lfdr.de>; Fri, 24 Jul 2020 20:36:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595615784;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ij3sgaBNXx3hlZ+PGDWcyJW9AeCGM0IAZ1BV4RjZucY=;
	b=DdZ2lGauKXLc+bd4cKjtClQVicvbTv3VqygDAxUtuhVroaFhGzo72jZ2shTPS7YjfDM06S
	EmkMZ7TU1+O9NrjN2ONzx2iBjJcWS0Cn9ldhKuVG8FwK9HGw0uUYrG6+5d5YYzV063mb/x
	Iz4pHYhkKz2r9pBSTOEYMZbhaHOiZ1c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-LMISIJPcNcmYOS82iDzOig-1; Fri, 24 Jul 2020 14:36:22 -0400
X-MC-Unique: LMISIJPcNcmYOS82iDzOig-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9454E100AA25;
	Fri, 24 Jul 2020 18:36:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 857065D9D3;
	Fri, 24 Jul 2020 18:36:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 72427A3595;
	Fri, 24 Jul 2020 18:36:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06OIXC3P016287 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 24 Jul 2020 14:33:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 500FC70599; Fri, 24 Jul 2020 18:33:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-145.phx2.redhat.com [10.3.112.145])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 211986FEFE
	for <cluster-devel@redhat.com>; Fri, 24 Jul 2020 18:33:12 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 24 Jul 2020 13:32:58 -0500
Message-Id: <20200724183304.366913-6-rpeterso@redhat.com>
In-Reply-To: <20200724183304.366913-1-rpeterso@redhat.com>
References: <20200724183304.366913-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 05/11] gfs2: Wipe jdata and ail1 in
	gfs2_journal_wipe, formerly gfs2_meta_wipe
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

Before this patch, when blocks were freed, it called gfs2_meta_wipe to
take the metadata out of the pending journal blocks. It did this mostly
by calling another function called gfs2_remove_from_journal. This is
shortsighted because it does not do anything with jdata blocks which
may also be in the journal.

This patch expands the function so that it wipes out jdata blocks from
the journal as well, and it wipes it from the ail1 list if it hasn't
yet been written back yet. Since it now processes jdata blocks as well,
the function has been renamed from gfs2_meta_wipe to gfs2_journal_wipe.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/aops.c    |  2 +-
 fs/gfs2/meta_io.c | 82 +++++++++++++++++++++++++++++++++++++++++++----
 fs/gfs2/meta_io.h |  5 +--
 fs/gfs2/rgrp.c    |  6 ++--
 4 files changed, 83 insertions(+), 12 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index a9af28abe468..aedc9fbf6ac7 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -663,7 +663,7 @@ static void gfs2_discard(struct gfs2_sbd *sdp, struct buffer_head *bh)
 		if (!list_empty(&bd->bd_list) && !buffer_pinned(bh))
 			list_del_init(&bd->bd_list);
 		else
-			gfs2_remove_from_journal(bh, REMOVE_JDATA);
+			gfs2_remove_from_journal(bh, REMOVE_JDATA, 1);
 	}
 	bh->b_bdev = NULL;
 	clear_buffer_mapped(bh);
diff --git a/fs/gfs2/meta_io.c b/fs/gfs2/meta_io.c
index 9856cc2e0795..ac0a7537b8fb 100644
--- a/fs/gfs2/meta_io.c
+++ b/fs/gfs2/meta_io.c
@@ -327,7 +327,7 @@ int gfs2_meta_wait(struct gfs2_sbd *sdp, struct buffer_head *bh)
 	return 0;
 }
 
-void gfs2_remove_from_journal(struct buffer_head *bh, int meta)
+void gfs2_remove_from_journal(struct buffer_head *bh, int meta, int lock_ail)
 {
 	struct address_space *mapping = bh->b_page->mapping;
 	struct gfs2_sbd *sdp = gfs2_mapping2sbd(mapping);
@@ -348,38 +348,108 @@ void gfs2_remove_from_journal(struct buffer_head *bh, int meta)
 		brelse(bh);
 	}
 	if (bd) {
-		spin_lock(&sdp->sd_ail_lock);
+		if (lock_ail)
+			spin_lock(&sdp->sd_ail_lock);
 		if (bd->bd_tr) {
 			gfs2_trans_add_revoke(sdp, bd);
 		} else if (was_pinned) {
 			bh->b_private = NULL;
 			kmem_cache_free(gfs2_bufdata_cachep, bd);
 		}
-		spin_unlock(&sdp->sd_ail_lock);
+		if (lock_ail)
+			spin_unlock(&sdp->sd_ail_lock);
 	}
 	clear_buffer_dirty(bh);
 	clear_buffer_uptodate(bh);
 }
 
 /**
- * gfs2_meta_wipe - make inode's buffers so they aren't dirty/pinned anymore
+ * gfs2_ail1_wipe - remove deleted/freed buffers from the ail1 list
+ * @sdp: superblock
+ * @bstart: starting block address of buffers to remove
+ * @blen: length of buffers to be removed
+ *
+ * This function is called from gfs2_journal wipe, whose job is to remove
+ * buffers, corresponding to deleted blocks, from the journal. If we find any
+ * bufdata elements on the system ail1 list, they haven't been written to
+ * the journal yet. So we remove them.
+ */
+static void gfs2_ail1_wipe(struct gfs2_sbd *sdp, u64 bstart, u32 blen)
+{
+	struct gfs2_trans *tr, *s;
+	struct gfs2_bufdata *bd, *bs;
+	struct buffer_head *bh;
+	u64 end = bstart + blen;
+
+	gfs2_log_lock(sdp);
+	spin_lock(&sdp->sd_ail_lock);
+	list_for_each_entry_safe(tr, s, &sdp->sd_ail1_list, tr_list) {
+		list_for_each_entry_safe(bd, bs, &tr->tr_ail1_list,
+					 bd_ail_st_list) {
+			bh = bd->bd_bh;
+			if (bh->b_blocknr < bstart || bh->b_blocknr >= end)
+				continue;
+
+			gfs2_remove_from_journal(bh, REMOVE_JDATA, 0);
+		}
+	}
+	spin_unlock(&sdp->sd_ail_lock);
+	gfs2_log_unlock(sdp);
+}
+
+struct buffer_head *gfs2_getjdatabuf(struct gfs2_inode *ip, u64 blkno)
+{
+	struct address_space *mapping = ip->i_inode.i_mapping;
+	struct gfs2_sbd *sdp = GFS2_SB(&ip->i_inode);
+	struct page *page;
+	struct buffer_head *bh;
+	unsigned int shift = PAGE_SHIFT - sdp->sd_sb.sb_bsize_shift;
+	unsigned long index = blkno >> shift; /* convert block to page */
+	unsigned int bufnum = blkno - (index << shift);
+
+	page = find_get_page_flags(mapping, index, FGP_LOCK|FGP_ACCESSED);
+	if (!page)
+		return NULL;
+	if (!page_has_buffers(page)) {
+		unlock_page(page);
+		put_page(page);
+		return NULL;
+	}
+	/* Locate header for our buffer within our page */
+	for (bh = page_buffers(page); bufnum--; bh = bh->b_this_page)
+		/* Do nothing */;
+	get_bh(bh);
+	unlock_page(page);
+	put_page(page);
+	return bh;
+}
+
+/**
+ * gfs2_journal_wipe - make inode's buffers so they aren't dirty/pinned anymore
  * @ip: the inode who owns the buffers
  * @bstart: the first buffer in the run
  * @blen: the number of buffers in the run
  *
  */
 
-void gfs2_meta_wipe(struct gfs2_inode *ip, u64 bstart, u32 blen)
+void gfs2_journal_wipe(struct gfs2_inode *ip, u64 bstart, u32 blen)
 {
 	struct gfs2_sbd *sdp = GFS2_SB(&ip->i_inode);
 	struct buffer_head *bh;
+	int ty;
 
+	gfs2_ail1_wipe(sdp, bstart, blen);
 	while (blen) {
+		ty = REMOVE_META;
 		bh = gfs2_getbuf(ip->i_gl, bstart, NO_CREATE);
+		if (!bh && gfs2_is_jdata(ip)) {
+			bh = gfs2_getjdatabuf(ip, bstart);
+			ty = REMOVE_JDATA;
+		}
 		if (bh) {
 			lock_buffer(bh);
 			gfs2_log_lock(sdp);
-			gfs2_remove_from_journal(bh, REMOVE_META);
+			gfs2_remove_from_journal(bh, ty, 1);
 			gfs2_log_unlock(sdp);
 			unlock_buffer(bh);
 			brelse(bh);
diff --git a/fs/gfs2/meta_io.h b/fs/gfs2/meta_io.h
index eafb74e861c6..4d0577c27be1 100644
--- a/fs/gfs2/meta_io.h
+++ b/fs/gfs2/meta_io.h
@@ -59,8 +59,9 @@ enum {
 	REMOVE_META = 1,
 };
 
-extern void gfs2_remove_from_journal(struct buffer_head *bh, int meta);
-extern void gfs2_meta_wipe(struct gfs2_inode *ip, u64 bstart, u32 blen);
+extern void gfs2_remove_from_journal(struct buffer_head *bh, int meta,
+				     int lock_ail);
+extern void gfs2_journal_wipe(struct gfs2_inode *ip, u64 bstart, u32 blen);
 extern int gfs2_meta_indirect_buffer(struct gfs2_inode *ip, int height, u64 num,
 				     struct buffer_head **bhp);
 
diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 074f228ea839..bade48f2522f 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -2445,8 +2445,8 @@ void __gfs2_free_blocks(struct gfs2_inode *ip, struct gfs2_rgrpd *rgd,
 	gfs2_rgrp_out(rgd, rgd->rd_bits[0].bi_bh->b_data);
 
 	/* Directories keep their data in the metadata address space */
-	if (meta || ip->i_depth)
-		gfs2_meta_wipe(ip, bstart, blen);
+	if (meta || ip->i_depth || gfs2_is_jdata(ip))
+		gfs2_journal_wipe(ip, bstart, blen);
 }
 
 /**
@@ -2502,7 +2502,7 @@ void gfs2_free_di(struct gfs2_rgrpd *rgd, struct gfs2_inode *ip)
 	gfs2_statfs_change(sdp, 0, +1, -1);
 	trace_gfs2_block_alloc(ip, rgd, ip->i_no_addr, 1, GFS2_BLKST_FREE);
 	gfs2_quota_change(ip, -1, ip->i_inode.i_uid, ip->i_inode.i_gid);
-	gfs2_meta_wipe(ip, ip->i_no_addr, 1);
+	gfs2_journal_wipe(ip, ip->i_no_addr, 1);
 }
 
 /**
-- 
2.26.2

