Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBDD44EF04
	for <lists+cluster-devel@lfdr.de>; Fri, 12 Nov 2021 23:03:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636754613;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nKA0u5sNS8HixSgiMZOAGk3IvM8WYlI2dWyaTucR9lg=;
	b=WC5copARlmR2JLSaVTgwKEgiERzSpx/0PP/1uyRAKnNxtlpm19BKvW9kw18GVvAfHFvwNC
	L1MQsfFsrEDGuP4A5opW9tLMfK0vtuSpjbJw5KxhfP53/txI1P4tpfI0uOaRaWodT/okY5
	2NF9s7W5pNHa58hgaB8BR2SJv8YxglU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-EyhI-52CPeyo4RY8JKgaew-1; Fri, 12 Nov 2021 17:03:30 -0500
X-MC-Unique: EyhI-52CPeyo4RY8JKgaew-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C06D2102CC32;
	Fri, 12 Nov 2021 22:03:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B1CA95DA60;
	Fri, 12 Nov 2021 22:03:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E00851800B9E;
	Fri, 12 Nov 2021 22:03:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1ACM36b3020529 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 12 Nov 2021 17:03:06 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4664E60C17; Fri, 12 Nov 2021 22:03:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2D36260C82;
	Fri, 12 Nov 2021 22:02:46 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 12 Nov 2021 17:02:39 -0500
Message-Id: <20211112220240.1695712-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm-next 1/2] fs: dlm: don't call
	kernel_getpeername() in error_report()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

In some cases kernel_getpeername() will held the socket lock which is
already held when the socket layer calls error_report() callback. Since
commit 9dfc685e0262 ("inet: remove races in inet{6}_getname()") this
problem becomes more likely because the socket lock will be held always.
You will see something like:

bob9-u5 login: [  562.316860] BUG: spinlock recursion on CPU#7, swapper/7/0
[  562.318562]  lock: 0xffff8f2284720088, .magic: dead4ead, .owner: swapper/7/0, .owner_cpu: 7
[  562.319522] CPU: 7 PID: 0 Comm: swapper/7 Not tainted 5.15.0+ #135
[  562.320346] Hardware name: Red Hat KVM/RHEL-AV, BIOS 1.13.0-2.module+el8.3.0+7353+9de0a3cc 04/01/2014
[  562.321277] Call Trace:
[  562.321529]  <IRQ>
[  562.321734]  dump_stack_lvl+0x33/0x42
[  562.322282]  do_raw_spin_lock+0x8b/0xc0
[  562.322674]  lock_sock_nested+0x1e/0x50
[  562.323057]  inet_getname+0x39/0x110
[  562.323425]  ? sock_def_readable+0x80/0x80
[  562.323838]  lowcomms_error_report+0x63/0x260 [dlm]
[  562.324338]  ? wait_for_completion_interruptible_timeout+0xd2/0x120
[  562.324949]  ? lock_timer_base+0x67/0x80
[  562.325330]  ? do_raw_spin_unlock+0x49/0xc0
[  562.325735]  ? _raw_spin_unlock_irqrestore+0x1e/0x40
[  562.326218]  ? del_timer+0x54/0x80
[  562.326549]  sk_error_report+0x12/0x70
[  562.326919]  tcp_validate_incoming+0x3c8/0x530
[  562.327347]  ? kvm_clock_read+0x14/0x30
[  562.327718]  ? ktime_get+0x3b/0xa0
[  562.328055]  tcp_rcv_established+0x121/0x660
[  562.328466]  tcp_v4_do_rcv+0x132/0x260
[  562.328835]  tcp_v4_rcv+0xcea/0xe20
[  562.329173]  ip_protocol_deliver_rcu+0x35/0x1f0
[  562.329615]  ip_local_deliver_finish+0x54/0x60
[  562.330050]  ip_local_deliver+0xf7/0x110
[  562.330431]  ? inet_rtm_getroute+0x211/0x840
[  562.330848]  ? ip_protocol_deliver_rcu+0x1f0/0x1f0
[  562.331310]  ip_rcv+0xe1/0xf0
[  562.331603]  ? ip_local_deliver+0x110/0x110
[  562.332011]  __netif_receive_skb_core+0x46a/0x1040
[  562.332476]  ? inet_gro_receive+0x263/0x2e0
[  562.332885]  __netif_receive_skb_list_core+0x13b/0x2c0
[  562.333383]  netif_receive_skb_list_internal+0x1c8/0x2f0
[  562.333896]  ? update_load_avg+0x7e/0x5e0
[  562.334285]  gro_normal_list.part.149+0x19/0x40
[  562.334722]  napi_complete_done+0x67/0x160
[  562.335134]  virtnet_poll+0x2ad/0x408 [virtio_net]
[  562.335644]  __napi_poll+0x28/0x140
[  562.336012]  net_rx_action+0x23d/0x300
[  562.336414]  __do_softirq+0xf2/0x2ea
[  562.336803]  irq_exit_rcu+0xc1/0xf0
[  562.337173]  common_interrupt+0xb9/0xd0

