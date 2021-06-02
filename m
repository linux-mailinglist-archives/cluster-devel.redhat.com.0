Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 319F7398AF9
	for <lists+cluster-devel@lfdr.de>; Wed,  2 Jun 2021 15:46:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622641593;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=w09y/l8qBTV0pSdlaYlkM97/JZLNtRNCU0TZm8ZumtU=;
	b=ISANYt5ubGAWU6EizvqMR9++hw3AWr3goxtAZvRUCMH8XvUvQ9nHyYEdTycUltLy+APG+C
	u4mTk/Eb0gF4992Rtvv/DwvXzUf/ws4NOoh4z+KD1+yd5nLdVQ4zNGTHK/61VNiHFc6oJX
	aOiRkE4y2lEdpUzXe1SnuXEC0CT7gHI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-Um28YpTJN0iotOqB5pW06g-1; Wed, 02 Jun 2021 09:46:31 -0400
X-MC-Unique: Um28YpTJN0iotOqB5pW06g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6A3E8AB39E;
	Wed,  2 Jun 2021 13:45:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA27618174;
	Wed,  2 Jun 2021 13:45:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 946F944A59;
	Wed,  2 Jun 2021 13:45:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 152Djoc8029997 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 2 Jun 2021 09:45:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0381D105C722; Wed,  2 Jun 2021 13:45:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-116-136.rdu2.redhat.com [10.10.116.136])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2FC9E1045E90;
	Wed,  2 Jun 2021 13:45:49 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed,  2 Jun 2021 09:45:20 -0400
Message-Id: <20210602134520.71030-6-aahringo@redhat.com>
In-Reply-To: <20210602134520.71030-1-aahringo@redhat.com>
References: <20210602134520.71030-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 6/6] fs: dlm: rename socket and app
	buffer defines
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

This patch renames DEFAULT_BUFFER_SIZE to DLM_MAX_SOCKET_BUFSIZE and
LOWCOMMS_MAX_TX_BUFFER_LEN to DLM_MAX_APP_BUFSIZE as they are proper
names to define what's behind those values. The DLM_MAX_SOCKET_BUFSIZE
defines the maximum size of buffer which can be handled on socket layer,
the DLM_MAX_APP_BUFSIZE defines the maximum size of buffer which can be
handled by the DLM application layer.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/config.c    | 4 ++--
 fs/dlm/config.h    | 2 +-
 fs/dlm/lockspace.c | 2 +-
 fs/dlm/lowcomms.c  | 4 ++--
 fs/dlm/lowcomms.h  | 2 +-
 fs/dlm/member.c    | 2 +-
 fs/dlm/midcomms.c  | 4 ++--
 fs/dlm/rcom.c      | 6 +++---
 8 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/fs/dlm/config.c b/fs/dlm/config.c
