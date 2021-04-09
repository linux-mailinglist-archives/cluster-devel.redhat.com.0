Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C9459359B90
	for <lists+cluster-devel@lfdr.de>; Fri,  9 Apr 2021 12:14:38 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-vCUmNqlbO06TyrbNHO-b0Q-1; Fri, 09 Apr 2021 06:14:35 -0400
X-MC-Unique: vCUmNqlbO06TyrbNHO-b0Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B38B881286;
	Fri,  9 Apr 2021 10:14:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C4216B8DD;
	Fri,  9 Apr 2021 10:14:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 23A6D55345;
	Fri,  9 Apr 2021 10:14:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 139A3am5021815 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 9 Apr 2021 06:03:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6EF0410BBCDD; Fri,  9 Apr 2021 10:03:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A0D810BBCDB
	for <cluster-devel@redhat.com>; Fri,  9 Apr 2021 10:03:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D262E80B90D
	for <cluster-devel@redhat.com>; Fri,  9 Apr 2021 10:03:33 +0000 (UTC)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-147-t5oiFXAXPhCoZlv6mneGBA-1; Fri, 09 Apr 2021 06:03:31 -0400
X-MC-Unique: t5oiFXAXPhCoZlv6mneGBA-1
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FGtSH3RGnzlWyq;
	Fri,  9 Apr 2021 17:41:35 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS401-HUB.china.huawei.com
	(10.3.19.201) with Microsoft SMTP Server id 14.3.498.0; Fri, 9 Apr 2021
	17:43:14 +0800
From: Ye Bin <yebin10@huawei.com>
To: <yebin10@huawei.com>, Christine Caulfield <ccaulfie@redhat.com>, "David
	Teigland" <teigland@redhat.com>
Date: Fri, 9 Apr 2021 17:51:39 +0800
Message-ID: <20210409095139.2293922-1-yebin10@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 139A3am5021815
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Fri, 09 Apr 2021 06:11:29 -0400
Cc: cluster-devel@redhat.com, Hulk Robot <hulkci@huawei.com>,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH -next] dlm: use DEFINE_MUTEX() for mutex lock
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit

mutex lock can be initialized automatically with DEFINE_MUTEX()
rather than explicitly calling mutex_init().

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Ye Bin <yebin10@huawei.com>
---
 fs/dlm/lockspace.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index c14cf2b7faab..fa3ae801aa43 100644
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
 


