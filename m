Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id DA565294424
	for <lists+cluster-devel@lfdr.de>; Tue, 20 Oct 2020 22:58:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603227501;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DWJjdewUQnspsD1RxWFA0Mj9TDF+4w4BMgZB61bTU14=;
	b=Q7TKph4g2te1dNUsUIZME2pCWdwppEq5kr9E4AcE+cG7HYw98IuGL+kVEpQ2MKcoF/gJI0
	7903UFgjI5OrI3lePSZVcWs7Jopju6Rs9wxx1CZkbRhdXjEMThsbmRJ4yNWsEapOADcwcJ
	jjzJo+9j3HVqdLVvZlmViZ08RMpb9N4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-Fowm1CuiM12Y_AR8IgXRQg-1; Tue, 20 Oct 2020 16:58:19 -0400
X-MC-Unique: Fowm1CuiM12Y_AR8IgXRQg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BC8A87951E;
	Tue, 20 Oct 2020 20:58:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC8D15D9EF;
	Tue, 20 Oct 2020 20:58:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 99D668C7CB;
	Tue, 20 Oct 2020 20:58:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09KKwAQA004643 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 20 Oct 2020 16:58:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 12E8A55770; Tue, 20 Oct 2020 20:58:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from radium.msp.redhat.com (radium.msp.redhat.com [10.15.80.88])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CA63A6266E
	for <cluster-devel@redhat.com>; Tue, 20 Oct 2020 20:58:09 +0000 (UTC)
From: Abhi Das <adas@redhat.com>
To: cluster-devel@redhat.com
Date: Tue, 20 Oct 2020 15:58:04 -0500
Message-Id: <20201020205805.5705-3-adas@redhat.com>
In-Reply-To: <20201020205805.5705-1-adas@redhat.com>
References: <20201020205805.5705-1-adas@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v3 2/3] gfs2: lookup local statfs inodes
	prior to journal recovery
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

We need to lookup the master statfs inode and the local statfs
inodes earlier in the mount process (in init_journal) so journal
recovery can use them when it attempts to recover the statfs info.
We lookup all the local statfs inodes and store them in a linked
list to allow a node to recover statfs info for other nodes in the
cluster.

Signed-off-by: Abhi Das <adas@redhat.com>
---
 fs/gfs2/incore.h     |   8 +++
 fs/gfs2/ops_fstype.c | 133 +++++++++++++++++++++++++++++++------------
 fs/gfs2/super.c      |  31 +++++++++-
 fs/gfs2/super.h      |   3 +
 4 files changed, 139 insertions(+), 36 deletions(-)

diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index e34183e02a9e..0220f2b1d5bf 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -697,6 +697,13 @@ struct gfs2_pcpu_lkstats {
 	struct gfs2_lkstats lkstats[10];
 };
 
