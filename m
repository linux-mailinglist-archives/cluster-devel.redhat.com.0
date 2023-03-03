Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DF56A98B1
	for <lists+cluster-devel@lfdr.de>; Fri,  3 Mar 2023 14:38:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677850736;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0aw359Uxw0il1ClSMyNRsW6OZwGUAa8jOT0S6C57Wb4=;
	b=QAIM2xnPU4sJbL9Fi8XvGi3HXCYSqJIITCKfews1yGxWZ8ZLqH8awIIzzPllPf/tnJhTiv
	Ywen+8Bt7zEcyUqWe4RcWDQs9cIOEv6pEGL2cUuVshZylYYPte9qJlsZs9buBk/ay0nvzK
	bfrr2EdCE9I9HkfCL+zALLuRUZRxfIA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-1-5a-sx2MwPEePmJT2Y_3bew-1; Fri, 03 Mar 2023 08:38:52 -0500
X-MC-Unique: 5a-sx2MwPEePmJT2Y_3bew-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5108185A7A4;
	Fri,  3 Mar 2023 13:38:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1C6F540C6EC4;
	Fri,  3 Mar 2023 13:38:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9C62F19452D0;
	Fri,  3 Mar 2023 13:38:49 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0CDF519465A0 for <cluster-devel@listman.corp.redhat.com>;
 Fri,  3 Mar 2023 13:38:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B5EE52166B2B; Fri,  3 Mar 2023 13:38:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (unknown [10.45.225.233])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 911A82166B26;
 Fri,  3 Mar 2023 13:38:46 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Alexander Aring <aahringo@redhat.com>
Date: Fri,  3 Mar 2023 14:38:45 +0100
Message-Id: <20230303133845.801743-1-agruenba@redhat.com>
In-Reply-To: <20230302171441.1509914-13-aahringo@redhat.com>
References: <20230302171441.1509914-13-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Cluster-devel] [PATCH dlm-tool 13/14] dlm_controld: plock log
 lock state
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

Alexx,

can you please prefix this patch with the following to make this easier
to read?

Thanks,
Andreas

--

dlm_controld: pass lockspace and lock number to add_lock()

The next patch will make use of the additional arguments.
---
 dlm_controld/plock.c | 41 ++++++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/dlm_controld/plock.c b/dlm_controld/plock.c
index b93863f7..6709d205 100644
--- a/dlm_controld/plock.c
+++ b/dlm_controld/plock.c
@@ -466,8 +466,9 @@ static int is_conflict(struct resource *r, struct dlm_plock_info *in, int get)
 	return 0;
 }
 
-static int add_lock(struct resource *r, uint32_t nodeid, uint64_t owner,
-		    uint32_t pid, int ex, uint64_t start, uint64_t end)
+static int add_lock(const struct lockspace *ls, struct resource *r,
+		    uint32_t nodeid, uint64_t owner, uint32_t pid,
+		    int ex, uint64_t start, uint64_t end, uint64_t number)
 {
 	struct posix_lock *po;
 
@@ -491,8 +492,8 @@ static int add_lock(struct resource *r, uint32_t nodeid, uint64_t owner,
    1. add new lock for non-overlap area of RE, orig mode
    2. convert RE to RN range and mode */
 
-static int lock_case1(struct posix_lock *po, struct resource *r,
-		      struct dlm_plock_info *in)
+static int lock_case1(const struct lockspace *ls, struct posix_lock *po,
+		      struct resource *r, struct dlm_plock_info *in)
 {
 	uint64_t start2, end2;
 	int rv;
@@ -508,7 +509,8 @@ static int lock_case1(struct posix_lock *po, struct resource *r,
 	po->end = in->end;
 	po->ex = in->ex;
 
-	rv = add_lock(r, in->nodeid, in->owner, in->pid, !in->ex, start2, end2);
+	rv = add_lock(ls, r, in->nodeid, in->owner, in->pid, !in->ex, start2,
+		      end2, in->number);
  out:
 	return rv;
 }
@@ -518,19 +520,20 @@ static int lock_case1(struct posix_lock *po, struct resource *r,
    2. add new lock for back fragment, orig mode
    3. convert RE to RN range and mode */
 			 
-static int lock_case2(struct posix_lock *po, struct resource *r,
-		      struct dlm_plock_info *in)
+static int lock_case2(const struct lockspace *ls, struct posix_lock *po,
+		      struct resource *r, struct dlm_plock_info *in)
 
 {
 	int rv;
 
-	rv = add_lock(r, in->nodeid, in->owner, in->pid,
-		      !in->ex, po->start, in->start - 1);
+	rv = add_lock(ls, r, in->nodeid, in->owner, in->pid,
+		      !in->ex, po->start, in->start - 1,
+		      in->number);
 	if (rv)
 		goto out;
 
-	rv = add_lock(r, in->nodeid, in->owner, in->pid,
-		      !in->ex, in->end + 1, po->end);
+	rv = add_lock(ls, r, in->nodeid, in->owner, in->pid,
+		      !in->ex, in->end + 1, po->end, in->number);
 	if (rv)
 		goto out;
 
@@ -569,14 +572,14 @@ static int lock_internal(struct lockspace *ls, struct resource *r,
 			if (po->ex == in->ex)
 				goto out;
 
-			rv = lock_case1(po, r, in);
+			rv = lock_case1(ls, po, r, in);
 			goto out;
 
 		case 2:
 			if (po->ex == in->ex)
 				goto out;
 
-			rv = lock_case2(po, r, in);
+			rv = lock_case2(ls, po, r, in);
 			goto out;
 
 		case 3:
@@ -597,8 +600,8 @@ static int lock_internal(struct lockspace *ls, struct resource *r,
 		}
 	}
 
-	rv = add_lock(r, in->nodeid, in->owner, in->pid,
-		      in->ex, in->start, in->end);
+	rv = add_lock(ls, r, in->nodeid, in->owner, in->pid,
+		      in->ex, in->start, in->end, in->number);
  out:
 	return rv;
 
@@ -638,8 +641,8 @@ static int unlock_internal(struct lockspace *ls, struct resource *r,
 			/* RN within RE - shrink and update RE to be front
 			 * fragment, and add a new lock for back fragment */
 
-			rv = add_lock(r, in->nodeid, in->owner, in->pid,
-				      po->ex, in->end + 1, po->end);
+			rv = add_lock(ls, r, in->nodeid, in->owner, in->pid,
+				      po->ex, in->end + 1, po->end, in->number);
 			po->end = in->start - 1;
 			goto out;
 
@@ -1346,8 +1349,8 @@ static void _receive_sync(struct lockspace *ls, struct dlm_header *hd, int len)
 	}
 
 	if (hd->type == DLM_MSG_PLOCK_SYNC_LOCK)
-		add_lock(r, info.nodeid, info.owner, info.pid, info.ex, 
-			 info.start, info.end);
+		add_lock(ls, r, info.nodeid, info.owner, info.pid, info.ex,
+			 info.start, info.end, info.number);
 	else if (hd->type == DLM_MSG_PLOCK_SYNC_WAITER)
 		add_waiter(ls, r, &info);
 }
-- 
2.39.0

