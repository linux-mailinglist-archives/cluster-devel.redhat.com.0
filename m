Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D85B0593A81
	for <lists+cluster-devel@lfdr.de>; Mon, 15 Aug 2022 21:43:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660592622;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HVy0+ZulU9PvKvHz6Mig7aRQnyZfhbu1qn+goFMpuvY=;
	b=ZHQoKIAyzihyRC5osc/3wYP50UdVcmZ1zFYMpkteWplzk7E5JrHBOD8Oo9+4eBdCFyYbUT
	pt2gwgydpuj+1BvMAVqiSgeaYJE3BSMksWdY7e3ozOXCAJ2moyF/5QRfRh8XWkBrnj3VaV
	R6OgmhmZ79Wc7q+arz7qKUMH9jxo90k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-gXg2aVo4NT22xaOvOWXq7g-1; Mon, 15 Aug 2022 15:43:36 -0400
X-MC-Unique: gXg2aVo4NT22xaOvOWXq7g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D9BF4800DA7;
	Mon, 15 Aug 2022 19:43:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CEFE62026D4C;
	Mon, 15 Aug 2022 19:43:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 713E91940350;
	Mon, 15 Aug 2022 19:43:34 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2A4BE1940351 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 15 Aug 2022 19:43:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C7E4B1121319; Mon, 15 Aug 2022 19:43:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF8871121315;
 Mon, 15 Aug 2022 19:43:31 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 15 Aug 2022 15:43:26 -0400
Message-Id: <20220815194328.2208580-15-aahringo@redhat.com>
In-Reply-To: <20220815194328.2208580-1-aahringo@redhat.com>
References: <20220815194328.2208580-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: [Cluster-devel] [RESEND dlm/next 14/16] fs: dlm: LSFL_CB_DELAY only
 for kernel lockspaces
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

This patch only set/clear the LSFL_CB_DELAY bit when it's actually a
kernel lockspace signaled by if ls->ls_callback_wq is set or not set in
this case. User lockspaces will never evaluate this flag.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/ast.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/fs/dlm/ast.c b/fs/dlm/ast.c
index a44cc42b6317..d60a8d8f109d 100644
--- a/fs/dlm/ast.c
+++ b/fs/dlm/ast.c
@@ -288,12 +288,13 @@ void dlm_callback_stop(struct dlm_ls *ls)
 
 void dlm_callback_suspend(struct dlm_ls *ls)
 {
-	mutex_lock(&ls->ls_cb_mutex);
-	set_bit(LSFL_CB_DELAY, &ls->ls_flags);
-	mutex_unlock(&ls->ls_cb_mutex);
+	if (ls->ls_callback_wq) {
+		mutex_lock(&ls->ls_cb_mutex);
+		set_bit(LSFL_CB_DELAY, &ls->ls_flags);
+		mutex_unlock(&ls->ls_cb_mutex);
 
-	if (ls->ls_callback_wq)
 		flush_workqueue(ls->ls_callback_wq);
+	}
 }
 
 #define MAX_CB_QUEUE 25
@@ -304,11 +305,11 @@ void dlm_callback_resume(struct dlm_ls *ls)
 	int count = 0, sum = 0;
 	bool empty;
 
-	clear_bit(LSFL_CB_DELAY, &ls->ls_flags);
-
 	if (!ls->ls_callback_wq)
 		return;
 
+	clear_bit(LSFL_CB_DELAY, &ls->ls_flags);
+
 more:
 	mutex_lock(&ls->ls_cb_mutex);
 	list_for_each_entry_safe(lkb, safe, &ls->ls_cb_delay, lkb_cb_list) {
-- 
2.31.1

