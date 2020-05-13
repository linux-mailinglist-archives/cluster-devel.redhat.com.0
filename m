Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id F32CB1D08DD
	for <lists+cluster-devel@lfdr.de>; Wed, 13 May 2020 08:45:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589352356;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WqQm0SbDpcZXezXKK6Fh6rXFzyH69mcif0NyXeYXbxc=;
	b=MQGlrYOMj7Bte2vjqwS+CFLEnEjTBSoAOA91p9zW/4TCBSDNFvY+6nz9xay1vMTgwMOuqi
	bQrzw02GWxEHpH0RulzkmBP4OYC7DhoWT8E0rbA+ZF+6jXLk0dfqNEsLFbBBlSlcJ+q1oX
	/v3EjKzeELHX2wYVbbg08a7uMhrGzI8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-yMHsqZdGMD63YreqepBVdA-1; Wed, 13 May 2020 02:45:54 -0400
X-MC-Unique: yMHsqZdGMD63YreqepBVdA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEF91835B40;
	Wed, 13 May 2020 06:45:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF3C462925;
	Wed, 13 May 2020 06:45:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CD1F24CAA0;
	Wed, 13 May 2020 06:45:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04D6jnaX024290 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 13 May 2020 02:45:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 24216104949D; Wed, 13 May 2020 06:45:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FD941049498
	for <cluster-devel@redhat.com>; Wed, 13 May 2020 06:45:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06DAF833B47
	for <cluster-devel@redhat.com>; Wed, 13 May 2020 06:45:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-216-iThXVhXKMSSqkYJDMbsfkA-1; Wed, 13 May 2020 02:45:45 -0400
X-MC-Unique: iThXVhXKMSSqkYJDMbsfkA-1
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYkrR-0004D8-Jl; Wed, 13 May 2020 06:27:22 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Wed, 13 May 2020 08:26:25 +0200
Message-Id: <20200513062649.2100053-11-hch@lst.de>
In-Reply-To: <20200513062649.2100053-1-hch@lst.de>
References: <20200513062649.2100053-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	linux-nvme@lists.infradead.org, linux-sctp@vger.kernel.org,
	target-devel@vger.kernel.org, linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
	linux-rdma@vger.kernel.org, cluster-devel@redhat.com,
	Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
	linux-block@vger.kernel.org, drbd-dev@tron.linbit.com,
	ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
	Neil Horman <nhorman@tuxdriver.com>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	netdev@vger.kernel.org, Vlad Yasevich <vyasevich@gmail.com>,
	linux-kernel@vger.kernel.org, Jon Maloy <jmaloy@redhat.com>,
	Ying Xue <ying.xue@windriver.com>, ocfs2-devel@oss.oracle.com
Subject: [Cluster-devel] [PATCH 10/33] tcp: add tcp_sock_set_cork
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Add a helper to directly set the TCP_CORK sockopt from kernel space
without going through a fake uaccess.  Cleanup the callers to avoid
pointless wrappers now that this is a simple function call.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/drbd/drbd_int.h      | 14 --------
 drivers/block/drbd/drbd_receiver.c |  4 +--
 drivers/block/drbd/drbd_worker.c   |  6 ++--
 fs/cifs/transport.c                |  8 ++---
 include/linux/tcp.h                |  2 ++
 net/ipv4/tcp.c                     | 51 +++++++++++++++++++-----------
 net/rds/tcp_send.c                 |  9 ++----
 7 files changed, 43 insertions(+), 51 deletions(-)

diff --git a/drivers/block/drbd/drbd_int.h b/drivers/block/drbd/drbd_int.h
index aae99a2d7bd40..3550adc93c68b 100644
--- a/drivers/block/drbd/drbd_int.h
+++ b/drivers/block/drbd/drbd_int.h
@@ -1570,20 +1570,6 @@ extern void drbd_set_recv_tcq(struct drbd_device *device, int tcq_enabled);
 extern void _drbd_clear_done_ee(struct drbd_device *device, struct list_head *to_be_freed);
 extern int drbd_connected(struct drbd_peer_device *);
 
