Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 934C263774
	for <lists+cluster-devel@lfdr.de>; Tue,  9 Jul 2019 16:08:44 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F0BAA7FDF6;
	Tue,  9 Jul 2019 14:08:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD55695A5A;
	Tue,  9 Jul 2019 14:08:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 754FE18184AC;
	Tue,  9 Jul 2019 14:08:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x69E7EJX016028 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 9 Jul 2019 10:07:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BD4BC831CE; Tue,  9 Jul 2019 14:07:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.205.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C72C3831B7;
	Tue,  9 Jul 2019 14:07:13 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Tue,  9 Jul 2019 16:06:45 +0200
Message-Id: <20190709140657.19064-7-agruenba@redhat.com>
In-Reply-To: <20190709140657.19064-1-agruenba@redhat.com>
References: <20190709140657.19064-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 06/18] gfs2: Warn when a journal replay
	overwrites a rgrp with buffers
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Tue, 09 Jul 2019 14:08:43 +0000 (UTC)

From: Bob Peterson <rpeterso@redhat.com>

This patch adds some instrumentation in gfs2's journal replay that
indicates when we're about to overwrite a rgrp for which we already
have a valid buffer_head.

When this problem occurs, it's a situation in which this node has
been granted a rgrp glock and subsequently read in buffer_heads for
it, and possibly even made changes to the rgrp bits and/or
allocation values. But now another node has failed and forced us to
replay its journal, but its journal contains a copy of the same
rgrp, without a revoke, which means we're about to overwrite a
rgrp that we now rightfully own, with an obsolete copy. That is
always a problem. It means the other node (which failed and left
its journal to be replayed) failed to flush out its rgrp buffers,
write out the revoke, and invalidate its copy before it released
the glock to our possession.

No node should ever release a glock until its metadata has been
written to the journal and revoked and invalidated..

We also kludge around the problem and refuse to replace our good
copy with the journals bad copy by not marking the buffer dirty,
but never do it silently. That's wallpapering over a larger problem
that still exists. IOW, if this situation can happen to this node,
it can also happen to a different node and we wouldn't even know it
or be able to circumvent it: Suppose we have a 3-node cluster:
Node 1 fails, leaving an obsolete rgrp block in its journal without
a revoke. Node 2 grabs the rgrp as soon as the rgrp glock is
released and starts making changes, allocating and freeing blocks
from the rgrp, etc. Node 3 replays the journal from node 1,
oblivious and unaware that it's about to overwrite node 2's changes.
So we still need to be vocal and log the error to make it apparent
that a corruption path still exists in gfs2.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/lops.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index 1921cda034fd..8c3678f42746 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -759,9 +759,27 @@ static int buf_lo_scan_elements(struct gfs2_jdesc *jd, u32 start,
 
 		if (gfs2_meta_check(sdp, bh_ip))
 			error = -EIO;
-		else
+		else {
+			struct gfs2_meta_header *mh =
+				(struct gfs2_meta_header *)bh_ip->b_data;
+
+			if (mh->mh_type == cpu_to_be32(GFS2_METATYPE_RG)) {
+				struct gfs2_rgrpd *rgd;
+
+				rgd = gfs2_blk2rgrpd(sdp, blkno, false);
+				if (rgd && rgd->rd_addr == blkno &&
+				    rgd->rd_bits && rgd->rd_bits->bi_bh) {
+					fs_info(sdp, "Replaying 0x%llx but we "
+						"already have a bh!\n",
+						(unsigned long long)blkno);
+					fs_info(sdp, "busy:%d, pinned:%d\n",
+						buffer_busy(rgd->rd_bits->bi_bh) ? 1 : 0,
+						buffer_pinned(rgd->rd_bits->bi_bh));
+					gfs2_dump_glock(NULL, rgd->rd_gl);
+				}
+			}
 			mark_buffer_dirty(bh_ip);
-
+		}
 		brelse(bh_log);
 		brelse(bh_ip);
 
-- 
2.20.1

