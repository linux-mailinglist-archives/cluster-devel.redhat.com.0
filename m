Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 41799341C03
	for <lists+cluster-devel@lfdr.de>; Fri, 19 Mar 2021 13:13:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616156029;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=8Pjbjm8w/KKKvDhDaiWEsI49Wczx8YzDSoyOl5RXjbc=;
	b=MD0HgyObyFKhKkBuUzLKTsEBMDQcwSU8hsdKFrc8e5vv9J5/RMFk84VZCTsEwq4Ys7IMd0
	2QQYq9Bn4fvfBlt2rbhkmfvDP5UQX6QzE82PjwAnrrKXQNE4j+pjlJmBdAOaynmphrtQJP
	XmgaGUpjE+eqpf+9dZ/1geZhUYUsDFs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-KGp2i6HwPUKGLBa2SNwKVQ-1; Fri, 19 Mar 2021 08:13:47 -0400
X-MC-Unique: KGp2i6HwPUKGLBa2SNwKVQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4EBEA40C2;
	Fri, 19 Mar 2021 12:13:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B0A315C1BB;
	Fri, 19 Mar 2021 12:13:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6D2E21809C83;
	Fri, 19 Mar 2021 12:13:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12JCDhv1008394 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 19 Mar 2021 08:13:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5AB7610016F8; Fri, 19 Mar 2021 12:13:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 54E6E10013C1
	for <cluster-devel@redhat.com>; Fri, 19 Mar 2021 12:13:40 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 070DD1809C81
	for <cluster-devel@redhat.com>; Fri, 19 Mar 2021 12:13:40 +0000 (UTC)
Date: Fri, 19 Mar 2021 08:13:39 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <451447835.64761322.1616156019951.JavaMail.zimbra@redhat.com>
In-Reply-To: <1893600058.64750309.1616155850500.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.96, 10.4.195.14]
Thread-Topic: gfs2: fast dealloc for exhash directories
Thread-Index: RL4VacLHtZe2jaVXMOXLR1asc4R/zg==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: fast dealloc for exhash
	directories
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Before this patch, whenever a directory was deleted, it called function
__gfs2_dir_exhash_dealloc to deallocate the directory's leaf blocks.
But __gfs2_dir_exhash_dealloc never knew if any given leaf block had
leaf continuation aka "next" blocks, so it read every single leaf block
in, only to determine in 99% of the cases that there was none. Still,
this reading in of all the leaf blocks was very slow.

This patch adds a new disk flag that indicates whether a directory is
clean of any "next leaf" blocks. If so, it takes an optimized path that
just deletes the leaf blocks and zeroes out the hash table.

It would seem to make more sense to have the new bit indicate when a
directory contains "next leaf" blocks rather than the inverse, but we
need to treat file systems created by older versions of gfs2 as if
they have "next leaf" blocks.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/dir.c                    | 165 ++++++++++++++++++++++++++++++++++++---
 fs/gfs2/inode.c                  |   2 +-
 include/uapi/linux/gfs2_ondisk.h |  15 ++++
 3 files changed, 170 insertions(+), 12 deletions(-)

diff --git a/fs/gfs2/dir.c b/fs/gfs2/dir.c
index c0f2875c946c..a9c2d29cc0a7 100644
--- a/fs/gfs2/dir.c
+++ b/fs/gfs2/dir.c
@@ -69,6 +69,7 @@
 #include "meta_io.h"
 #include "quota.h"
 #include "rgrp.h"
+#include "super.h"
 #include "trans.h"
 #include "bmap.h"
 #include "util.h"
@@ -1761,6 +1762,11 @@ static int dir_new_leaf(struct inode *inode, const struct qstr *name)
 		return error;
 	gfs2_trans_add_meta(ip->i_gl, bh);
 	gfs2_add_inode_blocks(&ip->i_inode, 1);
+	/*
+	 * This dinode now has a "next leaf" so we need to deallocate it the
+	 * old, slow way.
+	 */
+	ip->i_diskflags &= ~GFS2_DIF_NO_NEXT_LEAF;
 	gfs2_dinode_out(ip, bh->b_data);
 	brelse(bh);
 	return 0;
@@ -2083,17 +2089,7 @@ static int leaf_dealloc(struct gfs2_inode *dip, u32 index, u32 len,
 	return error;
 }
 
