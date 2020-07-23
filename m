Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id D98BF22B1CA
	for <lists+cluster-devel@lfdr.de>; Thu, 23 Jul 2020 16:49:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595515778;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PH3mra/xj+6vqY+ZppYjbTfFu4zZUlVbNQTyWYN4qbw=;
	b=duyjZUQf4Kf2T4/Cf+WQoOCGi241nu3Hj0z+iOsisnDyERhhLsusLhFpZ0t+Fhb0e7ICQ2
	5gNYjV4Frgw5qmbYpg90Vi5rL/Y5LX6RcF6EFXP5X6yj+yGXF6yXm6INFUerdDBVLNCL/w
	xziT7RnpBBswSiTzb7qC+4QOZN8EIBQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-k0q-UqqvOOi5vA29QPHqCw-1; Thu, 23 Jul 2020 10:49:37 -0400
X-MC-Unique: k0q-UqqvOOi5vA29QPHqCw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96EE5805721;
	Thu, 23 Jul 2020 14:49:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 59D30741A0;
	Thu, 23 Jul 2020 14:49:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3419F1809557;
	Thu, 23 Jul 2020 14:49:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06NEnUu1009065 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 23 Jul 2020 10:49:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 11E0719D7C; Thu, 23 Jul 2020 14:49:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-118-215.rdu2.redhat.com [10.10.118.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6AB5C19D7B;
	Thu, 23 Jul 2020 14:49:29 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 23 Jul 2020 10:49:05 -0400
Message-Id: <20200723144908.271110-2-aahringo@redhat.com>
In-Reply-To: <20200723144908.271110-1-aahringo@redhat.com>
References: <20200723144908.271110-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm-next 1/4] fs: dlm: don't close socket on
	invalid message
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

This patch doesn't close sockets when there is an invalid dlm message
received. The connection will probably reconnect anyway so. To not
close the connection will reduce the number of possible failtures.
As we don't have a different strategy to react on such scenario
just keep going the connection and ignore the message.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 3fa1b93dbbc7e..ec7ed228a9843 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -690,8 +690,6 @@ static int receive_from_sock(struct connection *con)
 			  page_address(con->rx_page), con->cb.base,
 			  con->cb.len, r);
 	}
-	if (ret < 0)
-		goto out_close;
 	cbuf_eat(&con->cb, ret);
 
 	if (cbuf_empty(&con->cb) && !call_again_soon) {
-- 
2.26.2

