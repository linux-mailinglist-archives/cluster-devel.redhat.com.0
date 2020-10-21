Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id B86752945E8
	for <lists+cluster-devel@lfdr.de>; Wed, 21 Oct 2020 02:18:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603239483;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=g/KzO1rN1qKxUGWpzAK0QMgfw6sdzNIai9ql+LOADwk=;
	b=SS9ELMAb4jnNGvgMmqJaPeOhIm7q/M1ct3Bwik3b4lmLKPEsM08LqhD8x7SsNhO+pFqAEX
	yZfY36nHUyRtjgTvxfPTZA7KMxkyC3BKkSTRmF7WEYJ6dXcmmtRNuZAm2iqbK+hvouRMir
	U5CtAfx1oqT5GgS4ljW6lkjw0C89lQw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-lCE9rmNrP8eBCVsi73ZJ8w-1; Tue, 20 Oct 2020 20:18:02 -0400
X-MC-Unique: lCE9rmNrP8eBCVsi73ZJ8w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3D676409A;
	Wed, 21 Oct 2020 00:17:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A308160C13;
	Wed, 21 Oct 2020 00:17:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C53178C7D0;
	Wed, 21 Oct 2020 00:17:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09L0HmWn022399 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 20 Oct 2020 20:17:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DB57460C47; Wed, 21 Oct 2020 00:17:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-119-138.rdu2.redhat.com [10.10.119.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5079160C13;
	Wed, 21 Oct 2020 00:17:48 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 20 Oct 2020 20:17:37 -0400
Message-Id: <20201021001739.1689219-2-aahringo@redhat.com>
In-Reply-To: <20201021001739.1689219-1-aahringo@redhat.com>
References: <20201021001739.1689219-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 dlm/next 1/3] fs: dlm: cleanup
	dlm_local_addr properly
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch assigns the dlm_local_addr entries to NULL after we freeing
the memory of the entry. This is required because the user can changed some
settings with less addresses than before and a NULL check on start
functionality will check on a dangled pointer.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 11e5e92148fda..9973293bfddcd 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1248,8 +1248,10 @@ static void deinit_local(void)
 {
 	int i;
 
-	for (i = 0; i < dlm_local_count; i++)
+	for (i = 0; i < dlm_local_count; i++) {
 		kfree(dlm_local_addr[i]);
+		dlm_local_addr[i] = NULL;
+	}
 }
 
 /* Initialise SCTP socket and bind to all interfaces
-- 
2.26.2

