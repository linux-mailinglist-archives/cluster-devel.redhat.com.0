Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id A705C1D08DF
	for <lists+cluster-devel@lfdr.de>; Wed, 13 May 2020 08:46:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589352379;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BLpwCwIpYz3ikENt5wDyD2BUJ7smAfnMj0CZR6I2f/U=;
	b=iVTE6GYTu8ViDo9fu4nUVyRJCwOsCveMNM6WYB9wbvnz8sQ95dN5QEpi4vKteo2znZ9IVG
	SZ/rFjdyJyrLHn+2bk0bp/+DUHJp3PLN5vO8xhyps1wP221iEq/5dCAJlCDa6IzbmpLAl7
	6m07WzXVDgUd4FeI62bkzpWXHJtuPLE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-u7-C1dk1MH2vyfHI8OIffQ-1; Wed, 13 May 2020 02:46:18 -0400
X-MC-Unique: u7-C1dk1MH2vyfHI8OIffQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 609541005510;
	Wed, 13 May 2020 06:46:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E3967D945;
	Wed, 13 May 2020 06:46:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0BFBF4CAA0;
	Wed, 13 May 2020 06:46:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04D6kDBV024315 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 13 May 2020 02:46:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 37DC62029F62; Wed, 13 May 2020 06:46:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 332F4202683E
	for <cluster-devel@redhat.com>; Wed, 13 May 2020 06:46:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 639DE108C269
	for <cluster-devel@redhat.com>; Wed, 13 May 2020 06:46:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-13-ItrkeyShO-OALnm7Pf-MRQ-1; Wed, 13 May 2020 02:46:08 -0400
X-MC-Unique: ItrkeyShO-OALnm7Pf-MRQ-1
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYkr2-0003mH-UE; Wed, 13 May 2020 06:26:57 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Wed, 13 May 2020 08:26:17 +0200
Message-Id: <20200513062649.2100053-3-hch@lst.de>
In-Reply-To: <20200513062649.2100053-1-hch@lst.de>
References: <20200513062649.2100053-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
Subject: [Cluster-devel] [PATCH 02/33] net: add sock_set_linger
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Add a helper to directly set the SO_LINGER sockopt from kernel space
without going through a fake uaccess.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/tcp.c   |  9 +--------
 drivers/nvme/target/tcp.c |  6 +-----
 include/net/sock.h        |  1 +
 net/core/sock.c           | 36 +++++++++++++++++++++++++-----------
 net/rds/tcp_listen.c      |  8 +-------
 net/sunrpc/svcsock.c      | 12 ++----------
 6 files changed, 31 insertions(+), 41 deletions(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index c15a92163c1f7..5cacb61c73229 100644
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
+	sock_set_linger(queue->sock->sk, true, 0);
 
 	if (so_priority > 0) {
 		ret = kernel_setsockopt(queue->sock, SOL_SOCKET, SO_PRIORITY,
diff --git a/drivers/nvme/target/tcp.c b/drivers/nvme/target/tcp.c
index 791aa32beeb98..87aba417189d2 100644
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
+	sock_set_linger(sock->sk, true, 0);
 
 	if (so_priority > 0) {
 		ret = kernel_setsockopt(sock, SOL_SOCKET, SO_PRIORITY,
diff --git a/include/net/sock.h b/include/net/sock.h
index e801a147ad746..60890fb47fbc0 100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -2688,5 +2688,6 @@ static inline bool sk_dev_equal_l3scope(struct sock *sk, int dif)
 
 void sock_def_readable(struct sock *sk);
 void sock_set_reuseaddr(struct sock *sk, unsigned char reuse);
+void sock_set_linger(struct sock *sk, bool onoff, unsigned int linger);
 
 #endif	/* _SOCK_H */
diff --git a/net/core/sock.c b/net/core/sock.c
index ff4faa3e68ac4..cbc5104ca3515 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -720,6 +720,30 @@ void sock_set_reuseaddr(struct sock *sk, unsigned char reuse)
 }
 EXPORT_SYMBOL(sock_set_reuseaddr);
 
+static void __sock_set_linger(struct sock *sk, bool onoff, unsigned int linger)
+{
+	if (!onoff) {
+		sock_reset_flag(sk, SOCK_LINGER);
+		return;
+	}
+
+#if (BITS_PER_LONG == 32)
+	if (linger >= MAX_SCHEDULE_TIMEOUT / HZ)
+		sk->sk_lingertime = MAX_SCHEDULE_TIMEOUT;
+	else
+#endif
+		sk->sk_lingertime = linger * HZ;
+	sock_set_flag(sk, SOCK_LINGER);
+}
+
+void sock_set_linger(struct sock *sk, bool onoff, unsigned int linger)
+{
+	lock_sock(sk);
+	__sock_set_linger(sk, onoff, linger);
+	release_sock(sk);
+}
+EXPORT_SYMBOL(sock_set_linger);
+
 /*
  *	This is meant for all protocols to use and covers goings on
  *	at the socket level. Everything here is generic.
@@ -886,17 +910,7 @@ int sock_setsockopt(struct socket *sock, int level, int optname,
 			ret = -EFAULT;
 			break;
 		}
-		if (!ling.l_onoff)
-			sock_reset_flag(sk, SOCK_LINGER);
-		else {
-#if (BITS_PER_LONG == 32)
-			if ((unsigned int)ling.l_linger >= MAX_SCHEDULE_TIMEOUT/HZ)
-				sk->sk_lingertime = MAX_SCHEDULE_TIMEOUT;
-			else
-#endif
-				sk->sk_lingertime = (unsigned int)ling.l_linger * HZ;
-			sock_set_flag(sk, SOCK_LINGER);
-		}
+		__sock_set_linger(sk, ling.l_onoff, ling.l_linger);
 		break;
 
 	case SO_BSDCOMPAT:
diff --git a/net/rds/tcp_listen.c b/net/rds/tcp_listen.c
index 810a3a49e9474..96f7538e5fa8d 100644
--- a/net/rds/tcp_listen.c
+++ b/net/rds/tcp_listen.c
@@ -113,13 +113,7 @@ struct rds_tcp_connection *rds_tcp_accept_one_path(struct rds_connection *conn)
 
 void rds_tcp_set_linger(struct socket *sock)
 {
-	struct linger no_linger = {
-		.l_onoff = 1,
-		.l_linger = 0,
-	};
-
-	kernel_setsockopt(sock, SOL_SOCKET, SO_LINGER,
-			  (char *)&no_linger, sizeof(no_linger));
+	sock_set_linger(sock->sk, true, 0);
 }
 
 int rds_tcp_accept_one(struct socket *sock)
diff --git a/net/sunrpc/svcsock.c b/net/sunrpc/svcsock.c
index 023514e392b31..0f6b78d0e6170 100644
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
+	sock_set_linger(svsk->sk_sock->sk, true, 0);
 }
 
 /*
-- 
2.26.2

