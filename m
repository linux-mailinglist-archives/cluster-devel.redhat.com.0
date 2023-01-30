Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 25174681A63
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Jan 2023 20:25:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675106753;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2Jy6h8ZQB0jIKV0mx/wioMVMXgHBrpyun3x2JyOriwc=;
	b=Hq+LijjeK+CI361n5wNCtfvD5Iq8t/Sa3ev+/WXgJS9zeGXd7U3GUZO+5JjY92+WsVFmXr
	y7SSQwLwf2tq2ShgAl7fnHV8aX5cWMs1gu9UKlBBhewG3/D888HtAZbiaePHubrewIle6m
	pK7ruCrHpplEAPk6OiL5kvJJUQH66Pw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-240-4W8rTnIEO5eSgXMRbOVk4A-1; Mon, 30 Jan 2023 14:25:49 -0500
X-MC-Unique: 4W8rTnIEO5eSgXMRbOVk4A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C201801779;
	Mon, 30 Jan 2023 19:25:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 21AB940AE1EA;
	Mon, 30 Jan 2023 19:25:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EB9F719465B2;
	Mon, 30 Jan 2023 19:25:47 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 73EE31946587 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 30 Jan 2023 19:24:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 66A2F422FE; Mon, 30 Jan 2023 19:24:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41459175AD;
 Mon, 30 Jan 2023 19:24:45 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 30 Jan 2023 14:24:37 -0500
Message-Id: <20230130192437.3330300-8-aahringo@redhat.com>
In-Reply-To: <20230130192437.3330300-1-aahringo@redhat.com>
References: <20230130192437.3330300-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Cluster-devel] [PATCH dlm-tool 8/8] dlm_controld: add time diff
 for state time intervals
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch adds functionality to see how long a posix lock is alive or
is in waiting or pending state. It can be used to filter out interesting
locks which are stuck in e.g. waiting state to know that a user space
process probably has contention on it. The logging information will
printout additional lock information to do more search and find to get
more information about it's corosync or kernel communication.
---
 dlm_controld/plock.c | 48 ++++++++++++++++++++++++++++++--------------
 1 file changed, 33 insertions(+), 15 deletions(-)

diff --git a/dlm_controld/plock.c b/dlm_controld/plock.c
index d83a79d2..20c2a1e9 100644
--- a/dlm_controld/plock.c
+++ b/dlm_controld/plock.c
@@ -72,6 +72,7 @@ struct resource {
 
 struct posix_lock {
 	struct list_head	list;	   /* resource locks or waiters list */
+	struct timeval		list_time;
 	uint32_t		pid;
 	uint64_t		owner;
 	uint64_t		start;
@@ -83,6 +84,7 @@ struct posix_lock {
 
 struct lock_waiter {
 	struct list_head	list;
+	struct timeval		list_time;
 	uint32_t		flags;
 	struct dlm_plock_info	info;
 };
@@ -209,9 +211,11 @@ static uint64_t dt_usec(const struct timeval *start, const struct timeval *stop)
 }
 
 static void plock_print_lock_add_state(const struct lockspace *ls,
-				       const struct lock_waiter *w,
+				       struct lock_waiter *w,
 				       const char *state)
 {
+	gettimeofday(&w->list_time, NULL);
+
 	log_dlock(ls, "state: add %s %llx %llx-%llx %d/%u/%llx",
 		  state,
 		  (unsigned long long)w->info.number,
@@ -225,13 +229,20 @@ static void plock_print_lock_clear_state(const struct lockspace *ls,
 					 const struct lock_waiter *w,
 					 const char *state)
 {
-	log_dlock(ls, "state: clear %s %llx %llx-%llx %d/%u/%llx",
+	struct timeval now;
+	uint64_t usec;
+
+	gettimeofday(&now, NULL);
+	usec = dt_usec(&w->list_time, &now);
+
+	log_dlock(ls, "state: clear %s %llx %llx-%llx %d/%u/%llx %.3f",
 		  state,
 		  (unsigned long long)w->info.number,
 		  (unsigned long long)w->info.start,
 		  (unsigned long long)w->info.end,
 		  w->info.nodeid, w->info.pid,
-		  (unsigned long long)w->info.owner);
+		  (unsigned long long)w->info.owner,
+		  usec * 1.e-6);
 }
 
 #define plock_print_add_waiter(ls, w) \
@@ -245,23 +256,30 @@ static void plock_print_lock_clear_state(const struct lockspace *ls,
 	plock_print_lock_clear_state(ls, w, "pending")
 
 static void plock_print_add_plock(const struct lockspace *ls,
-				  const struct posix_lock *plock)
+				  struct posix_lock *po)
 {
-	log_dlock(ls, "state: add plock NA %llx-%llx %d/%u/%llx",
-		  (unsigned long long)plock->start,
-		  (unsigned long long)plock->end,
-		  plock->nodeid, plock->pid,
-		  (unsigned long long)plock->owner);
+	gettimeofday(&po->list_time, NULL);
+	log_dlock(ls, "state: add plock %llx-%llx %d/%u/%llx %.3f",
+		  (unsigned long long)po->start,
+		  (unsigned long long)po->end,
+		  po->nodeid, po->pid,
+		  (unsigned long long)po->owner);
 }
 
 static void plock_print_del_plock(const struct lockspace *ls,
-				  const struct posix_lock *plock)
+				  const struct posix_lock *po)
 {
-	log_dlock(ls, "state: del plock NA %llx-%llx %d/%u/%llx",
-		  (unsigned long long)plock->start,
-		  (unsigned long long)plock->end,
-		  plock->nodeid, plock->pid,
-		  (unsigned long long)plock->owner);
+	struct timeval now;
+	uint64_t usec;
+
+	gettimeofday(&now, NULL);
+	usec = dt_usec(&po->list_time, &now);
+	log_dlock(ls, "state: clear plock %llx-%llx %d/%u/%llx %.3f",
+		  (unsigned long long)po->start,
+		  (unsigned long long)po->end,
+		  po->nodeid, po->pid,
+		  (unsigned long long)po->owner,
+		  usec * 1.e-6);
 }
 
 static struct resource * rb_search_plock_resource(struct lockspace *ls, uint64_t number)
-- 
2.31.1

