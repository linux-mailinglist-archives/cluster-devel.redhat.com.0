Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E0C463EDA
	for <lists+cluster-devel@lfdr.de>; Tue, 30 Nov 2021 20:50:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638301806;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YD4j5O+AkDBvj+o+pkSCIB6laYNrTfzs1kWgLl/MbCQ=;
	b=jMqWOxnXe7ppec4PGWtALuZOElGx/Z+aFW2Sebd3dgQMSH0WiwrHECmW4jIHOnmRXR2iAO
	2R1ehi9WnaS0hvSZWTPhvxoZ3nl94u5cESaHYerd1CmZn85CzkFcLXfT7i2YVbeh8flHLf
	r/MgyMJXAVfqfaaYe5NvLt4Bisk5PHQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-446-hKH9z-8mPY2cL9Bw2w0dPg-1; Tue, 30 Nov 2021 14:50:03 -0500
X-MC-Unique: hKH9z-8mPY2cL9Bw2w0dPg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BACDB18A0F27;
	Tue, 30 Nov 2021 19:50:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ADA2D694BF;
	Tue, 30 Nov 2021 19:50:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 45CD34A7CA;
	Tue, 30 Nov 2021 19:49:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AUJlgCO022113 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Nov 2021 14:47:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E1E5B45D6A; Tue, 30 Nov 2021 19:47:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F39EB45D70;
	Tue, 30 Nov 2021 19:47:27 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 30 Nov 2021 14:47:14 -0500
Message-Id: <20211130194720.666400-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, pabeni@redhat.com
Subject: [Cluster-devel] [PATCH dlm-next 1/7] fs: dlm: use list_empty() to
	check last iteration
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

This patch will use list_empty(&ls->ls_cb_delay) to check for last list
iteration. In case of a multiply count of MAX_CB_QUEUE and the list is
empty we do a extra goto more which we can avoid by checking on
list_empty().

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/ast.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/dlm/ast.c b/fs/dlm/ast.c
index 27bae7d4a477..bfac462dd3e8 100644
--- a/fs/dlm/ast.c
+++ b/fs/dlm/ast.c
@@ -300,6 +300,7 @@ void dlm_callback_resume(struct dlm_ls *ls)
 {
 	struct dlm_lkb *lkb, *safe;
 	int count = 0, sum = 0;
+	bool empty;
 
 	clear_bit(LSFL_CB_DELAY, &ls->ls_flags);
 
@@ -315,10 +316,11 @@ void dlm_callback_resume(struct dlm_ls *ls)
 		if (count == MAX_CB_QUEUE)
 			break;
 	}
+	empty = list_empty(&ls->ls_cb_delay);
 	mutex_unlock(&ls->ls_cb_mutex);
 
 	sum += count;
-	if (count == MAX_CB_QUEUE) {
+	if (!empty) {
 		count = 0;
 		cond_resched();
 		goto more;
-- 
2.27.0

