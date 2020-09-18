Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2285B26FFCE
	for <lists+cluster-devel@lfdr.de>; Fri, 18 Sep 2020 16:28:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600439280;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nMC2z8Xg4xdLsDbl1UgF3HRm14UYlnj678HnRu+3ZSA=;
	b=QiS0YAeJsn7EUnkJSK+EUvTLuHvQOJxAE91jCX/x8Qb3AN02wj6kukLCHTbgsKL1Srs8FM
	AxSHqgWEMPR2NE+AFSrPA4BJ3qtuvbEHlw8JufbDobRwCB8JfUi0yni0ltWisLj4tSzeKQ
	y5KnqDxhfpq5ikSdWr/8sujk7ERfWIM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-m4oaoKLHPG2tX4_cluHHBA-1; Fri, 18 Sep 2020 10:27:58 -0400
X-MC-Unique: m4oaoKLHPG2tX4_cluHHBA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50AF98030A2;
	Fri, 18 Sep 2020 14:27:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D02819D6C;
	Fri, 18 Sep 2020 14:27:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 00855183D046;
	Fri, 18 Sep 2020 14:27:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08IERmB5002428 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 18 Sep 2020 10:27:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7023955764; Fri, 18 Sep 2020 14:27:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-112-228.rdu2.redhat.com [10.10.112.228])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E9E9555762;
	Fri, 18 Sep 2020 14:27:47 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 18 Sep 2020 10:27:26 -0400
Message-Id: <20200918142728.147392-5-aahringo@redhat.com>
In-Reply-To: <20200918142728.147392-1-aahringo@redhat.com>
References: <20200918142728.147392-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 4/6] fs: dlm: release connection
	with call_rcu
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

This patch will introduce to use call_rcu() for a connection structure
which will call do a deep-free of fields of the connection structure.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 24f5e55313d83..72764e6c9417f 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1603,18 +1603,23 @@ static void shutdown_conn(struct connection *con)
 		con->shutdown_action(con);
 }
 
+static void connection_release(struct rcu_head *rcu)
+{
+	struct connection *con = container_of(rcu, struct connection, rcu);
+
+	clean_one_writequeue(con);
+	kfree(con);
+}
+
 static void free_conn(struct connection *con)
 {
 	close_connection(con, true, true, true);
 	spin_lock(&connections_lock);
 	hlist_del_rcu(&con->list);
 	spin_unlock(&connections_lock);
-	if (con->othercon) {
-		clean_one_writequeue(con->othercon);
-		kfree_rcu(con->othercon, rcu);
-	}
-	clean_one_writequeue(con);
-	kfree_rcu(con, rcu);
+	if (con->othercon)
+		call_rcu(&con->othercon->rcu, connection_release);
+	call_rcu(&con->rcu, connection_release);
 }
 
 static void work_flush(void)
-- 
2.26.2

