Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FB31030C
	for <lists+cluster-devel@lfdr.de>; Wed,  1 May 2019 01:03:34 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7FEAE59468;
	Tue, 30 Apr 2019 23:03:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6830C1001E95;
	Tue, 30 Apr 2019 23:03:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4382318089C9;
	Tue, 30 Apr 2019 23:03:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3UN3QDQ023096 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Apr 2019 19:03:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E547981742; Tue, 30 Apr 2019 23:03:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-20.phx2.redhat.com [10.3.116.20])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BBAC47C850
	for <cluster-devel@redhat.com>; Tue, 30 Apr 2019 23:03:26 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 30 Apr 2019 17:03:19 -0600
Message-Id: <20190430230319.10375-20-rpeterso@redhat.com>
In-Reply-To: <20190430230319.10375-1-rpeterso@redhat.com>
References: <20190430230319.10375-1-rpeterso@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH v3 19/19] gfs2: Do log_flush in
	gfs2_ail_empty_gl even if ail list is empty
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Tue, 30 Apr 2019 23:03:33 +0000 (UTC)

Before this patch, if gfs2_ail_empty_gl saw there was nothing on
the ail list, it would return and not flush the log. The problem
is that there could still be a revoke for the rgrp sitting on the
sd_log_le_revoke list that's been recently taken off the ail list.
But that revoke still needs to be written, and the rgrp_go_inval
still needs to call log_flush_wait to ensure the revokes are all
properly written to the journal before we relinquish control of
the glock to another node. If we give the glock to another node
before we have this knowledge, the node might crash and its journal
replayed, in which case the missing revoke would allow the journal
replay to replay the rgrp over top of the rgrp we already gave to
another node, thus overwriting its changes and corrupting the
file system.

This patch makes gfs2_ail_empty_gl still call gfs2_log_flush rather
than returning.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glops.c | 26 +++++++++++++++++++++++++-
 fs/gfs2/log.c   |  2 +-
 fs/gfs2/log.h   |  1 +
 3 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index ff50013c6aa9..1cd2a3c69d63 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -93,8 +93,31 @@ static void gfs2_ail_empty_gl(struct gfs2_glock *gl)
 	INIT_LIST_HEAD(&tr.tr_databuf);
 	tr.tr_revokes = atomic_read(&gl->gl_ail_count);
 
-	if (!tr.tr_revokes)
+	if (!tr.tr_revokes) {
+		/**
+		 * We have nothing on the ail, but there could be revokes on
+		 * the sdp revoke queue, in which case, we still want to flush
+		 * the log and wait for it to finish.
+		 *
+		 * If the sdp revoke list is empty too, we might still have an
+		 * io outstanding for writing revokes, so we should wait for
+		 * it before returning.
+		 *
+		 * If none of these conditions are true, our revokes are all
+		 * flushed and we can return.
+		 */
+		gfs2_log_lock(sdp);
+		if (test_bit(GLF_REVOKES, &gl->gl_flags)) {
+			gfs2_log_unlock(sdp);
+			goto flush;
+		} else if (atomic_read(&sdp->sd_log_in_flight)) {
+			gfs2_log_unlock(sdp);
+			log_flush_wait(sdp);
+		} else {
+			gfs2_log_unlock(sdp);
+		}
 		return;
+	}
 
 	/* A shortened, inline version of gfs2_trans_begin()
          * tr->alloced is not set since the transaction structure is
@@ -109,6 +132,7 @@ static void gfs2_ail_empty_gl(struct gfs2_glock *gl)
 	__gfs2_ail_flush(gl, 0, tr.tr_revokes);
 
 	gfs2_trans_end(sdp);
+flush:
 	gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_NORMAL |
 		       GFS2_LFC_AIL_EMPTY_GL);
 }
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 732b585f33be..a6c83cdf4e1b 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -522,7 +522,7 @@ static void log_pull_tail(struct gfs2_sbd *sdp, unsigned int new_tail)
 }
 
 
-static void log_flush_wait(struct gfs2_sbd *sdp)
+void log_flush_wait(struct gfs2_sbd *sdp)
 {
 	DEFINE_WAIT(wait);
 
diff --git a/fs/gfs2/log.h b/fs/gfs2/log.h
index 7a34a3234266..cd1581bff293 100644
--- a/fs/gfs2/log.h
+++ b/fs/gfs2/log.h
@@ -76,6 +76,7 @@ extern void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl,
 			   u32 type);
 extern void gfs2_log_commit(struct gfs2_sbd *sdp, struct gfs2_trans *trans);
 extern void gfs2_ail1_flush(struct gfs2_sbd *sdp, struct writeback_control *wbc);
+extern void log_flush_wait(struct gfs2_sbd *sdp);
 
 extern void gfs2_log_shutdown(struct gfs2_sbd *sdp);
 extern int gfs2_logd(void *data);
-- 
2.20.1

