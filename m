Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DA961960C
	for <lists+cluster-devel@lfdr.de>; Fri,  4 Nov 2022 13:19:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667564375;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8z+hsGeikacXHc5LhGOtwJ77yGNVO08msXbVr47GtDw=;
	b=BxSHRWf4ItwrJM2U+qEiA4Ub8DDdGwonqUKf1/q+h8lHYJMUTZTcbIELTTnDnZgoD30cit
	HSyZwczus93N2OIwaWIMlQSQDCcvGz6Yxu5bZQ0vlrkOSPfRqfDYaZd0HXyUrS56lOLDkr
	rdoHj+4rvL7Ed63PayyRUQfmyhSq7kU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-4rGlR9ssMuW40KZQKAqheQ-1; Fri, 04 Nov 2022 08:19:25 -0400
X-MC-Unique: 4rGlR9ssMuW40KZQKAqheQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3BA1B800B23;
	Fri,  4 Nov 2022 12:19:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3979FC1908B;
	Fri,  4 Nov 2022 12:19:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D6A591946594;
	Fri,  4 Nov 2022 12:19:22 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 01C2D1946586 for <cluster-devel@listman.corp.redhat.com>;
 Fri,  4 Nov 2022 12:00:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E5272C2C8D9; Fri,  4 Nov 2022 12:00:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE4C5C2C8C5
 for <cluster-devel@redhat.com>; Fri,  4 Nov 2022 12:00:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFD73811E67
 for <cluster-devel@redhat.com>; Fri,  4 Nov 2022 12:00:23 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com
 [45.249.212.187]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-541-86KUETjvMEuCHfP6cMM68Q-1; Fri, 04 Nov 2022 08:00:21 -0400
X-MC-Unique: 86KUETjvMEuCHfP6cMM68Q-1
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4N3dtp0W38zpW70;
 Fri,  4 Nov 2022 19:38:58 +0800 (CST)
Received: from huawei.com (10.67.175.21) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 4 Nov
 2022 19:42:32 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <rpeterso@redhat.com>, <agruenba@redhat.com>, <teigland@redhat.com>,
 <swhiteho@redhat.com>
Date: Fri, 4 Nov 2022 20:31:04 +0800
Message-ID: <20221104123104.628576-1-lizetao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.175.21]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mailman-Approved-At: Fri, 04 Nov 2022 12:19:22 +0000
Subject: [Cluster-devel] [PATCH] gfs2: Fix memory leak in init_journal()
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
Cc: cluster-devel@redhat.com, zhangxiaoxu5@huawei.com, lizetao1@huawei.com,
 linux-kernel@vger.kernel.org, yi.zhang@huawei.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

There is a memory leak report by kmemleak:

  unreferenced object 0xffff8881786ff9a0 (size 192):
    comm "mount", pid 8881, jiffies 4301165942 (age 892.453s)
    hex dump (first 32 bytes):
      e0 ef 6f 78 81 88 ff ff 70 95 2a 04 81 88 ff ff  ..ox....p.*.....
      b0 f9 6f 78 81 88 ff ff b0 f9 6f 78 81 88 ff ff  ..ox......ox....
    backtrace:
      [<ffffffff8170ea67>] kmalloc_trace+0x27/0xa0
      [<ffffffffa0a15465>] init_inodes+0x495/0x2010 [gfs2]
      [<ffffffffa0a1bc27>] gfs2_fill_super+0x18c7/0x25b0 [gfs2]
      [<ffffffff818e1626>] get_tree_bdev+0x3e6/0x6e0
      [<ffffffffa0a13a34>] gfs2_get_tree+0x44/0x220 [gfs2]
      [<ffffffff818de91d>] vfs_get_tree+0x7d/0x230
      [<ffffffff81958073>] path_mount+0xd63/0x1760
      [<ffffffff81958b3a>] do_mount+0xca/0xe0
      [<ffffffff81958e1c>] __x64_sys_mount+0x12c/0x1a0
      [<ffffffff82f2e485>] do_syscall_64+0x35/0x80
      [<ffffffff8300006a>] entry_SYSCALL_64_after_hwframe+0x46/0xb0

The root cause was traced to an error handling path in init_journal()
when gfs2_jindex_hold() fails. The GFS2 superblock will hold a list
of "gfs2_jdesc", and some of them are not freed in error handling path
"fail" when gfs2_jindex_hold() fails.

Fix it by freeing the memory of "gfs2_jdesc" allocated in the loop in
gfs2_jindex_hold() when an error occurs.

Fixes: b3b94faa5fe5 ("[GFS2] The core of GFS2")
Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 fs/gfs2/ops_fstype.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index c0cf1d2d0ef5..b55bee96619e 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -625,6 +625,9 @@ static int gfs2_jindex_hold(struct gfs2_sbd *sdp, struc=
t gfs2_holder *ji_gh)
 =09=09spin_unlock(&sdp->sd_jindex_spin);
 =09}
=20
+=09if (error)
+=09=09gfs2_jindex_free(sdp);
+
 =09mutex_unlock(&sdp->sd_jindex_mutex);
=20
 =09return error;
--=20
2.25.1

