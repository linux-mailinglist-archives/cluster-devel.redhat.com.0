Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D889C561C43
	for <lists+cluster-devel@lfdr.de>; Thu, 30 Jun 2022 15:59:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656597592;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+GZL7A1rDCS9BWoMyYGxRSSo338VZcyjs0gmjggSCak=;
	b=AMlmZZhgskGM25btntdGkuoAr0IOiI4159uGV71qYTLtAfd2YmrT4KD0tZYSAaeuoPKIlN
	HunP4NUSPW6y834Q6qopfE9nECG1+wseCp5CwFEN/4cTyaA/km0ioZtNAtK6mR9QXZl8gh
	2wWNn+EQ9WpAGrI1M3RCE+7qTwybqJw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-382-gT42NrSSPj6g_f0XBd-rZw-1; Thu, 30 Jun 2022 09:59:49 -0400
X-MC-Unique: gT42NrSSPj6g_f0XBd-rZw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D1368316FB;
	Thu, 30 Jun 2022 13:59:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F08D71121314;
	Thu, 30 Jun 2022 13:59:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5712D194707A;
	Thu, 30 Jun 2022 13:59:46 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5542D194704E for <cluster-devel@listman.corp.redhat.com>;
 Thu, 30 Jun 2022 13:59:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 492289D63; Thu, 30 Jun 2022 13:59:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC25C815B;
 Thu, 30 Jun 2022 13:59:44 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: will@kernel.org
Date: Thu, 30 Jun 2022 09:59:34 -0400
Message-Id: <20220630135934.1799248-3-aahringo@redhat.com>
In-Reply-To: <20220630135934.1799248-1-aahringo@redhat.com>
References: <20220630135934.1799248-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [Cluster-devel] [RFC 2/2] kref: move kref_put_lock() callback to
 caller
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch moves the release callback call to the caller of kref_put_lock()
functionality. Since refcount_dec_and_lock() uses __cond_lock() we get
the following warning for e.g. net/sunrpc/svcauth.c:

warning: context imbalance in 'auth_domain_put' - wrong count at exit

The warning occurs now because it seems that before __cond_lock() change
sparse was able to detect the correct locking behaviour. Now it thinks
there is an additional lock acquire. However the __cond_lock()
instrumentation in refcount_dec_and_lock() was making it possible to
avoid sparse warnings by evaluating the return value and unlock the lock
if conditional necessary.

This patch solves the problem by just do the passed release callback
call based by the return value of kref_put_lock() and not inside of
kref_put_lock() and evaluating the return value of
refcount_dec_and_lock() that surprisingly sparse can recognize.

It seems it's only possible to have the one way or the other. This patch
changes the kref_put_lock() in way that it works like
refcount_dec_and_lock() way with __cond_lock().

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 include/linux/kref.h | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/include/linux/kref.h b/include/linux/kref.h
index d32e21a2538c..a70d45940d55 100644
--- a/include/linux/kref.h
+++ b/include/linux/kref.h
@@ -68,27 +68,19 @@ static inline int kref_put(struct kref *kref, void (*release)(struct kref *kref)
 	return 0;
 }
 
-static inline int kref_put_mutex(struct kref *kref,
-				 void (*release)(struct kref *kref),
-				 struct mutex *lock)
+static inline bool raw_kref_put_mutex(struct kref *kref, struct mutex *lock)
 {
-	if (refcount_dec_and_mutex_lock(&kref->refcount, lock)) {
-		release(kref);
-		return 1;
-	}
-	return 0;
+	return refcount_dec_and_mutex_lock(&kref->refcount, lock);
 }
+#define kref_put_mutex(kref, release, lock) \
+	((raw_kref_put_mutex(kref, lock)) ? ({ release(kref); 1; }) : 0)
 
-static inline int kref_put_lock(struct kref *kref,
-				void (*release)(struct kref *kref),
-				spinlock_t *lock)
+static inline bool raw_kref_put_lock(struct kref *kref, spinlock_t *lock)
 {
-	if (refcount_dec_and_lock(&kref->refcount, lock)) {
-		release(kref);
-		return 1;
-	}
-	return 0;
+	return refcount_dec_and_lock(&kref->refcount, lock);
 }
+#define kref_put_lock(kref, release, lock) \
+	((raw_kref_put_lock(kref, lock)) ? ({ release(kref); 1; }) : 0)
 
 /**
  * kref_get_unless_zero - Increment refcount for object unless it is zero.
-- 
2.31.1

