Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E15C8558CD2
	for <lists+cluster-devel@lfdr.de>; Fri, 24 Jun 2022 03:29:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656034154;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UXyI3jMkbAyvyzMsn9IYYBUpjhpLAEqaLIB0N+7DOCs=;
	b=N3b7J8e9+S+0CtY3att0IKpL21riOuFw7/12YQz10PI4jsAIjkMzyn01yAtOds0a44NqA/
	t/tJefalsUeAa1it2gxtJaeriEwePJ7tgTwxy+Usq2HrlS5G5e5r5UBrWxbHeSH6Y4zDi2
	5Z8SDETq5oFc6vKj7jy53Izu3vBmXR0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-9bvSZr5NMJqfnVlppNcNKw-1; Thu, 23 Jun 2022 21:29:11 -0400
X-MC-Unique: 9bvSZr5NMJqfnVlppNcNKw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 77BB8101AA48;
	Fri, 24 Jun 2022 01:29:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 99D6A492CA5;
	Fri, 24 Jun 2022 01:29:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DA30B194B962;
	Fri, 24 Jun 2022 01:29:06 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5928E1947065 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 24 Jun 2022 01:29:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3C9C4416171; Fri, 24 Jun 2022 01:29:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F53740334F;
 Fri, 24 Jun 2022 01:29:05 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 23 Jun 2022 21:28:59 -0400
Message-Id: <20220624012900.2355825-2-aahringo@redhat.com>
In-Reply-To: <20220624012900.2355825-1-aahringo@redhat.com>
References: <20220624012900.2355825-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: [Cluster-devel] [PATCH dlm/next 2/3] fs: dlm: fix context imbalance
 warning in __put_lkb()
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch fixes the following sparse warning:

warning: context imbalance in '__put_lkb' - unexpected unlock

it does this by unlock the ls_lkbidr_spin lock inside of the release
functionality of kref_put_lock() and do a __releases() annotation at the
release function. The kref_put_lock() for __put_lkb() has a special
requirement to pass an additional dlm_ls pointer to the release callback,
this is done by providing an own implementation of kref_put_lock() that
is named dlm_kref_put_lock() and can pass an additional parameter.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lock.c | 46 +++++++++++++++++++++++++++-------------------
 1 file changed, 27 insertions(+), 19 deletions(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index dac7eb75dba9..4b5cff76d376 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -1256,7 +1256,8 @@ static int find_lkb(struct dlm_ls *ls, uint32_t lkid, struct dlm_lkb **lkb_ret)
 	return lkb ? 0 : -ENOENT;
 }
 
-static void kill_lkb(struct kref *kref)
+static void kill_lkb(struct kref *kref, struct dlm_ls *ls)
+	 __releases(&ls->ls_lkbidr_spin)
 {
 	struct dlm_lkb *lkb = container_of(kref, struct dlm_lkb, lkb_ref);
 
@@ -1264,6 +1265,29 @@ static void kill_lkb(struct kref *kref)
 	   can release the write_lock before the detach_lkb */
 
 	DLM_ASSERT(!lkb->lkb_status, dlm_print_lkb(lkb););
+
+	idr_remove(&ls->ls_lkbidr, lkb->lkb_id);
+	spin_unlock(&ls->ls_lkbidr_spin);
+
+	detach_lkb(lkb);
+
+	/* for local/process lkbs, lvbptr points to caller's lksb */
+	if (lkb->lkb_lvbptr && is_master_copy(lkb))
+		dlm_free_lvb(lkb->lkb_lvbptr);
+	dlm_free_lkb(lkb);
+}
+
+static inline int dlm_kref_put_lock(struct kref *kref,
+				    void (*release)(struct kref *kref,
+						    struct dlm_ls *ls),
+				    spinlock_t *lock,
+				    struct dlm_ls *ls)
+{
+	if (refcount_dec_and_lock(&kref->refcount, lock)) {
+		release(kref, ls);
+		return 1;
+	}
+	return 0;
 }
 
 /* __put_lkb() is used when an lkb may not have an rsb attached to
@@ -1271,24 +1295,8 @@ static void kill_lkb(struct kref *kref)
 
 static int __put_lkb(struct dlm_ls *ls, struct dlm_lkb *lkb)
 {
-	uint32_t lkid = lkb->lkb_id;
-	int rv;
-
-	rv = kref_put_lock(&lkb->lkb_ref, kill_lkb,
-			   &ls->ls_lkbidr_spin);
-	if (rv) {
-		idr_remove(&ls->ls_lkbidr, lkid);
-		spin_unlock(&ls->ls_lkbidr_spin);
-
-		detach_lkb(lkb);
-
-		/* for local/process lkbs, lvbptr points to caller's lksb */
-		if (lkb->lkb_lvbptr && is_master_copy(lkb))
-			dlm_free_lvb(lkb->lkb_lvbptr);
-		dlm_free_lkb(lkb);
-	}
-
-	return rv;
+	return dlm_kref_put_lock(&lkb->lkb_ref, kill_lkb,
+				 &ls->ls_lkbidr_spin, ls);
 }
 
 int dlm_put_lkb(struct dlm_lkb *lkb)
-- 
2.31.1

