Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DD527D9A
	for <lists+cluster-devel@lfdr.de>; Thu, 23 May 2019 15:05:22 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9D1C6128B5;
	Thu, 23 May 2019 13:05:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 822B3795B5;
	Thu, 23 May 2019 13:05:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5096E5B428;
	Thu, 23 May 2019 13:05:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4ND4Ul8009941 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 23 May 2019 09:04:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 30EB469189; Thu, 23 May 2019 13:04:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-117-25.phx2.redhat.com [10.3.117.25])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F0C4B69188
	for <cluster-devel@redhat.com>; Thu, 23 May 2019 13:04:29 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 23 May 2019 08:04:05 -0500
Message-Id: <20190523130421.21003-11-rpeterso@redhat.com>
In-Reply-To: <20190523130421.21003-1-rpeterso@redhat.com>
References: <20190523130421.21003-1-rpeterso@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH v6 10/26] gfs2: fix infinite loop in
	gfs2_ail1_flush on io error
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Thu, 23 May 2019 13:05:21 +0000 (UTC)

Before this patch, an IO error encountered in function gfs2_ail1_flush
would get cause a deadlock: because of the io error (and its resulting
withdrawn state), buffers stopped being written to the journal.
Buffers would remain on the ail1 list, so gfs2_ail1_start_one would
return 1 to indicate dirty buffers were still on the ail1 list.
However, when function gfs2_ail1_flush got a non-zero return code,
it would goto restart to retry the writes, which meant it would never
finish, and thus the infinite loop.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/log.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 6ccc5d01b813..0fe11bde796b 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -160,7 +160,7 @@ void gfs2_ail1_flush(struct gfs2_sbd *sdp, struct writeback_control *wbc)
 	list_for_each_entry_reverse(tr, head, tr_list) {
 		if (wbc->nr_to_write <= 0)
 			break;
-		if (gfs2_ail1_start_one(sdp, wbc, tr))
+		if (gfs2_ail1_start_one(sdp, wbc, tr) && !gfs2_withdrawn(sdp))
 			goto restart;
 	}
 	spin_unlock(&sdp->sd_ail_lock);
-- 
2.21.0

