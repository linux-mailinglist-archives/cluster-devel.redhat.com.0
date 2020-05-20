Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 4920B1DBEA1
	for <lists+cluster-devel@lfdr.de>; Wed, 20 May 2020 21:57:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590004629;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QpRXC42itvlGOi08tyVGrkTiIRJQe8NZz0la886kVrU=;
	b=gYuNUfkq+uHB00kO2sM/tci24lnQQO+7UGwvMG+YJ9mUldyF3kTaNXNl7gayWwNbIE0/PI
	TozeTgUQiQQmv0yr/FJoCtrbwenc3zAKmQkKPpLqldZh+8OHRbc6xcOH3H1NbkwwrFc3JK
	gjQlSISWq/JuXkSurDSVl5KM4wOnvkE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-HintNj7ONfida_DfTxFEqw-1; Wed, 20 May 2020 15:57:07 -0400
X-MC-Unique: HintNj7ONfida_DfTxFEqw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73D7F1009445;
	Wed, 20 May 2020 19:57:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 62F7F473A9;
	Wed, 20 May 2020 19:57:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 50A0554D01;
	Wed, 20 May 2020 19:57:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04KJv2hY030076 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 20 May 2020 15:57:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ED62DB5530; Wed, 20 May 2020 19:57:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E9C19D1BC3
	for <cluster-devel@redhat.com>; Wed, 20 May 2020 19:57:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D003B811E7A
	for <cluster-devel@redhat.com>; Wed, 20 May 2020 19:57:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-420-Pxv_dryKPwyXPTPgQUULPw-1; Wed, 20 May 2020 15:56:59 -0400
X-MC-Unique: Pxv_dryKPwyXPTPgQUULPw-1
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbUpH-0003Kh-Sb; Wed, 20 May 2020 19:56:28 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Wed, 20 May 2020 21:55:03 +0200
Message-Id: <20200520195509.2215098-28-hch@lst.de>
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
Subject: [Cluster-devel] [PATCH 27/33] ipv6: add
	ip6_sock_set_addr_preferences
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

Add a helper to directly set the IPV6_ADD_PREFERENCES sockopt from kernel
space without going through a fake uaccess.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/net/ipv6.h       | 67 ++++++++++++++++++++++++++++++++++++++++
 net/ipv6/ipv6_sockglue.c | 59 +----------------------------------
 net/sunrpc/xprtsock.c    |  7 +++--
 3 files changed, 72 insertions(+), 61 deletions(-)

diff --git a/include/net/ipv6.h b/include/net/ipv6.h
index 3b02049d2e582..80260cff7e0c0 100644
--- a/include/net/ipv6.h
+++ b/include/net/ipv6.h
@@ -1194,4 +1194,71 @@ static inline void ip6_sock_set_recverr(struct sock *sk)
 	release_sock(sk);
 }
 
