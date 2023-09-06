Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BABD793EDF
	for <lists+cluster-devel@lfdr.de>; Wed,  6 Sep 2023 16:32:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694010761;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LGn36CumLyZ/pWxBTXcgAiiU2VGOtj4pNjSFZ+aG8SI=;
	b=Q9G+qZMRDqaEcZH+fp4iKI7UnwBu5acF73vmWSE+Ps0wTYY9rRIZcOIaRBM60fBYTETDh5
	Xul7iot3cybY58o8eosNSpKo8ZIoWsLiySXWId4rky1BK/xGLjvI0PuW8hV/hRMeL+oH/m
	xZSxl8io9vGSVU7Spy05pr1K8QhfquI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-601-qf_88uESOfWSAh38QuwKPw-1; Wed, 06 Sep 2023 10:32:38 -0400
X-MC-Unique: qf_88uESOfWSAh38QuwKPw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E1BA87728E;
	Wed,  6 Sep 2023 14:32:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 72148C03296;
	Wed,  6 Sep 2023 14:32:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1519C1946A42;
	Wed,  6 Sep 2023 14:32:37 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9DBAE194658C for <cluster-devel@listman.corp.redhat.com>;
 Wed,  6 Sep 2023 14:32:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8F7D5140E967; Wed,  6 Sep 2023 14:32:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 613A8140E950;
 Wed,  6 Sep 2023 14:32:33 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed,  6 Sep 2023 10:31:52 -0400
Message-Id: <20230906143153.1353077-5-aahringo@redhat.com>
In-Reply-To: <20230906143153.1353077-1-aahringo@redhat.com>
References: <20230906143153.1353077-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCH dlm/next 5/6] dlm: fix string may be
 truncated
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
Cc: cluster-devel@redhat.com, gfs2@lists.linux.dev, stable@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch is fixing the following compiler warning when compiling with
-Wformat-truncation:

fs/dlm/debug_fs.c:1031:50: warning: '_queued_asts' directive output may
be truncated writing 12 bytes into a region of size between 8 and 72

We simple increase the additional amount of bytes to 13 because
_queued_asts does not fit into 8 bytes when the whole lockspace name
length is being used.

Fixes: 541adb0d4d10 ("fs: dlm: debugfs for queued callbacks")
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/debug_fs.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/fs/dlm/debug_fs.c b/fs/dlm/debug_fs.c
index 5aabcb6f0f15..698d6b7a20f8 100644
--- a/fs/dlm/debug_fs.c
+++ b/fs/dlm/debug_fs.c
@@ -20,6 +20,7 @@
 #include "lock.h"
 #include "ast.h"
 
+#define DLM_DEBUG_NAME_LEN (DLM_LOCKSPACE_LEN + 13)
 #define DLM_DEBUG_BUF_LEN 4096
 static char debug_buf[DLM_DEBUG_BUF_LEN];
 static struct mutex debug_buf_lock;
@@ -973,7 +974,7 @@ void dlm_delete_debug_comms_file(void *ctx)
 
 void dlm_create_debug_file(struct dlm_ls *ls)
 {
-	char name[DLM_LOCKSPACE_LEN + 8];
+	char name[DLM_DEBUG_NAME_LEN];
 
 	/* format 1 */
 
@@ -986,7 +987,7 @@ void dlm_create_debug_file(struct dlm_ls *ls)
 	/* format 2 */
 
 	memset(name, 0, sizeof(name));
-	snprintf(name, DLM_LOCKSPACE_LEN + 8, "%s_locks", ls->ls_name);
+	snprintf(name, DLM_DEBUG_NAME_LEN, "%s_locks", ls->ls_name);
 
 	ls->ls_debug_locks_dentry = debugfs_create_file(name,
 							0644,
@@ -997,7 +998,7 @@ void dlm_create_debug_file(struct dlm_ls *ls)
 	/* format 3 */
 
 	memset(name, 0, sizeof(name));
-	snprintf(name, DLM_LOCKSPACE_LEN + 8, "%s_all", ls->ls_name);
+	snprintf(name, DLM_DEBUG_NAME_LEN, "%s_all", ls->ls_name);
 
 	ls->ls_debug_all_dentry = debugfs_create_file(name,
 						      S_IFREG | S_IRUGO,
@@ -1008,7 +1009,7 @@ void dlm_create_debug_file(struct dlm_ls *ls)
 	/* format 4 */
 
 	memset(name, 0, sizeof(name));
-	snprintf(name, DLM_LOCKSPACE_LEN + 8, "%s_toss", ls->ls_name);
+	snprintf(name, DLM_DEBUG_NAME_LEN, "%s_toss", ls->ls_name);
 
 	ls->ls_debug_toss_dentry = debugfs_create_file(name,
 						       S_IFREG | S_IRUGO,
@@ -1017,7 +1018,7 @@ void dlm_create_debug_file(struct dlm_ls *ls)
 						       &format4_fops);
 
 	memset(name, 0, sizeof(name));
-	snprintf(name, DLM_LOCKSPACE_LEN + 8, "%s_waiters", ls->ls_name);
+	snprintf(name, DLM_DEBUG_NAME_LEN, "%s_waiters", ls->ls_name);
 
 	ls->ls_debug_waiters_dentry = debugfs_create_file(name,
 							  0644,
@@ -1028,7 +1029,7 @@ void dlm_create_debug_file(struct dlm_ls *ls)
 	/* format 5 */
 
 	memset(name, 0, sizeof(name));
-	snprintf(name, DLM_LOCKSPACE_LEN + 8, "%s_queued_asts", ls->ls_name);
+	snprintf(name, DLM_DEBUG_NAME_LEN, "%s_queued_asts", ls->ls_name);
 
 	ls->ls_debug_queued_asts_dentry = debugfs_create_file(name,
 							      0644,
-- 
2.31.1

