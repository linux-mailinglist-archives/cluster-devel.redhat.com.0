Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 879BF4F2F35
	for <lists+cluster-devel@lfdr.de>; Tue,  5 Apr 2022 14:09:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649160540;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IoQV32cR5+NZ8W9slfyzzJ4oamM7Z1MxQI8XGpqsWJU=;
	b=eZovo+0bgljeEb/DdL4Jacbkqn0cD99k088fbexgayOq9BNuF7+6wBnydcDHF08KarRut4
	IT/vKTnI9LGyR8uBt/izJLoN+Ej2ouqUFi/ptAIqu7sHf5qOfDFBJ2DY3yuEZf/3FB9r8Z
	57lD/j5kKPMXiniyvQOcANFHKaBJBwg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-17-_R_iL-DJNGSzpijR9S8RDw-1; Tue, 05 Apr 2022 08:08:56 -0400
X-MC-Unique: _R_iL-DJNGSzpijR9S8RDw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 856E5185A79C;
	Tue,  5 Apr 2022 12:08:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 20B0A401E0A;
	Tue,  5 Apr 2022 12:08:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C92A91940369;
	Tue,  5 Apr 2022 12:08:50 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0F09219466DF for <cluster-devel@listman.corp.redhat.com>;
 Tue,  5 Apr 2022 12:08:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E09D840D2962; Tue,  5 Apr 2022 12:08:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.37.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6422A40D282A
 for <cluster-devel@redhat.com>; Tue,  5 Apr 2022 12:08:49 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Tue,  5 Apr 2022 13:08:47 +0100
Message-Id: <20220405120847.583327-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: [Cluster-devel] [PATCH RESEND] gfs2: Return more useful errors from
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The bug that 27ca8273f ("gfs2: Make sure FITRIM minlen is rounded up to
fs block size") fixes was a little confusing as the user saw
"Input/output error" which masked the -EINVAL that sb_issue_discard()
returned.

sb_issue_discard() can fail for various reasons, so we should return its
return value from gfs2_rgrp_send_discards() to avoid all errors being
reported as IO errors.

This improves error reporting for FITRIM and makes no difference to the
-o discard code path because the return value from
gfs2_rgrp_send_discards() gets thrown away in that case (and the option
switches off). Presumably that's why it was ok to just return -EIO in
the past, before FITRIM was implemented.

Tested with xfstests.

Signed-off-by: Andrew Price <anprice@redhat.com>
---

I don't see this in for-next yet so I've updated the commit log to include more
details.

 fs/gfs2/rgrp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 801ad9f4f2be..886343cc05ab 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -1315,7 +1315,7 @@ int gfs2_rgrp_send_discards(struct gfs2_sbd *sdp, u64 offset,
 	u64 blk;
 	sector_t start = 0;
 	sector_t nr_blks = 0;
-	int rv;
+	int rv = -EIO;
 	unsigned int x;
 	u32 trimmed = 0;
 	u8 diff;
@@ -1371,7 +1371,7 @@ int gfs2_rgrp_send_discards(struct gfs2_sbd *sdp, u64 offset,
 	if (sdp->sd_args.ar_discard)
 		fs_warn(sdp, "error %d on discard request, turning discards off for this filesystem\n", rv);
 	sdp->sd_args.ar_discard = 0;
-	return -EIO;
+	return rv;
 }
 
 /**
-- 
2.35.1

