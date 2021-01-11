Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 287002F1D65
	for <lists+cluster-devel@lfdr.de>; Mon, 11 Jan 2021 19:03:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610388234;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lzazIn3TB6kLM7fQ7uwo3Bk6GW2Q2wxL36OERa7r/Ic=;
	b=QzaTXvhz2I92Sre0N0/1VM6HfLM1Rnuotu3IeKuHCqAxMplfhrTPZhIQHBRBIP2pShtjXY
	QWyUzxovVfTlJy7WZvwULPJkLYbYsUqsa5niv8Dl7h4kl2wmn/biYskE5hSQyykiyYE35V
	vJXn03/UEJDcgyyP2NVf3ckDO7y2NMk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-c-yMhg7YOY-DfvxZrqFgIQ-1; Mon, 11 Jan 2021 13:03:52 -0500
X-MC-Unique: c-yMhg7YOY-DfvxZrqFgIQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C4A6879519;
	Mon, 11 Jan 2021 18:03:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 03CEE60BE2;
	Mon, 11 Jan 2021 18:03:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E33EB5002C;
	Mon, 11 Jan 2021 18:03:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10BI3l9N032392 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 11 Jan 2021 13:03:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BC4745D9FC; Mon, 11 Jan 2021 18:03:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-116-187.rdu2.redhat.com [10.10.116.187])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 712275D9DB;
	Mon, 11 Jan 2021 18:03:44 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 11 Jan 2021 13:03:06 -0500
Message-Id: <20210111180310.122451-17-aahringo@redhat.com>
In-Reply-To: <20210111180310.122451-1-aahringo@redhat.com>
References: <20210111180310.122451-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv4 dlm/next 16/20] fs: dlm: add per node
	receive flush
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch will add a functionality to flush pending dlm messages from
the receiving workqueue. Upcoming patches will use it to make sure that
nothing can be received e.g. after a node gets removed from the nodes
hash. Receiving messages will occur into a node lookup which might
create an node for the hash again.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 9 +++++++++
 fs/dlm/lowcomms.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 9a3899ad1765..0e4cbabc680f 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1607,6 +1607,15 @@ static void clean_one_writequeue(struct connection *con)
 	spin_unlock_bh(&con->writequeue_lock);
 }
 
+void dlm_lowcomms_rx_flush(int nodeid)
+{
+	struct connection *con;
+
+	con = nodeid2con(nodeid, 0);
+	if (con)
+		flush_work(&con->rwork);
+}
+
 /* Called from recovery when it knows that a node has
    left the cluster */
 int dlm_lowcomms_close(int nodeid)
diff --git a/fs/dlm/lowcomms.h b/fs/dlm/lowcomms.h
index 8286531f9a9e..c4c789a68cf6 100644
--- a/fs/dlm/lowcomms.h
+++ b/fs/dlm/lowcomms.h
@@ -39,6 +39,7 @@ int dlm_lowcomms_addr(int nodeid, struct sockaddr_storage *addr, int len);
 void dlm_lowcomms_put_buffer(void *mh);
 void dlm_lowcomms_get_buffer(void *mh);
 void dlm_lowcomms_resend_buffer(void *mh);
+void dlm_lowcomms_rx_flush(int nodeid);
 
 #endif				/* __LOWCOMMS_DOT_H__ */
 
-- 
2.26.2

