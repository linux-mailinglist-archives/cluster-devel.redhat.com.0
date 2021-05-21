Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B44E638CDF2
	for <lists+cluster-devel@lfdr.de>; Fri, 21 May 2021 21:09:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621624157;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lNkb/nA519vFNYpG8N9PdK+UwiEVZrOooSGMrPvw2AI=;
	b=U7STLuYgi/NRnd2YCv7Eq1uTjEz+/zn7EyGYhjx902n8EYhkknBeB6RAW/UecOXba5smGp
	n/P6QoU0BX2wHBn9Qs2cCZU+yEr4KDRrBtHN6gflsIpQy/dKPkdPS7RCbqYcxumZi079zz
	qs0O3HibtGQBwzsMsUtTnwZRmXb9l7g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-usTYe-u6Me6WOK2j6cQTuA-1; Fri, 21 May 2021 15:09:11 -0400
X-MC-Unique: usTYe-u6Me6WOK2j6cQTuA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2425801107;
	Fri, 21 May 2021 19:09:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D7E9860C17;
	Fri, 21 May 2021 19:09:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 885B944A6C;
	Fri, 21 May 2021 19:09:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14LJ94WX005127 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 21 May 2021 15:09:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F182B679EF; Fri, 21 May 2021 19:09:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-19.rdu2.redhat.com [10.10.115.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 53FE36B8E8;
	Fri, 21 May 2021 19:09:03 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 21 May 2021 15:08:34 -0400
Message-Id: <20210521190848.350176-3-aahringo@redhat.com>
In-Reply-To: <20210521190848.350176-1-aahringo@redhat.com>
References: <20210521190848.350176-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, gnault@redhat.com, pabeni@redhat.com
Subject: [Cluster-devel] [PATCHv6 v5.13-rc1 dlm/next 02/16] fs: dlm: add dlm
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

