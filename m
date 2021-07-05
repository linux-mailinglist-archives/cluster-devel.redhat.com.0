Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 72CA23BBF3B
	for <lists+cluster-devel@lfdr.de>; Mon,  5 Jul 2021 17:29:25 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-sfYD0flONZeI48YNFAdY-A-1; Mon, 05 Jul 2021 11:29:23 -0400
X-MC-Unique: sfYD0flONZeI48YNFAdY-A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 326AB18414A0;
	Mon,  5 Jul 2021 15:29:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 21C3A5D6A1;
	Mon,  5 Jul 2021 15:29:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0EE491809C99;
	Mon,  5 Jul 2021 15:29:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 165FTIIw031916 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 5 Jul 2021 11:29:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 736F6215688A; Mon,  5 Jul 2021 15:29:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 694352156895
	for <cluster-devel@redhat.com>; Mon,  5 Jul 2021 15:29:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7A54B18A01B3
	for <cluster-devel@redhat.com>; Mon,  5 Jul 2021 15:29:15 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-171-w9ZZFwwsNhGamA-7Ta0V1Q-3;
	Mon, 05 Jul 2021 11:28:40 -0400
X-MC-Unique: w9ZZFwwsNhGamA-7Ta0V1Q-3
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B75761968;
	Mon,  5 Jul 2021 15:28:39 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Mon,  5 Jul 2021 11:27:34 -0400
Message-Id: <20210705152815.1520546-18-sashal@kernel.org>
In-Reply-To: <20210705152815.1520546-1-sashal@kernel.org>
References: <20210705152815.1520546-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH AUTOSEL 5.13 18/59] fs: dlm: fix connection
	tcp EOF handling
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

From: Alexander Aring <aahringo@redhat.com>

[ Upstream commit 8aa31cbf20ad168c35dd83476629402aacbf5a44 ]

This patch fixes the EOF handling for TCP that if and EOF is received we
will close the socket next time the writequeue runs empty. This is a
half-closed socket functionality which doesn't exists in SCTP. The
midcomms layer will do a half closed socket functionality on DLM side to
solve this problem for the SCTP case. However there is still the last ack
flying around but other reset functionality will take care of it if it got
lost.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
Signed-off-by: David Teigland <teigland@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/dlm/lowcomms.c | 48 ++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 43 insertions(+), 5 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 138e8236ff6e..b1dd850a4699 100644
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
@@ -1020,6 +1041,7 @@ static void writequeue_entry_complete(struct writequeue_entry *e, int completed)
 
 	if (e->len == 0 && e->users == 0) {
 		list_del(&e->list);
+		atomic_dec(&e->con->writequeue_cnt);
 		free_entry(e);
 	}
 }
@@ -1416,6 +1438,7 @@ static struct writequeue_entry *new_wq_entry(struct connection *con, int len,
 
 	*ppc = page_address(e->page);
 	e->end += len;
+	atomic_inc(&con->writequeue_cnt);
 
 	spin_lock(&con->writequeue_lock);
 	list_add_tail(&e->list, &con->writequeue);
@@ -1535,6 +1558,21 @@ static void send_to_sock(struct connection *con)
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
2.30.2

