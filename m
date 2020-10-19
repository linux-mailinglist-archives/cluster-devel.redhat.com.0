Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D788C292DE3
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Oct 2020 20:59:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603133974;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=q+jAzJD4DNcQgOlVfoPkoEOnKGD0OYh2EJDM+0on0OA=;
	b=YEk5GKFQV2MLLPyqWItXGN5G1tTssdaSHkX0wMTRtZMpSOdqSXzbFnxje+qUVWw0Yx80Uc
	6RR/dGBbUFUSBWE7zFjG9iNdgNO4kM9l+aXA1TIWclWDhygVTsk/SGyOcAAbgWv84UvL6J
	PrSmfuLguxzbYuV0er6D796i3MryIcs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-mgUtq3vCOeyg_ZB3Vft5dw-1; Mon, 19 Oct 2020 14:59:33 -0400
X-MC-Unique: mgUtq3vCOeyg_ZB3Vft5dw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C45A68049C9;
	Mon, 19 Oct 2020 18:59:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B108B60C13;
	Mon, 19 Oct 2020 18:59:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0F86D181A06B;
	Mon, 19 Oct 2020 18:59:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09JIxQ32021246 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Oct 2020 14:59:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 900645C22B; Mon, 19 Oct 2020 18:59:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-116-200.rdu2.redhat.com [10.10.116.200])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 053C25C225;
	Mon, 19 Oct 2020 18:59:25 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 19 Oct 2020 14:59:08 -0400
Message-Id: <20201019185916.707827-2-aahringo@redhat.com>
In-Reply-To: <20201019185916.707827-1-aahringo@redhat.com>
References: <20201019185916.707827-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 1/9] fs: dlm: fix proper srcu api
	call
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

This patch will use call_srcu() instead of call_rcu() because the
related datastructure resource are handled under srcu context. I assume
the current code is fine anyway since free_conn() must be called when
the related resource are not in use otherwise. However it will correct
the overall handling in a srcu context.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 79f56f16bc2ce..77382c2ce6da2 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1616,10 +1616,11 @@ static void free_conn(struct connection *con)
 	spin_unlock(&connections_lock);
 	if (con->othercon) {
 		clean_one_writequeue(con->othercon);
-		call_rcu(&con->othercon->rcu, connection_release);
+		call_srcu(&connections_srcu, &con->othercon->rcu,
+			  connection_release);
 	}
 	clean_one_writequeue(con);
-	call_rcu(&con->rcu, connection_release);
+	call_srcu(&connections_srcu, &con->rcu, connection_release);
 }
 
 static void work_flush(void)
-- 
2.26.2

