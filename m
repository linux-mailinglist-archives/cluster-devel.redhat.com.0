Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id CC57C1DC085
	for <lists+cluster-devel@lfdr.de>; Wed, 20 May 2020 22:49:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590007790;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OW2uCMeCAECvL0mFP+aIowjmR1Y37DbY3NyDlODlSU4=;
	b=bETSbGvezrJyRhaV9CLZp/FfQnqqyTkaYci+1+2/ObHvcc4QIugdLuzLa7pHBVsm/G8QzT
	ChgskihrEwo584LpPnVY+gH3wQ0nsnPSx0wIuVFX/heeRnc/qGTs31E13o81lzKeYAUkUd
	xJeDhg1wFTRGL3USDX/9qOCugwQMdIg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-9dZg0HSKO9mKZTxKIFCHmw-1; Wed, 20 May 2020 16:49:47 -0400
X-MC-Unique: 9dZg0HSKO9mKZTxKIFCHmw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99E251902EBB;
	Wed, 20 May 2020 20:49:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 596425DA69;
	Wed, 20 May 2020 20:49:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 160D41809543;
	Wed, 20 May 2020 20:49:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04KKnguV000571 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 20 May 2020 16:49:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8B49D5AB63; Wed, 20 May 2020 20:49:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AE045AB66
	for <cluster-devel@redhat.com>; Wed, 20 May 2020 20:49:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 753088A5E4C
	for <cluster-devel@redhat.com>; Wed, 20 May 2020 20:49:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-360-taIixH6bP3OqIfAdGvAbTQ-1; Wed, 20 May 2020 16:49:38 -0400
X-MC-Unique: taIixH6bP3OqIfAdGvAbTQ-1
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbUoS-0002L3-E8; Wed, 20 May 2020 19:55:36 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Wed, 20 May 2020 21:54:45 +0200
Message-Id: <20200520195509.2215098-10-hch@lst.de>
In-Reply-To: <20200520195509.2215098-1-hch@lst.de>
References: <20200520195509.2215098-1-hch@lst.de>
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
	drbd-dev@tron.linbit.com, ceph-devel@vger.kernel.org,
	linux-nfs@vger.kernel.org, Neil Horman <nhorman@tuxdriver.com>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	netdev@vger.kernel.org, Vlad Yasevich <vyasevich@gmail.com>,
	linux-kernel@vger.kernel.org, Jon Maloy <jmaloy@redhat.com>,
	Ying Xue <ying.xue@windriver.com>, ocfs2-devel@oss.oracle.com
Subject: [Cluster-devel] [PATCH 09/33] net: add sock_set_keepalive
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Add a helper to directly set the SO_KEEPALIVE sockopt from kernel space
without going through a fake uaccess.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/dlm/lowcomms.c     |  6 +-----
 include/net/sock.h    |  1 +
 net/core/sock.c       | 10 ++++++++++
 net/rds/tcp_listen.c  |  6 +-----
 net/sunrpc/xprtsock.c |  4 +---
 5 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index b79711d0aac72..b6e6dba281547 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1142,11 +1142,7 @@ static struct socket *tcp_create_listen_sock(struct connection *con,
 		con->sock = NULL;
 		goto create_out;
 	}
-	result = kernel_setsockopt(sock, SOL_SOCKET, SO_KEEPALIVE,
-				 (char *)&one, sizeof(one));
-	if (result < 0) {
-		log_print("Set keepalive failed: %d", result);
-	}
+	sock_set_keepalive(sock->sk);
 
 	result = sock->ops->listen(sock, 5);
 	if (result < 0) {
diff --git a/include/net/sock.h b/include/net/sock.h
index 99ef43508d2b5..dc08c176238fd 100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -2691,6 +2691,7 @@ void sock_def_readable(struct sock *sk);
 int sock_bindtoindex(struct sock *sk, int ifindex);
 void sock_enable_timestamps(struct sock *sk);
 void sock_no_linger(struct sock *sk);
+void sock_set_keepalive(struct sock *sk);
 void sock_set_priority(struct sock *sk, u32 priority);
 void sock_set_reuseaddr(struct sock *sk);
 void sock_set_sndtimeo(struct sock *sk, s64 secs);
diff --git a/net/core/sock.c b/net/core/sock.c
index e4a4dd2b3d8b3..728f5fb156a0c 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -779,6 +779,16 @@ void sock_enable_timestamps(struct sock *sk)
 }
 EXPORT_SYMBOL(sock_enable_timestamps);
 
+void sock_set_keepalive(struct sock *sk)
+{
+	lock_sock(sk);
+	if (sk->sk_prot->keepalive)
+		sk->sk_prot->keepalive(sk, true);
+	sock_valbool_flag(sk, SOCK_KEEPOPEN, true);
+	release_sock(sk);
+}
+EXPORT_SYMBOL(sock_set_keepalive);
+
 /*
  *	This is meant for all protocols to use and covers goings on
  *	at the socket level. Everything here is generic.
diff --git a/net/rds/tcp_listen.c b/net/rds/tcp_listen.c
index bbb31b9c0b391..d8bd132769594 100644
--- a/net/rds/tcp_listen.c
+++ b/net/rds/tcp_listen.c
@@ -43,13 +43,9 @@ int rds_tcp_keepalive(struct socket *sock)
 	/* values below based on xs_udp_default_timeout */
 	int keepidle = 5; /* send a probe 'keepidle' secs after last data */
 	int keepcnt = 5; /* number of unack'ed probes before declaring dead */
-	int keepalive = 1;
 	int ret = 0;
 
-	ret = kernel_setsockopt(sock, SOL_SOCKET, SO_KEEPALIVE,
-				(char *)&keepalive, sizeof(keepalive));
-	if (ret < 0)
-		goto bail;
+	sock_set_keepalive(sock->sk);
 
 	ret = kernel_setsockopt(sock, IPPROTO_TCP, TCP_KEEPCNT,
 				(char *)&keepcnt, sizeof(keepcnt));
diff --git a/net/sunrpc/xprtsock.c b/net/sunrpc/xprtsock.c
index 845d0be805ece..30082cd039960 100644
--- a/net/sunrpc/xprtsock.c
+++ b/net/sunrpc/xprtsock.c
@@ -2110,7 +2110,6 @@ static void xs_tcp_set_socket_timeouts(struct rpc_xprt *xprt,
 	struct sock_xprt *transport = container_of(xprt, struct sock_xprt, xprt);
 	unsigned int keepidle;
 	unsigned int keepcnt;
-	unsigned int opt_on = 1;
 	unsigned int timeo;
 
 	spin_lock(&xprt->transport_lock);
@@ -2122,8 +2121,7 @@ static void xs_tcp_set_socket_timeouts(struct rpc_xprt *xprt,
 	spin_unlock(&xprt->transport_lock);
 
 	/* TCP Keepalive options */
-	kernel_setsockopt(sock, SOL_SOCKET, SO_KEEPALIVE,
-			(char *)&opt_on, sizeof(opt_on));
+	sock_set_keepalive(sock->sk);
 	kernel_setsockopt(sock, SOL_TCP, TCP_KEEPIDLE,
 			(char *)&keepidle, sizeof(keepidle));
 	kernel_setsockopt(sock, SOL_TCP, TCP_KEEPINTVL,
-- 
2.26.2

