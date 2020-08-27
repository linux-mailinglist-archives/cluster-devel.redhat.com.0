Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id F312C254DF2
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Aug 2020 21:04:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598555051;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=phZXqv5ugofpT7IBG4wgvz0UP5vveDy+HPEWf6XpYbc=;
	b=JXEoG683/LwNLJlWeMeCycjTke0qggWL9jwHZbEsnBlVWnhCSf2FiKYkd9hNQenZsN9Cfo
	mvqigV6Gmt92X8lddU/3Tfrz/OFfBQqV01g0tIIgd5C69W/KE9xe6Bs/QJ27SFeSjfnlSt
	gC3ROl9JbrQdvK83no0RP8t869VkCoU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-X9lg18vnM2-dQjd7dsHS_A-1; Thu, 27 Aug 2020 15:04:07 -0400
X-MC-Unique: X9lg18vnM2-dQjd7dsHS_A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDA2564095;
	Thu, 27 Aug 2020 19:04:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC1AD672C0;
	Thu, 27 Aug 2020 19:04:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BAB59668E7;
	Thu, 27 Aug 2020 19:04:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07RJ419x018193 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 27 Aug 2020 15:04:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6D11319D7D; Thu, 27 Aug 2020 19:04:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-114-193.rdu2.redhat.com [10.10.114.193])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 960DD19C71;
	Thu, 27 Aug 2020 19:04:00 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 27 Aug 2020 15:02:52 -0400
Message-Id: <20200827190254.719333-6-aahringo@redhat.com>
In-Reply-To: <20200827190254.719333-1-aahringo@redhat.com>
References: <20200827190254.719333-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 5/7] fs: dlm: move free writequeue
	into con free
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
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

This patch just move the free of struct connection member writequeue
into the functionality when struct connection will be freed instead of
doing two iterations.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index d0ece252a0d9..04afc7178afb 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1550,13 +1550,6 @@ static void process_send_sockets(struct work_struct *work)
 		send_to_sock(con);
 }
 
-
-/* Discard all entries on the write queues */
-static void clean_writequeues(void)
-{
-	foreach_conn(clean_one_writequeue);
-}
-
 static void work_stop(void)
 {
 	if (recv_workqueue)
@@ -1620,6 +1613,7 @@ static void free_conn(struct connection *con)
 	spin_lock(&connections_lock);
 	hlist_del_rcu(&con->list);
 	spin_unlock(&connections_lock);
+	clean_one_writequeue(con);
 	kfree_rcu(con, rcu);
 }
 
@@ -1668,7 +1662,6 @@ void dlm_lowcomms_stop(void)
 
 	foreach_conn(shutdown_conn);
 	work_flush();
-	clean_writequeues();
 	foreach_conn(free_conn);
 	work_stop();
 	deinit_local();
-- 
2.26.2

