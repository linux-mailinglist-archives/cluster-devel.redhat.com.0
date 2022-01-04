Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A66FF484312
	for <lists+cluster-devel@lfdr.de>; Tue,  4 Jan 2022 15:10:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1641305414;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8zmou7gHLmjIfHvcEe1j4q5PTOjlg64RNTq8UWHfPVE=;
	b=EbTrnzigXKx7cy1rWbhUdy9+EUwtOHQXbjsYxk7SD5P4ZrFlxN307ty9GMraEqFby+2DWM
	C0pow8ZD1+cHHpHutM8eAoGxcGXBEDZRUrSbaqWG/3aBZTk7Q4Kct9CrkjIdMBDOTJYjWf
	py9iPZTNQN3ezg4yT0mVluvL689v6Mw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-346-aE5rIFcVNsmAN0Oy6pO49g-1; Tue, 04 Jan 2022 09:10:13 -0500
X-MC-Unique: aE5rIFcVNsmAN0Oy6pO49g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A4F985B6C0;
	Tue,  4 Jan 2022 14:10:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 843727E67A;
	Tue,  4 Jan 2022 14:10:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 99EAC1806D03;
	Tue,  4 Jan 2022 14:10:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 204E9sZD021843 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 4 Jan 2022 09:09:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7B8557E674; Tue,  4 Jan 2022 14:09:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 29B937E676;
	Tue,  4 Jan 2022 14:09:51 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue,  4 Jan 2022 09:09:47 -0500
Message-Id: <20220104140947.398113-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next] fs: dlm: print cluster addr if
	non-cluster node connects
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch prints the cluster node address if a non-cluster node
(according to the dlm config setting) tries to connect. The current
hexdump call will print in a different loglevel and only available if
dynamic debug is enabled. Additional we using the ip address format
strings to print an IETF ip4/6 string represenation.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 23a1ff690725..e284d696c1fd 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1028,10 +1028,28 @@ static int accept_from_sock(struct listen_connection *con)
 	/* Get the new node's NODEID */
 	make_sockaddr(&peeraddr, 0, &len);
 	if (addr_to_nodeid(&peeraddr, &nodeid, &mark)) {
-		unsigned char *b=(unsigned char *)&peeraddr;
-		log_print("connect from non cluster node");
-		print_hex_dump_bytes("ss: ", DUMP_PREFIX_NONE, 
-				     b, sizeof(struct sockaddr_storage));
+		switch (peeraddr.ss_family) {
+		case AF_INET: {
+			struct sockaddr_in *sin = (struct sockaddr_in *)&peeraddr;
+
+			log_print("connect from non cluster IPv4 node %pI4",
+				  &sin->sin_addr);
+			break;
+		}
+#if IS_ENABLED(CONFIG_IPV6)
+		case AF_INET6: {
+			struct sockaddr_in6 *sin6 = (struct sockaddr_in6 *)&peeraddr;
+
+			log_print("connect from non cluster IPv6 node %pI6c",
+				  &sin6->sin6_addr);
+			break;
+		}
+#endif
+		default:
+			log_print("invalid family from non cluster node");
+			break;
+		}
+
 		sock_release(newsock);
 		return -1;
 	}
-- 
2.27.0

