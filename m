Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 06AE838149E
	for <lists+cluster-devel@lfdr.de>; Sat, 15 May 2021 02:36:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621038976;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lNkb/nA519vFNYpG8N9PdK+UwiEVZrOooSGMrPvw2AI=;
	b=dg7c/yB7OzfZGfnUuUvylZqE90vwDRbKYCqpt0Z0AmwPlWwnKdFP5I6BFsIKPAxZRPaKvO
	jICrSNyz7QJzn4JrCYz6kxvR3EuiMOrdW5U0/6rsEwM7nhSqaPHnmuoYmSvuL/WON8BGaa
	Kc9sr5C9j2pjgkSzwkdvs2xzZLo7JiU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-uF2ntY4xN9mwVP_wh6SFUA-1; Fri, 14 May 2021 20:36:14 -0400
X-MC-Unique: uF2ntY4xN9mwVP_wh6SFUA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E094107AD37;
	Sat, 15 May 2021 00:36:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2C6D694CD;
	Sat, 15 May 2021 00:36:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0821F180B463;
	Sat, 15 May 2021 00:36:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14F0a2K2030820 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 14 May 2021 20:36:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6875D5DDAD; Sat, 15 May 2021 00:36:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-135.rdu2.redhat.com [10.10.115.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DF56A5D9CD;
	Sat, 15 May 2021 00:36:01 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 14 May 2021 20:35:35 -0400
Message-Id: <20210515003549.1118171-2-aahringo@redhat.com>
In-Reply-To: <20210515003549.1118171-1-aahringo@redhat.com>
References: <20210515003549.1118171-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, gnault@redhat.com, pabeni@redhat.com
Subject: [Cluster-devel] [PATCHv5 v5.13-rc1 dlm/next 01/15] fs: dlm: add dlm
	macros for ratelimit log
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch add ratelimit macro to dlm subsystem and will set the
connecting log message to ratelimit. In non blocking connecting cases it
will print out this message a lot.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/dlm_internal.h | 2 ++
 fs/dlm/lowcomms.c     | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index 04fe9f525ac7..ae3fdf6d9cda 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -60,6 +60,8 @@ struct dlm_mhandle;
 
 #define log_print(fmt, args...) \
 	printk(KERN_ERR "dlm: "fmt"\n" , ##args)
+#define log_print_ratelimited(fmt, args...) \
+	printk_ratelimited(KERN_ERR "dlm: "fmt"\n", ##args)
 #define log_error(ls, fmt, args...) \
 	printk(KERN_ERR "dlm: %s: " fmt "\n", (ls)->ls_name , ##args)
 
diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 166e36fcf3e4..15810701b13e 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1075,7 +1075,7 @@ static void sctp_connect_to_sock(struct connection *con)
 
 	make_sockaddr(&daddr, dlm_config.ci_tcp_port, &addr_len);
 
-	log_print("connecting to %d", con->nodeid);
+	log_print_ratelimited("connecting to %d", con->nodeid);
 
 	/* Turn off Nagle's algorithm */
 	sctp_sock_set_nodelay(sock->sk);
@@ -1171,7 +1171,7 @@ static void tcp_connect_to_sock(struct connection *con)
 
 	make_sockaddr(&saddr, dlm_config.ci_tcp_port, &addr_len);
 
-	log_print("connecting to %d", con->nodeid);
+	log_print_ratelimited("connecting to %d", con->nodeid);
 
 	/* Turn off Nagle's algorithm */
 	tcp_sock_set_nodelay(sock->sk);
-- 
2.26.3

