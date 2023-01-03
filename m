Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C98F65BF1A
	for <lists+cluster-devel@lfdr.de>; Tue,  3 Jan 2023 12:37:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672745873;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ArVwjoODwW8v+I3cBU4FoOjK/ZPXUq516fmTCChO0jQ=;
	b=WbCdtqldtB5raWCImc9N4Mgwx+DPEC/jI5pzNjR3sMXYFMeJVCfO/J+DBtOjAoJguDypnK
	ISKgW9Qh6OOIRXG0l0RXyqLxTOuwCSfeGjqdcqta63nKKv8QPWOULWd6ynE2aCKKLzgRot
	BYpC+wG0Yk2Uk+APloswPg6XuMSSa9w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-9FUeFp8zO72Qnk2m8rklhQ-1; Tue, 03 Jan 2023 06:37:50 -0500
X-MC-Unique: 9FUeFp8zO72Qnk2m8rklhQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9106A87B2A0;
	Tue,  3 Jan 2023 11:37:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 97F402166B26;
	Tue,  3 Jan 2023 11:37:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 48D54194658C;
	Tue,  3 Jan 2023 11:37:48 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B70341946587 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  3 Jan 2023 11:37:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 77ABC35455; Tue,  3 Jan 2023 11:37:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FAA11731B
 for <cluster-devel@redhat.com>; Tue,  3 Jan 2023 11:37:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53D87101AA63
 for <cluster-devel@redhat.com>; Tue,  3 Jan 2023 11:37:46 +0000 (UTC)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com
 [45.249.212.255]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-dmR31ssONk6PES4t3_-Dfw-1; Tue, 03 Jan 2023 06:37:42 -0500
X-MC-Unique: dmR31ssONk6PES4t3_-Dfw-1
Received: from dggpemm500007.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4NmVZc4NKYz16Llt;
 Tue,  3 Jan 2023 19:17:44 +0800 (CST)
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Jan
 2023 19:19:08 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <cluster-devel@redhat.com>
Date: Tue, 3 Jan 2023 19:37:49 +0800
Message-ID: <20230103113749.3989129-1-yangyingliang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Cluster-devel] [PATCH] fs: dlm: fix return value check in
 dlm_memory_init()
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: yangyingliang@huawei.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

It should check 'cb_cache', after calling kmem_cache_create("dlm_cb").

Fixes: 61bed0baa4db ("fs: dlm: use a non-static queue for callbacks")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 fs/dlm/memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dlm/memory.c b/fs/dlm/memory.c
index eb7a08641fcf..cdbaa452fc05 100644
--- a/fs/dlm/memory.c
+++ b/fs/dlm/memory.c
@@ -51,7 +51,7 @@ int __init dlm_memory_init(void)
 =09cb_cache =3D kmem_cache_create("dlm_cb", sizeof(struct dlm_callback),
 =09=09=09=09     __alignof__(struct dlm_callback), 0,
 =09=09=09=09     NULL);
-=09if (!rsb_cache)
+=09if (!cb_cache)
 =09=09goto cb;
=20
 =09return 0;
--=20
2.25.1

