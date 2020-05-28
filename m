Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 784F41E570E
	for <lists+cluster-devel@lfdr.de>; Thu, 28 May 2020 07:54:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590645264;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LnylUFmE6LGjXbTh/304lIDcSEDmTsi7Z0jAT1kL31A=;
	b=SIssdk7YkEv4/TVLDECKApio8M/hgaQ3SWVt5HDunDs5Ar/uLISUvBM49uan+elrqPiDAK
	YXZSFN5hg3gCckq08PrxJFue6htWMBe3bH3ZyEgwJDdTCsrqCmayLEmEshVYjXPX+UIp37
	hnlBQIIXf+eyXc6IVebF2p5NpRCO3yo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-70w3OiSzOc6qraWa6MV9pA-1; Thu, 28 May 2020 01:54:22 -0400
X-MC-Unique: 70w3OiSzOc6qraWa6MV9pA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D46691005510;
	Thu, 28 May 2020 05:54:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C5C68768B0;
	Thu, 28 May 2020 05:54:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8D3756B4E4;
	Thu, 28 May 2020 05:54:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04S5qilf009233 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 28 May 2020 01:52:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5B2DEDBB0B; Thu, 28 May 2020 05:52:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BE69DBB08
	for <cluster-devel@redhat.com>; Thu, 28 May 2020 05:52:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6AA06800260
	for <cluster-devel@redhat.com>; Thu, 28 May 2020 05:52:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-269-jmhJmClOPUKNuHg-TAES6w-1; Thu, 28 May 2020 01:52:36 -0400
X-MC-Unique: jmhJmClOPUKNuHg-TAES6w-1
Received: from p4fdb1ad2.dip0.t-ipconnect.de ([79.219.26.210] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat
	Linux)) id 1jeAqT-0001Qc-Mf; Thu, 28 May 2020 05:12:46 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Thu, 28 May 2020 07:12:10 +0200
Message-Id: <20200528051236.620353-3-hch@lst.de>
In-Reply-To: <20200528051236.620353-1-hch@lst.de>
References: <20200528051236.620353-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
	cluster-devel@redhat.com, Sagi Grimberg <sagi@grimberg.me>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org, Jon Maloy <jmaloy@redhat.com>,
	Ying Xue <ying.xue@windriver.com>,
	Eric Dumazet <edumazet@google.com>, target-devel@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net, linux-nfs@vger.kernel.org,
	drbd-dev@tron.linbit.com, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
	ceph-devel@vger.kernel.org, linux-afs@lists.infradead.org,
	ocfs2-devel@oss.oracle.com, linux-rdma@vger.kernel.org
Subject: [Cluster-devel] [PATCH 02/28] net: add sock_no_linger
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

