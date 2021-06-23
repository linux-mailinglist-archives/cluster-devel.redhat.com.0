Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id D8E7C3B1D71
	for <lists+cluster-devel@lfdr.de>; Wed, 23 Jun 2021 17:15:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624461352;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/pRXypoe37ADP1gQKNSDmN6EjfrnwTJUVbJhtthIUZc=;
	b=HXhpwxHFMxmb8sStzgH9wTjzOnkJe64Hqial2r9C5JL7tN3qQQ7m2Bc15QdRrI4aBqNSV+
	vgWEI64SA9UET/N1kKXRoiDzqHK587YisqOnTJC6NctiTE02Rf9wf+3dc3EOeLD4By44xq
	+TIhQMM65N3e8kPVsbDsL0l6cf4JOkA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-2zskk9xHP7mEaFAxGI2AZg-1; Wed, 23 Jun 2021 11:15:43 -0400
X-MC-Unique: 2zskk9xHP7mEaFAxGI2AZg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 141138189D5;
	Wed, 23 Jun 2021 15:15:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 033935D9F0;
	Wed, 23 Jun 2021 15:15:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E531E1800CAF;
	Wed, 23 Jun 2021 15:15:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15NFFdX0024958 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 23 Jun 2021 11:15:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5F0E960FB8; Wed, 23 Jun 2021 15:15:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (unknown [10.22.8.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F29F760C05;
	Wed, 23 Jun 2021 15:15:38 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 23 Jun 2021 11:14:46 -0400
Message-Id: <20210623151454.176649-8-aahringo@redhat.com>
In-Reply-To: <20210623151454.176649-1-aahringo@redhat.com>
References: <20210623151454.176649-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [RFC dlm/next 07/15] fs: dlm: fix multiple empty
	writequeue alloc
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch will add a mutex that a connection can allocate a writequeue
entry buffer only at a sleepable context at one time. If multiple caller
waits at the writequeue spinlock and the spinlock gets release it could
be that multiple new writequeue page buffers were allocated instead of
allocate one writequeue page buffer and other waiters will use remaining
buffer of it. It will only be the case for sleepable context which is
the common case. In non-sleepable contexts like retransmission we just
don't care about such behaviour.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 2919a868d19f..e96911c0c18d 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -84,6 +84,7 @@ struct connection {
 	struct list_head writequeue;  /* List of outgoing writequeue_entries */
 	spinlock_t writequeue_lock;
 	atomic_t writequeue_cnt;
+	struct mutex wq_alloc;
 	int retries;
 #define MAX_CONNECT_RETRIES 3
 	struct hlist_node list;
@@ -264,6 +265,8 @@ static struct connection *nodeid2con(int nodeid, gfp_t alloc)
 		return NULL;
 	}
 
+	mutex_init(&con->wq_alloc);
+
 	spin_lock(&connections_lock);
 	/* Because multiple workqueues/threads calls this function it can
 	 * race on multiple cpu's. Instead of locking hot path __find_con()
@@ -1252,19 +1255,37 @@ static struct dlm_msg *dlm_lowcomms_new_msg_con(struct connection *con, int len,
 {
 	struct writequeue_entry *e;
 	struct dlm_msg *msg;
+	bool sleepable;
 
 	msg = kzalloc(sizeof(*msg), allocation);
 	if (!msg)
 		return NULL;
 
+	/* this mutex is being used as a wait to avoid multiple "fast"
+	 * new writequeue page list entry allocs in new_wq_entry in
+	 * normal operation which is sleepable context. Without it
+	 * we could end in multiple writequeue entries with one
+	 * dlm message because multiple callers were waiting at
+	 * the writequeue_lock in new_wq_entry().
+	 */
+	sleepable = gfpflags_normal_context(allocation);
+	if (sleepable)
+		mutex_lock(&con->wq_alloc);
+
 	kref_init(&msg->ref);
 
 	e = new_wq_entry(con, len, allocation, ppc, cb, mh);
 	if (!e) {
+		if (sleepable)
+			mutex_unlock(&con->wq_alloc);
+
 		kfree(msg);
 		return NULL;
 	}
 
+	if (sleepable)
+		mutex_unlock(&con->wq_alloc);
+
 	msg->ppc = *ppc;
 	msg->len = len;
 	msg->entry = e;
-- 
2.26.3

