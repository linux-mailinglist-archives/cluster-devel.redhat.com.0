Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B11D216C40
	for <lists+cluster-devel@lfdr.de>; Tue,  7 May 2019 22:32:23 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 61029C05D275;
	Tue,  7 May 2019 20:32:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4622C17B90;
	Tue,  7 May 2019 20:32:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2472141F3D;
	Tue,  7 May 2019 20:32:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x47KWK6U018866 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 7 May 2019 16:32:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 21205608CA; Tue,  7 May 2019 20:32:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.205.80])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 556E117CC3;
	Tue,  7 May 2019 20:32:17 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Tue,  7 May 2019 22:32:00 +0200
Message-Id: <20190507203204.26008-8-agruenba@redhat.com>
In-Reply-To: <20190507203204.26008-1-agruenba@redhat.com>
References: <20190507203204.26008-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 08/12] gfs2: Rename sd_log_le_{revoke,
	ordered}
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Tue, 07 May 2019 20:32:22 +0000 (UTC)

Rename sd_log_le_revoke to sd_log_revokes and sd_log_le_ordered to
sd_log_ordered: not sure what le stands for here, but it doesn't add
clarity, and if it stands for list entry, it's actually confusing as
those are both list heads but not list entries.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/incore.h     |  4 ++--
 fs/gfs2/log.c        | 14 +++++++-------
 fs/gfs2/log.h        |  2 +-
 fs/gfs2/lops.c       |  4 ++--
 fs/gfs2/ops_fstype.c |  4 ++--
 fs/gfs2/trans.c      |  2 +-
 6 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 6a94b094a904..78c8e761b321 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -809,8 +809,8 @@ struct gfs2_sbd {
 	atomic_t sd_log_pinned;
 	unsigned int sd_log_num_revoke;
 
-	struct list_head sd_log_le_revoke;
-	struct list_head sd_log_le_ordered;
+	struct list_head sd_log_revokes;
+	struct list_head sd_log_ordered;
 	spinlock_t sd_ordered_lock;
 
 	atomic_t sd_log_thresh1;
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index d55315a46ece..a7febb4bd400 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -551,9 +551,9 @@ static void gfs2_ordered_write(struct gfs2_sbd *sdp)
 	LIST_HEAD(written);
 
 	spin_lock(&sdp->sd_ordered_lock);
-	list_sort(NULL, &sdp->sd_log_le_ordered, &ip_cmp);
-	while (!list_empty(&sdp->sd_log_le_ordered)) {
-		ip = list_entry(sdp->sd_log_le_ordered.next, struct gfs2_inode, i_ordered);
+	list_sort(NULL, &sdp->sd_log_ordered, &ip_cmp);
+	while (!list_empty(&sdp->sd_log_ordered)) {
+		ip = list_entry(sdp->sd_log_ordered.next, struct gfs2_inode, i_ordered);
 		if (ip->i_inode.i_mapping->nrpages == 0) {
 			test_and_clear_bit(GIF_ORDERED, &ip->i_flags);
 			list_del(&ip->i_ordered);
@@ -564,7 +564,7 @@ static void gfs2_ordered_write(struct gfs2_sbd *sdp)
 		filemap_fdatawrite(ip->i_inode.i_mapping);
 		spin_lock(&sdp->sd_ordered_lock);
 	}
-	list_splice(&written, &sdp->sd_log_le_ordered);
+	list_splice(&written, &sdp->sd_log_ordered);
 	spin_unlock(&sdp->sd_ordered_lock);
 }
 
@@ -573,8 +573,8 @@ static void gfs2_ordered_wait(struct gfs2_sbd *sdp)
 	struct gfs2_inode *ip;
 
 	spin_lock(&sdp->sd_ordered_lock);
-	while (!list_empty(&sdp->sd_log_le_ordered)) {
-		ip = list_entry(sdp->sd_log_le_ordered.next, struct gfs2_inode, i_ordered);
+	while (!list_empty(&sdp->sd_log_ordered)) {
+		ip = list_entry(sdp->sd_log_ordered.next, struct gfs2_inode, i_ordered);
 		list_del(&ip->i_ordered);
 		WARN_ON(!test_and_clear_bit(GIF_ORDERED, &ip->i_flags));
 		if (ip->i_inode.i_mapping->nrpages == 0)
@@ -611,7 +611,7 @@ void gfs2_add_revoke(struct gfs2_sbd *sdp, struct gfs2_bufdata *bd)
 		gfs2_glock_hold(gl);
 	}
 	set_bit(GLF_LFLUSH, &gl->gl_flags);
-	list_add(&bd->bd_list, &sdp->sd_log_le_revoke);
+	list_add(&bd->bd_list, &sdp->sd_log_revokes);
 }
 
 void gfs2_write_revokes(struct gfs2_sbd *sdp)
diff --git a/fs/gfs2/log.h b/fs/gfs2/log.h
index 86d07d436cdf..7a34a3234266 100644
--- a/fs/gfs2/log.h
+++ b/fs/gfs2/log.h
@@ -59,7 +59,7 @@ static inline void gfs2_ordered_add_inode(struct gfs2_inode *ip)
 	if (!test_bit(GIF_ORDERED, &ip->i_flags)) {
 		spin_lock(&sdp->sd_ordered_lock);
 		if (!test_and_set_bit(GIF_ORDERED, &ip->i_flags))
-			list_add(&ip->i_ordered, &sdp->sd_log_le_ordered);
+			list_add(&ip->i_ordered, &sdp->sd_log_ordered);
 		spin_unlock(&sdp->sd_ordered_lock);
 	}
 }
diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index 6c1ec6c60639..6af6a3cea967 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -623,7 +623,7 @@ static void revoke_lo_before_commit(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 {
 	struct gfs2_meta_header *mh;
 	unsigned int offset;
-	struct list_head *head = &sdp->sd_log_le_revoke;
+	struct list_head *head = &sdp->sd_log_revokes;
 	struct gfs2_bufdata *bd;
 	struct page *page;
 	unsigned int length;
@@ -661,7 +661,7 @@ static void revoke_lo_before_commit(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 
 static void revoke_lo_after_commit(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 {
-	struct list_head *head = &sdp->sd_log_le_revoke;
+	struct list_head *head = &sdp->sd_log_revokes;
 	struct gfs2_bufdata *bd, *tmp;
 
 	/*
diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index b041cb8ae383..abfaecde0e3d 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -117,8 +117,8 @@ static struct gfs2_sbd *init_sbd(struct super_block *sb)
 
 	spin_lock_init(&sdp->sd_log_lock);
 	atomic_set(&sdp->sd_log_pinned, 0);
-	INIT_LIST_HEAD(&sdp->sd_log_le_revoke);
-	INIT_LIST_HEAD(&sdp->sd_log_le_ordered);
+	INIT_LIST_HEAD(&sdp->sd_log_revokes);
+	INIT_LIST_HEAD(&sdp->sd_log_ordered);
 	spin_lock_init(&sdp->sd_ordered_lock);
 
 	init_waitqueue_head(&sdp->sd_log_waitq);
diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index cd9a94a6b5bb..5c4eae3b69fb 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -260,7 +260,7 @@ void gfs2_trans_add_unrevoke(struct gfs2_sbd *sdp, u64 blkno, unsigned int len)
 	unsigned int n = len;
 
 	gfs2_log_lock(sdp);
-	list_for_each_entry_safe(bd, tmp, &sdp->sd_log_le_revoke, bd_list) {
+	list_for_each_entry_safe(bd, tmp, &sdp->sd_log_revokes, bd_list) {
 		if ((bd->bd_blkno >= blkno) && (bd->bd_blkno < (blkno + len))) {
 			list_del_init(&bd->bd_list);
 			gfs2_assert_withdraw(sdp, sdp->sd_log_num_revoke);
-- 
2.20.1

