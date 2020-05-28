Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id F1DDB1E56E3
	for <lists+cluster-devel@lfdr.de>; Thu, 28 May 2020 07:42:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590644555;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=El21RsQvoe4su07D1xd5LvSJKGBTGSQ1DZmCIUEZHFs=;
	b=Z7WhOt8CYNVTor3w8pQbNs5py34D0XJLVzkHA86rKo0zzn/Qtc1r9+O7kjBC9NdjVpIWe7
	sRuDcoP+WM4E6t+RLCgLyJJET1zENBjpVaWXSZpMTPI3yYiMQZDk6OB3P4ppvQvjqQ24OG
	YQniKlgtf14ZjJIlLGdePFM8L6CbC2w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-sCTJryBlPHWv6aCh8FrBeA-1; Thu, 28 May 2020 01:42:33 -0400
X-MC-Unique: sCTJryBlPHWv6aCh8FrBeA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04C49800D24;
	Thu, 28 May 2020 05:42:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E9E587A8A9;
	Thu, 28 May 2020 05:42:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D58C91809543;
	Thu, 28 May 2020 05:42:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04S5gTxC008328 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 28 May 2020 01:42:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 528FA202696B; Thu, 28 May 2020 05:42:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 46B7820234BA
	for <cluster-devel@redhat.com>; Thu, 28 May 2020 05:42:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD8C01859160
	for <cluster-devel@redhat.com>; Thu, 28 May 2020 05:42:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-44-o2hNzCBJOy2n80ITN6SdcQ-1; Thu, 28 May 2020 01:42:24 -0400
X-MC-Unique: o2hNzCBJOy2n80ITN6SdcQ-1
Received: from p4fdb1ad2.dip0.t-ipconnect.de ([79.219.26.210] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat
	Linux)) id 1jeArI-0002Bd-68; Thu, 28 May 2020 05:13:36 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Thu, 28 May 2020 07:12:25 +0200
Message-Id: <20200528051236.620353-18-hch@lst.de>
In-Reply-To: <20200528051236.620353-1-hch@lst.de>
References: <20200528051236.620353-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
	cluster-devel@redhat.com, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org, Jon Maloy <jmaloy@redhat.com>,
	Ying Xue <ying.xue@windriver.com>,
	Eric Dumazet <edumazet@google.com>, target-devel@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net, linux-nfs@vger.kernel.org,
	drbd-dev@tron.linbit.com, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
	ceph-devel@vger.kernel.org, linux-afs@lists.infradead.org,
	ocfs2-devel@oss.oracle.com, linux-rdma@vger.kernel.org
Subject: [Cluster-devel] [PATCH 17/28] tcp: add tcp_sock_set_keepcnt
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Add a helper to directly set the TCP_KEEPCNT sockopt from kernel space
without going through a fake uaccess.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/tcp.h   |  1 +
 net/ipv4/tcp.c        | 12 ++++++++++++
 net/rds/tcp.h         |  2 +-
 net/rds/tcp_listen.c  | 17 +++--------------
 net/sunrpc/xprtsock.c |  3 +--
 5 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/include/linux/tcp.h b/include/linux/tcp.h
index 1f9bada00faab..9aac824c523cf 100644
--- a/include/linux/tcp.h
+++ b/include/linux/tcp.h
@@ -498,6 +498,7 @@ int tcp_skb_shift(struct sk_buff *to, struct sk_buff *from, int pcount,
 		  int shiftlen);
 
 void tcp_sock_set_cork(struct sock *sk, bool on);
+int tcp_sock_set_keepcnt(struct sock *sk, int val);
 int tcp_sock_set_keepidle(struct sock *sk, int val);
 int tcp_sock_set_keepintvl(struct sock *sk, int val);
 void tcp_sock_set_nodelay(struct sock *sk);
diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index 7eb083e09786a..15d47d5e79510 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -2946,6 +2946,18 @@ int tcp_sock_set_keepintvl(struct sock *sk, int val)
 }
 EXPORT_SYMBOL(tcp_sock_set_keepintvl);
 