It is and was always forbidden to call kernel_getpeername() in context
of error_report(). To get rid of the problem we save the peer address in
the connection struct and access it in error_report() without using
kernel_getpeername() in this context.

Fixes: 1a31833d085a ("DLM: Replace nodeid_to_addr with kernel_getpeername")
Reported-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 2f070514b3ee..e319309066b3 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -68,6 +68,7 @@
 
 struct connection {
 	struct socket *sock;	/* NULL if not connected */
+	struct sockaddr_storage addr;
 	uint32_t nodeid;	/* So we know who we are in the list */
 	struct mutex sock_mutex;
 	unsigned long flags;
@@ -594,7 +595,6 @@ int dlm_lowcomms_nodes_set_mark(int nodeid, unsigned int mark)
 static void lowcomms_error_report(struct sock *sk)
 {
 	struct connection *con;
-	struct sockaddr_storage saddr;
 	void (*orig_report)(struct sock *) = NULL;
 
 	read_lock_bh(&sk->sk_callback_lock);
@@ -603,14 +603,8 @@ static void lowcomms_error_report(struct sock *sk)
 		goto out;
 
 	orig_report = listen_sock.sk_error_report;
-	if (kernel_getpeername(sk->sk_socket, (struct sockaddr *)&saddr) < 0) {
-		printk_ratelimited(KERN_ERR "dlm: node %d: socket error "
-				   "sending to node %d, port %d, "
-				   "sk_err=%d/%d\n", dlm_our_nodeid(),
-				   con->nodeid, dlm_config.ci_tcp_port,
-				   sk->sk_err, sk->sk_err_soft);
-	} else if (saddr.ss_family == AF_INET) {
-		struct sockaddr_in *sin4 = (struct sockaddr_in *)&saddr;
+	if (con->addr.ss_family == AF_INET) {
+		struct sockaddr_in *sin4 = (struct sockaddr_in *)&con->addr;
 
 		printk_ratelimited(KERN_ERR "dlm: node %d: socket error "
 				   "sending to node %d at %pI4, port %d, "
@@ -619,7 +613,7 @@ static void lowcomms_error_report(struct sock *sk)
 				   dlm_config.ci_tcp_port, sk->sk_err,
 				   sk->sk_err_soft);
 	} else {
-		struct sockaddr_in6 *sin6 = (struct sockaddr_in6 *)&saddr;
+		struct sockaddr_in6 *sin6 = (struct sockaddr_in6 *)&con->addr;
 
 		printk_ratelimited(KERN_ERR "dlm: node %d: socket error "
 				   "sending to node %d at %u.%u.%u.%u, "
@@ -1072,6 +1066,7 @@ static int accept_from_sock(struct listen_connection *con)
 			close_connection(othercon, false, true, false);
 		}
 
+		memcpy(&othercon->addr, &peeraddr, sizeof(othercon->addr));
 		mutex_lock(&othercon->sock_mutex);
 		add_sock(newsock, othercon);
 		addcon = othercon;
@@ -1081,6 +1076,7 @@ static int accept_from_sock(struct listen_connection *con)
 		/* accept copies the sk after we've saved the callbacks, so we
 		   don't want to save them a second time or comm errors will
 		   result in calling sk_error_report recursively. */
+		memcpy(&newcon->addr, &peeraddr, sizeof(newcon->addr));
 		add_sock(newsock, newcon);
 		addcon = newcon;
 	}
@@ -1545,6 +1541,7 @@ static void dlm_connect(struct connection *con)
 		return;
 	}
 
+	memcpy(&con->addr, &addr, sizeof(con->addr));
 	/* Create a socket to communicate with */
 	result = sock_create_kern(&init_net, dlm_local_addr[0]->ss_family,
 				  SOCK_STREAM, dlm_proto_ops->proto, &sock);
-- 
2.27.0

