Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E557654D6
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Jul 2023 15:23:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690464198;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=31B+1tTDkjuvEMCPfJsYKYXmpSwUVH5COFFddcQX6eI=;
	b=X49kdwChNCis0jKXl7YSrWhofMTBtB2WM+4s7QzZphingPpE1F8bVKDsdVwgRw+pLhxEgo
	Rx5Nie6R9xkyr9eCAGBvM/9jSGGfa0C9acNuEjLiN4P9ka5NnW64bKvM91acsljaplB0Ay
	0uf+kPxVvCmbfPXamliQzdOvyil7oDk=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-Gsz7NhJgNjKNlkyfg2mVUg-1; Thu, 27 Jul 2023 09:23:14 -0400
X-MC-Unique: Gsz7NhJgNjKNlkyfg2mVUg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6232D29ABA16;
	Thu, 27 Jul 2023 13:23:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 80DD9492B03;
	Thu, 27 Jul 2023 13:23:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 20F2E1946A78;
	Thu, 27 Jul 2023 13:23:10 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E49791946586 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 27 Jul 2023 13:23:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D055B4094DC2; Thu, 27 Jul 2023 13:23:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ACC4E4094DC0;
 Thu, 27 Jul 2023 13:23:08 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 27 Jul 2023 09:22:51 -0400
Message-Id: <20230727132303.3352514-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Cluster-devel] [PATCH dlm-next 01/13] fs: dlm: add missing
 spin_unlock
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch fixes commit dc52cd2eff4a ("fs: dlm: fix F_CANCELLK to cancel
pending request") that we don't unlock the ops_lock in a rate case when
a waiter cannot be found. This case can only happen when cancellation of
plock operation was successful but no kernel waiter was being found.

Fixes: dc52cd2eff4a ("fs: dlm: fix F_CANCELLK to cancel pending request")
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/plock.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
index 943d9f8e5564..44b3aab5b709 100644
--- a/fs/dlm/plock.c
+++ b/fs/dlm/plock.c
@@ -398,6 +398,7 @@ int dlm_posix_cancel(dlm_lockspace_t *lockspace, u64 number, struct file *file,
 		 */
 		op = plock_lookup_waiter(&info);
 		if (WARN_ON_ONCE(!op)) {
+			spin_unlock(&ops_lock);
 			rv = -ENOLCK;
 			break;
 		}
-- 
2.31.1

