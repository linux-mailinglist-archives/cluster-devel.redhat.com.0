Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8EA2322ECEF
	for <lists+cluster-devel@lfdr.de>; Mon, 27 Jul 2020 15:14:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595855656;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=G9QtLfL5PsMN3cV2c61j1E84OuvrjBFQ59IVxaJC14o=;
	b=QINqs/ZEhahJ+RQlTDaoIvB1An9HwXa7PTzAdZlO9K3SJH4hUvlip/h3vLQv7IXSYFvgqW
	lqMAdf65lz/glzanhy74QOQjYQuYk5K5BdlIa7lNo2969IXQgCqAcLfnlB5HzOe4JeGW4r
	GKqSpkkriLEZNqOJoHJNW5Jm9r6sNB0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-TdcZNCe6MTiEQQeYNzqQHg-1; Mon, 27 Jul 2020 09:14:13 -0400
X-MC-Unique: TdcZNCe6MTiEQQeYNzqQHg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5927D80BCB3;
	Mon, 27 Jul 2020 13:14:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 48C9719D82;
	Mon, 27 Jul 2020 13:14:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D076B9549B;
	Mon, 27 Jul 2020 13:14:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06RDE4Ve012178 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 27 Jul 2020 09:14:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6CD566842F; Mon, 27 Jul 2020 13:14:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-112-138.rdu2.redhat.com [10.10.112.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E40EC60BF4;
	Mon, 27 Jul 2020 13:14:03 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 27 Jul 2020 09:13:36 -0400
Message-Id: <20200727131338.9111-2-aahringo@redhat.com>
In-Reply-To: <20200727131338.9111-1-aahringo@redhat.com>
References: <20200727131338.9111-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 dlm-next 1/3] fs: dlm: don't close socket
	on invalid message
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

This patch doesn't close sockets when there is an invalid dlm message
received. The connection will probably reconnect anyway so. To not
close the connection will reduce the number of possible failtures.
As we don't have a different strategy to react on such scenario
just keep going the connection and ignore the message.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 3fa1b93dbbc7e..9e6acbb47bb9a 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -685,14 +685,14 @@ static int receive_from_sock(struct connection *con)
 					  page_address(con->rx_page),
 					  con->cb.base, con->cb.len,
 					  PAGE_SIZE);
-	if (ret == -EBADMSG) {
-		log_print("lowcomms: addr=%p, base=%u, len=%u, read=%d",
-			  page_address(con->rx_page), con->cb.base,
+	if (ret < 0) {
+		log_print("lowcomms err %d: addr=%p, base=%u, len=%u, read=%d",
+			  ret, page_address(con->rx_page), con->cb.base,
 			  con->cb.len, r);
+		cbuf_eat(&con->cb, r);
+	} else {
+		cbuf_eat(&con->cb, ret);
 	}
-	if (ret < 0)
-		goto out_close;
-	cbuf_eat(&con->cb, ret);
 
 	if (cbuf_empty(&con->cb) && !call_again_soon) {
 		__free_page(con->rx_page);
-- 
2.26.2

