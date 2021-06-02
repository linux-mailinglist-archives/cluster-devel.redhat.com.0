Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 55A05398AF6
	for <lists+cluster-devel@lfdr.de>; Wed,  2 Jun 2021 15:46:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622641588;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=c1M7LfeeAUPn7+L7PFd/aKNE89T0tCkt0jn92zXYgc8=;
	b=Kc/WcoLTAHAITTF+8xfn054qnIBtnSOImwwAHyjP3NPim9SD/uKDb5m2d9ZRxUOc8KnoML
	yA4LQaeOeekuG5DXyR2RcO9NjT8ps1Cgc/i0KvnF1n89kCyuEohFAnIy9Nv9nmjU9V1Q2U
	7T/RCQHnBS+mzNMp5mqEvj14RJjtk7c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-UzRdXyQzOgWuAVT32tgOxg-1; Wed, 02 Jun 2021 09:46:26 -0400
X-MC-Unique: UzRdXyQzOgWuAVT32tgOxg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0D9F18127B1;
	Wed,  2 Jun 2021 13:45:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7867118174;
	Wed,  2 Jun 2021 13:45:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 28C9844A5C;
	Wed,  2 Jun 2021 13:45:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 152DjmIM029974 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 2 Jun 2021 09:45:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5CFAA1037F57; Wed,  2 Jun 2021 13:45:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-116-136.rdu2.redhat.com [10.10.116.136])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D37E61045EA5;
	Wed,  2 Jun 2021 13:45:47 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed,  2 Jun 2021 09:45:18 -0400
Message-Id: <20210602134520.71030-4-aahringo@redhat.com>
In-Reply-To: <20210602134520.71030-1-aahringo@redhat.com>
References: <20210602134520.71030-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 4/6] fs: dlm: move dlm allow conn
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch checks if possible allowing new connections is allowed before
queueing the listen socket to accept new connections.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 02b636d113fb..6b150e3aa30c 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -471,6 +471,9 @@ static void lowcomms_data_ready(struct sock *sk)
 
 static void lowcomms_listen_data_ready(struct sock *sk)
 {
+	if (!dlm_allow_conn)
+		return;
+
 	queue_work(recv_workqueue, &listen_con.rwork);
 }
 
@@ -969,10 +972,6 @@ static int accept_from_sock(struct listen_connection *con)
 	struct connection *addcon;
 	unsigned int mark;
 
-	if (!dlm_allow_conn) {
-		return -1;
-	}
-
 	if (!con->sock)
 		return -ENOTCONN;
 
-- 
2.26.3

