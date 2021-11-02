Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DF544365F
	for <lists+cluster-devel@lfdr.de>; Tue,  2 Nov 2021 20:18:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635880690;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EkRgqiITGapBzM76SKFVW4pFOXLjIYxDagSJw1ev5AI=;
	b=JOVCcourYxIH9f1z+CkBPwegKHbcsnmpAlrTyHI6CXTwTx8UNjp/Ix6SmGhx74eBt2vtJ1
	U7A1NEPPUGY6rsrDAwfA1fUFKjjWbFUayRxeGFlNvszgWXpMKZPnLstnESNSv9JRZSK2R5
	TAGGISiw8EFXqp6vs68olOFk8iFNy/8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-gr5xBpX3MCWe5-qIUVPkjA-1; Tue, 02 Nov 2021 15:18:06 -0400
X-MC-Unique: gr5xBpX3MCWe5-qIUVPkjA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5AAAB100D681;
	Tue,  2 Nov 2021 19:18:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BAF260BE5;
	Tue,  2 Nov 2021 19:18:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4D598181A1D0;
	Tue,  2 Nov 2021 19:18:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A2JHuUk020735 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 2 Nov 2021 15:17:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 86B4857CD3; Tue,  2 Nov 2021 19:17:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 387AE652AC;
	Tue,  2 Nov 2021 19:17:56 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue,  2 Nov 2021 15:17:13 -0400
Message-Id: <20211102191724.210095-8-aahringo@redhat.com>
In-Reply-To: <20211102191724.210095-1-aahringo@redhat.com>
References: <20211102191724.210095-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH RESEND v5.15-rc7 07/18] fs: dlm: use
	dlm_recovery_stopped in condition
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch will change to evaluate the dlm_recovery_stopped() in the
condition of the if branch instead fetch it before evaluating the
condition. As this is an atomic test-set operation it should be
evaluated in the condition itself.

Reported-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/dir.c      | 3 +--
 fs/dlm/member.c   | 3 +--
 fs/dlm/recoverd.c | 3 +--
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/fs/dlm/dir.c b/fs/dlm/dir.c
index 45ebbe602bbf..b6692f81ec83 100644
--- a/fs/dlm/dir.c
+++ b/fs/dlm/dir.c
@@ -84,8 +84,7 @@ int dlm_recover_directory(struct dlm_ls *ls)
 
 		for (;;) {
 			int left;
-			error = dlm_recovery_stopped(ls);
-			if (error) {
+			if (dlm_recovery_stopped(ls)) {
 				error = -EINTR;
 				goto out_free;
 			}
diff --git a/fs/dlm/member.c b/fs/dlm/member.c
index 731d489aa323..61f906e705db 100644
--- a/fs/dlm/member.c
+++ b/fs/dlm/member.c
@@ -442,8 +442,7 @@ static int ping_members(struct dlm_ls *ls)
 	int error = 0;
 
 	list_for_each_entry(memb, &ls->ls_nodes, list) {
-		error = dlm_recovery_stopped(ls);
-		if (error) {
+		if (dlm_recovery_stopped(ls)) {
 			error = -EINTR;
 			break;
 		}
diff --git a/fs/dlm/recoverd.c b/fs/dlm/recoverd.c
index 97d052cea5a9..a55dfce705dd 100644
--- a/fs/dlm/recoverd.c
+++ b/fs/dlm/recoverd.c
@@ -124,8 +124,7 @@ static int ls_recover(struct dlm_ls *ls, struct dlm_recover *rv)
 
 	dlm_recover_waiters_pre(ls);
 
-	error = dlm_recovery_stopped(ls);
-	if (error) {
+	if (dlm_recovery_stopped(ls)) {
 		error = -EINTR;
 		goto fail;
 	}
-- 
2.27.0

