Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4BFD9398AF5
	for <lists+cluster-devel@lfdr.de>; Wed,  2 Jun 2021 15:46:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622641586;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=h8ZncM6kScfwu+HTf54HzbP1C+HMGa8u2jiYgH/UcIQ=;
	b=JZcdv0SFM1Pw9WgEY3zGgiHyOK3etQk1MPuoQ0u//l8QfpAqn/xUfL0hpxpQwjnffdnzmT
	KfktuhwgEKgJ1qV5EenNy3vpo53KG8KvMyFCX4cidDtvoPwn63+RBOlCO4xLKRTeYdnWA1
	M/bNHCy14A2mzYNnGl6bgKnSRtIUjzA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-xrf36buPMDqr1M6BlHsC9A-1; Wed, 02 Jun 2021 09:46:23 -0400
X-MC-Unique: xrf36buPMDqr1M6BlHsC9A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A74A8A6381;
	Wed,  2 Jun 2021 13:45:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4197476206;
	Wed,  2 Jun 2021 13:45:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DB51944A59;
	Wed,  2 Jun 2021 13:45:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 152DjkFY029954 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 2 Jun 2021 09:45:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 61086100238C; Wed,  2 Jun 2021 13:45:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-116-136.rdu2.redhat.com [10.10.116.136])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B1D7110023AB;
	Wed,  2 Jun 2021 13:45:21 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed,  2 Jun 2021 09:45:15 -0400
Message-Id: <20210602134520.71030-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 1/6] fs: dlm: fix lowcomms_start
	error case
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

This patch fixes the error path handling in lowcomms_start(). We need to
cleanup some static allocated data structure and cleanup possible
workqueue if these have started.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 36adccc4f849..b71f7eafb808 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1803,10 +1803,15 @@ static void process_send_sockets(struct work_struct *work)
 
 static void work_stop(void)
 {
-	if (recv_workqueue)
+	if (recv_workqueue) {
 		destroy_workqueue(recv_workqueue);
-	if (send_workqueue)
+		recv_workqueue = NULL;
+	}
+
+	if (send_workqueue) {
 		destroy_workqueue(send_workqueue);
+		send_workqueue = NULL;
+	}
 }
 
 static int work_start(void)
@@ -1823,6 +1828,7 @@ static int work_start(void)
 	if (!send_workqueue) {
 		log_print("can't start dlm_send");
 		destroy_workqueue(recv_workqueue);
+		recv_workqueue = NULL;
 		return -ENOMEM;
 	}
 
@@ -1960,7 +1966,7 @@ int dlm_lowcomms_start(void)
 
 	error = work_start();
 	if (error)
-		goto fail;
+		goto fail_local;
 
 	dlm_allow_conn = 1;
 
@@ -1977,6 +1983,9 @@ int dlm_lowcomms_start(void)
 fail_unlisten:
 	dlm_allow_conn = 0;
 	dlm_close_sock(&listen_con.sock);
+	work_stop();
+fail_local:
+	deinit_local();
 fail:
 	return error;
 }
-- 
2.26.3

