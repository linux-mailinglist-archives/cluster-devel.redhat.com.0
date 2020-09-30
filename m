Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5A10227F538
	for <lists+cluster-devel@lfdr.de>; Thu,  1 Oct 2020 00:38:02 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601505481;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fA7Qg9MZzyGMuG3Ika827m/+s3XPjMV9TLyU0v1zpUI=;
	b=MCJZbloWri3a8MciRuP1nd8hrcLtIC1PrSNfr6po9bysvf/hrLDl7rbf9rhBQe+rF9e0uW
	TXz6yfRQnRTWF+72gwUV/afqbIMnhTWnxRVQRabGNETBBykUuI+oDSZULGzMwh9nKDKiZK
	CI8/grhqNNgmyNXhToTD5YGwhWDg6+g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-2lu_SfYqOzOm7oGqLqEFhg-1; Wed, 30 Sep 2020 18:37:58 -0400
X-MC-Unique: 2lu_SfYqOzOm7oGqLqEFhg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F3481868416;
	Wed, 30 Sep 2020 22:37:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE42A19C59;
	Wed, 30 Sep 2020 22:37:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D7AE144A56;
	Wed, 30 Sep 2020 22:37:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08UMbn2a023844 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 30 Sep 2020 18:37:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 62DE719936; Wed, 30 Sep 2020 22:37:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-116-166.rdu2.redhat.com [10.10.116.166])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2D27D19C59;
	Wed, 30 Sep 2020 22:37:45 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 30 Sep 2020 18:37:29 -0400
Message-Id: <20200930223729.1607765-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next] fs: dlm: fix race in nodeid2con
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch fixes a race in nodeid2con in cases that we parallel running
a lookup and both will create a connection structure for the same nodeid.
It's a rare case to create a new connection structure to keep reader
lockless we just do a lookup inside the protection area again and drop
previous work if this race happens.

Fixes: a47666eb763cc ("fs: dlm: make connection hash lockless")
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index b7b7360be609e..79f56f16bc2ce 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -175,7 +175,7 @@ static struct connection *__find_con(int nodeid)
  */
 static struct connection *nodeid2con(int nodeid, gfp_t alloc)
 {
-	struct connection *con = NULL;
+	struct connection *con, *tmp;
 	int r;
 
 	con = __find_con(nodeid);
@@ -213,6 +213,20 @@ static struct connection *nodeid2con(int nodeid, gfp_t alloc)
 	r = nodeid_hash(nodeid);
 
 	spin_lock(&connections_lock);
+	/* Because multiple workqueues/threads calls this function it can
+	 * race on multiple cpu's. Instead of locking hot path __find_con()
+	 * we just check in rare cases of recently added nodes again
+	 * under protection of connections_lock. If this is the case we
+	 * abort our connection creation and return the existing connection.
+	 */
+	tmp = __find_con(nodeid);
+	if (tmp) {
+		spin_unlock(&connections_lock);
+		kfree(con->rx_buf);
+		kfree(con);
+		return tmp;
+	}
+
 	hlist_add_head_rcu(&con->list, &connection_hash[r]);
 	spin_unlock(&connections_lock);
 
-- 
2.26.2

