Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 05C731D076B
	for <lists+cluster-devel@lfdr.de>; Wed, 13 May 2020 08:29:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589351349;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6XOFdt3BhFcNF2nq+dKDKc/KE/QRe9Oo6tdZvR2zaY4=;
	b=WgXKbt9TzxwkUYrwp0GdB1xMem0avngiWBJ7HXrlId7hlj7HuySAwyF9w2zw8Kg0j6MF0K
	9iiFeeYKenAmPJTJunkNMI8GVUmfEA/kNphI4b0efjlkV1jlRvOlr9pMsNJuLTiPHtnOkH
	QyHfiFPRadMPHuw5IcnyjdFdc1NHwOg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-va8Ohf76NU-UETosBmXU_w-1; Wed, 13 May 2020 02:29:07 -0400
X-MC-Unique: va8Ohf76NU-UETosBmXU_w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08B37107ACF2;
	Wed, 13 May 2020 06:29:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EBD352E16B;
	Wed, 13 May 2020 06:29:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D96BD1809547;
	Wed, 13 May 2020 06:29:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04D6T3TU023290 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 13 May 2020 02:29:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 623F32166BA3; Wed, 13 May 2020 06:29:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E0FA2166B27
	for <cluster-devel@redhat.com>; Wed, 13 May 2020 06:29:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 451B885A5B0
	for <cluster-devel@redhat.com>; Wed, 13 May 2020 06:29:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-366-mKroDlRyNtixKxHJCBQ4Mg-1; Wed, 13 May 2020 02:29:00 -0400
X-MC-Unique: mKroDlRyNtixKxHJCBQ4Mg-1
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYksY-0005Ge-1j; Wed, 13 May 2020 06:28:30 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Wed, 13 May 2020 08:26:47 +0200
Message-Id: <20200513062649.2100053-33-hch@lst.de>
In-Reply-To: <20200513062649.2100053-1-hch@lst.de>
References: <20200513062649.2100053-1-hch@lst.de>
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
	linux-block@vger.kernel.org, drbd-dev@tron.linbit.com,
	ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
	Neil Horman <nhorman@tuxdriver.com>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	netdev@vger.kernel.org, Vlad Yasevich <vyasevich@gmail.com>,
	linux-kernel@vger.kernel.org, Jon Maloy <jmaloy@redhat.com>,
	Ying Xue <ying.xue@windriver.com>, ocfs2-devel@oss.oracle.com
Subject: [Cluster-devel] [PATCH 32/33] sctp: add sctp_sock_get_primary_addr
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

