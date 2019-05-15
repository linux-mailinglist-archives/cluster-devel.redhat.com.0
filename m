Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E22831FB1A
	for <lists+cluster-devel@lfdr.de>; Wed, 15 May 2019 21:40:00 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 97D163001D53;
	Wed, 15 May 2019 19:39:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A16060166;
	Wed, 15 May 2019 19:39:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5FB055B425;
	Wed, 15 May 2019 19:39:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4FJcMbH028990 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 May 2019 15:38:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EF39760F9C; Wed, 15 May 2019 19:38:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-119.phx2.redhat.com [10.3.116.119])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BB18960BF7
	for <cluster-devel@redhat.com>; Wed, 15 May 2019 19:38:22 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 15 May 2019 14:37:59 -0500
Message-Id: <20190515193818.7642-7-rpeterso@redhat.com>
In-Reply-To: <20190515193818.7642-1-rpeterso@redhat.com>
References: <20190515193818.7642-1-rpeterso@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 v4 PATCH 06/25] gfs2: simplify gfs2_freeze by
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Wed, 15 May 2019 19:39:59 +0000 (UTC)

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
2.20.1

