Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E188868D4F7
	for <lists+cluster-devel@lfdr.de>; Tue,  7 Feb 2023 11:58:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675767529;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1q4mD0ldqFkx0pGc3NQ0UUgC6CqypLN0KNyYFvvecNE=;
	b=MlUdudy9fRo5lACkAWBubbuUkkBSUpUGjNu5d57sNyGu6DVALUtCI39jqbCi+wRtbpC1nF
	8Z4ebbWAs2bh6o9dH6bT+JPMtPwuJOKMAgo1vrkMI8ZWzqQkU0mWpNGM33wfJzIWkUu5cJ
	cNRmwo+7ClsXIz38xNuB6TdozS1YU/c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-307-0G6nEudFPn6fdBK670DCow-1; Tue, 07 Feb 2023 05:58:45 -0500
X-MC-Unique: 0G6nEudFPn6fdBK670DCow-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B829887401;
	Tue,  7 Feb 2023 10:58:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6F949492C3C;
	Tue,  7 Feb 2023 10:58:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D291519465A3;
	Tue,  7 Feb 2023 10:58:39 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2E4CA1946589 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  6 Feb 2023 09:03:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 12DD2400F756; Mon,  6 Feb 2023 09:03:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BE3640C83B6
 for <cluster-devel@redhat.com>; Mon,  6 Feb 2023 09:03:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E3033183B3C1
 for <cluster-devel@redhat.com>; Mon,  6 Feb 2023 09:03:31 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com
 [45.249.212.187]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-331-Is37BtY6PXSUcQnE3UJNwQ-1; Mon, 06 Feb 2023 04:03:28 -0500
X-MC-Unique: Is37BtY6PXSUcQnE3UJNwQ-1
Received: from kwepemm600015.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4P9KZQ1SMJznW2X;
 Mon,  6 Feb 2023 16:44:46 +0800 (CST)
Received: from huawei.com (10.175.101.6) by kwepemm600015.china.huawei.com
 (7.193.23.52) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 6 Feb
 2023 16:46:50 +0800
From: ChenXiaoSong <chenxiaosong2@huawei.com>
To: <rpeterso@redhat.com>, <agruenba@redhat.com>
Date: Mon, 6 Feb 2023 17:55:42 +0800
Message-ID: <20230206095543.539186-2-chenxiaosong2@huawei.com>
In-Reply-To: <20230206095543.539186-1-chenxiaosong2@huawei.com>
References: <20230206095543.539186-1-chenxiaosong2@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600015.china.huawei.com (7.193.23.52)
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mailman-Approved-At: Tue, 07 Feb 2023 10:58:39 +0000
Subject: [Cluster-devel] [PATCH 1/2] gfs2: factor out __gfs2_ail1_empty()
 and gfs2_ail1_withdraw()
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
Cc: cluster-devel@redhat.com, chenxiaosong2@huawei.com,
 linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Factor out __gfs2_ail1_empty() and gfs2_ail1_withdraw() from
gfs2_ail1_empty(). No functional change.

Signed-off-by: ChenXiaoSong <chenxiaosong2@huawei.com>
---
 fs/gfs2/log.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 61323deb80bc..c62c914702ba 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -347,15 +347,7 @@ static int gfs2_ail1_empty_one(struct gfs2_sbd *sdp, s=
truct gfs2_trans *tr,
 =09return active_count;
 }
=20
-/**
- * gfs2_ail1_empty - Try to empty the ail1 lists
- * @sdp: The superblock
- * @max_revokes: If non-zero, add revokes where appropriate
- *
- * Tries to empty the ail1 lists, starting with the oldest first
- */
-
-static int gfs2_ail1_empty(struct gfs2_sbd *sdp, int max_revokes)
+static int __gfs2_ail1_empty(struct gfs2_sbd *sdp, int max_revokes)
 {
 =09struct gfs2_trans *tr, *s;
 =09int oldest_tr =3D 1;
@@ -372,10 +364,31 @@ static int gfs2_ail1_empty(struct gfs2_sbd *sdp, int =
max_revokes)
 =09ret =3D list_empty(&sdp->sd_ail1_list);
 =09spin_unlock(&sdp->sd_ail_lock);
=20
+=09return ret;
+}
+
+static void gfs2_ail1_withdraw(struct gfs2_sbd *sdp)
+{
 =09if (test_bit(SDF_WITHDRAWING, &sdp->sd_flags)) {
 =09=09gfs2_lm(sdp, "fatal: I/O error(s)\n");
 =09=09gfs2_withdraw(sdp);
 =09}
+}
+
+/**
+ * gfs2_ail1_empty - Try to empty the ail1 lists
+ * @sdp: The superblock
+ * @max_revokes: If non-zero, add revokes where appropriate
+ *
+ * Tries to empty the ail1 lists, starting with the oldest first
+ */
+
+static int gfs2_ail1_empty(struct gfs2_sbd *sdp, int max_revokes)
+{
+=09int ret;
+
+=09ret =3D __gfs2_ail1_empty(sdp, max_revokes);
+=09gfs2_ail1_withdraw(sdp);
=20
 =09return ret;
 }
--=20
2.31.1

