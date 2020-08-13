Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 04E4D243F91
	for <lists+cluster-devel@lfdr.de>; Thu, 13 Aug 2020 22:01:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597348892;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=egqEg4lz6g4Ogb0Z5paWLqml/mQ2s2FrXQbdzEwF1L4=;
	b=Iz4vebbUfhckK2UTDUNIsAICjDhdfDp+N6npGznwcKBYUjBKMWL05HC79BqdGBCml3fMS7
	WXLIDI/afd2oKvuBnoZKhkZBdbgj0txTc4qivd+FJTaUweStMMUMxM7eBUeCe/1zQzlaHF
	vT16q8h7GRh6o54h5x+dtpoHzk/8tro=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-8NYaoWnMN9KFb840xUcrQw-1; Thu, 13 Aug 2020 16:01:28 -0400
X-MC-Unique: 8NYaoWnMN9KFb840xUcrQw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B22D318B9F4B;
	Thu, 13 Aug 2020 20:01:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A13155D990;
	Thu, 13 Aug 2020 20:01:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8B5851826D2A;
	Thu, 13 Aug 2020 20:01:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07DK1JDt024975 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 13 Aug 2020 16:01:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E05335D9F3; Thu, 13 Aug 2020 20:01:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from radium.msp.redhat.com (radium.msp.redhat.com [10.15.80.88])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B20CC5D9D2
	for <cluster-devel@redhat.com>; Thu, 13 Aug 2020 20:01:19 +0000 (UTC)
From: Abhi Das <adas@redhat.com>
To: cluster-devel@redhat.com
Date: Thu, 13 Aug 2020 15:01:14 -0500
Message-Id: <20200813200114.5665-4-adas@redhat.com>
In-Reply-To: <20200813200114.5665-1-adas@redhat.com>
References: <20200813200114.5665-1-adas@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 3/3] gfs2: Recover statfs info in journal
	head
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
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Apply the outstanding statfs changes in the journal head to the
master statfs file. Zero out the local statfs file for good measure.

