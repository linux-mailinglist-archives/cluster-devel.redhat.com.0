Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5968D2A290E
	for <lists+cluster-devel@lfdr.de>; Mon,  2 Nov 2020 12:25:33 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-XLnHmGpbOfWflOepjHG38g-1; Mon, 02 Nov 2020 06:25:30 -0500
X-MC-Unique: XLnHmGpbOfWflOepjHG38g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C680B1087D6C;
	Mon,  2 Nov 2020 11:25:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 297955C5DE;
	Mon,  2 Nov 2020 11:25:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D95A4181A06B;
	Mon,  2 Nov 2020 11:25:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09UAKbVw000748 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 30 Oct 2020 06:20:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 95C8610CD919; Fri, 30 Oct 2020 10:20:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 91A3C10CD917
	for <cluster-devel@redhat.com>; Fri, 30 Oct 2020 10:20:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13606185A790
	for <cluster-devel@redhat.com>; Fri, 30 Oct 2020 10:20:33 +0000 (UTC)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com
	[45.249.212.190]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-221-UZ9gnr66P12oxSR7LwLfoQ-1; Fri, 30 Oct 2020 06:20:30 -0400
X-MC-Unique: UZ9gnr66P12oxSR7LwLfoQ-1
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CMyXl0vM2zkcSV;
	Fri, 30 Oct 2020 18:02:31 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS413-HUB.china.huawei.com
	(10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Fri, 30 Oct 2020
	18:02:27 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <rpeterso@redhat.com>, <agruenba@redhat.com>
Date: Fri, 30 Oct 2020 18:13:11 +0800
Message-ID: <20201030101311.39674-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 09UAKbVw000748
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Mon, 02 Nov 2020 06:25:18 -0500
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: fix possible reference leak in
	gfs2_check_blk_type
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

In the fail path of gfs2_check_blk_type, forgetting to call
gfs2_glock_dq_uninit will result in rgd_gh reference leak.

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 fs/gfs2/rgrp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index ee491bb9c1cc..dd3e888994f7 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -2526,8 +2526,10 @@ int gfs2_check_blk_type(struct gfs2_sbd *sdp, u64 no_addr, unsigned int type)
 
 	rbm.rgd = rgd;
 	error = gfs2_rbm_from_block(&rbm, no_addr);
-	if (WARN_ON_ONCE(error))
+	if (WARN_ON_ONCE(error)) {
+		gfs2_glock_dq_uninit(&rgd_gh);
 		goto fail;
+	}
 
 	if (gfs2_testbit(&rbm, false) != type)
 		error = -ESTALE;
-- 
2.17.1


