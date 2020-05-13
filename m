Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 5951A1D0759
	for <lists+cluster-devel@lfdr.de>; Wed, 13 May 2020 08:28:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589351323;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=t2+3d1GMUU2gBdyKmy97XR5S00mpHCy5yoItuCa1zGY=;
	b=DS1SHje4tDS0tChxXYwslfZaj1s9z/yquiwwoiGWlxecZmL18vY1ZZatC7NG+a9fndLcKZ
	LyICZ1N3az1p0X30LnFeDJYt8lDGlzwdTfTrPMkNr+hK3eLYXx5qf3AJ7BV31uWEylNg76
	oQZdDeTbDjdWo3BmU3F32yYDe7OUe8w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-lb4kf3shP0y2M5vno0qb7A-1; Wed, 13 May 2020 02:28:40 -0400
X-MC-Unique: lb4kf3shP0y2M5vno0qb7A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87646474;
	Wed, 13 May 2020 06:28:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 670D0100164D;
	Wed, 13 May 2020 06:28:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7AC314CAAE;
	Wed, 13 May 2020 06:28:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04D6SZx8023116 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 13 May 2020 02:28:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CE3CE2028DCC; Wed, 13 May 2020 06:28:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA9992026972
	for <cluster-devel@redhat.com>; Wed, 13 May 2020 06:28:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00DEF80CDAE
	for <cluster-devel@redhat.com>; Wed, 13 May 2020 06:28:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-329-y3HKOY8jPIWtcGvxJ25phA-1; Wed, 13 May 2020 02:28:30 -0400
X-MC-Unique: y3HKOY8jPIWtcGvxJ25phA-1
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYkrw-0004ea-1N; Wed, 13 May 2020 06:27:52 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Wed, 13 May 2020 08:26:35 +0200
Message-Id: <20200513062649.2100053-21-hch@lst.de>
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
Subject: [Cluster-devel] [PATCH 20/33] ipv4: add ip_sock_set_recverr
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Add a helper to directly set the IP_RECVERR sockopt from kernel space
without going through a fake uaccess.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/net/ip.h         |  1 +
 net/ipv4/ip_sockglue.c   | 10 ++++++++++
 net/rxrpc/local_object.c |  8 +-------
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/include/net/ip.h b/include/net/ip.h
index 1e2feca8630d0..7ab8140b54429 100644
--- a/include/net/ip.h
+++ b/include/net/ip.h
@@ -767,5 +767,6 @@ static inline bool inetdev_valid_mtu(unsigned int mtu)
 
 void ip_sock_set_tos(struct sock *sk, int val);
 void ip_sock_set_freebind(struct sock *sk, bool val);
+void ip_sock_set_recverr(struct sock *sk, bool val);
 
 #endif	/* _IP_H */
diff --git a/net/ipv4/ip_sockglue.c b/net/ipv4/ip_sockglue.c
index 0c40887a817f8..9abecc3195520 100644
--- a/net/ipv4/ip_sockglue.c
+++ b/net/ipv4/ip_sockglue.c
@@ -589,6 +589,16 @@ void ip_sock_set_freebind(struct sock *sk, bool val)
 }
 EXPORT_SYMBOL(ip_sock_set_freebind);
 
+void ip_sock_set_recverr(struct sock *sk, bool val)
+{
+	lock_sock(sk);
+	inet_sk(sk)->recverr = val;
+	if (!val)
+		skb_queue_purge(&sk->sk_error_queue);
+	release_sock(sk);
+}
+EXPORT_SYMBOL(ip_sock_set_recverr);
+
 /*
  *	Socket option code for IP. This is the end of the line after any
  *	TCP,UDP etc options on an IP socket.
diff --git a/net/rxrpc/local_object.c b/net/rxrpc/local_object.c
index 562ea36c96b0f..1b87b8a9ff725 100644
--- a/net/rxrpc/local_object.c
+++ b/net/rxrpc/local_object.c
@@ -171,13 +171,7 @@ static int rxrpc_open_socket(struct rxrpc_local *local, struct net *net)
 		/* Fall through */
 	case AF_INET:
 		/* we want to receive ICMP errors */
-		opt = 1;
-		ret = kernel_setsockopt(local->socket, SOL_IP, IP_RECVERR,
-					(char *) &opt, sizeof(opt));
-		if (ret < 0) {
-			_debug("setsockopt failed");
-			goto error;
-		}
+		ip_sock_set_recverr(local->socket->sk, true);
 
 		/* we want to set the don't fragment bit */
 		opt = IP_PMTUDISC_DO;
-- 
2.26.2

