Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id DB77F3C7640
	for <lists+cluster-devel@lfdr.de>; Tue, 13 Jul 2021 20:10:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626199818;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aE5cJp10KlZJ80QDVoNru+d43cUTWnsaZWNeH/QGZRw=;
	b=d37iFYYDO1oV9H6iafOs8D8URz2Elq6u0gOS6bwrrEprQkQ/qLA1wUm3pr6TC7tJ9PlcLH
	DksBDWvEGT1PmrP/2WL1iCUV9eZ5SE90G15K2Rds1XBJe0fNcO5jfbRpWVl68skGqGRa6U
	KTmzDXGPNP8HZ6OyqgMxwPVXzXUDfes=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-fsBP0a08Mi-kgbBb9Xgomw-1; Tue, 13 Jul 2021 14:10:16 -0400
X-MC-Unique: fsBP0a08Mi-kgbBb9Xgomw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C3E79126F;
	Tue, 13 Jul 2021 18:10:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A79E19C44;
	Tue, 13 Jul 2021 18:10:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 451644EA2F;
	Tue, 13 Jul 2021 18:10:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16DIA5Sl022126 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 13 Jul 2021 14:10:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8D9CB100EB3D; Tue, 13 Jul 2021 18:10:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-12.phx2.redhat.com [10.3.112.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5CFAA100F49F
	for <cluster-devel@redhat.com>; Tue, 13 Jul 2021 18:10:05 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 13 Jul 2021 13:09:55 -0500
Message-Id: <20210713180958.66995-8-rpeterso@redhat.com>
In-Reply-To: <20210713180958.66995-1-rpeterso@redhat.com>
References: <20210713180958.66995-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 07/10] gfs2: Don't release and
	reacquire local statfs bh
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Before this patch, several functions in gfs2 related to the updating
of the statfs file used a newly acquired/read buffer_head for the
local statfs file. This is completely unnecessary, because other nodes
should never update it. Recreating the buffer is a waste of time.

This patch allows gfs2 to read in the local statefs buffer_head at
mount time and keep it around until unmount time.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/aops.c       |  9 ++-------
 fs/gfs2/incore.h     |  1 +
 fs/gfs2/ops_fstype.c |  9 +++++++++
 fs/gfs2/super.c      | 44 ++++++++++++--------------------------------
 fs/gfs2/super.h      |  3 +--
 5 files changed, 25 insertions(+), 41 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index 81d8f064126e..005e920f5d4a 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -574,10 +574,9 @@ void adjust_fs_space(struct inode *inode)
 {
 	struct gfs2_sbd *sdp = GFS2_SB(inode);
 	struct gfs2_inode *m_ip = GFS2_I(sdp->sd_statfs_inode);
-	struct gfs2_inode *l_ip = GFS2_I(sdp->sd_sc_inode);
 	struct gfs2_statfs_change_host *m_sc = &sdp->sd_statfs_master;
 	struct gfs2_statfs_change_host *l_sc = &sdp->sd_statfs_local;
-	struct buffer_head *m_bh, *l_bh;
+	struct buffer_head *m_bh;
 	u64 fs_total, new_free;
 
 	if (gfs2_trans_begin(sdp, 2 * RES_STATFS, 0) != 0)
@@ -600,11 +599,7 @@ void adjust_fs_space(struct inode *inode)
 		(unsigned long long)new_free);
 	gfs2_statfs_change(sdp, new_free, new_free, 0);
 
-	if (gfs2_meta_inode_buffer(l_ip, &l_bh) != 0)
-		goto out2;
-	update_statfs(sdp, m_bh, l_bh);
-	brelse(l_bh);
-out2:
+	update_statfs(sdp, m_bh);
 	brelse(m_bh);
 out:
 	sdp->sd_rindex_uptodate = 0;
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index d5ea955d6a87..6f31a067a5f2 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -767,6 +767,7 @@ struct gfs2_sbd {
 	struct gfs2_glock *sd_jinode_gl;
 
 	struct gfs2_holder sd_sc_gh;
+	struct buffer_head *sd_sc_bh;
 	struct gfs2_holder sd_qc_gh;
 
 	struct completion sd_journal_ready;
diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 0b8229fa0bb8..6a950c4a61e9 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -695,8 +695,16 @@ static int init_statfs(struct gfs2_sbd *sdp)
 		fs_err(sdp, "can't lock local \"sc\" file: %d\n", error);
 		goto free_local;
 	}
