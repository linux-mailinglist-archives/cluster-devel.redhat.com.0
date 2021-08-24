Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1AC013F6A91
	for <lists+cluster-devel@lfdr.de>; Tue, 24 Aug 2021 22:40:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629837629;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VscVxbjwwnoQS2dgV7DTvF7dyJy84nxMDE3REXAff24=;
	b=dAkVGhRGYgNVIh9ArCS6AIIXi3ke9iJOvDiiIRS+SJaycmlR1+efDPTe2JsecVwV5Lblob
	oOf5XbdMNr8tGVNlWFiqkIFN+JrXhWyUVuR9/LPvCa2d7S0+ZNm5cEn6p+MuX4uil8/jVX
	qCYlme1/GeKVW38u5BzeuI44EAed6sA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-Cdl415x3OyKIC0akfyu_LQ-1; Tue, 24 Aug 2021 16:40:27 -0400
X-MC-Unique: Cdl415x3OyKIC0akfyu_LQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C869F801A92;
	Tue, 24 Aug 2021 20:40:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B496C3CC7;
	Tue, 24 Aug 2021 20:40:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4CFEC4BB7C;
	Tue, 24 Aug 2021 20:40:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17OKeLGk004185 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 24 Aug 2021 16:40:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C6F2760C82; Tue, 24 Aug 2021 20:40:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CB8A160C0F;
	Tue, 24 Aug 2021 20:40:18 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: ghe@suse.com
Date: Tue, 24 Aug 2021 16:40:01 -0400
Message-Id: <20210824204001.2537771-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [RFC v5.13.8] fs: dlm: fix srcu idx value per msg
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

This patch fixes an issue if new_wq_entry() returns the same writequeue
entry and the idx field will be overwritten that was set by the previous
call. We need to make the handle per call and store the srcu idx value
there to avoid it.

Fixes: 7ae861bbfa0f ("fs: dlm: fix srcu read lock usage")
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 37 +++++++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 12 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 9bf920bee292..5ed0efc45ba6 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -119,7 +119,6 @@ struct writequeue_entry {
 	int len;
 	int end;
 	int users;
-	int idx; /* get()/commit() idx exchange */
 	struct connection *con;
 };
 
@@ -1447,9 +1446,14 @@ static struct writequeue_entry *new_wq_entry(struct connection *con, int len,
 	return e;
 };
 
+struct dlm_buffer_ctx {
+	struct writequeue_entry *e;
+	int idx; /* get()/commit() idx exchange */
+};
+
 void *dlm_lowcomms_get_buffer(int nodeid, int len, gfp_t allocation, char **ppc)
 {
-	struct writequeue_entry *e;
+	struct dlm_buffer_ctx *bctx;
 	struct connection *con;
 	int idx;
 
@@ -1468,39 +1472,48 @@ void *dlm_lowcomms_get_buffer(int nodeid, int len, gfp_t allocation, char **ppc)
 		return NULL;
 	}
 
-	e = new_wq_entry(con, len, allocation, ppc);
-	if (!e) {
+	bctx = kzalloc(sizeof(*bctx), GFP_NOFS);
+	if (!bctx) {
 		srcu_read_unlock(&connections_srcu, idx);
 		return NULL;
 	}
 
+	bctx->e = new_wq_entry(con, len, allocation, ppc);
+	if (!bctx->e) {
+		srcu_read_unlock(&connections_srcu, idx);
+		kfree(bctx);
+		return NULL;
+	}
+
 	/* we assume if successful commit must called */
-	e->idx = idx;
+	bctx->idx = idx;
 
-	return e;
+	return bctx;
 }
 
 void dlm_lowcomms_commit_buffer(void *mh)
 {
-	struct writequeue_entry *e = (struct writequeue_entry *)mh;
-	struct connection *con = e->con;
+	struct dlm_buffer_ctx *bctx = (struct dlm_buffer_ctx *)mh;
+	struct connection *con = bctx->e->con;
 	int users;
 
 	spin_lock(&con->writequeue_lock);
-	users = --e->users;
+	users = --bctx->e->users;
 	if (users)
 		goto out;
 
-	e->len = DLM_WQ_LENGTH_BYTES(e);
+	bctx->e->len = DLM_WQ_LENGTH_BYTES(bctx->e);
 	spin_unlock(&con->writequeue_lock);
 
 	queue_work(send_workqueue, &con->swork);
-	srcu_read_unlock(&connections_srcu, e->idx);
+	srcu_read_unlock(&connections_srcu, bctx->idx);
+	kfree(bctx);
 	return;
 
 out:
 	spin_unlock(&con->writequeue_lock);
-	srcu_read_unlock(&connections_srcu, e->idx);
+	srcu_read_unlock(&connections_srcu, bctx->idx);
+	kfree(bctx);
 	return;
 }
 
-- 
2.27.0

