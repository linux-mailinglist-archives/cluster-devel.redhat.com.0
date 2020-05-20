Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1FBD91DBE9E
	for <lists+cluster-devel@lfdr.de>; Wed, 20 May 2020 21:57:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590004627;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vMk78OZOCGeuqFhgy6znIonFFjP8WPcQrbTXb90IKtU=;
	b=O5yql2Cu+mcDvZk51+XQmHZE5ag3aefgv1dlVH6nhEogmCVSH2G61eV8/NromCC8YjJSB7
	ZcsZCCEo6YTGLvIamIANr8/cRoiC1acN2LEJh86zclXGahUryYhDyugxqRcovzzw0ptInK
	mcXvTbKt7j5o5LJvf9uSqcwg1NbFa7E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-aJZ86TJfN9-gM1GzBV4TGg-1; Wed, 20 May 2020 15:57:05 -0400
X-MC-Unique: aJZ86TJfN9-gM1GzBV4TGg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1AF008015D1;
	Wed, 20 May 2020 19:57:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B0896E9FD;
	Wed, 20 May 2020 19:57:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ECAE654D03;
	Wed, 20 May 2020 19:57:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04KJusS0029987 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 20 May 2020 15:56:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BCD77202696B; Wed, 20 May 2020 19:56:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8F272026DFD
	for <cluster-devel@redhat.com>; Wed, 20 May 2020 19:56:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39910811E77
	for <cluster-devel@redhat.com>; Wed, 20 May 2020 19:56:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-371-PTF3ctd-Ou6755hHk-8ONg-1; Wed, 20 May 2020 15:56:51 -0400
X-MC-Unique: PTF3ctd-Ou6755hHk-8ONg-1
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbUp3-00033J-OD; Wed, 20 May 2020 19:56:14 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Wed, 20 May 2020 21:54:58 +0200
Message-Id: <20200520195509.2215098-23-hch@lst.de>
In-Reply-To: <20200520195509.2215098-1-hch@lst.de>
References: <20200520195509.2215098-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Eric Dumazet <edumazet@google.com>, linux-nvme@lists.infradead.org,
	David Howells <dhowells@redhat.com>, linux-sctp@vger.kernel.org,
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
Subject: [Cluster-devel] [PATCH 22/33] ipv4: add ip_sock_set_recverr
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

Add a helper to directly set the IP_RECVERR sockopt from kernel space
without going through a fake uaccess.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: David Howells <dhowells@redhat.com>
---
 include/net/ip.h         | 1 +
 net/ipv4/ip_sockglue.c   | 8 ++++++++
 net/rxrpc/local_object.c | 8 +-------
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/include/net/ip.h b/include/net/ip.h
index 5f5d8226b6abc..f063a491b9063 100644
--- a/include/net/ip.h
+++ b/include/net/ip.h
@@ -766,6 +766,7 @@ static inline bool inetdev_valid_mtu(unsigned int mtu)
 }
 
 void ip_sock_set_freebind(struct sock *sk);
+void ip_sock_set_recverr(struct sock *sk);
 void ip_sock_set_tos(struct sock *sk, int val);
 
 #endif	/* _IP_H */
diff --git a/net/ipv4/ip_sockglue.c b/net/ipv4/ip_sockglue.c
index 62e642ab80126..9a6a65b66f9d3 100644
--- a/net/ipv4/ip_sockglue.c
+++ b/net/ipv4/ip_sockglue.c
@@ -589,6 +589,14 @@ void ip_sock_set_freebind(struct sock *sk)
 }
 EXPORT_SYMBOL(ip_sock_set_freebind);
 
+void ip_sock_set_recverr(struct sock *sk)
+{
+	lock_sock(sk);
+	inet_sk(sk)->recverr = true;
+	release_sock(sk);
+}
+EXPORT_SYMBOL(ip_sock_set_recverr);
+
 /*
  *	Socket option code for IP. This is the end of the line after any
  *	TCP,UDP etc options on an IP socket.
diff --git a/net/rxrpc/local_object.c b/net/rxrpc/local_object.c
index 5ea2bd01fdd59..4c0e8fe5ec1fb 100644
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
+		ip_sock_set_recverr(local->socket->sk);
 
 		/* we want to set the don't fragment bit */
 		opt = IP_PMTUDISC_DO;
-- 
2.26.2

