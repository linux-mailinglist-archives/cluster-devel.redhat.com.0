Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3C4B6277EAB
	for <lists+cluster-devel@lfdr.de>; Fri, 25 Sep 2020 05:46:43 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601005602;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Yzy40BHPlD/BcTJxspCGXJkAUz9LLYUqztLIrxAQxXQ=;
	b=Q2pvDQsLUg1QYyj38hUgawWQE57xsXojiSt/0zromkOPrkIh3aGuWeTJKGSoN8JXHGKgAv
	csGZ6FmkbByWAHUJMtECkwpZMVdKburchbAjw32eX/KTIFHwaYaJkP4QbFkJ/72jdescQe
	bBsEg0bljNL+KGCO7llrpTvzEu8+gYw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-ravy_r_6O-m18JcMGzd-lQ-1; Thu, 24 Sep 2020 23:46:39 -0400
X-MC-Unique: ravy_r_6O-m18JcMGzd-lQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D06381074663;
	Fri, 25 Sep 2020 03:46:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C06457882D;
	Fri, 25 Sep 2020 03:46:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 051EA79DBA;
	Fri, 25 Sep 2020 03:46:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08P3kUt9028426 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 23:46:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C6E6278828; Fri, 25 Sep 2020 03:46:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from radium.msp.redhat.com (radium.msp.redhat.com [10.15.80.88])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 96C6A702E7
	for <cluster-devel@redhat.com>; Fri, 25 Sep 2020 03:46:30 +0000 (UTC)
From: Abhi Das <adas@redhat.com>
To: cluster-devel@redhat.com
Date: Thu, 24 Sep 2020 22:46:25 -0500
Message-Id: <20200925034625.56517-4-adas@redhat.com>
In-Reply-To: <20200925034625.56517-1-adas@redhat.com>
References: <20200925034625.56517-1-adas@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v2 3/3] gfs2: Recover statfs info in journal
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Apply the outstanding statfs changes in the journal head to the
master statfs file. Zero out the local statfs file for good measure.

Signed-off-by: Abhi Das <adas@redhat.com>
---
 fs/gfs2/lops.c     |  2 +-
 fs/gfs2/lops.h     |  1 +
 fs/gfs2/recovery.c | 71 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index ed1da4323967..ed69298dd824 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -823,7 +823,7 @@ static int buf_lo_scan_elements(struct gfs2_jdesc *jd, u32 start,
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
index a8bb17e355b8..21661c5e497e 100644
--- a/fs/gfs2/recovery.c
+++ b/fs/gfs2/recovery.c
@@ -296,6 +296,76 @@ static void gfs2_recovery_done(struct gfs2_sbd *sdp, unsigned int jid,
 		sdp->sd_lockstruct.ls_ops->lm_recovery_result(sdp, jid, message);
 }
 
+static int update_statfs_inode(struct gfs2_jdesc *jd,
+			       struct gfs2_log_header_host *head,
+			       struct inode *inode)
+{
+	struct gfs2_sbd *sdp = GFS2_SB(jd->jd_inode);
+	struct gfs2_inode *ip;
+	struct buffer_head *bh;
+	struct gfs2_statfs_change_host sc;
+	int error = 0;
+
+	BUG_ON(!inode);
+	ip = GFS2_I(inode);
+
+	error = gfs2_meta_inode_buffer(ip, &bh);
+	if (error)
+		goto out;
+
+	spin_lock(&sdp->sd_statfs_spin);
+
+	if (head) { /* Updating the master statfs inode */
+		gfs2_statfs_change_in(&sc, bh->b_data + sizeof(struct gfs2_dinode));
+		sc.sc_total += head->lh_local_total;
+		sc.sc_free += head->lh_local_free;
+		sc.sc_dinodes += head->lh_local_dinodes;
+		gfs2_statfs_change_out(&sc, bh->b_data + sizeof(struct gfs2_dinode));
+
+		fs_info(sdp, "jid=%u: Updated master statfs Total:%lld, "
+			"Free:%lld, Dinodes:%lld after change "
+			"[%+lld,%+lld,%+lld]\n", jd->jd_jid, sc.sc_total,
+			sc.sc_free, sc.sc_dinodes, head->lh_local_total,
+			head->lh_local_free, head->lh_local_dinodes);
+	} else { /* Zeroing out one of the local statfs inodes */
+		memset(bh->b_data + sizeof(struct gfs2_dinode), 0,
+		       sizeof(struct gfs2_statfs_change));
+		if (jd->jd_jid == sdp->sd_lockstruct.ls_jid) {
+			memset(&sdp->sd_statfs_local, 0,
+			       sizeof(struct gfs2_statfs_change_host));
+		}
+	}
+	spin_unlock(&sdp->sd_statfs_spin);
+
+	mark_buffer_dirty(bh);
+	brelse(bh);
+	gfs2_meta_sync(ip->i_gl);
+
+out:
+	return error;
+}
+
+static void recover_local_statfs(struct gfs2_jdesc *jd,
+				 struct gfs2_log_header_host *head)
+{
+	int error;
+	struct gfs2_sbd *sdp = GFS2_SB(jd->jd_inode);
+
+	if (!head->lh_local_total && !head->lh_local_free
+	    && !head->lh_local_dinodes) /* No change */
+		goto zero_local;
+
+	error = update_statfs_inode(jd, head, sdp->sd_statfs_inode);
+	if (error)
+		goto out;
+
+zero_local:
+	error = update_statfs_inode(jd, NULL,
+				    find_lcl_statfs_inode(sdp, jd->jd_jid));
+out:
+	return;
+}
+
 void gfs2_recover_func(struct work_struct *work)
 {
 	struct gfs2_jdesc *jd = container_of(work, struct gfs2_jdesc, jd_work);
@@ -415,6 +485,7 @@ void gfs2_recover_func(struct work_struct *work)
 				goto fail_gunlock_thaw;
 		}
 
+		recover_local_statfs(jd, &head);
 		clean_journal(jd, &head);
 		up_read(&sdp->sd_log_flush_lock);
 
-- 
2.20.1

