Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 53139681A54
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Jan 2023 20:25:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675106710;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rt94JUdGO18XK0n54tw7kCJsAi45SLjx2leycoa0Ww0=;
	b=JqBu4alXr6SZRahTe9GtiD5wyKdngYdKVtdIJcndril4NFaWGP8dVIdGFsuO9U1sZ0fb+h
	hkK4Ww1o9RYlB6akzC+wZX95mPPRMar7CnJEXcC88HXWSWkBfy+c/nGvIFS9cCHaN42r3H
	ziexI/Y78kPgoy9ZkjWnyYBFSLwLyLg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-4HXEBQKLO9iPYY5NS_vmSg-1; Mon, 30 Jan 2023 14:25:07 -0500
X-MC-Unique: 4HXEBQKLO9iPYY5NS_vmSg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFCB1801779;
	Mon, 30 Jan 2023 19:25:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E312F422AE;
	Mon, 30 Jan 2023 19:25:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B7DF61946594;
	Mon, 30 Jan 2023 19:25:05 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1E23A1946587 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 30 Jan 2023 19:24:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 12DF0422F2; Mon, 30 Jan 2023 19:24:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E1FAF175AD;
 Mon, 30 Jan 2023 19:24:44 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 30 Jan 2023 14:24:35 -0500
Message-Id: <20230130192437.3330300-6-aahringo@redhat.com>
In-Reply-To: <20230130192437.3330300-1-aahringo@redhat.com>
References: <20230130192437.3330300-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Cluster-devel] [PATCH dlm-tool 6/8] dlm_controld: log
 lock/pending/waiter state changes
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch will trace lock state changes of the used dlm posix locks. In
combination with the plock logfile we can see state changes over time
and follow posix locks and their state.
---
 dlm_controld/dlm_daemon.h |   2 +-
 dlm_controld/logging.c    |   2 +-
 dlm_controld/plock.c      | 124 +++++++++++++++++++++++++++++---------
 3 files changed, 97 insertions(+), 31 deletions(-)

diff --git a/dlm_controld/dlm_daemon.h b/dlm_controld/dlm_daemon.h
index c74f684a..9bf3f621 100644
--- a/dlm_controld/dlm_daemon.h
+++ b/dlm_controld/dlm_daemon.h
@@ -220,7 +220,7 @@ EXTERN struct list_head run_ops;
 #define LOG_PLOCK 0x00010000
 #define LOG_NONE  0x00001111
 
-void log_level(char *name_in, uint32_t level_in, const char *fmt, ...);
+void log_level(const char *name_in, uint32_t level_in, const char *fmt, ...);
 
 #define log_error(fmt, args...) log_level(NULL, LOG_ERR, fmt, ##args)
 #define log_debug(fmt, args...) log_level(NULL, LOG_DEBUG, fmt, ##args)
diff --git a/dlm_controld/logging.c b/dlm_controld/logging.c
index 83de2da4..e71fe52c 100644
--- a/dlm_controld/logging.c
+++ b/dlm_controld/logging.c
@@ -175,7 +175,7 @@ static void log_str_to_file(FILE *fp)
 	fflush(fp);
 }
 
-void log_level(char *name_in, uint32_t level_in, const char *fmt, ...)
+void log_level(const char *name_in, uint32_t level_in, const char *fmt, ...)
 {
 	va_list ap;
 	char name[NAME_ID_SIZE + 2];
diff --git a/dlm_controld/plock.c b/dlm_controld/plock.c
index 462c9212..77c043fd 100644
--- a/dlm_controld/plock.c
+++ b/dlm_controld/plock.c
@@ -208,6 +208,62 @@ static uint64_t dt_usec(struct timeval *start, struct timeval *stop)
 	return dt;
 }
 
