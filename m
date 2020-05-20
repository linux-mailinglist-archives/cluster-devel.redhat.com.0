Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id EB5651DC042
	for <lists+cluster-devel@lfdr.de>; Wed, 20 May 2020 22:34:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590006881;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RS3LTvliBGxyGsnnvxZgDr4L9B5S1/4iYu+vJVezXGg=;
	b=NetYgVAFHQNaBo0f0oucJVTE//in1M5yNlYt9CDrJs/f+gaF+bFT7uC6KjAKO8holKY3tm
	7BQlJI0e5Fa1mw+gyP9n2Lq5tBojBL/6nchaDjLKq61LGyVmcXNl25u2a/+UcDAz0jHZmY
	hcnJFHXPJjyBH8jZTJ9R6iBeNRuc/Ng=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-u2XJOtVXMTi-44pq5nKHKw-1; Wed, 20 May 2020 16:34:40 -0400
X-MC-Unique: u2XJOtVXMTi-44pq5nKHKw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1890987308E;
	Wed, 20 May 2020 20:34:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 07B8C60C05;
	Wed, 20 May 2020 20:34:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E87B24EDB9;
	Wed, 20 May 2020 20:34:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04KKYaV0032268 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 20 May 2020 16:34:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3F7FD2026DFD; Wed, 20 May 2020 20:34:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A439202683E
	for <cluster-devel@redhat.com>; Wed, 20 May 2020 20:34:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F78A8007DF
	for <cluster-devel@redhat.com>; Wed, 20 May 2020 20:34:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-461-Wr0yJ8PpNlOruSlo-W_2_g-1; Wed, 20 May 2020 16:34:32 -0400
X-MC-Unique: Wr0yJ8PpNlOruSlo-W_2_g-1
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbUo8-0001ss-Fg; Wed, 20 May 2020 19:55:16 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Wed, 20 May 2020 21:54:38 +0200
Message-Id: <20200520195509.2215098-3-hch@lst.de>
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
Subject: [Cluster-devel] [PATCH 02/33] net: remove kernel_getsockopt
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

No users left.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/net.h |  2 --
 net/socket.c        | 34 ----------------------------------
 2 files changed, 36 deletions(-)

diff --git a/include/linux/net.h b/include/linux/net.h
index 6451425e828f5..74ef5d7315f70 100644
--- a/include/linux/net.h
+++ b/include/linux/net.h
@@ -303,8 +303,6 @@ int kernel_connect(struct socket *sock, struct sockaddr *addr, int addrlen,
 		   int flags);
 int kernel_getsockname(struct socket *sock, struct sockaddr *addr);
 int kernel_getpeername(struct socket *sock, struct sockaddr *addr);
-int kernel_getsockopt(struct socket *sock, int level, int optname, char *optval,
-		      int *optlen);
 int kernel_setsockopt(struct socket *sock, int level, int optname, char *optval,
 		      unsigned int optlen);
 int kernel_sendpage(struct socket *sock, struct page *page, int offset,
diff --git a/net/socket.c b/net/socket.c
index 80422fc3c836e..81a98b6cbd087 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -3624,40 +3624,6 @@ int kernel_getpeername(struct socket *sock, struct sockaddr *addr)
 }
 EXPORT_SYMBOL(kernel_getpeername);
 
-/**
- *	kernel_getsockopt - get a socket option (kernel space)
- *	@sock: socket
- *	@level: API level (SOL_SOCKET, ...)
- *	@optname: option tag
- *	@optval: option value
- *	@optlen: option length
- *
- *	Assigns the option length to @optlen.
- *	Returns 0 or an error.
- */
-
-int kernel_getsockopt(struct socket *sock, int level, int optname,
-			char *optval, int *optlen)
-{
-	mm_segment_t oldfs = get_fs();
-	char __user *uoptval;
-	int __user *uoptlen;
-	int err;
-
-	uoptval = (char __user __force *) optval;
-	uoptlen = (int __user __force *) optlen;
-
-	set_fs(KERNEL_DS);
-	if (level == SOL_SOCKET)
-		err = sock_getsockopt(sock, level, optname, uoptval, uoptlen);
-	else
-		err = sock->ops->getsockopt(sock, level, optname, uoptval,
-					    uoptlen);
-	set_fs(oldfs);
-	return err;
-}
-EXPORT_SYMBOL(kernel_getsockopt);
-
 /**
  *	kernel_setsockopt - set a socket option (kernel space)
  *	@sock: socket
-- 
2.26.2

