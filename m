Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DF1593A86
	for <lists+cluster-devel@lfdr.de>; Mon, 15 Aug 2022 21:52:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660593125;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FcbIi7XiSJ1rOg42cKf2aAhxfmGkNQpXeh2r1eu2uqY=;
	b=SXWbyjP/Mgkip8Sy3zmIWOwu+MCQUta9YoOWYdF6jVhvvKIQ9FPzh2rVi2bzueN8wATfdR
	M0Xl77qxkhobc0R2aB8ZwqQxkqgkKZiQRnsaE7xrAFogeJRy3lvqTRoSycNldUmE6kVR5h
	lmGAATO0QrKB04JUApmKcMErABeD3ts=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-iv0nYPrhNy-i0_PF-NInCw-1; Mon, 15 Aug 2022 15:52:00 -0400
X-MC-Unique: iv0nYPrhNy-i0_PF-NInCw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90CCC8039AE;
	Mon, 15 Aug 2022 19:51:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8689B2026D64;
	Mon, 15 Aug 2022 19:51:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3E2E21940350;
	Mon, 15 Aug 2022 19:51:59 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 40CC5194B966 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 15 Aug 2022 19:51:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D93F22026985; Mon, 15 Aug 2022 19:51:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C15FC2026D07;
 Mon, 15 Aug 2022 19:51:57 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 15 Aug 2022 15:51:46 -0400
Message-Id: <20220815195148.2209805-2-aahringo@redhat.com>
In-Reply-To: <20220815195148.2209805-1-aahringo@redhat.com>
References: <20220815195148.2209805-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: [Cluster-devel] [PATCH dlm-tool 2/4] libdlm: force timeout
 parameter to zero
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch forces to disable the timeout parameter for libdlm users as
this feature is now deprecated and we will just unset it even if the
user sets it to a value.
---
 libdlm/libdlm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/libdlm/libdlm.c b/libdlm/libdlm.c
index ebfba457..fbdf9a09 100644
--- a/libdlm/libdlm.c
+++ b/libdlm/libdlm.c
@@ -807,8 +807,6 @@ static int ls_lock_v6(dlm_lshandle_t ls,
 
 	if (xid)
 		req->i.lock.xid = *xid;
-	if (timeout)
-		req->i.lock.timeout = *timeout;
 
 	if (flags & LKF_CONVERT) {
 		req->i.lock.namelen = 0;
-- 
2.31.1

