Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D4E10303
	for <lists+cluster-devel@lfdr.de>; Wed,  1 May 2019 01:03:31 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4B767309267B;
	Tue, 30 Apr 2019 23:03:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3620917500;
	Tue, 30 Apr 2019 23:03:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 147A93FB16;
	Tue, 30 Apr 2019 23:03:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3UN3OLp023018 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Apr 2019 19:03:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9252781742; Tue, 30 Apr 2019 23:03:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-20.phx2.redhat.com [10.3.116.20])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6BB517C850
	for <cluster-devel@redhat.com>; Tue, 30 Apr 2019 23:03:24 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 30 Apr 2019 17:03:10 -0600
Message-Id: <20190430230319.10375-11-rpeterso@redhat.com>
In-Reply-To: <20190430230319.10375-1-rpeterso@redhat.com>
References: <20190430230319.10375-1-rpeterso@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH v3 10/19] gfs2: move
	check_journal_clean to util.c for future use
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Tue, 30 Apr 2019 23:03:30 +0000 (UTC)

Before this patch function check_journal_clean was in ops_fstype.c.
This patch moves it to util.c so we can make use of it elsewhere
in a future patch.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/ops_fstype.c | 42 -----------------------------------------
 fs/gfs2/util.c       | 45 ++++++++++++++++++++++++++++++++++++++++++++
 fs/gfs2/util.h       |  1 +
 3 files changed, 46 insertions(+), 42 deletions(-)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 075f64075ff6..8a09f3aa609c 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -590,48 +590,6 @@ static int gfs2_jindex_hold(struct gfs2_sbd *sdp, struct gfs2_holder *ji_gh)
 	return error;
 }
 
-/**
- * check_journal_clean - Make sure a journal is clean for a spectator mount
- * @sdp: The GFS2 superblock
- * @jd: The journal descriptor
- *
- * Returns: 0 if the journal is clean or locked, else an error
- */
-static int check_journal_clean(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd)
-{
-	int error;
-	struct gfs2_holder j_gh;
-	struct gfs2_log_header_host head;
-	struct gfs2_inode *ip;
-
-	ip = GFS2_I(jd->jd_inode);
-	error = gfs2_glock_nq_init(ip->i_gl, LM_ST_SHARED, LM_FLAG_NOEXP |
-				   GL_EXACT | GL_NOCACHE, &j_gh);
-	if (error) {
-		fs_err(sdp, "Error locking journal for spectator mount.\n");
-		return -EPERM;
-	}
-	error = gfs2_jdesc_check(jd);
-	if (error) {
-		fs_err(sdp, "Error checking journal for spectator mount.\n");
-		goto out_unlock;
-	}
-	error = gfs2_find_jhead(jd, &head);
-	if (error) {
-		fs_err(sdp, "Error parsing journal for spectator mount.\n");
-		goto out_unlock;
-	}
-	if (!(head.lh_flags & GFS2_LOG_HEAD_UNMOUNT)) {
-		error = -EPERM;
-		fs_err(sdp, "jid=%u: Journal is dirty, so the first mounter "
-		       "must not be a spectator.\n", jd->jd_jid);
-	}
-
-out_unlock:
-	gfs2_glock_dq_uninit(&j_gh);
-	return error;
-}
-
 static int init_journal(struct gfs2_sbd *sdp, int undo)
 {
 	struct inode *master = d_inode(sdp->sd_master_dir);
diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index 7eaea6dfe1cf..398d3cedb1a4 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -19,7 +19,10 @@
 #include "gfs2.h"
 #include "incore.h"
 #include "glock.h"
+#include "lops.h"
+#include "recovery.h"
 #include "rgrp.h"
+#include "super.h"
 #include "util.h"
 
 struct kmem_cache *gfs2_glock_cachep __read_mostly;
@@ -36,6 +39,48 @@ void gfs2_assert_i(struct gfs2_sbd *sdp)
 	fs_emerg(sdp, "fatal assertion failed\n");
 }
 
+/**
+ * check_journal_clean - Make sure a journal is clean for a spectator mount
+ * @sdp: The GFS2 superblock
+ * @jd: The journal descriptor
+ *
+ * Returns: 0 if the journal is clean or locked, else an error
+ */
+int check_journal_clean(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd)
+{
+	int error;
+	struct gfs2_holder j_gh;
+	struct gfs2_log_header_host head;
+	struct gfs2_inode *ip;
+
+	ip = GFS2_I(jd->jd_inode);
+	error = gfs2_glock_nq_init(ip->i_gl, LM_ST_SHARED, LM_FLAG_NOEXP |
+				   GL_EXACT | GL_NOCACHE, &j_gh);
+	if (error) {
+		fs_err(sdp, "Error locking journal for spectator mount.\n");
+		return -EPERM;
+	}
+	error = gfs2_jdesc_check(jd);
+	if (error) {
+		fs_err(sdp, "Error checking journal for spectator mount.\n");
+		goto out_unlock;
+	}
+	error = gfs2_find_jhead(jd, &head);
+	if (error) {
+		fs_err(sdp, "Error parsing journal for spectator mount.\n");
+		goto out_unlock;
+	}
+	if (!(head.lh_flags & GFS2_LOG_HEAD_UNMOUNT)) {
+		error = -EPERM;
+		fs_err(sdp, "jid=%u: Journal is dirty, so the first mounter "
+		       "must not be a spectator.\n", jd->jd_jid);
+	}
+
+out_unlock:
+	gfs2_glock_dq_uninit(&j_gh);
+	return error;
+}
+
 int gfs2_lm_withdraw(struct gfs2_sbd *sdp, const char *fmt, ...)
 {
 	struct lm_lockstruct *ls = &sdp->sd_lockstruct;
diff --git a/fs/gfs2/util.h b/fs/gfs2/util.h
index 0df65555545f..49d46865dceb 100644
--- a/fs/gfs2/util.h
+++ b/fs/gfs2/util.h
@@ -131,6 +131,7 @@ static inline void gfs2_metatype_set(struct buffer_head *bh, u16 type,
 
 int gfs2_io_error_i(struct gfs2_sbd *sdp, const char *function,
 		    char *file, unsigned int line);
+int check_journal_clean(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd);
 
 #define gfs2_io_error(sdp) \
 gfs2_io_error_i((sdp), __func__, __FILE__, __LINE__);
-- 
2.20.1

