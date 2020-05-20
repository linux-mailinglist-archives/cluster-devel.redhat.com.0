Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 1CD641DBEA6
	for <lists+cluster-devel@lfdr.de>; Wed, 20 May 2020 21:57:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590004633;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SoJc1/taCxcgg46E3sLXJ5D5ViTmiGYbfa508lCrHhc=;
	b=Wd+75o1o6hJMwAULp4WHHVqmU2q8t5txNV9b3f/FPkIXMqpb6W4ssoGsucJ3OfICgtKr3T
	2zc6O/N8h26q0w+CzHMXAhIp2yJUvaQW3kMBTwKtCsg8dyBCd2EG0rislO6WXouZK2TPS1
	lwvkxgxfCRMocqqnpO+FoM/KSe7u2/E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-7BlX_SWLN8WR0vsVVcBxQg-1; Wed, 20 May 2020 15:57:11 -0400
X-MC-Unique: 7BlX_SWLN8WR0vsVVcBxQg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B682A474;
	Wed, 20 May 2020 19:57:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A75596E9E7;
	Wed, 20 May 2020 19:57:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9545454D02;
	Wed, 20 May 2020 19:57:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04KJv6aL030094 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 20 May 2020 15:57:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E145F2166BA3; Wed, 20 May 2020 19:57:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C36272156A4E
	for <cluster-devel@redhat.com>; Wed, 20 May 2020 19:57:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E7208ECB28
	for <cluster-devel@redhat.com>; Wed, 20 May 2020 19:57:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-154-gF9N6ErINrCdPZYmSDZIhw-1; Wed, 20 May 2020 15:57:03 -0400
X-MC-Unique: gF9N6ErINrCdPZYmSDZIhw-1
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbUpN-0003Qz-8p; Wed, 20 May 2020 19:56:33 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Wed, 20 May 2020 21:55:05 +0200
Message-Id: <20200520195509.2215098-30-hch@lst.de>
In-Reply-To: <20200520195509.2215098-1-hch@lst.de>
References: <20200520195509.2215098-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	linux-nvme@lists.infradead.org, linux-sctp@vger.kernel.org,
	target-devel@vger.kernel.org, linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
	linux-rdma@vger.kernel.org, cluster-devel@redhat.com,
	Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
	drbd-dev@tron.linbit.com, ceph-devel@vger.kernel.org,
	linux-nfs@vger.kernel.org, Neil Horman <nhorman@tuxdriver.com>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	netdev@vger.kernel.org, Vlad Yasevich <vyasevich@gmail.com>,
	linux-kernel@vger.kernel.org, Jon Maloy <jmaloy@redhat.com>,
	Ying Xue <ying.xue@windriver.com>, ocfs2-devel@oss.oracle.com
Subject: [Cluster-devel] [PATCH 29/33] rxrpc: add
	rxrpc_sock_set_min_security_level
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

Add a helper to directly set the RXRPC_MIN_SECURITY_LEVEL sockopt from
kernel space without going through a fake uaccess.

Thanks to David Howells for the documentation updates.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 Documentation/networking/rxrpc.rst | 13 +++++++++++--
 fs/afs/rxrpc.c                     |  6 ++----
 include/net/af_rxrpc.h             |  2 ++
 net/rxrpc/af_rxrpc.c               | 13 +++++++++++++
 4 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/Documentation/networking/rxrpc.rst b/Documentation/networking/rxrpc.rst
index 5ad35113d0f46..68552b92dc442 100644
--- a/Documentation/networking/rxrpc.rst
+++ b/Documentation/networking/rxrpc.rst
@@ -477,7 +477,7 @@ AF_RXRPC sockets support a few socket options at the SOL_RXRPC level:
 	 Encrypted checksum plus packet padded and first eight bytes of packet
 	 encrypted - which includes the actual packet length.
 
-     (c) RXRPC_SECURITY_ENCRYPTED
+     (c) RXRPC_SECURITY_ENCRYPT
 
 	 Encrypted checksum plus entire packet padded and encrypted, including
 	 actual packet length.
