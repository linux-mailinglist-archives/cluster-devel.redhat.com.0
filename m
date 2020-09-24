Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9FE9E277407
	for <lists+cluster-devel@lfdr.de>; Thu, 24 Sep 2020 16:32:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600957964;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=C5DzxPnlhnyuvxGV1HPyY2rO3tsdhUjo6+WvMVJDFaI=;
	b=WsrRfB8deujwt8V1jfPSRKn0FopiP4lHwZq6j8MQtQz0q9yyzpzNQu44sGQpM6qEPeZxv0
	LoQUwgD75r8qcnYvFKJhMrRUovO91Mo9zwzwyiGz85fluKt3GVvXKQ4MVe9NdC7WZc1F0b
	frcmIqj18Sykzc8AKg317tcHRGWb84w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-Q_KHvIbFMG6XNQTp6yG0IQ-1; Thu, 24 Sep 2020 10:32:42 -0400
X-MC-Unique: Q_KHvIbFMG6XNQTp6yG0IQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 368B364094;
	Thu, 24 Sep 2020 14:32:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 240431002C06;
	Thu, 24 Sep 2020 14:32:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0CE438C7A3;
	Thu, 24 Sep 2020 14:32:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08OEWcjR001036 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 10:32:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 28D225D9DD; Thu, 24 Sep 2020 14:32:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-114-178.rdu2.redhat.com [10.10.114.178])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9453B5D9D3;
	Thu, 24 Sep 2020 14:32:37 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 24 Sep 2020 10:31:26 -0400
Message-Id: <20200924143126.158629-6-aahringo@redhat.com>
In-Reply-To: <20200924143126.158629-1-aahringo@redhat.com>
References: <20200924143126.158629-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 dlm/next 5/5] fs: dlm: rework receive
	handling
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch reworks the current receive handling of dlm. As I tried to
change the send handling to fix reorder issues I took a look into the
receive handling and simplified it, it works as the following:

Each connection has a preallocated receive buffer with a minimum length of
4096. On receive, the upper layer protocol will process all dlm message
until there is not enough data anymore. If there exists "leftover" data at
the end of the receive buffer because the dlm message wasn't fully received
it will be copied to the begin of the preallocated receive buffer. Next
receive more data will be appended to the previous "leftover" data and
processing will begin again.

This will remove a lot of code of the current mechanism. Inside the
processing functionality we will ensure with a memmove() that the dlm
message should be memory aligned. To have a dlm message always started
at the beginning of the buffer will reduce some amount of memmove()
calls because src and dest pointers are the same.

The cluster attribute "buffer_size" becomes a new meaning, it's now the
size of application layer receive buffer size. If this is changed during
runtime the receive buffer will be reallocated. It's important that the
receive buffer size has at minimum the size of the maximum possible dlm
message size otherwise the received message cannot be placed inside
the receive buffer size.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/config.c   |   1 -
 fs/dlm/config.h   |   2 +
 fs/dlm/lowcomms.c | 179 ++++++++++++++++++++++------------------------
 fs/dlm/midcomms.c | 136 ++++++++++++++---------------------
 fs/dlm/midcomms.h |   3 +-
 5 files changed, 141 insertions(+), 180 deletions(-)

diff --git a/fs/dlm/config.c b/fs/dlm/config.c
index a4bed304a8430..49c5f9407098e 100644
--- a/fs/dlm/config.c
+++ b/fs/dlm/config.c
@@ -166,7 +166,6 @@ static bool dlm_check_zero(unsigned int x)
 	return !x;
 }
 
