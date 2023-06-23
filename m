Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A76473B676
	for <lists+cluster-devel@lfdr.de>; Fri, 23 Jun 2023 13:44:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687520696;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CX0szcw738ZS8htZ0RxEmjBFgUMhbKSUPMuc1XxmplE=;
	b=D/L9eBuZeDntVAZrMavweqGncZ53ihb6nsLPpBYRLlzbZrW8wcH/vCvUO/7kh6dUsu/HcC
	JRB2MRvs+Fj6LNZ3I1u1qytE3a7b3UL0r7wTY5+bspXuYpuk2UB1lQ2lsa2hlfg6f5sA4N
	4UCVotayYIaCnj6n3v3C767T8QmTtDg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-509-X0FXzNvkMx-I12fmng824w-1; Fri, 23 Jun 2023 07:44:50 -0400
X-MC-Unique: X0FXzNvkMx-I12fmng824w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D56C90ED24;
	Fri, 23 Jun 2023 11:44:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 23C5F42535A;
	Fri, 23 Jun 2023 11:44:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5E552194658D;
	Fri, 23 Jun 2023 11:44:45 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C9C521946587 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 23 Jun 2023 11:44:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B82A71121315; Fri, 23 Jun 2023 11:44:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04E2C1121314;
 Fri, 23 Jun 2023 11:44:42 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Fri, 23 Jun 2023 12:44:16 +0100
Message-ID: <20230623114425.2150536-7-dhowells@redhat.com>
In-Reply-To: <20230623114425.2150536-1-dhowells@redhat.com>
References: <20230623114425.2150536-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [PATCH net-next v4 06/15] dlm: Use
 sendmsg(MSG_SPLICE_PAGES) rather than sendpage
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
Cc: Jens Axboe <axboe@kernel.dk>, cluster-devel@redhat.com,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 David Ahern <dsahern@kernel.org>, linux-kernel@vger.kernel.org,
 Alexander Duyck <alexander.duyck@gmail.com>,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, Matthew Wilcox <willy@infradead.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
index 3d3802c47b8b..5c12d8cdfc16 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1395,8 +1395,11 @@ int dlm_lowcomms_resend_msg(struct dlm_msg *msg)
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
@@ -1412,8 +1415,9 @@ static int send_to_sock(struct connection *con)
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

