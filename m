Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6B75D1DBF59
	for <lists+cluster-devel@lfdr.de>; Wed, 20 May 2020 21:59:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590004780;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Wd08dyMU5IfAW7gVOq/7rRtlHhJfaMVGF9qWpfUzCOA=;
	b=gX6W3rqfggiR3EFB27tDlCfbHsYKMQkklfPK2CJ1RVTzpsINA4wxbUsBvNdx7TjytxU10q
	wdZPvtIxRQ6K0we5MIjB0Mkk+LFaqXgV5F74v0OlWhf7qzFEwNLQgLTGq+x7FAZ8Z0QayF
	VjyxjKuz4RPj6ArVOnCvJly7wxEj2hM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-jWZAG8MfMkyYiXmj8yDLCg-1; Wed, 20 May 2020 15:59:38 -0400
X-MC-Unique: jWZAG8MfMkyYiXmj8yDLCg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D161FA0BE6;
	Wed, 20 May 2020 19:59:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F60760C05;
	Wed, 20 May 2020 19:59:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4B33A54D04;
	Wed, 20 May 2020 19:59:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04KJvrPT030208 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 20 May 2020 15:57:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 56A402026DFD; Wed, 20 May 2020 19:57:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 52E782026D69
	for <cluster-devel@redhat.com>; Wed, 20 May 2020 19:57:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2913A8007CB
	for <cluster-devel@redhat.com>; Wed, 20 May 2020 19:57:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-125-qh86hIvyOHWr1C0oqc83nw-1; Wed, 20 May 2020 15:57:48 -0400
X-MC-Unique: qh86hIvyOHWr1C0oqc83nw-1
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbUo6-0001oR-32; Wed, 20 May 2020 19:55:14 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Wed, 20 May 2020 21:54:37 +0200
Message-Id: <20200520195509.2215098-2-hch@lst.de>
In-Reply-To: <20200520195509.2215098-1-hch@lst.de>
References: <20200520195509.2215098-1-hch@lst.de>
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
	drbd-dev@tron.linbit.com, ceph-devel@vger.kernel.org,
	linux-nfs@vger.kernel.org, Neil Horman <nhorman@tuxdriver.com>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	netdev@vger.kernel.org, Vlad Yasevich <vyasevich@gmail.com>,
	linux-kernel@vger.kernel.org, Jon Maloy <jmaloy@redhat.com>,
	Ying Xue <ying.xue@windriver.com>, ocfs2-devel@oss.oracle.com
Subject: [Cluster-devel] [PATCH 01/33] dlm: use the tcp version of
	accept_from_sock for sctp as well
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

The only difference between a few missing fixes applied to the SCTP
one is that TCP uses ->getpeername to get the remote address, while
SCTP uses kernel_getsockopt(.. SCTP_PRIMARY_ADDR).  But given that
getpeername is defined to return the primary address for sctp, there
doesn't seem to be any reason for the different way of quering the
peername, or all the code duplication.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/dlm/lowcomms.c | 123 ++--------------------------------------------
 1 file changed, 3 insertions(+), 120 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index cdfaf4f0e11a0..f13dad0fd9ef3 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -724,7 +724,7 @@ static int receive_from_sock(struct connection *con)
 }
 
 /* Listening socket is busy, accept a connection */
-static int tcp_accept_from_sock(struct connection *con)
+static int accept_from_sock(struct connection *con)
 {
 	int result;
 	struct sockaddr_storage peeraddr;
@@ -852,123 +852,6 @@ static int tcp_accept_from_sock(struct connection *con)
 	return result;
 }
 
