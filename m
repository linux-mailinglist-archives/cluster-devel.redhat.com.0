Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6032C4E503B
	for <lists+cluster-devel@lfdr.de>; Wed, 23 Mar 2022 11:20:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1648030838;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CWJ8yDzleB19l497oOuv4YOajg7/QSzdlYYa1N0jDAM=;
	b=KKGbXuv2T5KpDDyjCj8JSdbGXqvP9fUpvINtkmTG6DzDhsLyR8gO9DGj3YmPqnJVBdtNyX
	oRSelfW+Ea84K2uG1I519jNL0faE7YpizpM/RDXfGV7xw4k6r3y2GX7FEEx+JZIeKk/mAE
	i37pqva+NKxb4zviIHbGLyYhkNNuzrs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-325-Xp6CaC38PFideL24Ne6_fA-1; Wed, 23 Mar 2022 06:20:35 -0400
X-MC-Unique: Xp6CaC38PFideL24Ne6_fA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 113E5811E84;
	Wed, 23 Mar 2022 10:20:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5F4F4401E39;
	Wed, 23 Mar 2022 10:20:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C670E194034B;
	Wed, 23 Mar 2022 10:20:28 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7E20E1940347 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 23 Mar 2022 10:20:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AA70040D2823; Wed, 23 Mar 2022 10:20:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.37.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F08824010A2F
 for <cluster-devel@redhat.com>; Wed, 23 Mar 2022 10:20:24 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 23 Mar 2022 10:20:22 +0000
Message-Id: <20220323102022.375156-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: [Cluster-devel] [PATCH] gfs2: Return more useful errors from
 gfs2_rgrp_send_discards()
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

sb_issue_discard() can fail for various reasons, so we should return its
return value from gfs2_rgrp_send_discards() to avoid reporting them all
as IO errors.

Signed-off-by: Andrew Price <anprice@redhat.com>
---

 (As far as I can tell there are no limitations on which errno's can be set by ioctl(FITRIM) )

 fs/gfs2/rgrp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 0fb3c01bc557..58f791ed7139 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -1313,7 +1313,7 @@ int gfs2_rgrp_send_discards(struct gfs2_sbd *sdp, u64 offset,
 	u64 blk;
 	sector_t start = 0;
 	sector_t nr_blks = 0;
-	int rv;
+	int rv = -EIO;
 	unsigned int x;
 	u32 trimmed = 0;
 	u8 diff;
@@ -1369,7 +1369,7 @@ int gfs2_rgrp_send_discards(struct gfs2_sbd *sdp, u64 offset,
 	if (sdp->sd_args.ar_discard)
 		fs_warn(sdp, "error %d on discard request, turning discards off for this filesystem\n", rv);
 	sdp->sd_args.ar_discard = 0;
-	return -EIO;
+	return rv;
 }
 
 /**
-- 
2.35.1

