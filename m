Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3D1713B1D79
	for <lists+cluster-devel@lfdr.de>; Wed, 23 Jun 2021 17:17:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624461440;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Wg5OVE7vT60fqN/7NvucsHUphfCX33hJ3maomTjN38s=;
	b=IIFcktvzQdG543oP5eVew4OCdnQsaa60tXvTm3yr3T0i03g+fFjs/WByGoUqbXXzapc/gV
	zVnVQCRT8DQyB34xYaJviRcQdSl6m80bYMHu/Dzq8XS+rPPnKatal8pwH5K99MPvqS76zy
	uZS2kC3raLlW2fZrrT5R9nSCcX5RNqE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-IfJc-JDEPEmItVX4NjFTaw-1; Wed, 23 Jun 2021 11:17:18 -0400
X-MC-Unique: IfJc-JDEPEmItVX4NjFTaw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CEAB835E29;
	Wed, 23 Jun 2021 15:16:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E5561103A96E;
	Wed, 23 Jun 2021 15:16:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C37214EA29;
	Wed, 23 Jun 2021 15:16:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15NFFi4M025056 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 23 Jun 2021 11:15:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0042F60E3A; Wed, 23 Jun 2021 15:15:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (unknown [10.22.8.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9386860C05;
	Wed, 23 Jun 2021 15:15:43 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 23 Jun 2021 11:14:54 -0400
Message-Id: <20210623151454.176649-16-aahringo@redhat.com>
In-Reply-To: <20210623151454.176649-1-aahringo@redhat.com>
References: <20210623151454.176649-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [RFC dlm/next 15/15] fs: dlm: move srcu into loop
	call
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch cleans up the foreach_conn() helper that we hold the srcu
lock while iterating over the connections.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index bb088ebc1614..ac4325c4865f 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -377,13 +377,15 @@ static struct connection *nodeid2con(int nodeid, gfp_t alloc)
 /* Loop round all connections */
 static void foreach_conn(void (*conn_func)(struct connection *c))
 {
-	int i;
 	struct connection *con;
+	int i, idx;
 
+	idx = srcu_read_lock(&connections_srcu);
 	for (i = 0; i < CONN_HASH_SIZE; i++) {
 		hlist_for_each_entry_rcu(con, &connection_hash[i], list)
 			conn_func(con);
 	}
+	srcu_read_unlock(&connections_srcu, idx);
 }
 
 static struct dlm_node_addr *find_node_addr(int nodeid)
@@ -1778,8 +1780,6 @@ static void shutdown_conn(struct connection *con)
 
 void dlm_lowcomms_shutdown(void)
 {
-	int idx;
-
 	/* Set all the flags to prevent any
 	 * socket activity.
 	 */
@@ -1787,9 +1787,7 @@ void dlm_lowcomms_shutdown(void)
 	flush_work(&listen_con.rwork);
 	dlm_close_sock(&listen_con.sock);
 
-	idx = srcu_read_lock(&connections_srcu);
 	foreach_conn(shutdown_conn);
-	srcu_read_unlock(&connections_srcu, idx);
 }
 
 static void connection_release(struct rcu_head *rcu)
@@ -1816,11 +1814,7 @@ static void free_conn(struct connection *con)
 
 void dlm_lowcomms_stop(void)
 {
-	int idx;
-
-	idx = srcu_read_lock(&connections_srcu);
 	foreach_conn(free_conn);
-	srcu_read_unlock(&connections_srcu, idx);
 	work_stop();
 	deinit_local();
 
-- 
2.26.3

