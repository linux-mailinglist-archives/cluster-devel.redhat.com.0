Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9429B3B1D6B
	for <lists+cluster-devel@lfdr.de>; Wed, 23 Jun 2021 17:15:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624461345;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2oPtLSNN+QRjmhT+QlFhlvPyH1A2iWbacUIgbloPUOY=;
	b=Zd1HB7HE0KI0eNe2/TP0kc70yUUK4y4Dw9ihGf2ywVX8dj70JL5T8vQyqLg0HMLJkKdh0m
	KBM1Uv178B1JsFUDgCBuqPHYP4Ioedmzf0/yIy7zt7luIb/AIg70eXEvI+zRee5BB5ISWX
	IribDti1emij6Mwe4UrwxOrVjyKdGuw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-0Uor2lzSNJKMEAZUqmM6vQ-1; Wed, 23 Jun 2021 11:15:44 -0400
X-MC-Unique: 0Uor2lzSNJKMEAZUqmM6vQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43EF55721E;
	Wed, 23 Jun 2021 15:15:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 35AF05C1A3;
	Wed, 23 Jun 2021 15:15:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2207F1818462;
	Wed, 23 Jun 2021 15:15:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15NFFdbe024987 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 23 Jun 2021 11:15:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E85EC60E3A; Wed, 23 Jun 2021 15:15:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (unknown [10.22.8.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 89D9A60C05;
	Wed, 23 Jun 2021 15:15:39 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 23 Jun 2021 11:14:47 -0400
Message-Id: <20210623151454.176649-9-aahringo@redhat.com>
In-Reply-To: <20210623151454.176649-1-aahringo@redhat.com>
References: <20210623151454.176649-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [RFC dlm/next 08/15] fs: dlm: move receive loop
	into receive handler
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch moves the kernel_recvmsg() loop call into the
receive_from_sock() function instead of doing the loop outside the
function and abort the loop over it's return value.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 68 +++++++++++++++++++++--------------------------
 1 file changed, 31 insertions(+), 37 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index e96911c0c18d..8571017c3cdc 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -896,7 +896,6 @@ static int con_realloc_receive_buf(struct connection *con, int newlen)
 /* Data received from remote end */
 static int receive_from_sock(struct connection *con)
 {
-	int call_again_soon = 0;
 	struct msghdr msg;
 	struct kvec iov;
 	int ret, buflen;
@@ -916,41 +915,39 @@ static int receive_from_sock(struct connection *con)
 			goto out_resched;
 	}
 
-	/* calculate new buffer parameter regarding last receive and
-	 * possible leftover bytes
-	 */
-	iov.iov_base = con->rx_buf + con->rx_leftover;
-	iov.iov_len = con->rx_buflen - con->rx_leftover;
-
-	memset(&msg, 0, sizeof(msg));
-	msg.msg_flags = MSG_DONTWAIT | MSG_NOSIGNAL;
-	ret = kernel_recvmsg(con->sock, &msg, &iov, 1, iov.iov_len,
-			     msg.msg_flags);
-	if (ret <= 0)
-		goto out_close;
-	else if (ret == iov.iov_len)
-		call_again_soon = 1;
-
-	/* new buflen according readed bytes and leftover from last receive */
-	buflen = ret + con->rx_leftover;
-	ret = dlm_process_incoming_buffer(con->nodeid, con->rx_buf, buflen);
-	if (ret < 0)
-		goto out_close;
+	for (;;) {
+		/* calculate new buffer parameter regarding last receive and
+		 * possible leftover bytes
+		 */
+		iov.iov_base = con->rx_buf + con->rx_leftover;
+		iov.iov_len = con->rx_buflen - con->rx_leftover;
+
+		memset(&msg, 0, sizeof(msg));
+		msg.msg_flags = MSG_DONTWAIT | MSG_NOSIGNAL;
+		ret = kernel_recvmsg(con->sock, &msg, &iov, 1, iov.iov_len,
+				     msg.msg_flags);
+		if (ret == -EAGAIN)
+			break;
+		else if (ret <= 0)
+			goto out_close;
 
-	/* calculate leftover bytes from process and put it into begin of
-	 * the receive buffer, so next receive we have the full message
-	 * at the start address of the receive buffer.
-	 */
-	con->rx_leftover = buflen - ret;
-	if (con->rx_leftover) {
-		memmove(con->rx_buf, con->rx_buf + ret,
-			con->rx_leftover);
-		call_again_soon = true;
+		/* new buflen according readed bytes and leftover from last receive */
+		buflen = ret + con->rx_leftover;
+		ret = dlm_process_incoming_buffer(con->nodeid, con->rx_buf, buflen);
+		if (ret < 0)
+			goto out_close;
+
+		/* calculate leftover bytes from process and put it into begin of
+		 * the receive buffer, so next receive we have the full message
+		 * at the start address of the receive buffer.
+		 */
+		con->rx_leftover = buflen - ret;
+		if (con->rx_leftover) {
+			memmove(con->rx_buf, con->rx_buf + ret,
+				con->rx_leftover);
+		}
 	}
 
-	if (call_again_soon)
-		goto out_resched;
-
 	mutex_unlock(&con->sock_mutex);
 	return 0;
 
@@ -1512,12 +1509,9 @@ int dlm_lowcomms_close(int nodeid)
 static void process_recv_sockets(struct work_struct *work)
 {
 	struct connection *con = container_of(work, struct connection, rwork);
-	int err;
 
 	clear_bit(CF_READ_PENDING, &con->flags);
-	do {
-		err = receive_from_sock(con);
-	} while (!err);
+	receive_from_sock(con);
 }
 
 static void process_listen_recv_socket(struct work_struct *work)
-- 
2.26.3

