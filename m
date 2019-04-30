Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B8810302
	for <lists+cluster-devel@lfdr.de>; Wed,  1 May 2019 01:03:31 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 37A4A89C42;
	Tue, 30 Apr 2019 23:03:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2271181769;
	Tue, 30 Apr 2019 23:03:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0680718089C9;
	Tue, 30 Apr 2019 23:03:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3UN3NSx022968 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Apr 2019 19:03:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 15C847C850; Tue, 30 Apr 2019 23:03:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-20.phx2.redhat.com [10.3.116.20])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E397A81764
	for <cluster-devel@redhat.com>; Tue, 30 Apr 2019 23:03:22 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 30 Apr 2019 17:03:04 -0600
Message-Id: <20190430230319.10375-5-rpeterso@redhat.com>
In-Reply-To: <20190430230319.10375-1-rpeterso@redhat.com>
References: <20190430230319.10375-1-rpeterso@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH v3 04/19] gfs2: Warn when a journal
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Tue, 30 Apr 2019 23:03:30 +0000 (UTC)

This patch adds some instrumentation in gfs2's journal replay that
indicates when we're about to overwrite a rgrp for which we already
have a valid buffer_head.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/lops.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index 6af6a3cea967..2e8c6d02e112 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -564,9 +564,27 @@ static int buf_lo_scan_elements(struct gfs2_jdesc *jd, u32 start,
 
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

