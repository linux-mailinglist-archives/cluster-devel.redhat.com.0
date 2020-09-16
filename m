Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1A3DB26C3F3
	for <lists+cluster-devel@lfdr.de>; Wed, 16 Sep 2020 17:00:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600268442;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=99FPsIyxsEg8bC3rj7otNHWHzAO31zkEN+5gV7RikDU=;
	b=PjGYjsB/k9ZDz7gOztKge11hsab3JZMEBhsBAly1HC3LNOA1dOk9n9CQ/w6JWu7CiPjIMU
	Yzp6mfg+OF4g6YlLOmSSQ1T/LBOWKqGsxrXJRekh5i/EOhn/ZRMnbqu55dOly6p3OPw1oo
	u8mETIaLT5XFFzGdQV13kpXllPLcJbA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-EkE1sGuBOx6SdWTZjoVibw-1; Wed, 16 Sep 2020 11:00:40 -0400
X-MC-Unique: EkE1sGuBOx6SdWTZjoVibw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 317F8101962B;
	Wed, 16 Sep 2020 15:00:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1348881C53;
	Wed, 16 Sep 2020 15:00:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E513C183D030;
	Wed, 16 Sep 2020 15:00:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08GF0VwS018929 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 16 Sep 2020 11:00:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 226214D; Wed, 16 Sep 2020 15:00:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-23.phx2.redhat.com [10.3.112.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E54B95DE77
	for <cluster-devel@redhat.com>; Wed, 16 Sep 2020 15:00:30 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 16 Sep 2020 10:00:17 -0500
Message-Id: <20200916150020.36582-4-rpeterso@redhat.com>
In-Reply-To: <20200916150020.36582-1-rpeterso@redhat.com>
References: <20200916150020.36582-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 3/6] gfs2: further simplify
	gfs2_evict_inode with new func evict_should_delete
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

This patch further simplifies function gfs2_evict_inode() by adding a new
function evict_should_delete. The function may also lock the inode glock.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/super.c | 112 +++++++++++++++++++++++++++++++-----------------
 1 file changed, 72 insertions(+), 40 deletions(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 1e00a72a158d..1e2ff066f8d4 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -44,6 +44,12 @@
 #include "xattr.h"
 #include "lops.h"
 
+enum dinode_demise {
+	SHOULD_DELETE_DINODE,
+	SHOULD_NOT_DELETE_DINODE,
+	SHOULD_DEFER_EVICTION,
+};
+
 /**
  * gfs2_jindex_free - Clear all the journal index information
  * @sdp: The GFS2 superblock
@@ -1350,91 +1356,117 @@ static int evict_deleted_inode(struct inode *inode)
 }
 
 /**
- * gfs2_evict_inode - Remove an inode from cache
+ * evict_should_delete - determine whether the inode is eligible for deletion
  * @inode: The inode to evict
  *
- * There are three cases to consider:
- * 1. i_nlink == 0, we are final opener (and must deallocate)
- * 2. i_nlink == 0, we are not the final opener (and cannot deallocate)
- * 3. i_nlink > 0
- *
- * If the fs is read only, then we have to treat all cases as per #3
- * since we are unable to do any deallocation. The inode will be
- * deallocated by the next read/write node to attempt an allocation
- * in the same resource group
+ * This function determines whether the evicted inode is eligible to be deleted
+ * and locks the inode glock.
  *
- * We have to (at the moment) hold the inodes main lock to cover
- * the gap between unlocking the shared lock on the iopen lock and
- * taking the exclusive lock. I'd rather do a shared -> exclusive
- * conversion on the iopen lock, but we can change that later. This
- * is safe, just less efficient.
+ * Returns: the fate of the dinode
  */
-
-static void gfs2_evict_inode(struct inode *inode)
+static enum dinode_demise evict_should_delete(struct inode *inode,
+					      struct gfs2_holder *gh)
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
+		goto should_delete;
 	}
 
 	if (test_bit(GIF_DEFERRED_DELETE, &ip->i_flags))
-		goto out;
+		return SHOULD_DEFER_EVICTION;
 
 	/* Deletes should never happen under memory pressure anymore.  */
 	if (WARN_ON_ONCE(current->flags & PF_MEMALLOC))
-		goto out;
+		return SHOULD_DEFER_EVICTION;
 
 	/* Must not read inode block until block type has been verified */
-	ret = gfs2_glock_nq_init(ip->i_gl, LM_ST_EXCLUSIVE, GL_SKIP, &gh);
+	ret = gfs2_glock_nq_init(ip->i_gl, LM_ST_EXCLUSIVE, GL_SKIP, gh);
 	if (unlikely(ret)) {
 		glock_clear_object(ip->i_iopen_gh.gh_gl, ip);
 		ip->i_iopen_gh.gh_flags |= GL_NOCACHE;
 		gfs2_glock_dq_uninit(&ip->i_iopen_gh);
-		goto out;
+		return SHOULD_DEFER_EVICTION;
 	}
 
 	if (gfs2_inode_already_deleted(ip->i_gl, ip->i_no_formal_ino))
-		goto out_truncate;
+		return SHOULD_NOT_DELETE_DINODE;
 	ret = gfs2_check_blk_type(sdp, ip->i_no_addr, GFS2_BLKST_UNLINKED);
 	if (ret)
-		goto out_truncate;
+		return SHOULD_NOT_DELETE_DINODE;
 
 	if (test_bit(GIF_INVALID, &ip->i_flags)) {
 		ret = gfs2_inode_refresh(ip);
 		if (ret)
-			goto out_truncate;
+			return SHOULD_NOT_DELETE_DINODE;
 	}
 
 	/*
 	 * The inode may have been recreated in the meantime.
 	 */
 	if (inode->i_nlink)
-		goto out_truncate;
+		return SHOULD_NOT_DELETE_DINODE;
 
-out_delete:
+should_delete:
 	if (gfs2_holder_initialized(&ip->i_iopen_gh) &&
 	    test_bit(HIF_HOLDER, &ip->i_iopen_gh.gh_iflags)) {
 		if (!gfs2_upgrade_iopen_glock(inode)) {
 			gfs2_holder_uninit(&ip->i_iopen_gh);
-			goto out_truncate;
+			return SHOULD_NOT_DELETE_DINODE;
 		}
 	}
+	return SHOULD_DELETE_DINODE;
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
+	ret = evict_should_delete(inode, &gh);
+	if (ret == SHOULD_DEFER_EVICTION)
+		goto out;
+	if (ret == SHOULD_NOT_DELETE_DINODE)
+		goto out_truncate;
+
 	ret = evict_deleted_inode(inode);
 	goto out_unlock;
 
-- 
2.26.2

