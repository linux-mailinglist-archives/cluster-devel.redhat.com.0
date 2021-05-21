Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 70BF938CDF8
	for <lists+cluster-devel@lfdr.de>; Fri, 21 May 2021 21:09:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621624163;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=H9utq3+e94UDJA6uiYgPwhN3ut3HdjbdYs3lP929Ml0=;
	b=CyfdRA4YM12OoQoIrK0tbUICr4FsaCiS/Ow8+naO5hoPUZ8yeCn/v+SA5hzJ+vBegwNFQ/
	1CCGp6qTuQC2BgL7QfN2paDdJtrY582kvai441tHC4MQ1Ta58kwg86fHgB4+RszNsRn5V+
	ikyeG45T1Go0dlmv54RaU013wt6/ZI4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279--0szzZGsNTKk5yECnT4ApA-1; Fri, 21 May 2021 15:09:21 -0400
X-MC-Unique: -0szzZGsNTKk5yECnT4ApA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8754A101F7D7;
	Fri, 21 May 2021 19:09:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 791E860BD8;
	Fri, 21 May 2021 19:09:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3C7D144A66;
	Fri, 21 May 2021 19:09:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14LJ9HGF005241 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 21 May 2021 15:09:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3DAF35C1BB; Fri, 21 May 2021 19:09:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-19.rdu2.redhat.com [10.10.115.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A64151E6;
	Fri, 21 May 2021 19:09:16 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 21 May 2021 15:08:45 -0400
Message-Id: <20210521190848.350176-14-aahringo@redhat.com>
In-Reply-To: <20210521190848.350176-1-aahringo@redhat.com>
References: <20210521190848.350176-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, gnault@redhat.com, pabeni@redhat.com
Subject: [Cluster-devel] [PATCHv6 v5.13-rc1 dlm/next 13/16] fs: dlm: add
	union in dlm header for lockspace id
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
 fs/dlm/rcom.c         | 4 ++--
 fs/dlm/util.c         | 6 ++++--
 4 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index e8dc5f4f1f9e..8f5980909d80 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -380,7 +380,10 @@ static inline int rsb_flag(struct dlm_rsb *r, enum rsb_flags flag)
 
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
index b625ce92464a..c502c065d007 100644
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
diff --git a/fs/dlm/rcom.c b/fs/dlm/rcom.c
index 6f653a339bea..7c1a06bcd418 100644
--- a/fs/dlm/rcom.c
+++ b/fs/dlm/rcom.c
@@ -35,7 +35,7 @@ static void _create_rcom(struct dlm_ls *ls, int to_nodeid, int type, int len,
 	rc = (struct dlm_rcom *) mb;
 
 	rc->rc_header.h_version = (DLM_HEADER_MAJOR | DLM_HEADER_MINOR);
-	rc->rc_header.h_lockspace = ls->ls_global_id;
+	rc->rc_header.u.h_lockspace = ls->ls_global_id;
 	rc->rc_header.h_nodeid = dlm_our_nodeid();
 	rc->rc_header.h_length = mb_len;
 	rc->rc_header.h_cmd = DLM_RCOM;
@@ -508,7 +508,7 @@ int dlm_send_ls_not_ready(int nodeid, struct dlm_rcom *rc_in)
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