Add a helper to directly get the SCTP_PRIMARY_ADDR sockopt from kernel
space without going through a fake uaccess.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/dlm/lowcomms.c       | 11 +++-----
 include/net/sctp/sctp.h |  1 +
 net/sctp/socket.c       | 57 +++++++++++++++++++++++++----------------
 3 files changed, 39 insertions(+), 30 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 6fa45365666a8..46d2d71b62c57 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -855,10 +855,9 @@ static int tcp_accept_from_sock(struct connection *con)
 static int sctp_accept_from_sock(struct connection *con)
 {
 	/* Check that the new node is in the lockspace */
-	struct sctp_prim prim;
+	struct sctp_prim prim = { };
 	int nodeid;
-	int prim_len, ret;
-	int addr_len;
+	int addr_len, ret;
 	struct connection *newcon;
 	struct connection *addcon;
 	struct socket *newsock;
@@ -876,11 +875,7 @@ static int sctp_accept_from_sock(struct connection *con)
 	if (ret < 0)
 		goto accept_err;
 
-	memset(&prim, 0, sizeof(struct sctp_prim));
-	prim_len = sizeof(struct sctp_prim);
-
-	ret = kernel_getsockopt(newsock, IPPROTO_SCTP, SCTP_PRIMARY_ADDR,
-				(char *)&prim, &prim_len);
+	ret = sctp_sock_get_primary_addr(con->sock->sk, &prim);
 	if (ret < 0) {
 		log_print("getsockopt/sctp_primary_addr failed: %d", ret);
 		goto accept_err;
diff --git a/include/net/sctp/sctp.h b/include/net/sctp/sctp.h
index b505fa082f254..c98b1d14db853 100644
--- a/include/net/sctp/sctp.h
+++ b/include/net/sctp/sctp.h
@@ -618,5 +618,6 @@ static inline bool sctp_newsk_ready(const struct sock *sk)
 int sctp_setsockopt_bindx(struct sock *sk, struct sockaddr *kaddrs,
 		int addrs_size, int op);
 void sctp_sock_set_nodelay(struct sock *sk, bool val);
+int sctp_sock_get_primary_addr(struct sock *sk, struct sctp_prim *prim);
 
 #endif /* __net_sctp_h__ */
diff --git a/net/sctp/socket.c b/net/sctp/socket.c
index 64c395f7a86d5..39bf8090dbe1e 100644
--- a/net/sctp/socket.c
+++ b/net/sctp/socket.c
@@ -6411,6 +6411,35 @@ static int sctp_getsockopt_local_addrs(struct sock *sk, int len,
 	return err;
 }
 
+static int __sctp_sock_get_primary_addr(struct sock *sk, struct sctp_prim *prim)
+{
+	struct sctp_association *asoc;
+
+	asoc = sctp_id2assoc(sk, prim->ssp_assoc_id);
+	if (!asoc)
+		return -EINVAL;
+	if (!asoc->peer.primary_path)
+		return -ENOTCONN;
+
+	memcpy(&prim->ssp_addr, &asoc->peer.primary_path->ipaddr,
+		asoc->peer.primary_path->af_specific->sockaddr_len);
+
+	sctp_get_pf_specific(sk->sk_family)->addr_to_user(sctp_sk(sk),
+			(union sctp_addr *)&prim->ssp_addr);
+	return 0;
+}
+
+int sctp_sock_get_primary_addr(struct sock *sk, struct sctp_prim *prim)
+{
+	int ret;
+
+	lock_sock(sk);
+	ret = __sctp_sock_get_primary_addr(sk, prim);
+	release_sock(sk);
+	return ret;
+}
+EXPORT_SYMBOL(sctp_sock_get_primary_addr);
+
 /* 7.1.10 Set Primary Address (SCTP_PRIMARY_ADDR)
  *
  * Requests that the local SCTP stack use the enclosed peer address as
@@ -6421,35 +6450,19 @@ static int sctp_getsockopt_primary_addr(struct sock *sk, int len,
 					char __user *optval, int __user *optlen)
 {
 	struct sctp_prim prim;
-	struct sctp_association *asoc;
-	struct sctp_sock *sp = sctp_sk(sk);
+	int ret;
 
 	if (len < sizeof(struct sctp_prim))
 		return -EINVAL;
-
-	len = sizeof(struct sctp_prim);
-
-	if (copy_from_user(&prim, optval, len))
+	if (copy_from_user(&prim, optval, sizeof(struct sctp_prim)))
 		return -EFAULT;
 
-	asoc = sctp_id2assoc(sk, prim.ssp_assoc_id);
-	if (!asoc)
-		return -EINVAL;
-
-	if (!asoc->peer.primary_path)
-		return -ENOTCONN;
-
-	memcpy(&prim.ssp_addr, &asoc->peer.primary_path->ipaddr,
-		asoc->peer.primary_path->af_specific->sockaddr_len);
-
-	sctp_get_pf_specific(sk->sk_family)->addr_to_user(sp,
-			(union sctp_addr *)&prim.ssp_addr);
+	ret = __sctp_sock_get_primary_addr(sk, &prim);
+	if (ret)
+		return ret;
 
-	if (put_user(len, optlen))
+	if (put_user(len, optlen) || copy_to_user(optval, &prim, len))
 		return -EFAULT;
-	if (copy_to_user(optval, &prim, len))
-		return -EFAULT;
-
 	return 0;
 }
 
-- 
2.26.2

