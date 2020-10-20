Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id ED4E2294425
	for <lists+cluster-devel@lfdr.de>; Tue, 20 Oct 2020 22:58:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603227502;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uTH/8FDEEeMolNYDMpvT4eSUtbV+2chW0fMlQfLFT5k=;
	b=GRd3xlSEspC4IEqUEbavH7adIt7s7AC9ZTBZcBEgzMwsgkHooKhwuZwdqXADTw5ILaVMf0
	7ehlxkncY/N7kRULF0u+jFQVBkdKheebzR0FVGyiD/gPSmq5UZRyq/+Xm5JSC+e31kR1b8
	73NjzgmNg2yWNQdSePm74JoRvWdfs0g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-FAdgrk56N86lUkR9BPci9Q-1; Tue, 20 Oct 2020 16:58:20 -0400
X-MC-Unique: FAdgrk56N86lUkR9BPci9Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06BA85708B;
	Tue, 20 Oct 2020 20:58:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 737456266E;
	Tue, 20 Oct 2020 20:58:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 56A4B180B65D;
	Tue, 20 Oct 2020 20:58:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09KKwAwq004648 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 20 Oct 2020 16:58:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5F13755770; Tue, 20 Oct 2020 20:58:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from radium.msp.redhat.com (radium.msp.redhat.com [10.15.80.88])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2F1D76266E
	for <cluster-devel@redhat.com>; Tue, 20 Oct 2020 20:58:10 +0000 (UTC)
From: Abhi Das <adas@redhat.com>
To: cluster-devel@redhat.com
Date: Tue, 20 Oct 2020 15:58:05 -0500
Message-Id: <20201020205805.5705-4-adas@redhat.com>
In-Reply-To: <20201020205805.5705-1-adas@redhat.com>
References: <20201020205805.5705-1-adas@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v3 3/3] gfs2: Recover statfs info in journal
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Apply the outstanding statfs changes in the journal head to the
master statfs file. Zero out the local statfs file for good measure.

Previously, statfs updates would be read in from the local statfs inode and
synced to the master statfs inode during recovery.

We now use the statfs updates in the journal head to update the master statfs
inode instead of reading in from the local statfs inode. To preserve backward
compatibility with kernels that can't do this, we still need to keep the
local statfs inode up to date by writing changes to it. At some point in the
future, we can do away with the local statfs inodes altogether and keep the
statfs changes solely in the journal.

Signed-off-by: Abhi Das <adas@redhat.com>
---
 fs/gfs2/lops.c     |   2 +-
 fs/gfs2/lops.h     |   1 +
 fs/gfs2/recovery.c | 104 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 106 insertions(+), 1 deletion(-)

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
index a8bb17e355b8..caaa35bd6349 100644
--- a/fs/gfs2/recovery.c
+++ b/fs/gfs2/recovery.c
@@ -296,6 +296,109 @@ static void gfs2_recovery_done(struct gfs2_sbd *sdp, unsigned int jid,
 		sdp->sd_lockstruct.ls_ops->lm_recovery_result(sdp, jid, message);
 }
 
+/**
+ * update_statfs_inode - Update the master statfs inode or zero out the local
+ *                       statfs inode for a given journal.
+ * @jd: The journal
+ * @head: If NULL, @inode is the local statfs inode and we need to zero it out.
+ *        Otherwise, it @head contains the statfs change info that needs to be
+ *        synced to the master statfs inode (pointed to by @inode).
+ * @inode: statfs inode to update.
+ */
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
+	if (head) { /* Update the master statfs inode */
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
+	} else { /* Zeroing out the local statfs inode */
+		memset(bh->b_data + sizeof(struct gfs2_dinode), 0,
+		       sizeof(struct gfs2_statfs_change));
+		/* If it's our own journal, reset any in-memory changes too */
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
+/**
+ * recover_local_statfs - Update the master and local statfs changes for this
+ *                        journal.
+ *
+ * Previously, statfs updates would be read in from the local statfs inode and
+ * synced to the master statfs inode during recovery.
+ *
+ * We now use the statfs updates in the journal head to update the master statfs
+ * inode instead of reading in from the local statfs inode. To preserve backward
+ * compatibility with kernels that can't do this, we still need to keep the
+ * local statfs inode up to date by writing changes to it. At some point in the
+ * future, we can do away with the local statfs inodes altogether and keep the
+ * statfs changes solely in the journal.
+ *
+ * @jd: the journal
+ * @head: the journal head
+ *
+ * Returns: errno
+ */
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
+	 /* First update the master statfs inode with the changes we
+	  * found in the journal. */
+	error = update_statfs_inode(jd, head, sdp->sd_statfs_inode);
+	if (error)
+		goto out;
+
+zero_local:
+	/* Zero out the local statfs inode so any changes in there
+	 * are not re-recovered. */
+	error = update_statfs_inode(jd, NULL,
+				    find_lcl_statfs_inode(sdp, jd->jd_jid));
+out:
+	return;
+}
+
 void gfs2_recover_func(struct work_struct *work)
 {
 	struct gfs2_jdesc *jd = container_of(work, struct gfs2_jdesc, jd_work);
@@ -415,6 +518,7 @@ void gfs2_recover_func(struct work_struct *work)
 				goto fail_gunlock_thaw;
 		}
 
+		recover_local_statfs(jd, &head);
 		clean_journal(jd, &head);
 		up_read(&sdp->sd_log_flush_lock);
 
-- 
2.20.1

