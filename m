Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id DC73F22ECF0
	for <lists+cluster-devel@lfdr.de>; Mon, 27 Jul 2020 15:14:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595855656;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=A2R9DEFkxC76e+5Vthc2k5G0S7eT4VPgZoCrbjvkDzk=;
	b=EaqJ6tdpLrQRREwUUV14n5voysWXDs7gjCBQ4qC6AEqmlvm+yF+GZys7pUVekebXtZoG9n
	VgGlsWEYYBoFXBFnsAixV1A31MptVswdqcXb3KVmteAvhJLEq2KbC2bAOodi2e2T/XnzXQ
	XLHZMh2N72k439brML4RurJ2fmef1Rs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-ZUs7eOhEONiBMkxYoJufEg-1; Mon, 27 Jul 2020 09:14:13 -0400
X-MC-Unique: ZUs7eOhEONiBMkxYoJufEg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9419100AA2F;
	Mon, 27 Jul 2020 13:14:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 73D87712D8;
	Mon, 27 Jul 2020 13:14:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4ADA195493;
	Mon, 27 Jul 2020 13:14:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06RDE5BK012190 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 27 Jul 2020 09:14:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1B34670110; Mon, 27 Jul 2020 13:14:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-112-138.rdu2.redhat.com [10.10.112.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9307B60BF4;
	Mon, 27 Jul 2020 13:14:04 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 27 Jul 2020 09:13:37 -0400
Message-Id: <20200727131338.9111-3-aahringo@redhat.com>
In-Reply-To: <20200727131338.9111-1-aahringo@redhat.com>
References: <20200727131338.9111-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 dlm-next 2/3] fs: dlm: change handling of
	reconnects
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

This patch changes the handling of reconnects. At first we only close
the connection related to the communication failure. If we get a new
connection for an already existing connection we close the existing
connection and take the new one.

This patch improves significantly the stability of tcp connections while
running "tcpkill -9 -i $IFACE port 21064" while generating a lot of dlm
messages e.g. on a gfs2 mount and [0]. My test setup shows that a
deadlock is "more" unlikely. Before this patch I wasn't able to get
not a deadlock after 5 seconds. After this patch my observation is
that it's more likely to survive after 5 seconds and more, but still a
deadlock occurs after certain time. My guess is that there are still
"segments" inside the tcp writequeue or retransmit queue which get dropped
when receiving a tcp reset [1]. Hard to reproduce because the right message
need to be inside these queues, which might even be in the 5 first seconds
with this patch.

[0] https://fedorapeople.org/cgit/teigland/public_git/dct-stuff.git/tree/fs/make_panic
[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/net/ipv4/tcp_input.c?h=v5.8-rc6#n4122

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 9e6acbb47bb9a..289439fdca996 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -713,7 +713,7 @@ static int receive_from_sock(struct connection *con)
 out_close:
 	mutex_unlock(&con->sock_mutex);
 	if (ret != -EAGAIN) {
-		close_connection(con, true, true, false);
+		close_connection(con, false, true, false);
 		/* Reconnect when there is something to send */
 	}
 	/* Don't return success if we really got EOF */
@@ -804,21 +804,16 @@ static int accept_from_sock(struct connection *con)
 			INIT_WORK(&othercon->swork, process_send_sockets);
 			INIT_WORK(&othercon->rwork, process_recv_sockets);
 			set_bit(CF_IS_OTHERCON, &othercon->flags);
+		} else {
+			/* close other sock con if we have something new */
+			close_connection(othercon, false, true, false);
 		}
+
 		mutex_lock_nested(&othercon->sock_mutex, 2);
-		if (!othercon->sock) {
-			newcon->othercon = othercon;
-			add_sock(newsock, othercon);
-			addcon = othercon;
-			mutex_unlock(&othercon->sock_mutex);
-		}
-		else {
-			printk("Extra connection from node %d attempted\n", nodeid);
-			result = -EAGAIN;
-			mutex_unlock(&othercon->sock_mutex);
-			mutex_unlock(&newcon->sock_mutex);
-			goto accept_err;
-		}
+		newcon->othercon = othercon;
+		add_sock(newsock, othercon);
+		addcon = othercon;
+		mutex_unlock(&othercon->sock_mutex);
 	}
 	else {
 		newcon->rx_action = receive_from_sock;
@@ -1415,7 +1410,7 @@ static void send_to_sock(struct connection *con)
 
 send_error:
 	mutex_unlock(&con->sock_mutex);
-	close_connection(con, true, false, true);
+	close_connection(con, false, false, true);
 	/* Requeue the send work. When the work daemon runs again, it will try
 	   a new connection, then call this function again. */
 	queue_work(send_workqueue, &con->swork);
-- 
2.26.2

