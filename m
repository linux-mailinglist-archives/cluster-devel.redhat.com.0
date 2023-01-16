Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E9966CFCD
	for <lists+cluster-devel@lfdr.de>; Mon, 16 Jan 2023 20:51:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673898666;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=z6pmCuWHs2AoRjxfyKvi2xeTb8Gy4gSV4V2ivIKZNzs=;
	b=h6MATzd7Da1+RoFkaDPUCjfWsnmoM1MrKPTR0lvuPfI594VVkbcmb4Tj4E9vCx1vO06yxu
	bd6HUVj4aBOSeJ+FNmEqF49c5ihM0moF/Y0fh8gklPXwU0drySI0g3hzIsNJYgZWqip0WS
	v0oGY9JOT+inkFnaJbUqVGy/wJ7VTG0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-ajigg_a4Pu6Vfng1JQtDXw-1; Mon, 16 Jan 2023 14:51:00 -0500
X-MC-Unique: ajigg_a4Pu6Vfng1JQtDXw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 068E4885620;
	Mon, 16 Jan 2023 19:51:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7F46251FF;
	Mon, 16 Jan 2023 19:50:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 631751946595;
	Mon, 16 Jan 2023 19:50:57 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1A1BF1946589 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 16 Jan 2023 19:50:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 82E1814171BE; Mon, 16 Jan 2023 19:50:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 528E21415113;
 Mon, 16 Jan 2023 19:50:55 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 16 Jan 2023 14:50:49 -0500
Message-Id: <20230116195051.2858791-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCHv2 dlm-tool 1/3] dlm_controld: increase
 uevent recv buffer
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch increases the uevent recv buffer from 256 bytes to 4096
bytes. To ensure everything fits into one recv() call.
---
 dlm_controld/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/dlm_controld/main.c b/dlm_controld/main.c
index 7cf6348e..2c534a1e 100644
--- a/dlm_controld/main.c
+++ b/dlm_controld/main.c
@@ -682,7 +682,7 @@ const char *dlm_mode_str(int mode)
 
 /* recv "online" (join) and "offline" (leave) messages from dlm via uevents */
 
-#define MAX_LINE_UEVENT 256
+#define MAX_LINE_UEVENT 4096
 
 static void process_uevent(int ci)
 {
-- 
2.31.1

