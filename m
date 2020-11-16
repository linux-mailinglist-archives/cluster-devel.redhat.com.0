Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 46BCC2B5238
	for <lists+cluster-devel@lfdr.de>; Mon, 16 Nov 2020 21:15:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605557733;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0sd3vhYWKvWRWshEsPDnNPtmpTl4Z4m0FjK0NTxwC5w=;
	b=Yg76flGQIUAW8qc4JcTuarTZXC2qkHK4OrSGETWKv6OGZ19zz7fgNQSEXspPaa8mUUm7+4
	ozxOGg1eOUB4nez8PZk5W0BTLTT3ReqVbzGx6s5rhuFKeNby6QcTO+qm9jehSpLsXUolHC
	6b12AIRZgHz0LkNzvT6SmbrfmslUMMs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-6e2XxIgWPw6t2rNNyP811A-1; Mon, 16 Nov 2020 15:15:31 -0500
X-MC-Unique: 6e2XxIgWPw6t2rNNyP811A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 814C05F9CA;
	Mon, 16 Nov 2020 20:15:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37B025B4BC;
	Mon, 16 Nov 2020 20:15:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9553758121;
	Mon, 16 Nov 2020 20:15:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AGKFMxQ023725 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 16 Nov 2020 15:15:22 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 74A751840B; Mon, 16 Nov 2020 20:15:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-118-213.rdu2.redhat.com [10.10.118.213])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 29EAC176BB;
	Mon, 16 Nov 2020 20:15:16 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 16 Nov 2020 15:15:07 -0500
Message-Id: <20201116201508.223739-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm-tool 1/2] dlm_controld: change cluster
	mark value description
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch change the cluster mark value description, because it's not
accurate. The listen socket mark value will inherit it's mark value to
all new connections on an accept(). The kernel will also set this "for
all other connections mark value" for connect() as well, if the per
nodeid mark value isn't specified.
---
 dlm_controld/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/dlm_controld/main.c b/dlm_controld/main.c
index b3c258b5..41b03efb 100644
--- a/dlm_controld/main.c
+++ b/dlm_controld/main.c
@@ -1786,7 +1786,7 @@ static void set_opt_defaults(void)
 	set_opt_default(mark_ind,
 			"mark", '\0', req_arg_uint,
 			0, NULL, 0,
-			"set mark value for the DLM in-kernel listen socket");
+			"set mark value for DLM if not explicit by nodeid specified");
 
 	set_opt_default(debug_logfile_ind,
 			"debug_logfile", 'L', no_arg,
-- 
2.26.2

