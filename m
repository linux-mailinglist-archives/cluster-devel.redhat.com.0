Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEB5715108
	for <lists+cluster-devel@lfdr.de>; Mon, 29 May 2023 23:44:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685396693;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bmed1oVSMZosR2DqZkb2RFacq/tgQvOJhegfFVOr+aY=;
	b=Ox4w5FJRWmW+buWQvq+LumPUz0fOWZ/XbnRfrq8N7jflKiXtAFIScOsyYDx7YXnsita8jc
	tYSwgxz877suO1oyN8cb70F36gny++kpi6HZi6xze5avMuDGhGNCc4Ax8WYyG6nTESo2+y
	aEsWqWB/0+FdqSBagQllgLfNyJHYlqk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-20-Ukkjf8fFMByUGv1mU7VVHQ-1; Mon, 29 May 2023 17:44:46 -0400
X-MC-Unique: Ukkjf8fFMByUGv1mU7VVHQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AAA54101AA6E;
	Mon, 29 May 2023 21:44:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9F2C4C154D2;
	Mon, 29 May 2023 21:44:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 70EC719465B9;
	Mon, 29 May 2023 21:44:45 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 91A1F194658C for <cluster-devel@listman.corp.redhat.com>;
 Mon, 29 May 2023 21:44:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 835D12166B30; Mon, 29 May 2023 21:44:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 589C22166B2B;
 Mon, 29 May 2023 21:44:42 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 29 May 2023 17:44:32 -0400
Message-Id: <20230529214440.2542721-4-aahringo@redhat.com>
In-Reply-To: <20230529214440.2542721-1-aahringo@redhat.com>
References: <20230529214440.2542721-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH dlm/next 04/12] fs: dlm: unregister memory
 at the very last
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
Cc: cluster-devel@redhat.com, stable@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The dlm modules midcomms, debugfs, lockspace, uses kmem caches. We
ensure that the kmem caches getting deallocated after those modules
exited.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dlm/main.c b/fs/dlm/main.c
index 93755f83a30d..6ca28299c9db 100644
--- a/fs/dlm/main.c
+++ b/fs/dlm/main.c
@@ -73,10 +73,10 @@ static void __exit exit_dlm(void)
 	dlm_plock_exit();
 	dlm_user_exit();
 	dlm_config_exit();
-	dlm_memory_exit();
 	dlm_lockspace_exit();
 	dlm_midcomms_exit();
 	dlm_unregister_debugfs();
+	dlm_memory_exit();
 }
 
 module_init(init_dlm);
-- 
2.31.1

