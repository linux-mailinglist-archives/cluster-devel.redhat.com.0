Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4FB49292DE9
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Oct 2020 20:59:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603133978;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jR3afZvQGUMkDFyAS83YXzM/BiCND9TheKivGqiy3XI=;
	b=EXIdfD6H05pEs5DAqurFjbHAF/gTSwOtmMtOVOKsHUixNUAusrE3WJBWJfhz/tq8HqbEid
	WZ2iWCLSff4DCz1FeCG2bUyRljdKXIvJeqv7eZN1QGYAr0unE1LMMcwZOCRsaondBs0pIC
	6tKHpY76Q9tFVgWw1S20R9RZMejzp3g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-1-oVOYriN_iQ-Wmjz_kuoA-1; Mon, 19 Oct 2020 14:59:36 -0400
X-MC-Unique: 1-oVOYriN_iQ-Wmjz_kuoA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FA18186840D;
	Mon, 19 Oct 2020 18:59:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B35310013C4;
	Mon, 19 Oct 2020 18:59:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7724244A6B;
	Mon, 19 Oct 2020 18:59:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09JIxW34021295 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Oct 2020 14:59:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3F06B5C22B; Mon, 19 Oct 2020 18:59:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-116-200.rdu2.redhat.com [10.10.116.200])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A825E5C1A3;
	Mon, 19 Oct 2020 18:59:31 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 19 Oct 2020 14:59:12 -0400
Message-Id: <20201019185916.707827-6-aahringo@redhat.com>
In-Reply-To: <20201019185916.707827-1-aahringo@redhat.com>
References: <20201019185916.707827-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 5/9] fs: dlm: handle non blocked
	connect event
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
index 7a60bb0d6f704..70a216a20dbb9 100644
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

