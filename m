Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 9707422B1CB
	for <lists+cluster-devel@lfdr.de>; Thu, 23 Jul 2020 16:49:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595515780;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qNeCbIWGXn/z7UKMKTn4UZyxwkfjdmKLmD+hGNWbjKM=;
	b=eXCrisQqu88zn2BZvjCPwosspEKLJMxpXl1cC0rhtT3z1eYojBF/Obriji0yJ6VMamXRVd
	kDisiupLNcwPyldDWyrWZZukBwb77b0S7/5IxNmhN35HrAlZx9W/AC6TDNTo/v39IdM403
	Jz8oI9/4HA7eicfZKtMn+ZVx6pQ+2gY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-z9bfRvzfMZO8Fck54i57eA-1; Thu, 23 Jul 2020 10:49:38 -0400
X-MC-Unique: z9bfRvzfMZO8Fck54i57eA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5DD3E1DE6;
	Thu, 23 Jul 2020 14:49:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4405E5C1BB;
	Thu, 23 Jul 2020 14:49:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5FEFF1809561;
	Thu, 23 Jul 2020 14:49:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06NEnUhh009072 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 23 Jul 2020 10:49:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DDC1319D7E; Thu, 23 Jul 2020 14:49:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-118-215.rdu2.redhat.com [10.10.118.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4273419930;
	Thu, 23 Jul 2020 14:49:30 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 23 Jul 2020 10:49:06 -0400
Message-Id: <20200723144908.271110-3-aahringo@redhat.com>
In-Reply-To: <20200723144908.271110-1-aahringo@redhat.com>
References: <20200723144908.271110-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm-next 2/4] fs: dlm: fix report error of
	invalid messages
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

This patch fix the error reporting of invalid messages, the return value
of -EBADMSG is never returned by dlm_process_incoming_buffer(), so we
just check for negative return values.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index ec7ed228a9843..19b50d69babef 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -685,9 +685,9 @@ static int receive_from_sock(struct connection *con)
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
 	}
 	cbuf_eat(&con->cb, ret);
-- 
2.26.2

