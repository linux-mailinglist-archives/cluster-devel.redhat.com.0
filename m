Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 662DA4C19A3
	for <lists+cluster-devel@lfdr.de>; Wed, 23 Feb 2022 18:13:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645636426;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dkuWUMTCBfXvoL8gclSLb2JlLFdithzgHEPYYhIIvm0=;
	b=YwyBtNzNGii7QDsjgEMoSV4JcaNZ1SipVIwQ4PeEiCNEUeGWTW1nlztL7ixWLSMdWCFvJF
	sGtnVAwTVYdLhRMkFI3sTF3YZy/D3HnOtu4od8mOQ/bmGvrYz1NxKN/DDl2ff7FlMSe2za
	E3T5xSpg/xzicgUAMJCncbwIjZJtYa8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-53-FH60HdorMwqLfOK6EyhoqA-1; Wed, 23 Feb 2022 12:13:42 -0500
X-MC-Unique: FH60HdorMwqLfOK6EyhoqA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB2372F4F;
	Wed, 23 Feb 2022 17:13:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B9DA08658E;
	Wed, 23 Feb 2022 17:13:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A0CA01809C98;
	Wed, 23 Feb 2022 17:13:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21NH8s5T009289 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 23 Feb 2022 12:08:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8361B838EA; Wed, 23 Feb 2022 17:08:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 25B14838EC;
	Wed, 23 Feb 2022 17:08:54 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 23 Feb 2022 12:08:28 -0500
Message-Id: <20220223170829.830864-9-aahringo@redhat.com>
In-Reply-To: <20220223170829.830864-1-aahringo@redhat.com>
References: <20220223170829.830864-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, viro@zeniv.linux.org.uk
Subject: [Cluster-devel] [PATCH/RFC dlm/next 8/9] fs: dlm: remove found
	label in dlm_master_lookup
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch cleanups a not necessary label found which can be replaced by
a proper else handling to jump over a specific code block.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lock.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 43f362f159ef..013d46cc58e0 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -954,18 +954,18 @@ int dlm_master_lookup(struct dlm_ls *ls, int from_nodeid, char *name, int len,
 		hold_rsb(r);
 		spin_unlock(&ls->ls_rsbtbl[b].lock);
 		lock_rsb(r);
-		goto found;
-	}
+	} else {
+		error = dlm_search_rsb_tree(&ls->ls_rsbtbl[b].toss, name, len, &r);
+		if (error)
+			goto not_found;
 
-	error = dlm_search_rsb_tree(&ls->ls_rsbtbl[b].toss, name, len, &r);
-	if (error)
-		goto not_found;
+		/* because the rsb is inactive (on toss list), it's not refcounted
+		 * and lock_rsb is not used, but is protected by the rsbtbl lock
+		 */
 
-	/* because the rsb is inactive (on toss list), it's not refcounted
-	   and lock_rsb is not used, but is protected by the rsbtbl lock */
+		toss_list = 1;
+	}
 
-	toss_list = 1;
- found:
 	if (r->res_dir_nodeid != our_nodeid) {
 		/* should not happen, but may as well fix it and carry on */
 		log_error(ls, "dlm_master_lookup res_dir %d our %d %s",
-- 
2.31.1

