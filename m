Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id BF22758068
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Jun 2019 12:31:07 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B3D3F3092652;
	Thu, 27 Jun 2019 10:30:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F0F55C1B4;
	Thu, 27 Jun 2019 10:30:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 757B418338E4;
	Thu, 27 Jun 2019 10:30:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5R36qNu012954 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 26 Jun 2019 23:06:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6908E19733; Thu, 27 Jun 2019 03:06:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5027619C5B;
	Thu, 27 Jun 2019 03:06:50 +0000 (UTC)
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.217.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C63FF30821AE;
	Thu, 27 Jun 2019 03:06:48 +0000 (UTC)
Received: from mse-fl2.zte.com.cn (unknown [10.30.14.239])
	by Forcepoint Email with ESMTPS id 3EE8E2C9276DC129DA98;
	Thu, 27 Jun 2019 11:06:47 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse-fl2.zte.com.cn with ESMTP id x5R35oef016048;
	Thu, 27 Jun 2019 11:05:50 +0800 (GMT-8)
	(envelope-from yang.bin18@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2019062711061544-1753646 ;
	Thu, 27 Jun 2019 11:06:15 +0800 
From: Yang Bin <yang.bin18@zte.com.cn>
To: rpeterso@redhat.com
Date: Thu, 27 Jun 2019 11:04:30 +0800
Message-Id: <1561604670-11476-1-git-send-email-yang.bin18@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2019-06-27 11:06:15,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2019-06-27 11:05:54,
	Serialize complete at 2019-06-27 11:05:54
X-MAIL: mse-fl2.zte.com.cn x5R35oef016048
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.47]); Thu, 27 Jun 2019 03:06:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Thu, 27 Jun 2019 03:06:49 +0000 (UTC) for IP:'63.217.80.70'
	DOMAIN:'mxhk.zte.com.cn' HELO:'mxhk.zte.com.cn'
	FROM:'yang.bin18@zte.com.cn' RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 63.217.80.70 mxhk.zte.com.cn 63.217.80.70
	mxhk.zte.com.cn <yang.bin18@zte.com.cn>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Thu, 27 Jun 2019 06:30:14 -0400
Cc: cluster-devel@redhat.com, wang.yi59@zte.com.cn,
	Yang Bin  <yang.bin18@zte.com.cn>, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH] sub sd_rgrps When clear rgrp
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Thu, 27 Jun 2019 10:31:06 +0000 (UTC)

From: " Yang Bin "<yang.bin18@zte.com.cn>

When clear rgrp,sub sd_rgrps after erased from rindex_tree

Signed-off-by: Yang Bin <yang.bin18@zte.com.cn>
---
 fs/gfs2/rgrp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 15d6e32..a4b2e83
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -730,6 +730,7 @@ void gfs2_clear_rgrpd(struct gfs2_sbd *sdp)
 		gl = rgd->rd_gl;
 
 		rb_erase(n, &sdp->sd_rindex_tree);
+		sdp->sd_rgrps--;
 
 		if (gl) {
 			glock_clear_object(gl, rgd);
-- 
1.8.3.1

