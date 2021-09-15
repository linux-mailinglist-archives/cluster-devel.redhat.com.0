Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7715740CE65
	for <lists+cluster-devel@lfdr.de>; Wed, 15 Sep 2021 22:47:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631738826;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XhwMzdqjGEFI0ZRIB96DaS0oZAC9cga6NYFTP79i8f8=;
	b=bBS9maoyy3q32+Yk8InHfH9fWtQrBGbhTle65XgCHjkeiobR9h/J3/YcUycM0LRpwSqQmB
	BaTEdDYDRR/RJMJfi+5fctd/to9Z0TwmzhRy3UpUBbPiSD1EjbGZoyEBP47seEbng9URYH
	XKRnd5OO6DWDpf41UFCLdaWsPUd1QAU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-Z6wrB40xOX25GENCL7mI9Q-1; Wed, 15 Sep 2021 16:47:05 -0400
X-MC-Unique: Z6wrB40xOX25GENCL7mI9Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 179A7100F945;
	Wed, 15 Sep 2021 20:47:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0883F6A908;
	Wed, 15 Sep 2021 20:47:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C9E494EA2A;
	Wed, 15 Sep 2021 20:47:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18FKdTlq032308 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 Sep 2021 16:39:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 05A70604CC; Wed, 15 Sep 2021 20:39:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B9DC76A255;
	Wed, 15 Sep 2021 20:39:28 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 15 Sep 2021 16:39:14 -0400
Message-Id: <20210915203916.3661690-2-aahringo@redhat.com>
In-Reply-To: <20210915203916.3661690-1-aahringo@redhat.com>
References: <20210915203916.3661690-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 1/3] fs: dlm: add notes for
	recovery and membership handling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

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
index 731d489aa323..5f5b07bdbcc3 100644
--- a/fs/dlm/member.c
+++ b/fs/dlm/member.c
@@ -540,7 +540,11 @@ int dlm_recover_members(struct dlm_ls *ls, struct dlm_recover *rv, int *neg_out)
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
index 97d052cea5a9..208b69f46baf 100644
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
2.27.0

