Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B656A87A2
	for <lists+cluster-devel@lfdr.de>; Thu,  2 Mar 2023 18:15:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677777316;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=94YhuEceP1iPYT3u9286qtHKsCWQat0xxM78o+h2cfA=;
	b=OG03j8o5fBxhIV3BFd6InZgXoGjmoq2vWGwMVmgVXf+uF3kDWvb41ydI22dVZbd/8tE9R1
	Dl25pPEe70MXhJidDqwZEKwLhcr5rqTImH1+cQKSMm8AxPq+YFuzxxCW/Kc12HwvjPXDkT
	XMCTJM82b6q0qT+gNaV5tIoPa+a/qII=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-zNqCxYUFMkGT_ksTa46Frw-1; Thu, 02 Mar 2023 12:15:14 -0500
X-MC-Unique: zNqCxYUFMkGT_ksTa46Frw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5CE633804524;
	Thu,  2 Mar 2023 17:15:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4B359492B19;
	Thu,  2 Mar 2023 17:15:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8CE0E1949741;
	Thu,  2 Mar 2023 17:15:10 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 211E21948659 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  2 Mar 2023 17:15:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E211A492B1C; Thu,  2 Mar 2023 17:14:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD28C492B00;
 Thu,  2 Mar 2023 17:14:56 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu,  2 Mar 2023 12:14:40 -0500
Message-Id: <20230302171441.1509914-13-aahringo@redhat.com>
In-Reply-To: <20230302171441.1509914-1-aahringo@redhat.com>
References: <20230302171441.1509914-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [Cluster-devel] [PATCH dlm-tool 13/14] dlm_controld: plock log lock
 state
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch adds additional log_plock() calls to track the start and end
of lock states inside the dlm_controld lock database. With this
information we know when a specific lock had a specfic lock mode (WR or
RD) in use as in view of dlm_controld cluster-wide plock view.
---
 dlm_controld/plock.c | 82 ++++++++++++++++++++++++++++++++++----------
 1 file changed, 63 insertions(+), 19 deletions(-)

diff --git a/dlm_controld/plock.c b/dlm_controld/plock.c
index b93863f7..39bdd1f6 100644
--- a/dlm_controld/plock.c
+++ b/dlm_controld/plock.c
@@ -227,6 +227,26 @@ static void plock_print_end_waiter(const struct lockspace *ls,
 		  (unsigned long long)w->info.number, w);
 }
 
+static void plock_print_start_plock(const struct lockspace *ls, uint64_t number,
+				    const struct posix_lock *po)
+{
+	log_plock(ls, "state plock start %llx %p %s %llx-%llx %d/%u/%llx",
+		  (unsigned long long)number,
+		  po,
+		  po->ex ? "WR" : "RD",
+		  (unsigned long long)po->start,
+		  (unsigned long long)po->end,
+		  po->nodeid, po->pid,
+		  (unsigned long long)po->owner);
+}
+
+static void plock_print_end_plock(const struct lockspace *ls, uint64_t number,
+				  const struct posix_lock *po)
+{
+	log_plock(ls, "state plock end %llx %p",
+		  (unsigned long long)number, po);
+}
+
 static struct resource * rb_search_plock_resource(struct lockspace *ls, uint64_t number)
 {
 	struct rb_node *n = ls->plock_resources_root.rb_node;
@@ -466,8 +486,9 @@ static int is_conflict(struct resource *r, struct dlm_plock_info *in, int get)
 	return 0;
 }
 