index c91c1c73ed9d..42eee2783756 100644
--- a/fs/dlm/config.c
+++ b/fs/dlm/config.c
@@ -208,7 +208,7 @@ static int dlm_check_zero(unsigned int x)
 
 static int dlm_check_buffer_size(unsigned int x)
 {
-	if (x < DEFAULT_BUFFER_SIZE)
+	if (x < DLM_MAX_SOCKET_BUFSIZE)
 		return -EINVAL;
 
 	return 0;
@@ -962,7 +962,7 @@ int dlm_our_addr(struct sockaddr_storage *addr, int num)
 
 struct dlm_config_info dlm_config = {
 	.ci_tcp_port = DEFAULT_TCP_PORT,
-	.ci_buffer_size = DEFAULT_BUFFER_SIZE,
+	.ci_buffer_size = DLM_MAX_SOCKET_BUFSIZE,
 	.ci_rsbtbl_size = DEFAULT_RSBTBL_SIZE,
 	.ci_recover_timer = DEFAULT_RECOVER_TIMER,
 	.ci_toss_secs = DEFAULT_TOSS_SECS,
diff --git a/fs/dlm/config.h b/fs/dlm/config.h
index 00374b45c748..df92b0a07fc6 100644
--- a/fs/dlm/config.h
+++ b/fs/dlm/config.h
@@ -12,7 +12,7 @@
 #ifndef __CONFIG_DOT_H__
 #define __CONFIG_DOT_H__
 
-#define DEFAULT_BUFFER_SIZE     4096
+#define DLM_MAX_SOCKET_BUFSIZE	4096
 
 struct dlm_config_node {
 	int nodeid;
diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index 2b738be8d7e4..d71aba8c3e64 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -572,7 +572,7 @@ static int new_lockspace(const char *name, const char *cluster,
 	 * not having out of bounds issues. However on sending side 3.2
 	 * might send less.
 	 */
-	ls->ls_recover_buf = kmalloc(DEFAULT_BUFFER_SIZE, GFP_NOFS);
+	ls->ls_recover_buf = kmalloc(DLM_MAX_SOCKET_BUFSIZE, GFP_NOFS);
 	if (!ls->ls_recover_buf)
 		goto out_lkbidr;
 
diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index f2a3b0401b9c..0ea9ae35da0b 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1556,9 +1556,9 @@ struct dlm_msg *dlm_lowcomms_new_msg(int nodeid, int len, gfp_t allocation,
 	struct dlm_msg *msg;
 	int idx;
 
-	if (len > DEFAULT_BUFFER_SIZE ||
+	if (len > DLM_MAX_SOCKET_BUFSIZE ||
 	    len < sizeof(struct dlm_header)) {
-		BUILD_BUG_ON(PAGE_SIZE < DEFAULT_BUFFER_SIZE);
+		BUILD_BUG_ON(PAGE_SIZE < DLM_MAX_SOCKET_BUFSIZE);
 		log_print("failed to allocate a buffer of size %d", len);
 		WARN_ON(1);
 		return NULL;
diff --git a/fs/dlm/lowcomms.h b/fs/dlm/lowcomms.h
index 730c34317183..aaae7115c00d 100644
--- a/fs/dlm/lowcomms.h
+++ b/fs/dlm/lowcomms.h
@@ -15,7 +15,7 @@
 #include "dlm_internal.h"
 
 #define DLM_MIDCOMMS_OPT_LEN		sizeof(struct dlm_opts)
-#define LOWCOMMS_MAX_TX_BUFFER_LEN	(DEFAULT_BUFFER_SIZE - \
+#define DLM_MAX_APP_BUFSIZE		(DLM_MAX_SOCKET_BUFSIZE - \
 					 DLM_MIDCOMMS_OPT_LEN)
 
 #define CONN_HASH_SIZE 32
diff --git a/fs/dlm/member.c b/fs/dlm/member.c
index 63971c594bdc..d9e1e4170eb1 100644
--- a/fs/dlm/member.c
+++ b/fs/dlm/member.c
@@ -271,7 +271,7 @@ int dlm_slots_assign(struct dlm_ls *ls, int *num_slots, int *slots_size,
 
 	log_slots(ls, gen, num, NULL, array, array_size);
 
-	max_slots = (LOWCOMMS_MAX_TX_BUFFER_LEN - sizeof(struct dlm_rcom) -
+	max_slots = (DLM_MAX_APP_BUFSIZE - sizeof(struct dlm_rcom) -
 		     sizeof(struct rcom_config)) / sizeof(struct rcom_slot);
 
 	if (num > max_slots) {
diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index 4e36e418b6bf..7d217234b697 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -865,7 +865,7 @@ int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int len)
 	while (len >= sizeof(struct dlm_header)) {
 		hd = (struct dlm_header *)ptr;
 
-		/* no message should be more than DEFAULT_BUFFER_SIZE or
+		/* no message should be more than DLM_MAX_SOCKET_BUFSIZE or
 		 * less than dlm_header size.
 		 *
 		 * Some messages does not have a 8 byte length boundary yet
@@ -877,7 +877,7 @@ int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int len)
 		 * the next major version bump.
 		 */
 		msglen = le16_to_cpu(hd->h_length);
-		if (msglen > DEFAULT_BUFFER_SIZE ||
+		if (msglen > DLM_MAX_SOCKET_BUFSIZE ||
 		    msglen < sizeof(struct dlm_header)) {
 			log_print("received invalid length header: %u from node %d, will abort message parsing",
 				  msglen, nodeid);
diff --git a/fs/dlm/rcom.c b/fs/dlm/rcom.c
index a7727b9e5e83..5651933f54a4 100644
--- a/fs/dlm/rcom.c
+++ b/fs/dlm/rcom.c
@@ -202,7 +202,7 @@ int dlm_rcom_status(struct dlm_ls *ls, int nodeid, uint32_t status_flags)
 	set_rcom_status(ls, (struct rcom_status *)rc->rc_buf, status_flags);
 
 	allow_sync_reply(ls, &rc->rc_id);
-	memset(ls->ls_recover_buf, 0, DEFAULT_BUFFER_SIZE);
+	memset(ls->ls_recover_buf, 0, DLM_MAX_SOCKET_BUFSIZE);
 
 	send_rcom_stateless(ls, msg, rc);
 
@@ -325,7 +325,7 @@ int dlm_rcom_names(struct dlm_ls *ls, int nodeid, char *last_name, int last_len)
 	memcpy(rc->rc_buf, last_name, last_len);
 
 	allow_sync_reply(ls, &rc->rc_id);
-	memset(ls->ls_recover_buf, 0, DEFAULT_BUFFER_SIZE);
+	memset(ls->ls_recover_buf, 0, DLM_MAX_SOCKET_BUFSIZE);
 
 	send_rcom_stateless(ls, msg, rc);
 
@@ -345,7 +345,7 @@ static void receive_rcom_names(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 
 	nodeid = rc_in->rc_header.h_nodeid;
 	inlen = rc_in->rc_header.h_length - sizeof(struct dlm_rcom);
-	outlen = LOWCOMMS_MAX_TX_BUFFER_LEN - sizeof(struct dlm_rcom);
+	outlen = DLM_MAX_APP_BUFSIZE - sizeof(struct dlm_rcom);
 
 	error = create_rcom_stateless(ls, nodeid, DLM_RCOM_NAMES_REPLY, outlen,
 				      &rc, &msg);
-- 
2.26.3

