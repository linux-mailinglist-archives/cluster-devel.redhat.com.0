Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C2E72CB9A
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Jun 2023 18:34:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686587643;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7EJlx/w5/NemMstC1VBza7fAI8r8LcrPruU9dvkRl0c=;
	b=YokefuWPa8Zh0Js5i5uDX5x+00zIj8vhrXc0KTnTkc8HlLkN4PBpljz7y5JkbXUxyck4t/
	uxHKcwpvbU/qKdx21uK5ejr9xtAk7nBHxNwdxcUqCVENaflfl4Vy6rwSOwwg75TO2zOQhY
	zEuKxpMFmUP6O8DqIFi6M2/0WPCmuqo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-OP-V8du3NtiUPYEOJWH9pg-1; Mon, 12 Jun 2023 12:33:56 -0400
X-MC-Unique: OP-V8du3NtiUPYEOJWH9pg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8F3C803791;
	Mon, 12 Jun 2023 16:33:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BE4B8422DE;
	Mon, 12 Jun 2023 16:33:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A39C719465B9;
	Mon, 12 Jun 2023 16:33:55 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 663B3194658C for <cluster-devel@listman.corp.redhat.com>;
 Mon, 12 Jun 2023 16:33:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4709720234B4; Mon, 12 Jun 2023 16:33:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (unknown [10.45.224.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B9EF52026834;
 Mon, 12 Jun 2023 16:33:53 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 12 Jun 2023 18:33:46 +0200
Message-Id: <20230612163347.1293077-8-agruenba@redhat.com>
In-Reply-To: <20230612163347.1293077-1-agruenba@redhat.com>
References: <20230612163347.1293077-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Cluster-devel] [PATCH 7/8] gfs2: Replace sd_freeze_state with
 SDF_FROZEN flag
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Replace sd_freeze_state with a new SDF_FROZEN flag.

There no longer is a need for indicating that a freeze is in progress
(SDF_STARTING_FREEZE); we are now protecting the critical sections with
the sd_freeze_mutex.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/incore.h     |  8 +-------
 fs/gfs2/log.c        |  9 ++++-----
 fs/gfs2/ops_fstype.c |  1 -
 fs/gfs2/recovery.c   |  2 +-
 fs/gfs2/super.c      | 25 +++++++++----------------
 fs/gfs2/sys.c        |  2 ++
 fs/gfs2/trans.c      |  3 +--
 7 files changed, 18 insertions(+), 32 deletions(-)

diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 1f10529ebcf5..8b1b50d19de1 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -608,12 +608,7 @@ enum {
 					 withdrawing */
 	SDF_DEACTIVATING	= 15,
 	SDF_EVICTING		= 16,
-};
-
-enum gfs2_freeze_state {
-	SFS_UNFROZEN		= 0,
-	SFS_STARTING_FREEZE	= 1,
-	SFS_FROZEN		= 2,
+	SDF_FROZEN		= 17,
 };
 
 #define GFS2_FSNAME_LEN		256
@@ -841,7 +836,6 @@ struct gfs2_sbd {
 
 	/* For quiescing the filesystem */
 	struct gfs2_holder sd_freeze_gh;
-	atomic_t sd_freeze_state;
 	struct mutex sd_freeze_mutex;
 
 	char sd_fsname[GFS2_FSNAME_LEN + 3 * sizeof(int) + 2];
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index dca535311dee..aa568796207c 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -914,9 +914,8 @@ void gfs2_write_log_header(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd,
 static void log_write_header(struct gfs2_sbd *sdp, u32 flags)
 {
 	blk_opf_t op_flags = REQ_PREFLUSH | REQ_FUA | REQ_META | REQ_SYNC;
-	enum gfs2_freeze_state state = atomic_read(&sdp->sd_freeze_state);
 
-	gfs2_assert_withdraw(sdp, (state != SFS_FROZEN));
+	gfs2_assert_withdraw(sdp, !test_bit(SDF_FROZEN, &sdp->sd_flags));
 
 	if (test_bit(SDF_NOBARRIERS, &sdp->sd_flags)) {
 		gfs2_ordered_wait(sdp);
@@ -1036,7 +1035,7 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 {
 	struct gfs2_trans *tr = NULL;
 	unsigned int reserved_blocks = 0, used_blocks = 0;
-	enum gfs2_freeze_state state = atomic_read(&sdp->sd_freeze_state);
+	bool frozen = test_bit(SDF_FROZEN, &sdp->sd_flags);
 	unsigned int first_log_head;
 	unsigned int reserved_revokes = 0;
 
@@ -1067,7 +1066,7 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 		if (tr) {
 			sdp->sd_log_tr = NULL;
 			tr->tr_first = first_log_head;
-			if (unlikely (state == SFS_FROZEN)) {
+			if (unlikely(frozen)) {
 				if (gfs2_assert_withdraw_delayed(sdp,
 				       !tr->tr_num_buf_new && !tr->tr_num_databuf_new))
 					goto out_withdraw;
@@ -1092,7 +1091,7 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 	if (flags & GFS2_LOG_HEAD_FLUSH_SHUTDOWN)
 		clear_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
 
-	if (unlikely(state == SFS_FROZEN))
+	if (unlikely(frozen))
 		if (gfs2_assert_withdraw_delayed(sdp, !reserved_revokes))
 			goto out_withdraw;
 
diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 4ce5718719ac..24acd17e530c 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -135,7 +135,6 @@ static struct gfs2_sbd *init_sbd(struct super_block *sb)
 	init_rwsem(&sdp->sd_log_flush_lock);
 	atomic_set(&sdp->sd_log_in_flight, 0);
 	init_waitqueue_head(&sdp->sd_log_flush_wait);
-	atomic_set(&sdp->sd_freeze_state, SFS_UNFROZEN);
 	mutex_init(&sdp->sd_freeze_mutex);
 
 	return sdp;
diff --git a/fs/gfs2/recovery.c b/fs/gfs2/recovery.c
index afeda936e2be..9c7a9f640bad 100644
--- a/fs/gfs2/recovery.c
+++ b/fs/gfs2/recovery.c
@@ -467,7 +467,7 @@ void gfs2_recover_func(struct work_struct *work)
 	if (!(head.lh_flags & GFS2_LOG_HEAD_UNMOUNT)) {
 		mutex_lock(&sdp->sd_freeze_mutex);
 
-		if (atomic_read(&sdp->sd_freeze_state) != SFS_UNFROZEN) {
+		if (test_bit(SDF_FROZEN, &sdp->sd_flags)) {
 			mutex_unlock(&sdp->sd_freeze_mutex);
 			fs_warn(sdp, "jid=%u: Can't replay: filesystem "
 				"is frozen\n", jd->jd_jid);
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index eb41ab32695a..828297e9cbca 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -689,26 +689,19 @@ static int gfs2_freeze_locally(struct gfs2_sbd *sdp)
 	struct super_block *sb = sdp->sd_vfs;
 	int error;
 
-	atomic_set(&sdp->sd_freeze_state, SFS_STARTING_FREEZE);
-
 	error = freeze_super(sb);
 	if (error)
-		goto fail;
+		return error;
 
 	if (test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags)) {
 		gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_FREEZE |
 			       GFS2_LFC_FREEZE_GO_SYNC);
 		if (gfs2_withdrawn(sdp)) {
 			thaw_super(sb);
-			error = -EIO;
-			goto fail;
+			return -EIO;
 		}
 	}
 	return 0;
-
-fail:
-	atomic_set(&sdp->sd_freeze_state, SFS_UNFROZEN);
-	return error;
 }
 
 static int gfs2_do_thaw(struct gfs2_sbd *sdp)
@@ -737,7 +730,7 @@ void gfs2_freeze_func(struct work_struct *work)
 
 	mutex_lock(&sdp->sd_freeze_mutex);
 	error = -EBUSY;
-	if (atomic_read(&sdp->sd_freeze_state) != SFS_UNFROZEN)
+	if (test_bit(SDF_FROZEN, &sdp->sd_flags))
 		goto out_unlock;
 
 	error = gfs2_freeze_locally(sdp);
@@ -745,13 +738,13 @@ void gfs2_freeze_func(struct work_struct *work)
 		goto out_unlock;
 
 	gfs2_freeze_unlock(&sdp->sd_freeze_gh);
-	atomic_set(&sdp->sd_freeze_state, SFS_FROZEN);
+	set_bit(SDF_FROZEN, &sdp->sd_flags);
 
 	error = gfs2_do_thaw(sdp);
 	if (error)
 		goto out;
 
-	atomic_set(&sdp->sd_freeze_state, SFS_UNFROZEN);
+	clear_bit(SDF_FROZEN, &sdp->sd_flags);
 
 out_unlock:
 	mutex_unlock(&sdp->sd_freeze_mutex);
@@ -775,7 +768,7 @@ static int gfs2_freeze_super(struct super_block *sb)
 	if (!mutex_trylock(&sdp->sd_freeze_mutex))
 		return -EBUSY;
 	error = -EBUSY;
-	if (atomic_read(&sdp->sd_freeze_state) != SFS_UNFROZEN)
+	if (test_bit(SDF_FROZEN, &sdp->sd_flags))
 		goto out;
 
 	for (;;) {
@@ -810,7 +803,7 @@ static int gfs2_freeze_super(struct super_block *sb)
 out:
 	if (!error) {
 		set_bit(SDF_FREEZE_INITIATOR, &sdp->sd_flags);
-		atomic_set(&sdp->sd_freeze_state, SFS_FROZEN);
+		set_bit(SDF_FROZEN, &sdp->sd_flags);
 	}
 	mutex_unlock(&sdp->sd_freeze_mutex);
 	return error;
@@ -839,7 +832,7 @@ static int gfs2_thaw_super(struct super_block *sb)
 
 	if (!error) {
 		clear_bit(SDF_FREEZE_INITIATOR, &sdp->sd_flags);
-		atomic_set(&sdp->sd_freeze_state, SFS_UNFROZEN);
+		clear_bit(SDF_FROZEN, &sdp->sd_flags);
 	}
 out:
 	mutex_unlock(&sdp->sd_freeze_mutex);
@@ -861,7 +854,7 @@ void gfs2_thaw_freeze_initiator(struct super_block *sb)
 	if (error)
 		fs_info(sdp, "GFS2: couldn't thaw filesystem: %d\n", error);
 	clear_bit(SDF_FREEZE_INITIATOR, &sdp->sd_flags);
-	atomic_set(&sdp->sd_freeze_state, SFS_UNFROZEN);
+	clear_bit(SDF_FROZEN, &sdp->sd_flags);
 #endif
 
 out:
diff --git a/fs/gfs2/sys.c b/fs/gfs2/sys.c
index bc752de01573..2dfbe2f188dd 100644
--- a/fs/gfs2/sys.c
+++ b/fs/gfs2/sys.c
@@ -82,6 +82,7 @@ static ssize_t status_show(struct gfs2_sbd *sdp, char *buf)
 		     "RO Recovery:              %d\n"
 		     "Skip DLM Unlock:          %d\n"
 		     "Force AIL Flush:          %d\n"
+		     "FS Freeze Initiator:      %d\n"
 		     "FS Frozen:                %d\n"
 		     "Withdrawing:              %d\n"
 		     "Withdraw In Prog:         %d\n"
@@ -112,6 +113,7 @@ static ssize_t status_show(struct gfs2_sbd *sdp, char *buf)
 		     test_bit(SDF_SKIP_DLM_UNLOCK, &f),
 		     test_bit(SDF_FORCE_AIL_FLUSH, &f),
 		     test_bit(SDF_FREEZE_INITIATOR, &f),
+		     test_bit(SDF_FROZEN, &f),
 		     test_bit(SDF_WITHDRAWING, &f),
 		     test_bit(SDF_WITHDRAW_IN_PROG, &f),
 		     test_bit(SDF_REMOTE_WITHDRAW, &f),
diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index 63fec11ef2ce..ec1631257978 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -233,7 +233,6 @@ void gfs2_trans_add_meta(struct gfs2_glock *gl, struct buffer_head *bh)
 	struct gfs2_bufdata *bd;
 	struct gfs2_meta_header *mh;
 	struct gfs2_trans *tr = current->journal_info;
-	enum gfs2_freeze_state state = atomic_read(&sdp->sd_freeze_state);
 
 	lock_buffer(bh);
 	if (buffer_pinned(bh)) {
@@ -267,7 +266,7 @@ void gfs2_trans_add_meta(struct gfs2_glock *gl, struct buffer_head *bh)
 		       (unsigned long long)bd->bd_bh->b_blocknr);
 		BUG();
 	}
-	if (unlikely(state == SFS_FROZEN)) {
+	if (unlikely(test_bit(SDF_FROZEN, &sdp->sd_flags))) {
 		fs_info(sdp, "GFS2:adding buf while frozen\n");
 		gfs2_assert_withdraw(sdp, 0);
 	}
-- 
2.40.0

