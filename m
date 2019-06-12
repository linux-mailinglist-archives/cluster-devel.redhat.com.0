Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDD6419DF
	for <lists+cluster-devel@lfdr.de>; Wed, 12 Jun 2019 03:12:25 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A94A687633;
	Wed, 12 Jun 2019 01:12:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 72AA360BF1;
	Wed, 12 Jun 2019 01:12:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8DAE11806B0F;
	Wed, 12 Jun 2019 01:12:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5C1AkBb012130 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 11 Jun 2019 21:10:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 474FF1001B10; Wed, 12 Jun 2019 01:10:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04EBE1001B04;
	Wed, 12 Jun 2019 01:10:44 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 371E3C0587F5;
	Wed, 12 Jun 2019 01:10:31 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 2C1B880E1B8DD6AB2047;
	Wed, 12 Jun 2019 09:10:28 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
	DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server
	id 14.3.439.0; Wed, 12 Jun 2019 09:10:18 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: <linux-kernel@vger.kernel.org>
Date: Wed, 12 Jun 2019 09:17:55 +0800
Message-ID: <20190612011755.94442-1-wangkefeng.wang@huawei.com>
In-Reply-To: <20190611162326.26967-1-agruenba@redhat.com>
References: <20190611162326.26967-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.32]); Wed, 12 Jun 2019 01:10:35 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]);
	Wed, 12 Jun 2019 01:10:35 +0000 (UTC) for IP:'45.249.212.190'
	DOMAIN:'szxga04-in.huawei.com' HELO:'huawei.com'
	FROM:'wangkefeng.wang@huawei.com' RCPT:''
X-RedHat-Spam-Score: -2.302  (RCVD_IN_DNSWL_MED, SPF_HELO_PASS,
	SPF_PASS) 45.249.212.190 szxga04-in.huawei.com
	45.249.212.190 szxga04-in.huawei.com
	<wangkefeng.wang@huawei.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.32
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: [Cluster-devel] [PATCH v2] fs: gfs2: Use IS_ERR_OR_NULL
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Wed, 12 Jun 2019 01:12:24 +0000 (UTC)

Use IS_ERR_OR_NULL where appropriate.

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
index 08823bb3b2d0..9683d534e1a1 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -568,7 +568,7 @@ static int gfs2_jindex_hold(struct gfs2_sbd *sdp, struct gfs2_holder *ji_gh)
 
 		INIT_WORK(&jd->jd_work, gfs2_recover_func);
 		jd->jd_inode = gfs2_lookupi(sdp->sd_jindex, &name, 1);
-		if (!jd->jd_inode || IS_ERR(jd->jd_inode)) {
+		if (IS_ERR_OR_NULL(jd->jd_inode)) {
 			if (!jd->jd_inode)
 				error = -ENOENT;
 			else
-- 
2.20.1

