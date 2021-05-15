Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id A086F3814A1
	for <lists+cluster-devel@lfdr.de>; Sat, 15 May 2021 02:36:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621038976;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fl4OFO7ZK+v+FChvK4y9P5is0na/L8cfdqo6X5BBw5c=;
	b=BWGziV3JKa+cyXJJO7DyrIiRIQmQaKA+8N12XfwLTN5lXaZveSEhy3jclQ/EslOTNGVxiW
	dhOovsTz6ndtFMimEPmGWG3i5uAO7wKBAsDl7n55O5oQvJWV1CcmSYqbC0jr1IvyI33wxF
	dZX9iQyRwBvTOp0/XZ3hMe5T/psdqxw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-INJ9GJrfNEWzb9tzXocNEg-1; Fri, 14 May 2021 20:36:15 -0400
X-MC-Unique: INJ9GJrfNEWzb9tzXocNEg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69C038015F7;
	Sat, 15 May 2021 00:36:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C67A137D8;
	Sat, 15 May 2021 00:36:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4AE0F1800FFC;
	Sat, 15 May 2021 00:36:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14F0a6lF030872 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 14 May 2021 20:36:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 682865D9E3; Sat, 15 May 2021 00:36:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-135.rdu2.redhat.com [10.10.115.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DF8655D9CD;
	Sat, 15 May 2021 00:36:05 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 14 May 2021 20:35:41 -0400
Message-Id: <20210515003549.1118171-8-aahringo@redhat.com>
In-Reply-To: <20210515003549.1118171-1-aahringo@redhat.com>
References: <20210515003549.1118171-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, gnault@redhat.com, pabeni@redhat.com
Subject: [Cluster-devel] [PATCHv5 v5.13-rc1 dlm/next 07/15] fs: dlm: add
	more midcomms hooks
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch prepares hooks to redirect to the midcomms layer which will
be used by the midcomms re-transmit handling.

There exists the new concept of stateless buffers allocation and
commits. This can be used to bypass the midcomms re-transmit handling. It
is used by RCOM_STATUS and RCOM_NAMES messages, because they have their
own ping-like re-transmit handling. As well these two messages will be
used to determine the DLM version per node, because these two messages
are per observation the first messages which are exchanged.

Cluster manager events for node membership are added to add support for
half-closed connections in cases that the peer connection get to
an end of file but DLM still holds membership of the node. In
this time DLM can still trigger new message which we should allow. After
the cluster manager node removal event occurs it safe to close the
connection.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/config.c    |   3 +-
 fs/dlm/lock.c      |   8 ++--
 fs/dlm/lockspace.c |   7 ++--
 fs/dlm/member.c    |   3 ++
 fs/dlm/midcomms.c  |  31 +++++++++++++-
 fs/dlm/midcomms.h  |   8 ++++
 fs/dlm/rcom.c      | 101 +++++++++++++++++++++++++++++++--------------
 7 files changed, 122 insertions(+), 39 deletions(-)

diff --git a/fs/dlm/config.c b/fs/dlm/config.c
index 88d95d96e36c..01ae294743e9 100644
--- a/fs/dlm/config.c
+++ b/fs/dlm/config.c
@@ -20,6 +20,7 @@
 #include <net/sock.h>
 
 #include "config.h"
+#include "midcomms.h"
 #include "lowcomms.h"
 
 /*
@@ -532,7 +533,7 @@ static void drop_comm(struct config_group *g, struct config_item *i)
 	struct dlm_comm *cm = config_item_to_comm(i);
 	if (local_comm == cm)
 		local_comm = NULL;
-	dlm_lowcomms_close(cm->nodeid);
+	dlm_midcomms_close(cm->nodeid);
 	while (cm->addr_count--)
 		kfree(cm->addr[cm->addr_count]);
 	config_item_put(i);
diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index b93df39d0915..b625ce92464a 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -59,7 +59,7 @@
 #include "dlm_internal.h"
 #include <linux/dlm_device.h>
 #include "memory.h"
-#include "lowcomms.h"
+#include "midcomms.h"
 #include "requestqueue.h"
 #include "util.h"
 #include "dir.h"
@@ -3534,10 +3534,10 @@ static int _create_message(struct dlm_ls *ls, int mb_len,
 	char *mb;
 
 	/* get_buffer gives us a message handle (mh) that we need to
-	   pass into lowcomms_commit and a message buffer (mb) that we
+	   pass into midcomms_commit and a message buffer (mb) that we
 	   write our data into */
 
-	mh = dlm_lowcomms_get_buffer(to_nodeid, mb_len, GFP_NOFS, &mb);
+	mh = dlm_midcomms_get_mhandle(to_nodeid, mb_len, GFP_NOFS, &mb);
 	if (!mh)
 		return -ENOBUFS;
 
@@ -3589,7 +3589,7 @@ static int create_message(struct dlm_rsb *r, struct dlm_lkb *lkb,
 static int send_message(struct dlm_mhandle *mh, struct dlm_message *ms)
 {
 	dlm_message_out(ms);
-	dlm_lowcomms_commit_buffer(mh);
+	dlm_midcomms_commit_mhandle(mh);
 	return 0;
 }
 
diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index c14cf2b7faab..bf5c55ef9d0d 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -16,6 +16,7 @@
 #include "member.h"
 #include "recoverd.h"
 #include "dir.h"
+#include "midcomms.h"
 #include "lowcomms.h"
 #include "config.h"
 #include "memory.h"
@@ -390,7 +391,7 @@ static int threads_start(void)
 	}
 
 	/* Thread for sending/receiving messages for all lockspace's */
-	error = dlm_lowcomms_start();
+	error = dlm_midcomms_start();
 	if (error) {
 		log_print("cannot start dlm lowcomms %d", error);
 		goto scand_fail;
@@ -698,7 +699,7 @@ int dlm_new_lockspace(const char *name, const char *cluster,
 		error = 0;
 	if (!ls_count) {
 		dlm_scand_stop();
-		dlm_lowcomms_shutdown();
+		dlm_midcomms_shutdown();
 		dlm_lowcomms_stop();
 	}
  out:
@@ -787,7 +788,7 @@ static int release_lockspace(struct dlm_ls *ls, int force)
 
 	if (ls_count == 1) {
 		dlm_scand_stop();
-		dlm_lowcomms_shutdown();
+		dlm_midcomms_shutdown();
 	}
 
 	dlm_callback_stop(ls);
diff --git a/fs/dlm/member.c b/fs/dlm/member.c
index ceef3f2074ff..ece4ee3442fd 100644
--- a/fs/dlm/member.c
+++ b/fs/dlm/member.c
@@ -15,6 +15,7 @@
 #include "recover.h"
 #include "rcom.h"
 #include "config.h"
+#include "midcomms.h"
 #include "lowcomms.h"
 
 int dlm_slots_version(struct dlm_header *h)
@@ -329,6 +330,7 @@ static int dlm_add_member(struct dlm_ls *ls, struct dlm_config_node *node)
 	memb->nodeid = node->nodeid;
 	memb->weight = node->weight;
 	memb->comm_seq = node->comm_seq;
+	dlm_midcomms_add_member(node->nodeid);
 	add_ordered_member(ls, memb);
 	ls->ls_num_nodes++;
 	return 0;
@@ -552,6 +554,7 @@ int dlm_recover_members(struct dlm_ls *ls, struct dlm_recover *rv, int *neg_out)
 
 		neg++;
 		list_move(&memb->list, &ls->ls_nodes_gone);
+		dlm_midcomms_remove_member(memb->nodeid);
 		ls->ls_num_nodes--;
 		dlm_lsop_recover_slot(ls, memb);
 	}
diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index 1c6654a21ec4..1a280dda99d3 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -28,6 +28,36 @@
 #include "lock.h"
 #include "midcomms.h"
 
+struct dlm_mhandle *dlm_midcomms_get_mhandle(int nodeid, int len,
+					     gfp_t allocation, char **ppc)
+{
+	return dlm_lowcomms_get_buffer(nodeid, len, allocation, ppc);
+}
+
+void dlm_midcomms_commit_mhandle(struct dlm_mhandle *mh)
+{
+	dlm_lowcomms_commit_buffer(mh);
+}
+
+void dlm_midcomms_add_member(int nodeid) { }
+
+void dlm_midcomms_remove_member(int nodeid) { }
+
+int dlm_midcomms_start(void)
+{
+	return dlm_lowcomms_start();
+}
+
+void dlm_midcomms_shutdown(void)
+{
+	dlm_lowcomms_shutdown();
+}
+
+int dlm_midcomms_close(int nodeid)
+{
+	return dlm_lowcomms_close(nodeid);
+}
+
 /*
  * Called from the low-level comms layer to process a buffer of
  * commands.
@@ -101,4 +131,3 @@ int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int len)
 
 	return ret;
 }
-
diff --git a/fs/dlm/midcomms.h b/fs/dlm/midcomms.h
index 61e90a921849..9ac1190ce277 100644
--- a/fs/dlm/midcomms.h
+++ b/fs/dlm/midcomms.h
@@ -13,6 +13,14 @@
 #define __MIDCOMMS_DOT_H__
 
 int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int buflen);
+struct dlm_mhandle *dlm_midcomms_get_mhandle(int nodeid, int len,
+					     gfp_t allocation, char **ppc);
+void dlm_midcomms_commit_mhandle(struct dlm_mhandle *mh);
+int dlm_midcomms_close(int nodeid);
+int dlm_midcomms_start(void);
+void dlm_midcomms_shutdown(void);
+void dlm_midcomms_add_member(int nodeid);
+void dlm_midcomms_remove_member(int nodeid);
 
 #endif				/* __MIDCOMMS_DOT_H__ */
 
diff --git a/fs/dlm/rcom.c b/fs/dlm/rcom.c
index f5b1bd65728d..2661674364af 100644
--- a/fs/dlm/rcom.c
+++ b/fs/dlm/rcom.c
@@ -27,20 +27,10 @@ static int rcom_response(struct dlm_ls *ls)
 	return test_bit(LSFL_RCOM_READY, &ls->ls_flags);
 }
 
-static int create_rcom(struct dlm_ls *ls, int to_nodeid, int type, int len,
-		       struct dlm_rcom **rc_ret, struct dlm_mhandle **mh_ret)
+static void _create_rcom(struct dlm_ls *ls, int to_nodeid, int type, int len,
+			 struct dlm_rcom **rc_ret, char *mb, int mb_len)
 {
 	struct dlm_rcom *rc;
-	struct dlm_mhandle *mh;
-	char *mb;
-	int mb_len = sizeof(struct dlm_rcom) + len;
-
-	mh = dlm_lowcomms_get_buffer(to_nodeid, mb_len, GFP_NOFS, &mb);
-	if (!mh) {
-		log_print("create_rcom to %d type %d len %d ENOBUFS",
-			  to_nodeid, type, len);
-		return -ENOBUFS;
-	}
 
 	rc = (struct dlm_rcom *) mb;
 
@@ -56,15 +46,64 @@ static int create_rcom(struct dlm_ls *ls, int to_nodeid, int type, int len,
 	rc->rc_seq = ls->ls_recover_seq;
 	spin_unlock(&ls->ls_recover_lock);
 
-	*mh_ret = mh;
 	*rc_ret = rc;
+}
+
+static int create_rcom(struct dlm_ls *ls, int to_nodeid, int type, int len,
+		       struct dlm_rcom **rc_ret, struct dlm_mhandle **mh_ret)
+{
+	int mb_len = sizeof(struct dlm_rcom) + len;
+	struct dlm_mhandle *mh;
+	char *mb;
+
+	mh = dlm_midcomms_get_mhandle(to_nodeid, mb_len, GFP_NOFS, &mb);
+	if (!mh) {
+		log_print("%s to %d type %d len %d ENOBUFS",
+			  __func__, to_nodeid, type, len);
+		return -ENOBUFS;
+	}
+
+	_create_rcom(ls, to_nodeid, type, len, rc_ret, mb, mb_len);
+	*mh_ret = mh;
 	return 0;
 }
 
+static int create_rcom_stateless(struct dlm_ls *ls, int to_nodeid, int type,
+				 int len, struct dlm_rcom **rc_ret,
+				 void **mh_ret)
+{
+	int mb_len = sizeof(struct dlm_rcom) + len;
+	void *mh;
+	char *mb;
+
+	mh = dlm_lowcomms_get_buffer(to_nodeid, mb_len, GFP_NOFS, &mb);
+	if (!mh) {
+		log_print("create_rcom to %d type %d len %d ENOBUFS",
+			  to_nodeid, type, len);
+		return -ENOBUFS;
+	}
+
+	_create_rcom(ls, to_nodeid, type, len, rc_ret, mb, mb_len);
+	*mh_ret = mh;
+	return 0;
+}
+
+static void _send_rcom(struct dlm_ls *ls, struct dlm_rcom *rc)
+{
+	dlm_rcom_out(rc);
+}
+
 static void send_rcom(struct dlm_ls *ls, struct dlm_mhandle *mh,
 		      struct dlm_rcom *rc)
 {
-	dlm_rcom_out(rc);
+	_send_rcom(ls, rc);
+	dlm_midcomms_commit_mhandle(mh);
+}
+
+static void send_rcom_stateless(struct dlm_ls *ls, void *mh,
+				struct dlm_rcom *rc)
+{
+	_send_rcom(ls, rc);
 	dlm_lowcomms_commit_buffer(mh);
 }
 
@@ -141,8 +180,8 @@ static void disallow_sync_reply(struct dlm_ls *ls)
 int dlm_rcom_status(struct dlm_ls *ls, int nodeid, uint32_t status_flags)
 {
 	struct dlm_rcom *rc;
-	struct dlm_mhandle *mh;
 	int error = 0;
+	void *mh;
 
 	ls->ls_recover_nodeid = nodeid;
 
@@ -153,8 +192,8 @@ int dlm_rcom_status(struct dlm_ls *ls, int nodeid, uint32_t status_flags)
 	}
 
 retry:
-	error = create_rcom(ls, nodeid, DLM_RCOM_STATUS,
-			    sizeof(struct rcom_status), &rc, &mh);
+	error = create_rcom_stateless(ls, nodeid, DLM_RCOM_STATUS,
+				      sizeof(struct rcom_status), &rc, &mh);
 	if (error)
 		goto out;
 
@@ -163,7 +202,7 @@ int dlm_rcom_status(struct dlm_ls *ls, int nodeid, uint32_t status_flags)
 	allow_sync_reply(ls, &rc->rc_id);
 	memset(ls->ls_recover_buf, 0, LOWCOMMS_MAX_TX_BUFFER_LEN);
 
-	send_rcom(ls, mh, rc);
+	send_rcom_stateless(ls, mh, rc);
 
 	error = dlm_wait_function(ls, &rcom_response);
 	disallow_sync_reply(ls);
@@ -191,13 +230,13 @@ int dlm_rcom_status(struct dlm_ls *ls, int nodeid, uint32_t status_flags)
 static void receive_rcom_status(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 {
 	struct dlm_rcom *rc;
-	struct dlm_mhandle *mh;
 	struct rcom_status *rs;
 	uint32_t status;
 	int nodeid = rc_in->rc_header.h_nodeid;
 	int len = sizeof(struct rcom_config);
 	int num_slots = 0;
 	int error;
+	void *mh;
 
 	if (!dlm_slots_version(&rc_in->rc_header)) {
 		status = dlm_recover_status(ls);
@@ -218,8 +257,8 @@ static void receive_rcom_status(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 	len += num_slots * sizeof(struct rcom_slot);
 
  do_create:
-	error = create_rcom(ls, nodeid, DLM_RCOM_STATUS_REPLY,
-			    len, &rc, &mh);
+	error = create_rcom_stateless(ls, nodeid, DLM_RCOM_STATUS_REPLY,
+				      len, &rc, &mh);
 	if (error)
 		return;
 
@@ -246,7 +285,7 @@ static void receive_rcom_status(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 	spin_unlock(&ls->ls_recover_lock);
 
  do_send:
-	send_rcom(ls, mh, rc);
+	send_rcom_stateless(ls, mh, rc);
 }
 
 static void receive_sync_reply(struct dlm_ls *ls, struct dlm_rcom *rc_in)
@@ -271,13 +310,14 @@ static void receive_sync_reply(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 int dlm_rcom_names(struct dlm_ls *ls, int nodeid, char *last_name, int last_len)
 {
 	struct dlm_rcom *rc;
-	struct dlm_mhandle *mh;
 	int error = 0;
+	void *mh;
 
 	ls->ls_recover_nodeid = nodeid;
 
 retry:
-	error = create_rcom(ls, nodeid, DLM_RCOM_NAMES, last_len, &rc, &mh);
+	error = create_rcom_stateless(ls, nodeid, DLM_RCOM_NAMES, last_len,
+				      &rc, &mh);
 	if (error)
 		goto out;
 	memcpy(rc->rc_buf, last_name, last_len);
@@ -285,7 +325,7 @@ int dlm_rcom_names(struct dlm_ls *ls, int nodeid, char *last_name, int last_len)
 	allow_sync_reply(ls, &rc->rc_id);
 	memset(ls->ls_recover_buf, 0, LOWCOMMS_MAX_TX_BUFFER_LEN);
 
-	send_rcom(ls, mh, rc);
+	send_rcom_stateless(ls, mh, rc);
 
 	error = dlm_wait_function(ls, &rcom_response);
 	disallow_sync_reply(ls);
@@ -298,14 +338,15 @@ int dlm_rcom_names(struct dlm_ls *ls, int nodeid, char *last_name, int last_len)
 static void receive_rcom_names(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 {
 	struct dlm_rcom *rc;
-	struct dlm_mhandle *mh;
 	int error, inlen, outlen, nodeid;
+	void *mh;
 
 	nodeid = rc_in->rc_header.h_nodeid;
 	inlen = rc_in->rc_header.h_length - sizeof(struct dlm_rcom);
 	outlen = LOWCOMMS_MAX_TX_BUFFER_LEN - sizeof(struct dlm_rcom);
 
-	error = create_rcom(ls, nodeid, DLM_RCOM_NAMES_REPLY, outlen, &rc, &mh);
+	error = create_rcom_stateless(ls, nodeid, DLM_RCOM_NAMES_REPLY, outlen,
+				      &rc, &mh);
 	if (error)
 		return;
 	rc->rc_id = rc_in->rc_id;
@@ -313,7 +354,7 @@ static void receive_rcom_names(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 
 	dlm_copy_master_names(ls, rc_in->rc_buf, inlen, rc->rc_buf, outlen,
 			      nodeid);
-	send_rcom(ls, mh, rc);
+	send_rcom_stateless(ls, mh, rc);
 }
 
 int dlm_send_rcom_lookup(struct dlm_rsb *r, int dir_nodeid)
@@ -458,7 +499,7 @@ int dlm_send_ls_not_ready(int nodeid, struct dlm_rcom *rc_in)
 	char *mb;
 	int mb_len = sizeof(struct dlm_rcom) + sizeof(struct rcom_config);
 
-	mh = dlm_lowcomms_get_buffer(nodeid, mb_len, GFP_NOFS, &mb);
+	mh = dlm_midcomms_get_mhandle(nodeid, mb_len, GFP_NOFS, &mb);
 	if (!mh)
 		return -ENOBUFS;
 
@@ -479,7 +520,7 @@ int dlm_send_ls_not_ready(int nodeid, struct dlm_rcom *rc_in)
 	rf->rf_lvblen = cpu_to_le32(~0U);
 
 	dlm_rcom_out(rc);
-	dlm_lowcomms_commit_buffer(mh);
+	dlm_midcomms_commit_mhandle(mh);
 
 	return 0;
 }
-- 
2.26.3

