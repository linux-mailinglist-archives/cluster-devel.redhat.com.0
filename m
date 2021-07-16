Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9BC253CBDB4
	for <lists+cluster-devel@lfdr.de>; Fri, 16 Jul 2021 22:23:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626466991;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lokKQYYd+We18p8bpuPS5f8WJRMEVRNTCq1S3IfLAgM=;
	b=XtXzGj/qMhFu4f/7i7ne3jLyANpA8BDOBh1sityQSnV1loahqEW94VHr+ZQTmKCt4kHlOf
	obAyfLhWS0n+2/9M/rZ3YEQ+tgRHN53F6df/XOLxoHcGQ5nCwy45NLervuArzuRPKF0K8a
	HJBfGiuwe6KiJ+bGNyj1nG5cyLJnlfU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-60Yf2EY4MRelAHB0JAK63A-1; Fri, 16 Jul 2021 16:23:10 -0400
X-MC-Unique: 60Yf2EY4MRelAHB0JAK63A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B93119057A5;
	Fri, 16 Jul 2021 20:23:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EFA060862;
	Fri, 16 Jul 2021 20:23:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0E19C1809C9A;
	Fri, 16 Jul 2021 20:23:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16GKN4tH026079 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 16 Jul 2021 16:23:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E003E5D6D5; Fri, 16 Jul 2021 20:23:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9E0955D6AB;
	Fri, 16 Jul 2021 20:23:04 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 16 Jul 2021 16:22:39 -0400
Message-Id: <20210716202245.1262791-7-aahringo@redhat.com>
In-Reply-To: <20210716202245.1262791-1-aahringo@redhat.com>
References: <20210716202245.1262791-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v5.14-rc1 06/12] fs: dlm: introduce
	con_next_wq helper
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
index 1bdd24bce709..9d21a8b9e9fb 100644
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
@@ -1646,10 +1662,9 @@ int dlm_lowcomms_resend_msg(struct dlm_msg *msg)
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
@@ -1658,7 +1673,8 @@ static void send_to_sock(struct connection *con)
 
 	spin_lock(&con->writequeue_lock);
 	for (;;) {
-		if (list_empty(&con->writequeue))
+		e = con_next_wq(con);
+		if (!e)
 			break;
 
 		e = list_first_entry(&con->writequeue, struct writequeue_entry, list);
@@ -1667,25 +1683,22 @@ static void send_to_sock(struct connection *con)
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
2.27.0

