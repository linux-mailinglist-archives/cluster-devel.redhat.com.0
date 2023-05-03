Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1564D6F5746
	for <lists+cluster-devel@lfdr.de>; Wed,  3 May 2023 13:38:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683113925;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=v/L5ZK6qbFrQQKGL2hZQ3jGBUBah8b7IDTSUocszVc4=;
	b=U3cbm7+CgXtetoba88FrTCuKORZDqQwqKbL/7fSnGowYTjVAdn3q6eUyeOiV9tUWEncNv1
	+1khdv3i4f0Fhofw8wOXelsktCXKEJPYUA4uwu+oNWx6R3CxmC+oA0tIlzxUxVd+YucT2a
	1fZMCsfsOFOfy/tY5FsECHS5CfZ2b7M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203-oUiGHQrzP-mu0uxa7a1sYA-1; Wed, 03 May 2023 07:38:35 -0400
X-MC-Unique: oUiGHQrzP-mu0uxa7a1sYA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F0801161A61;
	Wed,  3 May 2023 11:38:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1573D492C13;
	Wed,  3 May 2023 11:38:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 778EE19466DF;
	Wed,  3 May 2023 11:38:31 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 716AC19465BB for <cluster-devel@listman.corp.redhat.com>;
 Wed,  3 May 2023 11:38:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 556C9C15BBA; Wed,  3 May 2023 11:38:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (unknown [10.45.226.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C08C3C15BAD;
 Wed,  3 May 2023 11:38:29 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed,  3 May 2023 13:38:28 +0200
Message-Id: <20230503113828.66573-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Cluster-devel] [PATCH] dlm_controld: remove old build workaround
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
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Remove the old build workaround from 2011, when DLM_PLOCK_FL_CLOSE
wasn't always defined in <linux/dlm_plock.h>.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 dlm_controld/plock.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/dlm_controld/plock.c b/dlm_controld/plock.c
index 7f632888..a91aecb0 100644
--- a/dlm_controld/plock.c
+++ b/dlm_controld/plock.c
@@ -9,15 +9,6 @@
 #include "dlm_daemon.h"
 #include <linux/dlm_plock.h>
 
-/* FIXME: remove this once everyone is using the version of
- * dlm_plock.h which defines it */
-
-#ifndef DLM_PLOCK_FL_CLOSE
-#warning DLM_PLOCK_FL_CLOSE undefined. Enabling build workaround.
-#define DLM_PLOCK_FL_CLOSE 1
-#define DLM_PLOCK_BUILD_WORKAROUND 1
-#endif
-
 static uint32_t plock_read_count;
 static uint32_t plock_recv_count;
 static uint32_t plock_rate_delays;
@@ -757,11 +748,7 @@ static void do_unlock(struct lockspace *ls, struct dlm_plock_info *in,
 
 	rv = unlock_internal(ls, r, in);
 
-#ifdef DLM_PLOCK_BUILD_WORKAROUND
-	if (in->pad & DLM_PLOCK_FL_CLOSE) {
-#else
 	if (in->flags & DLM_PLOCK_FL_CLOSE) {
-#endif
 		clear_waiters(ls, r, in);
 		/* no replies for unlock-close ops */
 		goto skip_result;
@@ -1595,13 +1582,8 @@ void process_plocks(int ci)
 	return;
 
  fail:
-#ifdef DLM_PLOCK_BUILD_WORKAROUND
-	if (!(info.pad & DLM_PLOCK_FL_CLOSE)) {
-#else
-	if (!(info.flags & DLM_PLOCK_FL_CLOSE)) {
-#endif
+	if (!(info.flags & DLM_PLOCK_FL_CLOSE))
 		write_result(&info, rv);
-	}
 }
 
 void process_saved_plocks(struct lockspace *ls)
-- 
2.40.0

