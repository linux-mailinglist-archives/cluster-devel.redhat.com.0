Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FEE4F6891
	for <lists+cluster-devel@lfdr.de>; Wed,  6 Apr 2022 20:05:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649268349;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2Fw5IhthofTKS9B9u1RaeToyz+BNi4WuTIpT4457Q6g=;
	b=S8jk2XmQqYKAqu6ZqN9GdGsR2RVmrjt00Bm/nrPFLvy0ckqZCnDnmfau/wkYJJWxii6uQy
	c0qTRw6ZqhREzTIu0cL2nq4xO9VkCyjVqzj5vOvN6JCuCED8DklThtRHJCyarL0hTRJCwU
	YqEQw4il84omKJex1MLNFU38ag9AP1M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-12-ZCejwfTZNQSMneio4TZdzQ-1; Wed, 06 Apr 2022 14:05:42 -0400
X-MC-Unique: ZCejwfTZNQSMneio4TZdzQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D83AF1C01705;
	Wed,  6 Apr 2022 18:05:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1F0844029C0;
	Wed,  6 Apr 2022 18:05:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D0DB2193F6E4;
	Wed,  6 Apr 2022 18:05:39 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0E87B1949763 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  6 Apr 2022 18:05:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 00D631121320; Wed,  6 Apr 2022 18:05:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D1B551121314;
 Wed,  6 Apr 2022 18:05:37 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed,  6 Apr 2022 14:05:30 -0400
Message-Id: <20220406180531.3886002-2-aahringo@redhat.com>
In-Reply-To: <20220406180531.3886002-1-aahringo@redhat.com>
References: <20220406180531.3886002-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: [Cluster-devel] [PATCH RESEND dlm/next 1/2] dlm: remove usage of
 list iterator for list_add() after the loop body
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
Cc: cluster-devel@redhat.com, jakobkoschel@gmail.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: application/octet-stream; x-default=true

From: Jakob Koschel <jakobkoschel@gmail.com>

In preparation to limit the scope of a list iterator to the list
traversal loop, use a dedicated pointer to point to the found element [1].

Before, the code implicitly used the head when no element was found
when using &pos->list. Since the new variable is only set if an
element was found, the list_add() is performed within the loop
and only done after the loop if it is done on the list head directly.

Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lock.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index f5330e58d1fc..20eca2261711 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -1321,13 +1321,17 @@ static inline void unhold_lkb(struct dlm_lkb *lkb)
 static void lkb_add_ordered(struct list_head *new, struct list_head *head,
 			    int mode)
 {
-	struct dlm_lkb *lkb = NULL;
+	struct dlm_lkb *lkb = NULL, *iter;
 
-	list_for_each_entry(lkb, head, lkb_statequeue)
-		if (lkb->lkb_rqmode < mode)
+	list_for_each_entry(iter, head, lkb_statequeue)
+		if (iter->lkb_rqmode < mode) {
+			lkb = iter;
+			list_add_tail(new, &iter->lkb_statequeue);
 			break;
+		}
 
-	__list_add(new, lkb->lkb_statequeue.prev, &lkb->lkb_statequeue);
+	if (!lkb)
+		list_add_tail(new, head);
 }
 
 /* add/remove lkb to rsb's grant/convert/wait queue */
-- 
2.31.1

