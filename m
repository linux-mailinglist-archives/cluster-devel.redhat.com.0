Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B1CF4254DF0
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Aug 2020 21:04:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598555049;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LPcX+1f33jQ2i8EG83xdgAWU94JyybHRSkid6IbZCT0=;
	b=S5cskSU840+MMaaijpbem3BklmRB4qoG1l6EpSwOXO/oSHabQ6I61u4ZmvNz34YiM6Pi6V
	H8hyXst0Ofqgzqvlj6WLmWLf2hG7NYMstrKBJ3tg9MUNdU7jsdCypr/j/YJzwQN49/cXIh
	7yInhnl3acC3o5WKcA6XgpwrtKa5294=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-RyqPOaocPLS2_mHvusi8PQ-1; Thu, 27 Aug 2020 15:04:08 -0400
X-MC-Unique: RyqPOaocPLS2_mHvusi8PQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 981E180F059;
	Thu, 27 Aug 2020 19:04:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 872647848F;
	Thu, 27 Aug 2020 19:04:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 73B0B6690B;
	Thu, 27 Aug 2020 19:04:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07RJ425h018236 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 27 Aug 2020 15:04:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D852019D7D; Thu, 27 Aug 2020 19:04:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-114-193.rdu2.redhat.com [10.10.114.193])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 57D9A19C71;
	Thu, 27 Aug 2020 19:04:02 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 27 Aug 2020 15:02:54 -0400
Message-Id: <20200827190254.719333-8-aahringo@redhat.com>
In-Reply-To: <20200827190254.719333-1-aahringo@redhat.com>
References: <20200827190254.719333-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 7/7] fs: dlm: use free_con to free
	connection
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

This patch use free_con() functionality to free the listen connection if
listen fails. It also fixes an issue that a freed resource is still part
of the connection_hash as hlist_del() is not called in this case. The
only difference is that free_con() handles othercon as well, but this is
never been set for the listen connection.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 794216eb728c..1bf1808bfa6b 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1704,10 +1704,8 @@ int dlm_lowcomms_start(void)
 fail_unlisten:
 	dlm_allow_conn = 0;
 	con = nodeid2con(0,0);
-	if (con) {
-		close_connection(con, false, true, true);
-		kfree_rcu(con, rcu);
-	}
+	if (con)
+		free_conn(con);
 fail:
 	return error;
 }
-- 
2.26.2

