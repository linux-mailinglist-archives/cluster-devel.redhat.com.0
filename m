Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8587E2E9408
	for <lists+cluster-devel@lfdr.de>; Mon,  4 Jan 2021 12:23:34 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-plzBt2Q1PHuZI_Lob0AD_g-1; Mon, 04 Jan 2021 06:23:32 -0500
X-MC-Unique: plzBt2Q1PHuZI_Lob0AD_g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F70C180A097;
	Mon,  4 Jan 2021 11:23:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F367B5D763;
	Mon,  4 Jan 2021 11:23:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 46B854A7C6;
	Mon,  4 Jan 2021 11:23:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BNEXKNp021214 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 23 Dec 2020 09:33:23 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9028B2166B2B; Wed, 23 Dec 2020 14:33:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B18A2166B29
	for <cluster-devel@redhat.com>; Wed, 23 Dec 2020 14:33:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F546800B3B
	for <cluster-devel@redhat.com>; Wed, 23 Dec 2020 14:33:17 +0000 (UTC)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com
	[45.249.212.190]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-74-qyAgFY8CNVSX2QgOK_ZcGg-1; Wed, 23 Dec 2020 09:33:13 -0500
X-MC-Unique: qyAgFY8CNVSX2QgOK_ZcGg-1
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4D1FXQ2chGz15gt5;
	Wed, 23 Dec 2020 22:12:38 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
	DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server
	id 14.3.498.0; Wed, 23 Dec 2020 22:13:13 +0800
From: Zheng Yongjun <zhengyongjun3@huawei.com>
To: <cluster-devel@redhat.com>, <linux-kernel@vger.kernel.org>
Date: Wed, 23 Dec 2020 22:13:49 +0800
Message-ID: <20201223141349.724-1-zhengyongjun3@huawei.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0BNEXKNp021214
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Mon, 04 Jan 2021 06:23:24 -0500
Cc: Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [Cluster-devel] [PATCH -next] dlm: debug_fs: use DEFINE_MUTEX (and
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
 fs/dlm/debug_fs.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/dlm/debug_fs.c b/fs/dlm/debug_fs.c
index d6bbccb0ed15..7a6fa8ac6f50 100644
--- a/fs/dlm/debug_fs.c
+++ b/fs/dlm/debug_fs.c
@@ -20,7 +20,7 @@
 
 #define DLM_DEBUG_BUF_LEN 4096
 static char debug_buf[DLM_DEBUG_BUF_LEN];
-static struct mutex debug_buf_lock;
+static DEFINE_MUTEX(debug_buf_lock);
 
 static struct dentry *dlm_root;
 
@@ -794,7 +794,6 @@ void dlm_create_debug_file(struct dlm_ls *ls)
 
 void __init dlm_register_debugfs(void)
 {
-	mutex_init(&debug_buf_lock);
 	dlm_root = debugfs_create_dir("dlm", NULL);
 }
 
-- 
2.22.0


