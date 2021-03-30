Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8051434E4AB
	for <lists+cluster-devel@lfdr.de>; Tue, 30 Mar 2021 11:45:09 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-Bxvf_UJyO4iIEzg_xnbAzw-1; Tue, 30 Mar 2021 05:45:06 -0400
X-MC-Unique: Bxvf_UJyO4iIEzg_xnbAzw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69A8D800D62;
	Tue, 30 Mar 2021 09:45:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B11D61001281;
	Tue, 30 Mar 2021 09:45:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4BE2C1809C83;
	Tue, 30 Mar 2021 09:45:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12U2GQnX014936 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 29 Mar 2021 22:16:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4B4F747CE9; Tue, 30 Mar 2021 02:16:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 453814402B
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 02:16:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A743100E640
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 02:16:22 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com
	[45.249.212.188]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-539-OvL_djJyOYCJtb3g4XrKtA-1; Mon, 29 Mar 2021 22:16:18 -0400
X-MC-Unique: OvL_djJyOYCJtb3g4XrKtA-1
Received: from dggeme703-chm.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4F8Xfd1Dl4zRWVh;
	Tue, 30 Mar 2021 09:58:33 +0800 (CST)
Received: from [10.174.179.84] (10.174.179.84) by
	dggeme703-chm.china.huawei.com (10.1.199.99) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.2106.2; Tue, 30 Mar 2021 10:00:27 +0800
To: Christine Caulfield <ccaulfie@redhat.com>, David Teigland
	<teigland@redhat.com>, <zhongbaisong@huawei.com>
From: zhongbaisong <zhongbaisong@huawei.com>
Organization: huawei
Message-ID: <eed9622b-21b0-69c4-307d-5664d2d86a47@huawei.com>
Date: Tue, 30 Mar 2021 10:00:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.7.1
MIME-Version: 1.0
X-Originating-IP: [10.174.179.84]
X-ClientProxiedBy: dggeme707-chm.china.huawei.com (10.1.199.103) To
	dggeme703-chm.china.huawei.com (10.1.199.99)
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Tue, 30 Mar 2021 05:34:25 -0400
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative;
	boundary="------------80331CD6F58F810F4BC6684E"

--------------80331CD6F58F810F4BC6684E
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 7bit

spinlock can be initialized automatically with DEFINE_SPINLOCK()
rather than explicitly calling spin_lock_init().

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Baisong Zhong <zhongbaisong@huawei.com>
---
  fs/dlm/lockspace.c | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index c14cf2b7faab..5bc19cdad34d 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -28,7 +28,7 @@
  static int			ls_count;
  static struct mutex		ls_lock;
  static struct list_head		lslist;
-static spinlock_t		lslist_lock;
+static DEFINE_SPINLOCK(lslist_lock);
  static struct task_struct *	scand_task;
  
  
@@ -233,7 +233,6 @@ int __init dlm_lockspace_init(void)
  	ls_count = 0;
  	mutex_init(&ls_lock);
  	INIT_LIST_HEAD(&lslist);
-	spin_lock_init(&lslist_lock);
  
  	dlm_kset = kset_create_and_add("dlm", &dlm_uevent_ops, kernel_kobj);
  	if (!dlm_kset) {




--------------80331CD6F58F810F4BC6684E
Content-Type: text/html; charset="gbk"
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=GBK">
  </head>
  <body>
    <pre style="box-sizing: border-box; font-family: SFMono-Regular, Menlo, Monaco, Consolas, &quot;Liberation Mono&quot;, &quot;Courier New&quot;, monospace; font-size: 12.25px; margin-top: 0px; margin-bottom: 1rem; overflow: auto; display: block; color: rgb(79, 93, 115); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">spinlock can be initialized automatically with DEFINE_SPINLOCK()
rather than explicitly calling spin_lock_init().

Reported-by: Hulk Robot <a class="moz-txt-link-rfc2396E" href="mailto:hulkci@huawei.com">&lt;hulkci@huawei.com&gt;</a>
Signed-off-by: Baisong Zhong <a class="moz-txt-link-rfc2396E" href="mailto:zhongbaisong@huawei.com">&lt;zhongbaisong@huawei.com&gt;</a>
---
 fs/dlm/lockspace.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index c14cf2b7faab..5bc19cdad34d 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -28,7 +28,7 @@
 static int			ls_count;
 static struct mutex		ls_lock;
 static struct list_head		lslist;
-static spinlock_t		lslist_lock;
+static DEFINE_SPINLOCK(lslist_lock);
 static struct task_struct *	scand_task;
 
 
@@ -233,7 +233,6 @@ int __init dlm_lockspace_init(void)
 	ls_count = 0;
 	mutex_init(&amp;ls_lock);
 	INIT_LIST_HEAD(&amp;lslist);
-	spin_lock_init(&amp;lslist_lock);
 
 	dlm_kset = kset_create_and_add("dlm", &amp;dlm_uevent_ops, kernel_kobj);
 	if (!dlm_kset) {</pre>
    <br class="Apple-interchange-newline">
    <br>
  </body>
</html>

--------------80331CD6F58F810F4BC6684E--

