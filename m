Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0EA44365E
	for <lists+cluster-devel@lfdr.de>; Tue,  2 Nov 2021 20:18:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635880689;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=k5ZhMkh7fZtYwt2/7JSehdrRZcRN19RjnGddninWoB0=;
	b=LwLs0bTS4+VionBnLN14IcTRDFxes7UVm1+rJYWqH6CtFapIAghAk3a1Dab/c5tgaV0fvX
	G7pB1fIGfVmkguu/gRnyYyOi+xOORzKkHozD4DVAqIydO4peqRjXHFOl/g1t1OHUxPQWkB
	45gbtMj2CPZLFEU7tliZ9ft7G2FmCNA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-NZKRzrq-PXSSLolsY7eshg-1; Tue, 02 Nov 2021 15:18:06 -0400
X-MC-Unique: NZKRzrq-PXSSLolsY7eshg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57868180831E;
	Tue,  2 Nov 2021 19:18:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45CBC19C59;
	Tue,  2 Nov 2021 19:18:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5592A1832DD2;
	Tue,  2 Nov 2021 19:18:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A2JHuLf020747 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 2 Nov 2021 15:17:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F155567842; Tue,  2 Nov 2021 19:17:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A2D7C652AC;
	Tue,  2 Nov 2021 19:17:56 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue,  2 Nov 2021 15:17:14 -0400
Message-Id: <20211102191724.210095-9-aahringo@redhat.com>
In-Reply-To: <20211102191724.210095-1-aahringo@redhat.com>
References: <20211102191724.210095-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH RESEND v5.15-rc7 08/18] fs: dlm: make
	dlm_callback_resume quite
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

This patch makes dlm_callback_resume info printout less noisy by
accumulate all callback queues into one printout not in 25 times steps.
It seems this printout became lately quite noisy in relationship with
gfs2.

Before:

[241767.849302] dlm: bin: dlm_callback_resume 25
[241767.854846] dlm: bin: dlm_callback_resume 25
[241767.860373] dlm: bin: dlm_callback_resume 25
...
[241767.865920] dlm: bin: dlm_callback_resume 25
[241767.871352] dlm: bin: dlm_callback_resume 25
[241767.876733] dlm: bin: dlm_callback_resume 25

After the patch:

[  385.485728] dlm: gfs2: dlm_callback_resume 175

if zero it will not be printed out.

Reported-by: Barry Marson <bmarson@redhat.com>
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/ast.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/dlm/ast.c b/fs/dlm/ast.c
index 283c7b94edda..6600930497cc 100644
--- a/fs/dlm/ast.c
+++ b/fs/dlm/ast.c
@@ -295,7 +295,7 @@ void dlm_callback_suspend(struct dlm_ls *ls)
 void dlm_callback_resume(struct dlm_ls *ls)
 {
 	struct dlm_lkb *lkb, *safe;
-	int count = 0;
+	int count = 0, sum = 0;
 
 	clear_bit(LSFL_CB_DELAY, &ls->ls_flags);
 
@@ -313,12 +313,14 @@ void dlm_callback_resume(struct dlm_ls *ls)
 	}
 	mutex_unlock(&ls->ls_cb_mutex);
 
-	if (count)
-		log_rinfo(ls, "dlm_callback_resume %d", count);
+	sum += count;
 	if (count == MAX_CB_QUEUE) {
 		count = 0;
 		cond_resched();
 		goto more;
 	}
+
+	if (sum)
+		log_rinfo(ls, "%s %d", __func__, sum);
 }
 
-- 
2.27.0

