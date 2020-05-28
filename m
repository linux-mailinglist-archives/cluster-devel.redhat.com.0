Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 364B91E5714
	for <lists+cluster-devel@lfdr.de>; Thu, 28 May 2020 07:56:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590645380;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Io53oiUYmuqiLEcJhawAHM3/CUXeG0e+cdSPzGhQq5w=;
	b=Dmun3MXg3PvFUHoe2/ytMOdHyNnYOJTai9ff9NmuoJZ9gUFrtwKgVSfAes/xTAxe5i+CyF
	HHW8Y5m0xGipAxhEVh6m/cfMK7kCDvudK4ppMxVfDNlBxffpGRtg81+3zg+gv5Tz/Iy6D7
	9IHXJlDjagHfNhXHaGmANOFBHUG7/og=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-BTgNO8aCOMqgsi8dHEFZLQ-1; Thu, 28 May 2020 01:56:18 -0400
X-MC-Unique: BTgNO8aCOMqgsi8dHEFZLQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 816D0835B46;
	Thu, 28 May 2020 05:56:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 72B835C1B0;
	Thu, 28 May 2020 05:56:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5EC4A1809543;
	Thu, 28 May 2020 05:56:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04S5uEYe009749 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 28 May 2020 01:56:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 923DB11701CF; Thu, 28 May 2020 05:56:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E4AA511701C3
	for <cluster-devel@redhat.com>; Thu, 28 May 2020 05:56:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E817D8007D9
	for <cluster-devel@redhat.com>; Thu, 28 May 2020 05:56:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-173-cDirPRugMQSOebruJB6Heg-1; Thu, 28 May 2020 01:56:07 -0400
X-MC-Unique: cDirPRugMQSOebruJB6Heg-1
Received: from p4fdb1ad2.dip0.t-ipconnect.de ([79.219.26.210] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat
	Linux)) id 1jeAqW-0001R3-Lf; Thu, 28 May 2020 05:12:49 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Thu, 28 May 2020 07:12:11 +0200
Message-Id: <20200528051236.620353-4-hch@lst.de>
In-Reply-To: <20200528051236.620353-1-hch@lst.de>
References: <20200528051236.620353-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
Subject: [Cluster-devel] [PATCH 03/28] net: add sock_set_priority
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

Add a helper to directly set the SO_PRIORITY sockopt from kernel space
without going through a fake uaccess.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Sagi Grimberg <sagi@grimberg.me>
---
 drivers/nvme/host/tcp.c   | 12 ++----------
 drivers/nvme/target/tcp.c | 18 ++++--------------
 include/net/sock.h        |  1 +
 net/core/sock.c           |  8 ++++++++
 4 files changed, 15 insertions(+), 24 deletions(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index e72d87482eb78..a307972d33a02 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -1362,16 +1362,8 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl,
 	 */
 	sock_no_linger(queue->sock->sk);
 
-	if (so_priority > 0) {
-		ret = kernel_setsockopt(queue->sock, SOL_SOCKET, SO_PRIORITY,
-				(char *)&so_priority, sizeof(so_priority));
-		if (ret) {
-			dev_err(ctrl->ctrl.device,
-				"failed to set SO_PRIORITY sock opt, ret %d\n",
-				ret);
-			goto err_sock;
-		}
-	}
+	if (so_priority > 0)
+		sock_set_priority(queue->sock->sk, so_priority);
 
 	/* Set socket type of service */
 	if (nctrl->opts->tos >= 0) {
diff --git a/drivers/nvme/target/tcp.c b/drivers/nvme/target/tcp.c
index e0801494b097f..f3088156d01da 100644
--- a/drivers/nvme/target/tcp.c
+++ b/drivers/nvme/target/tcp.c
@@ -1448,12 +1448,8 @@ static int nvmet_tcp_set_queue_sock(struct nvmet_tcp_queue *queue)
 	 */
 	sock_no_linger(sock->sk);
 
-	if (so_priority > 0) {
-		ret = kernel_setsockopt(sock, SOL_SOCKET, SO_PRIORITY,
-				(char *)&so_priority, sizeof(so_priority));
-		if (ret)
-			return ret;
-	}
+	if (so_priority > 0)
+		sock_set_priority(sock->sk, so_priority);
 
 	/* Set socket type of service */
 	if (inet->rcv_tos > 0) {
@@ -1638,14 +1634,8 @@ static int nvmet_tcp_add_port(struct nvmet_port *nport)
 		goto err_sock;
 	}
 
-	if (so_priority > 0) {
-		ret = kernel_setsockopt(port->sock, SOL_SOCKET, SO_PRIORITY,
-				(char *)&so_priority, sizeof(so_priority));
-		if (ret) {
-			pr_err("failed to set SO_PRIORITY sock opt %d\n", ret);
-			goto err_sock;
-		}
-	}
+	if (so_priority > 0)
+		sock_set_priority(port->sock->sk, so_priority);
 
 	ret = kernel_bind(port->sock, (struct sockaddr *)&port->addr,
 			sizeof(port->addr));
diff --git a/include/net/sock.h b/include/net/sock.h
index 6ed00bf009bbe..a3a43141a4be2 100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -2689,6 +2689,7 @@ static inline bool sk_dev_equal_l3scope(struct sock *sk, int dif)
 void sock_def_readable(struct sock *sk);
 
 void sock_no_linger(struct sock *sk);
+void sock_set_priority(struct sock *sk, u32 priority);
 void sock_set_reuseaddr(struct sock *sk);
 
 #endif	/* _SOCK_H */
diff --git a/net/core/sock.c b/net/core/sock.c
index f0f09524911c8..ceda1a9248b3e 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -729,6 +729,14 @@ void sock_no_linger(struct sock *sk)
 }
 EXPORT_SYMBOL(sock_no_linger);
 
+void sock_set_priority(struct sock *sk, u32 priority)
+{
+	lock_sock(sk);
+	sk->sk_priority = priority;
+	release_sock(sk);
+}
+EXPORT_SYMBOL(sock_set_priority);
+
 /*
  *	This is meant for all protocols to use and covers goings on
  *	at the socket level. Everything here is generic.
-- 
2.26.2

