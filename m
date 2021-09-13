Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2A10F409D1E
	for <lists+cluster-devel@lfdr.de>; Mon, 13 Sep 2021 21:31:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631561465;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tHDQTOMRAaFZ8Ol1zWqGe2b3dyjFbw7NmRG4lxJCCWA=;
	b=TP6M2RQKQsTYnWZaK8jIvv+oxGzz3NLy+hZ84YRcZ31tUj4TTdSaQ6BlcFaaL/S1zMbgra
	Dzek+R9xpB4vqZgScifrcAkEh5AYTQuYXm/0an4Ec9nuAQOS+45iY/4115a/Bt4cLL6NDl
	qdvKlGcKSYTCy0dz4L18033sf+wB5YM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-EN7a-liqMRGgvZTM0_mUQA-1; Mon, 13 Sep 2021 15:31:03 -0400
X-MC-Unique: EN7a-liqMRGgvZTM0_mUQA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13090108468F;
	Mon, 13 Sep 2021 19:31:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3F1860C82;
	Mon, 13 Sep 2021 19:31:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A68FE1805989;
	Mon, 13 Sep 2021 19:31:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18DJUXxa016756 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 13 Sep 2021 15:30:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7E9185D9DD; Mon, 13 Sep 2021 19:30:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-80.phx2.redhat.com [10.3.112.80])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4E0655D9CA
	for <cluster-devel@redhat.com>; Mon, 13 Sep 2021 19:30:33 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 13 Sep 2021 14:30:25 -0500
Message-Id: <20210913193028.75116-2-rpeterso@redhat.com>
In-Reply-To: <20210913193028.75116-1-rpeterso@redhat.com>
References: <20210913193028.75116-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 1/4] gfs2: remove redundant check in
	gfs2_rgrp_go_lock
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Before this patch function gfs2_rgrp_go_lock checked if GL_SKIP and
ar_rgrplvb were both true. However, GL_SKIP is only set for rgrps if
ar_rgrplvb is true (see gfs2_inplace_reserve). This patch simply removes
the redundant check.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/rgrp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index c3b00ba92ed2..7a13a687e4f2 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -1291,9 +1291,8 @@ static int update_rgrp_lvb(struct gfs2_rgrpd *rgd)
 int gfs2_rgrp_go_lock(struct gfs2_holder *gh)
 {
 	struct gfs2_rgrpd *rgd = gh->gh_gl->gl_object;
-	struct gfs2_sbd *sdp = rgd->rd_sbd;
 
-	if (gh->gh_flags & GL_SKIP && sdp->sd_args.ar_rgrplvb)
+	if (gh->gh_flags & GL_SKIP)
 		return 0;
 	return gfs2_rgrp_bh_get(rgd);
 }
-- 
2.31.1

