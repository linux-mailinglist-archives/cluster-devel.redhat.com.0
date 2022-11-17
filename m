Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9F762E7E1
	for <lists+cluster-devel@lfdr.de>; Thu, 17 Nov 2022 23:12:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668723136;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=A70kDNJ3nfFofEPRV6h4W4FKNpe4GjFNhKlrKoXvxCw=;
	b=PRE6hPeu7xCi99eeout8F4x/0i7MDEDy4O6SaMpsSPz+QzAZxFXY+1edoy+VvhdCzbj9/C
	uwdslt99eRxgMWXBNc+TVEtxFHHZ3leXDO1cavFypRXL7nW7Kr9CXtMmW+MVwIZ4cRt2sn
	d+CrJ7BfOpaMStb7fBuYHldgJhAsers=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-199-PeJLwWeOPqOl9B7oAgsYQw-1; Thu, 17 Nov 2022 17:12:14 -0500
X-MC-Unique: PeJLwWeOPqOl9B7oAgsYQw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59A41806005;
	Thu, 17 Nov 2022 22:12:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4AF6435429;
	Thu, 17 Nov 2022 22:12:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6A33A1946A6C;
	Thu, 17 Nov 2022 22:12:11 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7A7B51946A4A for <cluster-devel@listman.corp.redhat.com>;
 Thu, 17 Nov 2022 22:12:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5E8EB2166B46; Thu, 17 Nov 2022 22:12:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3AD762166B29;
 Thu, 17 Nov 2022 22:12:10 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 17 Nov 2022 17:11:55 -0500
Message-Id: <20221117221157.2396743-16-aahringo@redhat.com>
In-Reply-To: <20221117221157.2396743-1-aahringo@redhat.com>
References: <20221117221157.2396743-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH dlm/next 16/18] fs: dlm: use saved
 sk_error_report()
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch changes the handling of calling the original
sk_error_report() by not putting it on the stack and calling it later.
If the listen_sock.sk_error_report() is NULL in this moment it indicates
a bug in our implementation.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 677e31144ca0..643f9810ec35 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -569,11 +569,8 @@ int dlm_lowcomms_nodes_set_mark(int nodeid, unsigned int mark)
 static void lowcomms_error_report(struct sock *sk)
 {
 	struct connection *con = sock2con(sk);
-	void (*orig_report)(struct sock *) = NULL;
 	struct inet_sock *inet;
 
-	orig_report = listen_sock.sk_error_report;
-
 	inet = inet_sk(sk);
 	switch (sk->sk_family) {
 	case AF_INET:
@@ -618,8 +615,7 @@ static void lowcomms_error_report(struct sock *sk)
 		queue_work(send_workqueue, &con->swork);
 
 out:
-	if (orig_report)
-		orig_report(sk);
+	listen_sock.sk_error_report(sk);
 }
 
 static void restore_callbacks(struct socket *sock)
-- 
2.31.1

