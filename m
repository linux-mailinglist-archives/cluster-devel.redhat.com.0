Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0A6C739F31D
	for <lists+cluster-devel@lfdr.de>; Tue,  8 Jun 2021 12:01:29 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-iICjSdetP6OWBMnCTBEISA-1; Tue, 08 Jun 2021 06:01:27 -0400
X-MC-Unique: iICjSdetP6OWBMnCTBEISA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3CAA1936B8D;
	Tue,  8 Jun 2021 10:01:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DCD6B163EB;
	Tue,  8 Jun 2021 10:01:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AA05C1801266;
	Tue,  8 Jun 2021 10:01:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1583Nbqh014298 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 7 Jun 2021 23:23:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C34D8205FAAA; Tue,  8 Jun 2021 03:23:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BEBE9205FAB9
	for <cluster-devel@redhat.com>; Tue,  8 Jun 2021 03:23:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8FFA280D0E1
	for <cluster-devel@redhat.com>; Tue,  8 Jun 2021 03:23:34 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com
	[45.249.212.187]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-538-RrL-bsvPMtugDQB6qo3Bow-1; Mon, 07 Jun 2021 23:23:30 -0400
X-MC-Unique: RrL-bsvPMtugDQB6qo3Bow-1
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FzZgl5kchzWtHR;
	Tue,  8 Jun 2021 10:58:43 +0800 (CST)
Received: from dggpeml500020.china.huawei.com (7.185.36.88) by
	dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.2176.2; Tue, 8 Jun 2021 11:03:34 +0800
Received: from huawei.com (10.175.127.227) by dggpeml500020.china.huawei.com
	(7.185.36.88) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2;
	Tue, 8 Jun 2021 11:03:33 +0800
From: Baokun Li <libaokun1@huawei.com>
To: <linux-kernel@vger.kernel.org>, Bob Peterson <rpeterso@redhat.com>,
	Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 8 Jun 2021 11:12:44 +0800
Message-ID: <20210608031244.2822705-1-libaokun1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
	dggpeml500020.china.huawei.com (7.185.36.88)
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1583Nbqh014298
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Tue, 08 Jun 2021 06:01:16 -0400
Cc: Hulk Robot <hulkci@huawei.com>, kernel-janitors@vger.kernel.org,
	yuehaibing@huawei.com, cluster-devel@redhat.com,
	yangjihong1@huawei.com, libaokun1@huawei.com, yukuai3@huawei.com,
	weiyongjun1@huawei.com
Subject: [Cluster-devel] [PATCH -next] gfs2: Use list_move_tail instead of
	list_del/list_add_tail
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit

Using list_move_tail() instead of list_del() + list_add_tail().

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Baokun Li <libaokun1@huawei.com>
---
 fs/gfs2/glock.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index f6cae2ee1c83..902dd7385462 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -212,8 +212,7 @@ void gfs2_glock_add_to_lru(struct gfs2_glock *gl)
 
 	spin_lock(&lru_lock);
 
-	list_del(&gl->gl_lru);
-	list_add_tail(&gl->gl_lru, &lru_list);
+	list_move_tail(&gl->gl_lru, &lru_list);
 
 	if (!test_bit(GLF_LRU, &gl->gl_flags)) {
 		set_bit(GLF_LRU, &gl->gl_flags);


