Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A2BBD2B28E9
	for <lists+cluster-devel@lfdr.de>; Fri, 13 Nov 2020 23:58:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605308327;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vr6f8e8yOJnQN0oEKKrpcG6XnSLVHuVDigZNGElCfCE=;
	b=M2WLLtOOgZ9C3B5+PPD+Sb4vdn6lWCJOmhBp8g0jbOk0LZ22yUQYHt5SKEnNI3QMUPfwzI
	i7BxdSZKvfD4edMeH5cLjOGheu91PzapflQeQZCGGorYT2WFJyXzL8nfY7BJ7tIS+XR3Gl
	vitahq8iesmQFjW5bAa4Y/qKOG9091I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-FqL2bmSGPf2OLFLObAm-hA-1; Fri, 13 Nov 2020 17:58:46 -0500
X-MC-Unique: FqL2bmSGPf2OLFLObAm-hA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97C8880477B;
	Fri, 13 Nov 2020 22:58:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 892B410013C0;
	Fri, 13 Nov 2020 22:58:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7555758104;
	Fri, 13 Nov 2020 22:58:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ADMwesw004055 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 13 Nov 2020 17:58:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CA1D45C70C; Fri, 13 Nov 2020 22:58:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-117-120.rdu2.redhat.com [10.10.117.120])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 574DE171F4;
	Fri, 13 Nov 2020 22:58:40 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 13 Nov 2020 17:58:12 -0500
Message-Id: <20201113225814.461167-15-aahringo@redhat.com>
In-Reply-To: <20201113225814.461167-1-aahringo@redhat.com>
References: <20201113225814.461167-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [RFC PATCH dlm/next 14/16] fs: dlm: add union in
	dlm header for lockspace id
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

This patch adds union inside the lockspace id to handle it also for
another use case for a different dlm command.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/dlm_internal.h | 5 ++++-
 fs/dlm/lock.c         | 8 ++++----
 fs/dlm/midcomms.c     | 1 -
 fs/dlm/rcom.c         | 4 ++--
 fs/dlm/util.c         | 6 ++++--
 5 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index 04fe9f525ac7..917de7367a32 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -377,7 +377,10 @@ static inline int rsb_flag(struct dlm_rsb *r, enum rsb_flags flag)
 
 struct dlm_header {
 	uint32_t		h_version;
-	uint32_t		h_lockspace;
+	union {
+		/* for DLM_MSG and DLM_RCOM */
+		uint32_t	h_lockspace;
+	} u;
 	uint32_t		h_nodeid;	/* nodeid of sender */
 	uint16_t		h_length;
 	uint8_t			h_cmd;		/* DLM_MSG, DLM_RCOM */
diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index b3fd823009f4..daa5747c8556 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -3544,7 +3544,7 @@ static int _create_message(struct dlm_ls *ls, int mb_len,
 	ms = (struct dlm_message *) mb;
 
 	ms->m_header.h_version = (DLM_HEADER_MAJOR | DLM_HEADER_MINOR);
-	ms->m_header.h_lockspace = ls->ls_global_id;
+	ms->m_header.u.h_lockspace = ls->ls_global_id;
 	ms->m_header.h_nodeid = dlm_our_nodeid();
 	ms->m_header.h_length = mb_len;
 	ms->m_header.h_cmd = DLM_MSG;
@@ -5038,16 +5038,16 @@ void dlm_receive_buffer(union dlm_packet *p, int nodeid)
 
 	if (hd->h_nodeid != nodeid) {
 		log_print("invalid h_nodeid %d from %d lockspace %x",
-			  hd->h_nodeid, nodeid, hd->h_lockspace);
+			  hd->h_nodeid, nodeid, hd->u.h_lockspace);
 		return;
 	}
 
-	ls = dlm_find_lockspace_global(hd->h_lockspace);
+	ls = dlm_find_lockspace_global(hd->u.h_lockspace);
 	if (!ls) {
 		if (dlm_config.ci_log_debug) {
 			printk_ratelimited(KERN_DEBUG "dlm: invalid lockspace "
 				"%u from %d cmd %d type %d\n",
-				hd->h_lockspace, nodeid, hd->h_cmd, type);
+				hd->u.h_lockspace, nodeid, hd->h_cmd, type);
 		}
 
 		if (hd->h_cmd == DLM_RCOM && type == DLM_RCOM_STATUS)
diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index 139d87f1ba17..f157d8077b76 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -141,4 +141,3 @@ int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int len)
 
 	return ret;
 }
-
diff --git a/fs/dlm/rcom.c b/fs/dlm/rcom.c
index 7a7d4a8e4706..06f7a5f1d99d 100644
--- a/fs/dlm/rcom.c
+++ b/fs/dlm/rcom.c
@@ -49,7 +49,7 @@ static int create_rcom(struct dlm_ls *ls, int to_nodeid, int type, int len,
 	rc = (struct dlm_rcom *) mb;
 
 	rc->rc_header.h_version = (DLM_HEADER_MAJOR | DLM_HEADER_MINOR);
-	rc->rc_header.h_lockspace = ls->ls_global_id;
+	rc->rc_header.u.h_lockspace = ls->ls_global_id;
 	rc->rc_header.h_nodeid = dlm_our_nodeid();
 	rc->rc_header.h_length = mb_len;
 	rc->rc_header.h_cmd = DLM_RCOM;
@@ -476,7 +476,7 @@ int dlm_send_ls_not_ready(int nodeid, struct dlm_rcom *rc_in)
 	rc = (struct dlm_rcom *) mb;
 
 	rc->rc_header.h_version = (DLM_HEADER_MAJOR | DLM_HEADER_MINOR);
-	rc->rc_header.h_lockspace = rc_in->rc_header.h_lockspace;
+	rc->rc_header.u.h_lockspace = rc_in->rc_header.u.h_lockspace;
 	rc->rc_header.h_nodeid = dlm_our_nodeid();
 	rc->rc_header.h_length = mb_len;
 	rc->rc_header.h_cmd = DLM_RCOM;
diff --git a/fs/dlm/util.c b/fs/dlm/util.c
index 74a8c5bfe9b5..58acbcc2081a 100644
--- a/fs/dlm/util.c
+++ b/fs/dlm/util.c
@@ -23,7 +23,8 @@
 void header_out(struct dlm_header *hd)
 {
 	hd->h_version		= cpu_to_le32(hd->h_version);
-	hd->h_lockspace		= cpu_to_le32(hd->h_lockspace);
+	/* does it for others u32 in union as well */
+	hd->u.h_lockspace	= cpu_to_le32(hd->u.h_lockspace);
 	hd->h_nodeid		= cpu_to_le32(hd->h_nodeid);
 	hd->h_length		= cpu_to_le16(hd->h_length);
 }
@@ -31,7 +32,8 @@ void header_out(struct dlm_header *hd)
 void header_in(struct dlm_header *hd)
 {
 	hd->h_version		= le32_to_cpu(hd->h_version);
-	hd->h_lockspace		= le32_to_cpu(hd->h_lockspace);
+	/* does it for others u32 in union as well */
+	hd->u.h_lockspace	= le32_to_cpu(hd->u.h_lockspace);
 	hd->h_nodeid		= le32_to_cpu(hd->h_nodeid);
 	hd->h_length		= le16_to_cpu(hd->h_length);
 }
-- 
2.26.2