-static int add_lock(struct resource *r, uint32_t nodeid, uint64_t owner,
-		    uint32_t pid, int ex, uint64_t start, uint64_t end)
+static int add_lock(const struct lockspace *ls, struct resource *r,
+		    uint32_t nodeid, uint64_t owner, uint32_t pid,
+		    int ex, uint64_t start, uint64_t end, uint64_t number)
 {
 	struct posix_lock *po;
 
@@ -482,6 +503,7 @@ static int add_lock(struct resource *r, uint32_t nodeid, uint64_t owner,
 	po->owner = owner;
 	po->pid = pid;
 	po->ex = ex;
+	plock_print_start_plock(ls, number, po);
 	list_add_tail(&po->list, &r->locks);
 
 	return 0;
@@ -491,8 +513,8 @@ static int add_lock(struct resource *r, uint32_t nodeid, uint64_t owner,
    1. add new lock for non-overlap area of RE, orig mode
    2. convert RE to RN range and mode */
 
-static int lock_case1(struct posix_lock *po, struct resource *r,
-		      struct dlm_plock_info *in)
+static int lock_case1(const struct lockspace *ls, struct posix_lock *po,
+		      struct resource *r, struct dlm_plock_info *in)
 {
 	uint64_t start2, end2;
 	int rv;
@@ -508,7 +530,8 @@ static int lock_case1(struct posix_lock *po, struct resource *r,
 	po->end = in->end;
 	po->ex = in->ex;
 
-	rv = add_lock(r, in->nodeid, in->owner, in->pid, !in->ex, start2, end2);
+	rv = add_lock(ls, r, in->nodeid, in->owner, in->pid, !in->ex, start2,
+		      end2, in->number);
  out:
 	return rv;
 }
@@ -518,19 +541,20 @@ static int lock_case1(struct posix_lock *po, struct resource *r,
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
 
@@ -561,34 +585,43 @@ static int lock_internal(struct lockspace *ls, struct resource *r,
 			if (po->ex == in->ex)
 				goto out;
 
+			plock_print_end_plock(ls, in->number, po);
 			/* ranges the same - just update the existing lock */
 			po->ex = in->ex;
+			plock_print_start_plock(ls, in->number, po);
 			goto out;
 
 		case 1:
 			if (po->ex == in->ex)
 				goto out;
 
-			rv = lock_case1(po, r, in);
+			plock_print_end_plock(ls, in->number, po);
+			rv = lock_case1(ls, po, r, in);
+			plock_print_start_plock(ls, in->number, po);
 			goto out;
 
 		case 2:
 			if (po->ex == in->ex)
 				goto out;
 
-			rv = lock_case2(po, r, in);
+			plock_print_end_plock(ls, in->number, po);
+			rv = lock_case2(ls, po, r, in);
+			plock_print_start_plock(ls, in->number, po);
 			goto out;
 
 		case 3:
 			list_del(&po->list);
+			plock_print_end_plock(ls, in->number, po);
 			free(po);
 			break;
 
 		case 4:
+			plock_print_end_plock(ls, in->number, po);
 			if (po->start < in->start)
 				po->end = in->start - 1;
 			else
 				po->start = in->end + 1;
+			plock_print_start_plock(ls, in->number, po);
 			break;
 
 		default:
@@ -597,8 +630,8 @@ static int lock_internal(struct lockspace *ls, struct resource *r,
 		}
 	}
 
-	rv = add_lock(r, in->nodeid, in->owner, in->pid,
-		      in->ex, in->start, in->end);
+	rv = add_lock(ls, r, in->nodeid, in->owner, in->pid,
+		      in->ex, in->start, in->end, in->number);
  out:
 	return rv;
 
@@ -624,6 +657,7 @@ static int unlock_internal(struct lockspace *ls, struct resource *r,
 			/* ranges the same - just remove the existing lock */
 
 			list_del(&po->list);
+			plock_print_end_plock(ls, in->number, po);
 			free(po);
 			goto out;
 
@@ -631,16 +665,20 @@ static int unlock_internal(struct lockspace *ls, struct resource *r,
 			/* RN within RE and starts or ends on RE boundary -
 			 * shrink and update RE */
 
+			plock_print_end_plock(ls, in->number, po);
 			rv = shrink_range(po, in->start, in->end);
+			plock_print_start_plock(ls, in->number, po);
 			goto out;
 
 		case 2:
 			/* RN within RE - shrink and update RE to be front
 			 * fragment, and add a new lock for back fragment */
 
-			rv = add_lock(r, in->nodeid, in->owner, in->pid,
-				      po->ex, in->end + 1, po->end);
+			plock_print_end_plock(ls, in->number, po);
+			rv = add_lock(ls, r, in->nodeid, in->owner, in->pid,
+				      po->ex, in->end + 1, po->end, in->number);
 			po->end = in->start - 1;
+			plock_print_start_plock(ls, in->number, po);
 			goto out;
 
 		case 3:
@@ -648,6 +686,7 @@ static int unlock_internal(struct lockspace *ls, struct resource *r,
 			 * because RN could cover other locks */
 
 			list_del(&po->list);
+			plock_print_end_plock(ls, in->number, po);
 			free(po);
 			continue;
 
@@ -656,7 +695,9 @@ static int unlock_internal(struct lockspace *ls, struct resource *r,
 			 * update RE, then continue because RN could cover
 			 * other locks */
 
+			plock_print_end_plock(ls, in->number, po);
 			rv = shrink_range(po, in->start, in->end);
+			plock_print_start_plock(ls, in->number, po);
 			continue;
 
 		default:
@@ -1346,8 +1387,8 @@ static void _receive_sync(struct lockspace *ls, struct dlm_header *hd, int len)
 	}
 
 	if (hd->type == DLM_MSG_PLOCK_SYNC_LOCK)
-		add_lock(r, info.nodeid, info.owner, info.pid, info.ex, 
-			 info.start, info.end);
+		add_lock(ls, r, info.nodeid, info.owner, info.pid, info.ex,
+			 info.start, info.end, info.number);
 	else if (hd->type == DLM_MSG_PLOCK_SYNC_WAITER)
 		add_waiter(ls, r, &info);
 }
@@ -1857,6 +1898,7 @@ static void free_r_lists(const struct lockspace *ls, struct resource *r)
 
 	list_for_each_entry_safe(po, po2, &r->locks, list) {
 		list_del(&po->list);
+		plock_print_end_plock(ls, r->number, po);
 		free(po);
 	}
 
@@ -1972,6 +2014,7 @@ void receive_plocks_data(struct lockspace *ls, struct dlm_header *hd, int len)
 			po->pid		= le32_to_cpu(pp->pid);
 			po->nodeid	= le32_to_cpu(pp->nodeid);
 			po->ex		= pp->ex;
+			plock_print_start_plock(ls, num, po);
 			list_add_tail(&po->list, &r->locks);
 		} else {
 			w = malloc(sizeof(struct lock_waiter));
@@ -2047,6 +2090,7 @@ void purge_plocks(struct lockspace *ls, int nodeid, int unmount)
 		list_for_each_entry_safe(po, po2, &r->locks, list) {
 			if (po->nodeid == nodeid || unmount) {
 				list_del(&po->list);
+				plock_print_end_plock(ls, r->number, po);
 				free(po);
 				purged++;
 			}
-- 
2.31.1

