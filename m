Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 57108398AF3
	for <lists+cluster-devel@lfdr.de>; Wed,  2 Jun 2021 15:46:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622641584;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SSQMu6CcOfbZrzgLRnvDPI7g0o5p5hSerAgIpbwJR5Y=;
	b=Kk8rVNsTUzEvr69immY2Lzg8InEKo2GGYzpTJ1K7XH/QAJGMPVpv8xu6aMnLNxMmXbGXUB
	1dH3LrSgTz5IxZhztOsY4G7T3wDvzJcucTSLpGJVBEh7uX3hWSwR27fkEDgHZ2KhEjVHSL
	7plFe56s6+R/FkLGdQymxnK6t38ooBU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-jSGOFctjOtqd_emE1xe-1w-1; Wed, 02 Jun 2021 09:46:22 -0400
X-MC-Unique: jSGOFctjOtqd_emE1xe-1w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB1CA1090135;
	Wed,  2 Jun 2021 13:45:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7682074ADB;
	Wed,  2 Jun 2021 13:45:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 58E1044A58;
	Wed,  2 Jun 2021 13:45:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 152DjmsU029969 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 2 Jun 2021 09:45:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E67311045EA9; Wed,  2 Jun 2021 13:45:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-116-136.rdu2.redhat.com [10.10.116.136])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 26FDA10023AB;
	Wed,  2 Jun 2021 13:45:47 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed,  2 Jun 2021 09:45:17 -0400
Message-Id: <20210602134520.71030-3-aahringo@redhat.com>
In-Reply-To: <20210602134520.71030-1-aahringo@redhat.com>
References: <20210602134520.71030-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 3/6] fs: dlm: use
	alloc_ordered_workqueue
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

The proper way to allocate ordered workqueues is to use
alloc_ordered_workqueue() function. The current way implies an ordered
workqueue which is also required by dlm.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index b71f7eafb808..02b636d113fb 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1816,15 +1816,13 @@ static void work_stop(void)
 
 static int work_start(void)
 {
-	recv_workqueue = alloc_workqueue("dlm_recv",
-					 WQ_UNBOUND | WQ_MEM_RECLAIM, 1);
+	recv_workqueue = alloc_ordered_workqueue("dlm_recv", WQ_MEM_RECLAIM);
 	if (!recv_workqueue) {
 		log_print("can't start dlm_recv");
 		return -ENOMEM;
 	}
 
-	send_workqueue = alloc_workqueue("dlm_send",
-					 WQ_UNBOUND | WQ_MEM_RECLAIM, 1);
+	send_workqueue = alloc_ordered_workqueue("dlm_send", WQ_MEM_RECLAIM);
 	if (!send_workqueue) {
 		log_print("can't start dlm_send");
 		destroy_workqueue(recv_workqueue);
-- 
2.26.3

