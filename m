Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B679D2CDA05
	for <lists+cluster-devel@lfdr.de>; Thu,  3 Dec 2020 16:23:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607008980;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fyHhkJSkyBess1XdCChS5Ti8lqGTkdEpe1oNG6OWW7c=;
	b=PwZ1l0PF5Bwwgt0vY9BEEPRR+6NprJD30qS9on4jNYPBKpc6HJdI8//NVX73YpavdXPjPK
	YKpflEF75ZPlXvxPnfqf8dI8G8J4bu8gzV/rnYkaOnTgJFRb0ZRInMKLZqYUt8DQ0QJlA+
	qi/SxDBDKpXfAni/P9AZhWspCkuzZyM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-eT5MXWJ6PdqGq5LczKMlwA-1; Thu, 03 Dec 2020 10:22:58 -0500
X-MC-Unique: eT5MXWJ6PdqGq5LczKMlwA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FD641005504;
	Thu,  3 Dec 2020 15:22:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA22B5D6AC;
	Thu,  3 Dec 2020 15:22:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D6E1E4E58E;
	Thu,  3 Dec 2020 15:22:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B3FMp4v024319 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 10:22:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EF570189A5; Thu,  3 Dec 2020 15:22:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-72.phx2.redhat.com [10.3.112.72])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C19586064B
	for <cluster-devel@redhat.com>; Thu,  3 Dec 2020 15:22:51 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu,  3 Dec 2020 09:22:41 -0600
Message-Id: <20201203152241.71617-3-rpeterso@redhat.com>
In-Reply-To: <20201203152241.71617-1-rpeterso@redhat.com>
References: <20201203152241.71617-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [RHEL7.9.z PATCH 2/2] gfs2: move freeze glock
	outside the make_fs_rw and _ro functions
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

Before this patch, sister functions gfs2_make_fs_rw and gfs2_make_fs_ro locked
(held) the freeze glock by calling gfs2_freeze_lock and gfs2_freeze_unlock.
The problem is, not all the callers of gfs2_make_fs_ro should be doing this.
The three callers of gfs2_make_fs_ro are: remount (gfs2_reconfigure),
signal_our_withdraw, and unmount (gfs2_put_super). But when unmounting the
file system we can get into the following circular lock dependency:

deactivate_super
   down_write(&s->s_umount); <-------------------------------------- s_umount
   deactivate_locked_super
      gfs2_kill_sb
         kill_block_super
            generic_shutdown_super
               gfs2_put_super
                  gfs2_make_fs_ro
                     gfs2_glock_nq_init sd_freeze_gl
                        freeze_go_sync
                           if (freeze glock in SH)
                              freeze_super (vfs)
                                 down_write(&sb->s_umount); <------- s_umount

This patch moves the hold of the freeze glock outside the two sister rw/ro
functions to their callers, but it doesn't request the glock from
gfs2_put_super, thus eliminating the circular dependency.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/ops_fstype.c | 31 +++++++++++++++++--------------
 fs/gfs2/super.c      | 22 ----------------------
 fs/gfs2/util.c       | 15 +++++++++++++--
 3 files changed, 30 insertions(+), 38 deletions(-)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 4ee56f5e93cb..f2c6bbe5cdb8 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -1084,6 +1084,7 @@ static int gfs2_fill_super(struct super_block *sb, struct fs_context *fc)
 	int silent = fc->sb_flags & SB_SILENT;
 	struct gfs2_sbd *sdp;
 	struct gfs2_holder mount_gh;
+	struct gfs2_holder freeze_gh;
 	int error;
 
 	sdp = init_sbd(sb);
@@ -1195,23 +1196,18 @@ static int gfs2_fill_super(struct super_block *sb, struct fs_context *fc)
 		goto fail_per_node;
 	}
 
-	if (sb_rdonly(sb)) {
-		struct gfs2_holder freeze_gh;
+	error = gfs2_freeze_lock(sdp, &freeze_gh, 0);
+	if (error)
+		goto fail_per_node;
 
-		error = gfs2_freeze_lock(sdp, &freeze_gh, 0);
-		if (error) {
-			fs_err(sdp, "can't make FS RO: %d\n", error);
-			goto fail_per_node;
-		}
-		gfs2_freeze_unlock(&freeze_gh);
-	} else {
+	if (!sb_rdonly(sb))
 		error = gfs2_make_fs_rw(sdp);
-		if (error) {
-			fs_err(sdp, "can't make FS RW: %d\n", error);
-			goto fail_per_node;
-		}
-	}
 
+	gfs2_freeze_unlock(&freeze_gh);
+	if (error) {
+		fs_err(sdp, "can't make FS RW: %d\n", error);
+		goto fail_per_node;
+	}
 	gfs2_glock_dq_uninit(&mount_gh);
 	gfs2_online_uevent(sdp);
 	return 0;
