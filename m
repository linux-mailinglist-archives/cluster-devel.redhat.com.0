Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D4644365A
	for <lists+cluster-devel@lfdr.de>; Tue,  2 Nov 2021 20:18:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635880688;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TfxqmpLqq3xDk8XecfQ7PFSX+KaTIMZlyDtowtKRtkw=;
	b=h8RHWStS596A8C8ecYifhUya4spzx6Pf6KX/qCM5unIKGSyK8nQogEFdmGtjnWJA5Ni/j9
	6YWa7ecoO7/sFJxN7+oBwJoQrbbYDLcYCWCAhEAOAcJoXFLcxRMPfudX1Fh21nikPLoqlk
	AoZV5CJNTAq7nIESbCKAJdQJjlmlDOk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-GC_qxNyNM7OZ0gODoGXynw-1; Tue, 02 Nov 2021 15:18:03 -0400
X-MC-Unique: GC_qxNyNM7OZ0gODoGXynw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 889E28735C3;
	Tue,  2 Nov 2021 19:18:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7947A5D9D5;
	Tue,  2 Nov 2021 19:18:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C3AEB4EA2F;
	Tue,  2 Nov 2021 19:18:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A2JHtY4020712 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 2 Nov 2021 15:17:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A6C2A67842; Tue,  2 Nov 2021 19:17:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 57838652AC;
	Tue,  2 Nov 2021 19:17:55 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue,  2 Nov 2021 15:17:11 -0400
Message-Id: <20211102191724.210095-6-aahringo@redhat.com>
In-Reply-To: <20211102191724.210095-1-aahringo@redhat.com>
References: <20211102191724.210095-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH RESEND v5.15-rc7 05/18] fs: dlm: move
	version conversion to compile time
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

This patch moves version conversion to little endian from a runtime
variable to compile time constant.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/midcomms.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index 008078f06813..76bdc3a9dc61 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -909,11 +909,11 @@ int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int len)
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

