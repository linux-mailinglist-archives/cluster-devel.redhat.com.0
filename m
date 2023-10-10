Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4357C4367
	for <lists+cluster-devel@lfdr.de>; Wed, 11 Oct 2023 00:05:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696975514;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=e1DAsNmGZUyXNq+0RsyEaZwIKrlbsqv6ED1CKmPYg80=;
	b=GiL0y+yj1jKszIDFFG/f9MGf58modyuEWGSL7OTO21EEcpAnxACJJqRTtMtDGbFwNoeBka
	1IbtJmLWj8CTQKZbCy7qOK9rZcUpA7TO5TD2Cjwirz/jQNr57SKjg1VnJI4We+LDf/mCwz
	MI/0YnT5iGmlMZhqEyv3Z45V3dLmtso=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-3zipmw3KM4u3UugJ7W9aqQ-1; Tue, 10 Oct 2023 18:05:01 -0400
X-MC-Unique: 3zipmw3KM4u3UugJ7W9aqQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A02CA811761;
	Tue, 10 Oct 2023 22:05:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4131C1B99;
	Tue, 10 Oct 2023 22:04:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0DFA419466E7;
	Tue, 10 Oct 2023 22:04:59 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D77531946597 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 10 Oct 2023 22:04:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B93C363F50; Tue, 10 Oct 2023 22:04:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8670D9A;
 Tue, 10 Oct 2023 22:04:57 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 10 Oct 2023 18:04:43 -0400
Message-Id: <20231010220448.2978176-3-aahringo@redhat.com>
In-Reply-To: <20231010220448.2978176-1-aahringo@redhat.com>
References: <20231010220448.2978176-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Cluster-devel] [PATCH RESEND 3/8] fs: dlm: Remove some useless
 memset()
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

There is no need to clear the buffer used to build the file name.

snprintf() already guarantees that it is NULL terminated and such a
(useless) precaution was not done for the first string (i.e
ls_debug_rsb_dentry)

So, save a few LoC.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/debug_fs.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/fs/dlm/debug_fs.c b/fs/dlm/debug_fs.c
index c93359ceaae6..42f332f46359 100644
--- a/fs/dlm/debug_fs.c
+++ b/fs/dlm/debug_fs.c
@@ -986,7 +986,6 @@ void dlm_create_debug_file(struct dlm_ls *ls)
 
 	/* format 2 */
 
-	memset(name, 0, sizeof(name));
 	snprintf(name, sizeof(name), "%s_locks", ls->ls_name);
 
 	ls->ls_debug_locks_dentry = debugfs_create_file(name,
@@ -997,7 +996,6 @@ void dlm_create_debug_file(struct dlm_ls *ls)
 
 	/* format 3 */
 
-	memset(name, 0, sizeof(name));
 	snprintf(name, sizeof(name), "%s_all", ls->ls_name);
 
 	ls->ls_debug_all_dentry = debugfs_create_file(name,
@@ -1008,7 +1006,6 @@ void dlm_create_debug_file(struct dlm_ls *ls)
 
 	/* format 4 */
 
-	memset(name, 0, sizeof(name));
 	snprintf(name, sizeof(name), "%s_toss", ls->ls_name);
 
 	ls->ls_debug_toss_dentry = debugfs_create_file(name,
@@ -1017,7 +1014,6 @@ void dlm_create_debug_file(struct dlm_ls *ls)
 						       ls,
 						       &format4_fops);
 
-	memset(name, 0, sizeof(name));
 	snprintf(name, sizeof(name), "%s_waiters", ls->ls_name);
 
 	ls->ls_debug_waiters_dentry = debugfs_create_file(name,
@@ -1028,7 +1024,6 @@ void dlm_create_debug_file(struct dlm_ls *ls)
 
 	/* format 5 */
 
-	memset(name, 0, sizeof(name));
 	snprintf(name, sizeof(name), "%s_queued_asts", ls->ls_name);
 
 	ls->ls_debug_queued_asts_dentry = debugfs_create_file(name,
-- 
2.39.3

