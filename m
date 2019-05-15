Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 599E61FB14
	for <lists+cluster-devel@lfdr.de>; Wed, 15 May 2019 21:39:52 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 04630C00E0DD;
	Wed, 15 May 2019 19:39:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E08511972D;
	Wed, 15 May 2019 19:39:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BBBED5B425;
	Wed, 15 May 2019 19:39:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4FJcXhG029183 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 May 2019 15:38:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3095460FAE; Wed, 15 May 2019 19:38:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-119.phx2.redhat.com [10.3.116.119])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F0CB260FB1
	for <cluster-devel@redhat.com>; Wed, 15 May 2019 19:38:30 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 15 May 2019 14:38:15 -0500
Message-Id: <20190515193818.7642-23-rpeterso@redhat.com>
In-Reply-To: <20190515193818.7642-1-rpeterso@redhat.com>
References: <20190515193818.7642-1-rpeterso@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 v4 PATCH 22/25] gfs2: Check if holding freeze
	glock when making fs ro
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Wed, 15 May 2019 19:39:51 +0000 (UTC)

If gfs2 withdraws the file system due to errors, such as being unable
to write to the journals, we withdraw. When we withdraw, we try to
change the file system to read-only by calling gfs2_make_fs_ro so
that the appropriate items are synced and flushed. However, if the
withdraw occurs while we're mounting the file system, i.e., trying to
make the file system rw (from gfs2_make_fs_rw) we're already holding
the freeze glock, we'd have a recursive glock error.

This patch introduces checks for withdraw in gfs2_make_fs_rw and also
checks for already holding the freeze glock in gfs2_make_fs_ro.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/super.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 1253fcf35910..d3f6e9a61c13 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -426,9 +426,13 @@ int gfs2_make_fs_rw(struct gfs2_sbd *sdp)
 		goto fail_threads;
 
 	j_gl->gl_ops->go_inval(j_gl, DIO_METADATA);
+	if (gfs2_withdrawn(sdp)) {
+		error = -EIO;
+		goto fail;
+	}
 
 	error = gfs2_find_jhead(sdp->sd_jdesc, &head, false);
-	if (error)
+	if (error || gfs2_withdrawn(sdp))
 		goto fail;
 
 	if (!(head.lh_flags & GFS2_LOG_HEAD_UNMOUNT)) {
@@ -442,7 +446,7 @@ int gfs2_make_fs_rw(struct gfs2_sbd *sdp)
 	gfs2_log_pointers_init(sdp, head.lh_blkno);
 
 	error = gfs2_quota_init(sdp);
-	if (error)
+	if (error || gfs2_withdrawn(sdp))
 		goto fail;
 
 	set_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
@@ -854,19 +858,20 @@ int gfs2_make_fs_ro(struct gfs2_sbd *sdp, int withdrawing)
 {
 	struct gfs2_holder freeze_gh;
 	int flags = GL_NOCACHE;
-	int error;
+	int error = 0;
 
 	if (withdrawing)
 		flags |= LM_FLAG_TRY;
 	gfs2_holder_mark_uninitialized(&freeze_gh);
-	error = gfs2_glock_nq_init(sdp->sd_freeze_gl, LM_ST_SHARED, flags,
-				   &freeze_gh);
-	if (error == GLR_TRYFAILED)
-		error = 0;
-
-	if (error && !gfs2_withdrawn(sdp))
-		return error;
-
+	if (!withdrawing || !gfs2_glock_is_locked_by_me(sdp->sd_freeze_gl)) {
+		error = gfs2_glock_nq_init(sdp->sd_freeze_gl, LM_ST_SHARED,
+					   flags, &freeze_gh);
+		if (error == GLR_TRYFAILED)
+			error = 0;
+
+		if (error && !gfs2_withdrawn(sdp))
+			return error;
+	}
 	flush_workqueue(gfs2_delete_workqueue);
 
 	if (current == sdp->sd_quotad_process)
-- 
2.20.1