@@ -578,7 +578,7 @@ A client would issue an operation by:
      This issues a request_key() to get the key representing the security
      context.  The minimum security level can be set::
 
-	unsigned int sec = RXRPC_SECURITY_ENCRYPTED;
+	unsigned int sec = RXRPC_SECURITY_ENCRYPT;
 	setsockopt(client, SOL_RXRPC, RXRPC_MIN_SECURITY_LEVEL,
 		   &sec, sizeof(sec));
 
@@ -1090,6 +1090,15 @@ The kernel interface functions are as follows:
      jiffies).  In the event of the timeout occurring, the call will be
      aborted and -ETIME or -ETIMEDOUT will be returned.
 
+ (#) Apply the RXRPC_MIN_SECURITY_LEVEL sockopt to a socket from within in the
+     kernel::
+
+       int rxrpc_sock_set_min_security_level(struct sock *sk,
+					     unsigned int val);
+
+     This specifies the minimum security level required for calls on this
+     socket.
+
 
 Configurable Parameters
 =======================
diff --git a/fs/afs/rxrpc.c b/fs/afs/rxrpc.c
index 1ecc67da6c1a4..e313dae01674f 100644
--- a/fs/afs/rxrpc.c
+++ b/fs/afs/rxrpc.c
@@ -37,7 +37,6 @@ int afs_open_socket(struct afs_net *net)
 {
 	struct sockaddr_rxrpc srx;
 	struct socket *socket;
-	unsigned int min_level;
 	int ret;
 
 	_enter("");
@@ -57,9 +56,8 @@ int afs_open_socket(struct afs_net *net)
 	srx.transport.sin6.sin6_family	= AF_INET6;
 	srx.transport.sin6.sin6_port	= htons(AFS_CM_PORT);
 
-	min_level = RXRPC_SECURITY_ENCRYPT;
-	ret = kernel_setsockopt(socket, SOL_RXRPC, RXRPC_MIN_SECURITY_LEVEL,
-				(void *)&min_level, sizeof(min_level));
+	ret = rxrpc_sock_set_min_security_level(socket->sk,
+						RXRPC_SECURITY_ENCRYPT);
 	if (ret < 0)
 		goto error_2;
 
diff --git a/include/net/af_rxrpc.h b/include/net/af_rxrpc.h
index 04e97bab6f28b..8d7b469453bda 100644
--- a/include/net/af_rxrpc.h
+++ b/include/net/af_rxrpc.h
@@ -72,4 +72,6 @@ bool rxrpc_kernel_call_is_complete(struct rxrpc_call *);
 void rxrpc_kernel_set_max_life(struct socket *, struct rxrpc_call *,
 			       unsigned long);
 
+int rxrpc_sock_set_min_security_level(struct sock *sk, unsigned int val);
+
 #endif /* _NET_RXRPC_H */
diff --git a/net/rxrpc/af_rxrpc.c b/net/rxrpc/af_rxrpc.c
index 15ee92d795815..394189b81849f 100644
--- a/net/rxrpc/af_rxrpc.c
+++ b/net/rxrpc/af_rxrpc.c
@@ -571,6 +571,19 @@ static int rxrpc_sendmsg(struct socket *sock, struct msghdr *m, size_t len)
 	return ret;
 }
 
+int rxrpc_sock_set_min_security_level(struct sock *sk, unsigned int val)
+{
+	if (sk->sk_state != RXRPC_UNBOUND)
+		return -EISCONN;
+	if (val > RXRPC_SECURITY_MAX)
+		return -EINVAL;
+	lock_sock(sk);
+	rxrpc_sk(sk)->min_sec_level = val;
+	release_sock(sk);
+	return 0;
+}
+EXPORT_SYMBOL(rxrpc_sock_set_min_security_level);
+
 /*
  * set RxRPC socket options
  */
-- 
2.26.2

