Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 48C46254DEF
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Aug 2020 21:04:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598555049;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5u/NiG9yN5NaB34GNuAeecw2fi6HZAjLJmd511j9zsA=;
	b=PH4Lg1HDknx+pwinNrtNOpGfjsu0T7qG3Tb1wxKFATt14469yoK79TNRpspcXlwDhF0yXa
	QRrNMMIPg/leCfLNpf9V3gVbGeojXii/dbihbsHTn/rpxSjBuNLjOzpEv8VyP2qADL09Zn
	MtfOMvs825N2c7mBw5zWa3+lozlnBF8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-7OAAXtPXOY-nqQ_AxtSW1A-1; Thu, 27 Aug 2020 15:04:07 -0400
X-MC-Unique: 7OAAXtPXOY-nqQ_AxtSW1A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42EB718A2263;
	Thu, 27 Aug 2020 19:04:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32E9B1944D;
	Thu, 27 Aug 2020 19:04:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1C7D718408A0;
	Thu, 27 Aug 2020 19:04:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07RJ42bU018215 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 27 Aug 2020 15:04:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 287AF19D7C; Thu, 27 Aug 2020 19:04:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-114-193.rdu2.redhat.com [10.10.114.193])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9C51419C71;
	Thu, 27 Aug 2020 19:04:01 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 27 Aug 2020 15:02:53 -0400
Message-Id: <20200827190254.719333-7-aahringo@redhat.com>
In-Reply-To: <20200827190254.719333-1-aahringo@redhat.com>
References: <20200827190254.719333-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 6/7] fs: dlm: handle possible
	othercon writequeues
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

This patch adds free of possible other writequeue entries in othercon
member of struct connection.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 04afc7178afb..794216eb728c 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1608,11 +1608,13 @@ static void shutdown_conn(struct connection *con)
 static void free_conn(struct connection *con)
 {
 	close_connection(con, true, true, true);
-	if (con->othercon)
-		kfree_rcu(con->othercon, rcu);
 	spin_lock(&connections_lock);
 	hlist_del_rcu(&con->list);
 	spin_unlock(&connections_lock);
+	if (con->othercon) {
+		clean_one_writequeue(con->othercon);
+		kfree_rcu(con->othercon, rcu);
+	}
 	clean_one_writequeue(con);
 	kfree_rcu(con, rcu);
 }
-- 
2.26.2

