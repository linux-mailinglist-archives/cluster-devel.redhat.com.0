Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 982E53814A5
	for <lists+cluster-devel@lfdr.de>; Sat, 15 May 2021 02:36:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621038977;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZDrhkas+eQdLkL1gAsncMGwMPS7r1+Bb+az6PTcpDKE=;
	b=hgAlcyc6fXgvZjb3atpR4ouMkkodQe9kSX8AjMlsG6KdzCm49zOAm3dnaATU04H8RcEmyI
	zANh28M9KSkbPlCsDw0gPQu0OVot+CfG+fmDBEIk07/ehJ/oeIEe2BCNZTVsHlTh4bDmsP
	avWZT1i6OF09nYGzw/gPCpm+Ht8ZMRI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-Um78yvSOOU2PfZHR862L2w-1; Fri, 14 May 2021 20:36:15 -0400
X-MC-Unique: Um78yvSOOU2PfZHR862L2w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C08231854E4A;
	Sat, 15 May 2021 00:36:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B094A1A868;
	Sat, 15 May 2021 00:36:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9DB375534F;
	Sat, 15 May 2021 00:36:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14F0a792030877 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 14 May 2021 20:36:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1D8C95D9FC; Sat, 15 May 2021 00:36:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-135.rdu2.redhat.com [10.10.115.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8EC295D9CD;
	Sat, 15 May 2021 00:36:06 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 14 May 2021 20:35:42 -0400
Message-Id: <20210515003549.1118171-9-aahringo@redhat.com>
In-Reply-To: <20210515003549.1118171-1-aahringo@redhat.com>
References: <20210515003549.1118171-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, gnault@redhat.com, pabeni@redhat.com
Subject: [Cluster-devel] [PATCHv5 v5.13-rc1 dlm/next 08/15] fs: dlm: make
	buffer handling per msg
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

This patch makes the void pointer handle for lowcomms functionality per
message and not per page allocation entry. A refcount handling for the
handle was added to keep the message alive until the user doesn't need
it anymore.

There exists now a per message callback which will be called when
allocating a new buffer. This callback will be guaranteed to be called
according the order of the sending buffer, which can be used that the
caller increments a sequence number for the dlm message handle.

For transition process we cast the dlm_mhandle to dlm_msg and vice versa
until the midcomms layer will implement a specific dlm_mhandle structure.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/dlm_internal.h |   1 +
 fs/dlm/lowcomms.c     | 101 +++++++++++++++++++++++++++++++++++-------
 fs/dlm/lowcomms.h     |   7 ++-
 fs/dlm/midcomms.c     |   7 ++-
 fs/dlm/rcom.c         |  40 +++++++++--------
 5 files changed, 117 insertions(+), 39 deletions(-)

diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index ae3fdf6d9cda..e8dc5f4f1f9e 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -57,6 +57,7 @@ struct dlm_header;
 struct dlm_message;
 struct dlm_rcom;
 struct dlm_mhandle;
+struct dlm_msg;
 
 #define log_print(fmt, args...) \
 	printk(KERN_ERR "dlm: "fmt"\n" , ##args)
diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index d3491bcd1ff1..70fd54ebdbe1 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -119,8 +119,19 @@ struct writequeue_entry {
 	int len;
 	int end;
 	int users;
-	int idx; /* get()/commit() idx exchange */
 	struct connection *con;
+	struct list_head msgs;
+	struct kref ref;
+};
+
+struct dlm_msg {
+	struct writequeue_entry *entry;
+	void *ppc;
+	int len;
+	int idx; /* new()/commit() idx exchange */
+
+	struct list_head list;
+	struct kref ref;
 };
 
 struct dlm_node_addr {
@@ -1022,12 +1033,37 @@ static int accept_from_sock(struct listen_connection *con)
 	return result;
 }
 
-static void free_entry(struct writequeue_entry *e)
+static void dlm_page_release(struct kref *kref)
 {
+	struct writequeue_entry *e = container_of(kref, struct writequeue_entry,
+						  ref);
+
 	__free_page(e->page);
 	kfree(e);
 }
 
+static void dlm_msg_release(struct kref *kref)
+{
+	struct dlm_msg *msg = container_of(kref, struct dlm_msg, ref);
+
+	kref_put(&msg->entry->ref, dlm_page_release);
+	kfree(msg);
+}
+
+static void free_entry(struct writequeue_entry *e)
+{
+	struct dlm_msg *msg, *tmp;
+
+	list_for_each_entry_safe(msg, tmp, &e->msgs, list) {
+		list_del(&msg->list);
+		kref_put(&msg->ref, dlm_msg_release);
+	}
+
+	list_del(&e->list);
+	atomic_dec(&e->con->writequeue_cnt);
+	kref_put(&e->ref, dlm_page_release);
+}
+
 /*
  * writequeue_entry_complete - try to delete and free write queue entry
  * @e: write queue entry to try to delete
@@ -1040,11 +1076,8 @@ static void writequeue_entry_complete(struct writequeue_entry *e, int completed)
 	e->offset += completed;
 	e->len -= completed;
 
-	if (e->len == 0 && e->users == 0) {
-		list_del(&e->list);
-		atomic_dec(&e->con->writequeue_cnt);
+	if (e->len == 0 && e->users == 0)
 		free_entry(e);
-	}
 }
 
 /*
@@ -1410,12 +1443,16 @@ static struct writequeue_entry *new_writequeue_entry(struct connection *con,
 
 	entry->con = con;
 	entry->users = 1;
+	kref_init(&entry->ref);
+	INIT_LIST_HEAD(&entry->msgs);
 
 	return entry;
 }
 
 static struct writequeue_entry *new_wq_entry(struct connection *con, int len,
-					     gfp_t allocation, char **ppc)
+					     gfp_t allocation, char **ppc,
+					     void (*cb)(struct dlm_mhandle *mh),
+					     struct dlm_mhandle *mh)
 {
 	struct writequeue_entry *e;
 
@@ -1423,7 +1460,12 @@ static struct writequeue_entry *new_wq_entry(struct connection *con, int len,
 	if (!list_empty(&con->writequeue)) {
 		e = list_last_entry(&con->writequeue, struct writequeue_entry, list);
 		if (DLM_WQ_REMAIN_BYTES(e) >= len) {
+			kref_get(&e->ref);
+
 			*ppc = page_address(e->page) + e->end;
+			if (cb)
+				cb(mh);
+
 			e->end += len;
 			e->users++;
 			spin_unlock(&con->writequeue_lock);
@@ -1437,21 +1479,28 @@ static struct writequeue_entry *new_wq_entry(struct connection *con, int len,
 	if (!e)
 		return NULL;
 
+	kref_get(&e->ref);
 	*ppc = page_address(e->page);
 	e->end += len;
 	atomic_inc(&con->writequeue_cnt);
 
 	spin_lock(&con->writequeue_lock);
+	if (cb)
+		cb(mh);
+
 	list_add_tail(&e->list, &con->writequeue);
 	spin_unlock(&con->writequeue_lock);
 
 	return e;
 };
 
-void *dlm_lowcomms_get_buffer(int nodeid, int len, gfp_t allocation, char **ppc)
+struct dlm_msg *dlm_lowcomms_new_msg(int nodeid, int len, gfp_t allocation,
+				     char **ppc, void (*cb)(struct dlm_mhandle *mh),
+				     struct dlm_mhandle *mh)
 {
 	struct writequeue_entry *e;
 	struct connection *con;
+	struct dlm_msg *msg;
 	int idx;
 
 	if (len > DEFAULT_BUFFER_SIZE ||
@@ -1469,25 +1518,41 @@ void *dlm_lowcomms_get_buffer(int nodeid, int len, gfp_t allocation, char **ppc)
 		return NULL;
 	}
 
-	e = new_wq_entry(con, len, allocation, ppc);
+	msg = kzalloc(sizeof(*msg), allocation);
+	if (!msg) {
+		srcu_read_unlock(&connections_srcu, idx);
+		return NULL;
+	}
+
+	kref_init(&msg->ref);
+
+	e = new_wq_entry(con, len, allocation, ppc, cb, mh);
 	if (!e) {
 		srcu_read_unlock(&connections_srcu, idx);
+		kfree(msg);
 		return NULL;
 	}
 
+	msg->ppc = *ppc;
+	msg->len = len;
+	msg->entry = e;
+
 	/* we assume if successful commit must called */
-	e->idx = idx;
+	msg->idx = idx;
 
-	return e;
+	return msg;
 }
 
-void dlm_lowcomms_commit_buffer(void *mh)
+void dlm_lowcomms_commit_msg(struct dlm_msg *msg)
 {
-	struct writequeue_entry *e = (struct writequeue_entry *)mh;
+	struct writequeue_entry *e = msg->entry;
 	struct connection *con = e->con;
 	int users;
 
 	spin_lock(&con->writequeue_lock);
+	kref_get(&msg->ref);
+	list_add(&msg->list, &e->msgs);
+
 	users = --e->users;
 	if (users)
 		goto out;
@@ -1496,15 +1561,20 @@ void dlm_lowcomms_commit_buffer(void *mh)
 	spin_unlock(&con->writequeue_lock);
 
 	queue_work(send_workqueue, &con->swork);
-	srcu_read_unlock(&connections_srcu, e->idx);
+	srcu_read_unlock(&connections_srcu, msg->idx);
 	return;
 
 out:
 	spin_unlock(&con->writequeue_lock);
-	srcu_read_unlock(&connections_srcu, e->idx);
+	srcu_read_unlock(&connections_srcu, msg->idx);
 	return;
 }
 
+void dlm_lowcomms_put_msg(struct dlm_msg *msg)
+{
+	kref_put(&msg->ref, dlm_msg_release);
+}
+
 /* Send a message */
 static void send_to_sock(struct connection *con)
 {
@@ -1590,7 +1660,6 @@ static void clean_one_writequeue(struct connection *con)
 
 	spin_lock(&con->writequeue_lock);
 	list_for_each_entry_safe(e, safe, &con->writequeue, list) {
-		list_del(&e->list);
 		free_entry(e);
 	}
 	spin_unlock(&con->writequeue_lock);
diff --git a/fs/dlm/lowcomms.h b/fs/dlm/lowcomms.h
index 48bbc4e18761..cdb8f066f0d8 100644
--- a/fs/dlm/lowcomms.h
+++ b/fs/dlm/lowcomms.h
@@ -22,8 +22,11 @@ void dlm_lowcomms_shutdown(void);
 void dlm_lowcomms_stop(void);
 void dlm_lowcomms_exit(void);
 int dlm_lowcomms_close(int nodeid);
-void *dlm_lowcomms_get_buffer(int nodeid, int len, gfp_t allocation, char **ppc);
-void dlm_lowcomms_commit_buffer(void *mh);
+struct dlm_msg *dlm_lowcomms_new_msg(int nodeid, int len, gfp_t allocation,
+				     char **ppc, void (*cb)(struct dlm_mhandle *mh),
+				     struct dlm_mhandle *mh);
+void dlm_lowcomms_commit_msg(struct dlm_msg *msg);
+void dlm_lowcomms_put_msg(struct dlm_msg *msg);
 int dlm_lowcomms_connect_node(int nodeid);
 int dlm_lowcomms_nodes_set_mark(int nodeid, unsigned int mark);
 int dlm_lowcomms_addr(int nodeid, struct sockaddr_storage *addr, int len);
diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index 1a280dda99d3..aadb3781bebe 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -31,12 +31,15 @@
 struct dlm_mhandle *dlm_midcomms_get_mhandle(int nodeid, int len,
 					     gfp_t allocation, char **ppc)
 {
-	return dlm_lowcomms_get_buffer(nodeid, len, allocation, ppc);
+	return (struct dlm_mhandle *)dlm_lowcomms_new_msg(nodeid, len,
+							  allocation, ppc,
+							  NULL, NULL);
 }
 
 void dlm_midcomms_commit_mhandle(struct dlm_mhandle *mh)
 {
-	dlm_lowcomms_commit_buffer(mh);
+	dlm_lowcomms_commit_msg((struct dlm_msg *)mh);
+	dlm_lowcomms_put_msg((struct dlm_msg *)mh);
 }
 
 void dlm_midcomms_add_member(int nodeid) { }
diff --git a/fs/dlm/rcom.c b/fs/dlm/rcom.c
index 2661674364af..6f653a339bea 100644
--- a/fs/dlm/rcom.c
+++ b/fs/dlm/rcom.c
@@ -70,21 +70,22 @@ static int create_rcom(struct dlm_ls *ls, int to_nodeid, int type, int len,
 
 static int create_rcom_stateless(struct dlm_ls *ls, int to_nodeid, int type,
 				 int len, struct dlm_rcom **rc_ret,
-				 void **mh_ret)
+				 struct dlm_msg **msg_ret)
 {
 	int mb_len = sizeof(struct dlm_rcom) + len;
-	void *mh;
+	struct dlm_msg *msg;
 	char *mb;
 
-	mh = dlm_lowcomms_get_buffer(to_nodeid, mb_len, GFP_NOFS, &mb);
-	if (!mh) {
+	msg = dlm_lowcomms_new_msg(to_nodeid, mb_len, GFP_NOFS, &mb,
+				   NULL, NULL);
+	if (!msg) {
 		log_print("create_rcom to %d type %d len %d ENOBUFS",
 			  to_nodeid, type, len);
 		return -ENOBUFS;
 	}
 
 	_create_rcom(ls, to_nodeid, type, len, rc_ret, mb, mb_len);
-	*mh_ret = mh;
+	*msg_ret = msg;
 	return 0;
 }
 
@@ -100,11 +101,12 @@ static void send_rcom(struct dlm_ls *ls, struct dlm_mhandle *mh,
 	dlm_midcomms_commit_mhandle(mh);
 }
 
-static void send_rcom_stateless(struct dlm_ls *ls, void *mh,
+static void send_rcom_stateless(struct dlm_ls *ls, struct dlm_msg *msg,
 				struct dlm_rcom *rc)
 {
 	_send_rcom(ls, rc);
-	dlm_lowcomms_commit_buffer(mh);
+	dlm_lowcomms_commit_msg(msg);
+	dlm_lowcomms_put_msg(msg);
 }
 
 static void set_rcom_status(struct dlm_ls *ls, struct rcom_status *rs,
@@ -180,8 +182,8 @@ static void disallow_sync_reply(struct dlm_ls *ls)
 int dlm_rcom_status(struct dlm_ls *ls, int nodeid, uint32_t status_flags)
 {
 	struct dlm_rcom *rc;
+	struct dlm_msg *msg;
 	int error = 0;
-	void *mh;
 
 	ls->ls_recover_nodeid = nodeid;
 
@@ -193,7 +195,7 @@ int dlm_rcom_status(struct dlm_ls *ls, int nodeid, uint32_t status_flags)
 
 retry:
 	error = create_rcom_stateless(ls, nodeid, DLM_RCOM_STATUS,
-				      sizeof(struct rcom_status), &rc, &mh);
+				      sizeof(struct rcom_status), &rc, &msg);
 	if (error)
 		goto out;
 
@@ -202,7 +204,7 @@ int dlm_rcom_status(struct dlm_ls *ls, int nodeid, uint32_t status_flags)
 	allow_sync_reply(ls, &rc->rc_id);
 	memset(ls->ls_recover_buf, 0, LOWCOMMS_MAX_TX_BUFFER_LEN);
 
-	send_rcom_stateless(ls, mh, rc);
+	send_rcom_stateless(ls, msg, rc);
 
 	error = dlm_wait_function(ls, &rcom_response);
 	disallow_sync_reply(ls);
@@ -234,9 +236,9 @@ static void receive_rcom_status(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 	uint32_t status;
 	int nodeid = rc_in->rc_header.h_nodeid;
 	int len = sizeof(struct rcom_config);
+	struct dlm_msg *msg;
 	int num_slots = 0;
 	int error;
-	void *mh;
 
 	if (!dlm_slots_version(&rc_in->rc_header)) {
 		status = dlm_recover_status(ls);
@@ -258,7 +260,7 @@ static void receive_rcom_status(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 
  do_create:
 	error = create_rcom_stateless(ls, nodeid, DLM_RCOM_STATUS_REPLY,
-				      len, &rc, &mh);
+				      len, &rc, &msg);
 	if (error)
 		return;
 
@@ -285,7 +287,7 @@ static void receive_rcom_status(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 	spin_unlock(&ls->ls_recover_lock);
 
  do_send:
-	send_rcom_stateless(ls, mh, rc);
+	send_rcom_stateless(ls, msg, rc);
 }
 
 static void receive_sync_reply(struct dlm_ls *ls, struct dlm_rcom *rc_in)
@@ -310,14 +312,14 @@ static void receive_sync_reply(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 int dlm_rcom_names(struct dlm_ls *ls, int nodeid, char *last_name, int last_len)
 {
 	struct dlm_rcom *rc;
+	struct dlm_msg *msg;
 	int error = 0;
-	void *mh;
 
 	ls->ls_recover_nodeid = nodeid;
 
 retry:
 	error = create_rcom_stateless(ls, nodeid, DLM_RCOM_NAMES, last_len,
-				      &rc, &mh);
+				      &rc, &msg);
 	if (error)
 		goto out;
 	memcpy(rc->rc_buf, last_name, last_len);
@@ -325,7 +327,7 @@ int dlm_rcom_names(struct dlm_ls *ls, int nodeid, char *last_name, int last_len)
 	allow_sync_reply(ls, &rc->rc_id);
 	memset(ls->ls_recover_buf, 0, LOWCOMMS_MAX_TX_BUFFER_LEN);
 
-	send_rcom_stateless(ls, mh, rc);
+	send_rcom_stateless(ls, msg, rc);
 
 	error = dlm_wait_function(ls, &rcom_response);
 	disallow_sync_reply(ls);
@@ -339,14 +341,14 @@ static void receive_rcom_names(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 {
 	struct dlm_rcom *rc;
 	int error, inlen, outlen, nodeid;
-	void *mh;
+	struct dlm_msg *msg;
 
 	nodeid = rc_in->rc_header.h_nodeid;
 	inlen = rc_in->rc_header.h_length - sizeof(struct dlm_rcom);
 	outlen = LOWCOMMS_MAX_TX_BUFFER_LEN - sizeof(struct dlm_rcom);
 
 	error = create_rcom_stateless(ls, nodeid, DLM_RCOM_NAMES_REPLY, outlen,
-				      &rc, &mh);
+				      &rc, &msg);
 	if (error)
 		return;
 	rc->rc_id = rc_in->rc_id;
@@ -354,7 +356,7 @@ static void receive_rcom_names(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 
 	dlm_copy_master_names(ls, rc_in->rc_buf, inlen, rc->rc_buf, outlen,
 			      nodeid);
-	send_rcom_stateless(ls, mh, rc);
+	send_rcom_stateless(ls, msg, rc);
 }
 
 int dlm_send_rcom_lookup(struct dlm_rsb *r, int dir_nodeid)
-- 
2.26.3

