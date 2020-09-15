Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6034126A73B
	for <lists+cluster-devel@lfdr.de>; Tue, 15 Sep 2020 16:38:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600180713;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=91EpqR29tmU0vNy+sLl+c4gLRuIz8xSpMoHp7I7oGSE=;
	b=EUDjuhityEJ5MnXMMHeHyq3zJKHAElOSR79mfzkpKyObkDXNF5VeSkqMAScO4sZiVFqXwv
	GWUD284tVq3D7U1WMiCobKX4vPuMn3FBktNiAVPd1r/nfzx6f1Y3AF6vL4tEM90FZRMRwR
	97tEf24U2cwYSICnh0lI2CvBeejas7M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-mWlv6ISKPEWvFTdWdEQZcg-1; Tue, 15 Sep 2020 10:38:31 -0400
X-MC-Unique: mWlv6ISKPEWvFTdWdEQZcg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BE3E8DB9E6;
	Tue, 15 Sep 2020 14:38:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 59DE119C4F;
	Tue, 15 Sep 2020 14:38:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 43A94183D023;
	Tue, 15 Sep 2020 14:38:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08FEcOIO013087 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 15 Sep 2020 10:38:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 392E660C0F; Tue, 15 Sep 2020 14:38:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-23.phx2.redhat.com [10.3.112.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 093F260BE2
	for <cluster-devel@redhat.com>; Tue, 15 Sep 2020 14:38:23 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 15 Sep 2020 09:38:20 -0500
Message-Id: <20200915143822.16485-4-rpeterso@redhat.com>
In-Reply-To: <20200915143822.16485-1-rpeterso@redhat.com>
References: <20200915143822.16485-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 3/5] gfs2: further simplify
	gfs2_evict_inode with new func may_delete_evicted
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

This patch further simplifies function gfs2_evict_inode() by adding a new
function may_delete_evicted(). The function may also lock the inode glock.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/super.c | 115 +++++++++++++++++++++++++++++++-----------------
 1 file changed, 75 insertions(+), 40 deletions(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 6f9e394d2a2e..82c79143681a 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1350,91 +1350,126 @@ static int delete_evicted_inode(struct inode *inode)
 }
 
 /**
- * gfs2_evict_inode - Remove an inode from cache
+ * may_delete_evicted - determine whether the inode is eligible for deletion
  * @inode: The inode to evict
  *
- * There are three cases to consider:
- * 1. i_nlink == 0, we are final opener (and must deallocate)
- * 2. i_nlink == 0, we are not the final opener (and cannot deallocate)
- * 3. i_nlink > 0
+ * This function determines whether the evicted inode is eligible to be deleted
+ * and locks the inode glock.
  *
- * If the fs is read only, then we have to treat all cases as per #3
- * since we are unable to do any deallocation. The inode will be
- * deallocated by the next read/write node to attempt an allocation
- * in the same resource group
- *
- * We have to (at the moment) hold the inodes main lock to cover
- * the gap between unlocking the shared lock on the iopen lock and
- * taking the exclusive lock. I'd rather do a shared -> exclusive
- * conversion on the iopen lock, but we can change that later. This
- * is safe, just less efficient.
+ * Returns: 1 if the dinode associated with this inode should be deleted
+ *          0 if the dinode should not be deleted, or
+ *          -EEXIST if the decision must be deferred at this time.
  */
