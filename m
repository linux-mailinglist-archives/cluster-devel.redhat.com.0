Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 176A16ACF79
	for <lists+cluster-devel@lfdr.de>; Mon,  6 Mar 2023 21:48:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678135714;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9YPLdnm/gIxfJR0wE9RRQgxCzKf+h0HP2Rudh7F8f8I=;
	b=GvolT4TeHADOTtIQjcqKUITdulhRKDqhudJL6uAHOcnNKunOqNRdfXNwklolnVitzUOy7J
	NZ49dl3qW2uaNWqlNzkWAUcDkTGDqeQ7qeLev+nnwTd8unH3tfSA/0nEK6iKqP/xG24Zod
	upcyvcsx03sEGnkXDIwCZhPJ1W4IXZE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-0tswxpRkPTS1JsHpUCfq4g-1; Mon, 06 Mar 2023 15:48:30 -0500
X-MC-Unique: 0tswxpRkPTS1JsHpUCfq4g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8901D3813F3C;
	Mon,  6 Mar 2023 20:48:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7E0A540C945A;
	Mon,  6 Mar 2023 20:48:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2727819465B5;
	Mon,  6 Mar 2023 20:48:29 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CC274194658D for <cluster-devel@listman.corp.redhat.com>;
 Mon,  6 Mar 2023 20:48:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C11CC44104; Mon,  6 Mar 2023 20:48:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D88551FF;
 Mon,  6 Mar 2023 20:48:27 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  6 Mar 2023 15:48:17 -0500
Message-Id: <20230306204819.2747646-11-aahringo@redhat.com>
In-Reply-To: <20230306204819.2747646-1-aahringo@redhat.com>
References: <20230306204819.2747646-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Cluster-devel] [PATCH v6.3-rc1 10/12] fs: dlm: rsb hash table flag
 value to atomic ops
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch moves the rsb hash table handling to atomic flag operations.
The flag operations for DLM_RTF_SHRINK are protected by
ls->ls_rsbtbl[b].lock. However we switch to atomic ops if new possible
flags will be used in a different way and don't assume such lock
dependencies.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/dlm_internal.h | 4 ++--
 fs/dlm/lock.c         | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index b33473d9e3cf..e2925f554bc7 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -99,13 +99,13 @@ do { \
 }
 
 
-#define DLM_RTF_SHRINK		0x00000001
+#define DLM_RTF_SHRINK_BIT	0
 
 struct dlm_rsbtable {
 	struct rb_root		keep;
 	struct rb_root		toss;
 	spinlock_t		lock;
-	uint32_t		flags;
+	unsigned long		flags;
 };
 
 
diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index ecb2deef6eae..507a03fe2279 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -1139,7 +1139,7 @@ static void toss_rsb(struct kref *kref)
 	rb_erase(&r->res_hashnode, &ls->ls_rsbtbl[r->res_bucket].keep);
 	rsb_insert(r, &ls->ls_rsbtbl[r->res_bucket].toss);
 	r->res_toss_time = jiffies;
-	ls->ls_rsbtbl[r->res_bucket].flags |= DLM_RTF_SHRINK;
+	set_bit(DLM_RTF_SHRINK_BIT, &ls->ls_rsbtbl[r->res_bucket].flags);
 	if (r->res_lvbptr) {
 		dlm_free_lvb(r->res_lvbptr);
 		r->res_lvbptr = NULL;
@@ -1588,7 +1588,7 @@ static void shrink_bucket(struct dlm_ls *ls, int b)
 
 	spin_lock(&ls->ls_rsbtbl[b].lock);
 
-	if (!(ls->ls_rsbtbl[b].flags & DLM_RTF_SHRINK)) {
+	if (!test_bit(DLM_RTF_SHRINK_BIT, &ls->ls_rsbtbl[b].flags)) {
 		spin_unlock(&ls->ls_rsbtbl[b].lock);
 		return;
 	}
@@ -1643,9 +1643,9 @@ static void shrink_bucket(struct dlm_ls *ls, int b)
 	}
 
 	if (need_shrink)
-		ls->ls_rsbtbl[b].flags |= DLM_RTF_SHRINK;
+		set_bit(DLM_RTF_SHRINK_BIT, &ls->ls_rsbtbl[b].flags);
 	else
-		ls->ls_rsbtbl[b].flags &= ~DLM_RTF_SHRINK;
+		clear_bit(DLM_RTF_SHRINK_BIT, &ls->ls_rsbtbl[b].flags);
 	spin_unlock(&ls->ls_rsbtbl[b].lock);
 
 	/*
-- 
2.31.1

