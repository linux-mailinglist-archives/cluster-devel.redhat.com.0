Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F0D6A87A5
	for <lists+cluster-devel@lfdr.de>; Thu,  2 Mar 2023 18:15:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677777318;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=17lrCxJ0JcqDeWfQxhCxCAVfDCbj4oV83HrUfgNB9ik=;
	b=TsCvp+o3ZlQZ9C0oSXLTKMcybWup/YTt8LumWDHYVlCFhmG3/t1IMtdSHm6KawaBxjT0Ax
	HHqz8pHaCNiUyUGi5D4M2DSbH093IZbhg+bZ8SOEhYCmA81ptWG5uy65tJ7PN9qUEjmM0x
	cdqRpWadCqldefdjJsGr5pwtRERRNBo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-347-sznzUI-9P-uxOcIQhdgj7w-1; Thu, 02 Mar 2023 12:15:14 -0500
X-MC-Unique: sznzUI-9P-uxOcIQhdgj7w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 36DAD18A6462;
	Thu,  2 Mar 2023 17:15:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2ADCE140EBF6;
	Thu,  2 Mar 2023 17:15:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 80AE01943BE0;
	Thu,  2 Mar 2023 17:15:10 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1EFF01948642 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  2 Mar 2023 17:15:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B7399492B15; Thu,  2 Mar 2023 17:14:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 934ED492B00;
 Thu,  2 Mar 2023 17:14:56 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu,  2 Mar 2023 12:14:39 -0500
Message-Id: <20230302171441.1509914-12-aahringo@redhat.com>
In-Reply-To: <20230302171441.1509914-1-aahringo@redhat.com>
References: <20230302171441.1509914-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [Cluster-devel] [PATCH dlm-tool 12/14] dlm_controld: plock log
 waiters state
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch adds additional log_plock() calls to track the start and end
of waiter states inside the dlm_controld lock database. With this
information we know when a specific lock had contention in view of
dlm_controld cluster-wide plock view.
---
 dlm_controld/plock.c | 38 ++++++++++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/dlm_controld/plock.c b/dlm_controld/plock.c
index 24ad777a..b93863f7 100644
--- a/dlm_controld/plock.c
+++ b/dlm_controld/plock.c
@@ -208,6 +208,25 @@ static uint64_t dt_usec(const struct timeval *start, const struct timeval *stop)
 	return dt;
 }
 
+static void plock_print_start_waiter(const struct lockspace *ls,
+				     struct lock_waiter *w)
+{
+	log_plock(ls, "state waiter start %llx %p %llx-%llx %d/%u/%llx",
+		  (unsigned long long)w->info.number,
+		  w,
+		  (unsigned long long)w->info.start,
+		  (unsigned long long)w->info.end,
+		  w->info.nodeid, w->info.pid,
+		  (unsigned long long)w->info.owner);
+}
+
+static void plock_print_end_waiter(const struct lockspace *ls,
+				   const struct lock_waiter *w)
+{
+	log_plock(ls, "state waiter end %llx %p",
+		  (unsigned long long)w->info.number, w);
+}
+
 static struct resource * rb_search_plock_resource(struct lockspace *ls, uint64_t number)
 {
 	struct rb_node *n = ls->plock_resources_root.rb_node;
@@ -659,13 +678,7 @@ static void clear_waiters(struct lockspace *ls, struct resource *r,
 			continue;
 
 		list_del(&w->list);
-
-		log_dlock(ls, "clear waiter %llx %llx-%llx %d/%u/%llx",
-			  (unsigned long long)in->number,
-			  (unsigned long long)in->start,
-			  (unsigned long long)in->end,
-			  in->nodeid, in->pid,
-			  (unsigned long long)in->owner);
+		plock_print_end_waiter(ls, w);
 		free(w);
 	}
 }
@@ -680,6 +693,7 @@ static int add_waiter(struct lockspace *ls, struct resource *r,
 	if (!w)
 		return -ENOMEM;
 	memcpy(&w->info, in, sizeof(struct dlm_plock_info));
+	plock_print_start_waiter(ls, w);
 	list_add_tail(&w->list, &r->waiters);
 	return 0;
 }
@@ -708,6 +722,7 @@ static void do_waiters(struct lockspace *ls, struct resource *r)
 			continue;
 
 		list_del(&w->list);
+		plock_print_end_waiter(ls, w);
 
 		/*
 		log_group(ls, "take waiter %llx %llx-%llx %d/%u/%llx",
@@ -1835,7 +1850,7 @@ void send_all_plocks_data(struct lockspace *ls, uint32_t seq, uint32_t *plocks_d
 		  our_nodeid, seq, send_count);
 }
 
-static void free_r_lists(struct resource *r)
+static void free_r_lists(const struct lockspace *ls, struct resource *r)
 {
 	struct posix_lock *po, *po2;
 	struct lock_waiter *w, *w2;
@@ -1847,6 +1862,7 @@ static void free_r_lists(struct resource *r)
 
 	list_for_each_entry_safe(w, w2, &r->waiters, list) {
 		list_del(&w->list);
+		plock_print_end_waiter(ls, w);
 		free(w);
 	}
 }
@@ -1967,6 +1983,7 @@ void receive_plocks_data(struct lockspace *ls, struct dlm_header *hd, int len)
 			w->info.pid	= le32_to_cpu(pp->pid);
 			w->info.nodeid	= le32_to_cpu(pp->nodeid);
 			w->info.ex	= pp->ex;
+			plock_print_start_waiter(ls, w);
 			list_add_tail(&w->list, &r->waiters);
 		}
 		pp++;
@@ -1984,7 +2001,7 @@ void receive_plocks_data(struct lockspace *ls, struct dlm_header *hd, int len)
 
  fail_free:
 	if (!(flags & RD_CONTINUE)) {
-		free_r_lists(r);
+		free_r_lists(ls, r);
 		free(r);
 	}
 	return;
@@ -1999,7 +2016,7 @@ void clear_plocks_data(struct lockspace *ls)
 		return;
 
 	list_for_each_entry_safe(r, r2, &ls->plock_resources, list) {
-		free_r_lists(r);
+		free_r_lists(ls, r);
 		rb_del_plock_resource(ls, r);
 		list_del(&r->list);
 		free(r);
@@ -2038,6 +2055,7 @@ void purge_plocks(struct lockspace *ls, int nodeid, int unmount)
 		list_for_each_entry_safe(w, w2, &r->waiters, list) {
 			if (w->info.nodeid == nodeid || unmount) {
 				list_del(&w->list);
+				plock_print_end_waiter(ls, w);
 				free(w);
 				purged++;
 			}
-- 
2.31.1

