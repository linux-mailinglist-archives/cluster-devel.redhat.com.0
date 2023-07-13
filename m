Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3711F75290E
	for <lists+cluster-devel@lfdr.de>; Thu, 13 Jul 2023 18:49:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689266960;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IOMm7l7E2mazcpNUDsbyjCr1jkWKh2/DVK60DKHLsps=;
	b=GVuh6lUmj/ou4V+7MDe2U0IzhSAxgo9NeatYfz3iwgLYj5Hh3MLNX5j+Ed+0550LwwNec1
	7Sc8vVeWxwPcO1B2McXgj6F5btCqvN1SOCpYPXg6WOmRD5UjaKcdLymcasofQwU/iecHLy
	Rpn4fl4KayjXIzibOLSzKneLgWxTPQY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-1UkM2SGJNDOp-G5iwyOxEQ-1; Thu, 13 Jul 2023 12:49:15 -0400
X-MC-Unique: 1UkM2SGJNDOp-G5iwyOxEQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF40E800193;
	Thu, 13 Jul 2023 16:49:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D411D4028AA4;
	Thu, 13 Jul 2023 16:49:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2978B19465B6;
	Thu, 13 Jul 2023 16:49:09 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8CA431946589 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 13 Jul 2023 16:49:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 757522166B28; Thu, 13 Jul 2023 16:49:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 452B32166B26;
 Thu, 13 Jul 2023 16:49:02 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 13 Jul 2023 12:48:36 -0400
Message-Id: <20230713164838.3583052-2-aahringo@redhat.com>
In-Reply-To: <20230713164838.3583052-1-aahringo@redhat.com>
References: <20230713164838.3583052-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCHv2 v6.5-rc1 1/3] fs: dlm: ignore
 DLM_PLOCK_FL_CLOSE flag results
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
Cc: cluster-devel@redhat.com, stable@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch will ignore dlm plock results with DLM_PLOCK_FL_CLOSE being
set. When DLM_PLOCK_FL_CLOSE is set then no reply is expected and a
plock op cannot being matched and the result cannot be delivered to the
caller. In some user space software applications like dlm_controld (the
common application and only knowing implementation using this UAPI) can
send an error back even if an result is never being expected.

This patch will ignore results if DLM_PLOCK_FL_CLOSE is being set, but
requires that the user space application sents the result back with
DLM_PLOCK_FL_CLOSE set which is the case for dlm_controld.

Fixes: 901025d2f319 ("dlm: make plock operation killable")
Cc: stable@vger.kernel.org
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/plock.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
index 70a4752ed913..869595a995f7 100644
--- a/fs/dlm/plock.c
+++ b/fs/dlm/plock.c
@@ -433,6 +433,14 @@ static ssize_t dev_write(struct file *file, const char __user *u, size_t count,
 	if (check_version(&info))
 		return -EINVAL;
 
+	/* Some dlm user space software will send replies back,
+	 * even if DLM_PLOCK_FL_CLOSE is set e.g. if an error occur.
+	 * We can't match them in recv_list because they were never
+	 * be part of it.
+	 */
+	if (info.flags & DLM_PLOCK_FL_CLOSE)
+		return count;
+
 	/*
 	 * The results for waiting ops (SETLKW) can be returned in any
 	 * order, so match all fields to find the op.  The results for
-- 
2.31.1

