Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E98265BB258
	for <lists+cluster-devel@lfdr.de>; Fri, 16 Sep 2022 20:43:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663353814;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IwsV0Bdagp2Mmswe91pMNoZ03c2kGEAazkaCOIC9y1Q=;
	b=E/uyoC8r1mJAH375ktMxNRtDoYNu7MrzquF65EGZdIjXsg/lj7w+NMhxYiVOFs/7Z8MfMJ
	jEtWC8S0DKNnpaR+C/Tu6C5rvXfTXJs2qVRWIs57MvyZT5ARFWADphcue66LGTz6BHDeBd
	2uUQWKvskFiCh7FZg5lum1n8QbHS5mQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-GzRjEvvyM-q-yppcxOkQvQ-1; Fri, 16 Sep 2022 14:43:31 -0400
X-MC-Unique: GzRjEvvyM-q-yppcxOkQvQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A1FA0185A79C;
	Fri, 16 Sep 2022 18:43:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 520DD1121314;
	Fri, 16 Sep 2022 18:43:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DA6FC1946586;
	Fri, 16 Sep 2022 18:43:27 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DA0F61946586 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 16 Sep 2022 18:43:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C07A32166B29; Fri, 16 Sep 2022 18:43:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9DE552166B26;
 Fri, 16 Sep 2022 18:43:26 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 16 Sep 2022 14:43:05 -0400
Message-Id: <20220916184309.3179451-2-aahringo@redhat.com>
In-Reply-To: <20220916184309.3179451-1-aahringo@redhat.com>
References: <20220916184309.3179451-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH/RFC dlm/next 2/6] fs: dlm: use
 list_first_entry marco
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Instead of using list_entry() this patch moves to using the
list_first_entry() macro.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/user.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dlm/user.c b/fs/dlm/user.c
index c5d27bccc3dc..6a5de0918a96 100644
--- a/fs/dlm/user.c
+++ b/fs/dlm/user.c
@@ -857,7 +857,7 @@ static ssize_t device_read(struct file *file, char __user *buf, size_t count,
 	   without removing lkb_cb_list; so empty lkb_cb_list is always
 	   consistent with empty lkb_callbacks */
 
-	lkb = list_entry(proc->asts.next, struct dlm_lkb, lkb_cb_list);
+	lkb = list_first_entry(&proc->asts, struct dlm_lkb, lkb_cb_list);
 
 	/* rem_lkb_callback sets a new lkb_last_cast */
 	old_mode = lkb->lkb_last_cast.mode;
-- 
2.31.1

