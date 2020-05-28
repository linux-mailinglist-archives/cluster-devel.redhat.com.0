Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id BCCAF1E56E2
	for <lists+cluster-devel@lfdr.de>; Thu, 28 May 2020 07:42:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590644553;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4NVYDD9dVtr0WtQxy7SjHzDrfj1IJPmnztjpKvUnyfA=;
	b=TH/wZlyumw8YY/3kWODlG+GKD+chpT5+JjLT8aH84U8l8BNu0/yw3GFzjvwFIC+OQk2sm3
	l2X3FASMRFoHa3v2BV7R86jXb8JfBH5h6ug5Edni9RtFJgAHAWeejyEtVhGDAoX2JzutmN
	Gdv6bfencH/Nf/Uyv8FHXKmOscdKjAk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-IsK8SzNmO-K9DM0GUzHYRA-1; Thu, 28 May 2020 01:42:31 -0400
X-MC-Unique: IsK8SzNmO-K9DM0GUzHYRA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 780AB107ACCD;
	Thu, 28 May 2020 05:42:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 693825C1C5;
	Thu, 28 May 2020 05:42:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 569F66B4E4;
	Thu, 28 May 2020 05:42:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04S5gR1e008320 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 28 May 2020 01:42:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6A94ADBB11; Thu, 28 May 2020 05:42:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 48936DBB16
	for <cluster-devel@redhat.com>; Thu, 28 May 2020 05:42:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7622101A526
	for <cluster-devel@redhat.com>; Thu, 28 May 2020 05:42:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-463-F6Xk-27LNQuHA39UwsamIw-1; Thu, 28 May 2020 01:42:20 -0400
X-MC-Unique: F6Xk-27LNQuHA39UwsamIw-1
Received: from p4fdb1ad2.dip0.t-ipconnect.de ([79.219.26.210] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat
	Linux)) id 1jeAr2-0001xI-Hi; Thu, 28 May 2020 05:13:21 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Thu, 28 May 2020 07:12:20 +0200
Message-Id: <20200528051236.620353-13-hch@lst.de>
In-Reply-To: <20200528051236.620353-1-hch@lst.de>
References: <20200528051236.620353-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
	cluster-devel@redhat.com, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org, Jon Maloy <jmaloy@redhat.com>,
	Ying Xue <ying.xue@windriver.com>,
	Eric Dumazet <edumazet@google.com>, target-devel@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net, linux-nfs@vger.kernel.org,
	drbd-dev@tron.linbit.com, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
	ceph-devel@vger.kernel.org, linux-afs@lists.infradead.org,
	ocfs2-devel@oss.oracle.com, linux-rdma@vger.kernel.org
Subject: [Cluster-devel] [PATCH 12/28] tcp: add tcp_sock_set_quickack
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Add a helper to directly set the TCP_QUICKACK sockopt from kernel space
without going through a fake uaccess.  Cleanup the callers to avoid
pointless wrappers now that this is a simple function call.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/drbd/drbd_int.h      |  7 ------
 drivers/block/drbd/drbd_receiver.c |  5 ++--
 include/linux/tcp.h                |  1 +
 net/ipv4/tcp.c                     | 39 ++++++++++++++++++++----------
 4 files changed, 29 insertions(+), 23 deletions(-)

diff --git a/drivers/block/drbd/drbd_int.h b/drivers/block/drbd/drbd_int.h
index e24bba87c8e02..14345a87c7cc5 100644
--- a/drivers/block/drbd/drbd_int.h
+++ b/drivers/block/drbd/drbd_int.h
@@ -1570,13 +1570,6 @@ extern void drbd_set_recv_tcq(struct drbd_device *device, int tcq_enabled);
 extern void _drbd_clear_done_ee(struct drbd_device *device, struct list_head *to_be_freed);
 extern int drbd_connected(struct drbd_peer_device *);
 
