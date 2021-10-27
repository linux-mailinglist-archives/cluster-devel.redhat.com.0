Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A5743CDA7
	for <lists+cluster-devel@lfdr.de>; Wed, 27 Oct 2021 17:34:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635348866;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BvMrSpwRSTF5vT6iNWg2VC+VsWHnCUNfIpDrdWWTFKQ=;
	b=I3AenPLQWcfLPfhqUpjS2L258BaDhtYSH8VRxxem+hnVVSlUHLKcjF4/089xU5l6OoYH/7
	BjcondpWpOymySooMtOMc/SAnTR6coWVbiSOPWIsBwME44SR7eAlQyw+g6oq1MkfDZ02+7
	JK7FyHaNn5zY69PHfk1zgJWCCcw9ayE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-9jkUYRzHMoGi_Ip5HXLJ_w-1; Wed, 27 Oct 2021 11:34:23 -0400
X-MC-Unique: 9jkUYRzHMoGi_Ip5HXLJ_w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AE2D91273;
	Wed, 27 Oct 2021 15:34:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CA0160C05;
	Wed, 27 Oct 2021 15:34:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BE5D91832DF6;
	Wed, 27 Oct 2021 15:34:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19RFNoh9009178 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 27 Oct 2021 11:23:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3D8CE1042AEA; Wed, 27 Oct 2021 15:23:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E010A10429D2;
	Wed, 27 Oct 2021 15:23:49 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 27 Oct 2021 11:23:16 -0400
Message-Id: <20211027152322.3236492-3-aahringo@redhat.com>
In-Reply-To: <20211027152322.3236492-1-aahringo@redhat.com>
References: <20211027152322.3236492-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 2/8] fs: dlm: move version
	conversion to compile time
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

This patch moves version conversion to little endian from a runtime
variable to compile time constant.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/midcomms.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index e3de268898ed..6bcc5eb0f6cc 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -912,11 +912,11 @@ int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int len)
 		if (msglen > len)
 			break;
 
-		switch (le32_to_cpu(hd->h_version)) {
-		case DLM_VERSION_3_1:
+		switch (hd->h_version) {
+		case cpu_to_le32(DLM_VERSION_3_1):
 			dlm_midcomms_receive_buffer_3_1((union dlm_packet *)ptr, nodeid);
 			break;
-		case DLM_VERSION_3_2:
+		case cpu_to_le32(DLM_VERSION_3_2):
 			dlm_midcomms_receive_buffer_3_2((union dlm_packet *)ptr, nodeid);
 			break;
 		default:
-- 
2.27.0

