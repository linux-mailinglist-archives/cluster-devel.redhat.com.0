Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id EB51135DFB1
	for <lists+cluster-devel@lfdr.de>; Tue, 13 Apr 2021 15:06:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618319182;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9kYXKi9qpnFtvfxi9aWSv3EHyjXNB7p6RooyFamn3Ik=;
	b=OZh3Q8fhUqJJ4tEdq6q7utAPMgLFCzwEfY3pPodVJQ/y9UZhZPEnXPyFoMHfIYcn2+VbgC
	mAuRt/+c1I9BvHkAHzc7G5QJvGxiJO9C/letm/diSonKhtDwxieIARzKm+obdfqad2kYqQ
	Yzq5LDNIbojhkXbUpcGpHwMCEdyG1uU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-X1NDo21WPi2TNI6kRQrUSQ-1; Tue, 13 Apr 2021 09:06:20 -0400
X-MC-Unique: X1NDo21WPi2TNI6kRQrUSQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B90D91285;
	Tue, 13 Apr 2021 13:06:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D3CF5C648;
	Tue, 13 Apr 2021 13:06:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6922144A5E;
	Tue, 13 Apr 2021 13:06:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13DD6BIp031084 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 13 Apr 2021 09:06:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F03D61042AB0; Tue, 13 Apr 2021 13:06:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.36.189])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37EA91042A9C
	for <cluster-devel@redhat.com>; Tue, 13 Apr 2021 13:06:11 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Tue, 13 Apr 2021 14:05:31 +0100
Message-Id: <20210413130532.1277163-5-anprice@redhat.com>
In-Reply-To: <20210413130532.1277163-1-anprice@redhat.com>
References: <20210413130532.1277163-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 4/5] fsck.gfs2: Fix bounds check in
	find_next_rgrp_dist()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

We're reading block address (next_block + b) so the bounds check should
make sure that address is valid.

Add some tests that now pass (and some commented-out ones that don't).

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/fsck/rgrepair.c |  2 +-
 tests/fsck.at        | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/gfs2/fsck/rgrepair.c b/gfs2/fsck/rgrepair.c
index 2bddd91f..637e5271 100644
--- a/gfs2/fsck/rgrepair.c
+++ b/gfs2/fsck/rgrepair.c
@@ -392,7 +392,7 @@ static uint64_t find_next_rgrp_dist(struct gfs2_sbd *sdp, uint64_t blk,
 		next_block = prevrgd->ri.ri_addr + rgrp_dist;
 		/* Now we account for block rounding done by mkfs.gfs2 */
 		for (b = 0; b <= length + GFS2_NBBY; b++) {
-			if (next_block >= sdp->device.length)
+			if (next_block + b >= sdp->device.length)
 				break;
 			bh = bread(sdp, next_block + b);
 			gfs2_meta_header_in(&mh, bh->b_data);
diff --git a/tests/fsck.at b/tests/fsck.at
index 727108f4..3b1c5af3 100644
--- a/tests/fsck.at
+++ b/tests/fsck.at
@@ -46,6 +46,26 @@ AT_KEYWORDS(fsck.gfs2 fsck)
 GFS_NUKERG_CHECK([mkfs.gfs2 -O -p lock_nolock $GFS_TGT], [-i 1])
 AT_CLEANUP
 
+AT_SETUP([2G RGs: Fix bad resource group #0])
+AT_KEYWORDS(fsck.gfs2 fsck)
+GFS_NUKERG_CHECK([mkfs.gfs2 -O -p lock_nolock -r 2048 $GFS_TGT], [-r 0])
+AT_CLEANUP
+
+AT_SETUP([2G RGs: Fix bad resource group #1])
+AT_KEYWORDS(fsck.gfs2 fsck)
+GFS_NUKERG_CHECK([mkfs.gfs2 -O -p lock_nolock -r 2048 $GFS_TGT], [-r 1])
+AT_CLEANUP
+
+#AT_SETUP([2G RGs: Fix bad rindex entry #0])
+#AT_KEYWORDS(fsck.gfs2 fsck)
+#GFS_NUKERG_CHECK([mkfs.gfs2 -O -p lock_nolock -r 2048 $GFS_TGT], [-i 0])
+#AT_CLEANUP
+
+#AT_SETUP([2G RGs: Fix bad rindex entry #1])
+#AT_KEYWORDS(fsck.gfs2 fsck)
+#GFS_NUKERG_CHECK([mkfs.gfs2 -O -p lock_nolock -r 2048 $GFS_TGT], [-i 1])
+#AT_CLEANUP
+
 AT_SETUP([Rebuild bad journal])
 AT_KEYWORDS(fsck.gfs2 fsck)
 GFS_TGT_REGEN
-- 
2.30.2

