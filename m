Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B9B4F1A07
	for <lists+cluster-devel@lfdr.de>; Mon,  4 Apr 2022 22:07:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649102841;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5gYyGQkT1q6dwNQNbXeU7AP5d9Eoc3MZ7+q4pY4bx8M=;
	b=aHGGT7JG5+p+ySIBJxY0C/UglQreBJTFTFt1qkwbHzGiUtQ/hTzs+ueeKuelPmo50JaDLS
	oWKF/Uxa/WgbtZmWtOELFCfP+o7d9ZCJ8Y6hvRs1Aq1kSFI5dWjwDh8Xnp4C3cUVKYi4Lw
	y/lywGUhvN1ptVOoJZ8tD8cYtoUHIxE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-66-PhY8y_TXMEyj7PnSFLpErA-1; Mon, 04 Apr 2022 16:07:19 -0400
X-MC-Unique: PhY8y_TXMEyj7PnSFLpErA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C67B833976;
	Mon,  4 Apr 2022 20:07:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 606A040F4955;
	Mon,  4 Apr 2022 20:07:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D1C08194E014;
	Mon,  4 Apr 2022 20:06:56 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 27014193F6E9 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  4 Apr 2022 20:06:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 19AAF7C28; Mon,  4 Apr 2022 20:06:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F054A7C2A;
 Mon,  4 Apr 2022 20:06:54 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  4 Apr 2022 16:06:42 -0400
Message-Id: <20220404200646.3170301-16-aahringo@redhat.com>
In-Reply-To: <20220404200646.3170301-1-aahringo@redhat.com>
References: <20220404200646.3170301-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [Cluster-devel] [PATCH RESEND v5.18-rc1 15/19] fs: dlm: move
 conversion to compile time
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

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

