Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D31076BC12
	for <lists+cluster-devel@lfdr.de>; Tue,  1 Aug 2023 20:13:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690913613;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=31B+1tTDkjuvEMCPfJsYKYXmpSwUVH5COFFddcQX6eI=;
	b=OsKxhqMcNBckJiGr6jL1+wzqYfiD5YNWkXdUwVsgI2A8Cpa1dh8W/11r1uPETtPH1YZVaX
	qw0bl6Xi5PzZSflhhOEf7hjgGWbFN+aBZer+QzE1KuJ7HcNYxYqhdPF7Fn41K7yBRBQrYF
	ij7PmCVNS9zsoovR4iSMN/2Dl6A5Jpc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-Ees91YctPPu0QcNr6UahWQ-1; Tue, 01 Aug 2023 14:13:29 -0400
X-MC-Unique: Ees91YctPPu0QcNr6UahWQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D4048910EB;
	Tue,  1 Aug 2023 18:13:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 327EBF7FA4;
	Tue,  1 Aug 2023 18:13:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F2CB21947209;
	Tue,  1 Aug 2023 18:13:27 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 44E3D1947207 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  1 Aug 2023 18:09:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6785A112132E; Tue,  1 Aug 2023 18:09:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41F341121325;
 Tue,  1 Aug 2023 18:09:54 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue,  1 Aug 2023 14:09:38 -0400
Message-Id: <20230801180950.3693180-2-aahringo@redhat.com>
In-Reply-To: <20230801180950.3693180-1-aahringo@redhat.com>
References: <20230801180950.3693180-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [PATCHv2 dlm-next 01/13] fs: dlm: add missing
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

