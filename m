Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 106D1715109
	for <lists+cluster-devel@lfdr.de>; Mon, 29 May 2023 23:44:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685396693;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9rMXtxdV6aNwAW8Qp//Bw2aLPTA21SC2e1vso++Us7s=;
	b=TthO5Z7+EK5wfJhPkyULNMIjTmCHZfqBUQo0Xp+Zy/rohFwfSrrCL0xqdAHP3FBlAgGDi8
	DTx/HE65P3Yhz9pV0SqIil7DyTm/1Pde0GqvDyGr0qtAIO4PznXm+epCbguDSBeLqy6Yku
	4+5FkFRYRY8v4xbARgaCXBUmqVtCRKE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-tiujVgVqOZuDJWyITxHiGw-1; Mon, 29 May 2023 17:44:48 -0400
X-MC-Unique: tiujVgVqOZuDJWyITxHiGw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06A592999B4A;
	Mon, 29 May 2023 21:44:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EF733112132D;
	Mon, 29 May 2023 21:44:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C10D319465B9;
	Mon, 29 May 2023 21:44:45 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 089A5194658C for <cluster-devel@listman.corp.redhat.com>;
 Mon, 29 May 2023 21:44:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E1AF02166B2E; Mon, 29 May 2023 21:44:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B75D12166B2B;
 Mon, 29 May 2023 21:44:42 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 29 May 2023 17:44:34 -0400
Message-Id: <20230529214440.2542721-6-aahringo@redhat.com>
In-Reply-To: <20230529214440.2542721-1-aahringo@redhat.com>
References: <20230529214440.2542721-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH dlm/next 06/12] fs: dlm: cleanup STOP_IO
 bitflag set when stop io
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
Cc: cluster-devel@redhat.com, stable@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

There should no difference between setting the CF_IO_STOP flag
before restore_callbacks() to do it before or afterwards. The
restore_callbacks() will be sure that no callback is executed anymore
when the bit wasn't set.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index b28505b8b23b..5a7586633cbe 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -735,19 +735,15 @@ static void stop_connection_io(struct connection *con)
 	if (con->othercon)
 		stop_connection_io(con->othercon);
 
+	spin_lock_bh(&con->writequeue_lock);
+	set_bit(CF_IO_STOP, &con->flags);
+	spin_unlock_bh(&con->writequeue_lock);
+
 	down_write(&con->sock_lock);
 	if (con->sock) {
 		lock_sock(con->sock->sk);
 		restore_callbacks(con->sock->sk);
-
-		spin_lock_bh(&con->writequeue_lock);
-		set_bit(CF_IO_STOP, &con->flags);
-		spin_unlock_bh(&con->writequeue_lock);
 		release_sock(con->sock->sk);
-	} else {
-		spin_lock_bh(&con->writequeue_lock);
-		set_bit(CF_IO_STOP, &con->flags);
-		spin_unlock_bh(&con->writequeue_lock);
 	}
 	up_write(&con->sock_lock);
 
-- 
2.31.1

