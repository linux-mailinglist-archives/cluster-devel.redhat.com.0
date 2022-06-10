Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C84F3546B44
	for <lists+cluster-devel@lfdr.de>; Fri, 10 Jun 2022 19:06:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654880794;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=h2dFIz0sQTFLOBxPyYxeCVxc0wldJdC3oY89x5fo7s0=;
	b=aZ/THKasxcIvip2m8+sBfZIjJEbYuWJYgFyUIpcPhChFr7Uu/6+f35pV2FiN08wSQI+Qgw
	DO4rWPv8mb+zs4zXT+CX7UzbcI4rEKuVA7FfifcwDBZL0kKaWnadggHtqR3eX2VJFTQ4ss
	QmujeD0kiAszlMPuQR3DZDZuKMuKhYI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-I90rPQuSMzKKSPqKPxkT3Q-1; Fri, 10 Jun 2022 13:06:27 -0400
X-MC-Unique: I90rPQuSMzKKSPqKPxkT3Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 237FB3801F6E;
	Fri, 10 Jun 2022 17:06:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E163B41136E0;
	Fri, 10 Jun 2022 17:06:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 008CE1947059;
	Fri, 10 Jun 2022 17:06:24 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D84551947054 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 10 Jun 2022 17:06:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CB71C18EA7; Fri, 10 Jun 2022 17:06:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD0AD1730C;
 Fri, 10 Jun 2022 17:06:22 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 10 Jun 2022 13:06:10 -0400
Message-Id: <20220610170616.3480642-2-aahringo@redhat.com>
In-Reply-To: <20220610170616.3480642-1-aahringo@redhat.com>
References: <20220610170616.3480642-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [Cluster-devel] [PATCH v5.19-rc1 1/7] fs: dlm: add notes for
 recovery and membership handling
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch adds some comment sections to make aware that the ls_recover()
function should never fail before membership handling. Membership
handling means to add/remove nodes from the lockspace ls_nodes
attribute in dlm_recover_members().

This is because there are functionality like dlm_midcomms_add_member(),
dlm_midcomms_remove_member() or dlm_lsop_recover_slot() which should
always get aware of any join or leave of lockspace members. If we add a
e.g. dlm_locking_stopped() before dlm_recover_members() to check if the
recovery was interrupted and abort it we might skip to call
dlm_midcomms_add_member(), dlm_midcomms_remove_member() or
dlm_lsop_recover_slot().

A reason because the recovery is interrupted could be that the cluster
manager notified about a new configuration .e.g. members joined or
leaved. It is fine to interrupt or fail the recovery handling after
the mentioned handling of dlm_recover_members() but never before.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/member.c   | 6 +++++-
 fs/dlm/recoverd.c | 4 ++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/fs/dlm/member.c b/fs/dlm/member.c
index 98084e0cfccf..7e5f5aefefb5 100644
--- a/fs/dlm/member.c
+++ b/fs/dlm/member.c
@@ -534,7 +534,11 @@ int dlm_recover_members(struct dlm_ls *ls, struct dlm_recover *rv, int *neg_out)
 	int i, error, neg = 0, low = -1;
 
 	/* previously removed members that we've not finished removing need to
-	   count as a negative change so the "neg" recovery steps will happen */
+	 * count as a negative change so the "neg" recovery steps will happen
+	 *
+	 * This functionality must report all member changes to lsops or
+	 * midcomms layer and must never return before.
+	 */
 
 	list_for_each_entry(memb, &ls->ls_nodes_gone, list) {
 		log_rinfo(ls, "prev removed member %d", memb->nodeid);
diff --git a/fs/dlm/recoverd.c b/fs/dlm/recoverd.c
index a55dfce705dd..b5b519cde20b 100644
--- a/fs/dlm/recoverd.c
+++ b/fs/dlm/recoverd.c
@@ -70,6 +70,10 @@ static int ls_recover(struct dlm_ls *ls, struct dlm_recover *rv)
 
 	/*
 	 * Add or remove nodes from the lockspace's ls_nodes list.
+	 *
+	 * Due the fact we must report all membership changes to lsops or
+	 * midcomms layer it is not permitted to abort ls_recover() until
+	 * this is done.
 	 */
 
 	error = dlm_recover_members(ls, rv, &neg);
-- 
2.31.1

