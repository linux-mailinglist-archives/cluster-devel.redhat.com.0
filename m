Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 68C742B28E3
	for <lists+cluster-devel@lfdr.de>; Fri, 13 Nov 2020 23:58:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605308326;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xmy533lwYGNEZSemdfgXYsYM1ZH37Q1DqgnF/FadT+g=;
	b=dhH+Ay1O20rE4HPpd7hRHl7LZ1bYLAMTq0hyrhGS1Jc85JVpEtiaGoPrTPp34PpF+RvonT
	53w2wJYT7eApr8oj8vnVg8P3vPejJDEI8BBaTcxDSCBqIMl/Rpt4A9dJOUenpX+QW4E3Nb
	PvPFVUsKe5T/X/crp1pl0Ld4IOUAKLI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-gbMZp7dYP5WM749DRSrmbA-1; Fri, 13 Nov 2020 17:58:44 -0500
X-MC-Unique: gbMZp7dYP5WM749DRSrmbA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0996357096;
	Fri, 13 Nov 2020 22:58:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E97D217B75;
	Fri, 13 Nov 2020 22:58:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D55FB58104;
	Fri, 13 Nov 2020 22:58:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ADMwbkj004007 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 13 Nov 2020 17:58:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 94F3A5C70C; Fri, 13 Nov 2020 22:58:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-117-120.rdu2.redhat.com [10.10.117.120])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 21B0F5C882;
	Fri, 13 Nov 2020 22:58:37 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 13 Nov 2020 17:58:07 -0500
Message-Id: <20201113225814.461167-10-aahringo@redhat.com>
In-Reply-To: <20201113225814.461167-1-aahringo@redhat.com>
References: <20201113225814.461167-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [RFC PATCH dlm/next 09/16] fs: dlm: make new buffer
	handling softirq ready
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch makes the writequeue and message handling ready to be called
from a softirq by using spinlock handling to stop software interrupts
on local cpu while they are hold. The coming midcomms retransmit
handling will introduce a timer which is using this functionality when
the timer expires.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 3e1ddcb3f69b..3c133cd2ff22 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1391,7 +1391,7 @@ static struct writequeue_entry *new_wq_entry(struct connection *con, int len,
 {
 	struct writequeue_entry *e;
 
-	spin_lock(&con->writequeue_lock);
+	spin_lock_bh(&con->writequeue_lock);
 	if (!list_empty(&con->writequeue)) {
 		e = list_last_entry(&con->writequeue, struct writequeue_entry, list);
 		if (DLM_WQ_REMAIN_BYTES(e) >= len) {
@@ -1403,12 +1403,12 @@ static struct writequeue_entry *new_wq_entry(struct connection *con, int len,
 
 			e->end += len;
 			e->users++;
-			spin_unlock(&con->writequeue_lock);
+			spin_unlock_bh(&con->writequeue_lock);
 
 			return e;
 		}
 	}
-	spin_unlock(&con->writequeue_lock);
+	spin_unlock_bh(&con->writequeue_lock);
 
 	e = new_writequeue_entry(con, allocation);
 	if (!e)
@@ -1418,12 +1418,12 @@ static struct writequeue_entry *new_wq_entry(struct connection *con, int len,
 	*ppc = page_address(e->page);
 	e->end += len;
 
-	spin_lock(&con->writequeue_lock);
+	spin_lock_bh(&con->writequeue_lock);
 	if (cb)
 		cb(*ppc, priv);
 
 	list_add_tail(&e->list, &con->writequeue);
-	spin_unlock(&con->writequeue_lock);
+	spin_unlock_bh(&con->writequeue_lock);
 
 	return e;
 };
@@ -1472,7 +1472,7 @@ void dlm_lowcomms_commit_buffer(void *mh)
 	struct connection *con = e->con;
 	int users;
 
-	spin_lock(&con->writequeue_lock);
+	spin_lock_bh(&con->writequeue_lock);
 	list_add(&msg->list, &e->msgs);
 	kref_get(&msg->ref);
 
@@ -1481,13 +1481,13 @@ void dlm_lowcomms_commit_buffer(void *mh)
 		goto out;
 
 	e->len = DLM_WQ_LENGTH_BYTES(e);
-	spin_unlock(&con->writequeue_lock);
+	spin_unlock_bh(&con->writequeue_lock);
 
 	queue_work(send_workqueue, &con->swork);
 	return;
 
 out:
-	spin_unlock(&con->writequeue_lock);
+	spin_unlock_bh(&con->writequeue_lock);
 	return;
 }
 
@@ -1518,7 +1518,7 @@ static void send_to_sock(struct connection *con)
 	if (con->sock == NULL)
 		goto out_connect;
 
-	spin_lock(&con->writequeue_lock);
+	spin_lock_bh(&con->writequeue_lock);
 	for (;;) {
 		if (list_empty(&con->writequeue))
 			break;
@@ -1527,7 +1527,7 @@ static void send_to_sock(struct connection *con)
 		len = e->len;
 		offset = e->offset;
 		BUG_ON(len == 0 && e->users == 0);
-		spin_unlock(&con->writequeue_lock);
+		spin_unlock_bh(&con->writequeue_lock);
 
 		ret = 0;
 		if (len) {
@@ -1555,10 +1555,10 @@ static void send_to_sock(struct connection *con)
 			count = 0;
 		}
 
-		spin_lock(&con->writequeue_lock);
+		spin_lock_bh(&con->writequeue_lock);
 		writequeue_entry_complete(e, ret);
 	}
-	spin_unlock(&con->writequeue_lock);
+	spin_unlock_bh(&con->writequeue_lock);
 out:
 	mutex_unlock(&con->sock_mutex);
 	return;
@@ -1581,11 +1581,11 @@ static void clean_one_writequeue(struct connection *con)
 {
 	struct writequeue_entry *e, *safe;
 
-	spin_lock(&con->writequeue_lock);
+	spin_lock_bh(&con->writequeue_lock);
 	list_for_each_entry_safe(e, safe, &con->writequeue, list) {
 		free_entry(e);
 	}
-	spin_unlock(&con->writequeue_lock);
+	spin_unlock_bh(&con->writequeue_lock);
 }
 
 /* Called from recovery when it knows that a node has
-- 
2.26.2

