Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 53E48277EAC
	for <lists+cluster-devel@lfdr.de>; Fri, 25 Sep 2020 05:46:43 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601005602;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=F+rDUP+JKbzxRW/QtRRcpHvvd/aUyZG5qQfLPwh2X0s=;
	b=Md8F9S2KlL1Ad19Z0VG/w1wQzV/CuQp3L9D2zvQej3lJqfh4R2y9Jk1uj+hPrpJk8cVeOX
	zcuyZSs00vcF7pCUVZintExYZzNrMPa/9LYrxH4WkwVjvgZGVFijAePja6xm5YQz+bFMoS
	SzfllmfCiQGhqovCaXD252hyqr+xqzo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-QOq3unAXPlGK4VCmPU9Gzw-1; Thu, 24 Sep 2020 23:46:39 -0400
X-MC-Unique: QOq3unAXPlGK4VCmPU9Gzw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 523F3805EE5;
	Fri, 25 Sep 2020 03:46:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 430BF5D9DD;
	Fri, 25 Sep 2020 03:46:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E6D1A7A01C;
	Fri, 25 Sep 2020 03:46:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08P3kU0A028421 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 23:46:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7A901702E7; Fri, 25 Sep 2020 03:46:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from radium.msp.redhat.com (radium.msp.redhat.com [10.15.80.88])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4C59B78827
	for <cluster-devel@redhat.com>; Fri, 25 Sep 2020 03:46:30 +0000 (UTC)
From: Abhi Das <adas@redhat.com>
To: cluster-devel@redhat.com
Date: Thu, 24 Sep 2020 22:46:24 -0500
Message-Id: <20200925034625.56517-3-adas@redhat.com>
In-Reply-To: <20200925034625.56517-1-adas@redhat.com>
References: <20200925034625.56517-1-adas@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v2 2/3] gfs2: lookup local statfs inodes at
	mount time
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

We require these inodes during journal recovery when we attempt
to recover the statfs file. We are not able to lookup inodes at
that time due to locks being blocked so we pre-lookup these inodes
and save them in a linked list.

Signed-off-by: Abhi Das <adas@redhat.com>
---
 fs/gfs2/incore.h     |  7 +++++++
 fs/gfs2/ops_fstype.c | 32 ++++++++++++++++++++++++--------
 fs/gfs2/super.c      | 28 +++++++++++++++++++++++++++-
 fs/gfs2/super.h      |  3 +++
 4 files changed, 61 insertions(+), 9 deletions(-)

diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 9fc12206a3ad..313e35c14860 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -705,6 +705,12 @@ struct gfs2_pcpu_lkstats {
 	struct gfs2_lkstats lkstats[10];
 };
 
