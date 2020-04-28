Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 8AE611BBC86
	for <lists+cluster-devel@lfdr.de>; Tue, 28 Apr 2020 13:38:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588073926;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TJRzONryaKegfvQOVTaKZ8pglZ4HsGoFna+RqpI0Bhg=;
	b=DQTajdb+PBMK1Pzm2cpoNATS37dkPQ3G23srjjXY74TPrOzTdGzdsm9TUw4BjpbvpuEacp
	AwlDKn4w/CfzRKM+Qz0cnjJJqyKb7GcA+XjMeXnpcprgz+pZGQnPQDCbIdMRtPmHNU4Fyq
	zPm+tzUCAVc6FVJAUB7JA8M1tGyFBYA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-FpUy2UJVM9iVwFI_e5c5lQ-1; Tue, 28 Apr 2020 07:38:45 -0400
X-MC-Unique: FpUy2UJVM9iVwFI_e5c5lQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 027D6835B41;
	Tue, 28 Apr 2020 11:38:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D960E5D9E2;
	Tue, 28 Apr 2020 11:38:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 83D794CAA0;
	Tue, 28 Apr 2020 11:38:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03S6Y0BJ007591 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 28 Apr 2020 02:34:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E2F2F637A7; Tue, 28 Apr 2020 06:33:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF40CAFD69
	for <cluster-devel@redhat.com>; Tue, 28 Apr 2020 06:33:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06D4885A5A0
	for <cluster-devel@redhat.com>; Tue, 28 Apr 2020 06:33:58 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-504-eIzDjv6zPpqJsFSmKPIhHQ-1; Tue, 28 Apr 2020 02:33:52 -0400
X-MC-Unique: eIzDjv6zPpqJsFSmKPIhHQ-1
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id C86B314957E8B6F55505;
	Tue, 28 Apr 2020 14:33:47 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS407-HUB.china.huawei.com
	(10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Tue, 28 Apr 2020
	14:33:37 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <ccaulfie@redhat.com>, <teigland@redhat.com>, <tglx@linutronix.de>,
	<cluster-devel@redhat.com>, <linux-kernel@vger.kernel.org>
Date: Tue, 28 Apr 2020 14:33:03 +0800
Message-ID: <20200428063303.34246-1-yanaijie@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03S6Y0BJ007591
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Tue, 28 Apr 2020 07:38:33 -0400
Cc: Jason Yan <yanaijie@huawei.com>
Subject: [Cluster-devel] [PATCH] dlm: remove unneeded semicolon in rcom.c
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Fix the following coccicheck warning:

fs/dlm/rcom.c:566:2-3: Unneeded semicolon

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 fs/dlm/rcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dlm/rcom.c b/fs/dlm/rcom.c
index e3d9f72c640d..4daf5dc2b51c 100644
--- a/fs/dlm/rcom.c
+++ b/fs/dlm/rcom.c
@@ -563,7 +563,7 @@ void dlm_receive_rcom(struct dlm_ls *ls, struct dlm_rco=
m *rc, int nodeid)
 =09=09lock =3D 1;
 =09=09reply =3D 1;
 =09=09break;
-=09};
+=09}
=20
 =09spin_lock(&ls->ls_recover_lock);
 =09status =3D ls->ls_recover_status;
--=20
2.21.1