-static inline void drbd_tcp_quickack(struct socket *sock)
-{
-	int val = 2;
-	(void) kernel_setsockopt(sock, SOL_TCP, TCP_QUICKACK,
-			(char*)&val, sizeof(val));
-}
-
 /* sets the number of 512 byte sectors of our virtual device */
 void drbd_set_my_capacity(struct drbd_device *device, sector_t size);
 
diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 20a5e94494acd..3a3f2b6a821f3 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -1223,7 +1223,7 @@ static int drbd_recv_header_maybe_unplug(struct drbd_connection *connection, str
 		 * quickly as possible, and let remote TCP know what we have
 		 * received so far. */
 		if (err == -EAGAIN) {
-			drbd_tcp_quickack(connection->data.socket);
+			tcp_sock_set_quickack(connection->data.socket->sk, 2);
 			drbd_unplug_all_devices(connection);
 		}
 		if (err > 0) {
@@ -4959,8 +4959,7 @@ static int receive_UnplugRemote(struct drbd_connection *connection, struct packe
 {
 	/* Make sure we've acked all the TCP data associated
 	 * with the data requests being unplugged */
-	drbd_tcp_quickack(connection->data.socket);
-
+	tcp_sock_set_quickack(connection->data.socket->sk, 2);
 	return 0;
 }
 
diff --git a/include/linux/tcp.h b/include/linux/tcp.h
index 9e42c7fe50a8b..2eaf8320b9db0 100644
--- a/include/linux/tcp.h
+++ b/include/linux/tcp.h
@@ -499,5 +499,6 @@ int tcp_skb_shift(struct sk_buff *to, struct sk_buff *from, int pcount,
 
 void tcp_sock_set_cork(struct sock *sk, bool on);
 void tcp_sock_set_nodelay(struct sock *sk);
+void tcp_sock_set_quickack(struct sock *sk, int val);
 
 #endif	/* _LINUX_TCP_H */
diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index a65f293a19fac..27b5e7a4e2ef9 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -2856,6 +2856,31 @@ void tcp_sock_set_nodelay(struct sock *sk)
 }
 EXPORT_SYMBOL(tcp_sock_set_nodelay);
 
+static void __tcp_sock_set_quickack(struct sock *sk, int val)
+{
+	if (!val) {
+		inet_csk_enter_pingpong_mode(sk);
+		return;
+	}
+
+	inet_csk_exit_pingpong_mode(sk);
+	if ((1 << sk->sk_state) & (TCPF_ESTABLISHED | TCPF_CLOSE_WAIT) &&
+	    inet_csk_ack_scheduled(sk)) {
+		inet_csk(sk)->icsk_ack.pending |= ICSK_ACK_PUSHED;
+		tcp_cleanup_rbuf(sk, 1);
+		if (!(val & 1))
+			inet_csk_enter_pingpong_mode(sk);
+	}
+}
+
+void tcp_sock_set_quickack(struct sock *sk, int val)
+{
+	lock_sock(sk);
+	__tcp_sock_set_quickack(sk, val);
+	release_sock(sk);
+}
+EXPORT_SYMBOL(tcp_sock_set_quickack);
+
 /*
  *	Socket option code for TCP.
  */
@@ -3096,19 +3121,7 @@ static int do_tcp_setsockopt(struct sock *sk, int level,
 		break;
 
 	case TCP_QUICKACK:
-		if (!val) {
-			inet_csk_enter_pingpong_mode(sk);
-		} else {
-			inet_csk_exit_pingpong_mode(sk);
-			if ((1 << sk->sk_state) &
-			    (TCPF_ESTABLISHED | TCPF_CLOSE_WAIT) &&
-			    inet_csk_ack_scheduled(sk)) {
-				icsk->icsk_ack.pending |= ICSK_ACK_PUSHED;
-				tcp_cleanup_rbuf(sk, 1);
-				if (!(val & 1))
-					inet_csk_enter_pingpong_mode(sk);
-			}
-		}
+		__tcp_sock_set_quickack(sk, val);
 		break;
 
 #ifdef CONFIG_TCP_MD5SIG
-- 
2.26.2

