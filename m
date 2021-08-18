Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 059A13F0CBD
	for <lists+cluster-devel@lfdr.de>; Wed, 18 Aug 2021 22:27:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629318466;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vCrPT/mpwgU96hfl/LLt1LGHtGtoq/Ncy5U+/FkHcjw=;
	b=KwQfxw3KrtRPo0mCXsD/Rq1PO9rnepwGLqQrq+bkfAdOUe2TTdU8pweJ5ux71mgNGkOhri
	6PNw6CC0BazqA5DnRfpTmr4sV20J84GrDPwBfKoW3BJB8yD745KlABavN9C8Fxap7VMh4A
	VZrn5LKlB+XwQkC1EbAIcxmE5gcAO+c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-gQo8EIR8OJ2pf2tyuLt8qQ-1; Wed, 18 Aug 2021 16:27:44 -0400
X-MC-Unique: gQo8EIR8OJ2pf2tyuLt8qQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A58A787D543;
	Wed, 18 Aug 2021 20:27:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 964685C1A3;
	Wed, 18 Aug 2021 20:27:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3BA634BB7C;
	Wed, 18 Aug 2021 20:27:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17IKRYQa011402 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 18 Aug 2021 16:27:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 223C45D9DE; Wed, 18 Aug 2021 20:27:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D5B435D9C6;
	Wed, 18 Aug 2021 20:27:33 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 18 Aug 2021 16:27:14 -0400
Message-Id: <20210818202716.3094835-3-aahringo@redhat.com>
In-Reply-To: <20210818202716.3094835-1-aahringo@redhat.com>
References: <20210818202716.3094835-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH RESEND dlm/next 2/4] fs: dlm: fix return
	-EINTR on recovery stopped
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch will return -EINTR instead of 1 if recovery is stopped. In
case of ping_members() the return value will be checked if the error is
-EINTR for signaling another recovery was triggered and the whole
recovery process will come to a clean end to process the next one.
Returning 1 will abort the recovery process and can leave the recovery
in a broken state.

It was reported with the following kernel log message attached and a gfs2
mount stopped working:

"dlm: bobvirt1: dlm_recover_members error 1"

whereas 1 was returned because of a conversion of "dlm_recovery_stopped()"
to an errno was missing which this patch will introduce. While on it all
other possible missing errno conversions at other places were added as
they are done as in other places.

It might be worth to check the error case at this recovery level,
because some of the functionality also returns -ENOBUFS and check why
recovery ends in a broken state. However this will fix the issue if
another recovery was triggered at some points of recovery handling.

Reported-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/dir.c      | 4 +++-
 fs/dlm/member.c   | 4 +++-
 fs/dlm/recoverd.c | 4 +++-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/fs/dlm/dir.c b/fs/dlm/dir.c
index 10c36ae1a8f9..45ebbe602bbf 100644
--- a/fs/dlm/dir.c
+++ b/fs/dlm/dir.c
@@ -85,8 +85,10 @@ int dlm_recover_directory(struct dlm_ls *ls)
 		for (;;) {
 			int left;
 			error = dlm_recovery_stopped(ls);
-			if (error)
+			if (error) {
+				error = -EINTR;
 				goto out_free;
+			}
 
 			error = dlm_rcom_names(ls, memb->nodeid,
 					       last_name, last_len);
diff --git a/fs/dlm/member.c b/fs/dlm/member.c
index d9e1e4170eb1..731d489aa323 100644
--- a/fs/dlm/member.c
+++ b/fs/dlm/member.c
@@ -443,8 +443,10 @@ static int ping_members(struct dlm_ls *ls)
 
 	list_for_each_entry(memb, &ls->ls_nodes, list) {
 		error = dlm_recovery_stopped(ls);
-		if (error)
+		if (error) {
+			error = -EINTR;
 			break;
+		}
 		error = dlm_rcom_status(ls, memb->nodeid, 0);
 		if (error)
 			break;
diff --git a/fs/dlm/recoverd.c b/fs/dlm/recoverd.c
index 85e245392715..97d052cea5a9 100644
--- a/fs/dlm/recoverd.c
+++ b/fs/dlm/recoverd.c
@@ -125,8 +125,10 @@ static int ls_recover(struct dlm_ls *ls, struct dlm_recover *rv)
 	dlm_recover_waiters_pre(ls);
 
 	error = dlm_recovery_stopped(ls);
-	if (error)
+	if (error) {
+		error = -EINTR;
 		goto fail;
+	}
 
 	if (neg || dlm_no_directory(ls)) {
 		/*
-- 
2.27.0