Signed-off-by: Abhi Das <adas@redhat.com>
---
 fs/gfs2/lops.c     |   2 +-
 fs/gfs2/lops.h     |   1 +
 fs/gfs2/recovery.c | 121 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 123 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index 53d2dbf6605e..061747b959c8 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -831,7 +831,7 @@ static int buf_lo_scan_elements(struct gfs2_jdesc *jd, u32 start,
  *
  */
 
-static void gfs2_meta_sync(struct gfs2_glock *gl)
+void gfs2_meta_sync(struct gfs2_glock *gl)
 {
 	struct address_space *mapping = gfs2_glock2aspace(gl);
 	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
diff --git a/fs/gfs2/lops.h b/fs/gfs2/lops.h
index 9c5e4e491e03..4a3d8aecdf82 100644
--- a/fs/gfs2/lops.h
+++ b/fs/gfs2/lops.h
@@ -27,6 +27,7 @@ extern void gfs2_log_submit_bio(struct bio **biop, int opf);
 extern void gfs2_pin(struct gfs2_sbd *sdp, struct buffer_head *bh);
 extern int gfs2_find_jhead(struct gfs2_jdesc *jd,
 			   struct gfs2_log_header_host *head, bool keep_cache);
+extern void gfs2_meta_sync(struct gfs2_glock *gl);
 
 static inline unsigned int buf_limit(struct gfs2_sbd *sdp)
 {
diff --git a/fs/gfs2/recovery.c b/fs/gfs2/recovery.c
index a8bb17e355b8..428a0aad49c6 100644
--- a/fs/gfs2/recovery.c
+++ b/fs/gfs2/recovery.c
@@ -296,6 +296,126 @@ static void gfs2_recovery_done(struct gfs2_sbd *sdp, unsigned int jid,
 		sdp->sd_lockstruct.ls_ops->lm_recovery_result(sdp, jid, message);
 }
 
+static int lookup_statfs_inodes(struct gfs2_jdesc *jd, struct inode **master,
+				struct inode **local)
+{
+	int error = 0;
+	char buf[30];
+	struct gfs2_sbd *sdp = GFS2_SB(jd->jd_inode);
+	struct inode *md = d_inode(sdp->sd_master_dir), *pn;
+
+	*master = gfs2_lookup_simple(md, "statfs");
+	if (IS_ERR(*master)) {
+		error = PTR_ERR(*master);
+		fs_err(sdp, "Can't read in statfs inode: %d\n", error);
+		goto out;
+	}
+	pn = gfs2_lookup_simple(md, "per_node");
+	if (IS_ERR(pn)) {
+		error = PTR_ERR(pn);
+		fs_err(sdp, "Can't find per_node directory: %d\n", error);
+		goto put_m_ip;
+	}
+	sprintf(buf, "statfs_change%u", jd->jd_jid);
+	*local = gfs2_lookup_simple(pn, buf);
+	if (IS_ERR(*local)) {
+		error = PTR_ERR(*local);
+		fs_err(sdp, "Can't find local \"sc\" file for jid:%u: %d\n",
+		       jd->jd_jid, error);
+	}
+	iput(pn);
+	if (!error)
+		return error;
+put_m_ip:
+	iput(*master);
+out:
+	return error;
+}
+
+static int update_statfs_inode(struct gfs2_jdesc *jd, struct gfs2_inode *ip,
+			       struct gfs2_log_header_host *head)
+{
+	/*
+	 * If head is NULL, ip points to a local statfs file.
+	 * zero out the statfs data in the inode pointed to by ip.
+	 */
+	struct gfs2_sbd *sdp = GFS2_SB(jd->jd_inode);
+	struct gfs2_statfs_change_host sc;
+	struct gfs2_holder gh;
+	struct buffer_head *bh;
+	int error = 0;
+
+	error = gfs2_glock_nq_init(ip->i_gl, LM_ST_EXCLUSIVE, GL_NOCACHE, &gh);
+	if (error)
+		goto out;
+
+	error = gfs2_meta_inode_buffer(ip, &bh);
+	if (error)
+		goto out_unlock;
+
+	spin_lock(&sdp->sd_statfs_spin);
+	if (head) {
+		gfs2_statfs_change_in(&sc, bh->b_data + sizeof(struct gfs2_dinode));
+		sc.sc_total += head->lh_local_total;
+		sc.sc_free += head->lh_local_free;
+		sc.sc_dinodes += head->lh_local_dinodes;
+		gfs2_statfs_change_out(&sc, bh->b_data + sizeof(struct gfs2_dinode));
+		fs_info(sdp, "jid=%u: Updated master statfs Total:%lld, "
+			"Free:%lld, Dinodes:%lld after change "
+			"[%+lld,%+lld,%+lld]\n", jd->jd_jid, sc.sc_total,
+			sc.sc_free, sc.sc_dinodes, head->lh_local_total,
+			head->lh_local_free, head->lh_local_dinodes);
+	} else {
+		memset(bh->b_data + sizeof(struct gfs2_dinode), 0,
+		       sizeof(struct gfs2_statfs_change));
+		if (jd->jd_jid == sdp->sd_lockstruct.ls_jid) { /* This node's journal */
+			sdp->sd_statfs_local.sc_total = 0;
+			sdp->sd_statfs_local.sc_free = 0;
+			sdp->sd_statfs_local.sc_dinodes = 0;
+		}
+	}
+	spin_unlock(&sdp->sd_statfs_spin);
+	mark_buffer_dirty(bh);
+	brelse(bh);
+	gfs2_meta_sync(ip->i_gl);
+
+out_unlock:
+	gfs2_glock_dq_uninit(&gh);
+out:
+	return error;
+}
+
+static void recover_local_statfs(struct gfs2_jdesc *jd,
+				 struct gfs2_log_header_host *head)
+{
+	struct gfs2_sbd *sdp = GFS2_SB(jd->jd_inode);
+	struct inode *master = NULL, *local = NULL;
+	int error;
+
+	if (!head->lh_local_total && !head->lh_local_free
+	    && !head->lh_local_dinodes) /* No change */
+		goto out;
+
+	error = lookup_statfs_inodes(jd, &master, &local);
+	if (error)
+		goto out;
+	error = update_statfs_inode(jd, GFS2_I(master), head);
+	if (error)
+		goto iput_inodes;
+	error = update_statfs_inode(jd, GFS2_I(local), NULL);
+	if (error)
+		goto iput_inodes;
+	if (jd->jd_jid == sdp->sd_lockstruct.ls_jid)
+		memset(&sdp->sd_statfs_local, 0,
+		       sizeof(struct gfs2_statfs_change_host));
+
+iput_inodes:
+	iput(master);
+	iput(local);
+out:
+	return;
+}
+
 void gfs2_recover_func(struct work_struct *work)
 {
 	struct gfs2_jdesc *jd = container_of(work, struct gfs2_jdesc, jd_work);
@@ -415,6 +535,7 @@ void gfs2_recover_func(struct work_struct *work)
 				goto fail_gunlock_thaw;
 		}
 
+		recover_local_statfs(jd, &head);
 		clean_journal(jd, &head);
 		up_read(&sdp->sd_log_flush_lock);
 
-- 
2.20.1

