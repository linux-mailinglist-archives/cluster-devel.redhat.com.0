Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id E960828DE1E
	for <lists+cluster-devel@lfdr.de>; Wed, 14 Oct 2020 11:58:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602669534;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oQGF31pPdRzY7bZocVktLlpApAEtttuqT9Ag5NAd6u8=;
	b=DFu2KjCYuJt06mz/+aIuYp6gmC6xOHwC9nsPkXS9O82hhNviYRAgDly/mF7W9i3sWEhpoN
	Tcw2zM4IqKUfbysStmqlOwIiG5cN55PJUFJciAba0ySD0a2yafniZiM5PxvJQk22QZNxBT
	zUXCbEu68Bd90UtPqf9Ja5PChdzcFZA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-miYlma9UM0ybS9ceTB5ywg-1; Wed, 14 Oct 2020 05:58:53 -0400
X-MC-Unique: miYlma9UM0ybS9ceTB5ywg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2EC2186DD28;
	Wed, 14 Oct 2020 09:58:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A2C2A100164C;
	Wed, 14 Oct 2020 09:58:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0EB03181A050;
	Wed, 14 Oct 2020 09:58:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09E9wepH001343 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 14 Oct 2020 05:58:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EB64A7666D; Wed, 14 Oct 2020 09:58:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2FD037666B;
	Wed, 14 Oct 2020 09:58:40 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 14 Oct 2020 11:58:17 +0200
Message-Id: <20201014095833.1035870-2-agruenba@redhat.com>
In-Reply-To: <20201014095833.1035870-1-agruenba@redhat.com>
References: <20201014095833.1035870-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [RFC 01/17] gfs2: Turn gfs2_rbm_incr into
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
index 074f228ea839..073a9c9cb782 100644
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
 
@@ -1636,7 +1645,6 @@ static int gfs2_reservation_check_and_update(struct gfs2_rbm *rbm,
 	u64 block = gfs2_rbm_to_block(rbm);
 	u32 extlen = 1;
 	u64 nblock;
-	int ret;
 
 	/*
 	 * If we have a minimum extent length, then skip over any extent
@@ -1661,12 +1669,15 @@ static int gfs2_reservation_check_and_update(struct gfs2_rbm *rbm,
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
 
@@ -2202,7 +2213,7 @@ static void rgblk_free(struct gfs2_sbd *sdp, struct gfs2_rgrpd *rgd,
 			bi_prev = bi;
 		}
 		gfs2_setbit(&rbm, false, new_state);
-		gfs2_rbm_incr(&rbm);
+		gfs2_rbm_add(&rbm, 1);
 	}
 }
 
-- 
2.26.2

