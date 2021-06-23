Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 409173B1D75
	for <lists+cluster-devel@lfdr.de>; Wed, 23 Jun 2021 17:17:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624461419;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hDOkDzJIHeqJxT533uj+UtHM3wfOU2C9K0xXr8ABC00=;
	b=KPZZ7Q3VabKHaILWGcjPLmqi9I5gnMceuAgWmTDFcR//4eIIFdxjObjgS9e6+0cl4Jupkh
	0+vawMISSBUYZJeXRUXH1uSxzCWmIABn6eBQBhFaA10M/Qe2ZD4WkkeiTDIIHq3SpXfYyt
	rbe6zY+YH/vj6DNcPvNIERgry5p8Il8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-aj0qd8AXOJKTNYaprnxO6A-1; Wed, 23 Jun 2021 11:16:55 -0400
X-MC-Unique: aj0qd8AXOJKTNYaprnxO6A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 803B51083EBB;
	Wed, 23 Jun 2021 15:16:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 710561B46D;
	Wed, 23 Jun 2021 15:16:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5F8971806D15;
	Wed, 23 Jun 2021 15:16:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15NFFg5J025030 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 23 Jun 2021 11:15:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 49FFE60E1C; Wed, 23 Jun 2021 15:15:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (unknown [10.22.8.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E077860C05;
	Wed, 23 Jun 2021 15:15:41 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 23 Jun 2021 11:14:51 -0400
Message-Id: <20210623151454.176649-13-aahringo@redhat.com>
In-Reply-To: <20210623151454.176649-1-aahringo@redhat.com>
References: <20210623151454.176649-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [RFC dlm/next 12/15] fs: dlm: remove send starve
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch removes starve handling in case of sending to much. I think
this was introduced that it can serve some other connections when
sending to much. However we now have not an ordered workqueue anymore
and can handle multiple connection kernel_sendpage() at one time.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 28d97f8187a5..ddf3c0c98386 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -61,7 +61,6 @@
 #define NEEDED_RMEM (4*1024*1024)
 
 /* Number of messages to send before rescheduling */
-#define MAX_SEND_MSG_COUNT 25
 #define DLM_SHUTDOWN_WAIT_TIMEOUT msecs_to_jiffies(10000)
 
 struct connection {
@@ -1464,7 +1463,6 @@ static void send_to_sock(struct connection *con)
 	const int msg_flags = MSG_DONTWAIT | MSG_NOSIGNAL;
 	struct writequeue_entry *e;
 	int len, offset, ret;
-	int count = 0;
 
 	mutex_lock(&con->swork_lock);
 	if (con->sock == NULL) {
@@ -1501,12 +1499,6 @@ static void send_to_sock(struct connection *con)
 		} else if (ret < 0)
 			goto out;
 
-		/* Don't starve people filling buffers */
-		if (++count >= MAX_SEND_MSG_COUNT) {
-			cond_resched();
-			count = 0;
-		}
-
 		spin_lock(&con->writequeue_lock);
 		writequeue_entry_complete(e, ret);
 	}
-- 
2.26.3

