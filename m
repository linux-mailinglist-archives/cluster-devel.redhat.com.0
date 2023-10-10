Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E186F7C4362
	for <lists+cluster-devel@lfdr.de>; Wed, 11 Oct 2023 00:05:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696975504;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=N97NFm2g/lzRRHuXI7wM0bkRno1lir9TeCGtyb81QaM=;
	b=BU9cX9tSK3bXevKOmX23IpeROT7mfgbnSVFvcyUgs5/0qbzpYSKoFSDrf8JzPLF/E9rajm
	fihZ/MQRn7w73Off9/PzmbsTdKN6mH0j7jj33+UAA0i64M7Q1lErBQInTJO+A2gv0BG6Z8
	VqozyXf1zOF7DD6sbzJnArkzOwK9A1A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-P0Ap72chO5yJ0pjnfhzeuA-1; Tue, 10 Oct 2023 18:05:01 -0400
X-MC-Unique: P0Ap72chO5yJ0pjnfhzeuA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 89289185A790;
	Tue, 10 Oct 2023 22:05:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7DB0810EE6CE;
	Tue, 10 Oct 2023 22:04:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0252819465BD;
	Tue, 10 Oct 2023 22:04:58 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7276C1946597 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 10 Oct 2023 22:04:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4866763F6C; Tue, 10 Oct 2023 22:04:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9A159A;
 Tue, 10 Oct 2023 22:04:56 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 10 Oct 2023 18:04:41 -0400
Message-Id: <20231010220448.2978176-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Cluster-devel] [PATCH RESEND 1/8] fs: dlm: Simplify buffer size
 computation in dlm_create_debug_file()
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
Cc: cluster-devel@redhat.com, gfs2@lists.linux.dev,
 christophe.jaillet@wanadoo.fr, stable@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Use sizeof(name) instead of the equivalent, but hard coded,
DLM_LOCKSPACE_LEN + 8.

This is less verbose and more future proof.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/debug_fs.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/dlm/debug_fs.c b/fs/dlm/debug_fs.c
index 5aabcb6f0f15..e9726c6cbdf2 100644
--- a/fs/dlm/debug_fs.c
+++ b/fs/dlm/debug_fs.c
@@ -986,7 +986,7 @@ void dlm_create_debug_file(struct dlm_ls *ls)
 	/* format 2 */
 
 	memset(name, 0, sizeof(name));
-	snprintf(name, DLM_LOCKSPACE_LEN + 8, "%s_locks", ls->ls_name);
+	snprintf(name, sizeof(name), "%s_locks", ls->ls_name);
 
 	ls->ls_debug_locks_dentry = debugfs_create_file(name,
 							0644,
@@ -997,7 +997,7 @@ void dlm_create_debug_file(struct dlm_ls *ls)
 	/* format 3 */
 
 	memset(name, 0, sizeof(name));
-	snprintf(name, DLM_LOCKSPACE_LEN + 8, "%s_all", ls->ls_name);
+	snprintf(name, sizeof(name), "%s_all", ls->ls_name);
 
 	ls->ls_debug_all_dentry = debugfs_create_file(name,
 						      S_IFREG | S_IRUGO,
@@ -1008,7 +1008,7 @@ void dlm_create_debug_file(struct dlm_ls *ls)
 	/* format 4 */
 
 	memset(name, 0, sizeof(name));
-	snprintf(name, DLM_LOCKSPACE_LEN + 8, "%s_toss", ls->ls_name);
+	snprintf(name, sizeof(name), "%s_toss", ls->ls_name);
 
 	ls->ls_debug_toss_dentry = debugfs_create_file(name,
 						       S_IFREG | S_IRUGO,
@@ -1017,7 +1017,7 @@ void dlm_create_debug_file(struct dlm_ls *ls)
 						       &format4_fops);
 
 	memset(name, 0, sizeof(name));
-	snprintf(name, DLM_LOCKSPACE_LEN + 8, "%s_waiters", ls->ls_name);
+	snprintf(name, sizeof(name), "%s_waiters", ls->ls_name);
 
 	ls->ls_debug_waiters_dentry = debugfs_create_file(name,
 							  0644,
@@ -1028,7 +1028,7 @@ void dlm_create_debug_file(struct dlm_ls *ls)
 	/* format 5 */
 
 	memset(name, 0, sizeof(name));
-	snprintf(name, DLM_LOCKSPACE_LEN + 8, "%s_queued_asts", ls->ls_name);
+	snprintf(name, sizeof(name), "%s_queued_asts", ls->ls_name);
 
 	ls->ls_debug_queued_asts_dentry = debugfs_create_file(name,
 							      0644,
-- 
2.39.3

