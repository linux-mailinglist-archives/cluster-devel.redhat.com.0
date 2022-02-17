Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3EF4BA9F6
	for <lists+cluster-devel@lfdr.de>; Thu, 17 Feb 2022 20:40:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645126800;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=W1eRT5/AZo2ux4ZCwYwiEJBPPP2qFwv64VOo+QoRZRc=;
	b=dnKPLPh9o6gaItfvluu6FA643Eist/m8EY/5F8nfgQaY1NyiSqxI4rbyfEgy+mylon6983
	o7x2cCo6W2et2WxmVKszzUX9Tf+xSNLhabQWgSioMjxqbGRTb0JoclgjnYIQWx72vrbV7m
	QlX9XcyAnri7CZecWt6DpKVU5bwQLL4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-348-DD_poi8ZNSSsPZT5LS5aOQ-1; Thu, 17 Feb 2022 14:39:56 -0500
X-MC-Unique: DD_poi8ZNSSsPZT5LS5aOQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E29B8143EA;
	Thu, 17 Feb 2022 19:39:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E13A4BC49;
	Thu, 17 Feb 2022 19:39:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4883F4BB7B;
	Thu, 17 Feb 2022 19:39:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21HJdmn9004276 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 17 Feb 2022 14:39:48 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B68E6100EB3D; Thu, 17 Feb 2022 19:39:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 67BEB1009962;
	Thu, 17 Feb 2022 19:39:48 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 17 Feb 2022 14:39:16 -0500
Message-Id: <20220217193917.3292717-6-aahringo@redhat.com>
In-Reply-To: <20220217193917.3292717-1-aahringo@redhat.com>
References: <20220217193917.3292717-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 dlm/next 5/6] fs: dlm: remove unnecessary
	INIT_LIST_HEAD()
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

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

