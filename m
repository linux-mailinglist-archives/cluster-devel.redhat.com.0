Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2B7313C764B
	for <lists+cluster-devel@lfdr.de>; Tue, 13 Jul 2021 20:13:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626200012;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/N+XKPvJPL0IlmRDTjQobGHo03taIZ8kMNADdzHw6rE=;
	b=JtQZMSOIiLnkhYZVThcLBWVpuNlEGZizKaL4HgxbXA2efEvIj2Fsb6+nVJ8+ctU/n263Eu
	ZTqfN8B54ooH7UNntHbuw8UdTDPt2Af0qONrt4IDsMi2JhPprViurHUU4kf07OJsRRmPOx
	h997TQRVv7rnRZM6s5kzXfq/0svcB+Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-gT-LwblhMUWsKrPtnd1rXQ-1; Tue, 13 Jul 2021 14:13:31 -0400
X-MC-Unique: gT-LwblhMUWsKrPtnd1rXQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 345AD1084F53;
	Tue, 13 Jul 2021 18:13:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 239FF19C44;
	Tue, 13 Jul 2021 18:13:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 09AB21809C99;
	Tue, 13 Jul 2021 18:13:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16DIA6iv022141 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 13 Jul 2021 14:10:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8CF25100F49F; Tue, 13 Jul 2021 18:10:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-12.phx2.redhat.com [10.3.112.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5CE1D100EB3D
	for <cluster-devel@redhat.com>; Tue, 13 Jul 2021 18:10:06 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 13 Jul 2021 13:09:58 -0500
Message-Id: <20210713180958.66995-11-rpeterso@redhat.com>
In-Reply-To: <20210713180958.66995-1-rpeterso@redhat.com>
References: <20210713180958.66995-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 10/10] gfs2: replace sd_aspace with
	sd_inode
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Before this patch, gfs2 kept its own address space for rgrps, but this
caused a lockdep problem because vfs assumes a 1:1 relationship between
address spaces and their inode. One problematic area is this:

gfs2_unpin
   mark_buffer_dirty(bh);
      mapping = page_mapping(page);
         __set_page_dirty(page, mapping, memcg, 0);
            xa_lock_irqsave(&mapping->i_pages, flags);
                 ^---locks page->mapping->i_pages
            account_page_dirtied(page, mapping)
	       struct inode *inode = mapping->host;
                 ^---assumes the mapping points to an inode
               inode_to_wb(inode)
                  WARN_ON_ONCE !lockdep_is_held(&inode->i_mapping->
                                                i_pages.xa_lock)

It manifests as a lockdep warning you see in the last line.

This patch removes sd_aspace in favor of an entire inode, sd_inode.
Functions that need to access the address space may use a new function
that follows the inode to its address space. This creates the 1:1 relation
between the inode and its address space, so lockdep doesn't complain.
This is how some other file systems manage their metadata, such as btrfs.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glops.c      |  4 ++--
 fs/gfs2/incore.h     |  7 ++++++-
 fs/gfs2/meta_io.c    |  2 +-
 fs/gfs2/meta_io.h    |  2 --
 fs/gfs2/ops_fstype.c | 27 ++++++++++++++++-----------
 fs/gfs2/super.c      |  2 +-
 6 files changed, 26 insertions(+), 18 deletions(-)

diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 744cacd27213..5d755d30d91c 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -162,7 +162,7 @@ void gfs2_ail_flush(struct gfs2_glock *gl, bool fsync)
 static int gfs2_rgrp_metasync(struct gfs2_glock *gl)
 {
 	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
-	struct address_space *metamapping = &sdp->sd_aspace;
+	struct address_space *metamapping = gfs2_aspace(sdp);
 	struct gfs2_rgrpd *rgd = gfs2_glock2rgrp(gl);
 	const unsigned bsize = sdp->sd_sb.sb_bsize;
 	loff_t start = (rgd->rd_addr * bsize) & PAGE_MASK;
@@ -219,7 +219,7 @@ static int rgrp_go_sync(struct gfs2_glock *gl)
 static void rgrp_go_inval(struct gfs2_glock *gl, int flags)
 {
 	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
-	struct address_space *mapping = &sdp->sd_aspace;
+	struct address_space *mapping = gfs2_aspace(sdp);
 	struct gfs2_rgrpd *rgd = gfs2_glock2rgrp(gl);
 	const unsigned bsize = sdp->sd_sb.sb_bsize;
 	loff_t start = (rgd->rd_addr * bsize) & PAGE_MASK;
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 566c0053b7c5..075e5db1d654 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -797,7 +797,7 @@ struct gfs2_sbd {
 
 	/* Log stuff */
 
-	struct address_space sd_aspace;
+	struct inode *sd_inode;
 
 	spinlock_t sd_log_lock;
 
@@ -857,6 +857,11 @@ struct gfs2_sbd {
 	unsigned long sd_log_flush_start;
 };
 
+static inline struct address_space *gfs2_aspace(struct gfs2_sbd *sdp)
+{
+	return sdp->sd_inode->i_mapping;
+}
+
 static inline void gfs2_glstats_inc(struct gfs2_glock *gl, int which)
 {
 	gl->gl_stats.stats[which]++;
diff --git a/fs/gfs2/meta_io.c b/fs/gfs2/meta_io.c
index 7c9619997355..0123437d9c12 100644
--- a/fs/gfs2/meta_io.c
+++ b/fs/gfs2/meta_io.c
@@ -120,7 +120,7 @@ struct buffer_head *gfs2_getbuf(struct gfs2_glock *gl, u64 blkno, int create)
 	unsigned int bufnum;
 
 	if (mapping == NULL)
-		mapping = &sdp->sd_aspace;
+		mapping = gfs2_aspace(sdp);
 
 	shift = PAGE_SHIFT - sdp->sd_sb.sb_bsize_shift;
 	index = blkno >> shift;             /* convert block to page */
diff --git a/fs/gfs2/meta_io.h b/fs/gfs2/meta_io.h
index 21880d72081a..70b9c41ecb46 100644
--- a/fs/gfs2/meta_io.h
+++ b/fs/gfs2/meta_io.h
@@ -42,8 +42,6 @@ static inline struct gfs2_sbd *gfs2_mapping2sbd(struct address_space *mapping)
 	struct inode *inode = mapping->host;
 	if (mapping->a_ops == &gfs2_meta_aops)
 		return (((struct gfs2_glock *)mapping) - 1)->gl_name.ln_sbd;
-	else if (mapping->a_ops == &gfs2_rgrp_aops)
-		return container_of(mapping, struct gfs2_sbd, sd_aspace);
 	else
 		return inode->i_sb->s_fs_info;
 }
diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index b09e61457b23..3e252cfa7f17 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -72,7 +72,6 @@ void free_sbd(struct gfs2_sbd *sdp)
 static struct gfs2_sbd *init_sbd(struct super_block *sb)
 {
 	struct gfs2_sbd *sdp;
-	struct address_space *mapping;
 
 	sdp = kzalloc(sizeof(struct gfs2_sbd), GFP_KERNEL);
 	if (!sdp)
@@ -112,16 +111,6 @@ static struct gfs2_sbd *init_sbd(struct super_block *sb)
 
 	INIT_LIST_HEAD(&sdp->sd_sc_inodes_list);
 
-	mapping = &sdp->sd_aspace;
-
-	address_space_init_once(mapping);
-	mapping->a_ops = &gfs2_rgrp_aops;
-	mapping->host = sb->s_bdev->bd_inode;
-	mapping->flags = 0;
-	mapping_set_gfp_mask(mapping, GFP_NOFS);
-	mapping->private_data = NULL;
-	mapping->writeback_index = 0;
-
 	spin_lock_init(&sdp->sd_log_lock);
 	atomic_set(&sdp->sd_log_pinned, 0);
 	INIT_LIST_HEAD(&sdp->sd_log_revokes);
@@ -1141,6 +1130,7 @@ static int gfs2_fill_super(struct super_block *sb, struct fs_context *fc)
 	struct gfs2_sbd *sdp;
 	struct gfs2_holder mount_gh;
 	struct gfs2_holder freeze_gh;
+	struct address_space *mapping;
 	int error;
 
 	sdp = init_sbd(sb);
@@ -1162,6 +1152,21 @@ static int gfs2_fill_super(struct super_block *sb, struct fs_context *fc)
 	sb->s_flags |= SB_NOSEC;
 	sb->s_magic = GFS2_MAGIC;
 	sb->s_op = &gfs2_super_ops;
+
+	/* Set up an address space for metadata writes */
+	sdp->sd_inode = new_inode(sb);
+	if (!sdp->sd_inode)
+		goto fail_free;
+	sdp->sd_inode->i_ino = GFS2_MAGIC;
+	set_nlink(sdp->sd_inode, 1);
+	sdp->sd_inode->i_size = i_size_read(sb->s_bdev->bd_inode);
+	insert_inode_hash(sdp->sd_inode);
+
+	mapping = gfs2_aspace(sdp);
+	mapping->a_ops = &gfs2_rgrp_aops;
+	mapping_set_gfp_mask(mapping, GFP_NOFS);
+	mapping->writeback_index = 0;
+
 	sb->s_d_op = &gfs2_dops;
 	sb->s_export_op = &gfs2_export_ops;
 	sb->s_qcop = &gfs2_quotactl_ops;
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 0a5b7dfa7a45..9857d8725b2d 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -617,13 +617,13 @@ static void gfs2_put_super(struct super_block *sb)
 	gfs2_jindex_free(sdp);
 	/*  Take apart glock structures and buffer lists  */
 	gfs2_gl_hash_clear(sdp);
-	truncate_inode_pages_final(&sdp->sd_aspace);
 	gfs2_delete_debugfs_file(sdp);
 	/*  Unmount the locking protocol  */
 	gfs2_lm_unmount(sdp);
 
 	/*  At this point, we're through participating in the lockspace  */
 	gfs2_sys_fs_del(sdp);
+	iput(sdp->sd_inode);
 	free_sbd(sdp);
 }
 
-- 
2.31.1

