Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 3C63D1D0760
	for <lists+cluster-devel@lfdr.de>; Wed, 13 May 2020 08:28:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589351332;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5TSZ8ysmfXzR1IyTmnCaDhVaLMJELOeh31MTPRTaaRg=;
	b=h03i7cgvdOtybmEL9FbS6uab7TBnL84w7KV0EBo5xsXIjhrflTKEC0GdgK2fxpjXuUAS57
	qhoGybKlEr1AtT7c7vqjkSEURdn86jrRUP4FqKVIqW3Opvu68uR9ktKlj/F2fcrINaauoB
	Ucgx/T4gOuBoL4FXQ/90oDG4gpuCzjo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-kXZY8vOcMM6WblkJ7vT2eg-1; Wed, 13 May 2020 02:28:50 -0400
X-MC-Unique: kXZY8vOcMM6WblkJ7vT2eg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C757B18FF661;
	Wed, 13 May 2020 06:28:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B5A84100164D;
	Wed, 13 May 2020 06:28:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A4E4E4CAA0;
	Wed, 13 May 2020 06:28:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04D6SjcP023177 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 13 May 2020 02:28:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8FCFD2166BA3; Wed, 13 May 2020 06:28:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BC7D2166B27
	for <cluster-devel@redhat.com>; Wed, 13 May 2020 06:28:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 729488007C8
	for <cluster-devel@redhat.com>; Wed, 13 May 2020 06:28:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-206-_yflHKRlM0S2JAW1narfRQ-1; Wed, 13 May 2020 02:28:43 -0400
X-MC-Unique: _yflHKRlM0S2JAW1narfRQ-1
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYksI-000522-Iw; Wed, 13 May 2020 06:28:15 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Wed, 13 May 2020 08:26:42 +0200
Message-Id: <20200513062649.2100053-28-hch@lst.de>
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
Subject: [Cluster-devel] [PATCH 27/33] sctp: export sctp_setsockopt_bindx
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

And call it directly from dlm instead of going through kernel_setsockopt.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/dlm/lowcomms.c       | 13 ++++++++-----
 include/net/sctp/sctp.h |  3 +++
 net/sctp/socket.c       |  5 +++--
 3 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index b722a09a7ca05..e4939d770df53 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1005,14 +1005,17 @@ static int sctp_bind_addrs(struct connection *con, uint16_t port)
 		memcpy(&localaddr, dlm_local_addr[i], sizeof(localaddr));
 		make_sockaddr(&localaddr, port, &addr_len);
 
-		if (!i)
+		if (!i) {
 			result = kernel_bind(con->sock,
 					     (struct sockaddr *)&localaddr,
 					     addr_len);
-		else
-			result = kernel_setsockopt(con->sock, SOL_SCTP,
-						   SCTP_SOCKOPT_BINDX_ADD,
-						   (char *)&localaddr, addr_len);
+		} else {
+			lock_sock(con->sock->sk);
+			result = sctp_setsockopt_bindx(con->sock->sk,
+					(struct sockaddr *)&localaddr, addr_len,
+					SCTP_BINDX_ADD_ADDR);
+			release_sock(con->sock->sk);
+		}
 
 		if (result < 0) {
 			log_print("Can't bind to %d addr number %d, %d.\n",
diff --git a/include/net/sctp/sctp.h b/include/net/sctp/sctp.h
index 3ab5c6bbb90bd..f702b14d768ba 100644
--- a/include/net/sctp/sctp.h
+++ b/include/net/sctp/sctp.h
@@ -615,4 +615,7 @@ static inline bool sctp_newsk_ready(const struct sock *sk)
 	return sock_flag(sk, SOCK_DEAD) || sk->sk_socket;
 }
 
+int sctp_setsockopt_bindx(struct sock *sk, struct sockaddr *kaddrs,
+		int addrs_size, int op);
+
 #endif /* __net_sctp_h__ */
diff --git a/net/sctp/socket.c b/net/sctp/socket.c
index 1c96b52c4aa28..30c981d9f6158 100644
--- a/net/sctp/socket.c
+++ b/net/sctp/socket.c
@@ -979,8 +979,8 @@ int sctp_asconf_mgmt(struct sctp_sock *sp, struct sctp_sockaddr_entry *addrw)
  *
  * Returns 0 if ok, <0 errno code on error.
  */
-static int sctp_setsockopt_bindx(struct sock *sk, struct sockaddr *kaddrs,
-				 int addrs_size, int op)
+int sctp_setsockopt_bindx(struct sock *sk, struct sockaddr *kaddrs,
+		int addrs_size, int op)
 {
 	int err;
 	int addrcnt = 0;
@@ -1032,6 +1032,7 @@ static int sctp_setsockopt_bindx(struct sock *sk, struct sockaddr *kaddrs,
 		return -EINVAL;
 	}
 }
+EXPORT_SYMBOL(sctp_setsockopt_bindx);
 
 static int sctp_connect_new_asoc(struct sctp_endpoint *ep,
 				 const union sctp_addr *daddr,
-- 
2.26.2

