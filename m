Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A1B27DAB
	for <lists+cluster-devel@lfdr.de>; Thu, 23 May 2019 15:05:48 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 64F4A792AE;
	Thu, 23 May 2019 13:05:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FA8F67E64;
	Thu, 23 May 2019 13:05:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7FA985B424;
	Thu, 23 May 2019 13:05:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4ND4kti010124 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 23 May 2019 09:04:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9604C67E64; Thu, 23 May 2019 13:04:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-117-25.phx2.redhat.com [10.3.117.25])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 613536090E
	for <cluster-devel@redhat.com>; Thu, 23 May 2019 13:04:44 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 23 May 2019 08:04:20 -0500
Message-Id: <20190523130421.21003-26-rpeterso@redhat.com>
In-Reply-To: <20190523130421.21003-1-rpeterso@redhat.com>
References: <20190523130421.21003-1-rpeterso@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH v6 25/26] gfs2: Prepare to withdraw as
	soon as an IO error occurs in log write
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Thu, 23 May 2019 13:05:47 +0000 (UTC)

Before this patch, function gfs2_end_log_write would detect any IO
errors writing to the journal and put out an appropriate message,
but it never set a withdrawing condition. Eventually, the log daemon
would see the error and determine it was time to withdraw, but in
the meantime, other processes could continue running as if nothing
bad ever happened. The biggest consequence is that __gfs2_glock_put
would BUG() when it saw that there were still unwritten items.

This patch sets the WITHDRAWING status as soon as an IO error is
detected, and that way, the BUG will be avoided so the file system
can be properly withdrawn and unmounted.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/lops.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index edff7538d7f2..bfe296be621c 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -214,6 +214,7 @@ static void gfs2_end_log_write(struct bio *bio)
 		if (!cmpxchg(&sdp->sd_log_error, 0, (int)bio->bi_status))
 			fs_err(sdp, "Error %d writing to journal, jid=%u\n",
 			       bio->bi_status, sdp->sd_jdesc->jd_jid);
+		set_bit(SDF_WITHDRAWING, &sdp->sd_flags);
 		wake_up(&sdp->sd_logd_waitq);
 	}
 
-- 
2.21.0

