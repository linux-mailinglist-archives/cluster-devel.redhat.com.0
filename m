Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 893C427D94
	for <lists+cluster-devel@lfdr.de>; Thu, 23 May 2019 15:05:15 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B5B2F81E0D;
	Thu, 23 May 2019 13:05:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E7D16836B;
	Thu, 23 May 2019 13:05:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6E21B5B426;
	Thu, 23 May 2019 13:04:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4ND4SLd009900 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 23 May 2019 09:04:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1580169189; Thu, 23 May 2019 13:04:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-117-25.phx2.redhat.com [10.3.117.25])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D5D0269188
	for <cluster-devel@redhat.com>; Thu, 23 May 2019 13:04:27 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 23 May 2019 08:03:59 -0500
Message-Id: <20190523130421.21003-5-rpeterso@redhat.com>
In-Reply-To: <20190523130421.21003-1-rpeterso@redhat.com>
References: <20190523130421.21003-1-rpeterso@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH v6 04/26] gfs2: Warn when a journal
	replay overwrites a rgrp with buffers
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Thu, 23 May 2019 13:05:14 +0000 (UTC)

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
---
 fs/gfs2/lops.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index 33ab662c9aac..ac73aa48674b 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -762,9 +762,27 @@ static int buf_lo_scan_elements(struct gfs2_jdesc *jd, u32 start,
 
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
2.21.0

