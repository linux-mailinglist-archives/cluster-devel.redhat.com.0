Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5C7963BBF64
	for <lists+cluster-devel@lfdr.de>; Mon,  5 Jul 2021 17:29:51 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-jSPf06PJPpuav_tiJsduuQ-1; Mon, 05 Jul 2021 11:29:49 -0400
X-MC-Unique: jSPf06PJPpuav_tiJsduuQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BF76804140;
	Mon,  5 Jul 2021 15:29:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 276F32EB03;
	Mon,  5 Jul 2021 15:29:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 132B34EA2A;
	Mon,  5 Jul 2021 15:29:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 165FTiSC031978 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 5 Jul 2021 11:29:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B0D44200C0E0; Mon,  5 Jul 2021 15:29:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC10C2028104
	for <cluster-devel@redhat.com>; Mon,  5 Jul 2021 15:29:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63A1718A01A5
	for <cluster-devel@redhat.com>; Mon,  5 Jul 2021 15:29:43 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-562-mf5vg4MSNNiGNuncPSjFOQ-1;
	Mon, 05 Jul 2021 11:29:38 -0400
X-MC-Unique: mf5vg4MSNNiGNuncPSjFOQ-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id D930C6198B;
	Mon,  5 Jul 2021 15:29:36 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Mon,  5 Jul 2021 11:28:40 -0400
Message-Id: <20210705152913.1521036-19-sashal@kernel.org>
In-Reply-To: <20210705152913.1521036-1-sashal@kernel.org>
References: <20210705152913.1521036-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH AUTOSEL 5.12 19/52] fs: dlm: fix
	lowcomms_start error case
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Alexander Aring <aahringo@redhat.com>

[ Upstream commit fcef0e6c27ce109d2c617aa12f0bfd9f7ff47d38 ]

This patch fixes the error path handling in lowcomms_start(). We need to
cleanup some static allocated data structure and cleanup possible
workqueue if these have started.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
Signed-off-by: David Teigland <teigland@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/dlm/lowcomms.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 7e6736c70e11..d2a0ea0acca3 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1600,10 +1600,15 @@ static void process_send_sockets(struct work_struct *work)
 
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
@@ -1620,6 +1625,7 @@ static int work_start(void)
 	if (!send_workqueue) {
 		log_print("can't start dlm_send");
 		destroy_workqueue(recv_workqueue);
+		recv_workqueue = NULL;
 		return -ENOMEM;
 	}
 
@@ -1751,7 +1757,7 @@ int dlm_lowcomms_start(void)
 
 	error = work_start();
 	if (error)
-		goto fail;
+		goto fail_local;
 
 	dlm_allow_conn = 1;
 
@@ -1768,6 +1774,9 @@ int dlm_lowcomms_start(void)
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
2.30.2

