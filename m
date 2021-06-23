Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 533AE3B1D68
	for <lists+cluster-devel@lfdr.de>; Wed, 23 Jun 2021 17:15:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624461339;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AV4eQcFHVxZVtfJW9FrmR2/L+gMGqC37s7MTyPVLFVw=;
	b=A7LY01ev+E3qQJJqHPX4jvujbs6BO4VRFImY/LGrPpQV+TnxH0/j1QNVGTqufLI429rhZ0
	ToJr97Rku5qwqPygR4FCcWJ0Bt2ckAjGTQX+e5XFuljYyE7yoijSATNBmqgcMQWQU9rMMd
	IhP7iQvBweX5iqAJbJ2mzp3maQCUpWU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-I0sZGDmYNbSxMk87xVYuzQ-1; Wed, 23 Jun 2021 11:15:37 -0400
X-MC-Unique: I0sZGDmYNbSxMk87xVYuzQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EDB58FEFFB;
	Wed, 23 Jun 2021 15:15:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 51E2E60871;
	Wed, 23 Jun 2021 15:15:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 916EE4EA3C;
	Wed, 23 Jun 2021 15:15:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15NFFEve024734 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 23 Jun 2021 11:15:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7B98660E1C; Wed, 23 Jun 2021 15:15:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (unknown [10.22.8.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1D07361093;
	Wed, 23 Jun 2021 15:15:14 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 23 Jun 2021 11:14:41 -0400
Message-Id: <20210623151454.176649-3-aahringo@redhat.com>
In-Reply-To: <20210623151454.176649-1-aahringo@redhat.com>
References: <20210623151454.176649-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [RFC dlm/next 02/15] fs: dlm: introduce con_next_wq
	helper
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

This patch introduce a function to determine if something is ready to
being send in the writequeue. It's not just that the writequeue is not
empty additional the first entry need to have a valid length field.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 57 +++++++++++++++++++++++++++++------------------
 1 file changed, 35 insertions(+), 22 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 670c3d395709..395789bfc467 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -175,6 +175,22 @@ static void sctp_connect_to_sock(struct connection *con);
 static void tcp_connect_to_sock(struct connection *con);
 static void dlm_tcp_shutdown(struct connection *con);
 
+/* need to held writequeue_lock */
+static struct writequeue_entry *con_next_wq(struct connection *con)
+{
+	struct writequeue_entry *e;
+
+	if (list_empty(&con->writequeue))
+		return NULL;
+
+	e = list_first_entry(&con->writequeue, struct writequeue_entry,
+			     list);
+	if (e->len == 0)
+		return NULL;
+
+	return e;
+}
+
 static struct connection *__find_con(int nodeid, int r)
 {
 	struct connection *con;
@@ -1647,10 +1663,9 @@ int dlm_lowcomms_resend_msg(struct dlm_msg *msg)
 /* Send a message */
 static void send_to_sock(struct connection *con)
 {
-	int ret = 0;
 	const int msg_flags = MSG_DONTWAIT | MSG_NOSIGNAL;
 	struct writequeue_entry *e;
-	int len, offset;
+	int len, offset, ret;
 	int count = 0;
 
 	mutex_lock(&con->sock_mutex);
@@ -1659,7 +1674,8 @@ static void send_to_sock(struct connection *con)
 
 	spin_lock(&con->writequeue_lock);
 	for (;;) {
-		if (list_empty(&con->writequeue))
+		e = con_next_wq(con);
+		if (!e)
 			break;
 
 		e = list_first_entry(&con->writequeue, struct writequeue_entry, list);
@@ -1668,25 +1684,22 @@ static void send_to_sock(struct connection *con)
 		BUG_ON(len == 0 && e->users == 0);
 		spin_unlock(&con->writequeue_lock);
 
-		ret = 0;
-		if (len) {
-			ret = kernel_sendpage(con->sock, e->page, offset, len,
-					      msg_flags);
-			if (ret == -EAGAIN || ret == 0) {
-				if (ret == -EAGAIN &&
-				    test_bit(SOCKWQ_ASYNC_NOSPACE, &con->sock->flags) &&
-				    !test_and_set_bit(CF_APP_LIMITED, &con->flags)) {
-					/* Notify TCP that we're limited by the
-					 * application window size.
-					 */
-					set_bit(SOCK_NOSPACE, &con->sock->flags);
-					con->sock->sk->sk_write_pending++;
-				}
-				cond_resched();
-				goto out;
-			} else if (ret < 0)
-				goto out;
-		}
+		ret = kernel_sendpage(con->sock, e->page, offset, len,
+				      msg_flags);
+		if (ret == -EAGAIN || ret == 0) {
+			if (ret == -EAGAIN &&
+			    test_bit(SOCKWQ_ASYNC_NOSPACE, &con->sock->flags) &&
+			    !test_and_set_bit(CF_APP_LIMITED, &con->flags)) {
+				/* Notify TCP that we're limited by the
+				 * application window size.
+				 */
+				set_bit(SOCK_NOSPACE, &con->sock->flags);
+				con->sock->sk->sk_write_pending++;
+			}
+			cond_resched();
+			goto out;
+		} else if (ret < 0)
+			goto out;
 
 		/* Don't starve people filling buffers */
 		if (++count >= MAX_SEND_MSG_COUNT) {
-- 
2.26.3

