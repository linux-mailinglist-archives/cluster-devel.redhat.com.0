Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTP id 46462422F52
	for <lists+cluster-devel@lfdr.de>; Tue,  5 Oct 2021 19:38:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633455483;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=V5/yT9hxXyjQ4bYIaXX2OPoaRT3QG95zvt7eF60efuU=;
	b=FG9euMxB0rpfVxG4l8ElBIkbR+mC8TVyzqK7kjXWn1VuBeTWwi9KtMrHcOPIGzBcl6aEGh
	r8G1zUL6Sfjz9KwaYBkyXJido/uj8TR81bCOW//ewEGBY1AeiLeLZraZCjZmJ0aXE33i2z
	IhSfOMQxK50+4YZNjNbRhdKH96cAZ28=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-JyNkCMgfN0WYmcnuB6wK-w-1; Tue, 05 Oct 2021 13:38:02 -0400
X-MC-Unique: JyNkCMgfN0WYmcnuB6wK-w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1189D1084684;
	Tue,  5 Oct 2021 17:38:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E9F4760C13;
	Tue,  5 Oct 2021 17:37:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7108C1800B9E;
	Tue,  5 Oct 2021 17:37:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 195HYmR4028239 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 5 Oct 2021 13:34:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B69B7100763D; Tue,  5 Oct 2021 17:34:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 577A9100164A;
	Tue,  5 Oct 2021 17:34:48 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue,  5 Oct 2021 13:34:10 -0400
Message-Id: <20211005173410.4004891-2-aahringo@redhat.com>
In-Reply-To: <20211005173410.4004891-1-aahringo@redhat.com>
References: <20211005173410.4004891-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 2/2] fs: dlm: use
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
index 3122c5a718c4..7eca9148d25c 100644
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
index 62642dc67c2d..3ccb2395b663 100644
--- a/fs/dlm/recoverd.c
+++ b/fs/dlm/recoverd.c
@@ -129,8 +129,7 @@ static int ls_recover(struct dlm_ls *ls, struct dlm_recover *rv)
 
 	dlm_recover_waiters_pre(ls);
 
-	error = dlm_recovery_stopped(ls);
-	if (error) {
+	if (dlm_recovery_stopped(ls)) {
 		error = -EINTR;
 		goto fail;
 	}
-- 
2.27.0

