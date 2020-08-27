Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D194F254DEC
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Aug 2020 21:04:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598555047;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eTfgSsxsHHKLXPVEPZaSGful9ZoKYXLizop3/G+QEEg=;
	b=K6gLFRyuBiUomU+OtdX7kLxYpMdF1tKePPn2q/2r7l0iukdw1xCXf9zy6aMCGhRpjikRXD
	B2oHaJ9gngBpxML7Yz4phqqzIAqTBTPuabg7WigdxT0yo61/lLznGx+fITrE/pnPMn/ptK
	JhTzV7oescuXhAcy5BBiIRmdu+vkhtI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-dJbMJ8cTNpusgxInCa-Sag-1; Thu, 27 Aug 2020 15:04:05 -0400
X-MC-Unique: dJbMJ8cTNpusgxInCa-Sag-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6970710ABDBF;
	Thu, 27 Aug 2020 19:04:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CA6F5D9E8;
	Thu, 27 Aug 2020 19:04:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0C55E18408A1;
	Thu, 27 Aug 2020 19:04:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07RJ3wY2018121 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 27 Aug 2020 15:03:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3F56C1974D; Thu, 27 Aug 2020 19:03:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-114-193.rdu2.redhat.com [10.10.114.193])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B2EA219C71;
	Thu, 27 Aug 2020 19:03:57 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 27 Aug 2020 15:02:48 -0400
Message-Id: <20200827190254.719333-2-aahringo@redhat.com>
In-Reply-To: <20200827190254.719333-1-aahringo@redhat.com>
References: <20200827190254.719333-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 1/7] fs: dlm: synchronize dlm
	before shutdown
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

This patch moves the dlm workqueue dlm synchronization before shutdown
handling. The patch just flushes all pending work before starting to
shutdown the connection. At least for the send_workqeue we should flush
the workqueue to make sure there is no new connection handling going on
as dlm_allow_conn switch is turned to false before.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 5050fe05769b..ed098870ba0d 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1624,10 +1624,6 @@ static void work_flush(void)
 	struct hlist_node *n;
 	struct connection *con;
 
-	if (recv_workqueue)
-		flush_workqueue(recv_workqueue);
-	if (send_workqueue)
-		flush_workqueue(send_workqueue);
 	do {
 		ok = 1;
 		foreach_conn(stop_conn);
@@ -1659,6 +1655,12 @@ void dlm_lowcomms_stop(void)
 	mutex_lock(&connections_lock);
 	dlm_allow_conn = 0;
 	mutex_unlock(&connections_lock);
+
+	if (recv_workqueue)
+		flush_workqueue(recv_workqueue);
+	if (send_workqueue)
+		flush_workqueue(send_workqueue);
+
 	foreach_conn(shutdown_conn);
 	work_flush();
 	clean_writequeues();
-- 
2.26.2

