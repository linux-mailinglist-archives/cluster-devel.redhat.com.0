Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 9D0341B3A01
	for <lists+cluster-devel@lfdr.de>; Wed, 22 Apr 2020 10:27:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587544035;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KSsyPo/dfzm8vHhOxdz3XNoKoYKuKvtN7vYHXgGHnOk=;
	b=gXpQhlTMDmdz/7j0JwJOdSEW5CHh2UtmuNHzQsrowrQOEoo8aULTvOzOmMRECFJpt3eKoM
	0uLVrBeEQzb/jZHm1viRfpu4BrAFpr3w7fJEI95Lq/babfe5K6SdWsxN3p8p1UiqO3ecRI
	ARDsVOvD9CPXBFEIZl/DZYN10LyJEIA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-TgFBex3aN8ComtAKkJrJxQ-1; Wed, 22 Apr 2020 04:27:13 -0400
X-MC-Unique: TgFBex3aN8ComtAKkJrJxQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CA2F1005509;
	Wed, 22 Apr 2020 08:27:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DA0E5DA82;
	Wed, 22 Apr 2020 08:27:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 58B0D938FB;
	Wed, 22 Apr 2020 08:27:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03M70UQL009554 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 22 Apr 2020 03:00:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 10A142166B27; Wed, 22 Apr 2020 07:00:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C8182166B2A
	for <cluster-devel@redhat.com>; Wed, 22 Apr 2020 07:00:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C2FB86BCCC
	for <cluster-devel@redhat.com>; Wed, 22 Apr 2020 07:00:27 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-105-ku1T1qe3PoyUwt_DyKya8A-1; Wed, 22 Apr 2020 03:00:23 -0400
X-MC-Unique: ku1T1qe3PoyUwt_DyKya8A-1
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 26F8E9679C5DBB223AD5;
	Wed, 22 Apr 2020 15:00:18 +0800 (CST)
Received: from huawei.com (10.175.105.27) by DGGEMS411-HUB.china.huawei.com
	(10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Wed, 22 Apr 2020
	15:00:10 +0800
From: Wu Bo <wubo40@huawei.com>
To: <ccaulfie@redhat.com>, <teigland@redhat.com>, <cluster-devel@redhat.com>
Date: Wed, 22 Apr 2020 14:59:27 +0800
Message-ID: <1587538767-429386-1-git-send-email-wubo40@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.105.27]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03M70UQL009554
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Wed, 22 Apr 2020 04:27:01 -0400
Cc: linfeilong@huawei.com, wubo40@huawei.com, linux-kernel@vger.kernel.org,
	liuzhiqiang26@huawei.com
Subject: [Cluster-devel] [PATCH] fs:dlm:remove unneeded semicolon in rcom.c
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

Signed-off-by: Wu Bo <wubo40@huawei.com>
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
=20
 =09spin_lock(&ls->ls_recover_lock);
 =09status =3D ls->ls_recover_status;
--=20
1.8.3.1


