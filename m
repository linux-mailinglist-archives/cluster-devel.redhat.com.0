Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A476799130
	for <lists+cluster-devel@lfdr.de>; Fri,  8 Sep 2023 22:46:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694205990;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8i20XpPtsujogswA6tCQeWhaFPbqbVSlf/77e4AtQNE=;
	b=d6pLGbUumb1Jk5b/9PF0atRctYRMvEFwDMcvKRbOacfpgYnIcJVp11duPhqsXPZlgPGDsP
	r9nMkBPDis19NRj/OecCuXkkZm6k0PXHIkQpLZ5qmkXCNuOk5h7JqMFOevBoOp+HscK2tg
	j/Gph1jF02tmXfgMGtU+LlWb1VhzmO4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-oMdHu-ySOuGLeCj4Q3mpIg-1; Fri, 08 Sep 2023 16:46:27 -0400
X-MC-Unique: oMdHu-ySOuGLeCj4Q3mpIg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 28019948703;
	Fri,  8 Sep 2023 20:46:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1A0634022FC;
	Fri,  8 Sep 2023 20:46:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DF0781946586;
	Fri,  8 Sep 2023 20:46:25 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 656BC194658C for <cluster-devel@listman.corp.redhat.com>;
 Fri,  8 Sep 2023 20:46:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5983C20BB074; Fri,  8 Sep 2023 20:46:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2FB0C21EE56C;
 Fri,  8 Sep 2023 20:46:24 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri,  8 Sep 2023 16:46:11 -0400
Message-Id: <20230908204611.1910601-10-aahringo@redhat.com>
In-Reply-To: <20230908204611.1910601-1-aahringo@redhat.com>
References: <20230908204611.1910601-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [RFC dlm/next 10/10] fs: dlm: do dlm message
 processing in softirq context
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
Cc: cluster-devel@redhat.com, gfs2@lists.linux.dev
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch change the dlm message parsing context from a workqueue to
a softirq context. This will hopefully speed up our dlm message
processing by removing a bunch of implicit scheduling points such a
cond_reched() depends on the preemption model setting. A softirq
(except PREEMPT_RT) can only be interrupted by other softirqs or
higher prio context such as hardware interrupts.

This patch will only move the dlm message parsing to the right context,
there exists more ideas to improve message parsing like using lockless
locking when doing read access on datastructures or enable a parallel
per node message processing. Further patches will improve those
behaviors. For now this patch will reduce the amount of interruptions
when doing DLM message parsing.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 34 ++++++++++------------------------
 1 file changed, 10 insertions(+), 24 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 28dd74aebc84..93f7e8827201 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -183,7 +183,6 @@ static int dlm_local_count;
 
 /* Work queues */
 static struct workqueue_struct *io_workqueue;
-static struct workqueue_struct *process_workqueue;
 
 static struct hlist_head connection_hash[CONN_HASH_SIZE];
 static DEFINE_SPINLOCK(connections_lock);
@@ -199,9 +198,9 @@ static const struct dlm_proto_ops *dlm_proto_ops;
 
 static void process_recv_sockets(struct work_struct *work);
 static void process_send_sockets(struct work_struct *work);
-static void process_dlm_messages(struct work_struct *work);
+static void process_dlm_messages(struct tasklet_struct *tasklet);
 
-static DECLARE_WORK(process_work, process_dlm_messages);
+static DECLARE_TASKLET(process_tasklet, process_dlm_messages);
 static DEFINE_SPINLOCK(processqueue_lock);
 static bool process_dlm_messages_pending;
 static atomic_t processqueue_count;
@@ -863,7 +862,7 @@ struct dlm_processed_nodes {
 	struct list_head list;
 };
 
-static void process_dlm_messages(struct work_struct *work)
+static void process_dlm_messages(struct tasklet_struct *tasklet)
 {
 	struct processqueue_entry *pentry;
 
@@ -971,7 +970,7 @@ static int receive_from_sock(struct connection *con, int buflen)
 	list_add_tail(&pentry->list, &processqueue);
 	if (!process_dlm_messages_pending) {
 		process_dlm_messages_pending = true;
-		queue_work(process_workqueue, &process_work);
+		tasklet_schedule(&process_tasklet);
 	}
 	spin_unlock_bh(&processqueue_lock);
 
@@ -1511,7 +1510,8 @@ static void process_recv_sockets(struct work_struct *work)
 		/* CF_RECV_PENDING cleared */
 		break;
 	case DLM_IO_FLUSH:
-		flush_workqueue(process_workqueue);
+		tasklet_disable(&process_tasklet);
+		tasklet_enable(&process_tasklet);
 		fallthrough;
 	case DLM_IO_RESCHED:
 		cond_resched();
@@ -1685,11 +1685,6 @@ static void work_stop(void)
 		destroy_workqueue(io_workqueue);
 		io_workqueue = NULL;
 	}
-
-	if (process_workqueue) {
-		destroy_workqueue(process_workqueue);
-		process_workqueue = NULL;
-	}
 }
 
 static int work_start(void)
@@ -1701,18 +1696,6 @@ static int work_start(void)
 		return -ENOMEM;
 	}
 
-	/* ordered dlm message process queue,
-	 * should be converted to a tasklet
-	 */
-	process_workqueue = alloc_ordered_workqueue("dlm_process",
-						    WQ_HIGHPRI | WQ_MEM_RECLAIM);
-	if (!process_workqueue) {
-		log_print("can't start dlm_process");
-		destroy_workqueue(io_workqueue);
-		io_workqueue = NULL;
-		return -ENOMEM;
-	}
-
 	return 0;
 }
 
@@ -1734,7 +1717,10 @@ void dlm_lowcomms_shutdown(void)
 		hlist_for_each_entry_rcu(con, &connection_hash[i], list) {
 			shutdown_connection(con, true);
 			stop_connection_io(con);
-			flush_workqueue(process_workqueue);
+
+			tasklet_disable(&process_tasklet);
+			tasklet_enable(&process_tasklet);
+
 			close_connection(con, true);
 
 			clean_one_writequeue(con);
-- 
2.31.1