+static void plock_print_lock_add_state(const struct lockspace *ls,
+				       const struct lock_waiter *w,
+				       const char *state)
+{
+	log_dlock(ls, "state: add %s %llx %llx-%llx %d/%u/%llx",
+		  state,
+		  (unsigned long long)w->info.number,
+		  (unsigned long long)w->info.start,
+		  (unsigned long long)w->info.end,
+		  w->info.nodeid, w->info.pid,
+		  (unsigned long long)w->info.owner);
+}
+
+static void plock_print_lock_clear_state(const struct lockspace *ls,
+					 const struct lock_waiter *w,
+					 const char *state)
+{
+	log_dlock(ls, "state: clear %s %llx %llx-%llx %d/%u/%llx",
+		  state,
+		  (unsigned long long)w->info.number,
+		  (unsigned long long)w->info.start,
+		  (unsigned long long)w->info.end,
+		  w->info.nodeid, w->info.pid,
+		  (unsigned long long)w->info.owner);
+}
+
+#define plock_print_add_waiter(ls, w) \
+	plock_print_lock_add_state(ls, w, "waiter")
+#define plock_print_clear_waiter(ls, w) \
+	plock_print_lock_clear_state(ls, w, "waiter")
+
+#define plock_print_add_pending(ls, w) \
+	plock_print_lock_add_state(ls, w, "pending")
+#define plock_print_clear_pending(ls, w) \
+	plock_print_lock_clear_state(ls, w, "pending")
+
+static void plock_print_add_plock(const struct lockspace *ls,
+				  const struct posix_lock *plock)
+{
+	log_dlock(ls, "state: add plock NA %llx-%llx %d/%u/%llx",
+		  (unsigned long long)plock->start,
+		  (unsigned long long)plock->end,
+		  plock->nodeid, plock->pid,
+		  (unsigned long long)plock->owner);
+}
+
+static void plock_print_del_plock(const struct lockspace *ls,
+				  const struct posix_lock *plock)
+{
+	log_dlock(ls, "state: del plock NA %llx-%llx %d/%u/%llx",
+		  (unsigned long long)plock->start,
+		  (unsigned long long)plock->end,
+		  plock->nodeid, plock->pid,
+		  (unsigned long long)plock->owner);
+}
+
 static struct resource * rb_search_plock_resource(struct lockspace *ls, uint64_t number)
 {
 	struct rb_node *n = ls->plock_resources_root.rb_node;
@@ -447,8 +503,9 @@ static int is_conflict(struct resource *r, struct dlm_plock_info *in, int get)
 	return 0;
 }
 
