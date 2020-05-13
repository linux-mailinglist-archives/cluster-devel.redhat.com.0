Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 173861D08F0
	for <lists+cluster-devel@lfdr.de>; Wed, 13 May 2020 08:49:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589352544;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lMcK9CNUbL+jju+sk+Za5xMNx7m0mtw5FFKEm8NMVMg=;
	b=g7geHwLnhhREe0i/NzFwOs1thXE9dMeYZ2UezRAv0fAdNrENFjQ2Q2JQCIXQ5LSbB1huJz
	36HpsoPsTmCGnbdwk6AJbj3jasM7NDC5JfDMVQo5csikBe/vR/TO8tjBlH7KnuOEjK0L7d
	/EGvnPb8uzVCEBq0IpDLOM2iJlQ26F8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-aOsQCh2zPmS1lljpc7Ahxw-1; Wed, 13 May 2020 02:49:02 -0400
X-MC-Unique: aOsQCh2zPmS1lljpc7Ahxw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 465F5107ACF2;
	Wed, 13 May 2020 06:49:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 33DE82E170;
	Wed, 13 May 2020 06:49:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1E5E11809543;
	Wed, 13 May 2020 06:49:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04D6mwoN024616 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 13 May 2020 02:48:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 644AD2029F62; Wed, 13 May 2020 06:48:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FBDF200AFA6
	for <cluster-devel@redhat.com>; Wed, 13 May 2020 06:48:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B00D91611C
	for <cluster-devel@redhat.com>; Wed, 13 May 2020 06:48:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-41-Oj7bGh6nMtGHgOXwi16tQQ-1; Wed, 13 May 2020 02:48:53 -0400
X-MC-Unique: Oj7bGh6nMtGHgOXwi16tQQ-1
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYkri-0004T2-Vl; Wed, 13 May 2020 06:27:39 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Wed, 13 May 2020 08:26:31 +0200
Message-Id: <20200513062649.2100053-17-hch@lst.de>
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
Subject: [Cluster-devel] [PATCH 16/33] tcp: add tcp_sock_set_keepintvl
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

Add a helper to directly set the TCP_KEEPINTVL sockopt from kernel space
without going through a fake uaccess.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/tcp.h   |  1 +
 net/ipv4/tcp.c        | 12 ++++++++++++
 net/rds/tcp_listen.c  |  4 +---
 net/sunrpc/xprtsock.c |  3 +--
 4 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/include/linux/tcp.h b/include/linux/tcp.h
index 4d3a3e959e45b..dad18ca361c01 100644
--- a/include/linux/tcp.h
+++ b/include/linux/tcp.h
@@ -500,5 +500,6 @@ void tcp_sock_set_quickack(struct sock *sk, int val);
 int tcp_sock_set_syncnt(struct sock *sk, int val);
 void tcp_sock_set_user_timeout(struct sock *sk, u32 val);
 int tcp_sock_set_keepidle(struct sock *sk, int val);
+int tcp_sock_set_keepintvl(struct sock *sk, int val);
 
 #endif	/* _LINUX_TCP_H */
diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index 22eb9159c7d05..b714f2b2fa54e 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -2923,6 +2923,18 @@ int tcp_sock_set_keepidle(struct sock *sk, int val)
 }
 EXPORT_SYMBOL(tcp_sock_set_keepidle);
 
+int tcp_sock_set_keepintvl(struct sock *sk, int val)
+{
+	if (val < 1 || val > MAX_TCP_KEEPINTVL)
+		return -EINVAL;
+
+	lock_sock(sk);
+	tcp_sk(sk)->keepalive_intvl = val * HZ;
+	release_sock(sk);
+	return 0;
+}
+EXPORT_SYMBOL(tcp_sock_set_keepintvl);
+
 /*
  *	Socket option code for TCP.
  */
diff --git a/net/rds/tcp_listen.c b/net/rds/tcp_listen.c
index 8c76969d8c878..a5db2f8bb7339 100644
--- a/net/rds/tcp_listen.c
+++ b/net/rds/tcp_listen.c
@@ -53,12 +53,10 @@ int rds_tcp_keepalive(struct socket *sock)
 		goto bail;
 
 	tcp_sock_set_keepidle(sock->sk, keepidle);
-
 	/* KEEPINTVL is the interval between successive probes. We follow
 	 * the model in xs_tcp_finish_connecting() and re-use keepidle.
 	 */
-	ret = kernel_setsockopt(sock, IPPROTO_TCP, TCP_KEEPINTVL,
-				(char *)&keepidle, sizeof(keepidle));
+	tcp_sock_set_keepintvl(sock->sk, keepidle);
 bail:
 	return ret;
 }
diff --git a/net/sunrpc/xprtsock.c b/net/sunrpc/xprtsock.c
index ea79446789c69..e20de4a52edb7 100644
--- a/net/sunrpc/xprtsock.c
+++ b/net/sunrpc/xprtsock.c
@@ -2108,8 +2108,7 @@ static void xs_tcp_set_socket_timeouts(struct rpc_xprt *xprt,
 	/* TCP Keepalive options */
 	sock_set_keepalive(sock->sk, 1);
 	tcp_sock_set_keepidle(sock->sk, keepidle);
-	kernel_setsockopt(sock, SOL_TCP, TCP_KEEPINTVL,
-			(char *)&keepidle, sizeof(keepidle));
+	tcp_sock_set_keepintvl(sock->sk, keepidle);
 	kernel_setsockopt(sock, SOL_TCP, TCP_KEEPCNT,
 			(char *)&keepcnt, sizeof(keepcnt));
 
-- 
2.26.2