Add a helper to directly set the SO_LINGER sockopt from kernel space
with onoff set to true and a linger time of 0 without going through a
fake uaccess.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Sagi Grimberg <sagi@grimberg.me>
---
 drivers/nvme/host/tcp.c   |  9 +--------
 drivers/nvme/target/tcp.c |  6 +-----
 include/net/sock.h        |  1 +
 net/core/sock.c           |  9 +++++++++
 net/rds/tcp.h             |  1 -
 net/rds/tcp_connect.c     |  2 +-
 net/rds/tcp_listen.c      | 13 +------------
 net/sunrpc/svcsock.c      | 12 ++----------
 8 files changed, 16 insertions(+), 37 deletions(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index c15a92163c1f7..e72d87482eb78 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -1313,7 +1313,6 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl,
 {
 	struct nvme_tcp_ctrl *ctrl = to_tcp_ctrl(nctrl);
 	struct nvme_tcp_queue *queue = &ctrl->queues[qid];
-	struct linger sol = { .l_onoff = 1, .l_linger = 0 };
 	int ret, opt, rcv_pdu_size;
 
 	queue->ctrl = ctrl;
@@ -1361,13 +1360,7 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl,
 	 * close. This is done to prevent stale data from being sent should
 	 * the network connection be restored before TCP times out.
 	 */
-	ret = kernel_setsockopt(queue->sock, SOL_SOCKET, SO_LINGER,
-			(char *)&sol, sizeof(sol));
-	if (ret) {
-		dev_err(nctrl->device,
-			"failed to set SO_LINGER sock opt %d\n", ret);
-		goto err_sock;
-	}
+	sock_no_linger(queue->sock->sk);
 
 	if (so_priority > 0) {
 		ret = kernel_setsockopt(queue->sock, SOL_SOCKET, SO_PRIORITY,
diff --git a/drivers/nvme/target/tcp.c b/drivers/nvme/target/tcp.c
index 40757a63f4553..e0801494b097f 100644
--- a/drivers/nvme/target/tcp.c
+++ b/drivers/nvme/target/tcp.c
@@ -1429,7 +1429,6 @@ static int nvmet_tcp_set_queue_sock(struct nvmet_tcp_queue *queue)
 {
 	struct socket *sock = queue->sock;
 	struct inet_sock *inet = inet_sk(sock->sk);
-	struct linger sol = { .l_onoff = 1, .l_linger = 0 };
 	int ret;
 
 	ret = kernel_getsockname(sock,
@@ -1447,10 +1446,7 @@ static int nvmet_tcp_set_queue_sock(struct nvmet_tcp_queue *queue)
 	 * close. This is done to prevent stale data from being sent should
 	 * the network connection be restored before TCP times out.
 	 */
-	ret = kernel_setsockopt(sock, SOL_SOCKET, SO_LINGER,
-			(char *)&sol, sizeof(sol));
-	if (ret)
-		return ret;
+	sock_no_linger(sock->sk);
 
 	if (so_priority > 0) {
 		ret = kernel_setsockopt(sock, SOL_SOCKET, SO_PRIORITY,
diff --git a/include/net/sock.h b/include/net/sock.h
index 2ec085044790c..6ed00bf009bbe 100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -2688,6 +2688,7 @@ static inline bool sk_dev_equal_l3scope(struct sock *sk, int dif)
 
 void sock_def_readable(struct sock *sk);
 
+void sock_no_linger(struct sock *sk);
 void sock_set_reuseaddr(struct sock *sk);
 
 #endif	/* _SOCK_H */
diff --git a/net/core/sock.c b/net/core/sock.c
index 18eb84fdf5fbe..f0f09524911c8 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -720,6 +720,15 @@ void sock_set_reuseaddr(struct sock *sk)
 }
 EXPORT_SYMBOL(sock_set_reuseaddr);
 
+void sock_no_linger(struct sock *sk)
+{
+	lock_sock(sk);
+	sk->sk_lingertime = 0;
+	sock_set_flag(sk, SOCK_LINGER);
+	release_sock(sk);
+}
+EXPORT_SYMBOL(sock_no_linger);
+
 /*
  *	This is meant for all protocols to use and covers goings on
  *	at the socket level. Everything here is generic.
diff --git a/net/rds/tcp.h b/net/rds/tcp.h
index 3c69361d21c73..d640e210b97b6 100644
--- a/net/rds/tcp.h
+++ b/net/rds/tcp.h
@@ -73,7 +73,6 @@ void rds_tcp_listen_data_ready(struct sock *sk);
 int rds_tcp_accept_one(struct socket *sock);
 int rds_tcp_keepalive(struct socket *sock);
 void *rds_tcp_listen_sock_def_readable(struct net *net);
-void rds_tcp_set_linger(struct socket *sock);
 
 /* tcp_recv.c */
 int rds_tcp_recv_init(void);
diff --git a/net/rds/tcp_connect.c b/net/rds/tcp_connect.c
index 008f50fb25dd2..4e64598176b05 100644
--- a/net/rds/tcp_connect.c
+++ b/net/rds/tcp_connect.c
@@ -207,7 +207,7 @@ void rds_tcp_conn_path_shutdown(struct rds_conn_path *cp)
 
 	if (sock) {
 		if (rds_destroy_pending(cp->cp_conn))
-			rds_tcp_set_linger(sock);
+			sock_no_linger(sock->sk);
 		sock->ops->shutdown(sock, RCV_SHUTDOWN | SEND_SHUTDOWN);
 		lock_sock(sock->sk);
 		rds_tcp_restore_callbacks(sock, tc); /* tc->tc_sock = NULL */
diff --git a/net/rds/tcp_listen.c b/net/rds/tcp_listen.c
index 810a3a49e9474..bbb31b9c0b391 100644
--- a/net/rds/tcp_listen.c
+++ b/net/rds/tcp_listen.c
@@ -111,17 +111,6 @@ struct rds_tcp_connection *rds_tcp_accept_one_path(struct rds_connection *conn)
 	return NULL;
 }
 
-void rds_tcp_set_linger(struct socket *sock)
-{
-	struct linger no_linger = {
-		.l_onoff = 1,
-		.l_linger = 0,
-	};
-
-	kernel_setsockopt(sock, SOL_SOCKET, SO_LINGER,
-			  (char *)&no_linger, sizeof(no_linger));
-}
-
 int rds_tcp_accept_one(struct socket *sock)
 {
 	struct socket *new_sock = NULL;
@@ -241,7 +230,7 @@ int rds_tcp_accept_one(struct socket *sock)
 	 * be pending on it. By setting linger, we achieve the side-effect
 	 * of avoiding TIME_WAIT state on new_sock.
 	 */
-	rds_tcp_set_linger(new_sock);
+	sock_no_linger(new_sock->sk);
 	kernel_sock_shutdown(new_sock, SHUT_RDWR);
 	ret = 0;
 out:
diff --git a/net/sunrpc/svcsock.c b/net/sunrpc/svcsock.c
index 023514e392b31..6773dacc64d8e 100644
--- a/net/sunrpc/svcsock.c
+++ b/net/sunrpc/svcsock.c
@@ -323,17 +323,9 @@ static int svc_tcp_has_wspace(struct svc_xprt *xprt)
 
 static void svc_tcp_kill_temp_xprt(struct svc_xprt *xprt)
 {
-	struct svc_sock *svsk;
-	struct socket *sock;
-	struct linger no_linger = {
-		.l_onoff = 1,
-		.l_linger = 0,
-	};
+	struct svc_sock *svsk = container_of(xprt, struct svc_sock, sk_xprt);
 
-	svsk = container_of(xprt, struct svc_sock, sk_xprt);
-	sock = svsk->sk_sock;
-	kernel_setsockopt(sock, SOL_SOCKET, SO_LINGER,
-			  (char *)&no_linger, sizeof(no_linger));
+	sock_no_linger(svsk->sk_sock->sk);
 }
 
 /*
-- 
2.26.2

