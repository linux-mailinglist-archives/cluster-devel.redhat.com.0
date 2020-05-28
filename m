Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id A7EA31E569F
	for <lists+cluster-devel@lfdr.de>; Thu, 28 May 2020 07:40:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590644429;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9xOqzrCxNtxuit01AXUXzcEccsdTiA/8eNviWpVQUhs=;
	b=Dbq3TAj/1NaUb0fo/qgPt1qBVY2L7m39+Z0ESaAKV2GUCJ/QtIVsUlvnNPkFT8EH5nP93W
	piPGDPFU6k1Le2CjWwDIHuTpvjSweTOH1wX2m8pWXHgIcgucu/RHAZuzWEXdaM234pGLTa
	UZF5sIfj/e5LOh+5DKvrvbIF3avf3jw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-HF_yhwU8MnqfqfifvLNDug-1; Thu, 28 May 2020 01:40:03 -0400
X-MC-Unique: HF_yhwU8MnqfqfifvLNDug-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21A4A1855A08;
	Thu, 28 May 2020 05:40:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FEC362932;
	Thu, 28 May 2020 05:40:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7DBC36B4E4;
	Thu, 28 May 2020 05:39:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04S5du2j008096 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 28 May 2020 01:39:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5DFC92029F60; Thu, 28 May 2020 05:39:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F7742028CD2
	for <cluster-devel@redhat.com>; Thu, 28 May 2020 05:39:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 299FF101A526
	for <cluster-devel@redhat.com>; Thu, 28 May 2020 05:39:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-378-c6TWYULQMM6OYmlYTqXkkQ-1; Thu, 28 May 2020 01:39:50 -0400
X-MC-Unique: c6TWYULQMM6OYmlYTqXkkQ-1
Received: from p4fdb1ad2.dip0.t-ipconnect.de ([79.219.26.210] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat
	Linux)) id 1jeAqQ-0001QX-Nf; Thu, 28 May 2020 05:12:43 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Thu, 28 May 2020 07:12:09 +0200
Message-Id: <20200528051236.620353-2-hch@lst.de>
In-Reply-To: <20200528051236.620353-1-hch@lst.de>
References: <20200528051236.620353-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
	cluster-devel@redhat.com, Sagi Grimberg <sagi@grimberg.me>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org, Jon Maloy <jmaloy@redhat.com>,
	Ying Xue <ying.xue@windriver.com>,
	Eric Dumazet <edumazet@google.com>, target-devel@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net, linux-nfs@vger.kernel.org,
	drbd-dev@tron.linbit.com, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
	ceph-devel@vger.kernel.org, linux-afs@lists.infradead.org,
	ocfs2-devel@oss.oracle.com, linux-rdma@vger.kernel.org
Subject: [Cluster-devel] [PATCH 01/28] net: add sock_set_reuseaddr
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

Add a helper to directly set the SO_REUSEADDR sockopt from kernel space
without going through a fake uaccess.

For this the iscsi target now has to formally depend on inet to avoid
a mostly theoretical compile failure.  For actual operation it already
did depend on having ipv4 or ipv6 support.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Sagi Grimberg <sagi@grimberg.me>
---
 drivers/infiniband/sw/siw/siw_cm.c        | 18 +++++-------------
 drivers/nvme/target/tcp.c                 |  8 +-------
 drivers/target/iscsi/Kconfig              |  2 +-
 drivers/target/iscsi/iscsi_target_login.c |  9 +--------
 fs/dlm/lowcomms.c                         |  6 +-----
 include/net/sock.h                        |  2 ++
 net/core/sock.c                           |  8 ++++++++
 7 files changed, 19 insertions(+), 34 deletions(-)

