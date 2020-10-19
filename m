Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8BA20293AF6
	for <lists+cluster-devel@lfdr.de>; Tue, 20 Oct 2020 14:07:32 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-iG3nC0gxNTuA8TJmibE_yg-1; Tue, 20 Oct 2020 08:07:30 -0400
X-MC-Unique: iG3nC0gxNTuA8TJmibE_yg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B463EADC20;
	Tue, 20 Oct 2020 12:07:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E6A496EF44;
	Tue, 20 Oct 2020 12:07:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4B94A18408A0;
	Tue, 20 Oct 2020 12:07:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09J83KXh024367 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Oct 2020 04:03:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7E8232144B32; Mon, 19 Oct 2020 08:03:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 791ED2144B2F
	for <cluster-devel@redhat.com>; Mon, 19 Oct 2020 08:03:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D35BA102F1E0
	for <cluster-devel@redhat.com>; Mon, 19 Oct 2020 08:03:16 +0000 (UTC)
Received: from h3cspam02-ex.h3c.com (smtp.h3c.com [60.191.123.50]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-480-mT0D1fj6M9OPWRKFqeg5pA-1; Mon, 19 Oct 2020 04:03:10 -0400
X-MC-Unique: mT0D1fj6M9OPWRKFqeg5pA-1
Received: from h3cspam02-ex.h3c.com (localhost [127.0.0.2] (may be forged))
	by h3cspam02-ex.h3c.com with ESMTP id 09J6sMOX088119;
	Mon, 19 Oct 2020 14:54:22 +0800 (GMT-8)
	(envelope-from tian.xianting@h3c.com)
Received: from DAG2EX03-BASE.srv.huawei-3com.com ([10.8.0.66])
	by h3cspam02-ex.h3c.com with ESMTPS id 09J6rqpA087016
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Oct 2020 14:53:52 +0800 (GMT-8)
	(envelope-from tian.xianting@h3c.com)
Received: from localhost.localdomain (10.99.212.201) by
	DAG2EX03-BASE.srv.huawei-3com.com (10.8.0.66) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.2106.2; Mon, 19 Oct 2020 14:53:54 +0800
From: Xianting Tian <tian.xianting@h3c.com>
To: <rpeterso@redhat.com>, <agruenba@redhat.com>
Date: Mon, 19 Oct 2020 14:43:49 +0800
Message-ID: <20201019064349.48828-1-tian.xianting@h3c.com>
MIME-Version: 1.0
X-Originating-IP: [10.99.212.201]
X-ClientProxiedBy: BJSMTP02-EX.srv.huawei-3com.com (10.63.20.133) To
	DAG2EX03-BASE.srv.huawei-3com.com (10.8.0.66)
X-DNSRBL: 
X-MAIL: h3cspam02-ex.h3c.com 09J6rqpA087016
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Tue, 20 Oct 2020 08:06:46 -0400
Cc: cluster-devel@redhat.com, Xianting Tian <tian.xianting@h3c.com>,
	linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH] gfs2: use helper macro abs()
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
Content-Type: text/plain

Use helper macro abs() to simplify the "x >= y || x <= -y" cmp.

Signed-off-by: Xianting Tian <tian.xianting@h3c.com>
---
 fs/gfs2/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 9f4d9e7be..05eb709de 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -304,7 +304,7 @@ void gfs2_statfs_change(struct gfs2_sbd *sdp, s64 total, s64 free,
 	if (sdp->sd_args.ar_statfs_percent) {
 		x = 100 * l_sc->sc_free;
 		y = m_sc->sc_free * sdp->sd_args.ar_statfs_percent;
-		if (x >= y || x <= -y)
+		if (abs(x) >= y)
 			need_sync = 1;
 	}
 	spin_unlock(&sdp->sd_statfs_spin);
-- 
2.17.1

