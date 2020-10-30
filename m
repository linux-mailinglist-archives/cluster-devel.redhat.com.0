Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id CB8EA2A1089
	for <lists+cluster-devel@lfdr.de>; Fri, 30 Oct 2020 22:52:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604094734;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lP678v4N9mSBH74MGHFK5YiIb3ZT3usxEzsuYEPq0og=;
	b=KY+fen25ptCP9p/IM2LbjU45T2Lm2uAAsFn4JJmUUbTKTZNVtCUa+aD15dsVRsNlZIPOXd
	uQ+HzJJxoVo3DvWeBCYaKZBsY6Y2YEkatf7j5Galy4Q7lyPxI3kA+7KZycKOh/dYya428J
	iBfoe1/9yW2s4zS+eedahvch8zohgnQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-yEEXMxpoNKSmCMbY65ebjw-1; Fri, 30 Oct 2020 17:52:13 -0400
X-MC-Unique: yEEXMxpoNKSmCMbY65ebjw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 997D01842179;
	Fri, 30 Oct 2020 21:52:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 87F894149;
	Fri, 30 Oct 2020 21:52:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6DC2D181A87F;
	Fri, 30 Oct 2020 21:52:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09ULq2V5024025 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 30 Oct 2020 17:52:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9F9FB4149; Fri, 30 Oct 2020 21:52:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DA78468431;
	Fri, 30 Oct 2020 21:52:01 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Fri, 30 Oct 2020 22:51:39 +0100
Message-Id: <20201030215152.1567790-5-agruenba@redhat.com>
In-Reply-To: <20201030215152.1567790-1-agruenba@redhat.com>
References: <20201030215152.1567790-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 04/17] gfs2: Minor gfs2_inplace_reserve
	cleanup
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Clean up the reservation size computation logic in gfs2_inplace_reserve a
little.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/rgrp.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 431f994848b2..13b3bb04ca3a 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -2041,12 +2041,13 @@ int gfs2_inplace_reserve(struct gfs2_inode *ip, struct gfs2_alloc_parms *ap)
 	struct gfs2_blkreserv *rs = &ip->i_res;
 	int error = 0, rg_locked, flags = 0;
 	u64 last_unlinked = NO_BLOCK;
+	u32 target = ap->target;
 	int loops = 0;
 	u32 free_blocks, skip = 0;
 
 	if (sdp->sd_args.ar_rgrplvb)
 		flags |= GL_SKIP;
-	if (gfs2_assert_warn(sdp, ap->target))
+	if (gfs2_assert_warn(sdp, target))
 		return -EINVAL;
 	if (gfs2_rs_active(rs)) {
 		begin = rs->rs_rgd;
@@ -2098,7 +2099,7 @@ int gfs2_inplace_reserve(struct gfs2_inode *ip, struct gfs2_alloc_parms *ap)
 		/* Skip unusable resource groups */
 		if ((rs->rs_rgd->rd_flags & (GFS2_RGF_NOALLOC |
 						 GFS2_RDF_ERROR)) ||
-		    (loops == 0 && ap->target > rs->rs_rgd->rd_extfail_pt))
+		    (loops == 0 && target > rs->rs_rgd->rd_extfail_pt))
 			goto skip_rgrp;
 
 		if (sdp->sd_args.ar_rgrplvb)
@@ -2114,9 +2115,7 @@ int gfs2_inplace_reserve(struct gfs2_inode *ip, struct gfs2_alloc_parms *ap)
 
 		/* If rgrp has enough free space, use it */
 		free_blocks = rgd_free(rs->rs_rgd, rs);
-		if (free_blocks >= ap->target ||
-		    (loops == 2 && ap->min_target &&
-		     free_blocks >= ap->min_target)) {
+		if (free_blocks >= target) {
 			ap->allowed = free_blocks;
 			return 0;
 		}
@@ -2152,9 +2151,12 @@ int gfs2_inplace_reserve(struct gfs2_inode *ip, struct gfs2_alloc_parms *ap)
 				return error;
 		}
 		/* Flushing the log may release space */
-		if (loops == 2)
+		if (loops == 2) {
+			if (ap->min_target)
+				target = ap->min_target;
 			gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_NORMAL |
 				       GFS2_LFC_INPLACE_RESERVE);
+		}
 	}
 
 	return -ENOSPC;
-- 
2.26.2

