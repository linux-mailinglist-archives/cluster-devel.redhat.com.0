Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A11A8561C41
	for <lists+cluster-devel@lfdr.de>; Thu, 30 Jun 2022 15:59:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656597592;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YL9f1II4Mw4H7t2E0klzVA5qKcGu0RnSH4xCbZTGJWU=;
	b=G7Lzv1Ns27xZtBJ3TXEpTlukpFM3m9vM9tQbnKzm03lipVI64YF+TrAX6ZQ31/WUbhZKPv
	z/4Mt3fMsCyFxPHqTEChFBBOHQzXnTsqGraxTwzBgTFNeVVXKT8cSCGRTSAahvpj95oA3c
	ds8CKhBK2sXFZxYI2h2Z0Npa0/3u9ts=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-y1yRit5wOMSCFd_l42OJQw-1; Thu, 30 Jun 2022 09:59:50 -0400
X-MC-Unique: y1yRit5wOMSCFd_l42OJQw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C9672919ECD;
	Thu, 30 Jun 2022 13:59:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AFB161415108;
	Thu, 30 Jun 2022 13:59:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 42CA4194704E;
	Thu, 30 Jun 2022 13:59:46 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 02F341947060 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 30 Jun 2022 13:59:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E375418EAB; Thu, 30 Jun 2022 13:59:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9166A815B;
 Thu, 30 Jun 2022 13:59:44 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: will@kernel.org
Date: Thu, 30 Jun 2022 09:59:33 -0400
Message-Id: <20220630135934.1799248-2-aahringo@redhat.com>
In-Reply-To: <20220630135934.1799248-1-aahringo@redhat.com>
References: <20220630135934.1799248-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [Cluster-devel] [RFC 1/2] refcount: add __cond_lock() for
 conditional lock refcount API
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
Cc: mark.rutland@arm.com, peterz@infradead.org, boqun.feng@gmail.com,
 linux-kernel@vger.kernel.org, cluster-devel@redhat.com,
 linux-sparse@vger.kernel.org, thunder.leizhen@huawei.com,
 jacob.e.keller@intel.com, akpm@linux-foundation.org,
 torvalds@linux-foundation.org, luc.vanoostenryck@gmail.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch adds the __cond_lock() macro to refcounts conditional lock
API. Currently sparse cannot detect the conditional lock handling of
refcount_dec_and_lock() functionality and prints a context imbalance
warning like:

warning: context imbalance in 'put_rsb' - unexpected unlock

with this patch and having the refcount_dec_and_lock() functionality
inside the if condition to decide whenever doing unlock or not the
warning disappears.

The patch follows a similar naming scheme like raw_spin_trylock() by
adding a "raw_" prefix to refcount_dec_and_lock() functionality and
introduce a macro for the replaced functions that uses __cond_lock()
to signal that an acquire depends on the return value of the passed
function.

A cast to bool seems to be necessary because __cond_lock() does return a
non-boolean scalar type.

The __must_check annotation was tested and is still working with this
patch applied.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 include/linux/refcount.h | 21 ++++++++++++++++-----
 lib/refcount.c           | 23 ++++++++++++-----------
 2 files changed, 28 insertions(+), 16 deletions(-)

diff --git a/include/linux/refcount.h b/include/linux/refcount.h
index b8a6e387f8f9..be7b970ce475 100644
--- a/include/linux/refcount.h
+++ b/include/linux/refcount.h
@@ -361,9 +361,20 @@ static inline void refcount_dec(refcount_t *r)
 
 extern __must_check bool refcount_dec_if_one(refcount_t *r);
 extern __must_check bool refcount_dec_not_one(refcount_t *r);