@@ -1512,6 +1508,12 @@ static int gfs2_reconfigure(struct fs_context *fc)
 		fc->sb_flags |= SB_RDONLY;
 
 	if ((sb->s_flags ^ fc->sb_flags) & SB_RDONLY) {
+		struct gfs2_holder freeze_gh;
+
+		error = gfs2_freeze_lock(sdp, &freeze_gh, 0);
+		if (error)
+			return -EINVAL;
+
 		if (fc->sb_flags & SB_RDONLY) {
 			error = gfs2_make_fs_ro(sdp);
 			if (error)
@@ -1521,6 +1523,7 @@ static int gfs2_reconfigure(struct fs_context *fc)
 			if (error)
 				errorfc(fc, "unable to remount read-write");
 		}
+		gfs2_freeze_unlock(&freeze_gh);
 	}
 	sdp->sd_args = *newargs;
 
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 801361a05e6f..754ea2a137b4 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -165,7 +165,6 @@ int gfs2_make_fs_rw(struct gfs2_sbd *sdp)
 {
 	struct gfs2_inode *ip = GFS2_I(sdp->sd_jdesc->jd_inode);
 	struct gfs2_glock *j_gl = ip->i_gl;
-	struct gfs2_holder freeze_gh;
 	struct gfs2_log_header_host head;
 	int error;
 
@@ -173,10 +172,6 @@ int gfs2_make_fs_rw(struct gfs2_sbd *sdp)
 	if (error)
 		return error;
 
-	error = gfs2_freeze_lock(sdp, &freeze_gh, 0);
-	if (error)
-		goto fail_threads;
-
 	j_gl->gl_ops->go_inval(j_gl, DIO_METADATA);
 	if (gfs2_withdrawn(sdp)) {
 		error = -EIO;
@@ -203,13 +198,9 @@ int gfs2_make_fs_rw(struct gfs2_sbd *sdp)
 
 	set_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
 
-	gfs2_freeze_unlock(&freeze_gh);
-
 	return 0;
 
 fail:
-	gfs2_freeze_unlock(&freeze_gh);
-fail_threads:
 	if (sdp->sd_quotad_process)
 		kthread_stop(sdp->sd_quotad_process);
 	sdp->sd_quotad_process = NULL;
@@ -607,20 +598,9 @@ static void gfs2_dirty_inode(struct inode *inode, int flags)
 
 int gfs2_make_fs_ro(struct gfs2_sbd *sdp)
 {
-	struct gfs2_holder freeze_gh;
 	int error = 0;
 	int log_write_allowed = test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
 
-	gfs2_holder_mark_uninitialized(&freeze_gh);
-	if (sdp->sd_freeze_gl) {
-		error = gfs2_freeze_lock(sdp, &freeze_gh,
-					 log_write_allowed ? 0 : LM_FLAG_TRY);
-		if (error == GLR_TRYFAILED)
-			error = 0;
-		if (error && !gfs2_withdrawn(sdp))
-			return error;
-	}
-
 	gfs2_flush_delete_work(sdp);
 	if (!log_write_allowed && current == sdp->sd_quotad_process)
 		fs_warn(sdp, "The quotad daemon is withdrawing.\n");
@@ -649,8 +629,6 @@ int gfs2_make_fs_ro(struct gfs2_sbd *sdp)
 				   atomic_read(&sdp->sd_reserving_log) == 0,
 				   HZ * 5);
 	}
-	gfs2_freeze_unlock(&freeze_gh);
-
 	gfs2_quota_cleanup(sdp);
 
 	if (!log_write_allowed)
diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index 9022ea1f5d50..02f7a7ec7a31 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -132,6 +132,7 @@ static void signal_our_withdraw(struct gfs2_sbd *sdp)
 	struct inode *inode = sdp->sd_jdesc->jd_inode;
 	struct gfs2_inode *ip = GFS2_I(inode);
 	u64 no_formal_ino = ip->i_no_formal_ino;
+	int log_write_allowed = test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
 	int ret = 0;
 	int tries;
 
@@ -152,8 +153,18 @@ static void signal_our_withdraw(struct gfs2_sbd *sdp)
 	 * therefore we need to clear SDF_JOURNAL_LIVE manually.
 	 */
 	clear_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
-	if (!sb_rdonly(sdp->sd_vfs))
-		ret = gfs2_make_fs_ro(sdp);
+	if (!sb_rdonly(sdp->sd_vfs)) {
+		struct gfs2_holder freeze_gh;
+
+		ret = gfs2_freeze_lock(sdp, &freeze_gh,
+				       log_write_allowed ? 0 : LM_FLAG_TRY);
+		if (ret == GLR_TRYFAILED)
+			ret = 0;
+		if (!ret) {
+			ret = gfs2_make_fs_ro(sdp);
+			gfs2_freeze_unlock(&freeze_gh);
+		}
+	}
 
 	if (sdp->sd_lockstruct.ls_ops->lm_lock == NULL) { /* lock_nolock */
 		if (!ret)
-- 
2.28.0

