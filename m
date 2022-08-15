Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A5082593A71
	for <lists+cluster-devel@lfdr.de>; Mon, 15 Aug 2022 21:43:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660592615;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZRJHG0S7r40lf030CYi2lHNU4fnY8OsjSiwm/jnWeMo=;
	b=bHdyyLkvJzEDpYrniq4YdQoeoKpVEwxIRrDcD4vVvpSa1uoPNZrp3FLzFfPKriS1WntJAX
	iXwkuqJQ0KMzk8VlDYtnFRov+yocpVjc8Qh/04z1f//n7tFE0S745SrWGIR3zi8Cf1vday
	g8rTurlWUHqkTEpaKIaorSg39WMD7Uo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507-SaWb1XHcPJKpswn9qOSF7A-1; Mon, 15 Aug 2022 15:43:34 -0400
X-MC-Unique: SaWb1XHcPJKpswn9qOSF7A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5EA4438005DD;
	Mon, 15 Aug 2022 19:43:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 513D240D0166;
	Mon, 15 Aug 2022 19:43:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 169621940350;
	Mon, 15 Aug 2022 19:43:32 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A8938194B966 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 15 Aug 2022 19:43:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8EE671121315; Mon, 15 Aug 2022 19:43:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7695C112131E;
 Mon, 15 Aug 2022 19:43:30 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 15 Aug 2022 15:43:17 -0400
Message-Id: <20220815194328.2208580-6-aahringo@redhat.com>
In-Reply-To: <20220815194328.2208580-1-aahringo@redhat.com>
References: <20220815194328.2208580-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: [Cluster-devel] [RESEND dlm/next 05/16] fs: dlm: use __func__ for
 function name
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

There are several times of using hard-coded function names inside the
format string. When changing code checkpatch will drop a warning about
this. This patch prepares to not dropping a checkpatch warning when
introduce the same log message for a different loglevel by using
__func__ instead of a hard-coded function name.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lock.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 16d339d383cd..026c203ff529 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -2901,7 +2901,7 @@ static int validate_lock_args(struct dlm_ls *ls, struct dlm_lkb *lkb,
 	rv = 0;
  out:
 	if (rv)
-		log_debug(ls, "validate_lock_args %d %x %x %x %d %d %s",
+		log_debug(ls, "%s %d %x %x %x %d %d %s", __func__,
 			  rv, lkb->lkb_id, lkb->lkb_flags, args->flags,
 			  lkb->lkb_status, lkb->lkb_wait_type,
 			  lkb->lkb_resource->res_name);
@@ -3038,7 +3038,7 @@ static int validate_unlock_args(struct dlm_lkb *lkb, struct dlm_args *args)
 	rv = 0;
  out:
 	if (rv)
-		log_debug(ls, "validate_unlock_args %d %x %x %x %x %d %s", rv,
+		log_debug(ls, "%s %d %x %x %x %x %d %s", __func__, rv,
 			  lkb->lkb_id, lkb->lkb_flags, lkb->lkb_exflags,
 			  args->flags, lkb->lkb_wait_type,
 			  lkb->lkb_resource->res_name);
-- 
2.31.1

