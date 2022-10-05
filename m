Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEB75F5A18
	for <lists+cluster-devel@lfdr.de>; Wed,  5 Oct 2022 20:48:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664995720;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ujgW04bXt42uOjsB49REX4xtRjllH1en0y8dhdAXx3o=;
	b=fpFvdVyZ8cSiL4yqCOmoLPQ4H4GHyzT2TCxicuS3S4vuqYoYdEWJ6z4NI+buhW3oQrjAfF
	j1CISRUm7/cRTBFTNztUTOjRrZau29AL0lbXvbLJJbQYbVll4po2qO3FPCFLKUMa0gQw8F
	qeEDv+FF+eMFTw3MEVggAZ1JVZoSpUA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-a4sXyAyGOLm0DBnBkwdmdA-1; Wed, 05 Oct 2022 14:48:39 -0400
X-MC-Unique: a4sXyAyGOLm0DBnBkwdmdA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0DDDC800B30;
	Wed,  5 Oct 2022 18:48:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9E2312166B2D;
	Wed,  5 Oct 2022 18:48:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 57B751947BAC;
	Wed,  5 Oct 2022 18:48:35 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6D4E31946A4E for <cluster-devel@listman.corp.redhat.com>;
 Wed,  5 Oct 2022 18:48:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4B1D3492B09; Wed,  5 Oct 2022 18:48:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 270CA492B06;
 Wed,  5 Oct 2022 18:48:34 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed,  5 Oct 2022 14:48:20 -0400
Message-Id: <20221005184820.4129480-2-aahringo@redhat.com>
In-Reply-To: <20221005184820.4129480-1-aahringo@redhat.com>
References: <20221005184820.4129480-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [Cluster-devel] [PATCH dlm-tool 2/2] dlm_controld: fix rare off by
 one
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

While debugging I came across a rare off by one when the snprintf()
filled string _exactly_ matched the size (with '\0') and we return the
bytes written without \0. We will then write a "\n\0" pattern at the
end but when the string exactly matched there is missing byte in the
calculation of the "\n\0" pattern because the return value only reduced
the size by one. To fix that we substract -1 from the return value of
snprintf() to have at the end two bytes for the "\n\0" pattern. We just
need to be careful we do that in cases where snprintf() doesn't return
zero to not hit a negative offset calculation.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 dlm_controld/logging.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/dlm_controld/logging.c b/dlm_controld/logging.c
index 2c57138c..42712d8b 100644
--- a/dlm_controld/logging.c
+++ b/dlm_controld/logging.c
@@ -181,10 +181,12 @@ void log_level(char *name_in, uint32_t level_in, const char *fmt, ...)
 	ret = vsnprintf(log_str + pos, len - pos, fmt, ap);
 	va_end(ap);
 
-	if (ret >= len - pos)
+	if (ret >= len - pos) {
 		pos = len - 1;
-	else
-		pos += ret;
+	} else {
+		if (ret != 0)
+			pos += ret - 1;
+	}
 
 	log_str[pos++] = '\n';
 	log_str[pos++] = '\0';
-- 
2.31.1