-#define DEFAULT_BUFFER_SIZE     4096
 static bool dlm_check_buffer_size(unsigned int x)
 {
 	return (x < DEFAULT_BUFFER_SIZE);
diff --git a/fs/dlm/config.h b/fs/dlm/config.h
index 3b284ae9aeebd..c210250a25818 100644
--- a/fs/dlm/config.h
+++ b/fs/dlm/config.h
@@ -12,6 +12,8 @@
 #ifndef __CONFIG_DOT_H__
 #define __CONFIG_DOT_H__
 
+#define DEFAULT_BUFFER_SIZE     4096
+
 struct dlm_config_node {
 	int nodeid;
 	int weight;
diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 96f84541867c4..b7b7360be609e 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -65,40 +65,6 @@
 #define MAX_SEND_MSG_COUNT 25
 #define DLM_SHUTDOWN_WAIT_TIMEOUT msecs_to_jiffies(10000)
 
-struct cbuf {
-	unsigned int base;
-	unsigned int len;
-	unsigned int mask;
-};
-
-static void cbuf_add(struct cbuf *cb, int n)
-{
-	cb->len += n;
-}
-
-static int cbuf_data(struct cbuf *cb)
-{
-	return ((cb->base + cb->len) & cb->mask);
-}
-
-static void cbuf_init(struct cbuf *cb, int size)
-{
-	cb->base = cb->len = 0;
-	cb->mask = size-1;
-}
-
-static void cbuf_eat(struct cbuf *cb, int n)
-{
-	cb->len  -= n;
-	cb->base += n;
-	cb->base &= cb->mask;
-}
-
-static bool cbuf_empty(struct cbuf *cb)
-{
-	return cb->len == 0;
-}
-
 struct connection {
 	struct socket *sock;	/* NULL if not connected */
 	uint32_t nodeid;	/* So we know who we are in the list */
@@ -117,8 +83,6 @@ struct connection {
 	int (*rx_action) (struct connection *);	/* What to do when active */
 	void (*connect_action) (struct connection *);	/* What to do to connect */
 	void (*shutdown_action)(struct connection *con); /* What to do to shutdown */
-	struct page *rx_page;
-	struct cbuf cb;
 	int retries;
 #define MAX_CONNECT_RETRIES 3
 	struct hlist_node list;
@@ -126,6 +90,9 @@ struct connection {
 	struct work_struct rwork; /* Receive workqueue */
 	struct work_struct swork; /* Send workqueue */
 	wait_queue_head_t shutdown_wait; /* wait for graceful shutdown */
+	unsigned char *rx_buf;
+	int rx_buflen;
+	int rx_leftover;
 	struct rcu_head rcu;
 };
 #define sock2con(x) ((struct connection *)(x)->sk_user_data)
@@ -219,6 +186,13 @@ static struct connection *nodeid2con(int nodeid, gfp_t alloc)
 	if (!con)
 		return NULL;
 
+	con->rx_buflen = dlm_config.ci_buffer_size;
+	con->rx_buf = kmalloc(con->rx_buflen, GFP_NOFS);
+	if (!con->rx_buf) {
+		kfree(con);
+		return NULL;
+	}
+
 	con->nodeid = nodeid;
 	mutex_init(&con->sock_mutex);
 	INIT_LIST_HEAD(&con->writequeue);
@@ -613,11 +587,8 @@ static void close_connection(struct connection *con, bool and_other,
 		/* Will only re-enter once. */
 		close_connection(con->othercon, false, true, true);
 	}
-	if (con->rx_page) {
-		__free_page(con->rx_page);
-		con->rx_page = NULL;
-	}
 
+	con->rx_leftover = 0;
 	con->retries = 0;
 	mutex_unlock(&con->sock_mutex);
 	clear_bit(CF_CLOSING, &con->flags);
@@ -671,16 +642,33 @@ static void dlm_tcp_shutdown(struct connection *con)
 	shutdown_connection(con);
 }
 
+static int con_realloc_receive_buf(struct connection *con, int newlen)
+{
+	unsigned char *newbuf;
+
+	newbuf = kmalloc(newlen, GFP_NOFS);
+	if (!newbuf)
+		return -ENOMEM;
+
+	/* copy any leftover from last receive */
+	if (con->rx_leftover)
+		memmove(newbuf, con->rx_buf, con->rx_leftover);
+
+	/* swap to new buffer space */
+	kfree(con->rx_buf);
+	con->rx_buflen = newlen;
+	con->rx_buf = newbuf;
+
+	return 0;
+}
+
 /* Data received from remote end */
 static int receive_from_sock(struct connection *con)
 {
-	int ret = 0;
-	struct msghdr msg = {};
-	struct kvec iov[2];
-	unsigned len;
-	int r;
 	int call_again_soon = 0;
-	int nvec;
+	struct msghdr msg;
+	struct kvec iov;
+	int ret, buflen;
 
 	mutex_lock(&con->sock_mutex);
 
@@ -688,71 +676,55 @@ static int receive_from_sock(struct connection *con)
 		ret = -EAGAIN;
 		goto out_close;
 	}
+
 	if (con->nodeid == 0) {
 		ret = -EINVAL;
 		goto out_close;
 	}
 
-	if (con->rx_page == NULL) {
-		/*
-		 * This doesn't need to be atomic, but I think it should
-		 * improve performance if it is.
-		 */
-		con->rx_page = alloc_page(GFP_ATOMIC);
-		if (con->rx_page == NULL)
+	/* realloc if we get new buffer size to read out */
+	buflen = dlm_config.ci_buffer_size;
+	if (con->rx_buflen != buflen && con->rx_leftover <= buflen) {
+		ret = con_realloc_receive_buf(con, buflen);
+		if (ret < 0)
 			goto out_resched;
-		cbuf_init(&con->cb, PAGE_SIZE);
 	}
 
-	/*
-	 * iov[0] is the bit of the circular buffer between the current end
-	 * point (cb.base + cb.len) and the end of the buffer.
+	/* calculate new buffer parameter regarding last receive and
+	 * possible leftover bytes
 	 */
-	iov[0].iov_len = con->cb.base - cbuf_data(&con->cb);
-	iov[0].iov_base = page_address(con->rx_page) + cbuf_data(&con->cb);
-	iov[1].iov_len = 0;
-	nvec = 1;
+	iov.iov_base = con->rx_buf + con->rx_leftover;
+	iov.iov_len = con->rx_buflen - con->rx_leftover;
 
-	/*
-	 * iov[1] is the bit of the circular buffer between the start of the
-	 * buffer and the start of the currently used section (cb.base)
-	 */
-	if (cbuf_data(&con->cb) >= con->cb.base) {
-		iov[0].iov_len = PAGE_SIZE - cbuf_data(&con->cb);
-		iov[1].iov_len = con->cb.base;
-		iov[1].iov_base = page_address(con->rx_page);
-		nvec = 2;
-	}
-	len = iov[0].iov_len + iov[1].iov_len;
-	iov_iter_kvec(&msg.msg_iter, READ, iov, nvec, len);
-
-	r = ret = sock_recvmsg(con->sock, &msg, MSG_DONTWAIT | MSG_NOSIGNAL);
+	memset(&msg, 0, sizeof(msg));
+	msg.msg_flags = MSG_DONTWAIT | MSG_NOSIGNAL;
+	ret = kernel_recvmsg(con->sock, &msg, &iov, 1, iov.iov_len,
+			     msg.msg_flags);
 	if (ret <= 0)
 		goto out_close;
-	else if (ret == len)
+	else if (ret == iov.iov_len)
 		call_again_soon = 1;
 
-	cbuf_add(&con->cb, ret);
-	ret = dlm_process_incoming_buffer(con->nodeid,
-					  page_address(con->rx_page),
-					  con->cb.base, con->cb.len,
-					  PAGE_SIZE);
-	if (ret < 0) {
-		log_print("lowcomms err %d: addr=%p, base=%u, len=%u, read=%d",
-			  ret, page_address(con->rx_page), con->cb.base,
-			  con->cb.len, r);
-		cbuf_eat(&con->cb, r);
-	} else {
-		cbuf_eat(&con->cb, ret);
-	}
+	/* new buflen according readed bytes and leftover from last receive */
+	buflen = ret + con->rx_leftover;
+	ret = dlm_process_incoming_buffer(con->nodeid, con->rx_buf, buflen);
+	if (ret < 0)
+		goto out_close;
 
-	if (cbuf_empty(&con->cb) && !call_again_soon) {
-		__free_page(con->rx_page);
-		con->rx_page = NULL;
+	/* calculate leftover bytes from process and put it into begin of
+	 * the receive buffer, so next receive we have the full message
+	 * at the start address of the receive buffer.
+	 */
+	con->rx_leftover = buflen - ret;
+	if (con->rx_leftover) {
+		memmove(con->rx_buf, con->rx_buf + ret,
+			con->rx_leftover);
+		call_again_soon = true;
 	}
 
 	if (call_again_soon)
 		goto out_resched;
+
 	mutex_unlock(&con->sock_mutex);
 	return 0;
 
@@ -854,6 +826,17 @@ static int accept_from_sock(struct connection *con)
 				result = -ENOMEM;
 				goto accept_err;
 			}
+
+			othercon->rx_buflen = dlm_config.ci_buffer_size;
+			othercon->rx_buf = kmalloc(othercon->rx_buflen, GFP_NOFS);
+			if (!othercon->rx_buf) {
+				mutex_unlock(&newcon->sock_mutex);
+				kfree(othercon);
+				log_print("failed to allocate incoming socket receive buffer");
+				result = -ENOMEM;
+				goto accept_err;
+			}
+
 			othercon->nodeid = nodeid;
 			othercon->rx_action = receive_from_sock;
 			mutex_init(&othercon->sock_mutex);
@@ -1603,6 +1586,14 @@ static void shutdown_conn(struct connection *con)
 		con->shutdown_action(con);
 }
 
+static void connection_release(struct rcu_head *rcu)
+{
+	struct connection *con = container_of(rcu, struct connection, rcu);
+
+	kfree(con->rx_buf);
+	kfree(con);
+}
+
 static void free_conn(struct connection *con)
 {
 	close_connection(con, true, true, true);
@@ -1611,10 +1602,10 @@ static void free_conn(struct connection *con)
 	spin_unlock(&connections_lock);
 	if (con->othercon) {
 		clean_one_writequeue(con->othercon);
-		kfree_rcu(con->othercon, rcu);
+		call_rcu(&con->othercon->rcu, connection_release);
 	}
 	clean_one_writequeue(con);
-	kfree_rcu(con, rcu);
+	call_rcu(&con->rcu, connection_release);
 }
 
 static void work_flush(void)
diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index 921322d133e3d..fde3a6afe4bea 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -22,114 +22,84 @@
  * into packets and sends them to the comms layer.
  */
 
+#include <asm/unaligned.h>
+
 #include "dlm_internal.h"
 #include "lowcomms.h"
 #include "config.h"
 #include "lock.h"
 #include "midcomms.h"
 
-
-static void copy_from_cb(void *dst, const void *base, unsigned offset,
-			 unsigned len, unsigned limit)
-{
-	unsigned copy = len;
-
-	if ((copy + offset) > limit)
-		copy = limit - offset;
-	memcpy(dst, base + offset, copy);
-	len -= copy;
-	if (len)
-		memcpy(dst + copy, base, len);
-}
-
 /*
  * Called from the low-level comms layer to process a buffer of
  * commands.
- *
- * Only complete messages are processed here, any "spare" bytes from
- * the end of a buffer are saved and tacked onto the front of the next
- * message that comes in. I doubt this will happen very often but we
- * need to be able to cope with it and I don't want the task to be waiting
- * for packets to come in when there is useful work to be done.
  */
 
-int dlm_process_incoming_buffer(int nodeid, const void *base,
-				unsigned offset, unsigned len, unsigned limit)
+int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int len)
 {
-	union {
-		unsigned char __buf[DLM_INBUF_LEN];
-		/* this is to force proper alignment on some arches */
-		union dlm_packet p;
-	} __tmp;
-	union dlm_packet *p = &__tmp.p;
-	int ret = 0;
-	int err = 0;
+	const unsigned char *ptr = buf;
+	const struct dlm_header *hd;
 	uint16_t msglen;
-	uint32_t lockspace;
-
-	while (len > sizeof(struct dlm_header)) {
-
-		/* Copy just the header to check the total length.  The
-		   message may wrap around the end of the buffer back to the
-		   start, so we need to use a temp buffer and copy_from_cb. */
-
-		copy_from_cb(p, base, offset, sizeof(struct dlm_header),
-			     limit);
-
-		msglen = le16_to_cpu(p->header.h_length);
-		lockspace = p->header.h_lockspace;
+	int ret = 0;
 
-		err = -EINVAL;
-		if (msglen < sizeof(struct dlm_header))
-			break;
-		if (p->header.h_cmd == DLM_MSG) {
-			if (msglen < sizeof(struct dlm_message))
-				break;
-		} else {
-			if (msglen < sizeof(struct dlm_rcom))
-				break;
-		}
-		err = -E2BIG;
-		if (msglen > dlm_config.ci_buffer_size) {
-			log_print("message size %d from %d too big, buf len %d",
-				  msglen, nodeid, len);
-			break;
+	while (len >= sizeof(struct dlm_header)) {
+		hd = (struct dlm_header *)ptr;
+
+		/* no message should be more than this otherwise we
+		 * cannot deliver this message to upper layers
+		 */
+		msglen = get_unaligned_le16(&hd->h_length);
+		if (msglen > DEFAULT_BUFFER_SIZE) {
+			log_print("received invalid length header: %u, will abort message parsing",
+				  msglen);
+			return -EBADMSG;
 		}
-		err = 0;
-
-		/* If only part of the full message is contained in this
-		   buffer, then do nothing and wait for lowcomms to call
-		   us again later with more data.  We return 0 meaning
-		   we've consumed none of the input buffer. */
 
+		/* caller will take care that leftover
+		 * will be parsed next call with more data
+		 */
 		if (msglen > len)
 			break;
 
-		/* Allocate a larger temp buffer if the full message won't fit
-		   in the buffer on the stack (which should work for most
-		   ordinary messages). */
-
-		if (msglen > sizeof(__tmp) && p == &__tmp.p) {
-			p = kmalloc(dlm_config.ci_buffer_size, GFP_NOFS);
-			if (p == NULL)
-				return ret;
-		}
+		switch (hd->h_cmd) {
+		case DLM_MSG:
+			if (msglen < sizeof(struct dlm_message)) {
+				log_print("dlm msg too small: %u, will skip this message",
+					  msglen);
+				goto skip;
+			}
 
-		copy_from_cb(p, base, offset, msglen, limit);
+			break;
+		case DLM_RCOM:
+			if (msglen < sizeof(struct dlm_rcom)) {
+				log_print("dlm rcom msg too small: %u, will skip this message",
+					  msglen);
+				goto skip;
+			}
 
-		BUG_ON(lockspace != p->header.h_lockspace);
+			break;
+		default:
+			log_print("unsupported h_cmd received: %u, will skip this message",
+				  hd->h_cmd);
+			goto skip;
+		}
 
+		/* for aligned memory access, we just copy current message
+		 * to begin of the buffer which contains already parsed buffer
+		 * data and should provide align access for upper layers
+		 * because the start address of the buffer has a aligned
+		 * address. This memmove can be removed when the upperlayer
+		 * is capable of unaligned memory access.
+		 */
+		memmove(buf, ptr, msglen);
+		dlm_receive_buffer((union dlm_packet *)buf, nodeid);
+
+skip:
 		ret += msglen;
-		offset += msglen;
-		offset &= (limit - 1);
 		len -= msglen;
-
-		dlm_receive_buffer(p, nodeid);
+		ptr += msglen;
 	}
 
-	if (p != &__tmp.p)
-		kfree(p);
-
-	return err ? err : ret;
+	return ret;
 }
 
diff --git a/fs/dlm/midcomms.h b/fs/dlm/midcomms.h
index 2e122e81c8d0d..61e90a9218493 100644
--- a/fs/dlm/midcomms.h
+++ b/fs/dlm/midcomms.h
@@ -12,8 +12,7 @@
 #ifndef __MIDCOMMS_DOT_H__
 #define __MIDCOMMS_DOT_H__
 
-int dlm_process_incoming_buffer(int nodeid, const void *base, unsigned offset,
-				unsigned len, unsigned limit);
+int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int buflen);
 
 #endif				/* __MIDCOMMS_DOT_H__ */
 
-- 
2.26.2

