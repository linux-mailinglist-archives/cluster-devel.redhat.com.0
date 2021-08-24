Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 78C663F67D4
	for <lists+cluster-devel@lfdr.de>; Tue, 24 Aug 2021 19:39:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629826775;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UBK8ZGXQ0j3xaQ39YOt65JNosHYdvoP4FTbpen9sVnc=;
	b=VMZs8kcFccGyu3Tqt53wuAyw6E4wGJhOU3UTHpT92IiUtuODwD20jt1OS0e8E7is7rxlmw
	WO+Q1F2bxxv7F6+3zcpVCTktXiVQj9SNoljzOUi83q7cga9ShVA9ZTV7q42N+q9LvCFseL
	2u3d7XCAipQyzI/O78mmFvr6alhgt+s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-a-4Vl3GaNoascpv79PeeQQ-1; Tue, 24 Aug 2021 13:39:34 -0400
X-MC-Unique: a-4Vl3GaNoascpv79PeeQQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BDDD801A92;
	Tue, 24 Aug 2021 17:39:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A3BF93AC1;
	Tue, 24 Aug 2021 17:39:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D9B3B181A0F8;
	Tue, 24 Aug 2021 17:39:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17OHdP4m022043 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 24 Aug 2021 13:39:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 731EB5C25A; Tue, 24 Aug 2021 17:39:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-114-176.phx2.redhat.com [10.3.114.176])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 41E5A5C1A3
	for <cluster-devel@redhat.com>; Tue, 24 Aug 2021 17:39:22 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 24 Aug 2021 12:39:22 -0500
Message-Id: <20210824173922.154369-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: Fix broken freeze_go_xmote_bh
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

The freeze glock is used in several places whenever a gfs2 file system
is frozen, thawed, mounted, unmounted, remounted, or withdrawn. It is
used to prevent those things from clashing with one another.

The freeze glock is sometimes held with a "live" journal (In other words
SDF_JOURNAL_LIVE is set, meaning the journal is actively in use) and
sometimes not. For example, a journal is live when gfs2_reconfigure locks
the freeze lock for transitions from rw to ro ("remount -o remount,ro")
but it is not live when gfs2_fill_super calls gfs2_freeze_lock before
gfs2_make_fs_rw sets SDF_JOURNAL_LIVE at first mount time.

Function freeze_go_xmote_bh, which is called when the freeze glock is
held, checks to make sure the journal assigned to the cluster node is
clean: IOW, if the log ends with an UNMOUNT log header (LH). If it does,
all is well. If not, the file system is withdrawn: it cannot be used
until the journal is recovered (or fscked) and made clean again.

Before this patch, freeze_go_xmote_bh only checked if the journal was
clean in cases where the journal was "live" (SDF_JOURNAL_LIVE is set)
meaning the journal is actively being used. That's sometimes wrong
because if the journal is live, any transaction guarantees the journal
is not clean: gfs2_find_jhead will never find an unmount LH at the end.

Most of the time this was not a problem because during these transitions
(for example, remount from ro to rw) there are usually no transactions
pending. However, if transactions were pending, for example, during
"remount -o ro", as per xfstests generic/294, it would fail.

On the other hand, if the journal was not live, the check for a clean
journal was skipped. That's exactly when we need to do this check.
However, the problem was never noticed because gfs2_make_fs_rw had
redundant code for the exact same checks as freeze_go_xmote_bh, and
therefore it did not matter that the check was skipped in
freeze_go_xmote_bh.

This patch attempts to clean up the mess by removing the redundant code
from gfs2_make_fs_rw and changing the callers of gfs2_freeze_lock to
specify whether they need the journal checked for consistency:
If the journal consistency check is unwanted, they specify GL_SKIP in
the holder. If the check is needed, they do not specify GL_SKIP.

Most callers determine if the consistency check is needed based on if
the journal is being transitioned from "not live" to "live": If it is
becoming live, the check is needed, otherwise it is not.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glops.c      | 31 ++++++++++++++++++++-----------
 fs/gfs2/ops_fstype.c |  5 +++--
 fs/gfs2/recovery.c   |  3 ++-
 fs/gfs2/super.c      | 34 ++++++++++++----------------------
 4 files changed, 37 insertions(+), 36 deletions(-)

diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 6d0770564493..8ae2f33e014e 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -609,18 +609,27 @@ static int freeze_go_xmote_bh(struct gfs2_holder *gh)
 	struct gfs2_log_header_host head;
 	int error;
 
-	if (test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags)) {
-		j_gl->gl_ops->go_inval(j_gl, DIO_METADATA);
+	if (gh->gh_flags & GL_SKIP)
+		return 0;
 
-		error = gfs2_find_jhead(sdp->sd_jdesc, &head, false);
-		if (gfs2_assert_withdraw_delayed(sdp, !error))
-			return error;
-		if (gfs2_assert_withdraw_delayed(sdp, head.lh_flags &
-						 GFS2_LOG_HEAD_UNMOUNT))
-			return -EIO;
-		sdp->sd_log_sequence = head.lh_sequence + 1;
-		gfs2_log_pointers_init(sdp, head.lh_blkno);
-	}
+	/*
+	 * If our journal is truly live, rw, it is guaranteed to be dirty.
+	 * If our journal is ro, and we are soon to make it live, we need to
+	 * check whether it was cleanly unmounted. If not, we withdraw.
+	 */
+	if (gfs2_assert_withdraw_delayed(sdp,
+				 !test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags)))
+		return -EIO;
+	j_gl->gl_ops->go_inval(j_gl, DIO_METADATA);
+
+	error = gfs2_find_jhead(sdp->sd_jdesc, &head, false);
+	if (gfs2_assert_withdraw_delayed(sdp, !error))
+		return error;
+	if (gfs2_assert_withdraw_delayed(sdp, head.lh_flags &
+					 GFS2_LOG_HEAD_UNMOUNT))
+		return -EIO;
+	sdp->sd_log_sequence = head.lh_sequence + 1;
+	gfs2_log_pointers_init(sdp, head.lh_blkno);
 	return 0;
 }
 
diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 7f8410d8fdc1..6f4be312bd34 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -1263,7 +1263,7 @@ static int gfs2_fill_super(struct super_block *sb, struct fs_context *fc)
 		}
 	}
 
-	error = gfs2_freeze_lock(sdp, &freeze_gh, 0);
+	error = gfs2_freeze_lock(sdp, &freeze_gh, sb_rdonly(sb) ? GL_SKIP : 0);
 	if (error)
 		goto fail_per_node;
 
@@ -1584,7 +1584,8 @@ static int gfs2_reconfigure(struct fs_context *fc)
 	if ((sb->s_flags ^ fc->sb_flags) & SB_RDONLY) {
 		struct gfs2_holder freeze_gh;
 
-		error = gfs2_freeze_lock(sdp, &freeze_gh, 0);
+		error = gfs2_freeze_lock(sdp, &freeze_gh,
+				 fc->sb_flags & SB_RDONLY ? GL_SKIP : 0);
 		if (error)
 			return -EINVAL;
 
diff --git a/fs/gfs2/recovery.c b/fs/gfs2/recovery.c
index 016ed1b2ca1d..be0037da3bb4 100644
--- a/fs/gfs2/recovery.c
+++ b/fs/gfs2/recovery.c
@@ -472,7 +472,8 @@ void gfs2_recover_func(struct work_struct *work)
 
 		/* Acquire a shared hold on the freeze lock */
 
-		error = gfs2_freeze_lock(sdp, &thaw_gh, LM_FLAG_PRIORITY);
+		error = gfs2_freeze_lock(sdp, &thaw_gh, LM_FLAG_PRIORITY |
+					 GL_SKIP);
 		if (error)
 			goto fail_gunlock_ji;
 
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 6e00d15ef0a8..fe6cea188199 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -128,28 +128,8 @@ int gfs2_jdesc_check(struct gfs2_jdesc *jd)
 
 int gfs2_make_fs_rw(struct gfs2_sbd *sdp)
 {
-	struct gfs2_inode *ip = GFS2_I(sdp->sd_jdesc->jd_inode);
-	struct gfs2_glock *j_gl = ip->i_gl;
-	struct gfs2_log_header_host head;
 	int error;
 
-	j_gl->gl_ops->go_inval(j_gl, DIO_METADATA);
-	if (gfs2_withdrawn(sdp))
-		return -EIO;
-
-	error = gfs2_find_jhead(sdp->sd_jdesc, &head, false);
-	if (error || gfs2_withdrawn(sdp))
-		return error;
-
-	if (!(head.lh_flags & GFS2_LOG_HEAD_UNMOUNT)) {
-		gfs2_consist(sdp);
-		return -EIO;
-	}
-
-	/*  Initialize some head of the log stuff  */
-	sdp->sd_log_sequence = head.lh_sequence + 1;
-	gfs2_log_pointers_init(sdp, head.lh_blkno);
-
 	error = gfs2_quota_init(sdp);
 	if (!error && !gfs2_withdrawn(sdp))
 		set_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
@@ -346,7 +326,8 @@ static int gfs2_lock_fs_check_clean(struct gfs2_sbd *sdp)
 	}
 
 	error = gfs2_glock_nq_init(sdp->sd_freeze_gl, LM_ST_EXCLUSIVE,
-				   LM_FLAG_NOEXP, &sdp->sd_freeze_gh);
+				   LM_FLAG_NOEXP | GL_SKIP,
+				   &sdp->sd_freeze_gh);
 	if (error)
 		goto out;
 
@@ -654,7 +635,16 @@ void gfs2_freeze_func(struct work_struct *work)
 	struct super_block *sb = sdp->sd_vfs;
 
 	atomic_inc(&sb->s_active);
-	error = gfs2_freeze_lock(sdp, &freeze_gh, 0);
+	/*
+	 * Here we take the freeze lock in SH to wait until a freeze operation
+	 * (that began with gfs2_freeze's call to gfs2_lock_fs_check_clean
+	 * which takes the freeze gl in EX) has been thawed. Function
+	 * gfs2_lock_fs_check_clean checks that all the journals are clean,
+	 * so we don't need to do it again with this gfs2_freeze_lock.
+	 * In fact, our journal is live when this glock is granted, so the
+	 * freeze_go_xmote_bh will withdraw unless we specify GL_SKIP.
+	 */
+	error = gfs2_freeze_lock(sdp, &freeze_gh, GL_SKIP);
 	if (error) {
 		gfs2_assert_withdraw(sdp, 0);
 	} else {
-- 
2.31.1

