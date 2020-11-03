Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id C6AD42A3825
	for <lists+cluster-devel@lfdr.de>; Tue,  3 Nov 2020 02:04:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604365495;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rXY/IbSL5+j8EIr2Pxw94ylOwdjAHG0SCUZFCT2k0Rw=;
	b=f6Rfj2TMdTBEiY5JEsBNGy4iGveyCIWSIojfwbRYKA5PII0Kl8ifzxDjiZnpaQyAlwJ1EQ
	9abzqnFIQ7EvB1mKZYzYeIXRAceiAQwuyY2vgablhsBmgxu/L93OVXam4+TngoLj7ZIuFm
	Wq0++1kngiRLJmBjPPjlRR7gq06FVzg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-azdN2ehSOHqoE_pRCigXig-1; Mon, 02 Nov 2020 20:04:54 -0500
X-MC-Unique: azdN2ehSOHqoE_pRCigXig-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11F3C80364F;
	Tue,  3 Nov 2020 01:04:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0017E5D9D2;
	Tue,  3 Nov 2020 01:04:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DC66886BE9;
	Tue,  3 Nov 2020 01:04:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A314hRn003494 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 2 Nov 2020 20:04:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 568845C22A; Tue,  3 Nov 2020 01:04:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-45.rdu2.redhat.com [10.10.115.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E131E5C5DE;
	Tue,  3 Nov 2020 01:04:42 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  2 Nov 2020 20:04:20 -0500
Message-Id: <20201103010428.1009384-6-aahringo@redhat.com>
In-Reply-To: <20201103010428.1009384-1-aahringo@redhat.com>
References: <20201103010428.1009384-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 RESEND v5.10-rc2 05/13] fs: dlm: handle
	non blocked connect event
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

The manpage of connect shows that in non blocked mode a writeability
indicates successful connection event. This patch is handling this event
inside the writeability callback. In case of SCTP we use blocking
connect functionality which indicates a successful connect when the
function returns with a successful return value.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index c0c688aac223..193a4c91c4d8 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -78,6 +78,7 @@ struct connection {
 #define CF_APP_LIMITED 7
 #define CF_CLOSING 8
 #define CF_SHUTDOWN 9
+#define CF_CONNECTED 10
 	struct list_head writequeue;  /* List of outgoing writequeue_entries */
 	spinlock_t writequeue_lock;
 	int (*rx_action) (struct connection *);	/* What to do when active */
@@ -419,6 +420,12 @@ static void lowcomms_write_space(struct sock *sk)
 	if (!con)
 		goto out;
 
+	if (!test_and_set_bit(CF_CONNECTED, &con->flags)) {
+		log_print("successful connected to node %d", con->nodeid);
+		queue_work(send_workqueue, &con->swork);
+		goto out;
+	}
+
 	clear_bit(SOCK_NOSPACE, &con->sock->flags);
 
 	if (test_and_clear_bit(CF_APP_LIMITED, &con->flags)) {
@@ -604,6 +611,7 @@ static void close_connection(struct connection *con, bool and_other,
 
 	con->rx_leftover = 0;
 	con->retries = 0;
+	clear_bit(CF_CONNECTED, &con->flags);
 	mutex_unlock(&con->sock_mutex);
 	clear_bit(CF_CLOSING, &con->flags);
 }
@@ -1027,8 +1035,11 @@ static void sctp_connect_to_sock(struct connection *con)
 
 	if (result == -EINPROGRESS)
 		result = 0;
-	if (result == 0)
+	if (result == 0) {
+		if (!test_and_set_bit(CF_CONNECTED, &con->flags))
+			log_print("successful connected to node %d", con->nodeid);
 		goto out;
+	}
 
 bind_err:
 	con->sock = NULL;
-- 
2.26.2

