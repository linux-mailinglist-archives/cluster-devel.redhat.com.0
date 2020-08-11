Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 771FF241AF1
	for <lists+cluster-devel@lfdr.de>; Tue, 11 Aug 2020 14:27:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597148854;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=k29+uEPca0AJk+IYJ90C/bCJcohKhbXaizP2PkTXFWU=;
	b=MpeyAYAET21rPXz7x+pqHkdWsU3oQKSQcAIjxNX4UWCalmqy3ZWu3sKgBhbKToL8GgCcCn
	2NWfpzYW1k/Qb56pM2bR7TOsxFClDQwsgdAbyxyd6zj2junoeC8sCC2FqUvu2Xr7uQb60B
	+DHjptl99+NIrg0tWZefHqvRK6VSBEc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-L1XfozoJOXKy3a6Gy7-Xfw-1; Tue, 11 Aug 2020 08:27:32 -0400
X-MC-Unique: L1XfozoJOXKy3a6Gy7-Xfw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A24D1800D41;
	Tue, 11 Aug 2020 12:27:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A3B3365C77;
	Tue, 11 Aug 2020 12:27:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7C72DA553C;
	Tue, 11 Aug 2020 12:27:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07BCRLQT001933 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 11 Aug 2020 08:27:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 495CD4AC; Tue, 11 Aug 2020 12:27:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB96E69318
	for <cluster-devel@redhat.com>; Tue, 11 Aug 2020 12:27:17 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Tue, 11 Aug 2020 13:27:15 +0100
Message-Id: <20200811122715.373661-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] mkfs.gfs2: Don't exceed IOV_MAX when
	zeroing first alignment gap
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

The first resource group can be aligned far away from the superblock
when the device has large stripes, and zeroing that gap with a small
block size can mean that the iovec used exceeds IOV_MAX and causes
pwritev to fail with EINVAL. Split the writes to guard against that.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/mkfs/main_mkfs.c | 13 ++++++++++---
 tests/mkfs.at         |  1 +
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/gfs2/mkfs/main_mkfs.c b/gfs2/mkfs/main_mkfs.c
index 36fd08e7..3fb2eb92 100644
--- a/gfs2/mkfs/main_mkfs.c
+++ b/gfs2/mkfs/main_mkfs.c
@@ -711,9 +711,16 @@ static int place_rgrp(struct gfs2_sbd *sdp, lgfs2_rgrp_t rg, int debug)
 		prev_end = lgfs2_rgrp_index(prev)->ri_data0 +
 		           lgfs2_rgrp_index(prev)->ri_data;
 	}
-	err = zero_gap(sdp, prev_end, ri->ri_addr - prev_end);
-	if (err != 0)
-		return -1;
+	while (prev_end < ri->ri_addr) {
+		size_t gap_len = ri->ri_addr - prev_end;
+
+		if (gap_len > IOV_MAX)
+			gap_len = IOV_MAX;
+		err = zero_gap(sdp, prev_end, gap_len);
+		if (err != 0)
+			return -1;
+		prev_end += gap_len;
+	}
 	err = lgfs2_rgrp_write(sdp->device_fd, rg);
 	if (err != 0) {
 		perror(_("Failed to write resource group"));
diff --git a/tests/mkfs.at b/tests/mkfs.at
index 4c8b2249..96c4f6ab 100644
--- a/tests/mkfs.at
+++ b/tests/mkfs.at
@@ -117,6 +117,7 @@ AT_CHECK([gfs2_edit -p sb field sb_bsize $GFS_TGT | tr -d '\n' ], 0, [4096], [ig
 AT_CHECK([$GFS_MKFS -p lock_nolock -o test_topology=7168:512:0:33553920:512 $GFS_TGT], 0, [ignore], [ignore])
 AT_CHECK([$GFS_MKFS -p lock_nolock -o test_topology=7168:512:8192:33553920:512 $GFS_TGT], 0, [ignore], [Warning: device is not properly aligned. This may harm performance.
 ])
+AT_CHECK([$GFS_MKFS -p lock_nolock -o test_topology=0:512:4194304:8388608:512 -b 1024 $GFS_TGT], 0, [ignore], [ignore])
 AT_CLEANUP
 
 AT_SETUP([Resource group alignment])
-- 
2.26.2

