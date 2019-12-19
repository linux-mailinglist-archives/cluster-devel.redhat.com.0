Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id A695B1311B6
	for <lists+cluster-devel@lfdr.de>; Mon,  6 Jan 2020 13:00:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578312048;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eF+YR0n6xO+N7rNQCGN/T/dgw0CVKECsQE3EGinadMc=;
	b=e6Rt6CYjA+Oh10vwDahud1pxiUEgWSy2tu1k7j+fQUW2rWCFpyIbSc3YPlNKejRmUW17Fo
	0SiskEbc45Y9MUdxuMx9ucfeIpNEeXpPN05mLkhCc11Dek0Vx5ORxChGsrAQrx3nyAuzem
	zSUqFgFBybq0Z3k0wRbGsOWDliwYcYY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-iVE6FyY3NBCNgZtwP8lYug-1; Mon, 06 Jan 2020 07:00:46 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC92C2649B;
	Mon,  6 Jan 2020 12:00:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F3857C00C;
	Mon,  6 Jan 2020 12:00:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 42E3E81C6C;
	Mon,  6 Jan 2020 12:00:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBJAZCn2012904 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 19 Dec 2019 05:35:14 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7E92A2166B29; Thu, 19 Dec 2019 10:35:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A8952166B28
	for <cluster-devel@redhat.com>; Thu, 19 Dec 2019 10:35:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 042BE8E5C77
	for <cluster-devel@redhat.com>; Thu, 19 Dec 2019 10:35:10 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-102-JKB5isMGOvmcS5nIXbK98A-1; Thu, 19 Dec 2019 05:35:07 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 540B64246044BF024459;
	Thu, 19 Dec 2019 18:35:03 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS401-HUB.china.huawei.com
	(10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Thu, 19 Dec 2019
	18:34:56 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <ccaulfie@redhat.com>, <teigland@redhat.com>, <cluster-devel@redhat.com>
Date: Thu, 19 Dec 2019 18:42:14 +0800
Message-ID: <1576752134-94088-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-MC-Unique: JKB5isMGOvmcS5nIXbK98A-1
X-MC-Unique: iVE6FyY3NBCNgZtwP8lYug-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xBJAZCn2012904
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Mon, 06 Jan 2020 07:00:35 -0500
Cc: zhengbin13@huawei.com
Subject: [Cluster-devel] [PATCH] dlm: Remove unneeded semicolon
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
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Fixes coccicheck warning:

fs/dlm/rcom.c:566:2-3: Unneeded semicolon

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 fs/dlm/rcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dlm/rcom.c b/fs/dlm/rcom.c
index e3d9f72..4daf5dc 100644
--- a/fs/dlm/rcom.c
+++ b/fs/dlm/rcom.c
@@ -563,7 +563,7 @@ void dlm_receive_rcom(struct dlm_ls *ls, struct dlm_rco=
m *rc, int nodeid)
 =09=09lock =3D 1;
 =09=09reply =3D 1;
 =09=09break;
-=09};
+=09}

 =09spin_lock(&ls->ls_recover_lock);
 =09status =3D ls->ls_recover_status;
--
2.7.4


