Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E98867654E3
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Jul 2023 15:23:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690464201;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=C1Q/DjzyFTJeCzYuA7ggzue5Ja4BLJfAmXeiSqN+bW0=;
	b=D+05OODxmIjbmu3xrB4w4j63UZDCRbAN2TYaU7g/32rU1Qvpq5qK99cnCSrm51CeUghMBZ
	PFM9i2FgUChxXYiu9WZA57975N5DO/N/yL95z2pAxkXswcSPOvGGS3ha7ZYcuP6y66Xfs2
	N67XYLO3qJ5lSg/YS4M5FYsT4k1mwj4=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-iqSD8zNgPl-joAuEqn3DIQ-1; Thu, 27 Jul 2023 09:23:16 -0400
X-MC-Unique: iqSD8zNgPl-joAuEqn3DIQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2CA8381495E;
	Thu, 27 Jul 2023 13:23:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B67334A9004;
	Thu, 27 Jul 2023 13:23:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DC27A193F51D;
	Thu, 27 Jul 2023 13:23:10 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 704B41946586 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 27 Jul 2023 13:23:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5149A4094DC1; Thu, 27 Jul 2023 13:23:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F8C74094DC0;
 Thu, 27 Jul 2023 13:23:09 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 27 Jul 2023 09:22:54 -0400
Message-Id: <20230727132303.3352514-4-aahringo@redhat.com>
In-Reply-To: <20230727132303.3352514-1-aahringo@redhat.com>
References: <20230727132303.3352514-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Cluster-devel] [PATCH dlm-next 04/13] fs: dlm: check on plock ops
 when exit dlm
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
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

To be sure we don't have any issues that there are leftover plock ops in
either send_list or recv_list we simple check if either one of the list
are empty when we exit the dlm subsystem.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/plock.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
index 44b3aab5b709..5c2cc8d940ef 100644
--- a/fs/dlm/plock.c
+++ b/fs/dlm/plock.c
@@ -628,5 +628,7 @@ int dlm_plock_init(void)
 void dlm_plock_exit(void)
 {
 	misc_deregister(&plock_dev_misc);
+	WARN_ON(!list_empty(&send_list));
+	WARN_ON(!list_empty(&recv_list));
 }
 
-- 
2.31.1

