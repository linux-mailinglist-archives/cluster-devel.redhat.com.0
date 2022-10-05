Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9841B5F5A91
	for <lists+cluster-devel@lfdr.de>; Wed,  5 Oct 2022 21:23:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664997799;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gubyPTp/uCwwNkpnU72BN3ykk+XJd4ZvX//PBZOSg/w=;
	b=F/8ljWJWpHM1GWIQZmlNZk9adjiSqQ8EeLaEYuowefz/WdQlUZptfUFAr6iMFS739eh8su
	dAEjg8oD7uoFktsa+UAyrfrhPfQtjqCWTbPgpmsn4TWPAbBtCADiDOGVxwZbovFqJFnmmu
	xkE0ymGFankRjGrk1r4Cf91vRZwl5+w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-504-t5hpVFzDNuCkQkNAEK9Lpw-1; Wed, 05 Oct 2022 15:23:16 -0400
X-MC-Unique: t5hpVFzDNuCkQkNAEK9Lpw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 785101C09C99;
	Wed,  5 Oct 2022 19:23:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1EBEB40C6F75;
	Wed,  5 Oct 2022 19:23:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D7EE21947B94;
	Wed,  5 Oct 2022 19:23:14 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 968DE1946A4E for <cluster-devel@listman.corp.redhat.com>;
 Wed,  5 Oct 2022 19:23:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 797192166B2F; Wed,  5 Oct 2022 19:23:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 56FF52166B26;
 Wed,  5 Oct 2022 19:23:14 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed,  5 Oct 2022 15:23:12 -0400
Message-Id: <20221005192312.4130838-2-aahringo@redhat.com>
In-Reply-To: <20221005192312.4130838-1-aahringo@redhat.com>
References: <20221005192312.4130838-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCHv2 dlm-tool 2/2] dlm_controld: fix rare off
 by one
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
snprintf() to have at the end two bytes for the "\n\0" pattern. If we
would hit the case that the buffer exactly matched we truncate the
string by one byte because we need to fit '\n' and '\0' into the buffer.
---
v2:
 - remove sob.
 - only really do the truncate of one byte when the buffer would exact
   match which is the given size and the returned size + 1 ('\0').

 dlm_controld/logging.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/dlm_controld/logging.c b/dlm_controld/logging.c
index 2c57138c..bfd7d274 100644
--- a/dlm_controld/logging.c
+++ b/dlm_controld/logging.c
@@ -181,10 +181,14 @@ void log_level(char *name_in, uint32_t level_in, const char *fmt, ...)
 	ret = vsnprintf(log_str + pos, len - pos, fmt, ap);
 	va_end(ap);
 
-	if (ret >= len - pos)
+	if (ret >= len - pos) {
 		pos = len - 1;
-	else
-		pos += ret;
+	} else {
+		if (ret + 1 == len - pos)
+			pos += ret - 1;
+		else
+			pos += ret;
+	}
 
 	log_str[pos++] = '\n';
 	log_str[pos++] = '\0';
-- 
2.31.1