-static int sctp_accept_from_sock(struct connection *con)
-{
-	/* Check that the new node is in the lockspace */
-	struct sctp_prim prim;
-	int nodeid;
-	int prim_len, ret;
-	int addr_len;
-	struct connection *newcon;
-	struct connection *addcon;
-	struct socket *newsock;
-
-	mutex_lock(&connections_lock);
-	if (!dlm_allow_conn) {
-		mutex_unlock(&connections_lock);
-		return -1;
-	}
-	mutex_unlock(&connections_lock);
-
-	mutex_lock_nested(&con->sock_mutex, 0);
-
-	ret = kernel_accept(con->sock, &newsock, O_NONBLOCK);
-	if (ret < 0)
-		goto accept_err;
-
-	memset(&prim, 0, sizeof(struct sctp_prim));
-	prim_len = sizeof(struct sctp_prim);
-
-	ret = kernel_getsockopt(newsock, IPPROTO_SCTP, SCTP_PRIMARY_ADDR,
-				(char *)&prim, &prim_len);
-	if (ret < 0) {
-		log_print("getsockopt/sctp_primary_addr failed: %d", ret);
-		goto accept_err;
-	}
-
-	make_sockaddr(&prim.ssp_addr, 0, &addr_len);
-	ret = addr_to_nodeid(&prim.ssp_addr, &nodeid);
-	if (ret) {
-		unsigned char *b = (unsigned char *)&prim.ssp_addr;
-
-		log_print("reject connect from unknown addr");
-		print_hex_dump_bytes("ss: ", DUMP_PREFIX_NONE,
-				     b, sizeof(struct sockaddr_storage));
-		goto accept_err;
-	}
-
-	newcon = nodeid2con(nodeid, GFP_NOFS);
-	if (!newcon) {
-		ret = -ENOMEM;
-		goto accept_err;
-	}
-
-	mutex_lock_nested(&newcon->sock_mutex, 1);
-
-	if (newcon->sock) {
-		struct connection *othercon = newcon->othercon;
-
-		if (!othercon) {
-			othercon = kmem_cache_zalloc(con_cache, GFP_NOFS);
-			if (!othercon) {
-				log_print("failed to allocate incoming socket");
-				mutex_unlock(&newcon->sock_mutex);
-				ret = -ENOMEM;
-				goto accept_err;
-			}
-			othercon->nodeid = nodeid;
-			othercon->rx_action = receive_from_sock;
-			mutex_init(&othercon->sock_mutex);
-			INIT_LIST_HEAD(&othercon->writequeue);
-			spin_lock_init(&othercon->writequeue_lock);
-			INIT_WORK(&othercon->swork, process_send_sockets);
-			INIT_WORK(&othercon->rwork, process_recv_sockets);
-			set_bit(CF_IS_OTHERCON, &othercon->flags);
-		}
-		mutex_lock_nested(&othercon->sock_mutex, 2);
-		if (!othercon->sock) {
-			newcon->othercon = othercon;
-			add_sock(newsock, othercon);
-			addcon = othercon;
-			mutex_unlock(&othercon->sock_mutex);
-		} else {
-			printk("Extra connection from node %d attempted\n", nodeid);
-			ret = -EAGAIN;
-			mutex_unlock(&othercon->sock_mutex);
-			mutex_unlock(&newcon->sock_mutex);
-			goto accept_err;
-		}
-	} else {
-		newcon->rx_action = receive_from_sock;
-		add_sock(newsock, newcon);
-		addcon = newcon;
-	}
-
-	log_print("connected to %d", nodeid);
-
-	mutex_unlock(&newcon->sock_mutex);
-
-	/*
-	 * Add it to the active queue in case we got data
-	 * between processing the accept adding the socket
-	 * to the read_sockets list
-	 */
-	if (!test_and_set_bit(CF_READ_PENDING, &addcon->flags))
-		queue_work(recv_workqueue, &addcon->rwork);
-	mutex_unlock(&con->sock_mutex);
-
-	return 0;
-
-accept_err:
-	mutex_unlock(&con->sock_mutex);
-	if (newsock)
-		sock_release(newsock);
-	if (ret != -EAGAIN)
-		log_print("error accepting connection from node: %d", ret);
-
-	return ret;
-}
-
 static void free_entry(struct writequeue_entry *e)
 {
 	__free_page(e->page);
@@ -1253,7 +1136,7 @@ static struct socket *tcp_create_listen_sock(struct connection *con,
 	write_lock_bh(&sock->sk->sk_callback_lock);
 	sock->sk->sk_user_data = con;
 	save_listen_callbacks(sock);
-	con->rx_action = tcp_accept_from_sock;
+	con->rx_action = accept_from_sock;
 	con->connect_action = tcp_connect_to_sock;
 	write_unlock_bh(&sock->sk->sk_callback_lock);
 
@@ -1340,7 +1223,7 @@ static int sctp_listen_for_all(void)
 	save_listen_callbacks(sock);
 	con->sock = sock;
 	con->sock->sk->sk_data_ready = lowcomms_data_ready;
-	con->rx_action = sctp_accept_from_sock;
+	con->rx_action = accept_from_sock;
 	con->connect_action = sctp_connect_to_sock;
 
 	write_unlock_bh(&sock->sk->sk_callback_lock);
-- 
2.26.2

