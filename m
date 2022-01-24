Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7467D498284
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Jan 2022 15:39:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643035140;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=okwiZ5K5pRexXg5nEDqQ+gOPtAsrgQVrfDeT3e+045s=;
	b=LSF+bnhxzxHoquqqRev/L4DLuJqjq/8jEfkvvVwTIgdO8Ggbwd3MregL/0YWkBUrWuajS8
	47ggHEPMUC0LZ5cSulroJ0O0IKR8AZWL6EWRjAj3sz8XVISkSAXVpkDtS8aO97ES1s3OgS
	qVntg7QlWxIYizIWbmD332dspANDMOI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-338-4OJlyCEmOjupoTUD9qu91g-1; Mon, 24 Jan 2022 09:38:57 -0500
X-MC-Unique: 4OJlyCEmOjupoTUD9qu91g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B88F94EE0;
	Mon, 24 Jan 2022 14:38:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD45E105C728;
	Mon, 24 Jan 2022 14:38:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DCF5A4BB7C;
	Mon, 24 Jan 2022 14:38:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20OEbVg6015831 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 24 Jan 2022 09:37:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 395C28470E; Mon, 24 Jan 2022 14:37:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (unknown [10.2.16.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E367184651
	for <cluster-devel@redhat.com>; Mon, 24 Jan 2022 14:36:57 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 24 Jan 2022 09:36:57 -0500
Message-Id: <20220124143657.550918-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: Change more BUG_ON to GLOCK_BUG_ON
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

This patch changes some BUG_ON calls to GLOCK_BUG_ON so we get more
information to help with debugging when reservation problems occur.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/rgrp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 9b04a570c582..e14520b451db 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -49,7 +49,7 @@ static inline struct gfs2_bitmap *rbm_bi(const struct gfs2_rbm *rbm)
 
 static inline u64 gfs2_rbm_to_block(const struct gfs2_rbm *rbm)
 {
-	BUG_ON(rbm->offset >= rbm->rgd->rd_data);
+	GLOCK_BUG_ON(rbm->rgd->rd_gl, rbm->offset >= rbm->rgd->rd_data);
 	return rbm->rgd->rd_data0 + (rbm_bi(rbm)->bi_start * GFS2_NBBY) +
 		rbm->offset;
 }
@@ -1492,7 +1492,7 @@ static void rs_insert(struct gfs2_inode *ip)
 	struct gfs2_blkreserv *rs = &ip->i_res;
 	struct gfs2_rgrpd *rgd = rs->rs_rgd;
 
-	BUG_ON(gfs2_rs_active(rs));
+	GLOCK_BUG_ON(rgd->rd_gl, gfs2_rs_active(rs));
 
 	spin_lock(&rgd->rd_rsspin);
 	newn = &rgd->rd_rstree.rb_node;
@@ -2426,7 +2426,7 @@ int gfs2_alloc_blocks(struct gfs2_inode *ip, u64 *bn, unsigned int *nblocks,
 	u32 minext = 1;
 	int error = -ENOSPC;
 
-	BUG_ON(ip->i_res.rs_reserved < *nblocks);
+	GLOCK_BUG_ON(rbm.rgd->rd_gl, ip->i_res.rs_reserved < *nblocks);
 
 	rgrp_lock_local(rbm.rgd);
 	if (gfs2_rs_active(&ip->i_res)) {
-- 
2.34.1

