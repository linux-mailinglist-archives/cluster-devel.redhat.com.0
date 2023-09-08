Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA0A79912C
	for <lists+cluster-devel@lfdr.de>; Fri,  8 Sep 2023 22:46:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694205988;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JltdMJOn3ZrboCsifeKQPpXAf7eVoUYqXgRQ+8TiHyE=;
	b=bd/mkmpZ/sHE7lg16AOuXiJB5KsLKCSG1krBU3GIcZjHYLKD/lMJFC/N8AOkK+A7chi81k
	UBTX+mT+foULlEuQJDjCC964uNELDAnc5f/mYVd+Z4cDkcEE1oCDabyL1Sux3dSj6+JYxn
	6DPZYI30tuP0fA5j6GoV8FeTplNBUo8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-258-D_sIu-3UOE2eZJkREM7Ijw-1; Fri, 08 Sep 2023 16:46:26 -0400
X-MC-Unique: D_sIu-3UOE2eZJkREM7Ijw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52254816534;
	Fri,  8 Sep 2023 20:46:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BDA3A2013570;
	Fri,  8 Sep 2023 20:46:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C98AE19465B6;
	Fri,  8 Sep 2023 20:46:23 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CC5F5194658C for <cluster-devel@listman.corp.redhat.com>;
 Fri,  8 Sep 2023 20:46:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BCB0C21EE56B; Fri,  8 Sep 2023 20:46:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 927A02013570;
 Fri,  8 Sep 2023 20:46:22 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri,  8 Sep 2023 16:46:03 -0400
Message-Id: <20230908204611.1910601-2-aahringo@redhat.com>
In-Reply-To: <20230908204611.1910601-1-aahringo@redhat.com>
References: <20230908204611.1910601-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [RFC dlm/next 02/10] fs: dlm: switch to GFP_ATOMIC
 in dlm allocations
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
Cc: cluster-devel@redhat.com, gfs2@lists.linux.dev
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch prepares to process dlm messages in softirq context. To
switch dlm to parse messages in softirq context some code parts either
runs inside the softirq context or need to switch to run while a spinlock
is held. This patch prepares to switch the allocation context to
GFP_ATOMIC for those places. It's not possible anymore to preload idr
allocations. However this is only a performance speedup and we might
switch to xarray implementation with more lockless readers paradigms.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lock.c         | 2 --
 fs/dlm/memory.c       | 6 +++---
 fs/dlm/recover.c      | 2 --
 fs/dlm/requestqueue.c | 2 +-
 4 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 44ea65a73f3b..970b8499b66f 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -1208,13 +1208,11 @@ static int _create_lkb(struct dlm_ls *ls, struct dlm_lkb **lkb_ret,
 	spin_lock_init(&lkb->lkb_cb_lock);
 	INIT_WORK(&lkb->lkb_cb_work, dlm_callback_work);
 
-	idr_preload(GFP_NOFS);
 	spin_lock(&ls->ls_lkbidr_spin);
 	rv = idr_alloc(&ls->ls_lkbidr, lkb, start, end, GFP_NOWAIT);
 	if (rv >= 0)
 		lkb->lkb_id = rv;
 	spin_unlock(&ls->ls_lkbidr_spin);
-	idr_preload_end();
 
 	if (rv < 0) {
 		log_error(ls, "create_lkb idr error %d", rv);
diff --git a/fs/dlm/memory.c b/fs/dlm/memory.c
index c0c1a83f6381..f44532d9f5c8 100644
--- a/fs/dlm/memory.c
+++ b/fs/dlm/memory.c
@@ -84,7 +84,7 @@ char *dlm_allocate_lvb(struct dlm_ls *ls)
 {
 	char *p;
 
-	p = kzalloc(ls->ls_lvblen, GFP_NOFS);
+	p = kzalloc(ls->ls_lvblen, GFP_ATOMIC);
 	return p;
 }
 
@@ -97,7 +97,7 @@ struct dlm_rsb *dlm_allocate_rsb(struct dlm_ls *ls)
 {
 	struct dlm_rsb *r;
 
-	r = kmem_cache_zalloc(rsb_cache, GFP_NOFS);
+	r = kmem_cache_zalloc(rsb_cache, GFP_ATOMIC);
 	return r;
 }
 
@@ -112,7 +112,7 @@ struct dlm_lkb *dlm_allocate_lkb(struct dlm_ls *ls)
 {
 	struct dlm_lkb *lkb;
 
-	lkb = kmem_cache_zalloc(lkb_cache, GFP_NOFS);
+	lkb = kmem_cache_zalloc(lkb_cache, GFP_ATOMIC);
 	return lkb;
 }
 
diff --git a/fs/dlm/recover.c b/fs/dlm/recover.c
index 53917c0aa3c0..ce6dc914cb86 100644
--- a/fs/dlm/recover.c
+++ b/fs/dlm/recover.c
@@ -310,7 +310,6 @@ static int recover_idr_add(struct dlm_rsb *r)
 	struct dlm_ls *ls = r->res_ls;
 	int rv;
 
-	idr_preload(GFP_NOFS);
 	spin_lock(&ls->ls_recover_idr_lock);
 	if (r->res_id) {
 		rv = -1;
@@ -326,7 +325,6 @@ static int recover_idr_add(struct dlm_rsb *r)
 	rv = 0;
 out_unlock:
 	spin_unlock(&ls->ls_recover_idr_lock);
-	idr_preload_end();
 	return rv;
 }
 
diff --git a/fs/dlm/requestqueue.c b/fs/dlm/requestqueue.c
index 892d6ca21e74..c05940afd063 100644
--- a/fs/dlm/requestqueue.c
+++ b/fs/dlm/requestqueue.c
@@ -37,7 +37,7 @@ void dlm_add_requestqueue(struct dlm_ls *ls, int nodeid,
 	int length = le16_to_cpu(ms->m_header.h_length) -
 		sizeof(struct dlm_message);
 
-	e = kmalloc(sizeof(struct rq_entry) + length, GFP_NOFS);
+	e = kmalloc(sizeof(struct rq_entry) + length, GFP_ATOMIC);
 	if (!e) {
 		log_print("dlm_add_requestqueue: out of memory len %d", length);
 		return;
-- 
2.31.1

