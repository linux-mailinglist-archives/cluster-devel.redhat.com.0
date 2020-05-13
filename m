Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id B823E1D0772
	for <lists+cluster-devel@lfdr.de>; Wed, 13 May 2020 08:29:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589351385;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=th0Nfh1pUL22y9EWLURq762FQ1KsWRPJshht6PDdVb4=;
	b=G+e2Z48S83HWP8/VFXqO/crXiSa4Fdwo5e2iMra/+v033Xz2I2aKXvVamERXp6yaVbAN8A
	gP9br325FMCypmbpdtsLcbxp2w4YspSfNwglhFWZuhHbrrPpleziS5pe7K8noCjsN0GYdG
	AtXVQGQZSLYcttP1rHqDsDM9tbalTdM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-e1DYcmF7P-25qtQtiXSjOg-1; Wed, 13 May 2020 02:29:44 -0400
X-MC-Unique: e1DYcmF7P-25qtQtiXSjOg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B19B1107ACCA;
	Wed, 13 May 2020 06:29:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A205E2E170;
	Wed, 13 May 2020 06:29:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6037B1809543;
	Wed, 13 May 2020 06:29:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04D6Tdid023395 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 13 May 2020 02:29:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 978E3113F72; Wed, 13 May 2020 06:29:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 93702112332
	for <cluster-devel@redhat.com>; Wed, 13 May 2020 06:29:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9907811768
	for <cluster-devel@redhat.com>; Wed, 13 May 2020 06:29:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-451-HAJdb6-2OtOMRZCYtV-5Rw-1; Wed, 13 May 2020 02:29:31 -0400
X-MC-Unique: HAJdb6-2OtOMRZCYtV-5Rw-1
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYkrd-0004NC-HA; Wed, 13 May 2020 06:27:33 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Wed, 13 May 2020 08:26:29 +0200
Message-Id: <20200513062649.2100053-15-hch@lst.de>
In-Reply-To: <20200513062649.2100053-1-hch@lst.de>
References: <20200513062649.2100053-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
Subject: [Cluster-devel] [PATCH 14/33] tcp: add tcp_sock_set_user_timeout
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Add a helper to directly set the TCP_USER_TIMEOUT sockopt from kernel
space without going through a fake uaccess.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ocfs2/cluster/tcp.c | 22 ++--------------------
 include/linux/tcp.h    |  1 +
 net/ipv4/tcp.c         |  8 ++++++++
 net/sunrpc/xprtsock.c  |  3 +--
 4 files changed, 12 insertions(+), 22 deletions(-)

diff --git a/fs/ocfs2/cluster/tcp.c b/fs/ocfs2/cluster/tcp.c
index 7936e22e39f34..5776df10d11f9 100644
--- a/fs/ocfs2/cluster/tcp.c
+++ b/fs/ocfs2/cluster/tcp.c
@@ -1441,14 +1441,6 @@ static void o2net_rx_until_empty(struct work_struct *work)
 	sc_put(sc);
 }
 
-static int o2net_set_usertimeout(struct socket *sock)
-{
-	int user_timeout = O2NET_TCP_USER_TIMEOUT;
-
-	return kernel_setsockopt(sock, SOL_TCP, TCP_USER_TIMEOUT,
-				(void *)&user_timeout, sizeof(user_timeout));
-}
-
 static void o2net_initialize_handshake(void)
 {
 	o2net_hand->o2hb_heartbeat_timeout_ms = cpu_to_be32(
@@ -1629,12 +1621,7 @@ static void o2net_start_connect(struct work_struct *work)
 	}
 
 	tcp_sock_set_nodelay(sc->sc_sock->sk, true);
-
-	ret = o2net_set_usertimeout(sock);
-	if (ret) {
-		mlog(ML_ERROR, "set TCP_USER_TIMEOUT failed with %d\n", ret);
-		goto out;
-	}
+	tcp_sock_set_user_timeout(sock->sk, O2NET_TCP_USER_TIMEOUT);
 
 	o2net_register_callbacks(sc->sc_sock->sk, sc);
 
@@ -1821,12 +1808,7 @@ static int o2net_accept_one(struct socket *sock, int *more)
 	new_sock->sk->sk_allocation = GFP_ATOMIC;
 
 	tcp_sock_set_nodelay(new_sock->sk, true);
-
-	ret = o2net_set_usertimeout(new_sock);
-	if (ret) {
-		mlog(ML_ERROR, "set TCP_USER_TIMEOUT failed with %d\n", ret);
-		goto out;
-	}
+	tcp_sock_set_user_timeout(new_sock->sk, O2NET_TCP_USER_TIMEOUT);
 
 	ret = new_sock->ops->getname(new_sock, (struct sockaddr *) &sin, 1);
 	if (ret < 0)
diff --git a/include/linux/tcp.h b/include/linux/tcp.h
index 77b832acf3398..69c988f84a184 100644
--- a/include/linux/tcp.h
+++ b/include/linux/tcp.h
@@ -498,5 +498,6 @@ void tcp_sock_set_cork(struct sock *sk, bool on);
 void tcp_sock_set_nodelay(struct sock *sk, bool on);
 void tcp_sock_set_quickack(struct sock *sk, int val);
 int tcp_sock_set_syncnt(struct sock *sk, int val);
+void tcp_sock_set_user_timeout(struct sock *sk, u32 val);
 
 #endif	/* _LINUX_TCP_H */
diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index 773b5cd366ab7..9a8d062b17a48 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -2882,6 +2882,14 @@ int tcp_sock_set_syncnt(struct sock *sk, int val)
 }
 EXPORT_SYMBOL(tcp_sock_set_syncnt);
 
+void tcp_sock_set_user_timeout(struct sock *sk, u32 val)
+{
+	lock_sock(sk);
+	inet_csk(sk)->icsk_user_timeout = val;
+	release_sock(sk);
+}
+EXPORT_SYMBOL(tcp_sock_set_user_timeout);
+
 /*
  *	Socket option code for TCP.
  */
diff --git a/net/sunrpc/xprtsock.c b/net/sunrpc/xprtsock.c
index 3dc2d52371a0e..30d4c4fcd3e38 100644
--- a/net/sunrpc/xprtsock.c
+++ b/net/sunrpc/xprtsock.c
@@ -2115,8 +2115,7 @@ static void xs_tcp_set_socket_timeouts(struct rpc_xprt *xprt,
 			(char *)&keepcnt, sizeof(keepcnt));
 
 	/* TCP user timeout (see RFC5482) */
-	kernel_setsockopt(sock, SOL_TCP, TCP_USER_TIMEOUT,
-			(char *)&timeo, sizeof(timeo));
+	tcp_sock_set_user_timeout(sock->sk, timeo);
 }
 
 static void xs_tcp_set_connect_timeout(struct rpc_xprt *xprt,
-- 
2.26.2

