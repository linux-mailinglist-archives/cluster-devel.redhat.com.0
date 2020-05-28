Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 5822D1E5710
	for <lists+cluster-devel@lfdr.de>; Thu, 28 May 2020 07:55:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590645325;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bFc06nkT4FLmdckI/QoiIg4+DXV/rA+vbPFs8K7W3Gk=;
	b=fK+W1Rj6n0fq62wgQ36xDARvHxKvFHyc8CDn30t0PpcUk5iPoZQRnth0uzwoMkcII+7WuG
	JY7Z5btsp22NDJHN+Pk4AHHoIcUj/B69T1i1v0lxDIpRPJGg/NOEkvmpNgynrV2OruemuK
	OrlN3LVGBVC2yCVx0t7E8OWN80e3mcM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-DauWmyYYO6uFp7IXw5zr0g-1; Thu, 28 May 2020 01:55:23 -0400
X-MC-Unique: DauWmyYYO6uFp7IXw5zr0g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CBB48015CF;
	Thu, 28 May 2020 05:55:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E89C62932;
	Thu, 28 May 2020 05:55:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C25B81809543;
	Thu, 28 May 2020 05:55:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04S5tI6q009614 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 28 May 2020 01:55:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CF63E11701D0; Thu, 28 May 2020 05:55:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CAFE211701CE
	for <cluster-devel@redhat.com>; Thu, 28 May 2020 05:55:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2614582882B
	for <cluster-devel@redhat.com>; Thu, 28 May 2020 05:55:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-184-gx5NytmuPzaPNsZ0PhLCoA-1; Thu, 28 May 2020 01:55:12 -0400
X-MC-Unique: gx5NytmuPzaPNsZ0PhLCoA-1
Received: from p4fdb1ad2.dip0.t-ipconnect.de ([79.219.26.210] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat
	Linux)) id 1jeAqZ-0001VO-HO; Thu, 28 May 2020 05:12:52 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Thu, 28 May 2020 07:12:12 +0200
Message-Id: <20200528051236.620353-5-hch@lst.de>
In-Reply-To: <20200528051236.620353-1-hch@lst.de>
References: <20200528051236.620353-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
Subject: [Cluster-devel] [PATCH 04/28] net: add sock_set_sndtimeo
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

Add a helper to directly set the SO_SNDTIMEO_NEW sockopt from kernel
space without going through a fake uaccess.  The interface is
simplified to only pass the seconds value, as that is the only
thing needed at the moment.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/dlm/lowcomms.c  |  8 ++------
 include/net/sock.h |  1 +
 net/core/sock.c    | 11 +++++++++++
 3 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index b801e77e3e596..b4d491122814b 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1035,7 +1035,6 @@ static void sctp_connect_to_sock(struct connection *con)
 	int result;
 	int addr_len;
 	struct socket *sock;
-	struct __kernel_sock_timeval tv = { .tv_sec = 5, .tv_usec = 0 };
 
 	if (con->nodeid == 0) {
 		log_print("attempt to connect sock 0 foiled");
@@ -1087,13 +1086,10 @@ static void sctp_connect_to_sock(struct connection *con)
 	 * since O_NONBLOCK argument in connect() function does not work here,
 	 * then, we should restore the default value of this attribute.
 	 */
-	kernel_setsockopt(sock, SOL_SOCKET, SO_SNDTIMEO_NEW, (char *)&tv,
-			  sizeof(tv));
+	sock_set_sndtimeo(sock->sk, 5);
 	result = sock->ops->connect(sock, (struct sockaddr *)&daddr, addr_len,
 				   0);
-	memset(&tv, 0, sizeof(tv));
-	kernel_setsockopt(sock, SOL_SOCKET, SO_SNDTIMEO_NEW, (char *)&tv,
-			  sizeof(tv));
+	sock_set_sndtimeo(sock->sk, 0);
 
 	if (result == -EINPROGRESS)
 		result = 0;
diff --git a/include/net/sock.h b/include/net/sock.h
index a3a43141a4be2..9a7b9e98685ac 100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -2691,5 +2691,6 @@ void sock_def_readable(struct sock *sk);
 void sock_no_linger(struct sock *sk);
 void sock_set_priority(struct sock *sk, u32 priority);
 void sock_set_reuseaddr(struct sock *sk);
+void sock_set_sndtimeo(struct sock *sk, s64 secs);
 
 #endif	/* _SOCK_H */
diff --git a/net/core/sock.c b/net/core/sock.c
index ceda1a9248b3e..d3b1d61e4f768 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -737,6 +737,17 @@ void sock_set_priority(struct sock *sk, u32 priority)
 }
 EXPORT_SYMBOL(sock_set_priority);
 
+void sock_set_sndtimeo(struct sock *sk, s64 secs)
+{
+	lock_sock(sk);
+	if (secs && secs < MAX_SCHEDULE_TIMEOUT / HZ - 1)
+		sk->sk_sndtimeo = secs * HZ;
+	else
+		sk->sk_sndtimeo = MAX_SCHEDULE_TIMEOUT;
+	release_sock(sk);
+}
+EXPORT_SYMBOL(sock_set_sndtimeo);
+
 /*
  *	This is meant for all protocols to use and covers goings on
  *	at the socket level. Everything here is generic.
-- 
2.26.2

