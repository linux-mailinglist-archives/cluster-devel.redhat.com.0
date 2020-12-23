Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4F6FB2E9405
	for <lists+cluster-devel@lfdr.de>; Mon,  4 Jan 2021 12:23:34 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-Zqslni7DPoWnkssh0soADQ-1; Mon, 04 Jan 2021 06:23:31 -0500
X-MC-Unique: Zqslni7DPoWnkssh0soADQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EE44800D55;
	Mon,  4 Jan 2021 11:23:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F1DC25D756;
	Mon,  4 Jan 2021 11:23:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F0F7C1809CA1;
	Mon,  4 Jan 2021 11:23:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BNEXFO6021196 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 23 Dec 2020 09:33:15 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1E80E2026D3C; Wed, 23 Dec 2020 14:33:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 197CE2026D3A
	for <cluster-devel@redhat.com>; Wed, 23 Dec 2020 14:33:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDBCB805AF4
	for <cluster-devel@redhat.com>; Wed, 23 Dec 2020 14:33:11 +0000 (UTC)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com
	[45.249.212.190]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-203-0Ai9FahKMRuRn12pv2omBQ-1; Wed, 23 Dec 2020 09:33:08 -0500
X-MC-Unique: 0Ai9FahKMRuRn12pv2omBQ-1
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4D1FWk6JmZz15gmW;
	Wed, 23 Dec 2020 22:12:02 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
	DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server
	id 14.3.498.0; Wed, 23 Dec 2020 22:12:37 +0800
From: Zheng Yongjun <zhengyongjun3@huawei.com>
To: <cluster-devel@redhat.com>, <linux-kernel@vger.kernel.org>
Date: Wed, 23 Dec 2020 22:13:13 +0800
Message-ID: <20201223141313.669-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.138.68]
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0BNEXFO6021196
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Mon, 04 Jan 2021 06:23:24 -0500
Cc: Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [Cluster-devel] [PATCH -next] dlm: use DEFINE_MUTEX (and
	mutex_init() had been too late)
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 fs/dlm/lockspace.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index 624617c12250..2b3c32f2d29d 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -26,7 +26,7 @@
 #include "ast.h"
 
 static int			ls_count;
-static struct mutex		ls_lock;
+static DEFINE_MUTEX(ls_lock);
 static struct list_head		lslist;
 static spinlock_t		lslist_lock;
 static struct task_struct *	scand_task;
@@ -231,7 +231,6 @@ static const struct kset_uevent_ops dlm_uevent_ops = {
 int __init dlm_lockspace_init(void)
 {
 	ls_count = 0;
-	mutex_init(&ls_lock);
 	INIT_LIST_HEAD(&lslist);
 	spin_lock_init(&lslist_lock);
 
-- 
2.22.0


