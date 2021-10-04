Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 206C14218E4
	for <lists+cluster-devel@lfdr.de>; Mon,  4 Oct 2021 23:00:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633381199;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ll5LDKvpi0xDuH5xsEUdRW+kI/aXUeeSqlKIm3Ktydw=;
	b=UTnCwH6dhYiqipSWK6hj8zGI15bQ3cSFIS2v7MSL1Fm2C0wUlbse3EwxuK+l9hCLdNzdcJ
	piub1fTrn7Rqr9d7miHJatDMdE5sd9UkWVn3Fzh88ctYXMQBUAYD8gCQ+4LpxQp2b2qyZ4
	RpBVBAWvLx2rgF3p81sYyFrQmzk6eEY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-iWeWeQqkOCK4954giYyf-Q-1; Mon, 04 Oct 2021 16:59:57 -0400
X-MC-Unique: iWeWeQqkOCK4954giYyf-Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA8D5102CC3C;
	Mon,  4 Oct 2021 20:59:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB1A99AA29;
	Mon,  4 Oct 2021 20:59:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A40801800B9E;
	Mon,  4 Oct 2021 20:59:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 194Kwe4I017422 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 4 Oct 2021 16:58:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 457495DF2F; Mon,  4 Oct 2021 20:58:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 04A285DEFB;
	Mon,  4 Oct 2021 20:58:39 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  4 Oct 2021 16:58:04 -0400
Message-Id: <20211004205805.3938460-2-aahringo@redhat.com>
In-Reply-To: <20211004205805.3938460-1-aahringo@redhat.com>
References: <20211004205805.3938460-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [RFC PATCH dlm/next 1/2] fs: dlm: provide some
	lockless functionality
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

This patch provides some lockless functionality for the central dlm
locking logic. It can be used internally to call central dlm locking
logic functionality if the necessary resource lock is already held.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lock.c | 72 ++++++++++++++++++++++++++++++++++-----------------
 1 file changed, 48 insertions(+), 24 deletions(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 3d4eeab213da..c419a5b5b7c0 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -4641,25 +4641,33 @@ static void __receive_convert_reply(struct dlm_rsb *r, struct dlm_lkb *lkb,
 	}
 }
 
-static void _receive_convert_reply(struct dlm_lkb *lkb, struct dlm_message *ms)
+static void _receive_convert_reply_lockless(struct dlm_lkb *lkb,
+					    struct dlm_message *ms,
+					    struct dlm_rsb *r)
 {
-	struct dlm_rsb *r = lkb->lkb_resource;
 	int error;
 
-	hold_rsb(r);
-	lock_rsb(r);
-
 	error = validate_message(lkb, ms);
 	if (error)
-		goto out;
+		return;
 
 	/* stub reply can happen with waiters_mutex held */
 	error = remove_from_waiters_ms(lkb, ms);
 	if (error)
-		goto out;
+		return;
 
 	__receive_convert_reply(r, lkb, ms);
- out:
+}
+
+static void _receive_convert_reply(struct dlm_lkb *lkb, struct dlm_message *ms)
+{
+	struct dlm_rsb *r = lkb->lkb_resource;
+
+	hold_rsb(r);
+	lock_rsb(r);
+
+	_receive_convert_reply_lockless(lkb, ms, r);
+
 	unlock_rsb(r);
 	put_rsb(r);
 }
@@ -4678,22 +4686,20 @@ static int receive_convert_reply(struct dlm_ls *ls, struct dlm_message *ms)
 	return 0;
 }
 
-static void _receive_unlock_reply(struct dlm_lkb *lkb, struct dlm_message *ms)
+static void _receive_unlock_reply_lockless(struct dlm_lkb *lkb,
+					   struct dlm_message *ms,
+					   struct dlm_rsb *r)
 {
-	struct dlm_rsb *r = lkb->lkb_resource;
 	int error;
 
-	hold_rsb(r);
-	lock_rsb(r);
-
 	error = validate_message(lkb, ms);
 	if (error)
-		goto out;
+		return;
 
 	/* stub reply can happen with waiters_mutex held */
 	error = remove_from_waiters_ms(lkb, ms);
 	if (error)
-		goto out;
+		return;
 
 	/* this is the value returned from do_unlock() on the master */
 
@@ -4709,7 +4715,17 @@ static void _receive_unlock_reply(struct dlm_lkb *lkb, struct dlm_message *ms)
 		log_error(r->res_ls, "receive_unlock_reply %x error %d",
 			  lkb->lkb_id, ms->m_result);
 	}
- out:
+}
+
+static void _receive_unlock_reply(struct dlm_lkb *lkb, struct dlm_message *ms)
+{
+	struct dlm_rsb *r = lkb->lkb_resource;
+
+	hold_rsb(r);
+	lock_rsb(r);
+
+	_receive_unlock_reply_lockless(lkb, ms, r);
+
 	unlock_rsb(r);
 	put_rsb(r);
 }
@@ -4728,22 +4744,20 @@ static int receive_unlock_reply(struct dlm_ls *ls, struct dlm_message *ms)
 	return 0;
 }
 
-static void _receive_cancel_reply(struct dlm_lkb *lkb, struct dlm_message *ms)
+static void _receive_cancel_reply_lockless(struct dlm_lkb *lkb,
+					   struct dlm_message *ms,
+					   struct dlm_rsb *r)
 {
-	struct dlm_rsb *r = lkb->lkb_resource;
 	int error;
 
-	hold_rsb(r);
-	lock_rsb(r);
-
 	error = validate_message(lkb, ms);
 	if (error)
-		goto out;
+		return;
 
 	/* stub reply can happen with waiters_mutex held */
 	error = remove_from_waiters_ms(lkb, ms);
 	if (error)
-		goto out;
+		return;
 
 	/* this is the value returned from do_cancel() on the master */
 
@@ -4759,7 +4773,17 @@ static void _receive_cancel_reply(struct dlm_lkb *lkb, struct dlm_message *ms)
 		log_error(r->res_ls, "receive_cancel_reply %x error %d",
 			  lkb->lkb_id, ms->m_result);
 	}
- out:
+}
+
+static void _receive_cancel_reply(struct dlm_lkb *lkb, struct dlm_message *ms)
+{
+	struct dlm_rsb *r = lkb->lkb_resource;
+
+	hold_rsb(r);
+	lock_rsb(r);
+
+	_receive_cancel_reply_lockless(lkb, ms, r);
+
 	unlock_rsb(r);
 	put_rsb(r);
 }
-- 
2.27.0

