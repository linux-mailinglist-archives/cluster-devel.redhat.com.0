Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id F0DCA28DE24
	for <lists+cluster-devel@lfdr.de>; Wed, 14 Oct 2020 11:58:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602669536;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RpUS8TNitppDUWOD9n34l3p3Cl+OG2kkGIG0h2Jqsws=;
	b=PU5Ic7dWBFnxFgDf8yKbAJGuSLUeRHC4PeLMRvFjS6el8N0Z+64k3t3EUEXYDE360YBP7c
	HSfNHg2e/W0T+yahKgGzRRXTFf/EDoFDzi12Dp3jvgKdJKK1y6CR+hwb8v11kDPqWS83Ou
	5lxGWZ0OlqfESgKrFF0e9jZQboqMMsk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-2N01-UAjOz6jov7N8eCRcg-1; Wed, 14 Oct 2020 05:58:54 -0400
X-MC-Unique: 2N01-UAjOz6jov7N8eCRcg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E153E800597;
	Wed, 14 Oct 2020 09:58:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E2FA6EF54;
	Wed, 14 Oct 2020 09:58:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 632C55810F;
	Wed, 14 Oct 2020 09:58:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09E9wib7001379 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 14 Oct 2020 05:58:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 56E157666B; Wed, 14 Oct 2020 09:58:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9103550B44;
	Wed, 14 Oct 2020 09:58:43 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 14 Oct 2020 11:58:20 +0200
Message-Id: <20201014095833.1035870-5-agruenba@redhat.com>
In-Reply-To: <20201014095833.1035870-1-agruenba@redhat.com>
References: <20201014095833.1035870-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [RFC 04/17] gfs2: Minor gfs2_inplace_reserve cleanup
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
index af3e15baea89..6c246bf7eada 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -2045,12 +2045,13 @@ int gfs2_inplace_reserve(struct gfs2_inode *ip, struct gfs2_alloc_parms *ap)
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
@@ -2102,7 +2103,7 @@ int gfs2_inplace_reserve(struct gfs2_inode *ip, struct gfs2_alloc_parms *ap)
 		/* Skip unusable resource groups */
 		if ((rs->rs_rgd->rd_flags & (GFS2_RGF_NOALLOC |
 						 GFS2_RDF_ERROR)) ||
-		    (loops == 0 && ap->target > rs->rs_rgd->rd_extfail_pt))
+		    (loops == 0 && target > rs->rs_rgd->rd_extfail_pt))
 			goto skip_rgrp;
 
 		if (sdp->sd_args.ar_rgrplvb)
@@ -2118,9 +2119,7 @@ int gfs2_inplace_reserve(struct gfs2_inode *ip, struct gfs2_alloc_parms *ap)
 
 		/* If rgrp has enough free space, use it */
 		free_blocks = rgd_free(rs->rs_rgd, rs);
-		if (free_blocks >= ap->target ||
-		    (loops == 2 && ap->min_target &&
-		     free_blocks >= ap->min_target)) {
+		if (free_blocks >= target) {
 			ap->allowed = free_blocks;
 			return 0;
 		}
@@ -2156,9 +2155,12 @@ int gfs2_inplace_reserve(struct gfs2_inode *ip, struct gfs2_alloc_parms *ap)
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

