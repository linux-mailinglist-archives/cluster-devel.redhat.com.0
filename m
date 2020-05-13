Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id C48961D075F
	for <lists+cluster-devel@lfdr.de>; Wed, 13 May 2020 08:28:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589351331;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RT06EoGrVrHQTvP6klOVHjd2ts3cATgXnJrV7ayJulk=;
	b=DvAxXEbtxS0FHV2Ymn8F44WlyIMhrt+phKVB4Np5AC7/mCfKywL0pvZzj/qusRbjQGgHVk
	aWdn8M8QPiLGLXZh2sdH10j8O8V57BnPcSRMtvN6goL5tVi0sFlTo28DfDKHK5wj81SV5A
	V684i1u7XgXSSEM8ABu5nvQQAzpvLeA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-jQ5a_ndeOWerNlxGPCkxXQ-1; Wed, 13 May 2020 02:28:49 -0400
X-MC-Unique: jQ5a_ndeOWerNlxGPCkxXQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9479F107ACCA;
	Wed, 13 May 2020 06:28:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 836D92E16E;
	Wed, 13 May 2020 06:28:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6EDD11809542;
	Wed, 13 May 2020 06:28:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04D6SjXp023176 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 13 May 2020 02:28:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 862D22166BA0; Wed, 13 May 2020 06:28:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8236A2166B27
	for <cluster-devel@redhat.com>; Wed, 13 May 2020 06:28:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 68B6A916101
	for <cluster-devel@redhat.com>; Wed, 13 May 2020 06:28:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-418-t2dOT0giOoqBaqxNwoUs1w-1; Wed, 13 May 2020 02:28:42 -0400
X-MC-Unique: t2dOT0giOoqBaqxNwoUs1w-1
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYksF-0004z4-Gi; Wed, 13 May 2020 06:28:11 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Wed, 13 May 2020 08:26:41 +0200
Message-Id: <20200513062649.2100053-27-hch@lst.de>
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
Subject: [Cluster-devel] [PATCH 26/33] sctp: lift copying in addrs into
	sctp_setsockopt
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

Prepare for additional kernel-space callers of sctp_setsockopt_bindx.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 net/sctp/socket.c | 71 ++++++++++++++++++-----------------------------
 1 file changed, 27 insertions(+), 44 deletions(-)

diff --git a/net/sctp/socket.c b/net/sctp/socket.c
index 827a9903ee288..1c96b52c4aa28 100644
--- a/net/sctp/socket.c
+++ b/net/sctp/socket.c
@@ -972,18 +972,16 @@ int sctp_asconf_mgmt(struct sctp_sock *sp, struct sctp_sockaddr_entry *addrw)
  * it.
  *
  * sk        The sk of the socket
- * addrs     The pointer to the addresses in user land
+ * addrs     The pointer to the addresses
  * addrssize Size of the addrs buffer
  * op        Operation to perform (add or remove, see the flags of
  *           sctp_bindx)
  *
  * Returns 0 if ok, <0 errno code on error.
  */