-static int add_lock(struct resource *r, uint32_t nodeid, uint64_t owner,
-		    uint32_t pid, int ex, uint64_t start, uint64_t end)
+static int add_lock(const struct lockspace *ls, struct resource *r,
+		    uint32_t nodeid, uint64_t owner, uint32_t pid,
+		    int ex, uint64_t start, uint64_t end)
 {
 	struct posix_lock *po;
 
@@ -464,6 +521,7 @@ static int add_lock(struct resource *r, uint32_t nodeid, uint64_t owner,
 	po->pid = pid;
 	po->ex = ex;
 	list_add_tail(&po->list, &r->locks);
+	plock_print_add_plock(ls, po);
 
 	return 0;
 }
@@ -472,8 +530,8 @@ static int add_lock(struct resource *r, uint32_t nodeid, uint64_t owner,
    1. add new lock for non-overlap area of RE, orig mode
    2. convert RE to RN range and mode */
 
-static int lock_case1(struct posix_lock *po, struct resource *r,
-		      struct dlm_plock_info *in)
+static int lock_case1(const struct lockspace *ls, struct posix_lock *po,
+		      struct resource *r, struct dlm_plock_info *in)
 {
 	uint64_t start2, end2;
 	int rv;
@@ -489,7 +547,7 @@ static int lock_case1(struct posix_lock *po, struct resource *r,
 	po->end = in->end;
 	po->ex = in->ex;
 
-	rv = add_lock(r, in->nodeid, in->owner, in->pid, !in->ex, start2, end2);
+	rv = add_lock(ls, r, in->nodeid, in->owner, in->pid, !in->ex, start2, end2);
  out:
 	return rv;
 }
@@ -499,18 +557,18 @@ static int lock_case1(struct posix_lock *po, struct resource *r,
    2. add new lock for back fragment, orig mode
    3. convert RE to RN range and mode */
 			 
-static int lock_case2(struct posix_lock *po, struct resource *r,
-		      struct dlm_plock_info *in)
+static int lock_case2(const struct lockspace *ls, struct posix_lock *po,
+		      struct resource *r, struct dlm_plock_info *in)
 
 {
 	int rv;
 
-	rv = add_lock(r, in->nodeid, in->owner, in->pid,
+	rv = add_lock(ls, r, in->nodeid, in->owner, in->pid,
 		      !in->ex, po->start, in->start - 1);
 	if (rv)
 		goto out;
 
-	rv = add_lock(r, in->nodeid, in->owner, in->pid,
+	rv = add_lock(ls, r, in->nodeid, in->owner, in->pid,
 		      !in->ex, in->end + 1, po->end);
 	if (rv)
 		goto out;
@@ -522,7 +580,7 @@ static int lock_case2(struct posix_lock *po, struct resource *r,
 	return rv;
 }
 
-static int lock_internal(struct lockspace *ls, struct resource *r,
+static int lock_internal(const struct lockspace *ls, struct resource *r,
 			 struct dlm_plock_info *in)
 {
 	struct posix_lock *po, *safe;
@@ -550,18 +608,19 @@ static int lock_internal(struct lockspace *ls, struct resource *r,
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
 			list_del(&po->list);
+			plock_print_del_plock(ls, po);
 			free(po);
 			break;
 
@@ -578,14 +637,14 @@ static int lock_internal(struct lockspace *ls, struct resource *r,
 		}
 	}
 
-	rv = add_lock(r, in->nodeid, in->owner, in->pid,
+	rv = add_lock(ls, r, in->nodeid, in->owner, in->pid,
 		      in->ex, in->start, in->end);
  out:
 	return rv;
 
 }
 
-static int unlock_internal(struct lockspace *ls, struct resource *r,
+static int unlock_internal(const struct lockspace *ls, struct resource *r,
 			   struct dlm_plock_info *in)
 {
 	struct posix_lock *po, *safe;
@@ -605,6 +664,7 @@ static int unlock_internal(struct lockspace *ls, struct resource *r,
 			/* ranges the same - just remove the existing lock */
 
 			list_del(&po->list);
+			plock_print_del_plock(ls, po);
 			free(po);
 			goto out;
 
@@ -619,7 +679,7 @@ static int unlock_internal(struct lockspace *ls, struct resource *r,
 			/* RN within RE - shrink and update RE to be front
 			 * fragment, and add a new lock for back fragment */
 
-			rv = add_lock(r, in->nodeid, in->owner, in->pid,
+			rv = add_lock(ls, r, in->nodeid, in->owner, in->pid,
 				      po->ex, in->end + 1, po->end);
 			po->end = in->start - 1;
 			goto out;
@@ -629,6 +689,7 @@ static int unlock_internal(struct lockspace *ls, struct resource *r,
 			 * because RN could cover other locks */
 
 			list_del(&po->list);
+			plock_print_del_plock(ls, po);
 			free(po);
 			continue;
 
@@ -649,7 +710,7 @@ static int unlock_internal(struct lockspace *ls, struct resource *r,
 	return rv;
 }
 
-static void clear_waiters(struct lockspace *ls, struct resource *r,
+static void clear_waiters(const struct lockspace *ls, struct resource *r,
 			  struct dlm_plock_info *in)
 {
 	struct lock_waiter *w, *safe;
@@ -659,18 +720,12 @@ static void clear_waiters(struct lockspace *ls, struct resource *r,
 			continue;
 
 		list_del(&w->list);
-
-		log_dlock(ls, "clear waiter %llx %llx-%llx %d/%u/%llx",
-			  (unsigned long long)in->number,
-			  (unsigned long long)in->start,
-			  (unsigned long long)in->end,
-			  in->nodeid, in->pid,
-			  (unsigned long long)in->owner);
+		plock_print_clear_waiter(ls, w);
 		free(w);
 	}
 }
 
-static int add_waiter(struct lockspace *ls, struct resource *r,
+static int add_waiter(const struct lockspace *ls, struct resource *r,
 		      struct dlm_plock_info *in)
 
 {
@@ -681,6 +736,7 @@ static int add_waiter(struct lockspace *ls, struct resource *r,
 		return -ENOMEM;
 	memcpy(&w->info, in, sizeof(struct dlm_plock_info));
 	list_add_tail(&w->list, &r->waiters);
+	plock_print_add_waiter(ls, w);
 	return 0;
 }
 
@@ -695,7 +751,7 @@ static void write_result(struct dlm_plock_info *in, int rv)
 			  errno, plock_device_fd);
 }
 
-static void do_waiters(struct lockspace *ls, struct resource *r)
+static void do_waiters(const struct lockspace *ls, struct resource *r)
 {
 	struct lock_waiter *w, *safe;
 	struct dlm_plock_info *in;
@@ -708,6 +764,7 @@ static void do_waiters(struct lockspace *ls, struct resource *r)
 			continue;
 
 		list_del(&w->list);
+		plock_print_clear_waiter(ls, w);
 
 		/*
 		log_group(ls, "take waiter %llx %llx-%llx %d/%u/%llx",
@@ -1096,6 +1153,7 @@ static void save_pending_plock(struct lockspace *ls, struct resource *r,
 	}
 	memcpy(&w->info, in, sizeof(struct dlm_plock_info));
 	list_add_tail(&w->list, &r->pending);
+	plock_print_add_pending(ls, w);
 }
 
 /* plock ops are on pending list waiting for ownership to be established.
@@ -1108,6 +1166,7 @@ static void add_pending_plocks(struct lockspace *ls, struct resource *r)
 	list_for_each_entry_safe(w, safe, &r->pending, list) {
 		__receive_plock(ls, &w->info, our_nodeid, r);
 		list_del(&w->list);
+		plock_print_clear_pending(ls, w);
 		free(w);
 	}
 }
@@ -1122,6 +1181,7 @@ static void send_pending_plocks(struct lockspace *ls, struct resource *r)
 	list_for_each_entry_safe(w, safe, &r->pending, list) {
 		send_plock(ls, r, &w->info);
 		list_del(&w->list);
+		plock_print_clear_pending(ls, w);
 		free(w);
 	}
 }
@@ -1331,7 +1391,7 @@ static void _receive_sync(struct lockspace *ls, struct dlm_header *hd, int len)
 	}
 
 	if (hd->type == DLM_MSG_PLOCK_SYNC_LOCK)
-		add_lock(r, info.nodeid, info.owner, info.pid, info.ex, 
+		add_lock(ls, r, info.nodeid, info.owner, info.pid, info.ex,
 			 info.start, info.end);
 	else if (hd->type == DLM_MSG_PLOCK_SYNC_WAITER)
 		add_waiter(ls, r, &info);
@@ -1836,18 +1896,20 @@ void send_all_plocks_data(struct lockspace *ls, uint32_t seq, uint32_t *plocks_d
 		  our_nodeid, seq, send_count);
 }
 
-static void free_r_lists(struct resource *r)
+static void free_r_lists(const struct lockspace *ls, struct resource *r)
 {
 	struct posix_lock *po, *po2;
 	struct lock_waiter *w, *w2;
 
 	list_for_each_entry_safe(po, po2, &r->locks, list) {
 		list_del(&po->list);
+		plock_print_del_plock(ls, po);
 		free(po);
 	}
 
 	list_for_each_entry_safe(w, w2, &r->waiters, list) {
 		list_del(&w->list);
+		plock_print_clear_waiter(ls, w);
 		free(w);
 	}
 }
@@ -1957,6 +2019,7 @@ void receive_plocks_data(struct lockspace *ls, struct dlm_header *hd, int len)
 			po->nodeid	= le32_to_cpu(pp->nodeid);
 			po->ex		= pp->ex;
 			list_add_tail(&po->list, &r->locks);
+			plock_print_add_plock(ls, po);
 		} else {
 			w = malloc(sizeof(struct lock_waiter));
 			if (!w)
@@ -1968,6 +2031,7 @@ void receive_plocks_data(struct lockspace *ls, struct dlm_header *hd, int len)
 			w->info.nodeid	= le32_to_cpu(pp->nodeid);
 			w->info.ex	= pp->ex;
 			list_add_tail(&w->list, &r->waiters);
+			plock_print_add_waiter(ls, w);
 		}
 		pp++;
 	}
@@ -1984,7 +2048,7 @@ void receive_plocks_data(struct lockspace *ls, struct dlm_header *hd, int len)
 
  fail_free:
 	if (!(flags & RD_CONTINUE)) {
-		free_r_lists(r);
+		free_r_lists(ls, r);
 		free(r);
 	}
 	return;
@@ -1999,7 +2063,7 @@ void clear_plocks_data(struct lockspace *ls)
 		return;
 
 	list_for_each_entry_safe(r, r2, &ls->plock_resources, list) {
-		free_r_lists(r);
+		free_r_lists(ls, r);
 		rb_del_plock_resource(ls, r);
 		list_del(&r->list);
 		free(r);
@@ -2030,6 +2094,7 @@ void purge_plocks(struct lockspace *ls, int nodeid, int unmount)
 		list_for_each_entry_safe(po, po2, &r->locks, list) {
 			if (po->nodeid == nodeid || unmount) {
 				list_del(&po->list);
+				plock_print_del_plock(ls, po);
 				free(po);
 				purged++;
 			}
@@ -2038,6 +2103,7 @@ void purge_plocks(struct lockspace *ls, int nodeid, int unmount)
 		list_for_each_entry_safe(w, w2, &r->waiters, list) {
 			if (w->info.nodeid == nodeid || unmount) {
 				list_del(&w->list);
+				plock_print_clear_waiter(ls, w);
 				free(w);
 				purged++;
 			}
-- 
2.31.1