-static inline void drbd_tcp_cork(struct socket *sock)
-{
-	int val = 1;
-	(void) kernel_setsockopt(sock, SOL_TCP, TCP_CORK,
-			(char*)&val, sizeof(val));
-}
-
-static inline void drbd_tcp_uncork(struct socket *sock)
-{
-	int val = 0;
-	(void) kernel_setsockopt(sock, SOL_TCP, TCP_CORK,
-			(char*)&val, sizeof(val));
-}
-
 static inline void drbd_tcp_nodelay(struct socket *sock)
 {
 	int val = 1;
diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index c15e7083b13a6..55ea907ad33cb 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -6162,7 +6162,7 @@ void drbd_send_acks_wf(struct work_struct *ws)
 	rcu_read_unlock();
 
 	if (tcp_cork)
-		drbd_tcp_cork(connection->meta.socket);
+		tcp_sock_set_cork(connection->meta.socket->sk, true);
 
 	err = drbd_finish_peer_reqs(device);
 	kref_put(&device->kref, drbd_destroy_device);
@@ -6175,7 +6175,7 @@ void drbd_send_acks_wf(struct work_struct *ws)
 	}
 
 	if (tcp_cork)
-		drbd_tcp_uncork(connection->meta.socket);
+		tcp_sock_set_cork(connection->meta.socket->sk, false);
 
 	return;
 }
