Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 670CA4C19B1
	for <lists+cluster-devel@lfdr.de>; Wed, 23 Feb 2022 18:15:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645636507;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5gYyGQkT1q6dwNQNbXeU7AP5d9Eoc3MZ7+q4pY4bx8M=;
	b=C5H5Ag676KBtlDcTOsWUxf1SF1hQBmuTDZwthNdoXYmgHwNsvTVkS0qRe5RrTBwD1QsMXb
	Y76Utynezf+Je9z/d3TRirKfUNC59OuCV++/G38GWxM/kKVXmccyqvkA6Owte1MtrI+3hV
	ZXC4jAEFwhvhGah2vH1PMZexuIRDPss=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250-KjbO1btDP3atPL4GoIzwdw-1; Wed, 23 Feb 2022 12:15:03 -0500
X-MC-Unique: KjbO1btDP3atPL4GoIzwdw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5527E1006AA7;
	Wed, 23 Feb 2022 17:15:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4306F838E2;
	Wed, 23 Feb 2022 17:15:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2E10B46F98;
	Wed, 23 Feb 2022 17:15:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21NH8rpM009279 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 23 Feb 2022 12:08:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 835F3838E6; Wed, 23 Feb 2022 17:08:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 24CF7838E9;
	Wed, 23 Feb 2022 17:08:53 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 23 Feb 2022 12:08:26 -0500
Message-Id: <20220223170829.830864-7-aahringo@redhat.com>
In-Reply-To: <20220223170829.830864-1-aahringo@redhat.com>
References: <20220223170829.830864-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, viro@zeniv.linux.org.uk
Subject: [Cluster-devel] [PATCH/RFC dlm/next 6/9] fs: dlm: move conversion
	to compile time
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch is a cleanup to move the byte order conversion to compile
time. In a simple comparison like this it's possible to move it to
static values so the compiler will always convert those values at
compile time.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/midcomms.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index bd4bed09ab2b..649efe120eee 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -571,14 +571,14 @@ dlm_midcomms_recv_node_lookup(int nodeid, const union dlm_packet *p,
 			return NULL;
 		}
 
-		switch (le32_to_cpu(p->rcom.rc_type)) {
-		case DLM_RCOM_NAMES:
+		switch (p->rcom.rc_type) {
+		case cpu_to_le32(DLM_RCOM_NAMES):
 			fallthrough;
-		case DLM_RCOM_NAMES_REPLY:
+		case cpu_to_le32(DLM_RCOM_NAMES_REPLY):
 			fallthrough;
-		case DLM_RCOM_STATUS:
+		case cpu_to_le32(DLM_RCOM_STATUS):
 			fallthrough;
-		case DLM_RCOM_STATUS_REPLY:
+		case cpu_to_le32(DLM_RCOM_STATUS_REPLY):
 			node = nodeid2node(nodeid, 0);
 			if (node) {
 				spin_lock(&node->state_lock);
@@ -738,14 +738,14 @@ static void dlm_midcomms_receive_buffer_3_2(union dlm_packet *p, int nodeid)
 		 *
 		 * length already checked.
 		 */
-		switch (le32_to_cpu(p->rcom.rc_type)) {
-		case DLM_RCOM_NAMES:
+		switch (p->rcom.rc_type) {
+		case cpu_to_le32(DLM_RCOM_NAMES):
 			fallthrough;
-		case DLM_RCOM_NAMES_REPLY:
+		case cpu_to_le32(DLM_RCOM_NAMES_REPLY):
 			fallthrough;
-		case DLM_RCOM_STATUS:
+		case cpu_to_le32(DLM_RCOM_STATUS):
 			fallthrough;
-		case DLM_RCOM_STATUS_REPLY:
+		case cpu_to_le32(DLM_RCOM_STATUS_REPLY):
 			break;
 		default:
 			log_print("unsupported rcom type received: %u, will skip this message from node %d",
-- 
2.31.1

