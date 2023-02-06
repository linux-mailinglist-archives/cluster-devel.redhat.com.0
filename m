Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E66F68D4F5
	for <lists+cluster-devel@lfdr.de>; Tue,  7 Feb 2023 11:58:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675767526;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ihvs+rhQL5VrWehVL1nmG6IMzJRMWqSlmOqPfFt4dhY=;
	b=bVsaaQtNtzZZ2qL/AAZnGxkgZ5R75QI1hNpmbX4/5SGZIXxn2YjjqdNxNL7Fli9UFKqO9w
	npUoU4p3n5aS3nxc6RHKdxSosj6Aylonl4+Y+K7Rv6jJtcroywfAu/F9bHgaeJ5k0gIavY
	k+FDt+JZs2QOR55TZZ6O4eIu2FUZBFc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-307-VbXRoR9MMLS0gHTmY0rPcA-1; Tue, 07 Feb 2023 05:58:45 -0500
X-MC-Unique: VbXRoR9MMLS0gHTmY0rPcA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1BC022A59566;
	Tue,  7 Feb 2023 10:58:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 85A324035708;
	Tue,  7 Feb 2023 10:58:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DE44719465B2;
	Tue,  7 Feb 2023 10:58:39 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 05A701946589 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  6 Feb 2023 09:03:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DF4FD400F756; Mon,  6 Feb 2023 09:03:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D7C4A40C83B6
 for <cluster-devel@redhat.com>; Mon,  6 Feb 2023 09:03:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C026F85CBE2
 for <cluster-devel@redhat.com>; Mon,  6 Feb 2023 09:03:36 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com
 [45.249.212.187]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-331-0OFSBn6tMcm4b_BkN1xfeQ-1; Mon, 06 Feb 2023 04:03:28 -0500
X-MC-Unique: 0OFSBn6tMcm4b_BkN1xfeQ-1
Received: from kwepemm600015.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4P9KZQ0MQwznW2c;
 Mon,  6 Feb 2023 16:44:46 +0800 (CST)
Received: from huawei.com (10.175.101.6) by kwepemm600015.china.huawei.com
 (7.193.23.52) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 6 Feb
 2023 16:46:50 +0800
From: ChenXiaoSong <chenxiaosong2@huawei.com>
To: <rpeterso@redhat.com>, <agruenba@redhat.com>
Date: Mon, 6 Feb 2023 17:55:41 +0800
Message-ID: <20230206095543.539186-1-chenxiaosong2@huawei.com>
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
Subject: [Cluster-devel] [PATCH 0/2] gfs2: fix sleep from invalid context
 bug in gfs2_glock_wait()
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

ChenXiaoSong (2):
  gfs2: factor out __gfs2_ail1_empty() and gfs2_ail1_withdraw()
  gfs2: fix sleep from invalid context bug in gfs2_glock_wait()

 fs/gfs2/log.c | 35 +++++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

--=20
2.31.1

