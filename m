Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E851D636006
	for <lists+cluster-devel@lfdr.de>; Wed, 23 Nov 2022 14:37:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669210626;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=j5FK2zb9526anUlw9GqO0eMl8cRRmIfLkovimvTgsFw=;
	b=VF0ktLBrbdkoNEOvVpZK55o2W+UqiWJdT9fTZC8uMua8TMobFQtvMkmUtNYaBKSDwI37rY
	9DIbqO8qyEees4rycTNClmH6QOEXQSUKWT/b/yP6ZLT4699GSjX1ouJH5OkN5otpImXWTI
	8QPkxw6hLsnr82LqAQ8i8qLNPfxo1sg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-l-IiwnU2MRWAl6h3aiKwwA-1; Wed, 23 Nov 2022 08:37:02 -0500
X-MC-Unique: l-IiwnU2MRWAl6h3aiKwwA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5CAA5800186;
	Wed, 23 Nov 2022 13:37:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C955F1415114;
	Wed, 23 Nov 2022 13:36:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5EB8C194658D;
	Wed, 23 Nov 2022 13:36:58 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 652F31946587 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 23 Nov 2022 07:11:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 41D76141511E; Wed, 23 Nov 2022 07:11:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A7C61415114
 for <cluster-devel@redhat.com>; Wed, 23 Nov 2022 07:11:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 22CA6833A06
 for <cluster-devel@redhat.com>; Wed, 23 Nov 2022 07:11:23 +0000 (UTC)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com
 [45.249.212.189]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-310-nvLajGzDP9-ViIknwGoLow-1; Wed, 23 Nov 2022 02:11:19 -0500
X-MC-Unique: nvLajGzDP9-ViIknwGoLow-1
Received: from kwepemi500013.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4NHBd04943zJns6;
 Wed, 23 Nov 2022 14:52:04 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemi500013.china.huawei.com
 (7.221.188.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 23 Nov
 2022 14:55:19 +0800
From: Zheng Yongjun <zhengyongjun3@huawei.com>
To: <cluster-devel@redhat.com>, <linux-kernel@vger.kernel.org>
Date: Wed, 23 Nov 2022 06:53:19 +0000
Message-ID: <20221123065319.56756-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500013.china.huawei.com (7.221.188.120)
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mailman-Approved-At: Wed, 23 Nov 2022 13:32:58 +0000
Subject: [Cluster-devel] [PATCH -next] fs: dlm: Fix build error without
 DEBUG_LOCK_ALLOC
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
Cc: zhengbin13@huawei.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

If CONFIG_DLM is y, DEBUG_LOCK_ALLOC is n, building fails:

fs/dlm/lowcomms.o: In function `lowcomms_queue_rwork':
lowcomms.c:(.text+0x2ac): undefined reference to `lockdep_is_held'
lowcomms.c:(.text+0x308): undefined reference to `lockdep_is_held'
fs/dlm/lowcomms.o: In function `lowcomms_queue_swork':
lowcomms.c:(.text+0x3e0): undefined reference to `lockdep_is_held'
fs/dlm/lowcomms.o: In function `restore_callbacks':
lowcomms.c:(.text+0xd8c): undefined reference to `lockdep_is_held'
lowcomms.c:(.text+0xdcc): undefined reference to `lockdep_is_held'

Make DLM select DEBUG_LOCK_ALLOC to fix this.

Fixes: dbb751ffab0b ("fs: dlm: parallelize lowcomms socket handling")
Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 fs/dlm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/dlm/Kconfig b/fs/dlm/Kconfig
index 1105ce3c80cb..90a0861e7a29 100644
--- a/fs/dlm/Kconfig
+++ b/fs/dlm/Kconfig
@@ -5,6 +5,7 @@ menuconfig DLM
 	depends on SYSFS && CONFIGFS_FS && (IPV6 || IPV6=n)
 	select IP_SCTP
 	select SRCU
+	select DEBUG_LOCK_ALLOC
 	help
 	A general purpose distributed lock manager for kernel or userspace
 	applications.
--
2.17.1

