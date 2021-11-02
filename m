Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4DD443660
	for <lists+cluster-devel@lfdr.de>; Tue,  2 Nov 2021 20:18:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635880690;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GfK5CKdNX2dEgyea7lcA+kLhvoblnHCkNpZUavUTL1M=;
	b=CM1rbCxqQIx9s6PUyFUMmXcAENp6A0yGP63F2GIy4UYWhbusOHSwzVgP90nz28N3uN0A2R
	ThQo8qhmQG3wrGVY9Yjz5GcDCcuktd4JKfiBETtIm/iOE42pgU/YkR2f+JOU+6bb53HttU
	Xo5Ly0l6r+D5KqLfX8ApL3/qAbIHqq4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-AXuwdDEWPPC4SRGSSKHmew-1; Tue, 02 Nov 2021 15:18:09 -0400
X-MC-Unique: AXuwdDEWPPC4SRGSSKHmew-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 041F6100D68E;
	Tue,  2 Nov 2021 19:18:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D433519C79;
	Tue,  2 Nov 2021 19:18:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6BC074EA38;
	Tue,  2 Nov 2021 19:18:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A2JHxH3020792 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 2 Nov 2021 15:17:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2AC4160657; Tue,  2 Nov 2021 19:17:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CFD3467840;
	Tue,  2 Nov 2021 19:17:58 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue,  2 Nov 2021 15:17:19 -0400
Message-Id: <20211102191724.210095-14-aahringo@redhat.com>
In-Reply-To: <20211102191724.210095-1-aahringo@redhat.com>
References: <20211102191724.210095-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH RESEND v5.15-rc7 13/18] fs: dlm: let handle
	callback data as void
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

This patch changes the dlm_lowcomms_new_msg() function pointer private data
from "struct mhandle *" to "void *" to provide different structures than
just "struct mhandle".

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 19 +++++++++----------
 fs/dlm/lowcomms.h |  4 ++--
 fs/dlm/midcomms.c |  4 +++-
 3 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 6d6dcf0d5ba9..3f8b015ba799 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1205,8 +1205,7 @@ static struct writequeue_entry *new_writequeue_entry(struct connection *con,
 
 static struct writequeue_entry *new_wq_entry(struct connection *con, int len,
 					     gfp_t allocation, char **ppc,
-					     void (*cb)(struct dlm_mhandle *mh),
-					     struct dlm_mhandle *mh)
+					     void (*cb)(void *data), void *data)
 {
 	struct writequeue_entry *e;
 
@@ -1218,7 +1217,7 @@ static struct writequeue_entry *new_wq_entry(struct connection *con, int len,
 
 			*ppc = page_address(e->page) + e->end;
 			if (cb)
-				cb(mh);
+				cb(data);
 
 			e->end += len;
 			e->users++;
@@ -1240,7 +1239,7 @@ static struct writequeue_entry *new_wq_entry(struct connection *con, int len,
 
 	spin_lock(&con->writequeue_lock);
 	if (cb)
-		cb(mh);
+		cb(data);
 
 	list_add_tail(&e->list, &con->writequeue);
 	spin_unlock(&con->writequeue_lock);
@@ -1250,8 +1249,8 @@ static struct writequeue_entry *new_wq_entry(struct connection *con, int len,
 
 static struct dlm_msg *dlm_lowcomms_new_msg_con(struct connection *con, int len,
 						gfp_t allocation, char **ppc,
-						void (*cb)(struct dlm_mhandle *mh),
-						struct dlm_mhandle *mh)
+						void (*cb)(void *data),
+						void *data)
 {
 	struct writequeue_entry *e;
 	struct dlm_msg *msg;
@@ -1274,7 +1273,7 @@ static struct dlm_msg *dlm_lowcomms_new_msg_con(struct connection *con, int len,
 
 	kref_init(&msg->ref);
 
-	e = new_wq_entry(con, len, allocation, ppc, cb, mh);
+	e = new_wq_entry(con, len, allocation, ppc, cb, data);
 	if (!e) {
 		if (sleepable)
 			mutex_unlock(&con->wq_alloc);
@@ -1294,8 +1293,8 @@ static struct dlm_msg *dlm_lowcomms_new_msg_con(struct connection *con, int len,
 }
 
 struct dlm_msg *dlm_lowcomms_new_msg(int nodeid, int len, gfp_t allocation,
-				     char **ppc, void (*cb)(struct dlm_mhandle *mh),
-				     struct dlm_mhandle *mh)
+				     char **ppc, void (*cb)(void *data),
+				     void *data)
 {
 	struct connection *con;
 	struct dlm_msg *msg;
@@ -1316,7 +1315,7 @@ struct dlm_msg *dlm_lowcomms_new_msg(int nodeid, int len, gfp_t allocation,
 		return NULL;
 	}
 
-	msg = dlm_lowcomms_new_msg_con(con, len, allocation, ppc, cb, mh);
+	msg = dlm_lowcomms_new_msg_con(con, len, allocation, ppc, cb, data);
 	if (!msg) {
 		srcu_read_unlock(&connections_srcu, idx);
 		return NULL;
diff --git a/fs/dlm/lowcomms.h b/fs/dlm/lowcomms.h
index 4ccae07cf005..8108ea24ec30 100644
--- a/fs/dlm/lowcomms.h
+++ b/fs/dlm/lowcomms.h
@@ -38,8 +38,8 @@ void dlm_lowcomms_stop(void);
 void dlm_lowcomms_exit(void);
 int dlm_lowcomms_close(int nodeid);
 struct dlm_msg *dlm_lowcomms_new_msg(int nodeid, int len, gfp_t allocation,
-				     char **ppc, void (*cb)(struct dlm_mhandle *mh),
-				     struct dlm_mhandle *mh);
+				     char **ppc, void (*cb)(void *data),
+				     void *data);
 void dlm_lowcomms_commit_msg(struct dlm_msg *msg);
 void dlm_lowcomms_put_msg(struct dlm_msg *msg);
 int dlm_lowcomms_resend_msg(struct dlm_msg *msg);
diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index 76bdc3a9dc61..95a5643a950e 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -1020,8 +1020,10 @@ static void dlm_fill_opts_header(struct dlm_opts *opts, uint16_t inner_len,
 	header_out(&opts->o_header);
 }
 
-static void midcomms_new_msg_cb(struct dlm_mhandle *mh)
+static void midcomms_new_msg_cb(void *data)
 {
+	struct dlm_mhandle *mh = data;
+
 	atomic_inc(&mh->node->send_queue_cnt);
 
 	spin_lock(&mh->node->send_queue_lock);
-- 
2.27.0

