Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DBD16C41
	for <lists+cluster-devel@lfdr.de>; Tue,  7 May 2019 22:32:24 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 25051C058CA8;
	Tue,  7 May 2019 20:32:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1015E17178;
	Tue,  7 May 2019 20:32:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E777E41F3D;
	Tue,  7 May 2019 20:32:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x47KWLB2018877 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 7 May 2019 16:32:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 52C1118EE2; Tue,  7 May 2019 20:32:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.205.80])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 80B25608CA;
	Tue,  7 May 2019 20:32:20 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Tue,  7 May 2019 22:32:01 +0200
Message-Id: <20190507203204.26008-9-agruenba@redhat.com>
In-Reply-To: <20190507203204.26008-1-agruenba@redhat.com>
References: <20190507203204.26008-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 09/12] gfs2: Rename
	gfs2_trans_{add_unrevoke => remove_revoke}
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Tue, 07 May 2019 20:32:23 +0000 (UTC)

Rename gfs2_trans_add_unrevoke to gfs2_trans_remove_revoke: there is no
such thing as an "unrevoke" object; all this function does is remove
existing revoke objects plus some bookkeeping.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/bmap.c  | 4 ++--
 fs/gfs2/dir.c   | 2 +-
 fs/gfs2/rgrp.c  | 2 +-
 fs/gfs2/trans.c | 2 +-
 fs/gfs2/trans.h | 2 +-
 fs/gfs2/xattr.c | 6 +++---
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index e95b33b65d89..5da4ca9041c0 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -142,7 +142,7 @@ int gfs2_unstuff_dinode(struct gfs2_inode *ip, struct page *page)
 		if (error)
 			goto out_brelse;
 		if (isdir) {
-			gfs2_trans_add_unrevoke(GFS2_SB(&ip->i_inode), block, 1);
+			gfs2_trans_remove_revoke(GFS2_SB(&ip->i_inode), block, 1);
 			error = gfs2_dir_get_new_buffer(ip, block, &bh);
 			if (error)
 				goto out_brelse;
@@ -676,7 +676,7 @@ static int gfs2_iomap_alloc(struct inode *inode, struct iomap *iomap,
 			goto out;
 		alloced += n;
 		if (state != ALLOC_DATA || gfs2_is_jdata(ip))
-			gfs2_trans_add_unrevoke(sdp, bn, n);
+			gfs2_trans_remove_revoke(sdp, bn, n);
 		switch (state) {
 		/* Growing height of tree */
 		case ALLOC_GROW_HEIGHT:
diff --git a/fs/gfs2/dir.c b/fs/gfs2/dir.c
index daa14ab4e31b..db9a05244a35 100644
--- a/fs/gfs2/dir.c
+++ b/fs/gfs2/dir.c
@@ -883,7 +883,7 @@ static struct gfs2_leaf *new_leaf(struct inode *inode, struct buffer_head **pbh,
 	if (!bh)
 		return NULL;
 
-	gfs2_trans_add_unrevoke(GFS2_SB(inode), bn, 1);
+	gfs2_trans_remove_revoke(GFS2_SB(inode), bn, 1);
 	gfs2_trans_add_meta(ip->i_gl, bh);
 	gfs2_metatype_set(bh, GFS2_METATYPE_LF, GFS2_FORMAT_LF);
 	leaf = (struct gfs2_leaf *)bh->b_data;
diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 52a4f340a867..15d6e32de55f 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -2440,7 +2440,7 @@ int gfs2_alloc_blocks(struct gfs2_inode *ip, u64 *bn, unsigned int *nblocks,
 
 	gfs2_statfs_change(sdp, 0, -(s64)*nblocks, dinode ? 1 : 0);
 	if (dinode)
-		gfs2_trans_add_unrevoke(sdp, block, *nblocks);
+		gfs2_trans_remove_revoke(sdp, block, *nblocks);
 
 	gfs2_quota_change(ip, *nblocks, ip->i_inode.i_uid, ip->i_inode.i_gid);
 
diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index 5c4eae3b69fb..d328da7cde36 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -253,7 +253,7 @@ void gfs2_trans_add_revoke(struct gfs2_sbd *sdp, struct gfs2_bufdata *bd)
 	tr->tr_num_revoke++;
 }
 
-void gfs2_trans_add_unrevoke(struct gfs2_sbd *sdp, u64 blkno, unsigned int len)
+void gfs2_trans_remove_revoke(struct gfs2_sbd *sdp, u64 blkno, unsigned int len)
 {
 	struct gfs2_bufdata *bd, *tmp;
 	struct gfs2_trans *tr = current->journal_info;
diff --git a/fs/gfs2/trans.h b/fs/gfs2/trans.h
index ad70087d0597..1e39f056ccb7 100644
--- a/fs/gfs2/trans.h
+++ b/fs/gfs2/trans.h
@@ -44,6 +44,6 @@ extern void gfs2_trans_end(struct gfs2_sbd *sdp);
 extern void gfs2_trans_add_data(struct gfs2_glock *gl, struct buffer_head *bh);
 extern void gfs2_trans_add_meta(struct gfs2_glock *gl, struct buffer_head *bh);
 extern void gfs2_trans_add_revoke(struct gfs2_sbd *sdp, struct gfs2_bufdata *bd);
-extern void gfs2_trans_add_unrevoke(struct gfs2_sbd *sdp, u64 blkno, unsigned int len);
+extern void gfs2_trans_remove_revoke(struct gfs2_sbd *sdp, u64 blkno, unsigned int len);
 
 #endif /* __TRANS_DOT_H__ */
diff --git a/fs/gfs2/xattr.c b/fs/gfs2/xattr.c
index 996c915a9c97..675e704830df 100644
--- a/fs/gfs2/xattr.c
+++ b/fs/gfs2/xattr.c
@@ -631,7 +631,7 @@ static int ea_alloc_blk(struct gfs2_inode *ip, struct buffer_head **bhp)
 	error = gfs2_alloc_blocks(ip, &block, &n, 0, NULL);
 	if (error)
 		return error;
-	gfs2_trans_add_unrevoke(sdp, block, 1);
+	gfs2_trans_remove_revoke(sdp, block, 1);
 	*bhp = gfs2_meta_new(ip->i_gl, block);
 	gfs2_trans_add_meta(ip->i_gl, *bhp);
 	gfs2_metatype_set(*bhp, GFS2_METATYPE_EA, GFS2_FORMAT_EA);
@@ -693,7 +693,7 @@ static int ea_write(struct gfs2_inode *ip, struct gfs2_ea_header *ea,
 			error = gfs2_alloc_blocks(ip, &block, &n, 0, NULL);
 			if (error)
 				return error;
-			gfs2_trans_add_unrevoke(sdp, block, 1);
+			gfs2_trans_remove_revoke(sdp, block, 1);
 			bh = gfs2_meta_new(ip->i_gl, block);
 			gfs2_trans_add_meta(ip->i_gl, bh);
 			gfs2_metatype_set(bh, GFS2_METATYPE_ED, GFS2_FORMAT_ED);
@@ -997,7 +997,7 @@ static int ea_set_block(struct gfs2_inode *ip, struct gfs2_ea_request *er,
 		error = gfs2_alloc_blocks(ip, &blk, &n, 0, NULL);
 		if (error)
 			return error;
-		gfs2_trans_add_unrevoke(sdp, blk, 1);
+		gfs2_trans_remove_revoke(sdp, blk, 1);
 		indbh = gfs2_meta_new(ip->i_gl, blk);
 		gfs2_trans_add_meta(ip->i_gl, indbh);
 		gfs2_metatype_set(indbh, GFS2_METATYPE_IN, GFS2_FORMAT_IN);
-- 
2.20.1