-
-static void gfs2_evict_inode(struct inode *inode)
+static int may_delete_evicted(struct inode *inode, struct gfs2_holder *gh)
 {
+	struct gfs2_inode *ip = GFS2_I(inode);
 	struct super_block *sb = inode->i_sb;
 	struct gfs2_sbd *sdp = sb->s_fs_info;
-	struct gfs2_inode *ip = GFS2_I(inode);
-	struct gfs2_holder gh;
-	struct address_space *metamapping;
 	int ret;
 
-	if (test_bit(GIF_FREE_VFS_INODE, &ip->i_flags)) {
-		clear_inode(inode);
-		return;
-	}
-
-	if (inode->i_nlink || sb_rdonly(sb))
-		goto out;
-
 	if (test_bit(GIF_ALLOC_FAILED, &ip->i_flags)) {
 		BUG_ON(!gfs2_glock_is_locked_by_me(ip->i_gl));
-		gfs2_holder_mark_uninitialized(&gh);
-		goto out_delete;
+		gfs2_holder_mark_uninitialized(gh);
+		goto may_delete;
 	}
 
 	if (test_bit(GIF_DEFERRED_DELETE, &ip->i_flags))
-		goto out;
+		goto defer;
 
 	/* Deletes should never happen under memory pressure anymore.  */
 	if (WARN_ON_ONCE(current->flags & PF_MEMALLOC))
-		goto out;
+		goto defer;
 
 	/* Must not read inode block until block type has been verified */
-	ret = gfs2_glock_nq_init(ip->i_gl, LM_ST_EXCLUSIVE, GL_SKIP, &gh);
+	ret = gfs2_glock_nq_init(ip->i_gl, LM_ST_EXCLUSIVE, GL_SKIP, gh);
 	if (unlikely(ret)) {
 		glock_clear_object(ip->i_iopen_gh.gh_gl, ip);
 		ip->i_iopen_gh.gh_flags |= GL_NOCACHE;
 		gfs2_glock_dq_uninit(&ip->i_iopen_gh);
-		goto out;
+		goto defer;
 	}
 
 	if (gfs2_inode_already_deleted(ip->i_gl, ip->i_no_formal_ino))
-		goto out_truncate;
+		goto may_not_delete;
 	ret = gfs2_check_blk_type(sdp, ip->i_no_addr, GFS2_BLKST_UNLINKED);
 	if (ret)
-		goto out_truncate;
+		goto may_not_delete;
 
 	if (test_bit(GIF_INVALID, &ip->i_flags)) {
 		ret = gfs2_inode_refresh(ip);
 		if (ret)
-			goto out_truncate;
+			goto may_not_delete;
 	}
 
 	/*
 	 * The inode may have been recreated in the meantime.
 	 */
 	if (inode->i_nlink)
-		goto out_truncate;
+		goto may_not_delete;
 
-out_delete:
+may_delete:
 	if (gfs2_holder_initialized(&ip->i_iopen_gh) &&
 	    test_bit(HIF_HOLDER, &ip->i_iopen_gh.gh_iflags)) {
 		if (!gfs2_upgrade_iopen_glock(inode)) {
 			gfs2_holder_uninit(&ip->i_iopen_gh);
-			goto out_truncate;
+			goto may_not_delete;
 		}
 	}
+	return 1;
+
+may_not_delete:
+	return 0;
+
+defer:
+	return -EEXIST;
+}
+
+/**
+ * gfs2_evict_inode - Remove an inode from cache
+ * @inode: The inode to evict
+ *
+ * There are three cases to consider:
+ * 1. i_nlink == 0, we are final opener (and must deallocate)
+ * 2. i_nlink == 0, we are not the final opener (and cannot deallocate)
+ * 3. i_nlink > 0
+ *
+ * If the fs is read only, then we have to treat all cases as per #3
+ * since we are unable to do any deallocation. The inode will be
+ * deallocated by the next read/write node to attempt an allocation
+ * in the same resource group
+ *
+ * We have to (at the moment) hold the inodes main lock to cover
+ * the gap between unlocking the shared lock on the iopen lock and
+ * taking the exclusive lock. I'd rather do a shared -> exclusive
+ * conversion on the iopen lock, but we can change that later. This
+ * is safe, just less efficient.
+ */
+
+static void gfs2_evict_inode(struct inode *inode)
+{
+	struct super_block *sb = inode->i_sb;
+	struct gfs2_sbd *sdp = sb->s_fs_info;
+	struct gfs2_inode *ip = GFS2_I(inode);
+	struct gfs2_holder gh;
+	struct address_space *metamapping;
+	int ret;
+
+	if (test_bit(GIF_FREE_VFS_INODE, &ip->i_flags)) {
+		clear_inode(inode);
+		return;
+	}
+
+	if (inode->i_nlink || sb_rdonly(sb))
+		goto out;
+
+	gfs2_holder_mark_uninitialized(&gh);
+	/* may_delete_evicted also locks the inode glock */
+	ret = may_delete_evicted(inode, &gh);
+	if (ret == -EEXIST)
+		goto out;
+	if (!ret)
+		goto out_truncate;
+
 	ret = delete_evicted_inode(inode);
 	goto out_unlock;
 
-- 
2.26.2