-extern __must_check bool refcount_dec_and_mutex_lock(refcount_t *r, struct mutex *lock);
-extern __must_check bool refcount_dec_and_lock(refcount_t *r, spinlock_t *lock);
-extern __must_check bool refcount_dec_and_lock_irqsave(refcount_t *r,
-						       spinlock_t *lock,
-						       unsigned long *flags);
+extern __must_check bool raw_refcount_dec_and_mutex_lock(refcount_t *r,
+							 struct mutex *lock);
+#define refcount_dec_and_mutex_lock(r, lock) \
+	((bool)(__cond_lock(lock, raw_refcount_dec_and_mutex_lock(r, lock))))
+
+extern __must_check bool raw_refcount_dec_and_lock(refcount_t *r,
+						   spinlock_t *lock);
+#define refcount_dec_and_lock(r, lock) \
+	((bool)(__cond_lock(lock, raw_refcount_dec_and_lock(r, lock))))
+
+extern __must_check bool raw_refcount_dec_and_lock_irqsave(refcount_t *r,
+							   spinlock_t *lock,
+							   unsigned long *flags);
+#define refcount_dec_and_lock_irqsave(r, lock, flags) \
+	((bool)(__cond_lock(lock, raw_refcount_dec_and_lock_irqsave(r, lock, flags))))
+
 #endif /* _LINUX_REFCOUNT_H */
diff --git a/lib/refcount.c b/lib/refcount.c
index a207a8f22b3c..1a8c7b9aba23 100644
--- a/lib/refcount.c
+++ b/lib/refcount.c
@@ -110,7 +110,7 @@ EXPORT_SYMBOL(refcount_dec_not_one);
  * Return: true and hold mutex if able to decrement refcount to 0, false
  *         otherwise
  */
-bool refcount_dec_and_mutex_lock(refcount_t *r, struct mutex *lock)
+bool raw_refcount_dec_and_mutex_lock(refcount_t *r, struct mutex *lock)
 {
 	if (refcount_dec_not_one(r))
 		return false;
@@ -123,11 +123,11 @@ bool refcount_dec_and_mutex_lock(refcount_t *r, struct mutex *lock)
 
 	return true;
 }
-EXPORT_SYMBOL(refcount_dec_and_mutex_lock);
+EXPORT_SYMBOL(raw_refcount_dec_and_mutex_lock);
 
 /**
- * refcount_dec_and_lock - return holding spinlock if able to decrement
- *                         refcount to 0
+ * raw_refcount_dec_and_lock - return holding spinlock if able to decrement
+ *			       refcount to 0
  * @r: the refcount
  * @lock: the spinlock to be locked
  *
@@ -141,7 +141,7 @@ EXPORT_SYMBOL(refcount_dec_and_mutex_lock);
  * Return: true and hold spinlock if able to decrement refcount to 0, false
  *         otherwise
  */
-bool refcount_dec_and_lock(refcount_t *r, spinlock_t *lock)
+bool raw_refcount_dec_and_lock(refcount_t *r, spinlock_t *lock)
 {
 	if (refcount_dec_not_one(r))
 		return false;
@@ -154,11 +154,12 @@ bool refcount_dec_and_lock(refcount_t *r, spinlock_t *lock)
 
 	return true;
 }
-EXPORT_SYMBOL(refcount_dec_and_lock);
+EXPORT_SYMBOL(raw_refcount_dec_and_lock);
 
 /**
- * refcount_dec_and_lock_irqsave - return holding spinlock with disabled
- *                                 interrupts if able to decrement refcount to 0
+ * raw_refcount_dec_and_lock_irqsave - return holding spinlock with disabled
+ *				       interrupts if able to decrement
+ *				       refcount to 0
  * @r: the refcount
  * @lock: the spinlock to be locked
  * @flags: saved IRQ-flags if the is acquired
@@ -169,8 +170,8 @@ EXPORT_SYMBOL(refcount_dec_and_lock);
  * Return: true and hold spinlock if able to decrement refcount to 0, false
  *         otherwise
  */
-bool refcount_dec_and_lock_irqsave(refcount_t *r, spinlock_t *lock,
-				   unsigned long *flags)
+bool raw_refcount_dec_and_lock_irqsave(refcount_t *r, spinlock_t *lock,
+				       unsigned long *flags)
 {
 	if (refcount_dec_not_one(r))
 		return false;
@@ -183,4 +184,4 @@ bool refcount_dec_and_lock_irqsave(refcount_t *r, spinlock_t *lock,
 
 	return true;
 }
-EXPORT_SYMBOL(refcount_dec_and_lock_irqsave);
+EXPORT_SYMBOL(raw_refcount_dec_and_lock_irqsave);
-- 
2.31.1

