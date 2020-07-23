Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 0490522B1CD
	for <lists+cluster-devel@lfdr.de>; Thu, 23 Jul 2020 16:49:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595515793;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LkzPoVu76sA+ur1eYNfVoOMSlSzXy94D+4cif6CSf4M=;
	b=i7LVjsRK9Iv3oLTWPDWgBujB2pG2EihvkrVB7WgiOJYSrs1E+kyw/cWU1OClZN+CJi8wCo
	MAN+GPnP636QoPFxSm7EtIwxiPzfksid+VedhwLxl+x62iPoiji4z6PhZiEGqg50mKwShy
	nR0iKY77fvN818YBbBFN8y+bUWYm2Y8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-OM8FEZdiPHCYqsxqrKbKUA-1; Thu, 23 Jul 2020 10:49:38 -0400
X-MC-Unique: OM8FEZdiPHCYqsxqrKbKUA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18352107B7F2;
	Thu, 23 Jul 2020 14:49:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04E8D5C1BB;
	Thu, 23 Jul 2020 14:49:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E5A8A1809561;
	Thu, 23 Jul 2020 14:49:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06NEnVnI009087 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 23 Jul 2020 10:49:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B636D19D7E; Thu, 23 Jul 2020 14:49:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-118-215.rdu2.redhat.com [10.10.118.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1A26319D7B;
	Thu, 23 Jul 2020 14:49:31 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 23 Jul 2020 10:49:07 -0400
Message-Id: <20200723144908.271110-4-aahringo@redhat.com>
In-Reply-To: <20200723144908.271110-1-aahringo@redhat.com>
References: <20200723144908.271110-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm-next 3/4] fs: dlm: change handling of
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
index 19b50d69babef..f5ac40db5e7c1 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -711,7 +711,7 @@ static int receive_from_sock(struct connection *con)
 out_close:
 	mutex_unlock(&con->sock_mutex);
 	if (ret != -EAGAIN) {
-		close_connection(con, true, true, false);
+		close_connection(con, false, true, false);
 		/* Reconnect when there is something to send */
 	}
 	/* Don't return success if we really got EOF */
@@ -802,21 +802,16 @@ static int accept_from_sock(struct connection *con)
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
@@ -1413,7 +1408,7 @@ static void send_to_sock(struct connection *con)
 
 send_error:
 	mutex_unlock(&con->sock_mutex);
-	close_connection(con, true, false, true);
+	close_connection(con, false, false, true);
 	/* Requeue the send work. When the work daemon runs again, it will try
 	   a new connection, then call this function again. */
 	queue_work(send_workqueue, &con->swork);
-- 
2.26.2