-static int sctp_setsockopt_bindx(struct sock *sk,
-				 struct sockaddr __user *addrs,
+static int sctp_setsockopt_bindx(struct sock *sk, struct sockaddr *kaddrs,
 				 int addrs_size, int op)
 {
-	struct sockaddr *kaddrs;
 	int err;
 	int addrcnt = 0;
 	int walk_size = 0;
@@ -991,23 +989,13 @@ static int sctp_setsockopt_bindx(struct sock *sk,
 	void *addr_buf;
 	struct sctp_af *af;
 
-	pr_debug("%s: sk:%p addrs:%p addrs_size:%d opt:%d\n",
-		 __func__, sk, addrs, addrs_size, op);
-
-	if (unlikely(addrs_size <= 0))
-		return -EINVAL;
+	pr_debug("%s: sk:%p kaddrs:%p addrs_size:%d opt:%d\n",
+		 __func__, sk, kaddrs, addrs_size, op);
 
-	kaddrs = memdup_user(addrs, addrs_size);
-	if (IS_ERR(kaddrs))
-		return PTR_ERR(kaddrs);
-
-	/* Walk through the addrs buffer and count the number of addresses. */
 	addr_buf = kaddrs;
 	while (walk_size < addrs_size) {
-		if (walk_size + sizeof(sa_family_t) > addrs_size) {
-			kfree(kaddrs);
+		if (walk_size + sizeof(sa_family_t) > addrs_size)
 			return -EINVAL;
-		}
 
 		sa_addr = addr_buf;
 		af = sctp_get_af_specific(sa_addr->sa_family);
@@ -1015,10 +1003,8 @@ static int sctp_setsockopt_bindx(struct sock *sk,
 		/* If the address family is not supported or if this address
 		 * causes the address buffer to overflow return EINVAL.
 		 */
-		if (!af || (walk_size + af->sockaddr_len) > addrs_size) {
-			kfree(kaddrs);
+		if (!af || (walk_size + af->sockaddr_len) > addrs_size)
 			return -EINVAL;
-		}
 		addrcnt++;
 		addr_buf += af->sockaddr_len;
 		walk_size += af->sockaddr_len;
@@ -1032,29 +1018,19 @@ static int sctp_setsockopt_bindx(struct sock *sk,
 						 (struct sockaddr *)kaddrs,
 						 addrs_size);
 		if (err)
-			goto out;
+			return err;
 		err = sctp_bindx_add(sk, kaddrs, addrcnt);
 		if (err)
-			goto out;
-		err = sctp_send_asconf_add_ip(sk, kaddrs, addrcnt);
-		break;
-
+			return err;
+		return sctp_send_asconf_add_ip(sk, kaddrs, addrcnt);
 	case SCTP_BINDX_REM_ADDR:
 		err = sctp_bindx_rem(sk, kaddrs, addrcnt);
 		if (err)
-			goto out;
-		err = sctp_send_asconf_del_ip(sk, kaddrs, addrcnt);
-		break;
-
+			return err;
+		return sctp_send_asconf_del_ip(sk, kaddrs, addrcnt);
 	default:
-		err = -EINVAL;
-		break;
+		return -EINVAL;
 	}
-
-out:
-	kfree(kaddrs);
-
-	return err;
 }
 
 static int sctp_connect_new_asoc(struct sctp_endpoint *ep,
@@ -4670,6 +4646,7 @@ static int sctp_setsockopt_pf_expose(struct sock *sk,
 static int sctp_setsockopt(struct sock *sk, int level, int optname,
 			   char __user *optval, unsigned int optlen)
 {
+	struct sockaddr *kaddrs;
 	int retval = 0;
 
 	pr_debug("%s: sk:%p, optname:%d\n", __func__, sk, optname);
@@ -4682,30 +4659,37 @@ static int sctp_setsockopt(struct sock *sk, int level, int optname,
 	 */
 	if (level != SOL_SCTP) {
 		struct sctp_af *af = sctp_sk(sk)->pf->af;
-		retval = af->setsockopt(sk, level, optname, optval, optlen);
-		goto out_nounlock;
+		return af->setsockopt(sk, level, optname, optval, optlen);
 	}
 
+	if (unlikely(optlen <= 0))
+		return -EINVAL;
+
+	kaddrs = memdup_user(optval, optlen);
+	if (IS_ERR(kaddrs))
+		return PTR_ERR(kaddrs);
+
+	/* Walk through the addrs buffer and count the number of addresses. */
+
 	lock_sock(sk);
 
 	switch (optname) {
 	case SCTP_SOCKOPT_BINDX_ADD:
 		/* 'optlen' is the size of the addresses buffer. */
-		retval = sctp_setsockopt_bindx(sk, (struct sockaddr __user *)optval,
+		retval = sctp_setsockopt_bindx(sk, (struct sockaddr *)optval,
 					       optlen, SCTP_BINDX_ADD_ADDR);
 		break;
 
 	case SCTP_SOCKOPT_BINDX_REM:
 		/* 'optlen' is the size of the addresses buffer. */
-		retval = sctp_setsockopt_bindx(sk, (struct sockaddr __user *)optval,
+		retval = sctp_setsockopt_bindx(sk, (struct sockaddr *)optval,
 					       optlen, SCTP_BINDX_REM_ADDR);
 		break;
 
 	case SCTP_SOCKOPT_CONNECTX_OLD:
 		/* 'optlen' is the size of the addresses buffer. */
 		retval = sctp_setsockopt_connectx_old(sk,
-					    (struct sockaddr __user *)optval,
-					    optlen);
+					    (struct sockaddr *)optval, optlen);
 		break;
 
 	case SCTP_SOCKOPT_CONNECTX:
@@ -4871,8 +4855,7 @@ static int sctp_setsockopt(struct sock *sk, int level, int optname,
 	}
 
 	release_sock(sk);
-
-out_nounlock:
+	kfree(kaddrs);
 	return retval;
 }
 
-- 
2.26.2

