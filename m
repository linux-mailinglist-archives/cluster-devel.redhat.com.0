Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 457E534ADA6
	for <lists+cluster-devel@lfdr.de>; Fri, 26 Mar 2021 18:34:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616780041;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6IQDIzLk/V8gXRNsTiDPraEP0M9QySTB5lr7TJ9F0sU=;
	b=FUjDBd50oo/WN5Rv5x1PlCUuCVzbX+Wn3RSKcF2viuxdyqnVrUJDT+gfstuPn9xChSxnKh
	hkTLWvHj8bIzw1nO9Tm/za5CdShwFYseWtug18O398Tnho6agiml2NEfU1LOfkwuS4MfY/
	pD1Q725dVWVPXAbTT3Pi1+GL6rnzrFg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-9zeMiMugPs-1LSzr3JkSmA-1; Fri, 26 Mar 2021 13:33:59 -0400
X-MC-Unique: 9zeMiMugPs-1LSzr3JkSmA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A3FF8189CD;
	Fri, 26 Mar 2021 17:33:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 19F3A226EE;
	Fri, 26 Mar 2021 17:33:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 001621800232;
	Fri, 26 Mar 2021 17:33:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12QHXrCZ009438 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 26 Mar 2021 13:33:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4660D1007606; Fri, 26 Mar 2021 17:33:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-117-90.rdu2.redhat.com [10.10.117.90])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9697D1002EE6;
	Fri, 26 Mar 2021 17:33:52 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 26 Mar 2021 13:33:35 -0400
Message-Id: <20210326173337.44231-7-aahringo@redhat.com>
In-Reply-To: <20210326173337.44231-1-aahringo@redhat.com>
References: <20210326173337.44231-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, pabeni@redhat.com, gnault@redhat.com
Subject: [Cluster-devel] [PATCHv3 dlm/next 6/8] fs: dlm: add union in dlm
	header for lockspace id
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
index 2ea0449a82ab..d86dcc95f736 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -149,4 +149,3 @@ int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int len)
 
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
2.26.3