diff --git a/drivers/infiniband/sw/siw/siw_cm.c b/drivers/infiniband/sw/siw/siw_cm.c
index 559e5fd3bad8b..d1860f3e87401 100644
--- a/drivers/infiniband/sw/siw/siw_cm.c
+++ b/drivers/infiniband/sw/siw/siw_cm.c
@@ -1312,17 +1312,14 @@ static void siw_cm_llp_state_change(struct sock *sk)
 static int kernel_bindconnect(struct socket *s, struct sockaddr *laddr,
 			      struct sockaddr *raddr)
 {
-	int rv, flags = 0, s_val = 1;
+	int rv, flags = 0;
 	size_t size = laddr->sa_family == AF_INET ?
 		sizeof(struct sockaddr_in) : sizeof(struct sockaddr_in6);
 
 	/*
 	 * Make address available again asap.
 	 */
-	rv = kernel_setsockopt(s, SOL_SOCKET, SO_REUSEADDR, (char *)&s_val,
-			       sizeof(s_val));
-	if (rv < 0)
-		return rv;
+	sock_set_reuseaddr(s->sk);
 
 	rv = s->ops->bind(s, laddr, size);
 	if (rv < 0)
@@ -1781,7 +1778,7 @@ int siw_create_listen(struct iw_cm_id *id, int backlog)
 	struct siw_cep *cep = NULL;
 	struct siw_device *sdev = to_siw_dev(id->device);
 	int addr_family = id->local_addr.ss_family;
-	int rv = 0, s_val;
+	int rv = 0;
 
 	if (addr_family != AF_INET && addr_family != AF_INET6)
 		return -EAFNOSUPPORT;
@@ -1793,13 +1790,8 @@ int siw_create_listen(struct iw_cm_id *id, int backlog)
 	/*
 	 * Allow binding local port when still in TIME_WAIT from last close.
 	 */
-	s_val = 1;
-	rv = kernel_setsockopt(s, SOL_SOCKET, SO_REUSEADDR, (char *)&s_val,
-			       sizeof(s_val));
-	if (rv) {
-		siw_dbg(id->device, "setsockopt error: %d\n", rv);
-		goto error;
-	}
+	sock_set_reuseaddr(s->sk);
+
 	if (addr_family == AF_INET) {
 		struct sockaddr_in *laddr = &to_sockaddr_in(id->local_addr);
 
diff --git a/drivers/nvme/target/tcp.c b/drivers/nvme/target/tcp.c
index f0da04e960f40..40757a63f4553 100644
--- a/drivers/nvme/target/tcp.c
+++ b/drivers/nvme/target/tcp.c
@@ -1632,6 +1632,7 @@ static int nvmet_tcp_add_port(struct nvmet_port *nport)
 	port->sock->sk->sk_user_data = port;
 	port->data_ready = port->sock->sk->sk_data_ready;
 	port->sock->sk->sk_data_ready = nvmet_tcp_listen_data_ready;
+	sock_set_reuseaddr(port->sock->sk);
 
 	opt = 1;
 	ret = kernel_setsockopt(port->sock, IPPROTO_TCP,
@@ -1641,13 +1642,6 @@ static int nvmet_tcp_add_port(struct nvmet_port *nport)
 		goto err_sock;
 	}
 
-	ret = kernel_setsockopt(port->sock, SOL_SOCKET, SO_REUSEADDR,
-			(char *)&opt, sizeof(opt));
-	if (ret) {
-		pr_err("failed to set SO_REUSEADDR sock opt %d\n", ret);
-		goto err_sock;
-	}
-
 	if (so_priority > 0) {
 		ret = kernel_setsockopt(port->sock, SOL_SOCKET, SO_PRIORITY,
 				(char *)&so_priority, sizeof(so_priority));
diff --git a/drivers/target/iscsi/Kconfig b/drivers/target/iscsi/Kconfig
index 1f93ea3813536..922484ea4e304 100644
--- a/drivers/target/iscsi/Kconfig
+++ b/drivers/target/iscsi/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config ISCSI_TARGET
 	tristate "Linux-iSCSI.org iSCSI Target Mode Stack"
-	depends on NET
+	depends on INET
 	select CRYPTO
 	select CRYPTO_CRC32C
 	select CRYPTO_CRC32C_INTEL if X86
diff --git a/drivers/target/iscsi/iscsi_target_login.c b/drivers/target/iscsi/iscsi_target_login.c
index 731ee67fe914b..91acb3f07b4cc 100644
--- a/drivers/target/iscsi/iscsi_target_login.c
+++ b/drivers/target/iscsi/iscsi_target_login.c
@@ -909,14 +909,7 @@ int iscsit_setup_np(
 		}
 	}
 
-	/* FIXME: Someone please explain why this is endian-safe */
-	ret = kernel_setsockopt(sock, SOL_SOCKET, SO_REUSEADDR,
-			(char *)&opt, sizeof(opt));
-	if (ret < 0) {
-		pr_err("kernel_setsockopt() for SO_REUSEADDR"
-			" failed\n");
-		goto fail;
-	}
+	sock_set_reuseaddr(sock->sk);
 
 	ret = kernel_setsockopt(sock, IPPROTO_IP, IP_FREEBIND,
 			(char *)&opt, sizeof(opt));
diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index cdfaf4f0e11a0..b801e77e3e596 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1244,12 +1244,8 @@ static struct socket *tcp_create_listen_sock(struct connection *con,
 	kernel_setsockopt(sock, SOL_TCP, TCP_NODELAY, (char *)&one,
 			  sizeof(one));
 
-	result = kernel_setsockopt(sock, SOL_SOCKET, SO_REUSEADDR,
-				   (char *)&one, sizeof(one));
+	sock_set_reuseaddr(sock->sk);
 
-	if (result < 0) {
-		log_print("Failed to set SO_REUSEADDR on socket: %d", result);
-	}
 	write_lock_bh(&sock->sk->sk_callback_lock);
 	sock->sk->sk_user_data = con;
 	save_listen_callbacks(sock);
diff --git a/include/net/sock.h b/include/net/sock.h
index 3e8c6d4b4b59f..2ec085044790c 100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -2688,4 +2688,6 @@ static inline bool sk_dev_equal_l3scope(struct sock *sk, int dif)
 
 void sock_def_readable(struct sock *sk);
 
+void sock_set_reuseaddr(struct sock *sk);
+
 #endif	/* _SOCK_H */
diff --git a/net/core/sock.c b/net/core/sock.c
index fd85e651ce284..18eb84fdf5fbe 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -712,6 +712,14 @@ bool sk_mc_loop(struct sock *sk)
 }
 EXPORT_SYMBOL(sk_mc_loop);
 
+void sock_set_reuseaddr(struct sock *sk)
+{
+	lock_sock(sk);
+	sk->sk_reuse = SK_CAN_REUSE;
+	release_sock(sk);
+}
+EXPORT_SYMBOL(sock_set_reuseaddr);
+
 /*
  *	This is meant for all protocols to use and covers goings on
  *	at the socket level. Everything here is generic.
-- 
2.26.2