-/**
- * gfs2_dir_exhash_dealloc - free all the leaf blocks in a directory
- * @dip: the directory
- *
- * Dealloc all on-disk directory leaves to FREEMETA state
- * Change on-disk inode type to "regular file"
- *
- * Returns: errno
- */
-
-int gfs2_dir_exhash_dealloc(struct gfs2_inode *dip)
+static int __gfs2_dir_exhash_dealloc(struct gfs2_inode *dip)
 {
 	struct buffer_head *bh;
 	struct gfs2_leaf *leaf;
@@ -2140,6 +2136,153 @@ int gfs2_dir_exhash_dealloc(struct gfs2_inode *dip)
 	return error;
 }
 
+/**
+ * leaves_in_this_rgd - count the leaf blocks in the index with the same rgrp
+ */
+static int leaves_in_this_rgd(struct gfs2_rgrpd *rgd, __be64 *lp, u32 hsize)
+{
+	int index, leaves_in_rgd = 0;
+	u64 leaf_no, prev_leaf = 0;
+
+	for (index = 0; index < hsize; index++) {
+		leaf_no = be64_to_cpu(lp[index]);
+		if (!leaf_no)
+			continue;
+		if (leaf_no == prev_leaf)
+			continue;
+		prev_leaf = leaf_no;
+		if (rgrp_contains_block(rgd, leaf_no))
+			leaves_in_rgd++;
+	}
+	return leaves_in_rgd;
+}
+
+static int dir_exhash_fast_dealloc(struct gfs2_inode *dip)
+{
+	struct gfs2_sbd *sdp = GFS2_SB(&dip->i_inode);
+	struct gfs2_rgrpd *rgd;
+	struct gfs2_holder gh;
+	struct buffer_head *dibh;
+	u32 hsize, index = 0, next_index = 0;
+	__be64 *lp;
+	u64 leaf_no, freed_leaf;
+	int ret = 0;
+	int leaf_count;
+	int freed_blocks;
+
+	hsize = BIT(dip->i_depth);
+	lp = gfs2_dir_get_hash_table(dip);
+	if (IS_ERR(lp))
+		return PTR_ERR(lp);
+	ret = gfs2_quota_hold(dip, NO_UID_QUOTA_CHANGE, NO_GID_QUOTA_CHANGE);
+	if (ret)
+		return ret;
+
+new_rgrp:
+	rgd = NULL;
+	freed_leaf = 0;
+	gfs2_holder_mark_uninitialized(&gh);
+	freed_blocks = 0;
+	while (index < hsize) {
+		leaf_no = be64_to_cpu(lp[index]);
+		if (!leaf_no)
+			goto skip_dups;
+		if (rgd) {
+			if (!rgrp_contains_block(rgd, leaf_no)) {
+				if (!next_index)
+					next_index = index;
+				goto skip_dups;
+			}
+		} else {
+			rgd = gfs2_blk2rgrpd(sdp, leaf_no, true);
+			if (!rgd) {
+				fs_err(sdp, "Error: rgrp for block 0x%llx "
+				       "not found in dir 0x%llx\n",
+				       (unsigned long long)leaf_no,
+				       (unsigned long long)dip->i_no_addr);
+				goto out_err;
+			}
+			ret = gfs2_glock_nq_init(rgd->rd_gl, LM_ST_EXCLUSIVE,
+						 LM_FLAG_NODE_SCOPE, &gh);
+			if (ret)
+				goto out_err;
+			leaf_count = leaves_in_this_rgd(rgd, lp, hsize);
+			ret = gfs2_trans_begin(sdp, RES_DINODE + RES_STATFS +
+					       RES_QUOTA + rgd->rd_length,
+					       leaf_count);
+			if (ret)
+				goto out_rg_gunlock;
+		}
+		__gfs2_free_blocks(dip, rgd, leaf_no, 1, 1);
+		freed_blocks++;
+		freed_leaf = leaf_no;
+skip_dups:
+		while (index < hsize && be64_to_cpu(lp[index]) == leaf_no) {
+			if (leaf_no == freed_leaf)
+				lp[index] = 0;
+			index++;
+		}
+	}
+	if (current->journal_info) {
+		gfs2_statfs_change(sdp, 0, freed_blocks, 0);
+		gfs2_quota_change(dip, -(s64)freed_blocks, dip->i_inode.i_uid,
+				  dip->i_inode.i_gid);
+		gfs2_add_inode_blocks(&dip->i_inode, -freed_blocks);
+		ret = gfs2_meta_inode_buffer(dip, &dibh);
+		if (ret) {
+			fs_err(sdp, "Error: Unable to read dinode 0x%llx\n",
+			       (unsigned long long)dip->i_no_addr);
+			gfs2_consist_inode(dip);
+			gfs2_trans_end(sdp);
+			gfs2_glock_dq_uninit(&gh);
+			goto out_err;
+		}
+		gfs2_trans_add_meta(dip->i_gl, dibh);
+		/*
+		 * On the last dealloc, make this a regular file in case we
+		 * crash. (We don't want to free these blocks a second time.)
+		 */
+		if (!next_index)
+			dip->i_inode.i_mode = S_IFREG;
+		gfs2_dinode_out(dip, dibh->b_data);
+		brelse(dibh);
+		gfs2_trans_end(sdp);
+out_rg_gunlock:
+		gfs2_glock_dq_uninit(&gh);
+	}
+	if (!ret && next_index) {
+		index = next_index;
+		next_index = 0;
+		goto new_rgrp;
+	}
+
+	if (index != hsize) {
+out_err:
+		gfs2_consist_inode(dip);
+		ret = -EIO;
+	}
+	gfs2_quota_unhold(dip);
+	return ret;
+}
+
+/**
+ * __gfs2_dir_exhash_dealloc - free all the leaf blocks in a directory
+ * @dip: the directory
+ *
+ * Dealloc all on-disk directory leaves to FREEMETA state
+ * Change on-disk inode type to "regular file"
+ *
+ * Returns: errno
+ */
+
+int gfs2_dir_exhash_dealloc(struct gfs2_inode *dip)
+{
+	if (dip->i_diskflags & GFS2_DIF_NO_NEXT_LEAF)
+		return dir_exhash_fast_dealloc(dip);
+
+	return __gfs2_dir_exhash_dealloc(dip);
+}
+
 /**
  * gfs2_diradd_alloc_required - find if adding entry will require an allocation
  * @ip: the file being written to
diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index c9775d5c6594..1b7dcdf789ee 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -700,7 +700,7 @@ static int gfs2_create_inode(struct inode *dir, struct dentry *dentry,
 		break;
 	case S_IFDIR:
 		ip->i_diskflags |= (dip->i_diskflags & GFS2_DIF_INHERIT_JDATA);
-		ip->i_diskflags |= GFS2_DIF_JDATA;
+		ip->i_diskflags |= GFS2_DIF_JDATA | GFS2_DIF_NO_NEXT_LEAF;
 		ip->i_entries = 2;
 		break;
 	}
diff --git a/include/uapi/linux/gfs2_ondisk.h b/include/uapi/linux/gfs2_ondisk.h
index 6ec4291bcc7a..ef793871a84b 100644
--- a/include/uapi/linux/gfs2_ondisk.h
+++ b/include/uapi/linux/gfs2_ondisk.h
@@ -258,6 +258,21 @@ enum {
 #define GFS2_DIF_SYNC			0x00000100
 #define GFS2_DIF_SYSTEM			0x00000200 /* New in gfs2 */
 #define GFS2_DIF_TOPDIR			0x00000400 /* New in gfs2 */
+/*
+ * GFS2_DIF_NO_NEXT_LEAF will be set for directory leaf blocks that do not have
+ * "next leaf block", lf_next. For EXHASH directories, when leaves have
+ * the maximum number of possible dirents, gfs2 allocates these next leaf
+ * blocks and they're chained together such that one terminating leaf points
+ * to another leaf with the same hash. We need to indicate which directories
+ * have none (as opposed to which ones have them) so that file systems created
+ * by older gfs2 kernels will not be treated as having no next leaf blocks.
+ *
+ * The reason we distinguish directories having "next leaf" versus none is
+ * to optimize performance of rmdir operations. When we have "next leaf"
+ * somewhere--anywhere--we need to read in all the leaf blocks to find it when
+ * deallocating. When we don't we can just deallocate the leaf blocks.
+ */
+#define GFS2_DIF_NO_NEXT_LEAF		0x00000800 /* No next leaf */
 #define GFS2_DIF_TRUNC_IN_PROG		0x20000000 /* New in gfs2 */
 #define GFS2_DIF_INHERIT_DIRECTIO	0x40000000 /* only in gfs1 */
 #define GFS2_DIF_INHERIT_JDATA		0x80000000

