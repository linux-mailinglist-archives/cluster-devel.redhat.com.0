Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8DBFC3B5D21
	for <lists+cluster-devel@lfdr.de>; Mon, 28 Jun 2021 13:28:32 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-0LrIVPHYMTiA7Htiu8v72w-1; Mon, 28 Jun 2021 07:28:30 -0400
X-MC-Unique: 0LrIVPHYMTiA7Htiu8v72w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9EF3100CEF2;
	Mon, 28 Jun 2021 11:28:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 409D25C1CF;
	Mon, 28 Jun 2021 11:28:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2C1794EA29;
	Mon, 28 Jun 2021 11:28:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15SBMxld017134 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 28 Jun 2021 07:22:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 61F54202A96A; Mon, 28 Jun 2021 11:22:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E046202A969
	for <cluster-devel@redhat.com>; Mon, 28 Jun 2021 11:22:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1BF71064E6B
	for <cluster-devel@redhat.com>; Mon, 28 Jun 2021 11:22:56 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com
	[45.249.212.187]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-449-Gg1f6BozPza8wmh4HEbiKw-1; Mon, 28 Jun 2021 07:22:52 -0400
X-MC-Unique: Gg1f6BozPza8wmh4HEbiKw-1
Received: from dggeme764-chm.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GD4Vb2st5zZkbp;
	Mon, 28 Jun 2021 19:04:07 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
	dggeme764-chm.china.huawei.com (10.3.19.110) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.2176.2; Mon, 28 Jun 2021 19:07:11 +0800
From: Jing Xiangfeng <jingxiangfeng@huawei.com>
To: <rpeterso@redhat.com>, <agruenba@redhat.com>, <adas@redhat.com>
Date: Mon, 28 Jun 2021 19:14:50 +0800
Message-ID: <20210628111450.194262-1-jingxiangfeng@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
	dggeme764-chm.china.huawei.com (10.3.19.110)
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 15SBMxld017134
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Mon, 28 Jun 2021 07:28:16 -0400
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
	jingxiangfeng@huawei.com
Subject: [Cluster-devel] [PATCH] gfs2: Fix error handling in init_statfs()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

In an error path of init_statfs(), it calls iput to put pn which has been
put. Jump to correct label to fix it.

Fixes: 97fd734ba17e ("gfs2: lookup local statfs inodes prior to journal recovery")
Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
---
 fs/gfs2/ops_fstype.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 826f77d9cff5..e9ebab1af62f 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -692,7 +692,8 @@ static int init_statfs(struct gfs2_sbd *sdp)
 				   &sdp->sd_sc_gh);
 	if (error) {
 		fs_err(sdp, "can't lock local \"sc\" file: %d\n", error);
-		goto free_local;
+		free_local_statfs_inodes(sdp);
+		goto put_statfs;
 	}
 	return 0;
 
-- 
2.26.0.106.g9fadedd


