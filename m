Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id DA5443E062B
	for <lists+cluster-devel@lfdr.de>; Wed,  4 Aug 2021 18:54:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1628096055;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=D/r6+kzYMCDVx1VLQXqiLSVKfFaLFfVPLYwPUC+uk6w=;
	b=RBifinEY/uJ3yAvS7gMMSqfIaQzHPkUiiKIQ7BUSD+n4TL5Dg7PBHBPpbIT4e7rJJMHQny
	JfG6eDaZS9rBBqoLDypQNXX9wzxwr/DERRTfF58cDKe67b7DGlvJokmVyjdzBSlsC0V46A
	Jwr1F+KdGETbEsDu0Q32sk40herh6OA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-6Q3jlBFBPU-k5gNHd5PgcQ-1; Wed, 04 Aug 2021 12:54:14 -0400
X-MC-Unique: 6Q3jlBFBPU-k5gNHd5PgcQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 374C0107ACF5;
	Wed,  4 Aug 2021 16:54:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D9ED369A;
	Wed,  4 Aug 2021 16:54:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A12744BB7C;
	Wed,  4 Aug 2021 16:54:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 174Gm6jf028049 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 4 Aug 2021 12:48:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 47FAC5DEFA; Wed,  4 Aug 2021 16:48:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5AB755DD68;
	Wed,  4 Aug 2021 16:48:02 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed,  4 Aug 2021 12:48:01 -0400
Message-Id: <20210804164801.962733-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, stable@vger.kernel.org
Subject: [Cluster-devel] [PATCH] dlm: remove lock_sock to avoid scheduling
	while atomic
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

From: Bob Peterson <rpeterso@redhat.com>

Before this patch, functions save_callbacks and restore_callbacks
called function lock_sock and release_sock to prevent other processes
from messing with the struct sock while the callbacks were saved and
restored. However, function add_sock calls write_lock_bh prior to
calling it save_callbacks, which disables preempts. So the call to
lock_sock would try to schedule when we can't schedule.

Cc: stable@vger.kernel.org # 4.9.x
Fixes: b81171cb6869 ("DLM: Save and restore socket callbacks properly")
Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: David Teigland <teigland@redhat.com>
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 0d8aaf9c61be..9a9fc5ce1166 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -519,24 +519,20 @@ static void lowcomms_error_report(struct sock *sk)
 /* Note: sk_callback_lock must be locked before calling this function. */
 static void save_callbacks(struct connection *con, struct sock *sk)
 {
-	lock_sock(sk);
 	con->orig_data_ready = sk->sk_data_ready;
 	con->orig_state_change = sk->sk_state_change;
 	con->orig_write_space = sk->sk_write_space;
 	con->orig_error_report = sk->sk_error_report;
-	release_sock(sk);
 }
 
 static void restore_callbacks(struct connection *con, struct sock *sk)
 {
 	write_lock_bh(&sk->sk_callback_lock);
-	lock_sock(sk);
 	sk->sk_user_data = NULL;
 	sk->sk_data_ready = con->orig_data_ready;
 	sk->sk_state_change = con->orig_state_change;
 	sk->sk_write_space = con->orig_write_space;
 	sk->sk_error_report = con->orig_error_report;
-	release_sock(sk);
 	write_unlock_bh(&sk->sk_callback_lock);
 }
 
-- 
2.27.0

