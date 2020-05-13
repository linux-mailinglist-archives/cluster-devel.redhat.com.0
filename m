Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 24B7B1D0763
	for <lists+cluster-devel@lfdr.de>; Wed, 13 May 2020 08:29:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589351340;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QPaZX7/JCyffHLJxjEndkv/C6xjGa9Qbi7ISD/LSjiI=;
	b=YfLLX7JLoZhLUd0t/FKjO80ZSa9YnQYCe4k9BErPVpwdvjTj8uAmIhvO0xE/GcfjnVeE4p
	rVdGHCO8hrvNeiU4UVATbwVKBPZsnLQIbMbjUYG+wxW9eJCQYLrnCjkYfqdkTPNcV7kbYu
	AHKH4+giEKv7ABjh3Qgb7dE38yXD/0M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-8eSJ03JjOA6zR7KrriM8xg-1; Wed, 13 May 2020 02:28:58 -0400
X-MC-Unique: 8eSJ03JjOA6zR7KrriM8xg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C05F872FEB;
	Wed, 13 May 2020 06:28:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AA8A70940;
	Wed, 13 May 2020 06:28:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 263711809543;
	Wed, 13 May 2020 06:28:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04D6Ss8U023225 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 13 May 2020 02:28:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1C53E20110C8; Wed, 13 May 2020 06:28:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 18F39202683E
	for <cluster-devel@redhat.com>; Wed, 13 May 2020 06:28:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65A8F800C6D
	for <cluster-devel@redhat.com>; Wed, 13 May 2020 06:28:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-234-3RZudwXINQq2991O_42Zkg-1; Wed, 13 May 2020 02:28:49 -0400
X-MC-Unique: 3RZudwXINQq2991O_42Zkg-1
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYkro-0004YK-Ju; Wed, 13 May 2020 06:27:45 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Wed, 13 May 2020 08:26:33 +0200
Message-Id: <20200513062649.2100053-19-hch@lst.de>
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
Subject: [Cluster-devel] [PATCH 18/33] ipv4: add ip_sock_set_tos
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

Add a helper to directly set the IP_TOS sockopt from kernel space without
going through a fake uaccess.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/tcp.c   | 14 +++-----------
 drivers/nvme/target/tcp.c | 10 ++--------
 include/net/ip.h          |  2 ++
 net/ipv4/ip_sockglue.c    | 30 +++++++++++++++++++++---------
 4 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 8417eeb83fcd2..6c069e982989e 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -1313,7 +1313,7 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl,
 {
 	struct nvme_tcp_ctrl *ctrl = to_tcp_ctrl(nctrl);
 	struct nvme_tcp_queue *queue = &ctrl->queues[qid];
-	int ret, opt, rcv_pdu_size;
+	int ret, rcv_pdu_size;
 
 	queue->ctrl = ctrl;
 	INIT_LIST_HEAD(&queue->send_list);
@@ -1352,16 +1352,8 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl,
 		sock_set_priority(queue->sock->sk, so_priority);
 
 	/* Set socket type of service */
-	if (nctrl->opts->tos >= 0) {
-		opt = nctrl->opts->tos;
-		ret = kernel_setsockopt(queue->sock, SOL_IP, IP_TOS,
-				(char *)&opt, sizeof(opt));
-		if (ret) {
-			dev_err(nctrl->device,
-				"failed to set IP_TOS sock opt %d\n", ret);
-			goto err_sock;
-		}
-	}
+	if (nctrl->opts->tos >= 0)
+		ip_sock_set_tos(queue->sock->sk, nctrl->opts->tos);
 
 	queue->sock->sk->sk_allocation = GFP_ATOMIC;
 	nvme_tcp_set_queue_io_cpu(queue);
diff --git a/drivers/nvme/target/tcp.c b/drivers/nvme/target/tcp.c
index b2bfa791c5cb2..4296fe3c745bf 100644
--- a/drivers/nvme/target/tcp.c
+++ b/drivers/nvme/target/tcp.c
@@ -1452,14 +1452,8 @@ static int nvmet_tcp_set_queue_sock(struct nvmet_tcp_queue *queue)
 		sock_set_priority(sock->sk, so_priority);
 
 	/* Set socket type of service */
-	if (inet->rcv_tos > 0) {
-		int tos = inet->rcv_tos;
-
-		ret = kernel_setsockopt(sock, SOL_IP, IP_TOS,
-				(char *)&tos, sizeof(tos));
-		if (ret)
-			return ret;
-	}
+	if (inet->rcv_tos > 0)
+		ip_sock_set_tos(sock->sk, inet->rcv_tos);
 
 	write_lock_bh(&sock->sk->sk_callback_lock);
 	sock->sk->sk_user_data = queue;
diff --git a/include/net/ip.h b/include/net/ip.h
index 5b317c9f4470a..2fc52e26fa88b 100644
--- a/include/net/ip.h
+++ b/include/net/ip.h
@@ -765,4 +765,6 @@ static inline bool inetdev_valid_mtu(unsigned int mtu)
 	return likely(mtu >= IPV4_MIN_MTU);
 }
 
+void ip_sock_set_tos(struct sock *sk, int val);
+
 #endif	/* _IP_H */
diff --git a/net/ipv4/ip_sockglue.c b/net/ipv4/ip_sockglue.c
index 8206047d70b6b..1733ac78c21aa 100644
--- a/net/ipv4/ip_sockglue.c
+++ b/net/ipv4/ip_sockglue.c
@@ -560,6 +560,26 @@ int ip_recv_error(struct sock *sk, struct msghdr *msg, int len, int *addr_len)
 	return err;
 }
 
+static void __ip_sock_set_tos(struct sock *sk, int val)
+{
+	if (sk->sk_type == SOCK_STREAM) {
+		val &= ~INET_ECN_MASK;
+		val |= inet_sk(sk)->tos & INET_ECN_MASK;
+	}
+	if (inet_sk(sk)->tos != val) {
+		inet_sk(sk)->tos = val;
+		sk->sk_priority = rt_tos2priority(val);
+		sk_dst_reset(sk);
+	}
+}
+
+void ip_sock_set_tos(struct sock *sk, int val)
+{
+	lock_sock(sk);
+	__ip_sock_set_tos(sk, val);
+	release_sock(sk);
+}
+EXPORT_SYMBOL(ip_sock_set_tos);
 
 /*
  *	Socket option code for IP. This is the end of the line after any
@@ -743,15 +763,7 @@ static int do_ip_setsockopt(struct sock *sk, int level,
 			inet->cmsg_flags &= ~IP_CMSG_RECVFRAGSIZE;
 		break;
 	case IP_TOS:	/* This sets both TOS and Precedence */
-		if (sk->sk_type == SOCK_STREAM) {
-			val &= ~INET_ECN_MASK;
-			val |= inet->tos & INET_ECN_MASK;
-		}
-		if (inet->tos != val) {
-			inet->tos = val;
-			sk->sk_priority = rt_tos2priority(val);
-			sk_dst_reset(sk);
-		}
+		__ip_sock_set_tos(sk, val);
 		break;
 	case IP_TTL:
 		if (optlen < 1)
-- 
2.26.2

