Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9253C6D24C5
	for <lists+cluster-devel@lfdr.de>; Fri, 31 Mar 2023 18:11:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680279106;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6d/Oxl1Cdu8ybDL5tOgPD1gv3cW2fyMj4HBClKMadWo=;
	b=eiUYMmrKHjOHpiASycP9LihJknkT49zdS8otvsgoSTLQTdvtNm+J+40vuJVZKOcifjN25W
	bV3I6tYgh7NmN8iW6tk+E1/vAP/dz4N7vyw3L1FAT2RA9cm5l6x+ed3JWqLOhIgj0P98sx
	hi89JWPgsEMLk1qcJea9SM8A5DIyj1Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-548-XKOssp88O3ag4G7sw--s4g-1; Fri, 31 Mar 2023 12:11:44 -0400
X-MC-Unique: XKOssp88O3ag4G7sw--s4g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA004801206;
	Fri, 31 Mar 2023 16:11:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B7BD12027040;
	Fri, 31 Mar 2023 16:11:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0DE9E1946A40;
	Fri, 31 Mar 2023 16:11:39 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 145D919465BC for <cluster-devel@listman.corp.redhat.com>;
 Fri, 31 Mar 2023 16:11:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 71268112131B; Fri, 31 Mar 2023 16:11:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3AF201121314;
 Fri, 31 Mar 2023 16:11:29 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Matthew Wilcox <willy@infradead.org>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Date: Fri, 31 Mar 2023 17:09:06 +0100
Message-Id: <20230331160914.1608208-48-dhowells@redhat.com>
In-Reply-To: <20230331160914.1608208-1-dhowells@redhat.com>
References: <20230331160914.1608208-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [PATCH v3 47/55] dlm: Use sendmsg(MSG_SPLICE_PAGES)
 rather than sendpage
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
Cc: Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 cluster-devel@redhat.com, netdev@vger.kernel.org,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 Chuck Lever III <chuck.lever@oracle.com>, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

When transmitting data, call down a layer using a single sendmsg with
MSG_SPLICE_PAGES to indicate that content should be spliced rather using
sendpage.  This allows ->sendpage() to be replaced by something that can
handle multiple multipage folios in a single transaction.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Christine Caulfield <ccaulfie@redhat.com>
cc: David Teigland <teigland@redhat.com>
cc: "David S. Miller" <davem@davemloft.net>
cc: Eric Dumazet <edumazet@google.com>
cc: Jakub Kicinski <kuba@kernel.org>
cc: Paolo Abeni <pabeni@redhat.com>
cc: Jens Axboe <axboe@kernel.dk>
cc: Matthew Wilcox <willy@infradead.org>
cc: cluster-devel@redhat.com
cc: netdev@vger.kernel.org
---
 fs/dlm/lowcomms.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index a9b14f81d655..9c0c691b6106 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1394,8 +1394,11 @@ int dlm_lowcomms_resend_msg(struct dlm_msg *msg)
 /* Send a message */
 static int send_to_sock(struct connection *con)
 {
-	const int msg_flags = MSG_DONTWAIT | MSG_NOSIGNAL;
 	struct writequeue_entry *e;
+	struct bio_vec bvec;
+	struct msghdr msg = {
+		.msg_flags = MSG_SPLICE_PAGES | MSG_DONTWAIT | MSG_NOSIGNAL,
+	};
 	int len, offset, ret;
 
 	spin_lock_bh(&con->writequeue_lock);
@@ -1411,8 +1414,9 @@ static int send_to_sock(struct connection *con)
 	WARN_ON_ONCE(len == 0 && e->users == 0);
 	spin_unlock_bh(&con->writequeue_lock);
 
-	ret = kernel_sendpage(con->sock, e->page, offset, len,
-			      msg_flags);
+	bvec_set_page(&bvec, e->page, len, offset);
+	iov_iter_bvec(&msg.msg_iter, ITER_SOURCE, &bvec, 1, len);
+	ret = sock_sendmsg(con->sock, &msg);
 	trace_dlm_send(con->nodeid, ret);
 	if (ret == -EAGAIN || ret == 0) {
 		lock_sock(con->sock->sk);