+static inline int __ip6_sock_set_addr_preferences(struct sock *sk, int val)
+{
+	unsigned int pref = 0;
+	unsigned int prefmask = ~0;
+
+	/* check PUBLIC/TMP/PUBTMP_DEFAULT conflicts */
+	switch (val & (IPV6_PREFER_SRC_PUBLIC |
+		       IPV6_PREFER_SRC_TMP |
+		       IPV6_PREFER_SRC_PUBTMP_DEFAULT)) {
+	case IPV6_PREFER_SRC_PUBLIC:
+		pref |= IPV6_PREFER_SRC_PUBLIC;
+		prefmask &= ~(IPV6_PREFER_SRC_PUBLIC |
+			      IPV6_PREFER_SRC_TMP);
+		break;
+	case IPV6_PREFER_SRC_TMP:
+		pref |= IPV6_PREFER_SRC_TMP;
+		prefmask &= ~(IPV6_PREFER_SRC_PUBLIC |
+			      IPV6_PREFER_SRC_TMP);
+		break;
+	case IPV6_PREFER_SRC_PUBTMP_DEFAULT:
+		prefmask &= ~(IPV6_PREFER_SRC_PUBLIC |
+			      IPV6_PREFER_SRC_TMP);
+		break;
+	case 0:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* check HOME/COA conflicts */
+	switch (val & (IPV6_PREFER_SRC_HOME | IPV6_PREFER_SRC_COA)) {
+	case IPV6_PREFER_SRC_HOME:
+		prefmask &= ~IPV6_PREFER_SRC_COA;
+		break;
+	case IPV6_PREFER_SRC_COA:
+		pref |= IPV6_PREFER_SRC_COA;
+		break;
+	case 0:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* check CGA/NONCGA conflicts */
+	switch (val & (IPV6_PREFER_SRC_CGA|IPV6_PREFER_SRC_NONCGA)) {
+	case IPV6_PREFER_SRC_CGA:
+	case IPV6_PREFER_SRC_NONCGA:
+	case 0:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	inet6_sk(sk)->srcprefs = (inet6_sk(sk)->srcprefs & prefmask) | pref;
+	return 0;
+}
+
+static inline int ip6_sock_set_addr_preferences(struct sock *sk, bool val)
+{
+	int ret;
+
+	lock_sock(sk);
+	ret = __ip6_sock_set_addr_preferences(sk, val);
+	release_sock(sk);
+	return ret;
+}
+
 #endif /* _NET_IPV6_H */
diff --git a/net/ipv6/ipv6_sockglue.c b/net/ipv6/ipv6_sockglue.c
index a0e50cc57e545..6bcd2e0967df9 100644
--- a/net/ipv6/ipv6_sockglue.c
+++ b/net/ipv6/ipv6_sockglue.c
@@ -838,67 +838,10 @@ static int do_ipv6_setsockopt(struct sock *sk, int level, int optname,
 		break;
 
 	case IPV6_ADDR_PREFERENCES:
-	    {
-		unsigned int pref = 0;
-		unsigned int prefmask = ~0;
-
 		if (optlen < sizeof(int))
 			goto e_inval;
-
-		retv = -EINVAL;
-
-		/* check PUBLIC/TMP/PUBTMP_DEFAULT conflicts */
-		switch (val & (IPV6_PREFER_SRC_PUBLIC|
-			       IPV6_PREFER_SRC_TMP|
-			       IPV6_PREFER_SRC_PUBTMP_DEFAULT)) {
-		case IPV6_PREFER_SRC_PUBLIC:
-			pref |= IPV6_PREFER_SRC_PUBLIC;
-			break;
-		case IPV6_PREFER_SRC_TMP:
-			pref |= IPV6_PREFER_SRC_TMP;
-			break;
-		case IPV6_PREFER_SRC_PUBTMP_DEFAULT:
-			break;
-		case 0:
-			goto pref_skip_pubtmp;
-		default:
-			goto e_inval;
-		}
-
-		prefmask &= ~(IPV6_PREFER_SRC_PUBLIC|
-			      IPV6_PREFER_SRC_TMP);
-pref_skip_pubtmp:
-
-		/* check HOME/COA conflicts */
-		switch (val & (IPV6_PREFER_SRC_HOME|IPV6_PREFER_SRC_COA)) {
-		case IPV6_PREFER_SRC_HOME:
-			break;
-		case IPV6_PREFER_SRC_COA:
-			pref |= IPV6_PREFER_SRC_COA;
-		case 0:
-			goto pref_skip_coa;
-		default:
-			goto e_inval;
-		}
-
-		prefmask &= ~IPV6_PREFER_SRC_COA;
-pref_skip_coa:
-
-		/* check CGA/NONCGA conflicts */
-		switch (val & (IPV6_PREFER_SRC_CGA|IPV6_PREFER_SRC_NONCGA)) {
-		case IPV6_PREFER_SRC_CGA:
-		case IPV6_PREFER_SRC_NONCGA:
-		case 0:
-			break;
-		default:
-			goto e_inval;
-		}
-
-		np->srcprefs = (np->srcprefs & prefmask) | pref;
-		retv = 0;
-
+		retv = __ip6_sock_set_addr_preferences(sk, val);
 		break;
-	    }
 	case IPV6_MINHOPCOUNT:
 		if (optlen < sizeof(int))
 			goto e_inval;
diff --git a/net/sunrpc/xprtsock.c b/net/sunrpc/xprtsock.c
index 0d3ec055bc12f..3a143e250b9ac 100644
--- a/net/sunrpc/xprtsock.c
+++ b/net/sunrpc/xprtsock.c
@@ -2150,7 +2150,6 @@ static int xs_tcp_finish_connecting(struct rpc_xprt *xprt, struct socket *sock)
 
 	if (!transport->inet) {
 		struct sock *sk = sock->sk;
-		unsigned int addr_pref = IPV6_PREFER_SRC_PUBLIC;
 
 		/* Avoid temporary address, they are bad for long-lived
 		 * connections such as NFS mounts.
@@ -2159,8 +2158,10 @@ static int xs_tcp_finish_connecting(struct rpc_xprt *xprt, struct socket *sock)
 		 *    knowledge about the normal duration of connections,
 		 *    MAY override this as appropriate.
 		 */
-		kernel_setsockopt(sock, SOL_IPV6, IPV6_ADDR_PREFERENCES,
-				(char *)&addr_pref, sizeof(addr_pref));
+		if (xs_addr(xprt)->sa_family == PF_INET6) {
+			ip6_sock_set_addr_preferences(sk,
+				IPV6_PREFER_SRC_PUBLIC);
+		}
 
 		xs_tcp_set_socket_timeouts(xprt, sock);
 
-- 
2.26.2

