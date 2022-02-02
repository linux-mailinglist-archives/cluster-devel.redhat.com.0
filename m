Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3814A75B6
	for <lists+cluster-devel@lfdr.de>; Wed,  2 Feb 2022 17:25:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643819131;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=anBzTPhu7Y174W0smJAwTyFmR5MrcKGoBzQd774P/Uk=;
	b=WPyjrAh9tE2Z5ZdQPNlQ9VDNtytF8sfNiawL1x/o3RYf1n8F0ZqyuTLF1xRzMIAbz4cumL
	Mr8zNDf4lYBx7CWUmaEYoam4KuDpETlr+XTVfWR4Mv5pCgw4WIdH/fqzppMV/idB/EreUn
	mcc5BV/JgmAq2FHBSSqhuSfaQEvQz1k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-ZrKVX3waPyGp3nVvXdSmGg-1; Wed, 02 Feb 2022 11:25:28 -0500
X-MC-Unique: ZrKVX3waPyGp3nVvXdSmGg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A94B814245;
	Wed,  2 Feb 2022 16:25:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E187C753C4;
	Wed,  2 Feb 2022 16:25:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 525D31809C87;
	Wed,  2 Feb 2022 16:25:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 212GOO0K021668 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 2 Feb 2022 11:24:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DF9EC84A20; Wed,  2 Feb 2022 16:24:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.195.230])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4911784703;
	Wed,  2 Feb 2022 16:24:16 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed,  2 Feb 2022 17:24:14 +0100
Message-Id: <20220202162414.46188-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: Make use of list_is_first
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Use list_is_first() instead of open-coding it.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 842884524ca7..f7f296e8e506 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -545,7 +545,7 @@ __acquires(&gl->gl_lockref.lock)
 			 * some reason. If this holder is the head of the list, it
 			 * means we have a blocked holder at the head, so return 1.
 			 */
-			if (gh->gh_list.prev == &gl->gl_holders)
+			if (list_is_first(&gh->gh_list, &gl->gl_holders))
 				return 1;
 			do_error(gl, 0);
 			break;
-- 
2.33.1

