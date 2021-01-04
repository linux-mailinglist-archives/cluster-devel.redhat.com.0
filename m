Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6A25B2E9F2E
	for <lists+cluster-devel@lfdr.de>; Mon,  4 Jan 2021 22:00:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1609794048;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GFxrtw7xHl9RXrqLEKkB3Bg221hMF/bT7bBto5E3CP4=;
	b=Nb9EaSY79k+XyZymkJ75WeRxqm/z+rOS4KXBxLkKA0zTovuDGzqh3rbz1pHdFekpJj/FWM
	RmS2ZMeAe4qQtU+4qokA658Oraf0nrzOAHaTMr4kxCw8UnLRQgTWJX+E3GHAThqnUWiwxR
	1pRClwyHCMB6Ul3MA8+Rx+rEhwGiNw0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-GNKzY0I0P42f-xrld7Jagg-1; Mon, 04 Jan 2021 16:00:46 -0500
X-MC-Unique: GNKzY0I0P42f-xrld7Jagg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9921C73A8;
	Mon,  4 Jan 2021 21:00:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB1916A902;
	Mon,  4 Jan 2021 21:00:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9A95C1809CA0;
	Mon,  4 Jan 2021 21:00:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 104L0giV003714 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 4 Jan 2021 16:00:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7F0F4272AD; Mon,  4 Jan 2021 21:00:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-75.rdu2.redhat.com [10.10.115.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0853C2719F;
	Mon,  4 Jan 2021 21:00:41 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  4 Jan 2021 16:00:13 -0500
Message-Id: <20210104210024.233765-10-aahringo@redhat.com>
In-Reply-To: <20210104210024.233765-1-aahringo@redhat.com>
References: <20210104210024.233765-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv3 dlm/next 09/20] fs: dlm: add more midcomms
	hooks
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

This patch prepares hooks to redirect to the midcomms layer which will
be used by the midcomms re-transmit handling.

There exists the new concept of stateless buffers allocation and
commits. This can be used to bypass the midcomms re-transmit handling. It
is used by RCOM_STATUS and RCOM_NAMES messages, because they have their
own ping-like re-transmit handling. As well these two messages will be
used to determine the DLM version per node, because these two messages
are per observation the first messages which are exchanged.

The midcomms_remove_member() hook should be called when there is nothing
to send to the other node and the other node is still capable to
transmit dlm messages to the other node which called
midcomms_remove_member(). I experienced that the dlm protocol has a lack
of support for synchronize this event on protocol level. The result was
that there was still something to transmit but the other node was already
gone. This hook can be used to provide such synchronization. Although I
am not totally sure about the placement of this hook, I did not observed
issues yet when providing such synchronization on protocol layer.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/config.c    |  3 ++-
 fs/dlm/lock.c      |  6 ++---
 fs/dlm/lockspace.c |  5 +++--
 fs/dlm/member.c    | 16 ++++++++++++++
 fs/dlm/member.h    |  1 +
 fs/dlm/midcomms.c  | 44 +++++++++++++++++++++++++++++++++++++
 fs/dlm/midcomms.h  | 10 +++++++++
 fs/dlm/rcom.c      | 55 +++++++++++++++++++++++++++-------------------
 fs/dlm/recoverd.c  |  3 +++
 9 files changed, 115 insertions(+), 28 deletions(-)

