Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A17E4292DEC
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Oct 2020 20:59:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603133982;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=U9WetrgDiJ3ggBTI/G3BsXQkoKs8b/7/TWiVPrQro2c=;
	b=OHS2Zk4HFj5P7STi8sFQoWxJRNAUKHbYYvsw4Lu3onL2/KQkQJD3Z1t+zIO6edcXS9Tygg
	Pgk/W2nxiUG2sbMZLio2LSyhKmeMoTfe0RCCWiADsDMYelybBbkX8WTvM0KJglOqFLkxUP
	JXy2+NLhyvEvueYQ84ccc3K6EXz5leU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-RexUje1gPrqVUtO9bFKzeg-1; Mon, 19 Oct 2020 14:59:40 -0400
X-MC-Unique: RexUje1gPrqVUtO9bFKzeg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 869D01006C84;
	Mon, 19 Oct 2020 18:59:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 741B827CD5;
	Mon, 19 Oct 2020 18:59:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5F0B98C7AF;
	Mon, 19 Oct 2020 18:59:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09JIxbBt021337 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Oct 2020 14:59:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4B9385C225; Mon, 19 Oct 2020 18:59:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-116-200.rdu2.redhat.com [10.10.116.200])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B50505C1A3;
	Mon, 19 Oct 2020 18:59:36 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 19 Oct 2020 14:59:15 -0400
Message-Id: <20201019185916.707827-9-aahringo@redhat.com>
In-Reply-To: <20201019185916.707827-1-aahringo@redhat.com>
References: <20201019185916.707827-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 8/9] fs: dlm: refactor sctp sock
	parameter
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch refactors sctp_bind_addrs() to work with a socket parameter
instead of a connection parameter.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index bae4125c22deb..f18d40ba42f97 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -947,7 +947,7 @@ static void writequeue_entry_complete(struct writequeue_entry *e, int completed)
 /*
  * sctp_bind_addrs - bind a SCTP socket to all our addresses
  */
-static int sctp_bind_addrs(struct connection *con, uint16_t port)
+static int sctp_bind_addrs(struct socket *sock, uint16_t port)
 {
 	struct sockaddr_storage localaddr;
 	struct sockaddr *addr = (struct sockaddr *)&localaddr;
@@ -958,9 +958,9 @@ static int sctp_bind_addrs(struct connection *con, uint16_t port)
 		make_sockaddr(&localaddr, port, &addr_len);
 
 		if (!i)
-			result = kernel_bind(con->sock, addr, addr_len);
+			result = kernel_bind(sock, addr, addr_len);
 		else
-			result = sock_bind_add(con->sock->sk, addr, addr_len);
+			result = sock_bind_add(sock->sk, addr, addr_len);
 
 		if (result < 0) {
 			log_print("Can't bind to %d addr number %d, %d.\n",
@@ -1021,7 +1021,7 @@ static void sctp_connect_to_sock(struct connection *con)
 	add_sock(sock, con);
 
 	/* Bind to all addresses. */
-	if (sctp_bind_addrs(con, 0))
+	if (sctp_bind_addrs(con->sock, 0))
 		goto bind_err;
 
 	make_sockaddr(&daddr, dlm_config.ci_tcp_port, &addr_len);
@@ -1287,7 +1287,7 @@ static int sctp_listen_for_all(void)
 	write_unlock_bh(&sock->sk->sk_callback_lock);
 
 	/* Bind to all addresses. */
-	if (sctp_bind_addrs(con, dlm_config.ci_tcp_port))
+	if (sctp_bind_addrs(con->sock, dlm_config.ci_tcp_port))
 		goto create_delsock;
 
 	result = sock->ops->listen(sock, 5);
-- 
2.26.2

