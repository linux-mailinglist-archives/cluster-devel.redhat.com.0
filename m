Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA64610319
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Oct 2022 22:46:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666903568;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/qUokaA1dGl5loROVgYp8HkDwwOEAbjlIaTP36/jBwU=;
	b=NSYovQfA8t5es1aOe34DaJaRe5EdhnprZXxti67+anjAubUg1uQa9HdCoV+Eyq0wu+VBFo
	jErk95or0jmbfMwgPrzmXJgPrXGB4c1/qFOzbbA50VDPIcdfRS1ZWQWFIkRuH59XhWQ2CK
	U4bkWmgGzKlAVDoavVde/IfEuR/mXT0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-30-8WajVEHsPbWZTWHP3FlNSQ-1; Thu, 27 Oct 2022 16:46:03 -0400
X-MC-Unique: 8WajVEHsPbWZTWHP3FlNSQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FE8118E0049;
	Thu, 27 Oct 2022 20:45:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 24D2F112132D;
	Thu, 27 Oct 2022 20:45:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E04DD1947055;
	Thu, 27 Oct 2022 20:45:47 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 32F0F19466DF for <cluster-devel@listman.corp.redhat.com>;
 Thu, 27 Oct 2022 20:45:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EC09F112C085; Thu, 27 Oct 2022 20:45:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7E521121325;
 Thu, 27 Oct 2022 20:45:36 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 27 Oct 2022 16:45:19 -0400
Message-Id: <20221027204528.1119036-9-aahringo@redhat.com>
In-Reply-To: <20221027204528.1119036-1-aahringo@redhat.com>
References: <20221027204528.1119036-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [PATCH v6.1-rc1 09/18] fs: dlm: use spin lock
 instead of mutex
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

There is no need to use a mutex in those hot path sections. We change it
to spin lock to serve callbacks more faster by not allowing schedule.
The locked sections will not be locked for a long time.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/ast.c          | 8 ++++----
 fs/dlm/dlm_internal.h | 2 +-
 fs/dlm/lock.c         | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/dlm/ast.c b/fs/dlm/ast.c
index daaa0dff6ef4..3e76ec75bc55 100644
--- a/fs/dlm/ast.c
+++ b/fs/dlm/ast.c
@@ -190,7 +190,7 @@ void dlm_add_cb(struct dlm_lkb *lkb, uint32_t flags, int mode, int status,
 		return;
 	}
 
-	mutex_lock(&lkb->lkb_cb_mutex);
+	spin_lock(&lkb->lkb_cb_lock);
 	prev_seq = lkb->lkb_callbacks[0].seq;
 
 	rv = dlm_add_lkb_callback(lkb, flags, mode, status, sbflags, new_seq);
@@ -209,7 +209,7 @@ void dlm_add_cb(struct dlm_lkb *lkb, uint32_t flags, int mode, int status,
 		spin_unlock(&ls->ls_cb_lock);
 	}
  out:
-	mutex_unlock(&lkb->lkb_cb_mutex);
+	spin_unlock(&lkb->lkb_cb_lock);
 }
 
 void dlm_callback_work(struct work_struct *work)
@@ -223,7 +223,7 @@ void dlm_callback_work(struct work_struct *work)
 
 	memset(&callbacks, 0, sizeof(callbacks));
 
-	mutex_lock(&lkb->lkb_cb_mutex);
+	spin_lock(&lkb->lkb_cb_lock);
 	if (!lkb->lkb_callbacks[0].seq) {
 		/* no callback work exists, shouldn't happen */
 		log_error(ls, "dlm_callback_work %x no work", lkb->lkb_id);
@@ -244,7 +244,7 @@ void dlm_callback_work(struct work_struct *work)
 		dlm_print_lkb(lkb);
 		dlm_dump_lkb_callbacks(lkb);
 	}
-	mutex_unlock(&lkb->lkb_cb_mutex);
+	spin_unlock(&lkb->lkb_cb_lock);
 
 	castfn = lkb->lkb_astfn;
 	bastfn = lkb->lkb_bastfn;
diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index 647a6a61531c..11f3a5c67bdd 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -268,7 +268,7 @@ struct dlm_lkb {
 	unsigned long		lkb_timeout_cs;
 #endif
 
-	struct mutex		lkb_cb_mutex;
+	spinlock_t		lkb_cb_lock;
 	struct work_struct	lkb_cb_work;
 	struct list_head	lkb_cb_list; /* for ls_cb_delay or proc->asts */
 	struct dlm_callback	lkb_callbacks[DLM_CALLBACKS_SIZE];
diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 0b1bc24536ce..40e4e4a1c582 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -1218,7 +1218,7 @@ static int _create_lkb(struct dlm_ls *ls, struct dlm_lkb **lkb_ret,
 	INIT_LIST_HEAD(&lkb->lkb_time_list);
 #endif
 	INIT_LIST_HEAD(&lkb->lkb_cb_list);
-	mutex_init(&lkb->lkb_cb_mutex);
+	spin_lock_init(&lkb->lkb_cb_lock);
 	INIT_WORK(&lkb->lkb_cb_work, dlm_callback_work);
 
 	idr_preload(GFP_NOFS);
-- 
2.31.1

