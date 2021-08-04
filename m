Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id B2E3D3DFFAE
	for <lists+cluster-devel@lfdr.de>; Wed,  4 Aug 2021 12:53:34 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-XwsfFhj8McWH0CSulZZcKg-1; Wed, 04 Aug 2021 06:53:32 -0400
X-MC-Unique: XwsfFhj8McWH0CSulZZcKg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F26EB802B72;
	Wed,  4 Aug 2021 10:53:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DFA525F724;
	Wed,  4 Aug 2021 10:53:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C97594BB7B;
	Wed,  4 Aug 2021 10:53:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1743ZM7T030533 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 3 Aug 2021 23:35:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9866821241F6; Wed,  4 Aug 2021 03:35:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9396E21241F5
	for <cluster-devel@redhat.com>; Wed,  4 Aug 2021 03:35:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFEDD800882
	for <cluster-devel@redhat.com>; Wed,  4 Aug 2021 03:35:18 +0000 (UTC)
Received: from out0.migadu.com (out0.migadu.com [94.23.1.103]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-349-UK-dRKABP9iNNRDzzVvsFw-1;
	Tue, 03 Aug 2021 23:35:17 -0400
X-MC-Unique: UK-dRKABP9iNNRDzzVvsFw-1
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
	include these headers.
From: Yajun Deng <yajun.deng@linux.dev>
To: davem@davemloft.net, kuba@kernel.org, mathew.j.martineau@linux.intel.com, 
	matthieu.baerts@tessares.net, trond.myklebust@hammerspace.com,
	anna.schumaker@netapp.com
Date: Wed,  4 Aug 2021 11:28:56 +0800
Message-Id: <20210804032856.4005-1-yajun.deng@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: yajun.deng@linux.dev
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1743ZM7T030533
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Wed, 04 Aug 2021 06:50:56 -0400
Cc: linux-s390@vger.kernel.org, rds-devel@oss.oracle.com,
	linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, cluster-devel@redhat.com,
	Yajun Deng <yajun.deng@linux.dev>, linux-nfs@vger.kernel.org,
	bpf@vger.kernel.org, mptcp@lists.linux.dev
Subject: [Cluster-devel] [PATCH net-next v2] net: Modify
	sock_set_keepalive() for more scenarios
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 8bit

Add 2nd parameter in sock_set_keepalive(), let the caller decide
whether to set. This can be applied to more scenarios.

v2:
 - add the change in fs/dlm.

Signed-off-by: Yajun Deng <yajun.deng@linux.dev>
---
 fs/dlm/lowcomms.c     |  2 +-
 include/net/sock.h    |  2 +-
 net/core/filter.c     |  4 +---
 net/core/sock.c       | 10 ++++------
 net/mptcp/sockopt.c   |  4 +---
 net/rds/tcp_listen.c  |  2 +-
 net/smc/af_smc.c      |  2 +-
 net/sunrpc/xprtsock.c |  2 +-
 8 files changed, 11 insertions(+), 17 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 0ea9ae35da0b..5d748ce4d876 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1356,7 +1356,7 @@ static int tcp_create_listen_sock(struct listen_connection *con,
 		log_print("Can't bind to port %d", dlm_config.ci_tcp_port);
 		goto create_out;
 	}
-	sock_set_keepalive(sock->sk);
+	sock_set_keepalive(sock->sk, true);
 
 	result = sock->ops->listen(sock, 5);
 	if (result < 0) {
diff --git a/include/net/sock.h b/include/net/sock.h
index ff1be7e7e90b..0aae26159549 100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -2772,7 +2772,7 @@ int sock_set_timestamping(struct sock *sk, int optname,
 
 void sock_enable_timestamps(struct sock *sk);
 void sock_no_linger(struct sock *sk);
-void sock_set_keepalive(struct sock *sk);
+void sock_set_keepalive(struct sock *sk, bool valbool);
 void sock_set_priority(struct sock *sk, u32 priority);
 void sock_set_rcvbuf(struct sock *sk, int val);
 void sock_set_mark(struct sock *sk, u32 val);
diff --git a/net/core/filter.c b/net/core/filter.c
index 6f493ef5bb14..c73caa53992e 100644
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@ -4752,9 +4752,7 @@ static int _bpf_setsockopt(struct sock *sk, int level, int optname,
 			ret = sock_bindtoindex(sk, ifindex, false);
 			break;
 		case SO_KEEPALIVE:
-			if (sk->sk_prot->keepalive)
-				sk->sk_prot->keepalive(sk, valbool);
-			sock_valbool_flag(sk, SOCK_KEEPOPEN, valbool);
+			sock_set_keepalive(sk, !!valbool);
 			break;
 		case SO_REUSEPORT:
 			sk->sk_reuseport = valbool;
diff --git a/net/core/sock.c b/net/core/sock.c
index 9671c32e6ef5..7041e6355ae1 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -892,12 +892,12 @@ int sock_set_timestamping(struct sock *sk, int optname,
 	return 0;
 }
 
-void sock_set_keepalive(struct sock *sk)
+void sock_set_keepalive(struct sock *sk, bool valbool)
 {
 	lock_sock(sk);
 	if (sk->sk_prot->keepalive)
-		sk->sk_prot->keepalive(sk, true);
-	sock_valbool_flag(sk, SOCK_KEEPOPEN, true);
+		sk->sk_prot->keepalive(sk, valbool);
+	sock_valbool_flag(sk, SOCK_KEEPOPEN, valbool);
 	release_sock(sk);
 }
 EXPORT_SYMBOL(sock_set_keepalive);
@@ -1060,9 +1060,7 @@ int sock_setsockopt(struct socket *sock, int level, int optname,
 		break;
 
 	case SO_KEEPALIVE:
-		if (sk->sk_prot->keepalive)
-			sk->sk_prot->keepalive(sk, valbool);
-		sock_valbool_flag(sk, SOCK_KEEPOPEN, valbool);
+		sock_set_keepalive(sk, !!valbool);
 		break;
 
 	case SO_OOBINLINE:
diff --git a/net/mptcp/sockopt.c b/net/mptcp/sockopt.c
index 8c03afac5ca0..879b8381055c 100644
--- a/net/mptcp/sockopt.c
+++ b/net/mptcp/sockopt.c
@@ -81,9 +81,7 @@ static void mptcp_sol_socket_sync_intval(struct mptcp_sock *msk, int optname, in
 			sock_valbool_flag(ssk, SOCK_DBG, !!val);
 			break;
 		case SO_KEEPALIVE:
-			if (ssk->sk_prot->keepalive)
-				ssk->sk_prot->keepalive(ssk, !!val);
-			sock_valbool_flag(ssk, SOCK_KEEPOPEN, !!val);
+			sock_set_keepalive(ssk, !!val);
 			break;
 		case SO_PRIORITY:
 			ssk->sk_priority = val;
diff --git a/net/rds/tcp_listen.c b/net/rds/tcp_listen.c
index 09cadd556d1e..b69ebb3f424a 100644
--- a/net/rds/tcp_listen.c
+++ b/net/rds/tcp_listen.c
@@ -44,7 +44,7 @@ void rds_tcp_keepalive(struct socket *sock)
 	int keepidle = 5; /* send a probe 'keepidle' secs after last data */
 	int keepcnt = 5; /* number of unack'ed probes before declaring dead */
 
-	sock_set_keepalive(sock->sk);
+	sock_set_keepalive(sock->sk, true);
 	tcp_sock_set_keepcnt(sock->sk, keepcnt);
 	tcp_sock_set_keepidle(sock->sk, keepidle);
 	/* KEEPINTVL is the interval between successive probes. We follow
diff --git a/net/smc/af_smc.c b/net/smc/af_smc.c
index 898389611ae8..ad8f4302037f 100644
--- a/net/smc/af_smc.c
+++ b/net/smc/af_smc.c
@@ -68,7 +68,7 @@ static void smc_set_keepalive(struct sock *sk, int val)
 {
 	struct smc_sock *smc = smc_sk(sk);
 
-	smc->clcsock->sk->sk_prot->keepalive(smc->clcsock->sk, val);
+	sock_set_keepalive(smc->clcsock->sk, !!val);
 }
 
 static struct smc_hashinfo smc_v4_hashinfo = {
diff --git a/net/sunrpc/xprtsock.c b/net/sunrpc/xprtsock.c
index e573dcecdd66..306a332f8d28 100644
--- a/net/sunrpc/xprtsock.c
+++ b/net/sunrpc/xprtsock.c
@@ -2127,7 +2127,7 @@ static void xs_tcp_set_socket_timeouts(struct rpc_xprt *xprt,
 	spin_unlock(&xprt->transport_lock);
 
 	/* TCP Keepalive options */
-	sock_set_keepalive(sock->sk);
+	sock_set_keepalive(sock->sk, true);
 	tcp_sock_set_keepidle(sock->sk, keepidle);
 	tcp_sock_set_keepintvl(sock->sk, keepidle);
 	tcp_sock_set_keepcnt(sock->sk, keepcnt);
-- 
2.32.0


