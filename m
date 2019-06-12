Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6014942AEC
	for <lists+cluster-devel@lfdr.de>; Wed, 12 Jun 2019 17:28:41 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 46C76307D869;
	Wed, 12 Jun 2019 15:28:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 19EF71948B;
	Wed, 12 Jun 2019 15:27:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F286F206D1;
	Wed, 12 Jun 2019 15:27:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5CFQFTo011466 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 12 Jun 2019 11:26:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C5A6A5D991; Wed, 12 Jun 2019 15:26:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D5375D9CA;
	Wed, 12 Jun 2019 15:26:13 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 81F1119CBC7;
	Wed, 12 Jun 2019 15:25:47 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
	[83.86.89.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 740B12082C;
	Wed, 12 Jun 2019 15:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1560353139;
	bh=XL/nm3aOUkwCWcESC4K+zilP6iHtWKVlwgHXR/AROY0=;
	h=Date:From:To:Cc:Subject:From;
	b=x+w7VIXK5U1AWNW7n3BxacJrccnDfRTgXCM8yLn8UVP9HzJx5OfkGRy0xeJ1vwtRD
	fwTsv7NviXzCqEP5p7VkYLxAB0gcy+X4casUAre6+5Ae+3HMJGcOf+isYEOY1WBTGt
	lTml5A97SbIalcfHxsFThmA2TrJYaY9TEJ+C2GKU=
Date: Wed, 12 Jun 2019 17:25:36 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christine Caulfield <ccaulfie@redhat.com>,
	David Teigland <teigland@redhat.com>
Message-ID: <20190612152536.GA18440@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 12 Jun 2019 15:25:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Wed, 12 Jun 2019 15:25:52 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'gregkh@linuxfoundation.org' RCPT:''
X-RedHat-Spam-Score: -4.8  (DKIM_INVALID, DKIM_SIGNED, RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<gregkh@linuxfoundation.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] dlm: no need to check return value of
 debugfs_create functions
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Wed, 12 Jun 2019 15:28:40 +0000 (UTC)

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

Cc: Christine Caulfield <ccaulfie@redhat.com>
Cc: David Teigland <teigland@redhat.com>
Cc: cluster-devel@redhat.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 fs/dlm/debug_fs.c     | 21 ++-------------------
 fs/dlm/dlm_internal.h |  8 ++++----
 fs/dlm/main.c         |  5 +----
 3 files changed, 7 insertions(+), 27 deletions(-)

diff --git a/fs/dlm/debug_fs.c b/fs/dlm/debug_fs.c
index 0e941d42e3e9..d6bbccb0ed15 100644
--- a/fs/dlm/debug_fs.c
+++ b/fs/dlm/debug_fs.c
@@ -737,7 +737,7 @@ void dlm_delete_debug_file(struct dlm_ls *ls)
 	debugfs_remove(ls->ls_debug_toss_dentry);
 }
 
-int dlm_create_debug_file(struct dlm_ls *ls)
+void dlm_create_debug_file(struct dlm_ls *ls)
 {
 	char name[DLM_LOCKSPACE_LEN + 8];
 
@@ -748,8 +748,6 @@ int dlm_create_debug_file(struct dlm_ls *ls)
 						      dlm_root,
 						      ls,
 						      &format1_fops);
-	if (!ls->ls_debug_rsb_dentry)
-		goto fail;
 
 	/* format 2 */
 
@@ -761,8 +759,6 @@ int dlm_create_debug_file(struct dlm_ls *ls)
 							dlm_root,
 							ls,
 							&format2_fops);
-	if (!ls->ls_debug_locks_dentry)
-		goto fail;
 
 	/* format 3 */
 
@@ -774,8 +770,6 @@ int dlm_create_debug_file(struct dlm_ls *ls)
 						      dlm_root,
 						      ls,
 						      &format3_fops);
-	if (!ls->ls_debug_all_dentry)
-		goto fail;
 
 	/* format 4 */
 
@@ -787,8 +781,6 @@ int dlm_create_debug_file(struct dlm_ls *ls)
 						       dlm_root,
 						       ls,
 						       &format4_fops);
-	if (!ls->ls_debug_toss_dentry)
-		goto fail;
 
 	memset(name, 0, sizeof(name));
 	snprintf(name, DLM_LOCKSPACE_LEN + 8, "%s_waiters", ls->ls_name);
@@ -798,21 +790,12 @@ int dlm_create_debug_file(struct dlm_ls *ls)
 							  dlm_root,
 							  ls,
 							  &waiters_fops);
-	if (!ls->ls_debug_waiters_dentry)
-		goto fail;
-
-	return 0;
-
- fail:
-	dlm_delete_debug_file(ls);
-	return -ENOMEM;
 }
 
-int __init dlm_register_debugfs(void)
+void __init dlm_register_debugfs(void)
 {
 	mutex_init(&debug_buf_lock);
 	dlm_root = debugfs_create_dir("dlm", NULL);
-	return dlm_root ? 0 : -ENOMEM;
 }
 
 void dlm_unregister_debugfs(void)
diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index da1173a0b274..416d9de35679 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -719,14 +719,14 @@ int dlm_plock_init(void);
 void dlm_plock_exit(void);
 
 #ifdef CONFIG_DLM_DEBUG
-int dlm_register_debugfs(void);
+void dlm_register_debugfs(void);
 void dlm_unregister_debugfs(void);
-int dlm_create_debug_file(struct dlm_ls *ls);
+void dlm_create_debug_file(struct dlm_ls *ls);
 void dlm_delete_debug_file(struct dlm_ls *ls);
 #else
-static inline int dlm_register_debugfs(void) { return 0; }
+static inline void dlm_register_debugfs(void) { }
 static inline void dlm_unregister_debugfs(void) { }
-static inline int dlm_create_debug_file(struct dlm_ls *ls) { return 0; }
+static inline void dlm_create_debug_file(struct dlm_ls *ls) { }
 static inline void dlm_delete_debug_file(struct dlm_ls *ls) { }
 #endif
 
diff --git a/fs/dlm/main.c b/fs/dlm/main.c
index 39579927ed84..afc66a1346d3 100644
--- a/fs/dlm/main.c
+++ b/fs/dlm/main.c
@@ -35,9 +35,7 @@ static int __init init_dlm(void)
 	if (error)
 		goto out_lockspace;
 
-	error = dlm_register_debugfs();
-	if (error)
-		goto out_config;
+	dlm_register_debugfs();
 
 	error = dlm_user_init();
 	if (error)
@@ -61,7 +59,6 @@ static int __init init_dlm(void)
 	dlm_user_exit();
  out_debug:
 	dlm_unregister_debugfs();
- out_config:
 	dlm_config_exit();
  out_lockspace:
 	dlm_lockspace_exit();
-- 
2.22.0

