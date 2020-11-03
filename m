Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 95F412A382D
	for <lists+cluster-devel@lfdr.de>; Tue,  3 Nov 2020 02:05:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604365499;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+UZzHIykOebaKHo5wTHcDASF7l9leVUsqXchzjqZKN4=;
	b=URErwfCqeiPlif8BfemaY1QFCpDWOnzxckVvdG/CVFRQthrSOTNVR5/m3htNfpnpKAg2Rr
	uYjTasMErcaLc6haSCXs2YdqQdmSfXpdtvVWj/3lYS7mudtfTnYJhxfgMzDvW51sutxMwD
	lvqbBrtC0tNo5h4D8Od9Y0czEO6Laaw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-yuSZllyMOSujo7HtbNtt6Q-1; Mon, 02 Nov 2020 20:04:57 -0500
X-MC-Unique: yuSZllyMOSujo7HtbNtt6Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DEFBB1006CA3;
	Tue,  3 Nov 2020 01:04:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE1755B4DA;
	Tue,  3 Nov 2020 01:04:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B8975181A06C;
	Tue,  3 Nov 2020 01:04:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A314kbZ003551 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 2 Nov 2020 20:04:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D8BE35C5FE; Tue,  3 Nov 2020 01:04:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-45.rdu2.redhat.com [10.10.115.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6EA6F5C5FD;
	Tue,  3 Nov 2020 01:04:46 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  2 Nov 2020 20:04:24 -0500
Message-Id: <20201103010428.1009384-10-aahringo@redhat.com>
In-Reply-To: <20201103010428.1009384-1-aahringo@redhat.com>
References: <20201103010428.1009384-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 RESEND v5.10-rc2 09/13] fs: dlm: refactor
	sctp sock parameter
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
index 9723df4e67b8..889ac5e8ad0a 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -936,7 +936,7 @@ static void writequeue_entry_complete(struct writequeue_entry *e, int completed)
 /*
  * sctp_bind_addrs - bind a SCTP socket to all our addresses
  */
-static int sctp_bind_addrs(struct connection *con, uint16_t port)
+static int sctp_bind_addrs(struct socket *sock, uint16_t port)
 {
 	struct sockaddr_storage localaddr;
 	struct sockaddr *addr = (struct sockaddr *)&localaddr;
@@ -947,9 +947,9 @@ static int sctp_bind_addrs(struct connection *con, uint16_t port)
 		make_sockaddr(&localaddr, port, &addr_len);
 
 		if (!i)
-			result = kernel_bind(con->sock, addr, addr_len);
+			result = kernel_bind(sock, addr, addr_len);
 		else
-			result = sock_bind_add(con->sock->sk, addr, addr_len);
+			result = sock_bind_add(sock->sk, addr, addr_len);
 
 		if (result < 0) {
 			log_print("Can't bind to %d addr number %d, %d.\n",
@@ -1010,7 +1010,7 @@ static void sctp_connect_to_sock(struct connection *con)
 	add_sock(sock, con);
 
 	/* Bind to all addresses. */
-	if (sctp_bind_addrs(con, 0))
+	if (sctp_bind_addrs(con->sock, 0))
 		goto bind_err;
 
 	make_sockaddr(&daddr, dlm_config.ci_tcp_port, &addr_len);
@@ -1276,7 +1276,7 @@ static int sctp_listen_for_all(void)
 	write_unlock_bh(&sock->sk->sk_callback_lock);
 
 	/* Bind to all addresses. */
-	if (sctp_bind_addrs(con, dlm_config.ci_tcp_port))
+	if (sctp_bind_addrs(con->sock, dlm_config.ci_tcp_port))
 		goto create_delsock;
 
 	result = sock->ops->listen(sock, 5);
-- 
2.26.2

