Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5CDDA3C7643
	for <lists+cluster-devel@lfdr.de>; Tue, 13 Jul 2021 20:10:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626199837;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CjDMU7bJ+1ZNnWnCTYkzd2Q35h2XIO3zlJ8gsXwMoOY=;
	b=MryAEutL05/gYJk0PfmsXet//MuGEXqHPDDfPWa2Ds21tHCFpE7uVCZtdAPOKeZns/QkET
	r0/F4rjDtzd0ody9v4nIMz0TjAiJdJvEQS8J+83qxYelC7cDcC9LWShJee3xKjxKDpVZ+e
	plxk1sd9DFvLimH95peEH9nULQGlbcU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-e62F-ol2NsuFrkmbp8g1XQ-1; Tue, 13 Jul 2021 14:10:36 -0400
X-MC-Unique: e62F-ol2NsuFrkmbp8g1XQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B147C101F009;
	Tue, 13 Jul 2021 18:10:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A091A100EB3D;
	Tue, 13 Jul 2021 18:10:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8F7C74EA2A;
	Tue, 13 Jul 2021 18:10:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16DIA40x022097 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 13 Jul 2021 14:10:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 457541036D04; Tue, 13 Jul 2021 18:10:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-12.phx2.redhat.com [10.3.112.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 152CA100F49F
	for <cluster-devel@redhat.com>; Tue, 13 Jul 2021 18:10:04 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 13 Jul 2021 13:09:51 -0500
Message-Id: <20210713180958.66995-4-rpeterso@redhat.com>
In-Reply-To: <20210713180958.66995-1-rpeterso@redhat.com>
References: <20210713180958.66995-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 03/10] gfs2: be more verbose replaying
	invalid rgrp blocks
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch adds some crucial information when journal replay detects a
replay of an obsolete rgrp block. For example, it wasn't printing the
journal id or the generation number played. This just supplements what
is logged in this unusual case.

The function that actually complains about the replaying of an obsolete
rgrp block has been split off to avoid long lines and sparse warnings.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/lops.c | 44 +++++++++++++++++++++++++++++---------------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index 8ee05d25dfa6..ca0bb3a73912 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -761,6 +761,32 @@ static void buf_lo_before_scan(struct gfs2_jdesc *jd,
 	jd->jd_replayed_blocks = 0;
 }
 
+#define obsolete_rgrp_replay \
+"Replaying 0x%llx from jid=%d/0x%llx but we already have a bh!\n"
+#define obsolete_rgrp_replay2 \
+"busy:%d, pinned:%d rg_gen:0x%llx, j_gen:0x%llx\n"
+
+static void obsolete_rgrp(struct gfs2_jdesc *jd, struct buffer_head *bh_log,
+			  u64 blkno)
+{
+	struct gfs2_sbd *sdp = GFS2_SB(jd->jd_inode);
+	struct gfs2_rgrpd *rgd;
+	struct gfs2_rgrp *jrgd = (struct gfs2_rgrp *)bh_log->b_data;
+
+	rgd = gfs2_blk2rgrpd(sdp, blkno, false);
+	if (rgd && rgd->rd_addr == blkno &&
+	    rgd->rd_bits && rgd->rd_bits->bi_bh) {
+		fs_info(sdp, obsolete_rgrp_replay, (unsigned long long)blkno,
+			jd->jd_jid, bh_log->b_blocknr);
+		fs_info(sdp, obsolete_rgrp_replay2,
+			buffer_busy(rgd->rd_bits->bi_bh) ? 1 : 0,
+			buffer_pinned(rgd->rd_bits->bi_bh),
+			rgd->rd_igeneration,
+			be64_to_cpu(jrgd->rg_igeneration));
+		gfs2_dump_glock(NULL, rgd->rd_gl, true);
+	}
+}
+
 static int buf_lo_scan_elements(struct gfs2_jdesc *jd, u32 start,
 				struct gfs2_log_descriptor *ld, __be64 *ptr,
 				int pass)
@@ -799,21 +825,9 @@ static int buf_lo_scan_elements(struct gfs2_jdesc *jd, u32 start,
 			struct gfs2_meta_header *mh =
 				(struct gfs2_meta_header *)bh_ip->b_data;
 
-			if (mh->mh_type == cpu_to_be32(GFS2_METATYPE_RG)) {
-				struct gfs2_rgrpd *rgd;
-
-				rgd = gfs2_blk2rgrpd(sdp, blkno, false);
-				if (rgd && rgd->rd_addr == blkno &&
-				    rgd->rd_bits && rgd->rd_bits->bi_bh) {
-					fs_info(sdp, "Replaying 0x%llx but we "
-						"already have a bh!\n",
-						(unsigned long long)blkno);
-					fs_info(sdp, "busy:%d, pinned:%d\n",
-						buffer_busy(rgd->rd_bits->bi_bh) ? 1 : 0,
-						buffer_pinned(rgd->rd_bits->bi_bh));
-					gfs2_dump_glock(NULL, rgd->rd_gl, true);
-				}
-			}
+			if (mh->mh_type == cpu_to_be32(GFS2_METATYPE_RG))
+				obsolete_rgrp(jd, bh_log, blkno);
+
 			mark_buffer_dirty(bh_ip);
 		}
 		brelse(bh_log);
-- 
2.31.1

