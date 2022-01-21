Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CE796496791
	for <lists+cluster-devel@lfdr.de>; Fri, 21 Jan 2022 22:50:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642801839;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=u1CCShKrMs7dObrfb3dFySNfFhTkwDtwXtyBTm1X/FA=;
	b=hZEB3i061IDDiLZhkhsObPG7qUiOpZTGUmga/XfGFKX3r4UUo23hWZtN3QQJLG3QlIzKZY
	gSFuwbZaKpWbw+V9iDJD9uTi+HEWvcgZlW9NVfwtUVMr64y/VqK6SzXQaWJYHbTbf7gxAg
	ArJmlDFNpYAq955n917DCgDU2p3v7ZQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-dz8D6CjcMNi34SMd6_kDlg-1; Fri, 21 Jan 2022 16:50:36 -0500
X-MC-Unique: dz8D6CjcMNi34SMd6_kDlg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02D9B84BA42;
	Fri, 21 Jan 2022 21:50:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FCC4E709;
	Fri, 21 Jan 2022 21:50:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8926B1809CB8;
	Fri, 21 Jan 2022 21:50:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20LLmCe4023358 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 21 Jan 2022 16:48:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 319C9E2FA; Fri, 21 Jan 2022 21:48:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D566EE2F7;
	Fri, 21 Jan 2022 21:48:11 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 21 Jan 2022 16:48:05 -0500
Message-Id: <20220121214805.451223-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next] fs: dlm: fix missing check in
	validate_lock_args
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch adds a additional check if lkb->lkb_wait_count is non zero as
it is done in validate_unlock_args() to check if any operation is in
progress. While on it add a comment taken from validate_unlock_args() to
signal what the check is doing.

There might be no changes because if lkb->lkb_wait_type is non zero
implies that lkb->lkb_wait_count is non zero. However we should add the
check as it does validate_unlock_args().

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lock.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index bdb51d209ba2..e72f1a063aeb 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -2912,7 +2912,8 @@ static int validate_lock_args(struct dlm_ls *ls, struct dlm_lkb *lkb,
 		if (lkb->lkb_status != DLM_LKSTS_GRANTED)
 			goto out;
 
-		if (lkb->lkb_wait_type)
+		/* lock not allowed if there's any op in progress */
+		if (lkb->lkb_wait_type || lkb->lkb_wait_count)
 			goto out;
 
 		if (is_overlap(lkb))
-- 
2.31.1

