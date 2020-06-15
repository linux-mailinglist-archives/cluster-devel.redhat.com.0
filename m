Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id F107E1F94E2
	for <lists+cluster-devel@lfdr.de>; Mon, 15 Jun 2020 12:51:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592218260;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=gn1TULK4qTF5LkgsgobGk1u+t0BmgL4Tif7i+jxR0k4=;
	b=Q8CyaNX4V6Qw4/FHrA1V5WmLopAtKkdHE28WlxeHr/WIIX5Fbd1zgNLNEiP2SjLh9JETPw
	NZufArvi17yIbKIdQGt4OjP4sTaWwR8GwRzpWirPn00ZzegfyIbWjf1pCS7UG5BYmBGtGF
	wdTid859P6DKYD+1kmLJpsB1T3p2kSc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-RZLMLaDSPxS1D8anvg7-9Q-1; Mon, 15 Jun 2020 06:50:59 -0400
X-MC-Unique: RZLMLaDSPxS1D8anvg7-9Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD308106B242;
	Mon, 15 Jun 2020 10:50:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 502A060BF1;
	Mon, 15 Jun 2020 10:50:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 83D241809547;
	Mon, 15 Jun 2020 10:50:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05F3g3K0010605 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 14 Jun 2020 23:42:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 15AE32166BA3; Mon, 15 Jun 2020 03:42:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D61F2157F24
	for <cluster-devel@redhat.com>; Mon, 15 Jun 2020 03:42:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E9C08316EB
	for <cluster-devel@redhat.com>; Mon, 15 Jun 2020 03:42:01 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-49-0--vLnl_NGuPqTMojnvbgg-1; Sun, 14 Jun 2020 23:41:52 -0400
X-MC-Unique: 0--vLnl_NGuPqTMojnvbgg-1
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 8E84CCDCDECB5E096AEB;
	Mon, 15 Jun 2020 11:26:19 +0800 (CST)
Received: from huawei.com (10.175.113.133) by DGGEMS405-HUB.china.huawei.com
	(10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Mon, 15 Jun 2020
	11:26:10 +0800
From: Wang Hai <wanghai38@huawei.com>
To: <ccaulfie@redhat.com>, <teigland@redhat.com>, <gregkh@suse.de>,
	<cluster-devel@redhat.com>
Date: Mon, 15 Jun 2020 11:25:33 +0800
Message-ID: <20200615032533.17258-1-wanghai38@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.133]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Mon, 15 Jun 2020 06:50:46 -0400
Cc: wanghai38@huawei.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH] dlm: Fix kobject memleak
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Currently the error return path from kobject_init_and_add() is not
followed by a call to kobject_put() - which means we are leaking
the kobject.

Set do_unreg = 1 before kobject_init_and_add() to ensure that
kobject_put() can be called in its error patch.

Fixes: 901195ed7f4b ("Kobject: change GFS2 to use kobject_init_and_add")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wang Hai <wanghai38@huawei.com>
---
 fs/dlm/lockspace.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index afb8340..c689359 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -632,6 +632,9 @@ static int new_lockspace(const char *name, const char *cluster,
 	wait_event(ls->ls_recover_lock_wait,
 		   test_bit(LSFL_RECOVER_LOCK, &ls->ls_flags));
 
+	/* let kobject handle freeing of ls if there's an error */
+	do_unreg = 1;
+
 	ls->ls_kobj.kset = dlm_kset;
 	error = kobject_init_and_add(&ls->ls_kobj, &dlm_ktype, NULL,
 				     "%s", ls->ls_name);
@@ -639,9 +642,6 @@ static int new_lockspace(const char *name, const char *cluster,
 		goto out_recoverd;
 	kobject_uevent(&ls->ls_kobj, KOBJ_ADD);
 
-	/* let kobject handle freeing of ls if there's an error */
-	do_unreg = 1;
-
 	/* This uevent triggers dlm_controld in userspace to add us to the
 	   group of nodes that are members of this lockspace (managed by the
 	   cluster infrastructure.)  Once it's done that, it tells us who the
-- 
1.8.3.1

