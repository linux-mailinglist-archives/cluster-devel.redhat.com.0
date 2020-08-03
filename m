Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id DDD0723A39F
	for <lists+cluster-devel@lfdr.de>; Mon,  3 Aug 2020 13:53:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596455596;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OFRirNY0qbITQuvUs027qrSTzYniVycvgcPdeGaACmE=;
	b=iKjtpe7WbMdvl2Ob6yLd2etIJ4how+LxnbjRPun1q+Lsn9y1e+pHUjD7ulB1M3FV91Ci8R
	xqGVsp6o2KNVPKlhqKIGQBrL7rrHojWjs/TD2EL6ipDde5nxhTERWqPqpTisNnft32VXZh
	oHbahUMAm2fTDt/JDztcSPFFHek4tbQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-5zusfp4yOWCLFOZw-SJfxQ-1; Mon, 03 Aug 2020 07:53:15 -0400
X-MC-Unique: 5zusfp4yOWCLFOZw-SJfxQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2748D80BCA2;
	Mon,  3 Aug 2020 11:53:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24D138FA22;
	Mon,  3 Aug 2020 11:53:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9867C1809554;
	Mon,  3 Aug 2020 11:53:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 073BqIEe029385 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 3 Aug 2020 07:52:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E7C6471766; Mon,  3 Aug 2020 11:52:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.194.131])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ED95B71762;
	Mon,  3 Aug 2020 11:52:14 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon,  3 Aug 2020 13:52:13 +0200
Message-Id: <20200803115213.432367-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: stable@vger.kernel.org
Subject: [Cluster-devel] [PATCH] gfs2: Fix refcount leak in gfs2_glock_poke
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

In gfs2_glock_poke, make sure gfs2_holder_uninit is called on the local
glock holder.  Without that, we're leaking a glock and a pid reference.

Fixes: 9e8990dea926 ("gfs2: Smarter iopen glock waiting")
Cc: stable@vger.kernel.org # v5.8+
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 57134d326cfa..f13b136654ca 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -790,9 +790,11 @@ static void gfs2_glock_poke(struct gfs2_glock *gl)
 	struct gfs2_holder gh;
 	int error;
 
-	error = gfs2_glock_nq_init(gl, LM_ST_SHARED, flags, &gh);
+	gfs2_holder_init(gl, LM_ST_SHARED, flags, &gh);
+	error = gfs2_glock_nq(&gh);
 	if (!error)
 		gfs2_glock_dq(&gh);
+	gfs2_holder_uninit(&gh);
 }
 
 static bool gfs2_try_evict(struct gfs2_glock *gl)
-- 
2.26.2

