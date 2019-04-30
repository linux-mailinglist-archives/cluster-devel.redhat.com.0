Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C46102FB
	for <lists+cluster-devel@lfdr.de>; Wed,  1 May 2019 01:03:29 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2D12B83F3B;
	Tue, 30 Apr 2019 23:03:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 068C66E714;
	Tue, 30 Apr 2019 23:03:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8BE9318089D3;
	Tue, 30 Apr 2019 23:03:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3UN3NAl022993 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Apr 2019 19:03:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CB0757C850; Tue, 30 Apr 2019 23:03:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-20.phx2.redhat.com [10.3.116.20])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A5D2081742
	for <cluster-devel@redhat.com>; Tue, 30 Apr 2019 23:03:23 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 30 Apr 2019 17:03:07 -0600
Message-Id: <20190430230319.10375-8-rpeterso@redhat.com>
In-Reply-To: <20190430230319.10375-1-rpeterso@redhat.com>
References: <20190430230319.10375-1-rpeterso@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH v3 07/19] gfs2: Only complain the first
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Tue, 30 Apr 2019 23:03:28 +0000 (UTC)

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
index 2e8c6d02e112..065867b5f7c8 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -211,8 +211,9 @@ static void gfs2_end_log_write(struct bio *bio)
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