+/* List of local (per node) statfs inodes */
+struct lcl_statfs_inode {
+	struct list_head si_list;
+	struct inode *si_sc_inode;
+	unsigned int si_jid; /* journal id this statfs inode corresponds to */
+};
+
 struct gfs2_sbd {
 	struct super_block *sd_vfs;
 	struct gfs2_pcpu_lkstats __percpu *sd_lkstats;
@@ -748,6 +755,7 @@ struct gfs2_sbd {
 	struct inode *sd_jindex;
 	struct inode *sd_statfs_inode;
 	struct inode *sd_sc_inode;
+	struct list_head sd_sc_inodes_list;
 	struct inode *sd_qc_inode;
 	struct inode *sd_rindex;
 	struct inode *sd_quota_inode;
diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 03c33fc03c05..dc304f60b39a 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -110,6 +110,8 @@ static struct gfs2_sbd *init_sbd(struct super_block *sb)
 	spin_lock_init(&sdp->sd_trunc_lock);
 	spin_lock_init(&sdp->sd_bitmap_lock);
 
+	INIT_LIST_HEAD(&sdp->sd_sc_inodes_list);
+
 	mapping = &sdp->sd_aspace;
 
 	address_space_init_once(mapping);
@@ -608,6 +610,90 @@ static int gfs2_jindex_hold(struct gfs2_sbd *sdp, struct gfs2_holder *ji_gh)
 	return error;
 }
 
+/**
+ * init_statfs - lookup and initialize master and local (per node)
+ *               statfs inodes. This should be called after the jindex
+ *               is initialized in init_journal() and before
+ *               gfs2_journal_recovery() is called because we need to
+ *               be able to write to these inodes during recovery.
+ * @sdp: The GFS2 superblock
+ *
+ * Returns: errno
+ */
+static int init_statfs(struct gfs2_sbd *sdp)
+{
+	int error = 0;
+	struct inode *master = d_inode(sdp->sd_master_dir);
+	struct inode *pn = NULL;
+	char buf[30];
+	struct gfs2_jdesc *jd;
+	struct gfs2_inode *ip;
+
+	sdp->sd_statfs_inode = gfs2_lookup_simple(master, "statfs");
+	if (IS_ERR(sdp->sd_statfs_inode)) {
+		error = PTR_ERR(sdp->sd_statfs_inode);
+		fs_err(sdp, "can't read in statfs inode: %d\n", error);
+		goto fail;
+	}
+
+	pn = gfs2_lookup_simple(master, "per_node");
+	if (IS_ERR(pn)) {
+		error = PTR_ERR(pn);
+		fs_err(sdp, "can't find per_node directory: %d\n", error);
+		goto put_statfs;
+	}
+
+	/* For each jid, lookup the corresponding local statfs inode in the
+	 * per_node metafs directory and save it in the sdp->sd_sc_inodes_list. */
+	list_for_each_entry(jd, &sdp->sd_jindex_list, jd_list) {
+		struct lcl_statfs_inode *lsi =
+			kmalloc(sizeof(struct lcl_statfs_inode), GFP_NOFS);
+		if (!lsi) {
+			error = -ENOMEM;
+			goto free_lcl;
+		}
+		sprintf(buf, "statfs_change%u", jd->jd_jid);
+		lsi->si_sc_inode = gfs2_lookup_simple(pn, buf);
+		if (IS_ERR(lsi->si_sc_inode)) {
+			error = PTR_ERR(lsi->si_sc_inode);
+			fs_err(sdp, "can't find local \"sc\" file#%u: %d\n",
+			       jd->jd_jid, error);
+			goto free_lcl;
+		}
+		lsi->si_jid = jd->jd_jid;
+		if (jd->jd_jid == sdp->sd_jdesc->jd_jid)
+			sdp->sd_sc_inode = lsi->si_sc_inode;
+
+		list_add_tail(&lsi->si_list, &sdp->sd_sc_inodes_list);
+	}
+
+	iput(pn);
+	ip = GFS2_I(sdp->sd_sc_inode);
+	error = gfs2_glock_nq_init(ip->i_gl, LM_ST_EXCLUSIVE, 0,
+				   &sdp->sd_sc_gh);
+	if (error) {
+		fs_err(sdp, "can't lock local \"sc\" file: %d\n", error);
+		goto free_lcl;
+	}
+	return 0;
+
+free_lcl:
+	free_lcl_statfs_inodes(sdp);
+	iput(pn);
+put_statfs:
+	iput(sdp->sd_statfs_inode);
+fail:
+	return error;
+}
+
+/* Uninitialize and free up memory used by the list of statfs inodes */
+static void uninit_statfs(struct gfs2_sbd *sdp)
+{
+	gfs2_glock_dq_uninit(&sdp->sd_sc_gh);
+	free_lcl_statfs_inodes(sdp);
+	iput(sdp->sd_statfs_inode);
+}
+
 static int init_journal(struct gfs2_sbd *sdp, int undo)
 {
 	struct inode *master = d_inode(sdp->sd_master_dir);
@@ -694,6 +780,11 @@ static int init_journal(struct gfs2_sbd *sdp, int undo)
 	}
 	trace_gfs2_log_blocks(sdp, atomic_read(&sdp->sd_log_blks_free));
 
+	/* Lookup statfs inodes here so journal recovery can use them. */
+	error = init_statfs(sdp);
+	if (error)
+		goto fail_jinode_gh;
+
 	if (sdp->sd_lockstruct.ls_first) {
 		unsigned int x;
 		for (x = 0; x < sdp->sd_journals; x++) {
@@ -702,14 +793,14 @@ static int init_journal(struct gfs2_sbd *sdp, int undo)
 			if (sdp->sd_args.ar_spectator) {
 				error = check_journal_clean(sdp, jd, true);
 				if (error)
-					goto fail_jinode_gh;
+					goto fail_statfs;
 				continue;
 			}
 			error = gfs2_recover_journal(jd, true);
 			if (error) {
 				fs_err(sdp, "error recovering journal %u: %d\n",
 				       x, error);
-				goto fail_jinode_gh;
+				goto fail_statfs;
 			}
 		}
 
@@ -718,7 +809,7 @@ static int init_journal(struct gfs2_sbd *sdp, int undo)
 		error = gfs2_recover_journal(sdp->sd_jdesc, true);
 		if (error) {
 			fs_err(sdp, "error recovering my journal: %d\n", error);
-			goto fail_jinode_gh;
+			goto fail_statfs;
 		}
 	}
 
@@ -729,6 +820,8 @@ static int init_journal(struct gfs2_sbd *sdp, int undo)
 	INIT_WORK(&sdp->sd_freeze_work, gfs2_freeze_func);
 	return 0;
 
+fail_statfs:
+	uninit_statfs(sdp);
 fail_jinode_gh:
 	/* A withdraw may have done dq/uninit so now we need to check it */
 	if (!sdp->sd_args.ar_spectator &&
@@ -762,20 +855,12 @@ static int init_inodes(struct gfs2_sbd *sdp, int undo)
 	if (error)
 		goto fail;
 
-	/* Read in the master statfs inode */
-	sdp->sd_statfs_inode = gfs2_lookup_simple(master, "statfs");
-	if (IS_ERR(sdp->sd_statfs_inode)) {
-		error = PTR_ERR(sdp->sd_statfs_inode);
-		fs_err(sdp, "can't read in statfs inode: %d\n", error);
-		goto fail_journal;
-	}
-
 	/* Read in the resource index inode */
 	sdp->sd_rindex = gfs2_lookup_simple(master, "rindex");
 	if (IS_ERR(sdp->sd_rindex)) {
 		error = PTR_ERR(sdp->sd_rindex);
 		fs_err(sdp, "can't get resource index inode: %d\n", error);
-		goto fail_statfs;
+		goto fail_journal;
 	}
 	sdp->sd_rindex_uptodate = 0;
 
@@ -804,8 +889,6 @@ static int init_inodes(struct gfs2_sbd *sdp, int undo)
 fail_rindex:
 	gfs2_clear_rgrpd(sdp);
 	iput(sdp->sd_rindex);
-fail_statfs:
-	iput(sdp->sd_statfs_inode);
 fail_journal:
 	init_journal(sdp, UNDO);
 fail:
@@ -833,14 +916,6 @@ static int init_per_node(struct gfs2_sbd *sdp, int undo)
 		return error;
 	}
 
-	sprintf(buf, "statfs_change%u", sdp->sd_jdesc->jd_jid);
-	sdp->sd_sc_inode = gfs2_lookup_simple(pn, buf);
-	if (IS_ERR(sdp->sd_sc_inode)) {
-		error = PTR_ERR(sdp->sd_sc_inode);
-		fs_err(sdp, "can't find local \"sc\" file: %d\n", error);
-		goto fail;
-	}
-
 	sprintf(buf, "quota_change%u", sdp->sd_jdesc->jd_jid);
 	sdp->sd_qc_inode = gfs2_lookup_simple(pn, buf);
 	if (IS_ERR(sdp->sd_qc_inode)) {
@@ -852,33 +927,21 @@ static int init_per_node(struct gfs2_sbd *sdp, int undo)
 	iput(pn);
 	pn = NULL;
 
-	ip = GFS2_I(sdp->sd_sc_inode);
-	error = gfs2_glock_nq_init(ip->i_gl, LM_ST_EXCLUSIVE, 0,
-				   &sdp->sd_sc_gh);
-	if (error) {
-		fs_err(sdp, "can't lock local \"sc\" file: %d\n", error);
-		goto fail_qc_i;
-	}
-
 	ip = GFS2_I(sdp->sd_qc_inode);
 	error = gfs2_glock_nq_init(ip->i_gl, LM_ST_EXCLUSIVE, 0,
 				   &sdp->sd_qc_gh);
 	if (error) {
 		fs_err(sdp, "can't lock local \"qc\" file: %d\n", error);
-		goto fail_ut_gh;
+		goto fail_qc_i;
 	}
 
 	return 0;
 
 fail_qc_gh:
 	gfs2_glock_dq_uninit(&sdp->sd_qc_gh);
-fail_ut_gh:
-	gfs2_glock_dq_uninit(&sdp->sd_sc_gh);
 fail_qc_i:
 	iput(sdp->sd_qc_inode);
 fail_ut_i:
-	iput(sdp->sd_sc_inode);
-fail:
 	iput(pn);
 	return error;
 }
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index e17961ea994d..823d10e7263a 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -729,7 +729,7 @@ static void gfs2_put_super(struct super_block *sb)
 			gfs2_glock_dq_uninit(&sdp->sd_jinode_gh);
 		gfs2_glock_dq_uninit(&sdp->sd_sc_gh);
 		gfs2_glock_dq_uninit(&sdp->sd_qc_gh);
-		iput(sdp->sd_sc_inode);
+		free_lcl_statfs_inodes(sdp);
 		iput(sdp->sd_qc_inode);
 	}
 
