Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CED7F1FB1B
	for <lists+cluster-devel@lfdr.de>; Wed, 15 May 2019 21:40:01 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4C901307D98D;
	Wed, 15 May 2019 19:40:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 38B9419936;
	Wed, 15 May 2019 19:40:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 18B275B423;
	Wed, 15 May 2019 19:40:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4FJcRMp029070 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 May 2019 15:38:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1B80360FAE; Wed, 15 May 2019 19:38:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-119.phx2.redhat.com [10.3.116.119])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DAB0F60FB1
	for <cluster-devel@redhat.com>; Wed, 15 May 2019 19:38:24 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 15 May 2019 14:38:04 -0500
Message-Id: <20190515193818.7642-12-rpeterso@redhat.com>
In-Reply-To: <20190515193818.7642-1-rpeterso@redhat.com>
References: <20190515193818.7642-1-rpeterso@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 v4 PATCH 11/25] gfs2: Only complain the first
	time an io error occurs in quota or log
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Wed, 15 May 2019 19:40:00 +0000 (UTC)

Before this patch, all io errors received by the quota daemon or the
logd daemon would cause a complaint message to be issued, such as:

   gfs2: fsid=dm-13.0: Error 10 writing to journal, jid=0

This patch changes it so that the error message is only issued the
first time the error is encountered.

Also, before this patch function gfs2_end_log_write did not set the
sd_log_error value, so log errors would not cause the file system to
be withdrawn. This patch sets the error code so the file system is
properly withdrawn if an io error is encountered writing to the journal.

WARNING: This change in function breaks check xfstests generic/441
and causes it to fail: io errors writing to the log should cause a
file system to be withdrawn, and no further operations are tolerated.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/lops.c  | 5 +++--
 fs/gfs2/quota.c | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index c704292a16e2..5166e863a926 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -212,8 +212,9 @@ static void gfs2_end_log_write(struct bio *bio)
 	struct bvec_iter_all iter_all;
 
 	if (bio->bi_status) {
-		fs_err(sdp, "Error %d writing to journal, jid=%u\n",
-		       bio->bi_status, sdp->sd_jdesc->jd_jid);
+		if (!cmpxchg(&sdp->sd_log_error, 0, bio->bi_status))
+			fs_err(sdp, "Error %d writing to journal, jid=%u\n",
+			       bio->bi_status, sdp->sd_jdesc->jd_jid);
 		wake_up(&sdp->sd_logd_waitq);
 	}
 
diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index 8871fca9102f..acb6cbdd1431 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -1479,8 +1479,8 @@ static void quotad_error(struct gfs2_sbd *sdp, const char *msg, int error)
 	if (error == 0 || error == -EROFS)
 		return;
 	if (!gfs2_withdrawn(sdp)) {
-		fs_err(sdp, "gfs2_quotad: %s error %d\n", msg, error);
-		cmpxchg(&sdp->sd_log_error, 0, error);
+		if (!cmpxchg(&sdp->sd_log_error, 0, error))
+			fs_err(sdp, "gfs2_quotad: %s error %d\n", msg, error);
 		wake_up(&sdp->sd_logd_waitq);
 	}
 }
-- 
2.20.1

