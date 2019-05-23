Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBD427D9F
	for <lists+cluster-devel@lfdr.de>; Thu, 23 May 2019 15:05:31 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 98DAE30044C9;
	Thu, 23 May 2019 13:05:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E780620D0;
	Thu, 23 May 2019 13:05:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3519F5B427;
	Thu, 23 May 2019 13:05:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4ND4WrL010004 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 23 May 2019 09:04:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A51D36090E; Thu, 23 May 2019 13:04:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-117-25.phx2.redhat.com [10.3.117.25])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7063469186
	for <cluster-devel@redhat.com>; Thu, 23 May 2019 13:04:32 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 23 May 2019 08:04:12 -0500
Message-Id: <20190523130421.21003-18-rpeterso@redhat.com>
In-Reply-To: <20190523130421.21003-1-rpeterso@redhat.com>
References: <20190523130421.21003-1-rpeterso@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH v6 17/26] gfs2: Don't loop forever in
	gfs2_freeze if withdrawn
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Thu, 23 May 2019 13:05:30 +0000 (UTC)

Before this patch, function gfs2_freeze would loop forever if the
file system trying to be frozen is withdrawn. That's because function
gfs2_lock_fs_check_clean tries to enqueue the glock of the journal
and the gfs2_glock returns -EIO because you can't enqueue a journaled
glock after a withdraw.

This patch moves the check for file system withdraw inside the loop
so that the loop can end when withdraw occurs.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/super.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 5ea8d45e989d..110f00024950 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1016,12 +1016,12 @@ static int gfs2_freeze(struct super_block *sb)
 	if (atomic_read(&sdp->sd_freeze_state) != SFS_UNFROZEN)
 		goto out;
 
-	if (gfs2_withdrawn(sdp)) {
-		error = -EINVAL;
-		goto out;
-	}
-
 	for (;;) {
+		if (gfs2_withdrawn(sdp)) {
+			error = -EINVAL;
+			goto out;
+		}
+
 		error = gfs2_lock_fs_check_clean(sdp, &sdp->sd_freeze_gh);
 		if (!error)
 			break;
-- 
2.21.0

