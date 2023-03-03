Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7EE6A9B38
	for <lists+cluster-devel@lfdr.de>; Fri,  3 Mar 2023 16:53:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677858785;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3SeMHXZGb18KaAp1uQsXGKJN/uXZUwa0Ant84gyxctk=;
	b=QfgSdNj2dhAySv8YyWVuCMF6dNraOGCBUqE3wGuebaW45+OgtJO4K1louLMDzDhLF/dT8W
	91CQjj7ODRRHFXQ9Mv+Fj2DZDhBuKlepPJWbq+H9wAzqES/CNXydGEKPzm+NT3WGu+fX52
	Yxb/Mk2WdVx8sKuNO+Zm0BvW1AZ0OBE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-yAGKsUAGPMqlsImdq5yU9Q-1; Fri, 03 Mar 2023 10:53:01 -0500
X-MC-Unique: yAGKsUAGPMqlsImdq5yU9Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 466071C1298D;
	Fri,  3 Mar 2023 15:53:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8468A2026D4B;
	Fri,  3 Mar 2023 15:52:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 429C219452D0;
	Fri,  3 Mar 2023 15:52:59 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0529219465A0 for <cluster-devel@listman.corp.redhat.com>;
 Fri,  3 Mar 2023 15:52:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C9E4A440DF; Fri,  3 Mar 2023 15:52:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (unknown [10.45.225.233])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FB3B440DE;
 Fri,  3 Mar 2023 15:52:56 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Alexander Aring <aahringo@redhat.com>
Date: Fri,  3 Mar 2023 16:52:55 +0100
Message-Id: <20230303155255.807862-1-agruenba@redhat.com>
In-Reply-To: <CAK-6q+gmTae=5xj5Noomy=aVRfwAQgD1C2WJ1=TYEjPWA76cMw@mail.gmail.com>
References: <CAK-6q+gmTae=5xj5Noomy=aVRfwAQgD1C2WJ1=TYEjPWA76cMw@mail.gmail.com>
 <20230302171441.1509914-13-aahringo@redhat.com>
 <20230303133845.801743-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Now, let me get to the core of the matter.  We've been talking about
using user-space (SDT) trace points for collecting the data, and I still
think that that's what we should do instead of introducing a new
dlm_controld log file.  In the dlm_controld code, this would look like
the below patch.

Note that <sys/sdt.h> is part of the systemtap-sdt-devel package, so a
"BuildRequires: systemtap-sdt-devel" dependency will be needed in
dlm.spec.

With that, we can use standard tools like perf, bpftrace, etc. for
collecting all the relevant information without any further
modifications to dlm_controld.  We can also collect additional kernel
and user-space trace point data at the same time with very little
additional effort.

For example, here is how to register the four plock dlm_controld trace
points in perf:

  for ev in \
      sdt_dlm_controld:plock_lock_begin \
      sdt_dlm_controld:plock_lock_end \
      sdt_dlm_controld:plock_wait_begin \
      sdt_dlm_controld:plock_wait_end; do \
    perf probe -x /usr/sbin/dlm_controld $ev; \
  done

The events can then be recorded with "perf record":

  perf record \
    -e sdt_dlm_controld:plock_lock_begin \
    -e sdt_dlm_controld:plock_lock_end \
    -e sdt_dlm_controld:plock_wait_begin \
    -e sdt_dlm_controld:plock_wait_end \
    [...]

We've already gone through how the resulting log can be processed with
"perf script".  One possible result would be the log file format that
lockdb_plot expects, but there are countless other possibilities.

Other useful "tricks":

  $ bpftrace -l 'usdt:/usr/sbin/dlm_controld:*'

  $ readelf -n /usr/sbin/dlm_controld | sed -ne '/\.note\.stapsdt/,/^$/p'


Thanks,
Andreas

-- 
 dlm_controld/plock.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/dlm_controld/plock.c b/dlm_controld/plock.c
index 39bdd1f6..588bcaaa 100644
--- a/dlm_controld/plock.c
+++ b/dlm_controld/plock.c
@@ -8,6 +8,7 @@
 
 #include "dlm_daemon.h"
 #include <linux/dlm_plock.h>
+#include <sys/sdt.h>
 
 /* FIXME: remove this once everyone is using the version of
  * dlm_plock.h which defines it */
@@ -211,6 +212,11 @@ static uint64_t dt_usec(const struct timeval *start, const struct timeval *stop)
 static void plock_print_start_waiter(const struct lockspace *ls,
 				     struct lock_waiter *w)
 {
+	const struct dlm_plock_info *info = &w->info;
+
+	DTRACE_PROBE7(dlm_controld, plock_wait_begin, info->number, w, info->start,
+		      info->end, info->nodeid, info->pid, info->owner);
+
 	log_plock(ls, "state waiter start %llx %p %llx-%llx %d/%u/%llx",
 		  (unsigned long long)w->info.number,
 		  w,
@@ -223,6 +229,10 @@ static void plock_print_start_waiter(const struct lockspace *ls,
 static void plock_print_end_waiter(const struct lockspace *ls,
 				   const struct lock_waiter *w)
 {
+	const struct dlm_plock_info *info = &w->info;
+
+	DTRACE_PROBE2(dlm_controld, plock_wait_end, info->number, w);
+
 	log_plock(ls, "state waiter end %llx %p",
 		  (unsigned long long)w->info.number, w);
 }
@@ -230,6 +240,9 @@ static void plock_print_end_waiter(const struct lockspace *ls,
 static void plock_print_start_plock(const struct lockspace *ls, uint64_t number,
 				    const struct posix_lock *po)
 {
+	DTRACE_PROBE8(dlm_controld, plock_lock_begin, number, po, po->ex, po->start,
+		      po->end, po->nodeid, po->pid, po->owner);
+
 	log_plock(ls, "state plock start %llx %p %s %llx-%llx %d/%u/%llx",
 		  (unsigned long long)number,
 		  po,
@@ -243,6 +256,8 @@ static void plock_print_start_plock(const struct lockspace *ls, uint64_t number,
 static void plock_print_end_plock(const struct lockspace *ls, uint64_t number,
 				  const struct posix_lock *po)
 {
+	DTRACE_PROBE1(dlm_controld, pock_lock_end, po);
+
 	log_plock(ls, "state plock end %llx %p",
 		  (unsigned long long)number, po);
 }
-- 
2.39.0

