Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F30B9D3C7
	for <lists+cluster-devel@lfdr.de>; Mon, 26 Aug 2019 18:15:02 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8E8A6A2F6A0;
	Mon, 26 Aug 2019 16:14:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4954B19D7A;
	Mon, 26 Aug 2019 16:14:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 70F8624F30;
	Mon, 26 Aug 2019 16:14:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7QGEoKL011186 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 26 Aug 2019 12:14:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7BA41100197A; Mon, 26 Aug 2019 16:14:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (ovpn-204-227.brq.redhat.com [10.40.204.227])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B44411001959;
	Mon, 26 Aug 2019 16:14:47 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 26 Aug 2019 18:14:44 +0200
Message-Id: <20190826161444.10573-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: Fix recovery slot bumping
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]); Mon, 26 Aug 2019 16:15:00 +0000 (UTC)

Get rid of the assumption that the number of slots can at most increase by
RECOVER_SIZE_INC (16) in set_recover_size.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/lock_dlm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/lock_dlm.c b/fs/gfs2/lock_dlm.c
index 4361804646d8..2bc7a334aa0a 100644
--- a/fs/gfs2/lock_dlm.c
+++ b/fs/gfs2/lock_dlm.c
@@ -1035,12 +1035,12 @@ static int set_recover_size(struct gfs2_sbd *sdp, struct dlm_slot *slots,
 	}
 
 	old_size = ls->ls_recover_size;
-
-	if (old_size >= max_jid + 1)
+	new_size = old_size;
+	while (new_size < max_jid + 1)
+		new_size += RECOVER_SIZE_INC;
+	if (old_size == new_size)
 		return 0;
 
-	new_size = old_size + RECOVER_SIZE_INC;
-
 	submit = kcalloc(new_size, sizeof(uint32_t), GFP_NOFS);
 	result = kcalloc(new_size, sizeof(uint32_t), GFP_NOFS);
 	if (!submit || !result) {
-- 
2.20.1

