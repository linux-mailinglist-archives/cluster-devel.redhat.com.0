Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4B127D9B
	for <lists+cluster-devel@lfdr.de>; Thu, 23 May 2019 15:05:22 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C2E51317916D;
	Thu, 23 May 2019 13:05:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD12B795AE;
	Thu, 23 May 2019 13:05:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 838915B423;
	Thu, 23 May 2019 13:05:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4ND4SA9009910 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 23 May 2019 09:04:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C2AD469189; Thu, 23 May 2019 13:04:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-117-25.phx2.redhat.com [10.3.117.25])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8E11A69188
	for <cluster-devel@redhat.com>; Thu, 23 May 2019 13:04:28 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 23 May 2019 08:04:01 -0500
Message-Id: <20190523130421.21003-7-rpeterso@redhat.com>
In-Reply-To: <20190523130421.21003-1-rpeterso@redhat.com>
References: <20190523130421.21003-1-rpeterso@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH v6 06/26] gfs2: simplify gfs2_freeze by
	removing case
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Thu, 23 May 2019 13:05:21 +0000 (UTC)

Function gfs2_freeze had a case statement that simply checked the
error code, but the break statements just made the logic hard to
read. This patch simplifies the logic in favor of a simple if.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/super.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 01137635fb44..6e3a318edccd 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1026,20 +1026,14 @@ static int gfs2_freeze(struct super_block *sb)
 		if (!error)
 			break;
 
-		switch (error) {
-		case -EBUSY:
+		if (error == -EBUSY)
 			fs_err(sdp, "waiting for recovery before freeze\n");
-			break;
-
-		default:
+		else
 			fs_err(sdp, "error freezing FS: %d\n", error);
-			break;
-		}
 
 		fs_err(sdp, "retrying...\n");
 		msleep(1000);
 	}
-	error = 0;
 	set_bit(SDF_FS_FROZEN, &sdp->sd_flags);
 out:
 	mutex_unlock(&sdp->sd_freeze_mutex);
-- 
2.21.0

