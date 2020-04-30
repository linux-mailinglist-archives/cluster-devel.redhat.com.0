Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 7FB641BF308
	for <lists+cluster-devel@lfdr.de>; Thu, 30 Apr 2020 10:37:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588235831;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=i34QmeB1UoKsue+Oc1iLOj14Fbfd4rmGBs8/5YzE8j4=;
	b=alTXh2E0V+MT04G4M1BxfEJrrMbedhnZ/MB1k/oPCVqEArcVwUNLTIkV8g+BqurLyBgGe+
	glgQycCfkWLc7EcnV6sZVyntSK4s89ByaP/OqldH5wfrEkZYLXZrKCHmwNRaxIyyq19OEr
	aSGpBsMzznzbClM1dhLDryuRK7fTUDI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-9eYsH5DJPH2Rvc21kyKB8A-1; Thu, 30 Apr 2020 04:37:09 -0400
X-MC-Unique: 9eYsH5DJPH2Rvc21kyKB8A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E8178735C0;
	Thu, 30 Apr 2020 08:37:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A0DEF5EDF1;
	Thu, 30 Apr 2020 08:37:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B2E384E982;
	Thu, 30 Apr 2020 08:37:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03U2hbgn001935 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 29 Apr 2020 22:43:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 329452157F23; Thu, 30 Apr 2020 02:43:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E99C2156A3B
	for <cluster-devel@redhat.com>; Thu, 30 Apr 2020 02:43:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 016148007C8
	for <cluster-devel@redhat.com>; Thu, 30 Apr 2020 02:43:35 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-59-QeneQ-VMMie3lNB7-4lRhg-1; Wed, 29 Apr 2020 22:43:32 -0400
X-MC-Unique: QeneQ-VMMie3lNB7-4lRhg-1
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 68B728F3430251F25FA2;
	Thu, 30 Apr 2020 10:43:25 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
	DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server
	id 14.3.487.0; Thu, 30 Apr 2020 10:43:17 +0800
From: Zou Wei <zou_wei@huawei.com>
To: <ccaulfie@redhat.com>, <teigland@redhat.com>
Date: Thu, 30 Apr 2020 10:49:32 +0800
Message-ID: <1588214972-50988-1-git-send-email-zou_wei@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03U2hbgn001935
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Thu, 30 Apr 2020 04:36:57 -0400
Cc: cluster-devel@redhat.com, Zou Wei <zou_wei@huawei.com>,
	linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH -next] dlm: Remove unneeded semicolon
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
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Fixes coccicheck warning:

fs/dlm/rcom.c:566:2-3: Unneeded semicolon

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zou Wei <zou_wei@huawei.com>
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
2.6.2


