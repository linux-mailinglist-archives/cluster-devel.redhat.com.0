Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7B1403814A7
	for <lists+cluster-devel@lfdr.de>; Sat, 15 May 2021 02:36:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621038978;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pVGlcpplTqNiT22U0fDY9MalgXYxr9pQdT1GXLUA5LU=;
	b=JyoxEDZTFhSGayfL8CRLn9NXahiXWIYdj5pFWFiO4jVTvKxq7qGj7fW/BX9ZA8QpiFM2c6
	dUHpLTf2tn66toV49obYT/DGX37TNRS8JJ0d1z7dwj5MRPa7HTUx3G+92nNUim6m9xqoE8
	Epsrgx4VK6VgRqQjAGxykTjxKIcgVP8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-BMZ5SfjYOz2Z8_LTsivCWg-1; Fri, 14 May 2021 20:36:16 -0400
X-MC-Unique: BMZ5SfjYOz2Z8_LTsivCWg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B2AC64165;
	Sat, 15 May 2021 00:36:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1890910016FC;
	Sat, 15 May 2021 00:36:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 03BF6180B463;
	Sat, 15 May 2021 00:36:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14F0aDr9030933 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 14 May 2021 20:36:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 970435DDAD; Sat, 15 May 2021 00:36:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-135.rdu2.redhat.com [10.10.115.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1AD8C5D9E3;
	Sat, 15 May 2021 00:36:13 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 14 May 2021 20:35:46 -0400
Message-Id: <20210515003549.1118171-13-aahringo@redhat.com>
In-Reply-To: <20210515003549.1118171-1-aahringo@redhat.com>
References: <20210515003549.1118171-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, gnault@redhat.com, pabeni@redhat.com
Subject: [Cluster-devel] [PATCHv5 v5.13-rc1 dlm/next 12/15] fs: dlm: add
	force flush of writequeue function
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch adds functionality that the user can force flush dlm messages
in lowcomms writequeue in midcomms reset cases to flush all pending
messages of lowcomms functionality.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 27 +++++++++++++++++++++++++++
 fs/dlm/lowcomms.h |  1 +
 2 files changed, 28 insertions(+)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 6c59bf4cc514..d9b7dafcf924 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1703,6 +1703,33 @@ static void clean_one_writequeue(struct connection *con)
 	spin_unlock(&con->writequeue_lock);
 }
 
+int dlm_lowcomms_flush(int nodeid, bool cancel_rx)
+{
+	struct connection *con;
+	int idx;
+
+	log_print("flush writequeue of node %d", nodeid);
+	idx = srcu_read_lock(&connections_srcu);
+	con = nodeid2con(nodeid, 0);
+	if (con) {
+		cancel_work_sync(&con->swork);
+		if (cancel_rx)
+			cancel_work_sync(&con->rwork);
+
+		clean_one_writequeue(con);
+		if (con->othercon) {
+			cancel_work_sync(&con->othercon->swork);
+			if (cancel_rx)
+				cancel_work_sync(&con->othercon->rwork);
+
+			clean_one_writequeue(con->othercon);
+		}
+	}
+	srcu_read_unlock(&connections_srcu, idx);
+
+	return 0;
+}
+
 /* Called from recovery when it knows that a node has
    left the cluster */
 int dlm_lowcomms_close(int nodeid)
diff --git a/fs/dlm/lowcomms.h b/fs/dlm/lowcomms.h
index 66dc1bb3de7f..8d74bb2e53e1 100644
--- a/fs/dlm/lowcomms.h
+++ b/fs/dlm/lowcomms.h
@@ -41,6 +41,7 @@ int dlm_lowcomms_resend_msg(struct dlm_msg *msg);
 int dlm_lowcomms_connect_node(int nodeid);
 int dlm_lowcomms_nodes_set_mark(int nodeid, unsigned int mark);
 int dlm_lowcomms_addr(int nodeid, struct sockaddr_storage *addr, int len);
+int dlm_lowcomms_flush(int nodeid, bool cancel_rx);
 
 #endif				/* __LOWCOMMS_DOT_H__ */
 
-- 
2.26.3

