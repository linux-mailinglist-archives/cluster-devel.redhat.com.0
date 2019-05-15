Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A521FB27
	for <lists+cluster-devel@lfdr.de>; Wed, 15 May 2019 21:40:30 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6218C30A6974;
	Wed, 15 May 2019 19:40:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CBD11001943;
	Wed, 15 May 2019 19:40:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 321755B424;
	Wed, 15 May 2019 19:40:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4FJcSLX029104 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 May 2019 15:38:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D1F7B60FAE; Wed, 15 May 2019 19:38:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-119.phx2.redhat.com [10.3.116.119])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9D55160F9C
	for <cluster-devel@redhat.com>; Wed, 15 May 2019 19:38:28 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 15 May 2019 14:38:09 -0500
Message-Id: <20190515193818.7642-17-rpeterso@redhat.com>
In-Reply-To: <20190515193818.7642-1-rpeterso@redhat.com>
References: <20190515193818.7642-1-rpeterso@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 v4 PATCH 16/25] gfs2: Don't loop forever in
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Wed, 15 May 2019 19:40:29 +0000 (UTC)

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
2.20.1

