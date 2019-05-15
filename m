Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CF21FB1E
	for <lists+cluster-devel@lfdr.de>; Wed, 15 May 2019 21:40:05 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1A5C988E61;
	Wed, 15 May 2019 19:40:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0128F79408;
	Wed, 15 May 2019 19:40:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C31675B425;
	Wed, 15 May 2019 19:40:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4FJcUJZ029134 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 May 2019 15:38:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5076160FAE; Wed, 15 May 2019 19:38:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-119.phx2.redhat.com [10.3.116.119])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1AB7A60F9C
	for <cluster-devel@redhat.com>; Wed, 15 May 2019 19:38:30 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 15 May 2019 14:38:13 -0500
Message-Id: <20190515193818.7642-21-rpeterso@redhat.com>
In-Reply-To: <20190515193818.7642-1-rpeterso@redhat.com>
References: <20190515193818.7642-1-rpeterso@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 v4 PATCH 20/25] gfs2: Add verbose option to
	check_journal_clean
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Wed, 15 May 2019 19:40:04 +0000 (UTC)

Before this patch, function check_journal_clean would give messages
related to journal recovery. That's fine for mount time, but when a
node withdraws and forces replay that way, we don't want all those
distracting and misleading messages. This patch adds a new parameter
to make those messages optional.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/ops_fstype.c |  2 +-
 fs/gfs2/util.c       | 23 ++++++++++++++++-------
 fs/gfs2/util.h       |  4 +++-
 3 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 464d365bd3f5..c4031719fbaa 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -691,7 +691,7 @@ static int init_journal(struct gfs2_sbd *sdp, int undo)
 			struct gfs2_jdesc *jd = gfs2_jdesc_find(sdp, x);
 
 			if (sdp->sd_args.ar_spectator) {
-				error = check_journal_clean(sdp, jd);
+				error = check_journal_clean(sdp, jd, true);
 				if (error)
 					goto fail_jinode_gh;
 				continue;
diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index a3f214ce779e..34c6baa9d6e5 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -48,7 +48,8 @@ void gfs2_assert_i(struct gfs2_sbd *sdp)
  *
  * Returns: 0 if the journal is clean or locked, else an error
  */
-int check_journal_clean(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd)
+int check_journal_clean(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd,
+			bool verbose)
 {
 	int error;
 	struct gfs2_holder j_gh;
@@ -59,23 +60,31 @@ int check_journal_clean(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd)
 	error = gfs2_glock_nq_init(ip->i_gl, LM_ST_SHARED, LM_FLAG_NOEXP |
 				   GL_EXACT | GL_NOCACHE, &j_gh);
 	if (error) {
-		fs_err(sdp, "Error locking journal for spectator mount.\n");
+		if (verbose)
+			fs_err(sdp, "Error %d locking journal for spectator "
+			       "mount.\n", error);
 		return -EPERM;
 	}
 	error = gfs2_jdesc_check(jd);
 	if (error) {
-		fs_err(sdp, "Error checking journal for spectator mount.\n");
+		if (verbose)
+			fs_err(sdp, "Error checking journal for spectator "
+			       "mount.\n");
 		goto out_unlock;
 	}
 	error = gfs2_find_jhead(jd, &head, false);
 	if (error) {
-		fs_err(sdp, "Error parsing journal for spectator mount.\n");
+		if (verbose)
+			fs_err(sdp, "Error parsing journal for spectator "
+			       "mount.\n");
 		goto out_unlock;
 	}
 	if (!(head.lh_flags & GFS2_LOG_HEAD_UNMOUNT)) {
 		error = -EPERM;
-		fs_err(sdp, "jid=%u: Journal is dirty, so the first mounter "
-		       "must not be a spectator.\n", jd->jd_jid);
+		if (verbose)
+			fs_err(sdp, "jid=%u: Journal is dirty, so the first "
+			       "mounter must not be a spectator.\n",
+			       jd->jd_jid);
 	}
 
 out_unlock:
@@ -174,7 +183,7 @@ static void signal_our_withdraw(struct gfs2_sbd *sdp)
 
 	/* Now wait until recovery complete. */
 	for (tries = 0; tries < 10; tries++) {
-		ret = check_journal_clean(sdp, sdp->sd_jdesc);
+		ret = check_journal_clean(sdp, sdp->sd_jdesc, false);
 		if (!ret)
 			break;
 		msleep(HZ);
diff --git a/fs/gfs2/util.h b/fs/gfs2/util.h
index e3539ceda1ca..6f333325d4ac 100644
--- a/fs/gfs2/util.h
+++ b/fs/gfs2/util.h
@@ -131,7 +131,9 @@ static inline void gfs2_metatype_set(struct buffer_head *bh, u16 type,
 
 int gfs2_io_error_i(struct gfs2_sbd *sdp, const char *function,
 		    char *file, unsigned int line);
-int check_journal_clean(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd);
+
+extern int check_journal_clean(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd,
+			       bool verbose);
 
 #define gfs2_io_error(sdp) \
 gfs2_io_error_i((sdp), __func__, __FILE__, __LINE__);
-- 
2.20.1