@@ -1561,6 +1561,35 @@ static void gfs2_free_inode(struct inode *inode)
 	kmem_cache_free(gfs2_inode_cachep, GFS2_I(inode));
 }
 
+extern void free_lcl_statfs_inodes(struct gfs2_sbd *sdp)
+{
+	struct lcl_statfs_inode *lsi, *safe;
+
+	/* Run through the statfs inodes list to iput and free memory */
+	list_for_each_entry_safe(lsi, safe, &sdp->sd_sc_inodes_list, si_list) {
+		if (lsi->si_jid == sdp->sd_jdesc->jd_jid)
+			sdp->sd_sc_inode = NULL; /* belongs to this node */
+		if (lsi->si_sc_inode)
+			iput(lsi->si_sc_inode);
+		list_del(&lsi->si_list);
+		kfree(lsi);
+	}
+}
+
+extern struct inode *find_lcl_statfs_inode(struct gfs2_sbd *sdp,
+                                           unsigned int index)
+{
+	struct lcl_statfs_inode *lsi;
+
+	/* Return the local (per node) statfs inode in the
+	 * sdp->sd_sc_inodes_list corresponding to the 'index'. */
+	list_for_each_entry(lsi, &sdp->sd_sc_inodes_list, si_list) {
+		if (lsi->si_jid == index)
+			return lsi->si_sc_inode;
+	}
+	return NULL;
+}
+
 const struct super_operations gfs2_super_ops = {
 	.alloc_inode		= gfs2_alloc_inode,
 	.free_inode		= gfs2_free_inode,
diff --git a/fs/gfs2/super.h b/fs/gfs2/super.h
index ed4f5cb29074..55f2b51824f4 100644
--- a/fs/gfs2/super.h
+++ b/fs/gfs2/super.h
@@ -44,6 +44,9 @@ extern void update_statfs(struct gfs2_sbd *sdp, struct buffer_head *m_bh,
 extern int gfs2_statfs_sync(struct super_block *sb, int type);
 extern void gfs2_freeze_func(struct work_struct *work);
 
+extern void free_lcl_statfs_inodes(struct gfs2_sbd *sdp);
+extern struct inode *find_lcl_statfs_inode(struct gfs2_sbd *sdp,
+                                           unsigned int index);
 extern void free_sbd(struct gfs2_sbd *sdp);
 
 extern struct file_system_type gfs2_fs_type;
-- 
2.20.1