+struct lcl_statfs_inode {
+	struct list_head si_list;
+	struct inode *si_sc_inode;
+	unsigned int si_jid;
+};
+
 struct gfs2_sbd {
 	struct super_block *sd_vfs;
 	struct gfs2_pcpu_lkstats __percpu *sd_lkstats;
@@ -755,6 +761,7 @@ struct gfs2_sbd {
 	struct inode *sd_jindex;
 	struct inode *sd_statfs_inode;
 	struct inode *sd_sc_inode;
+	struct list_head sd_sc_inodes_list;
 	struct inode *sd_qc_inode;
 	struct inode *sd_rindex;
 	struct inode *sd_quota_inode;
diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 6d18d2c91add..042f3de79789 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -110,6 +110,8 @@ static struct gfs2_sbd *init_sbd(struct super_block *sb)
 	spin_lock_init(&sdp->sd_trunc_lock);
 	spin_lock_init(&sdp->sd_bitmap_lock);
 
+	INIT_LIST_HEAD(&sdp->sd_sc_inodes_list);
+
 	mapping = &sdp->sd_aspace;
 
 	address_space_init_once(mapping);
@@ -814,6 +816,7 @@ static int init_per_node(struct gfs2_sbd *sdp, int undo)
 	char buf[30];
 	int error = 0;
 	struct gfs2_inode *ip;
+	struct gfs2_jdesc *jd;
 	struct inode *master = d_inode(sdp->sd_master_dir);
 
 	if (sdp->sd_args.ar_spectator)
@@ -829,12 +832,26 @@ static int init_per_node(struct gfs2_sbd *sdp, int undo)
 		return error;
 	}
 
-	sprintf(buf, "statfs_change%u", sdp->sd_jdesc->jd_jid);
-	sdp->sd_sc_inode = gfs2_lookup_simple(pn, buf);
-	if (IS_ERR(sdp->sd_sc_inode)) {
-		error = PTR_ERR(sdp->sd_sc_inode);
-		fs_err(sdp, "can't find local \"sc\" file: %d\n", error);
-		goto fail;
+	list_for_each_entry(jd, &sdp->sd_jindex_list, jd_list) {
+		struct lcl_statfs_inode *lsi =
+			kmalloc(sizeof(struct lcl_statfs_inode), GFP_NOFS);
+		if (!lsi) {
+			error = -ENOMEM;
+			goto fail_ut_i;
+		}
+		sprintf(buf, "statfs_change%u", jd->jd_jid);
+		lsi->si_sc_inode = gfs2_lookup_simple(pn, buf);
+		if (IS_ERR(lsi->si_sc_inode)) {
+			error = PTR_ERR(lsi->si_sc_inode);
+			fs_err(sdp, "can't find local \"sc\" file #%u: %d\n",
+			       jd->jd_jid, error);
+			goto fail_ut_i;
+		}
+		lsi->si_jid = jd->jd_jid;
+		if (jd->jd_jid == sdp->sd_jdesc->jd_jid)
+			sdp->sd_sc_inode = lsi->si_sc_inode;
+
+		list_add_tail(&lsi->si_list, &sdp->sd_sc_inodes_list);
 	}
 
 	sprintf(buf, "quota_change%u", sdp->sd_jdesc->jd_jid);
@@ -873,8 +890,7 @@ static int init_per_node(struct gfs2_sbd *sdp, int undo)
 fail_qc_i:
 	iput(sdp->sd_qc_inode);
 fail_ut_i:
-	iput(sdp->sd_sc_inode);
-fail:
+	free_lcl_statfs_inodes(sdp);
 	iput(pn);
 	return error;
 }
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 20554db4ccab..ac5ad16e5c96 100644
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
 
@@ -1560,6 +1560,32 @@ static void gfs2_free_inode(struct inode *inode)
 	kmem_cache_free(gfs2_inode_cachep, GFS2_I(inode));
 }
 
+extern void free_lcl_statfs_inodes(struct gfs2_sbd *sdp)
+{
+	struct lcl_statfs_inode *lsi, *safe;
+
+	list_for_each_entry_safe(lsi, safe, &sdp->sd_sc_inodes_list, si_list) {
+		if (lsi->si_jid == sdp->sd_jdesc->jd_jid)
+			sdp->sd_sc_inode = NULL;
+		if (lsi->si_sc_inode)
+			iput(lsi->si_sc_inode);
+		list_del(&lsi->si_list);
+		kfree(lsi);
+	}
+}
+
+extern struct inode *find_lcl_statfs_inode(struct gfs2_sbd *sdp,
+					    unsigned int index)
+{
+	struct lcl_statfs_inode *lsi;
+
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
index ed4f5cb29074..b3e6ce502108 100644
--- a/fs/gfs2/super.h
+++ b/fs/gfs2/super.h
@@ -44,6 +44,9 @@ extern void update_statfs(struct gfs2_sbd *sdp, struct buffer_head *m_bh,
 extern int gfs2_statfs_sync(struct super_block *sb, int type);
 extern void gfs2_freeze_func(struct work_struct *work);
 
+extern void free_lcl_statfs_inodes(struct gfs2_sbd *sdp);
+extern struct inode *find_lcl_statfs_inode(struct gfs2_sbd *sdp,
+					    unsigned int index);
 extern void free_sbd(struct gfs2_sbd *sdp);
 
 extern struct file_system_type gfs2_fs_type;
-- 
2.20.1

