Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id DB4FE355366
	for <lists+cluster-devel@lfdr.de>; Tue,  6 Apr 2021 14:14:16 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-YS05bgz4Mp-KfCJkjuj5HQ-1; Tue, 06 Apr 2021 08:14:14 -0400
X-MC-Unique: YS05bgz4Mp-KfCJkjuj5HQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA46C107ACCD;
	Tue,  6 Apr 2021 12:14:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AAD105D6DC;
	Tue,  6 Apr 2021 12:14:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1B15B1809C81;
	Tue,  6 Apr 2021 12:14:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 136C9nfd032662 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 6 Apr 2021 08:09:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0E21963F87; Tue,  6 Apr 2021 12:09:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 084715F25E
	for <cluster-devel@redhat.com>; Tue,  6 Apr 2021 12:09:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0AC0185A5A8
	for <cluster-devel@redhat.com>; Tue,  6 Apr 2021 12:09:46 +0000 (UTC)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com
	[45.249.212.190]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-405--j6iy--7Pvuyh-6rk_A_fw-1; Tue, 06 Apr 2021 08:09:43 -0400
X-MC-Unique: -j6iy--7Pvuyh-6rk_A_fw-1
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FF5Tg1JMCzpVLN;
	Tue,  6 Apr 2021 19:51:35 +0800 (CST)
Received: from mdc.localdomain (10.175.104.57) by
	DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server
	id 14.3.498.0; Tue, 6 Apr 2021 19:54:12 +0800
From: Huang Guobin <huangguobin4@huawei.com>
To: <huangguobin4@huawei.com>, Christine Caulfield <ccaulfie@redhat.com>,
	David Teigland <teigland@redhat.com>
Date: Tue, 6 Apr 2021 19:54:07 +0800
Message-ID: <1617710047-47972-1-git-send-email-huangguobin4@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.57]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Tue, 06 Apr 2021 08:14:08 -0400
Cc: cluster-devel@redhat.com, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH -next] dlm: use DEFINE_SPINLOCK() for
	spinlock
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

From: Guobin Huang <huangguobin4@huawei.com>

spinlock can be initialized automatically with DEFINE_SPINLOCK()
rather than explicitly calling spin_lock_init().

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Guobin Huang <huangguobin4@huawei.com>
---
 fs/dlm/plock.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
index c38b2b8ffd1d..5a24a2271fdd 100644
--- a/fs/dlm/plock.c
+++ b/fs/dlm/plock.c
@@ -13,7 +13,7 @@
 #include "dlm_internal.h"
 #include "lockspace.h"
 
-static spinlock_t ops_lock;
+static DEFINE_SPINLOCK(ops_lock);
 static struct list_head send_list;
 static struct list_head recv_list;
 static wait_queue_head_t send_wq;
@@ -492,7 +492,6 @@ int dlm_plock_init(void)
 {
 	int rv;
 
-	spin_lock_init(&ops_lock);
 	INIT_LIST_HEAD(&send_list);
 	INIT_LIST_HEAD(&recv_list);
 	init_waitqueue_head(&send_wq);

