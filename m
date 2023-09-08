Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A21F779912B
	for <lists+cluster-devel@lfdr.de>; Fri,  8 Sep 2023 22:46:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694205988;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=C5A1PiIUGnym3TzzZ4jCxGhFPtCjZa+spSmbxjRGRbk=;
	b=Yi6wGGCWb5bvfvi/dJ5lUvihVkkkmycIbtLltoodqDW8ZMclnLexZIwzyqwGeEq/kZQQQC
	B2OCxEFFckcSi/lnAHFpGlv/j+sq7onPJz1087leI7K2Lc/FJg8zFtD43aPb0JLXnrbNSY
	L+3c1MFD75r0B1llmIigtN8e0Xbskrc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-258-uRFarrCwN-2Cmv7xW439Yw-1; Fri, 08 Sep 2023 16:46:26 -0400
X-MC-Unique: uRFarrCwN-2Cmv7xW439Yw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 51D68101CA8C;
	Fri,  8 Sep 2023 20:46:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5A7124024322;
	Fri,  8 Sep 2023 20:46:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AD4E819465B1;
	Fri,  8 Sep 2023 20:46:23 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6209B1946586 for <cluster-devel@listman.corp.redhat.com>;
 Fri,  8 Sep 2023 20:46:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 53EAE2013570; Fri,  8 Sep 2023 20:46:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2ACF721EE56C;
 Fri,  8 Sep 2023 20:46:23 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri,  8 Sep 2023 16:46:06 -0400
Message-Id: <20230908204611.1910601-5-aahringo@redhat.com>
In-Reply-To: <20230908204611.1910601-1-aahringo@redhat.com>
References: <20230908204611.1910601-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [RFC dlm/next 05/10] fs: dlm: convert res_lock to
 spinlock
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch converts the per dlm rsb res_lock from a mutex to a spinlock.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/dlm_internal.h | 2 +-
 fs/dlm/lock.c         | 2 +-
 fs/dlm/lock.h         | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index 2f32e053a9dc..383b26144a31 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -290,7 +290,7 @@ struct dlm_lkb {
 struct dlm_rsb {
 	struct dlm_ls		*res_ls;	/* the lockspace */
 	struct kref		res_ref;
-	struct mutex		res_mutex;
+	spinlock_t		res_lock;
 	unsigned long		res_flags;
 	int			res_length;	/* length of rsb name */
 	int			res_nodeid;
diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 5631623ce01a..3d17f4d6b765 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -415,7 +415,7 @@ static int get_rsb_struct(struct dlm_ls *ls, const void *name, int len,
 	r->res_ls = ls;
 	r->res_length = len;
 	memcpy(r->res_name, name, len);
-	mutex_init(&r->res_mutex);
+	spin_lock_init(&r->res_lock);
 
 	INIT_LIST_HEAD(&r->res_lookup);
 	INIT_LIST_HEAD(&r->res_grantqueue);
diff --git a/fs/dlm/lock.h b/fs/dlm/lock.h
index b54e2cbbe6e2..1428fa3482d7 100644
--- a/fs/dlm/lock.h
+++ b/fs/dlm/lock.h
@@ -68,12 +68,12 @@ static inline int is_master(struct dlm_rsb *r)
 
 static inline void lock_rsb(struct dlm_rsb *r)
 {
-	mutex_lock(&r->res_mutex);
+	spin_lock(&r->res_lock);
 }
 
 static inline void unlock_rsb(struct dlm_rsb *r)
 {
-	mutex_unlock(&r->res_mutex);
+	spin_unlock(&r->res_lock);
 }
 
 #endif
-- 
2.31.1

