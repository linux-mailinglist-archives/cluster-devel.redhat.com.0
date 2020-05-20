Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id A5DD91DC075
	for <lists+cluster-devel@lfdr.de>; Wed, 20 May 2020 22:46:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590007576;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VdTXGAkw/1nyL6z33X0b7/NfvqZ5AsGTWmUq3QW34Eo=;
	b=LZOb91Ql0XETyBqefAPYPh+BBlMmkINsXJIEDh3vwaboHEs7tZsQau1r/jdOnBJOaqL1v9
	veHsexL9L+J6Ps96ZBA01YLjea314PNFVGNTMUoAzZCWDHpzKZdQJtEVKZildxwhWel/kN
	Xj2hQCbkg6jv7kF8XLGcT2+s3GnuauM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-otcbkAyGP2qElnmgJyxoBA-1; Wed, 20 May 2020 16:46:15 -0400
X-MC-Unique: otcbkAyGP2qElnmgJyxoBA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D52AE80183C;
	Wed, 20 May 2020 20:46:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C558382E79;
	Wed, 20 May 2020 20:46:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AF5B74EDB8;
	Wed, 20 May 2020 20:46:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04KKkBDj000337 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 20 May 2020 16:46:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EC039C612B; Wed, 20 May 2020 20:46:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E8302D29E7
	for <cluster-devel@redhat.com>; Wed, 20 May 2020 20:46:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2F7E8007AC
	for <cluster-devel@redhat.com>; Wed, 20 May 2020 20:46:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-292-6j1mvLCqPE-8Syp7MG3TXA-1; Wed, 20 May 2020 16:46:06 -0400
X-MC-Unique: 6j1mvLCqPE-8Syp7MG3TXA-1
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbUoM-0002DS-V4; Wed, 20 May 2020 19:55:31 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Wed, 20 May 2020 21:54:43 +0200
Message-Id: <20200520195509.2215098-8-hch@lst.de>
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
Subject: [Cluster-devel] [PATCH 07/33] net: add sock_bindtoindex
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

Add a helper to directly set the SO_BINDTOIFINDEX sockopt from kernel
space without going through a fake uaccess.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/net/sock.h        |  1 +
 net/core/sock.c           | 21 +++++++++++++++------
 net/ipv4/udp_tunnel.c     |  4 +---
 net/ipv6/ip6_udp_tunnel.c |  4 +---
 4 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/include/net/sock.h b/include/net/sock.h
index 9a7b9e98685ac..cdec7bc055d5b 100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -2688,6 +2688,7 @@ static inline bool sk_dev_equal_l3scope(struct sock *sk, int dif)
 
 void sock_def_readable(struct sock *sk);
 
+int sock_bindtoindex(struct sock *sk, int ifindex);
 void sock_no_linger(struct sock *sk);
 void sock_set_priority(struct sock *sk, u32 priority);
 void sock_set_reuseaddr(struct sock *sk);
diff --git a/net/core/sock.c b/net/core/sock.c
index d3b1d61e4f768..23f80880fbb2c 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -566,7 +566,7 @@ struct dst_entry *sk_dst_check(struct sock *sk, u32 cookie)
 }
 EXPORT_SYMBOL(sk_dst_check);
 
-static int sock_setbindtodevice_locked(struct sock *sk, int ifindex)
+static int sock_bindtoindex_locked(struct sock *sk, int ifindex)
 {
 	int ret = -ENOPROTOOPT;
 #ifdef CONFIG_NETDEVICES
@@ -594,6 +594,18 @@ static int sock_setbindtodevice_locked(struct sock *sk, int ifindex)
 	return ret;
 }
 
+int sock_bindtoindex(struct sock *sk, int ifindex)
+{
+	int ret;
+
+	lock_sock(sk);
+	ret = sock_bindtoindex_locked(sk, ifindex);
+	release_sock(sk);
+
+	return ret;
+}
+EXPORT_SYMBOL(sock_bindtoindex);
+
 static int sock_setbindtodevice(struct sock *sk, char __user *optval,
 				int optlen)
 {
@@ -634,10 +646,7 @@ static int sock_setbindtodevice(struct sock *sk, char __user *optval,
 			goto out;
 	}
 
-	lock_sock(sk);
-	ret = sock_setbindtodevice_locked(sk, index);
-	release_sock(sk);
-
+	return sock_bindtoindex(sk, index);
 out:
 #endif
 
@@ -1216,7 +1225,7 @@ int sock_setsockopt(struct socket *sock, int level, int optname,
 		break;
 
 	case SO_BINDTOIFINDEX:
-		ret = sock_setbindtodevice_locked(sk, val);
+		ret = sock_bindtoindex_locked(sk, val);
 		break;
 
 	default:
diff --git a/net/ipv4/udp_tunnel.c b/net/ipv4/udp_tunnel.c
index 150e6f0fdbf59..2158e8bddf41c 100644
--- a/net/ipv4/udp_tunnel.c
+++ b/net/ipv4/udp_tunnel.c
@@ -22,9 +22,7 @@ int udp_sock_create4(struct net *net, struct udp_port_cfg *cfg,
 		goto error;
 
 	if (cfg->bind_ifindex) {
-		err = kernel_setsockopt(sock, SOL_SOCKET, SO_BINDTOIFINDEX,
-					(void *)&cfg->bind_ifindex,
-					sizeof(cfg->bind_ifindex));
+		err = sock_bindtoindex(sock->sk, cfg->bind_ifindex);
 		if (err < 0)
 			goto error;
 	}
diff --git a/net/ipv6/ip6_udp_tunnel.c b/net/ipv6/ip6_udp_tunnel.c
index 58956a6b66a21..6523609516d25 100644
--- a/net/ipv6/ip6_udp_tunnel.c
+++ b/net/ipv6/ip6_udp_tunnel.c
@@ -33,9 +33,7 @@ int udp_sock_create6(struct net *net, struct udp_port_cfg *cfg,
 			goto error;
 	}
 	if (cfg->bind_ifindex) {
-		err = kernel_setsockopt(sock, SOL_SOCKET, SO_BINDTOIFINDEX,
-					(void *)&cfg->bind_ifindex,
-					sizeof(cfg->bind_ifindex));
+		err = sock_bindtoindex(sock->sk, cfg->bind_ifindex);
 		if (err < 0)
 			goto error;
 	}
-- 
2.26.2