+	/* read in the local statfs buffer - other nodes don't change it. */
+	error = gfs2_meta_inode_buffer(ip, &sdp->sd_sc_bh);
+	if (error) {
+		fs_err(sdp, "Cannot read in local statfs: %d\n", error);
+		goto unlock_sd_gh;
+	}
 	return 0;
 
+unlock_sd_gh:
+	gfs2_glock_dq_uninit(&sdp->sd_sc_gh);
 free_local:
 	free_local_statfs_inodes(sdp);
 	iput(pn);
@@ -710,6 +718,7 @@ static int init_statfs(struct gfs2_sbd *sdp)
 static void uninit_statfs(struct gfs2_sbd *sdp)
 {
 	if (!sdp->sd_args.ar_spectator) {
+		brelse(sdp->sd_sc_bh);
 		gfs2_glock_dq_uninit(&sdp->sd_sc_gh);
 		free_local_statfs_inodes(sdp);
 	}
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 2bdbba5ea8d7..0a5b7dfa7a45 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -178,9 +178,8 @@ int gfs2_statfs_init(struct gfs2_sbd *sdp)
 {
 	struct gfs2_inode *m_ip = GFS2_I(sdp->sd_statfs_inode);
 	struct gfs2_statfs_change_host *m_sc = &sdp->sd_statfs_master;
-	struct gfs2_inode *l_ip = GFS2_I(sdp->sd_sc_inode);
 	struct gfs2_statfs_change_host *l_sc = &sdp->sd_statfs_local;
-	struct buffer_head *m_bh, *l_bh;
+	struct buffer_head *m_bh;
 	struct gfs2_holder gh;
 	int error;
 
@@ -199,21 +198,15 @@ int gfs2_statfs_init(struct gfs2_sbd *sdp)
 				      sizeof(struct gfs2_dinode));
 		spin_unlock(&sdp->sd_statfs_spin);
 	} else {
-		error = gfs2_meta_inode_buffer(l_ip, &l_bh);
-		if (error)
-			goto out_m_bh;
-
 		spin_lock(&sdp->sd_statfs_spin);
 		gfs2_statfs_change_in(m_sc, m_bh->b_data +
 				      sizeof(struct gfs2_dinode));
-		gfs2_statfs_change_in(l_sc, l_bh->b_data +
+		gfs2_statfs_change_in(l_sc, sdp->sd_sc_bh->b_data +
 				      sizeof(struct gfs2_dinode));
 		spin_unlock(&sdp->sd_statfs_spin);
 
-		brelse(l_bh);
 	}
 
-out_m_bh:
 	brelse(m_bh);
 out:
 	gfs2_glock_dq_uninit(&gh);
@@ -226,22 +219,17 @@ void gfs2_statfs_change(struct gfs2_sbd *sdp, s64 total, s64 free,
 	struct gfs2_inode *l_ip = GFS2_I(sdp->sd_sc_inode);
 	struct gfs2_statfs_change_host *l_sc = &sdp->sd_statfs_local;
 	struct gfs2_statfs_change_host *m_sc = &sdp->sd_statfs_master;
-	struct buffer_head *l_bh;
 	s64 x, y;
 	int need_sync = 0;
-	int error;
-
-	error = gfs2_meta_inode_buffer(l_ip, &l_bh);
-	if (error)
-		return;
 
-	gfs2_trans_add_meta(l_ip->i_gl, l_bh);
+	gfs2_trans_add_meta(l_ip->i_gl, sdp->sd_sc_bh);
 
 	spin_lock(&sdp->sd_statfs_spin);
 	l_sc->sc_total += total;
 	l_sc->sc_free += free;
 	l_sc->sc_dinodes += dinodes;
-	gfs2_statfs_change_out(l_sc, l_bh->b_data + sizeof(struct gfs2_dinode));
+	gfs2_statfs_change_out(l_sc, sdp->sd_sc_bh->b_data +
+			       sizeof(struct gfs2_dinode));
 	if (sdp->sd_args.ar_statfs_percent) {
 		x = 100 * l_sc->sc_free;
 		y = m_sc->sc_free * sdp->sd_args.ar_statfs_percent;
@@ -250,20 +238,18 @@ void gfs2_statfs_change(struct gfs2_sbd *sdp, s64 total, s64 free,
 	}
 	spin_unlock(&sdp->sd_statfs_spin);
 
-	brelse(l_bh);
 	if (need_sync)
 		gfs2_wake_up_statfs(sdp);
 }
 
-void update_statfs(struct gfs2_sbd *sdp, struct buffer_head *m_bh,
-		   struct buffer_head *l_bh)
+void update_statfs(struct gfs2_sbd *sdp, struct buffer_head *m_bh)
 {
 	struct gfs2_inode *m_ip = GFS2_I(sdp->sd_statfs_inode);
 	struct gfs2_inode *l_ip = GFS2_I(sdp->sd_sc_inode);
 	struct gfs2_statfs_change_host *m_sc = &sdp->sd_statfs_master;
 	struct gfs2_statfs_change_host *l_sc = &sdp->sd_statfs_local;
 
-	gfs2_trans_add_meta(l_ip->i_gl, l_bh);
+	gfs2_trans_add_meta(l_ip->i_gl, sdp->sd_sc_bh);
 	gfs2_trans_add_meta(m_ip->i_gl, m_bh);
 
 	spin_lock(&sdp->sd_statfs_spin);
@@ -271,7 +257,7 @@ void update_statfs(struct gfs2_sbd *sdp, struct buffer_head *m_bh,
 	m_sc->sc_free += l_sc->sc_free;
 	m_sc->sc_dinodes += l_sc->sc_dinodes;
 	memset(l_sc, 0, sizeof(struct gfs2_statfs_change));
-	memset(l_bh->b_data + sizeof(struct gfs2_dinode),
+	memset(sdp->sd_sc_bh->b_data + sizeof(struct gfs2_dinode),
 	       0, sizeof(struct gfs2_statfs_change));
 	gfs2_statfs_change_out(m_sc, m_bh->b_data + sizeof(struct gfs2_dinode));
 	spin_unlock(&sdp->sd_statfs_spin);
@@ -281,11 +267,10 @@ int gfs2_statfs_sync(struct super_block *sb, int type)
 {
 	struct gfs2_sbd *sdp = sb->s_fs_info;
 	struct gfs2_inode *m_ip = GFS2_I(sdp->sd_statfs_inode);
-	struct gfs2_inode *l_ip = GFS2_I(sdp->sd_sc_inode);
 	struct gfs2_statfs_change_host *m_sc = &sdp->sd_statfs_master;
 	struct gfs2_statfs_change_host *l_sc = &sdp->sd_statfs_local;
 	struct gfs2_holder gh;
-	struct buffer_head *m_bh, *l_bh;
+	struct buffer_head *m_bh;
 	int error;
 
 	error = gfs2_glock_nq_init(m_ip->i_gl, LM_ST_EXCLUSIVE, GL_NOCACHE,
@@ -306,21 +291,15 @@ int gfs2_statfs_sync(struct super_block *sb, int type)
 	}
 	spin_unlock(&sdp->sd_statfs_spin);
 
-	error = gfs2_meta_inode_buffer(l_ip, &l_bh);
-	if (error)
-		goto out_bh;
-
 	error = gfs2_trans_begin(sdp, 2 * RES_DINODE, 0);
 	if (error)
-		goto out_bh2;
+		goto out_bh;
 
-	update_statfs(sdp, m_bh, l_bh);
+	update_statfs(sdp, m_bh);
 	sdp->sd_statfs_force_sync = 0;
 
 	gfs2_trans_end(sdp);
 
-out_bh2:
-	brelse(l_bh);
 out_bh:
 	brelse(m_bh);
 out_unlock:
@@ -626,6 +605,7 @@ static void gfs2_put_super(struct super_block *sb)
 			gfs2_glock_dq_uninit(&sdp->sd_journal_gh);
 		if (gfs2_holder_initialized(&sdp->sd_jinode_gh))
 			gfs2_glock_dq_uninit(&sdp->sd_jinode_gh);
+		brelse(sdp->sd_sc_bh);
 		gfs2_glock_dq_uninit(&sdp->sd_sc_gh);
 		gfs2_glock_dq_uninit(&sdp->sd_qc_gh);
 		free_local_statfs_inodes(sdp);
diff --git a/fs/gfs2/super.h b/fs/gfs2/super.h
index ec4affb33ed5..58d13fd77aed 100644
--- a/fs/gfs2/super.h
+++ b/fs/gfs2/super.h
@@ -43,8 +43,7 @@ extern void gfs2_statfs_change_in(struct gfs2_statfs_change_host *sc,
 				  const void *buf);
 extern void gfs2_statfs_change_out(const struct gfs2_statfs_change_host *sc,
 				   void *buf);
-extern void update_statfs(struct gfs2_sbd *sdp, struct buffer_head *m_bh,
-			  struct buffer_head *l_bh);
+extern void update_statfs(struct gfs2_sbd *sdp, struct buffer_head *m_bh);
 extern int gfs2_statfs_sync(struct super_block *sb, int type);
 extern void gfs2_freeze_func(struct work_struct *work);
 
-- 
2.31.1

