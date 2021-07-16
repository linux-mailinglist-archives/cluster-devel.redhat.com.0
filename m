Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 179CB3CBDB8
	for <lists+cluster-devel@lfdr.de>; Fri, 16 Jul 2021 22:23:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626466993;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VCwMydjXI5cvc/jOGuQqPMPz1dOrOgZHE+uzPf6PrU8=;
	b=KSmRbE4dq4wjZjJCTPNxvCnjVFIWfKL3NVt6NZhsL6NcDJUxrA9wi3uxdcaR40vY9zlldP
	s2TwQSyDNKoaxs4gF2Iws4isJujZIPUSGmoALuhyPBtgtqXA7nNM2dsvZHfX0dv+/e96dS
	Bcd0QqFMgtTc5bbTu/c4yBFHnOI+9jo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-hM4zKqB1MveEab3yWfgfWA-1; Fri, 16 Jul 2021 16:23:11 -0400
X-MC-Unique: hM4zKqB1MveEab3yWfgfWA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9B06100CCD4;
	Fri, 16 Jul 2021 20:23:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC2D85C1A3;
	Fri, 16 Jul 2021 20:23:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9AB2D4EA3A;
	Fri, 16 Jul 2021 20:23:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16GKN7bd026124 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 16 Jul 2021 16:23:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 322125D6D5; Fri, 16 Jul 2021 20:23:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E55B95D6AB;
	Fri, 16 Jul 2021 20:23:06 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 16 Jul 2021 16:22:45 -0400
Message-Id: <20210716202245.1262791-13-aahringo@redhat.com>
In-Reply-To: <20210716202245.1262791-1-aahringo@redhat.com>
References: <20210716202245.1262791-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v5.14-rc1 12/12] fs: dlm: move receive loop
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
index 04d16ece2bcb..1a7f92dbdea7 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -895,7 +895,6 @@ static int con_realloc_receive_buf(struct connection *con, int newlen)
 /* Data received from remote end */
 static int receive_from_sock(struct connection *con)
 {
-	int call_again_soon = 0;
 	struct msghdr msg;
 	struct kvec iov;
 	int ret, buflen;
@@ -915,41 +914,39 @@ static int receive_from_sock(struct connection *con)
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
 
@@ -1511,12 +1508,9 @@ int dlm_lowcomms_close(int nodeid)
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
2.27.0

