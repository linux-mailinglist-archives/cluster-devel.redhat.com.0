Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6D64E4672
	for <lists+cluster-devel@lfdr.de>; Tue, 22 Mar 2022 20:06:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647975962;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VNSXCyf7Hfqviae1lpZzEwTOnix0tsYSoHA7daqYDoI=;
	b=KUKTXnQMQNDPA+6fK4bYodXrfFhDIdvic4VBBJBZe/syOno5VLYAmAi2ZewVrmeCDru7cs
	tJXW2dnp4eNHeBH7wDy9kBWrVUCzW0ips+wBCG1fkb2zJd/Rr+ZzaXHp02DcZk+ZV+NNso
	ZbOUBVL+HrewtGNMtTXU0L5XzG6Zh64=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-343-l_vuhQUwMDW0SvdE5ayL_Q-1; Tue, 22 Mar 2022 15:05:59 -0400
X-MC-Unique: l_vuhQUwMDW0SvdE5ayL_Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C03B80159B;
	Tue, 22 Mar 2022 19:05:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 34CC62166B46;
	Tue, 22 Mar 2022 19:05:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E48D21940347;
	Tue, 22 Mar 2022 19:05:55 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5CF7F1949762 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 22 Mar 2022 19:05:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1234C1400E70; Tue, 22 Mar 2022 19:05:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.37.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BDB01400C2F
 for <cluster-devel@redhat.com>; Tue, 22 Mar 2022 19:05:53 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Tue, 22 Mar 2022 19:05:51 +0000
Message-Id: <20220322190551.357960-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: [Cluster-devel] [PATCH] gfs2: Make sure FITRIM minlen is rounded up
 to fs block size
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Per fstrim(8) we must round up the minlen argument to the fs block size.
The current calculation doesn't take into account devices that have a
discard granularity and requested minlen less than 1 fs block, so the
value can get shifted away to zero in the translation to fs blocks.

The zero minlen passed to gfs2_rgrp_send_discards() then allows
sb_issue_discard() to be called with nr_sects == 0 which returns -EINVAL
and results in gfs2_rgrp_send_discards() returning -EIO.

Make sure minlen is never < 1 fs block by taking the max of the
requested minlen and the fs block size before comparing to the device's
discard granularity and shifting to fs blocks.

Fixes: 076f0faa764ab ("GFS2: Fix FITRIM argument handling")
Signed-off-by: Andrew Price <anprice@redhat.com>
---
 fs/gfs2/rgrp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 0fb3c01bc557..a34945cbf32a 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -1415,7 +1415,8 @@ int gfs2_fitrim(struct file *filp, void __user *argp)
 
 	start = r.start >> bs_shift;
 	end = start + (r.len >> bs_shift);
-	minlen = max_t(u64, r.minlen,
+	minlen = max_t(u64, r.minlen, sdp->sd_sb.sb_bsize);
+	minlen = max_t(u64, minlen,
 		       q->limits.discard_granularity) >> bs_shift;
 
 	if (end <= start || minlen > sdp->sd_max_rg_data)
-- 
2.35.1