diff --git a/drivers/block/drbd/drbd_worker.c b/drivers/block/drbd/drbd_worker.c
index 0dc019da1f8d0..2b89c9f2ca707 100644
--- a/drivers/block/drbd/drbd_worker.c
+++ b/drivers/block/drbd/drbd_worker.c
@@ -2098,7 +2098,7 @@ static void wait_for_work(struct drbd_connection *connection, struct list_head *
 	if (uncork) {
 		mutex_lock(&connection->data.mutex);
 		if (connection->data.socket)
-			drbd_tcp_uncork(connection->data.socket);
+			tcp_sock_set_cork(connection->data.socket->sk, false);
 		mutex_unlock(&connection->data.mutex);
 	}
 
@@ -2153,9 +2153,9 @@ static void wait_for_work(struct drbd_connection *connection, struct list_head *
 	mutex_lock(&connection->data.mutex);
 	if (connection->data.socket) {
 		if (cork)
-			drbd_tcp_cork(connection->data.socket);
+			tcp_sock_set_cork(connection->data.socket->sk, true);
 		else if (!uncork)
-			drbd_tcp_uncork(connection->data.socket);
+			tcp_sock_set_cork(connection->data.socket->sk, false);
 	}
 	mutex_unlock(&connection->data.mutex);
 }
diff --git a/fs/cifs/transport.c b/fs/cifs/transport.c
index c97570eb2c180..99760063e0006 100644
--- a/fs/cifs/transport.c
+++ b/fs/cifs/transport.c
@@ -325,7 +325,6 @@ __smb_send_rqst(struct TCP_Server_Info *server, int num_rqst,
 	size_t total_len = 0, sent, size;
 	struct socket *ssocket = server->ssocket;
 	struct msghdr smb_msg;
-	int val = 1;
 	__be32 rfc1002_marker;
 
 	if (cifs_rdma_enabled(server)) {
@@ -345,8 +344,7 @@ __smb_send_rqst(struct TCP_Server_Info *server, int num_rqst,
 	}
 
 	/* cork the socket */
-	kernel_setsockopt(ssocket, SOL_TCP, TCP_CORK,
-				(char *)&val, sizeof(val));
+	tcp_sock_set_cork(ssocket->sk, true);
 
 	for (j = 0; j < num_rqst; j++)
 		send_length += smb_rqst_len(server, &rqst[j]);
@@ -435,9 +433,7 @@ __smb_send_rqst(struct TCP_Server_Info *server, int num_rqst,
 	}
 
 	/* uncork it */
-	val = 0;
-	kernel_setsockopt(ssocket, SOL_TCP, TCP_CORK,
-				(char *)&val, sizeof(val));
+	tcp_sock_set_cork(ssocket->sk, false);
 
 	if ((total_len > 0) && (total_len != send_length)) {
 		cifs_dbg(FYI, "partial send (wanted=%u sent=%zu): terminating session\n",
diff --git a/include/linux/tcp.h b/include/linux/tcp.h
index e60db06ec28d7..7ef0f975a7658 100644
--- a/include/linux/tcp.h
+++ b/include/linux/tcp.h
@@ -494,4 +494,6 @@ static inline u16 tcp_mss_clamp(const struct tcp_sock *tp, u16 mss)
 int tcp_skb_shift(struct sk_buff *to, struct sk_buff *from, int pcount,
 		  int shiftlen);
 
+void tcp_sock_set_cork(struct sock *sk, bool on);
+
 #endif	/* _LINUX_TCP_H */
diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index 8c1250103959a..e11ba10b90d4c 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -2790,6 +2790,37 @@ static void tcp_enable_tx_delay(void)
 	}
 }
 
+/* When set indicates to always queue non-full frames.  Later the user clears
+ * this option and we transmit any pending partial frames in the queue.  This is
+ * meant to be used alongside sendfile() to get properly filled frames when the
+ * user (for example) must write out headers with a write() call first and then
+ * use sendfile to send out the data parts.
+ *
+ * TCP_CORK can be set together with TCP_NODELAY and it is stronger than
+ * TCP_NODELAY.
+ */
+static void __tcp_sock_set_cork(struct sock *sk, bool on)
+{
+	struct tcp_sock *tp = tcp_sk(sk);
+
+	if (on) {
+		tp->nonagle |= TCP_NAGLE_CORK;
+	} else {
+		tp->nonagle &= ~TCP_NAGLE_CORK;
+		if (tp->nonagle & TCP_NAGLE_OFF)
+			tp->nonagle |= TCP_NAGLE_PUSH;
+		tcp_push_pending_frames(sk);
+	}
+}
+
+void tcp_sock_set_cork(struct sock *sk, bool on)
+{
+	lock_sock(sk);
+	__tcp_sock_set_cork(sk, on);
+	release_sock(sk);
+}
+EXPORT_SYMBOL(tcp_sock_set_cork);
+
 /*
  *	Socket option code for TCP.
  */
@@ -2968,25 +2999,7 @@ static int do_tcp_setsockopt(struct sock *sk, int level,
 		break;
 
 	case TCP_CORK:
-		/* When set indicates to always queue non-full frames.
-		 * Later the user clears this option and we transmit
-		 * any pending partial frames in the queue.  This is
-		 * meant to be used alongside sendfile() to get properly
-		 * filled frames when the user (for example) must write
-		 * out headers with a write() call first and then use
-		 * sendfile to send out the data parts.
-		 *
-		 * TCP_CORK can be set together with TCP_NODELAY and it is
-		 * stronger than TCP_NODELAY.
-		 */
-		if (val) {
-			tp->nonagle |= TCP_NAGLE_CORK;
-		} else {
-			tp->nonagle &= ~TCP_NAGLE_CORK;
-			if (tp->nonagle&TCP_NAGLE_OFF)
-				tp->nonagle |= TCP_NAGLE_PUSH;
-			tcp_push_pending_frames(sk);
-		}
+		__tcp_sock_set_cork(sk, val);
 		break;
 
 	case TCP_KEEPIDLE:
diff --git a/net/rds/tcp_send.c b/net/rds/tcp_send.c
index 78a2554a44979..8c4d1d6e9249d 100644
--- a/net/rds/tcp_send.c
+++ b/net/rds/tcp_send.c
@@ -38,23 +38,18 @@
 #include "rds.h"
 #include "tcp.h"
 
-static void rds_tcp_cork(struct socket *sock, int val)
-{
-	kernel_setsockopt(sock, SOL_TCP, TCP_CORK, (void *)&val, sizeof(val));
-}
-
 void rds_tcp_xmit_path_prepare(struct rds_conn_path *cp)
 {
 	struct rds_tcp_connection *tc = cp->cp_transport_data;
 
-	rds_tcp_cork(tc->t_sock, 1);
+	tcp_sock_set_cork(tc->t_sock->sk, true);
 }
 
 void rds_tcp_xmit_path_complete(struct rds_conn_path *cp)
 {
 	struct rds_tcp_connection *tc = cp->cp_transport_data;
 
-	rds_tcp_cork(tc->t_sock, 0);
+	tcp_sock_set_cork(tc->t_sock->sk, false);
 }
 
 /* the core send_sem serializes this with other xmit and shutdown */
-- 
2.26.2

