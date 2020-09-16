Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7705626C3F6
	for <lists+cluster-devel@lfdr.de>; Wed, 16 Sep 2020 17:00:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600268443;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XAIv/spQwJB+tPCYp2tl+n6cEodwLLqpoVJPpAJ/UQI=;
	b=VC0/jb5e/KqDs+8Wq1XptXVguCGjtvrHXY5biqa7MO5ZQzr3oxpzmHlOVNlIsF7fVJnsYB
	ZZCnbqSiXzSVkML6HGy6/itb+w2FpMfIz70KICOqX4UeW4omvuJYSBVKPR899UCT6KvTKQ
	qNdMiI8Q4e0iobqnAwz1zEJcFJaanGE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-DV7ZYDyRNcO8eb_nqcZYtw-1; Wed, 16 Sep 2020 11:00:41 -0400
X-MC-Unique: DV7ZYDyRNcO8eb_nqcZYtw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B158D824FAB;
	Wed, 16 Sep 2020 15:00:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 834A381C58;
	Wed, 16 Sep 2020 15:00:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 63F9544A6E;
	Wed, 16 Sep 2020 15:00:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08GF0WeK018957 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 16 Sep 2020 11:00:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1B0BC4D; Wed, 16 Sep 2020 15:00:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-23.phx2.redhat.com [10.3.112.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E00BC5DE51
	for <cluster-devel@redhat.com>; Wed, 16 Sep 2020 15:00:31 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 16 Sep 2020 10:00:20 -0500
Message-Id: <20200916150020.36582-7-rpeterso@redhat.com>
In-Reply-To: <20200916150020.36582-1-rpeterso@redhat.com>
References: <20200916150020.36582-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 6/6] gfs2: special evict process for
	system inodes
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

This is tricky. Ordinary user inodes are iput from function evict_inodes
before gfs2_put_super is called, which means the file system is still RW.
If not deleted, the evict truncates both the normal address space and inode
glock address space, but first it needs to start a transaction which is
needed in order to add revokes for any changes.

truncate_inode_pages
  truncate_inode_pages_range
     gfs2_invalidatepage
        gfs2_discard
           gfs2_remove_from_journal
              gfs2_trans_add_revoke <------- Needs a transaction

Deleted inodes go through a different code path which should end with a
log flush to add the necessary revokes.

However, system inodes (like sd_quota_inode) cannot be iput until after
the call to gfs2_make_fs_ro. This is because inodes (like statfs) may be
accessed, even while the file system is mounted ro. In the process of
reading them in, we use the glock address space to fetch the metadata,
which gives the address space some pages (nrpages) that later need
truncating.

However, at that point it is impossible to start a new transaction because
of the read-only status. So we need to truncate_inode_pages for the inode's
glock's address space. System inodes that have been changed should already
be committed to the journal and revoked when this happens, so we only need
to truncate the glock's address space. The iput's evict will take care of
truncating the inode's address space, but we need to truncate the glock's
address space first, because the evict may free the glock.

This patch adds two functions: evict_system_inode and dput_system_dentry.
Func evict_system_inode calls truncate_inode_pages for system files.
Func dput_system_dentry calls truncate_inode_pages for system directories.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/ops_fstype.c | 15 +++++++++++++--
 fs/gfs2/super.c      | 28 +++++++++++++++++++++-------
 2 files changed, 34 insertions(+), 9 deletions(-)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 6d18d2c91add..3d543ab54682 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -1585,6 +1585,17 @@ static int gfs2_meta_init_fs_context(struct fs_context *fc)
 	return 0;
 }
 
+static void dput_system_dentry(struct dentry *dentry)
+{
+	struct inode *inode = dentry->d_inode;
+	struct gfs2_inode *ip = GFS2_I(inode);
+	struct gfs2_glock *gl = ip->i_gl;
+
+	if (gl)
+		truncate_inode_pages(gfs2_glock2aspace(gl), 0);
+	dput(dentry);
+}
+
 static void gfs2_kill_sb(struct super_block *sb)
 {
 	struct gfs2_sbd *sdp = sb->s_fs_info;
@@ -1595,8 +1606,8 @@ static void gfs2_kill_sb(struct super_block *sb)
 	}
 
 	gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_SYNC | GFS2_LFC_KILL_SB);
-	dput(sdp->sd_root_dir);
-	dput(sdp->sd_master_dir);
+	dput_system_dentry(sdp->sd_root_dir);
+	dput_system_dentry(sdp->sd_master_dir);
 	sdp->sd_root_dir = NULL;
 	sdp->sd_master_dir = NULL;
 	shrink_dcache_sb(sb);
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index e07399110cd0..96c6582c8883 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -50,6 +50,20 @@ enum dinode_demise {
 	SHOULD_DEFER_EVICTION,
 };
 
+/**
+ * evict_system_inode - evict a system inode truncating its glock address space
+ * @inode: the inode to be evicted
+ */
+static void evict_system_inode(struct inode *inode)
+{
+	struct gfs2_inode *ip = GFS2_I(inode);
+	struct gfs2_glock *gl = ip->i_gl;
+
+	if (gl)
+		truncate_inode_pages(gfs2_glock2aspace(gl), 0);
+	iput(inode);
+}
+
 /**
  * gfs2_jindex_free - Clear all the journal index information
  * @sdp: The GFS2 superblock
@@ -72,7 +86,7 @@ void gfs2_jindex_free(struct gfs2_sbd *sdp)
 		jd = list_first_entry(&list, struct gfs2_jdesc, jd_list);
 		gfs2_free_journal_extents(jd);
 		list_del(&jd->jd_list);
-		iput(jd->jd_inode);
+		evict_system_inode(jd->jd_inode);
 		jd->jd_inode = NULL;
 		kfree(jd);
 	}
@@ -714,10 +728,10 @@ static void gfs2_put_super(struct super_block *sb)
 
 	/*  Release stuff  */
 
-	iput(sdp->sd_jindex);
-	iput(sdp->sd_statfs_inode);
-	iput(sdp->sd_rindex);
-	iput(sdp->sd_quota_inode);
+	evict_system_inode(sdp->sd_jindex);
+	evict_system_inode(sdp->sd_statfs_inode);
+	evict_system_inode(sdp->sd_rindex);
+	evict_system_inode(sdp->sd_quota_inode);
 
 	gfs2_glock_put(sdp->sd_rename_gl);
 	gfs2_glock_put(sdp->sd_freeze_gl);
@@ -729,8 +743,8 @@ static void gfs2_put_super(struct super_block *sb)
 			gfs2_glock_dq_uninit(&sdp->sd_jinode_gh);
 		gfs2_glock_dq_uninit(&sdp->sd_sc_gh);
 		gfs2_glock_dq_uninit(&sdp->sd_qc_gh);
-		iput(sdp->sd_sc_inode);
-		iput(sdp->sd_qc_inode);
+		evict_system_inode(sdp->sd_sc_inode);
+		evict_system_inode(sdp->sd_qc_inode);
 	}
 
 	gfs2_glock_dq_uninit(&sdp->sd_live_gh);
-- 
2.26.2

