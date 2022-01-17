Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B67D5490BBB
	for <lists+cluster-devel@lfdr.de>; Mon, 17 Jan 2022 16:49:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642434548;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZCt7qf+vzAYbWb7b8inys0wKXTFXUHWkwKhUx32Ar7s=;
	b=h8Qkb/eG8cDTbYZgaLzrbKRgvjA5NHuPENXr8kn4u2i62vVNeeIFEQQXR52T5ECgzf4PC9
	6IPJ7+brpYWer0XdviseXhSy9X3QgCxxduPqrt0lAe6xtBmG346I2jv1EVs4fGdU3Kpb8f
	IqxjIyZdQmImGzrIH8g8U7lNN0mLEmc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-dSaTsCORPmaYERw_f7WOuQ-1; Mon, 17 Jan 2022 10:49:05 -0500
X-MC-Unique: dSaTsCORPmaYERw_f7WOuQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4280100C629;
	Mon, 17 Jan 2022 15:49:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD86277453;
	Mon, 17 Jan 2022 15:49:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 39A631806D03;
	Mon, 17 Jan 2022 15:49:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20HFn0e3002160 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 17 Jan 2022 10:49:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F320F7BB66; Mon, 17 Jan 2022 15:48:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (unknown [10.2.16.141])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AA7857BB6A
	for <cluster-devel@redhat.com>; Mon, 17 Jan 2022 15:48:55 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 17 Jan 2022 10:48:55 -0500
Message-Id: <20220117154855.217892-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: assign rgrp glock before
	compute_bitstructs
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Before this patch, function read_rindex_entry called compute_bitstructs
before it allocated a glock for the rgrp. But if compute_bitstructs found
a problem with the rgrp, it called gfs2_consist_rgrpd, and that called
gfs2_dump_glock for rgd->rd_gl which had not yet been assigned.

read_rindex_entry
   compute_bitstructs
      gfs2_consist_rgrpd
         gfs2_dump_glock <---------rgd->rd_gl was not set.

This patch changes read_rindex_entry so it assigns an rgrp glock before
calling compute_bitstructs so gfs2_dump_glock does not reference an
unassigned pointer. If an error is discovered, the glock must also be
put, so a new goto and label were added.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Reported-by: syzbot+c6fd14145e2f62ca0784@syzkaller.appspotmail.com
---
 fs/gfs2/rgrp.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 0fb3c01bc557..9b04a570c582 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -922,15 +922,15 @@ static int read_rindex_entry(struct gfs2_inode *ip)
 	spin_lock_init(&rgd->rd_rsspin);
 	mutex_init(&rgd->rd_mutex);
 
-	error = compute_bitstructs(rgd);
-	if (error)
-		goto fail;
-
 	error = gfs2_glock_get(sdp, rgd->rd_addr,
 			       &gfs2_rgrp_glops, CREATE, &rgd->rd_gl);
 	if (error)
 		goto fail;
 
+	error = compute_bitstructs(rgd);
+	if (error)
+		goto fail_glock;
+
 	rgd->rd_rgl = (struct gfs2_rgrp_lvb *)rgd->rd_gl->gl_lksb.sb_lvbptr;
 	rgd->rd_flags &= ~GFS2_RDF_PREFERRED;
 	if (rgd->rd_data > sdp->sd_max_rg_data)
@@ -944,6 +944,7 @@ static int read_rindex_entry(struct gfs2_inode *ip)
 	}
 
 	error = 0; /* someone else read in the rgrp; free it and ignore it */
+fail_glock:
 	gfs2_glock_put(rgd->rd_gl);
 
 fail:
-- 
2.34.1

