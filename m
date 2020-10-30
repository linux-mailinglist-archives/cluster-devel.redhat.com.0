Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id DCD5F2A108B
	for <lists+cluster-devel@lfdr.de>; Fri, 30 Oct 2020 22:52:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604094734;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jYzeVm85Mq0jsMqQb1QChy5pB18eh7dzn+43ZRt4UGo=;
	b=bmVaXWGL5iovDeXtxg/b8DL/XGWjhpCDp0ldqRl7orQvmiq0aR0sF22FUV3/xSPZ44hYUX
	0NRjKkzkZy4+zdB5xp000vQ1CjlrmL51ooteduYj0MEsMlhL0QkQInjr/B95qZDQvvgF86
	2c4fJMM6xdREucaMwXll4nlRJzuOKcs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-kCs7zpB7Py2I832kaHNzcg-1; Fri, 30 Oct 2020 17:52:13 -0400
X-MC-Unique: kCs7zpB7Py2I832kaHNzcg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC62E8030B7;
	Fri, 30 Oct 2020 21:52:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B49CF5B4D0;
	Fri, 30 Oct 2020 21:52:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E7E895811C;
	Fri, 30 Oct 2020 21:52:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09ULpxvt023995 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 30 Oct 2020 17:51:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0CA9C672C6; Fri, 30 Oct 2020 21:51:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 49C3E60BE2;
	Fri, 30 Oct 2020 21:51:58 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Fri, 30 Oct 2020 22:51:36 +0100
Message-Id: <20201030215152.1567790-2-agruenba@redhat.com>
In-Reply-To: <20201030215152.1567790-1-agruenba@redhat.com>
References: <20201030215152.1567790-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 01/17] gfs2: Turn gfs2_rbm_incr into
	gfs2_rbm_add
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Change gfs2_rbm_incr to advance an rbm by a given number of blocks.  Use that
in gfs2_reservation_check_and_update to save a gfs2_rbm_to_block ->
gfs2_rbm_from_block round trip.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/rgrp.c | 55 ++++++++++++++++++++++++++++++--------------------
 1 file changed, 33 insertions(+), 22 deletions(-)

diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index ee491bb9c1cc..f003bdffda38 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -277,29 +277,38 @@ static int gfs2_rbm_from_block(struct gfs2_rbm *rbm, u64 block)
 }
 
 /**
- * gfs2_rbm_incr - increment an rbm structure
+ * gfs2_rbm_add - add a number of blocks to an rbm
  * @rbm: The rbm with rgd already set correctly
+ * @blocks: The number of blocks to add to rpm
  *
- * This function takes an existing rbm structure and increments it to the next
- * viable block offset.
- *
- * Returns: If incrementing the offset would cause the rbm to go past the
- *          end of the rgrp, true is returned, otherwise false.
+ * This function takes an existing rbm structure and adds a number of blocks to
+ * it.
  *
+ * Returns: True if the new rbm would point past the end of the rgrp.
  */
 
-static bool gfs2_rbm_incr(struct gfs2_rbm *rbm)
+static bool gfs2_rbm_add(struct gfs2_rbm *rbm, u32 blocks)
 {
-	if (rbm->offset + 1 < rbm_bi(rbm)->bi_blocks) { /* in the same bitmap */
-		rbm->offset++;
+	struct gfs2_rgrpd *rgd = rbm->rgd;
+	struct gfs2_bitmap *bi = rgd->rd_bits + rbm->bii;
+
+	if (rbm->offset + blocks < bi->bi_blocks) {
+		rbm->offset += blocks;
 		return false;
 	}
-	if (rbm->bii == rbm->rgd->rd_length - 1) /* at the last bitmap */
-		return true;
+	blocks -= bi->bi_blocks - rbm->offset;
 
-	rbm->offset = 0;
-	rbm->bii++;
-	return false;
+	for(;;) {
+		bi++;
+		if (bi == rgd->rd_bits + rgd->rd_length)
+			return true;
+		if (blocks < bi->bi_blocks) {
+			rbm->offset = blocks;
+			rbm->bii = bi - rgd->rd_bits;
+			return false;
+		}
+		blocks -= bi->bi_blocks;
+	}
 }
 
 /**
@@ -323,7 +332,7 @@ static bool gfs2_unaligned_extlen(struct gfs2_rbm *rbm, u32 n_unaligned, u32 *le
 		(*len)--;
 		if (*len == 0)
 			return true;
-		if (gfs2_rbm_incr(rbm))
+		if (gfs2_rbm_add(rbm, 1))
 			return true;
 	}
 
@@ -1632,7 +1641,6 @@ static int gfs2_reservation_check_and_update(struct gfs2_rbm *rbm,
 	u64 block = gfs2_rbm_to_block(rbm);
 	u32 extlen = 1;
 	u64 nblock;
-	int ret;
 
 	/*
 	 * If we have a minimum extent length, then skip over any extent
@@ -1657,12 +1665,15 @@ static int gfs2_reservation_check_and_update(struct gfs2_rbm *rbm,
 			maxext->len = extlen;
 			maxext->rbm = *rbm;
 		}
-fail:
-		nblock = block + extlen;
+	} else {
+		u64 len = nblock - block;
+		if (len >= (u64)1 << 32)
+			return -E2BIG;
+		extlen = len;
 	}
-	ret = gfs2_rbm_from_block(rbm, nblock);
-	if (ret < 0)
-		return ret;
+fail:
+	if (gfs2_rbm_add(rbm, extlen))
+		return -E2BIG;
 	return 1;
 }
 
@@ -2198,7 +2209,7 @@ static void rgblk_free(struct gfs2_sbd *sdp, struct gfs2_rgrpd *rgd,
 			bi_prev = bi;
 		}
 		gfs2_setbit(&rbm, false, new_state);
-		gfs2_rbm_incr(&rbm);
+		gfs2_rbm_add(&rbm, 1);
 	}
 }
 
-- 
2.26.2

