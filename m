Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EFD67B901
	for <lists+cluster-devel@lfdr.de>; Wed, 25 Jan 2023 19:08:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674670096;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WlMDgIbl3L5fwon2RYybTDdBTOojmIYTHeU3g7uPS1k=;
	b=JoaPHOzfO8/u6q9N/HAysfLzA1eSdBIdETF3i8IYQArK1PrwQKnD6p65ajY4EvaL6xSqjY
	S79CE99QrifK8crJQqhfRYbhCE8A0irjMwOKQNs8DcYnsd3gAzqwH74grWOrDvijvYR0Gd
	Yo4f5iS3hMTpsmXwZZfazITDoI1Rugw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-mz_9af3BORqOvC66WRKZfw-1; Wed, 25 Jan 2023 13:08:12 -0500
X-MC-Unique: mz_9af3BORqOvC66WRKZfw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8EAED85D061;
	Wed, 25 Jan 2023 18:08:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 65C242026D4B;
	Wed, 25 Jan 2023 18:08:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 21F721946595;
	Wed, 25 Jan 2023 18:08:10 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 49395194658C for <cluster-devel@listman.corp.redhat.com>;
 Wed, 25 Jan 2023 18:08:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F2BDF14171C0; Wed, 25 Jan 2023 18:08:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC7D114171BB;
 Wed, 25 Jan 2023 18:08:08 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 25 Jan 2023 13:08:07 -0500
Message-Id: <20230125180807.1460787-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCH dlm/next] fs: dlm: add unbound flag to
 dlm_io workqueue
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch will add the WQ_UNBOUND flag to the lowcomms dlm_io workqueue
which handles socket io handling to send and receive dlm messages.
The amount of sockets will be 2 for a 3 node cluster. Each socket has
two different workers for doing send and receive work by calling socket
API functionality. Each worker will do their task in order to send dlm
messages in a ordered stream based socket communication. On receive
side the receive buffer will be queued up for an ordered dlm_process
workqueue to parse received dlm messages. The parsing need to be done
currently in an ordered synchronized way because the dlm message processing
is not being made to parse parallel.

After explaining all those workqueue behaviours in lowcomms, the dlm_io
workqueue is only being used for socket handling. Each socket handling
has 2 workers (send and receive). In a 3 cluster node we will end up
with 4 workers. Without the WQ_UNBOUND flag the workers are tight to a
CPU and can never switch, this could be an advantage because local CPU
execution. However with dlm_locktorture testcase I expierenced not all
workers are always in use and my assumption is that some workers are
bound to the same CPU. We should always send or receive when we are
ready to do so, one reason why we disable nigel algorithm on sockets.
We should be safe to do the socket io handling on any CPU which can be
switched during runtime. There is no assumption that the worker stays on
the same CPU. There is no need to respect any workqueue concurrency
model that each worker can only run on one CPU. Lowcomms queue_work()
mechanism has an higher level flag to be sure that it can't schedule
work if the previous worker did not signal it to keep ordered socket
handling. Therefore this patch sets the WQ_UNBOUND flag to allow workers
being executed by any available CPU.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 61cd6c2628fa..07b9221dcae3 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1712,8 +1712,8 @@ static void work_stop(void)
 
 static int work_start(void)
 {
-	io_workqueue = alloc_workqueue("dlm_io", WQ_HIGHPRI | WQ_MEM_RECLAIM,
-				       0);
+	io_workqueue = alloc_workqueue("dlm_io", WQ_HIGHPRI | WQ_MEM_RECLAIM |
+				       WQ_UNBOUND, 0);
 	if (!io_workqueue) {
 		log_print("can't start dlm_io");
 		return -ENOMEM;
-- 
2.31.1

