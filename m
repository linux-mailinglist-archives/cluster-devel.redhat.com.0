Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA753D24D
	for <lists+cluster-devel@lfdr.de>; Tue, 11 Jun 2019 18:32:49 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 21B92A3B75;
	Tue, 11 Jun 2019 16:32:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 769A160DCE;
	Tue, 11 Jun 2019 16:32:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B72CA18363C1;
	Tue, 11 Jun 2019 16:32:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5BGNXBs019524 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 11 Jun 2019 12:23:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1E2AA60C47; Tue, 11 Jun 2019 16:23:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.205.64])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 543B360BF4;
	Tue, 11 Jun 2019 16:23:29 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Date: Tue, 11 Jun 2019 18:23:26 +0200
Message-Id: <20190611162326.26967-1-agruenba@redhat.com>
In-Reply-To: <20190605142428.84784-1-wangkefeng.wang@huawei.com>
References: <20190605142428.84784-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH] fs: gfs2: Use IS_ERR_OR_NULL
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Tue, 11 Jun 2019 16:32:47 +0000 (UTC)

Kefeng,

On Wed, 5 Jun 2019 at 16:17, Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
> Use IS_ERR_OR_NULL where appropriate.

It seems there are several more instances in which IS_ERR_OR_NULL should
be used (see below).

Thanks,
Andreas

---
 fs/gfs2/dir.c        | 2 +-
 fs/gfs2/glock.c      | 2 +-
 fs/gfs2/inode.c      | 2 +-
 fs/gfs2/ops_fstype.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/dir.c b/fs/gfs2/dir.c
index 3925efd3fd83..761a37a3c656 100644
--- a/fs/gfs2/dir.c
+++ b/fs/gfs2/dir.c
@@ -753,7 +753,7 @@ static struct gfs2_dirent *gfs2_dirent_split_alloc(struct inode *inode,
 	struct gfs2_dirent *dent;
 	dent = gfs2_dirent_scan(inode, bh->b_data, bh->b_size,
 				gfs2_dirent_find_offset, name, ptr);
-	if (!dent || IS_ERR(dent))
+	if (IS_ERR_OR_NULL(dent))
 		return dent;
 	return do_init_dirent(inode, dent, name, bh,
 			      (unsigned)(ptr - (void *)dent));
diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 15c605cfcfc8..f6281470a182 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -684,7 +684,7 @@ static void delete_work_func(struct work_struct *work)
 		goto out;
 
 	inode = gfs2_lookup_by_inum(sdp, no_addr, NULL, GFS2_BLKST_UNLINKED);
-	if (inode && !IS_ERR(inode)) {
+	if (!IS_ERR_OR_NULL(inode)) {
 		d_prune_aliases(inode);
 		iput(inode);
 	}
diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index 998051c4aea7..1cc99da705fc 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -796,7 +796,7 @@ static int gfs2_create_inode(struct inode *dir, struct dentry *dentry,
 fail_gunlock:
 	gfs2_dir_no_add(&da);
 	gfs2_glock_dq_uninit(ghs);
-	if (inode && !IS_ERR(inode)) {
+	if (!IS_ERR_OR_NULL(inode)) {
 		clear_nlink(inode);
 		if (!free_vfs_inode)
 			mark_inode_dirty(inode);
diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index f5312f3b58ee..d35772d90b0a 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -579,7 +579,7 @@ static int gfs2_jindex_hold(struct gfs2_sbd *sdp, struct gfs2_holder *ji_gh)
 
 		INIT_WORK(&jd->jd_work, gfs2_recover_func);
 		jd->jd_inode = gfs2_lookupi(sdp->sd_jindex, &name, 1);
-		if (!jd->jd_inode || IS_ERR(jd->jd_inode)) {
+		if (IS_ERR_OR_NULL(jd->jd_inode)) {
 			if (!jd->jd_inode)
 				error = -ENOENT;
 			else
-- 
2.20.1

