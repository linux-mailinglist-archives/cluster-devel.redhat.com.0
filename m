Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id A7AEF40EAB1
	for <lists+cluster-devel@lfdr.de>; Thu, 16 Sep 2021 21:10:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631819444;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KFz2lS8RJABEn5F1uXPHD0+Ik67bWX7FxFZJohiIh3c=;
	b=PhAfVt4GjJtRh8HIoCbqnThUL1E6e4hxipaF6Al3Asi9u9VylxuCafmjDAQRhKzUlrVlnh
	XSn/e3wwasehKnIxmgFgXGUBekPE9sv+GYyOVdTNAqtGu2fDJmjdnWKHNahedRG5fD+A2r
	H1X/pXQwRUO2Duu6FCC8d4SVhBdb3ts=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-I8AjtYwNNd2fP4-7n8nGbQ-1; Thu, 16 Sep 2021 15:10:43 -0400
X-MC-Unique: I8AjtYwNNd2fP4-7n8nGbQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BB591006AA9;
	Thu, 16 Sep 2021 19:10:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E2D96D984;
	Thu, 16 Sep 2021 19:10:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5B4581800FE4;
	Thu, 16 Sep 2021 19:10:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18GJAapH021604 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 16 Sep 2021 15:10:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A98285C1CF; Thu, 16 Sep 2021 19:10:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-114-63.phx2.redhat.com [10.3.114.63])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 792BA5C1C5
	for <cluster-devel@redhat.com>; Thu, 16 Sep 2021 19:10:36 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 16 Sep 2021 14:10:01 -0500
Message-Id: <20210916191003.105866-5-rpeterso@redhat.com>
In-Reply-To: <20210916191003.105866-1-rpeterso@redhat.com>
References: <20210916191003.105866-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH v2 4/6] gfs2: Switch some BUG_ON to
	GLOCK_BUG_ON for debug
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

In rgrp.c there are several places where it does BUG_ON. This tells us
the call stack but nothing more, which is not very helpful.
This patch switches them to GLOCK_BUG_ON which also prints the glock,
its holders, and many of the rgrp values, which will help us debug
problems in the future.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/rgrp.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 1fb66f6e6a0c..96b2fbed6bf1 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -1230,7 +1230,7 @@ static int gfs2_rgrp_bh_get(struct gfs2_rgrpd *rgd)
 		rgrp_set_bitmap_flags(rgd);
 		rgd->rd_flags |= (GFS2_RDF_UPTODATE | GFS2_RDF_CHECK);
 		rgd->rd_free_clone = rgd->rd_free;
-		BUG_ON(rgd->rd_reserved);
+		GLOCK_BUG_ON(rgd->rd_gl, rgd->rd_reserved);
 		/* max out the rgrp allocation failure point */
 		rgd->rd_extfail_pt = rgd->rd_free;
 	}
@@ -1280,7 +1280,7 @@ static int update_rgrp_lvb(struct gfs2_rgrpd *rgd)
 	rgd->rd_free = be32_to_cpu(rgd->rd_rgl->rl_free);
 	rgrp_set_bitmap_flags(rgd);
 	rgd->rd_free_clone = rgd->rd_free;
-	BUG_ON(rgd->rd_reserved);
+	GLOCK_BUG_ON(rgd->rd_gl, rgd->rd_reserved);
 	/* max out the rgrp allocation failure point */
 	rgd->rd_extfail_pt = rgd->rd_free;
 	rgd->rd_dinodes = be32_to_cpu(rgd->rd_rgl->rl_dinodes);
@@ -2212,7 +2212,7 @@ void gfs2_inplace_release(struct gfs2_inode *ip)
 		struct gfs2_rgrpd *rgd = rs->rs_rgd;
 
 		spin_lock(&rgd->rd_rsspin);
-		BUG_ON(rgd->rd_reserved < rs->rs_reserved);
+		GLOCK_BUG_ON(rgd->rd_gl, rgd->rd_reserved < rs->rs_reserved);
 		rgd->rd_reserved -= rs->rs_reserved;
 		spin_unlock(&rgd->rd_rsspin);
 		rs->rs_reserved = 0;
@@ -2473,9 +2473,9 @@ int gfs2_alloc_blocks(struct gfs2_inode *ip, u64 *bn, unsigned int *nblocks,
 		spin_unlock(&rbm.rgd->rd_rsspin);
 		goto rgrp_error;
 	}
-	BUG_ON(rbm.rgd->rd_reserved < *nblocks);
-	BUG_ON(rbm.rgd->rd_free_clone < *nblocks);
-	BUG_ON(rbm.rgd->rd_free < *nblocks);
+	GLOCK_BUG_ON(rbm.rgd->rd_gl, rbm.rgd->rd_reserved < *nblocks);
+	GLOCK_BUG_ON(rbm.rgd->rd_gl, rbm.rgd->rd_free_clone < *nblocks);
+	GLOCK_BUG_ON(rbm.rgd->rd_gl, rbm.rgd->rd_free < *nblocks);
 	rbm.rgd->rd_reserved -= *nblocks;
 	rbm.rgd->rd_free_clone -= *nblocks;
 	rbm.rgd->rd_free -= *nblocks;
@@ -2762,8 +2762,8 @@ void gfs2_rlist_free(struct gfs2_rgrp_list *rlist)
 
 void rgrp_lock_local(struct gfs2_rgrpd *rgd)
 {
-	BUG_ON(!gfs2_glock_is_held_excl(rgd->rd_gl) &&
-	       !test_bit(SDF_NORECOVERY, &rgd->rd_sbd->sd_flags));
+	GLOCK_BUG_ON(rgd->rd_gl, !gfs2_glock_is_held_excl(rgd->rd_gl) &&
+		     !test_bit(SDF_NORECOVERY, &rgd->rd_sbd->sd_flags));
 	mutex_lock(&rgd->rd_mutex);
 }
 
-- 
2.31.1