+int tcp_sock_set_keepcnt(struct sock *sk, int val)
+{
+	if (val < 1 || val > MAX_TCP_KEEPCNT)
+		return -EINVAL;
+
+	lock_sock(sk);
+	tcp_sk(sk)->keepalive_probes = val;
+	release_sock(sk);
+	return 0;
+}
+EXPORT_SYMBOL(tcp_sock_set_keepcnt);
+
 /*
  *	Socket option code for TCP.
  */
diff --git a/net/rds/tcp.h b/net/rds/tcp.h
index f6d75d8cb167a..bad9cf49d5657 100644
--- a/net/rds/tcp.h
+++ b/net/rds/tcp.h
@@ -70,7 +70,7 @@ struct socket *rds_tcp_listen_init(struct net *net, bool isv6);
 void rds_tcp_listen_stop(struct socket *sock, struct work_struct *acceptor);
 void rds_tcp_listen_data_ready(struct sock *sk);
 int rds_tcp_accept_one(struct socket *sock);
-int rds_tcp_keepalive(struct socket *sock);
+void rds_tcp_keepalive(struct socket *sock);
 void *rds_tcp_listen_sock_def_readable(struct net *net);
 
 /* tcp_recv.c */
diff --git a/net/rds/tcp_listen.c b/net/rds/tcp_listen.c
index 9ad555c48d15d..101cf14215a0b 100644
--- a/net/rds/tcp_listen.c
+++ b/net/rds/tcp_listen.c
@@ -38,27 +38,19 @@
 #include "rds.h"
 #include "tcp.h"
 
-int rds_tcp_keepalive(struct socket *sock)
+void rds_tcp_keepalive(struct socket *sock)
 {
 	/* values below based on xs_udp_default_timeout */
 	int keepidle = 5; /* send a probe 'keepidle' secs after last data */
 	int keepcnt = 5; /* number of unack'ed probes before declaring dead */
-	int ret = 0;
 
 	sock_set_keepalive(sock->sk);
-
-	ret = kernel_setsockopt(sock, IPPROTO_TCP, TCP_KEEPCNT,
-				(char *)&keepcnt, sizeof(keepcnt));
-	if (ret < 0)
-		goto bail;
-
+	tcp_sock_set_keepcnt(sock->sk, keepcnt);
 	tcp_sock_set_keepidle(sock->sk, keepidle);
 	/* KEEPINTVL is the interval between successive probes. We follow
 	 * the model in xs_tcp_finish_connecting() and re-use keepidle.
 	 */
 	tcp_sock_set_keepintvl(sock->sk, keepidle);
-bail:
-	return ret;
 }
 
 /* rds_tcp_accept_one_path(): if accepting on cp_index > 0, make sure the
@@ -140,10 +132,7 @@ int rds_tcp_accept_one(struct socket *sock)
 	new_sock->ops = sock->ops;
 	__module_get(new_sock->ops->owner);
 
-	ret = rds_tcp_keepalive(new_sock);
-	if (ret < 0)
-		goto out;
-
+	rds_tcp_keepalive(new_sock);
 	rds_tcp_tune(new_sock);
 
 	inet = inet_sk(new_sock->sk);
diff --git a/net/sunrpc/xprtsock.c b/net/sunrpc/xprtsock.c
index 5ca64e12af0c5..0d3ec055bc12f 100644
--- a/net/sunrpc/xprtsock.c
+++ b/net/sunrpc/xprtsock.c
@@ -2109,8 +2109,7 @@ static void xs_tcp_set_socket_timeouts(struct rpc_xprt *xprt,
 	sock_set_keepalive(sock->sk);
 	tcp_sock_set_keepidle(sock->sk, keepidle);
 	tcp_sock_set_keepintvl(sock->sk, keepidle);
-	kernel_setsockopt(sock, SOL_TCP, TCP_KEEPCNT,
-			(char *)&keepcnt, sizeof(keepcnt));
+	tcp_sock_set_keepcnt(sock->sk, keepcnt);
 
 	/* TCP user timeout (see RFC5482) */
 	tcp_sock_set_user_timeout(sock->sk, timeo);
-- 
2.26.2

