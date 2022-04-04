Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C937D4F1A06
	for <lists+cluster-devel@lfdr.de>; Mon,  4 Apr 2022 22:07:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649102840;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vWoUtnidAJgX6ZzeqpqXJ0fIjEUBgM9157c8TJSwWQ8=;
	b=d7cBJ//hsjgKC0qmjuNI6bcVvj0wONNHov9TSaeDiaP0I4VMLEDUvgpcf6TZGGeM9OZW8d
	7K9jMz8sNnkH+qPVDEAQ9T7ZRHSSG6olI3b4lNNyaxMdPlrbPIvsOlqZkf00Y/STFMkGC3
	aoQTsfwu+jdtiuCBWjzojAqLec5EMXE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-185-iXv4ong6OBqVYHf-vWOxvw-1; Mon, 04 Apr 2022 16:07:19 -0400
X-MC-Unique: iXv4ong6OBqVYHf-vWOxvw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2EFA8100BAAC;
	Mon,  4 Apr 2022 20:07:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 628D94047D17;
	Mon,  4 Apr 2022 20:07:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DC8B3194E107;
	Mon,  4 Apr 2022 20:06:56 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 768B9193F6E9 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  4 Apr 2022 20:06:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 65F8D7C2A; Mon,  4 Apr 2022 20:06:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 48BB07C28;
 Mon,  4 Apr 2022 20:06:55 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  4 Apr 2022 16:06:44 -0400
Message-Id: <20220404200646.3170301-18-aahringo@redhat.com>
In-Reply-To: <20220404200646.3170301-1-aahringo@redhat.com>
References: <20220404200646.3170301-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [Cluster-devel] [PATCH RESEND v5.18-rc1 17/19] fs: dlm: remove
 found label in dlm_master_lookup
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch cleanups a not necessary label found which can be replaced by
a proper else handling to jump over a specific code block.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lock.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index fd3a9bae5b5b..25468b5e65ad 100644
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

