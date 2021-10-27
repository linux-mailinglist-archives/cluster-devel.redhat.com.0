Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AAF43CDA4
	for <lists+cluster-devel@lfdr.de>; Wed, 27 Oct 2021 17:34:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635348856;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yCPSo8JQ6xCt6GSWDsqQBPZLbqe2d9LJEoI9QhdvLuY=;
	b=SUWnDCnE7bSh61V96yLKJj5nVUb6YXENn/GrEiY+TeEyAq/iHFwqIhPAhmKhA+SSzUbxt6
	ieJo5j6acwP4Jd3ufiDD54kz/zo0kuKqpR6mw03S7sIHsAc9t+VG648L5MdNMGDG+2Fybu
	HYrnWA2TKdMD5D6Xl49qV7xQU2wVwN8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-nxSm2pmmN-yT1ix8GxblVg-1; Wed, 27 Oct 2021 11:34:13 -0400
X-MC-Unique: nxSm2pmmN-yT1ix8GxblVg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8F1E802B4F;
	Wed, 27 Oct 2021 15:34:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BBE3310429D0;
	Wed, 27 Oct 2021 15:34:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 07FCB4EA3B;
	Wed, 27 Oct 2021 15:34:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19RFNorZ009183 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 27 Oct 2021 11:23:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A934F1042AAF; Wed, 27 Oct 2021 15:23:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 596E710429D2;
	Wed, 27 Oct 2021 15:23:50 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 27 Oct 2021 11:23:17 -0400
Message-Id: <20211027152322.3236492-4-aahringo@redhat.com>
In-Reply-To: <20211027152322.3236492-1-aahringo@redhat.com>
References: <20211027152322.3236492-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 3/8] fs: dlm: let handle callback
	data as void
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
index 0ea9ae35da0b..5cfef47b7df2 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1478,8 +1478,7 @@ static struct writequeue_entry *new_writequeue_entry(struct connection *con,
 
 static struct writequeue_entry *new_wq_entry(struct connection *con, int len,
 					     gfp_t allocation, char **ppc,
-					     void (*cb)(struct dlm_mhandle *mh),
-					     struct dlm_mhandle *mh)
+					     void (*cb)(void *data), void *data)
 {
 	struct writequeue_entry *e;
 
@@ -1491,7 +1490,7 @@ static struct writequeue_entry *new_wq_entry(struct connection *con, int len,
 
 			*ppc = page_address(e->page) + e->end;
 			if (cb)
-				cb(mh);
+				cb(data);
 
 			e->end += len;
 			e->users++;
@@ -1513,7 +1512,7 @@ static struct writequeue_entry *new_wq_entry(struct connection *con, int len,
 
 	spin_lock(&con->writequeue_lock);
 	if (cb)
-		cb(mh);
+		cb(data);
 
 	list_add_tail(&e->list, &con->writequeue);
 	spin_unlock(&con->writequeue_lock);
@@ -1523,8 +1522,8 @@ static struct writequeue_entry *new_wq_entry(struct connection *con, int len,
 
 static struct dlm_msg *dlm_lowcomms_new_msg_con(struct connection *con, int len,
 						gfp_t allocation, char **ppc,
-						void (*cb)(struct dlm_mhandle *mh),
-						struct dlm_mhandle *mh)
+						void (*cb)(void *data),
+						void *data)
 {
 	struct writequeue_entry *e;
 	struct dlm_msg *msg;
@@ -1535,7 +1534,7 @@ static struct dlm_msg *dlm_lowcomms_new_msg_con(struct connection *con, int len,
 
 	kref_init(&msg->ref);
 
-	e = new_wq_entry(con, len, allocation, ppc, cb, mh);
+	e = new_wq_entry(con, len, allocation, ppc, cb, data);
 	if (!e) {
 		kfree(msg);
 		return NULL;
@@ -1549,8 +1548,8 @@ static struct dlm_msg *dlm_lowcomms_new_msg_con(struct connection *con, int len,
 }
 
 struct dlm_msg *dlm_lowcomms_new_msg(int nodeid, int len, gfp_t allocation,
-				     char **ppc, void (*cb)(struct dlm_mhandle *mh),
-				     struct dlm_mhandle *mh)
+				     char **ppc, void (*cb)(void *data),
+				     void *data)
 {
 	struct connection *con;
 	struct dlm_msg *msg;
@@ -1571,7 +1570,7 @@ struct dlm_msg *dlm_lowcomms_new_msg(int nodeid, int len, gfp_t allocation,
 		return NULL;
 	}
 
-	msg = dlm_lowcomms_new_msg_con(con, len, allocation, ppc, cb, mh);
+	msg = dlm_lowcomms_new_msg_con(con, len, allocation, ppc, cb, data);
 	if (!msg) {
 		srcu_read_unlock(&connections_srcu, idx);
 		return NULL;
diff --git a/fs/dlm/lowcomms.h b/fs/dlm/lowcomms.h
index aaae7115c00d..94f5e5a81cd7 100644
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
index 6bcc5eb0f6cc..a8af5688ee89 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -980,8 +980,10 @@ static void dlm_fill_opts_header(struct dlm_opts *opts, uint16_t inner_len,
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

