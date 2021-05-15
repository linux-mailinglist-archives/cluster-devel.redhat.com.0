Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D3AC43814A9
	for <lists+cluster-devel@lfdr.de>; Sat, 15 May 2021 02:36:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621038979;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4yPO2C11K8rfRjjd5HyhzE8KfghLDLIwRtbCyiuuCzM=;
	b=I0Bm8Xql4rdodpC75DygjHLsrT+dAqokpxSiHqNx+/oTjphcYz6/2dVi7YHwN8+Qgnf3ZI
	Mn2fypXRfXktM+wM615KcJwmwLDZ/URbdoRqq8aoGxsUhK4TCHJTzmbeZGDHEuvBwaEixg
	9dkii4yaXLGwXt1nWUKGiPbzwdK62RE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-rm_H7NyyPjaEdJqcmHNpmg-1; Fri, 14 May 2021 20:36:16 -0400
X-MC-Unique: rm_H7NyyPjaEdJqcmHNpmg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A3056409A;
	Sat, 15 May 2021 00:36:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 59E605D736;
	Sat, 15 May 2021 00:36:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 48FE1180B464;
	Sat, 15 May 2021 00:36:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14F0a56B030857 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 14 May 2021 20:36:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1A1705DDAD; Sat, 15 May 2021 00:36:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-135.rdu2.redhat.com [10.10.115.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8DB145D9CD;
	Sat, 15 May 2021 00:36:04 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 14 May 2021 20:35:39 -0400
Message-Id: <20210515003549.1118171-6-aahringo@redhat.com>
In-Reply-To: <20210515003549.1118171-1-aahringo@redhat.com>
References: <20210515003549.1118171-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, gnault@redhat.com, pabeni@redhat.com
Subject: [Cluster-devel] [PATCHv5 v5.13-rc1 dlm/next 05/15] fs: dlm: fix
	connection tcp EOF handling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch fixes the EOF handling for TCP that if and EOF is received we
will close the socket next time the writequeue runs empty. This is a
half-closed socket functionality which doesn't exists in SCTP. The
midcomms layer will do a half closed socket functionality on DLM side to
solve this problem for the SCTP case. However there is still the last ack
flying around but other reset functionality will take care of it if it got
lost.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 48 ++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 43 insertions(+), 5 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 051f22dbb83a..d3491bcd1ff1 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -81,10 +81,13 @@ struct connection {
 #define CF_CONNECTED 10
 #define CF_RECONNECT 11
 #define CF_DELAY_CONNECT 12
+#define CF_EOF 13
 	struct list_head writequeue;  /* List of outgoing writequeue_entries */
 	spinlock_t writequeue_lock;
+	atomic_t writequeue_cnt;
 	void (*connect_action) (struct connection *);	/* What to do to connect */
 	void (*shutdown_action)(struct connection *con); /* What to do to shutdown */
+	bool (*eof_condition)(struct connection *con); /* What to do to eof check */
 	int retries;
 #define MAX_CONNECT_RETRIES 3
 	struct hlist_node list;
@@ -179,6 +182,11 @@ static struct connection *__find_con(int nodeid, int r)
 	return NULL;
 }
 
+static bool tcp_eof_condition(struct connection *con)
+{
+	return atomic_read(&con->writequeue_cnt);
+}
+
 static int dlm_con_init(struct connection *con, int nodeid)
 {
 	con->rx_buflen = dlm_config.ci_buffer_size;
@@ -190,6 +198,7 @@ static int dlm_con_init(struct connection *con, int nodeid)
 	mutex_init(&con->sock_mutex);
 	INIT_LIST_HEAD(&con->writequeue);
 	spin_lock_init(&con->writequeue_lock);
+	atomic_set(&con->writequeue_cnt, 0);
 	INIT_WORK(&con->swork, process_send_sockets);
 	INIT_WORK(&con->rwork, process_recv_sockets);
 	init_waitqueue_head(&con->shutdown_wait);
@@ -197,6 +206,7 @@ static int dlm_con_init(struct connection *con, int nodeid)
 	if (dlm_config.ci_protocol == 0) {
 		con->connect_action = tcp_connect_to_sock;
 		con->shutdown_action = dlm_tcp_shutdown;
+		con->eof_condition = tcp_eof_condition;
 	} else {
 		con->connect_action = sctp_connect_to_sock;
 	}
@@ -723,6 +733,7 @@ static void close_connection(struct connection *con, bool and_other,
 	clear_bit(CF_CONNECTED, &con->flags);
 	clear_bit(CF_DELAY_CONNECT, &con->flags);
 	clear_bit(CF_RECONNECT, &con->flags);
+	clear_bit(CF_EOF, &con->flags);
 	mutex_unlock(&con->sock_mutex);
 	clear_bit(CF_CLOSING, &con->flags);
 }
@@ -860,16 +871,26 @@ static int receive_from_sock(struct connection *con)
 	return -EAGAIN;
 
 out_close:
-	mutex_unlock(&con->sock_mutex);
 	if (ret == 0) {
-		close_connection(con, false, true, false);
 		log_print("connection %p got EOF from %d",
 			  con, con->nodeid);
-		/* handling for tcp shutdown */
-		clear_bit(CF_SHUTDOWN, &con->flags);
-		wake_up(&con->shutdown_wait);
+
+		if (con->eof_condition && con->eof_condition(con)) {
+			set_bit(CF_EOF, &con->flags);
+			mutex_unlock(&con->sock_mutex);
+		} else {
+			mutex_unlock(&con->sock_mutex);
+			close_connection(con, false, true, false);
+
+			/* handling for tcp shutdown */
+			clear_bit(CF_SHUTDOWN, &con->flags);
+			wake_up(&con->shutdown_wait);
+		}
+
 		/* signal to breaking receive worker */
 		ret = -1;
+	} else {
+		mutex_unlock(&con->sock_mutex);
 	}
 	return ret;
 }
@@ -1021,6 +1042,7 @@ static void writequeue_entry_complete(struct writequeue_entry *e, int completed)
 
 	if (e->len == 0 && e->users == 0) {
 		list_del(&e->list);
+		atomic_dec(&e->con->writequeue_cnt);
 		free_entry(e);
 	}
 }
@@ -1417,6 +1439,7 @@ static struct writequeue_entry *new_wq_entry(struct connection *con, int len,
 
 	*ppc = page_address(e->page);
 	e->end += len;
+	atomic_inc(&con->writequeue_cnt);
 
 	spin_lock(&con->writequeue_lock);
 	list_add_tail(&e->list, &con->writequeue);
@@ -1536,6 +1559,21 @@ static void send_to_sock(struct connection *con)
 		writequeue_entry_complete(e, ret);
 	}
 	spin_unlock(&con->writequeue_lock);
+
+	/* close if we got EOF */
+	if (test_and_clear_bit(CF_EOF, &con->flags)) {
+		mutex_unlock(&con->sock_mutex);
+		close_connection(con, false, false, true);
+
+		/* handling for tcp shutdown */
+		clear_bit(CF_SHUTDOWN, &con->flags);
+		wake_up(&con->shutdown_wait);
+	} else {
+		mutex_unlock(&con->sock_mutex);
+	}
+
+	return;
+
 out:
 	mutex_unlock(&con->sock_mutex);
 	return;
-- 
2.26.3