diff --git a/fs/dlm/config.c b/fs/dlm/config.c
index ab26cf135710..ba8b1f104df3 100644
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
index b93df39d0915..b3fd823009f4 100644
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
@@ -3537,7 +3537,7 @@ static int _create_message(struct dlm_ls *ls, int mb_len,
 	   pass into lowcomms_commit and a message buffer (mb) that we
 	   write our data into */
 
-	mh = dlm_lowcomms_get_buffer(to_nodeid, mb_len, GFP_NOFS, &mb);
+	mh = dlm_midcomms_get_buffer(to_nodeid, mb_len, GFP_NOFS, &mb);
 	if (!mh)
 		return -ENOBUFS;
 
@@ -3589,7 +3589,7 @@ static int create_message(struct dlm_rsb *r, struct dlm_lkb *lkb,
 static int send_message(struct dlm_mhandle *mh, struct dlm_message *ms)
 {
 	dlm_message_out(ms);
-	dlm_lowcomms_commit_buffer(mh);
+	dlm_midcomms_commit_buffer(mh);
 	return 0;
 }
 
diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index 561dcad08ad6..c9e0f5ac9f9a 100644
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
@@ -407,7 +408,7 @@ static int threads_start(void)
 static void threads_stop(void)
 {
 	dlm_scand_stop();
-	dlm_lowcomms_stop();
+	dlm_midcomms_stop();
 }
 
 static int new_lockspace(const char *name, const char *cluster,
diff --git a/fs/dlm/member.c b/fs/dlm/member.c
index ceef3f2074ff..8291566766f3 100644
--- a/fs/dlm/member.c
+++ b/fs/dlm/member.c
@@ -15,6 +15,7 @@
 #include "recover.h"
 #include "rcom.h"
 #include "config.h"
+#include "midcomms.h"
 #include "lowcomms.h"
 
 int dlm_slots_version(struct dlm_header *h)
@@ -521,6 +522,20 @@ static struct dlm_config_node *find_config_node(struct dlm_recover *rv,
 	return NULL;
 }
 
+void dlm_flush_removed_members(struct dlm_ls *ls, struct dlm_recover *rv)
+{
+	const struct dlm_config_node *node;
+	const struct dlm_member *memb;
+
+	list_for_each_entry(memb, &ls->ls_nodes, list) {
+		node = find_config_node(rv, memb->nodeid);
+		if (node && !node->new)
+			continue;
+
+		midcomms_remove_member(memb->nodeid);
+	}
+}
+
 int dlm_recover_members(struct dlm_ls *ls, struct dlm_recover *rv, int *neg_out)
 {
 	struct dlm_member *memb, *safe;
@@ -563,6 +578,7 @@ int dlm_recover_members(struct dlm_ls *ls, struct dlm_recover *rv, int *neg_out)
 		if (dlm_is_member(ls, node->nodeid))
 			continue;
 		dlm_add_member(ls, node);
+		midcomms_add_member(node->nodeid);
 		log_rinfo(ls, "add member %d", node->nodeid);
 	}
 
diff --git a/fs/dlm/member.h b/fs/dlm/member.h
index 433b2fac9f4a..3a6dd2324283 100644
--- a/fs/dlm/member.h
+++ b/fs/dlm/member.h
@@ -26,6 +26,7 @@ int dlm_slots_copy_in(struct dlm_ls *ls);
 int dlm_slots_assign(struct dlm_ls *ls, int *num_slots, int *slots_size,
 		     struct dlm_slot **slots_out, uint32_t *gen_out);
 void dlm_lsop_recover_done(struct dlm_ls *ls);
+void dlm_flush_removed_members(struct dlm_ls *ls, struct dlm_recover *rv);
 
 #endif                          /* __MEMBER_DOT_H__ */
 
diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index fde3a6afe4be..717a3ed34f6a 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -30,6 +30,50 @@
 #include "lock.h"
 #include "midcomms.h"
 
+void *dlm_midcomms_get_buffer(int nodeid, int len, gfp_t allocation, char **ppc)
+{
+	return dlm_lowcomms_get_buffer(nodeid, len, allocation, ppc);
+}
+
+void dlm_midcomms_commit_buffer(void *mh)
+{
+	dlm_lowcomms_commit_buffer(mh);
+}
+
+void *dlm_midcomms_stateless_get_buffer(int nodeid, int len, gfp_t allocation,
+					char **ppc)
+{
+	return dlm_lowcomms_get_buffer(nodeid, len, allocation, ppc);
+}
+
+void dlm_midcomms_stateless_commit_buffer(void *mh)
+{
+	dlm_lowcomms_commit_buffer(mh);
+}
+
+void midcomms_add_member(int nodeid)
+{
+}
+
+void midcomms_remove_member(int nodeid)
+{
+}
+
+int dlm_midcomms_close(int nodeid)
+{
+	return dlm_lowcomms_close(nodeid);
+}
+
+int dlm_midcomms_start(void)
+{
+	return dlm_lowcomms_start();
+}
+
+void dlm_midcomms_stop(void)
+{
+	dlm_lowcomms_stop();
+}
+
 /*
  * Called from the low-level comms layer to process a buffer of
  * commands.
diff --git a/fs/dlm/midcomms.h b/fs/dlm/midcomms.h
index 61e90a921849..134c57430cdd 100644
--- a/fs/dlm/midcomms.h
+++ b/fs/dlm/midcomms.h
@@ -13,6 +13,16 @@
 #define __MIDCOMMS_DOT_H__
 
 int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int buflen);
+void *dlm_midcomms_get_buffer(int nodeid, int len, gfp_t allocation, char **ppc);
+void dlm_midcomms_commit_buffer(void *mh);
+void *dlm_midcomms_stateless_get_buffer(int nodeid, int len, gfp_t allocation,
+					char **ppc);
+void dlm_midcomms_stateless_commit_buffer(void *mh);
+void midcomms_add_member(int nodeid);
+void midcomms_remove_member(int nodeid);
+int dlm_midcomms_close(int nodeid);
+int dlm_midcomms_start(void);
+void dlm_midcomms_stop(void);
 
 #endif				/* __MIDCOMMS_DOT_H__ */
 
diff --git a/fs/dlm/rcom.c b/fs/dlm/rcom.c
index f5b1bd65728d..7a7d4a8e4706 100644
--- a/fs/dlm/rcom.c
+++ b/fs/dlm/rcom.c
@@ -28,14 +28,18 @@ static int rcom_response(struct dlm_ls *ls)
 }
 
 static int create_rcom(struct dlm_ls *ls, int to_nodeid, int type, int len,
-		       struct dlm_rcom **rc_ret, struct dlm_mhandle **mh_ret)
+		       struct dlm_rcom **rc_ret, struct dlm_mhandle **mh_ret,
+		       bool stateless)
 {
 	struct dlm_rcom *rc;
 	struct dlm_mhandle *mh;
 	char *mb;
 	int mb_len = sizeof(struct dlm_rcom) + len;
 
-	mh = dlm_lowcomms_get_buffer(to_nodeid, mb_len, GFP_NOFS, &mb);
+	if (stateless)
+		mh = dlm_midcomms_stateless_get_buffer(to_nodeid, mb_len, GFP_NOFS, &mb);
+	else
+		mh = dlm_midcomms_get_buffer(to_nodeid, mb_len, GFP_NOFS, &mb);
 	if (!mh) {
 		log_print("create_rcom to %d type %d len %d ENOBUFS",
 			  to_nodeid, type, len);
@@ -62,10 +66,13 @@ static int create_rcom(struct dlm_ls *ls, int to_nodeid, int type, int len,
 }
 
 static void send_rcom(struct dlm_ls *ls, struct dlm_mhandle *mh,
-		      struct dlm_rcom *rc)
+		      struct dlm_rcom *rc, bool stateless)
 {
 	dlm_rcom_out(rc);
-	dlm_lowcomms_commit_buffer(mh);
+	if (stateless)
+		dlm_midcomms_stateless_commit_buffer(mh);
+	else
+		dlm_midcomms_commit_buffer(mh);
 }
 
 static void set_rcom_status(struct dlm_ls *ls, struct rcom_status *rs,
@@ -154,7 +161,7 @@ int dlm_rcom_status(struct dlm_ls *ls, int nodeid, uint32_t status_flags)
 
 retry:
 	error = create_rcom(ls, nodeid, DLM_RCOM_STATUS,
-			    sizeof(struct rcom_status), &rc, &mh);
+			    sizeof(struct rcom_status), &rc, &mh, true);
 	if (error)
 		goto out;
 
@@ -163,7 +170,7 @@ int dlm_rcom_status(struct dlm_ls *ls, int nodeid, uint32_t status_flags)
 	allow_sync_reply(ls, &rc->rc_id);
 	memset(ls->ls_recover_buf, 0, LOWCOMMS_MAX_TX_BUFFER_LEN);
 
-	send_rcom(ls, mh, rc);
+	send_rcom(ls, mh, rc, true);
 
 	error = dlm_wait_function(ls, &rcom_response);
 	disallow_sync_reply(ls);
@@ -219,7 +226,7 @@ static void receive_rcom_status(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 
  do_create:
 	error = create_rcom(ls, nodeid, DLM_RCOM_STATUS_REPLY,
-			    len, &rc, &mh);
+			    len, &rc, &mh, true);
 	if (error)
 		return;
 
@@ -246,7 +253,7 @@ static void receive_rcom_status(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 	spin_unlock(&ls->ls_recover_lock);
 
  do_send:
-	send_rcom(ls, mh, rc);
+	send_rcom(ls, mh, rc, true);
 }
 
 static void receive_sync_reply(struct dlm_ls *ls, struct dlm_rcom *rc_in)
@@ -277,7 +284,8 @@ int dlm_rcom_names(struct dlm_ls *ls, int nodeid, char *last_name, int last_len)
 	ls->ls_recover_nodeid = nodeid;
 
 retry:
-	error = create_rcom(ls, nodeid, DLM_RCOM_NAMES, last_len, &rc, &mh);
+	error = create_rcom(ls, nodeid, DLM_RCOM_NAMES, last_len, &rc, &mh,
+			    true);
 	if (error)
 		goto out;
 	memcpy(rc->rc_buf, last_name, last_len);
@@ -285,7 +293,7 @@ int dlm_rcom_names(struct dlm_ls *ls, int nodeid, char *last_name, int last_len)
 	allow_sync_reply(ls, &rc->rc_id);
 	memset(ls->ls_recover_buf, 0, LOWCOMMS_MAX_TX_BUFFER_LEN);
 
-	send_rcom(ls, mh, rc);
+	send_rcom(ls, mh, rc, true);
 
 	error = dlm_wait_function(ls, &rcom_response);
 	disallow_sync_reply(ls);
@@ -305,7 +313,8 @@ static void receive_rcom_names(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 	inlen = rc_in->rc_header.h_length - sizeof(struct dlm_rcom);
 	outlen = LOWCOMMS_MAX_TX_BUFFER_LEN - sizeof(struct dlm_rcom);
 
-	error = create_rcom(ls, nodeid, DLM_RCOM_NAMES_REPLY, outlen, &rc, &mh);
+	error = create_rcom(ls, nodeid, DLM_RCOM_NAMES_REPLY, outlen, &rc, &mh,
+			    true);
 	if (error)
 		return;
 	rc->rc_id = rc_in->rc_id;
@@ -313,7 +322,7 @@ static void receive_rcom_names(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 
 	dlm_copy_master_names(ls, rc_in->rc_buf, inlen, rc->rc_buf, outlen,
 			      nodeid);
-	send_rcom(ls, mh, rc);
+	send_rcom(ls, mh, rc, true);
 }
 
 int dlm_send_rcom_lookup(struct dlm_rsb *r, int dir_nodeid)
@@ -324,13 +333,13 @@ int dlm_send_rcom_lookup(struct dlm_rsb *r, int dir_nodeid)
 	int error;
 
 	error = create_rcom(ls, dir_nodeid, DLM_RCOM_LOOKUP, r->res_length,
-			    &rc, &mh);
+			    &rc, &mh, false);
 	if (error)
 		goto out;
 	memcpy(rc->rc_buf, r->res_name, r->res_length);
 	rc->rc_id = (unsigned long) r->res_id;
 
-	send_rcom(ls, mh, rc);
+	send_rcom(ls, mh, rc, false);
  out:
 	return error;
 }
@@ -342,7 +351,8 @@ static void receive_rcom_lookup(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 	int error, ret_nodeid, nodeid = rc_in->rc_header.h_nodeid;
 	int len = rc_in->rc_header.h_length - sizeof(struct dlm_rcom);
 
-	error = create_rcom(ls, nodeid, DLM_RCOM_LOOKUP_REPLY, 0, &rc, &mh);
+	error = create_rcom(ls, nodeid, DLM_RCOM_LOOKUP_REPLY, 0, &rc, &mh,
+			    false);
 	if (error)
 		return;
 
@@ -361,7 +371,7 @@ static void receive_rcom_lookup(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 	rc->rc_id = rc_in->rc_id;
 	rc->rc_seq_reply = rc_in->rc_seq;
 
-	send_rcom(ls, mh, rc);
+	send_rcom(ls, mh, rc, false);
 }
 
 static void receive_rcom_lookup_reply(struct dlm_ls *ls, struct dlm_rcom *rc_in)
@@ -410,7 +420,8 @@ int dlm_send_rcom_lock(struct dlm_rsb *r, struct dlm_lkb *lkb)
 	if (lkb->lkb_lvbptr)
 		len += ls->ls_lvblen;
 
-	error = create_rcom(ls, r->res_nodeid, DLM_RCOM_LOCK, len, &rc, &mh);
+	error = create_rcom(ls, r->res_nodeid, DLM_RCOM_LOCK, len, &rc, &mh,
+			    false);
 	if (error)
 		goto out;
 
@@ -418,7 +429,7 @@ int dlm_send_rcom_lock(struct dlm_rsb *r, struct dlm_lkb *lkb)
 	pack_rcom_lock(r, lkb, rl);
 	rc->rc_id = (unsigned long) r;
 
-	send_rcom(ls, mh, rc);
+	send_rcom(ls, mh, rc, false);
  out:
 	return error;
 }
@@ -433,7 +444,7 @@ static void receive_rcom_lock(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 	dlm_recover_master_copy(ls, rc_in);
 
 	error = create_rcom(ls, nodeid, DLM_RCOM_LOCK_REPLY,
-			    sizeof(struct rcom_lock), &rc, &mh);
+			    sizeof(struct rcom_lock), &rc, &mh, false);
 	if (error)
 		return;
 
@@ -444,7 +455,7 @@ static void receive_rcom_lock(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 	rc->rc_id = rc_in->rc_id;
 	rc->rc_seq_reply = rc_in->rc_seq;
 
-	send_rcom(ls, mh, rc);
+	send_rcom(ls, mh, rc, false);
 }
 
 /* If the lockspace doesn't exist then still send a status message
@@ -458,7 +469,7 @@ int dlm_send_ls_not_ready(int nodeid, struct dlm_rcom *rc_in)
 	char *mb;
 	int mb_len = sizeof(struct dlm_rcom) + sizeof(struct rcom_config);
 
-	mh = dlm_lowcomms_get_buffer(nodeid, mb_len, GFP_NOFS, &mb);
+	mh = dlm_midcomms_get_buffer(nodeid, mb_len, GFP_NOFS, &mb);
 	if (!mh)
 		return -ENOBUFS;
 
@@ -479,7 +490,7 @@ int dlm_send_ls_not_ready(int nodeid, struct dlm_rcom *rc_in)
 	rf->rf_lvblen = cpu_to_le32(~0U);
 
 	dlm_rcom_out(rc);
-	dlm_lowcomms_commit_buffer(mh);
+	dlm_midcomms_commit_buffer(mh);
 
 	return 0;
 }
diff --git a/fs/dlm/recoverd.c b/fs/dlm/recoverd.c
index 85e245392715..624fd54edeeb 100644
--- a/fs/dlm/recoverd.c
+++ b/fs/dlm/recoverd.c
@@ -16,6 +16,7 @@
 #include "ast.h"
 #include "recover.h"
 #include "lowcomms.h"
+#include "midcomms.h"
 #include "lock.h"
 #include "requestqueue.h"
 #include "recoverd.h"
@@ -53,6 +54,8 @@ static int ls_recover(struct dlm_ls *ls, struct dlm_recover *rv)
 	unsigned long start;
 	int error, neg = 0;
 
+	dlm_flush_removed_members(ls, rv);
+
 	log_rinfo(ls, "dlm_recover %llu", (unsigned long long)rv->seq);
 
 	mutex_lock(&ls->ls_recoverd_active);
-- 
2.26.2

