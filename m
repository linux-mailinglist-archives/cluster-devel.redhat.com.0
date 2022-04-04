Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 096AA4F1A0D
	for <lists+cluster-devel@lfdr.de>; Mon,  4 Apr 2022 22:07:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649102843;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=u1CCShKrMs7dObrfb3dFySNfFhTkwDtwXtyBTm1X/FA=;
	b=HALMXrdSYx7KFYTTgQE8iex+IySiagohju4bEt6/Kqc/VNwy4qs/JcGCWsGpn76CN69uzL
	25mNzpTnBZW6dcTkP1WcwYqll55AKjtS8x7C6QVUOYLhYAJw8Xn49UxrwmUVs+0fYIDIYb
	T6JnbcygBcBxVfFoycnXKmTOYCULTcI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-a9PyI66ON6eO9TvsQA8Pqw-1; Mon, 04 Apr 2022 16:07:21 -0400
X-MC-Unique: a9PyI66ON6eO9TvsQA8Pqw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A65793C11C82;
	Mon,  4 Apr 2022 20:07:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0B3CA7C43;
	Mon,  4 Apr 2022 20:07:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3173B194E00B;
	Mon,  4 Apr 2022 20:06:56 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1F8BE1940372 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  4 Apr 2022 20:06:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 05EB88179; Mon,  4 Apr 2022 20:06:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC12C8145;
 Mon,  4 Apr 2022 20:06:52 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  4 Apr 2022 16:06:29 -0400
Message-Id: <20220404200646.3170301-3-aahringo@redhat.com>
In-Reply-To: <20220404200646.3170301-1-aahringo@redhat.com>
References: <20220404200646.3170301-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [Cluster-devel] [PATCH RESEND v5.18-rc1 02/19] fs: dlm: fix missing
 check in validate_lock_args
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch adds a additional check if lkb->lkb_wait_count is non zero as
it is done in validate_unlock_args() to check if any operation is in
progress. While on it add a comment taken from validate_unlock_args() to
signal what the check is doing.

There might be no changes because if lkb->lkb_wait_type is non zero
implies that lkb->lkb_wait_count is non zero. However we should add the
check as it does validate_unlock_args().

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lock.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index bdb51d209ba2..e72f1a063aeb 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -2912,7 +2912,8 @@ static int validate_lock_args(struct dlm_ls *ls, struct dlm_lkb *lkb,
 		if (lkb->lkb_status != DLM_LKSTS_GRANTED)
 			goto out;
 
-		if (lkb->lkb_wait_type)
+		/* lock not allowed if there's any op in progress */
+		if (lkb->lkb_wait_type || lkb->lkb_wait_count)
 			goto out;
 
 		if (is_overlap(lkb))
-- 
2.31.1

