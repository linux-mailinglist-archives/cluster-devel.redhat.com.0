Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 338494F1A12
	for <lists+cluster-devel@lfdr.de>; Mon,  4 Apr 2022 22:07:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649102845;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=W1eRT5/AZo2ux4ZCwYwiEJBPPP2qFwv64VOo+QoRZRc=;
	b=is9mG4WN7sHm7odkO6xCuamlnVuy5XNpCCyuIwmmIU1Lg3KqrCmHsemx/L6tBP9Too0VCA
	OQgmTfBihzHS/Ev4vVL2JWkVyOXCH+liVi/0NohM3LvAIZMPq96+lUr/zupxps7MDTJcq4
	wHqcmGJLinH4ccx6i/nWVLYPJANAq0A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-487-AtyQj1ciOBGbLrFah3ye4w-1; Mon, 04 Apr 2022 16:07:19 -0400
X-MC-Unique: AtyQj1ciOBGbLrFah3ye4w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7D851010421;
	Mon,  4 Apr 2022 20:07:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5F2AB40E8111;
	Mon,  4 Apr 2022 20:06:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 784B6193F6E5;
	Mon,  4 Apr 2022 20:06:54 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F093019451EF for <cluster-devel@listman.corp.redhat.com>;
 Mon,  4 Apr 2022 20:06:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EA3A97C43; Mon,  4 Apr 2022 20:06:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC46A7C2A;
 Mon,  4 Apr 2022 20:06:53 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  4 Apr 2022 16:06:35 -0400
Message-Id: <20220404200646.3170301-9-aahringo@redhat.com>
In-Reply-To: <20220404200646.3170301-1-aahringo@redhat.com>
References: <20220404200646.3170301-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [Cluster-devel] [PATCH RESEND v5.18-rc1 08/19] fs: dlm: remove
 unnecessary INIT_LIST_HEAD()
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

There is no need to call INIT_LIST_HEAD() when it's set directly
afterwards by list_add_tail().

Reported-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/plock.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
index ce1af7986e16..ff439d780cb1 100644
--- a/fs/dlm/plock.c
+++ b/fs/dlm/plock.c
@@ -67,7 +67,6 @@ static void dlm_release_plock_op(struct plock_op *op)
 static void send_op(struct plock_op *op)
 {
 	set_version(&op->info);
-	INIT_LIST_HEAD(&op->list);
 	spin_lock(&ops_lock);
 	list_add_tail(&op->list, &send_list);
 	spin_unlock(&ops_lock);
-- 
2.31.1

