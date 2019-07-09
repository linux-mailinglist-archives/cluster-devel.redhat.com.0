Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDC06376F
	for <lists+cluster-devel@lfdr.de>; Tue,  9 Jul 2019 16:08:31 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 004D830C34CF;
	Tue,  9 Jul 2019 14:08:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 74EFD831B7;
	Tue,  9 Jul 2019 14:08:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9A4E4206D2;
	Tue,  9 Jul 2019 14:07:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x69E77uP015992 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 9 Jul 2019 10:07:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C41C7831CE; Tue,  9 Jul 2019 14:07:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.205.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CAC71831B7;
	Tue,  9 Jul 2019 14:07:05 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Tue,  9 Jul 2019 16:06:41 +0200
Message-Id: <20190709140657.19064-3-agruenba@redhat.com>
In-Reply-To: <20190709140657.19064-1-agruenba@redhat.com>
References: <20190709140657.19064-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: [Cluster-devel] [GFS2 PATCH 02/18] gfs2: Use IS_ERR_OR_NULL
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Tue, 09 Jul 2019 14:08:29 +0000 (UTC)

From: Kefeng Wang <wangkefeng.wang@huawei.com>

Use IS_ERR_OR_NULL where appropriate.

(Several more places converted by Andreas.)

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/dir.c        | 4 ++--
 fs/gfs2/glock.c      | 2 +-
 fs/gfs2/inode.c      | 2 +-
 fs/gfs2/ops_fstype.c | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/gfs2/dir.c b/fs/gfs2/dir.c
index 88e4f955c518..6f35d19eec25 100644
--- a/fs/gfs2/dir.c
+++ b/fs/gfs2/dir.c
@@ -750,7 +750,7 @@ static struct gfs2_dirent *gfs2_dirent_split_alloc(struct inode *inode,
 	struct gfs2_dirent *dent;
 	dent = gfs2_dirent_scan(inode, bh->b_data, bh->b_size,
 				gfs2_dirent_find_offset, name, ptr);
-	if (!dent || IS_ERR(dent))
+	if (IS_ERR_OR_NULL(dent))
 		return dent;
 	return do_init_dirent(inode, dent, name, bh,
 			      (unsigned)(ptr - (void *)dent));
@@ -854,7 +854,7 @@ static struct gfs2_dirent *gfs2_dirent_search(struct inode *inode,
 		return ERR_PTR(error);
 	dent = gfs2_dirent_scan(inode, bh->b_data, bh->b_size, scan, name, NULL);
 got_dent:
-	if (unlikely(dent == NULL || IS_ERR(dent))) {
+	if (IS_ERR_OR_NULL(dent)) {
 		brelse(bh);
 		bh = NULL;
 	}
diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index f1ebcb42cbf5..44718098cc60 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -681,7 +681,7 @@ static void delete_work_func(struct work_struct *work)
 		goto out;
 
 	inode = gfs2_lookup_by_inum(sdp, no_addr, NULL, GFS2_BLKST_UNLINKED);
-	if (inode && !IS_ERR(inode)) {
+	if (!IS_ERR_OR_NULL(inode)) {
 		d_prune_aliases(inode);
 		iput(inode);
 	}
diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index b296c59832a7..2e2a8a2fb51d 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -793,7 +793,7 @@ static int gfs2_create_inode(struct inode *dir, struct dentry *dentry,
 fail_gunlock:
 	gfs2_dir_no_add(&da);
 	gfs2_glock_dq_uninit(ghs);
-	if (inode && !IS_ERR(inode)) {
+	if (!IS_ERR_OR_NULL(inode)) {
 		clear_nlink(inode);
 		if (!free_vfs_inode)
 			mark_inode_dirty(inode);
diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 8d614f599065..c199d1d813fc 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -576,7 +576,7 @@ static int gfs2_jindex_hold(struct gfs2_sbd *sdp, struct gfs2_holder *ji_gh)
 
 		INIT_WORK(&jd->jd_work, gfs2_recover_func);
 		jd->jd_inode = gfs2_lookupi(sdp->sd_jindex, &name, 1);
-		if (!jd->jd_inode || IS_ERR(jd->jd_inode)) {
+		if (IS_ERR_OR_NULL(jd->jd_inode)) {
 			if (!jd->jd_inode)
 				error = -ENOENT;
 			else
-- 
2.20.1

