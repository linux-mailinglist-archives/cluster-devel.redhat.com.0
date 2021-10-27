Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8497E43CDAD
	for <lists+cluster-devel@lfdr.de>; Wed, 27 Oct 2021 17:35:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635348908;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dcTaFY/Uvwt4iGsid9yq46XobJd6+jsf7Fd+Z4665e0=;
	b=XO0oy6ZQ2nhsh9a4WXyW15pzyQdgpW8NKUrYEvjTWAzZy0x4XPMaOkAgrM2pc8oOOMDj1b
	m5BUni0ErxAL0TPW4tCTNtB7hR2WCu1NJnu1J8ytzvH6XvUAvq1BBce/9zZdYhtYHbi7RQ
	MHAuWQS+Ov+ESe1X1TpWT2kLZQD/Rlw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-YuqUja0wOo6xs-xsEFlUkg-1; Wed, 27 Oct 2021 11:34:26 -0400
X-MC-Unique: YuqUja0wOo6xs-xsEFlUkg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34C05802B52;
	Wed, 27 Oct 2021 15:34:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 273ED69203;
	Wed, 27 Oct 2021 15:34:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DC97F181A1D0;
	Wed, 27 Oct 2021 15:34:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19RFNp0m009198 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 27 Oct 2021 11:23:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8D95C1042AEA; Wed, 27 Oct 2021 15:23:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3DB391042AEC;
	Wed, 27 Oct 2021 15:23:51 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 27 Oct 2021 11:23:19 -0400
Message-Id: <20211027152322.3236492-6-aahringo@redhat.com>
In-Reply-To: <20211027152322.3236492-1-aahringo@redhat.com>
References: <20211027152322.3236492-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 5/8] fs: dlm: allow create lkb with
	specific id range
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch adds functionality to add a lkb with a specific id range.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lock.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index c502c065d007..5f3c2c6bca8c 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -1178,7 +1178,8 @@ static void detach_lkb(struct dlm_lkb *lkb)
 	}
 }
 
-static int create_lkb(struct dlm_ls *ls, struct dlm_lkb **lkb_ret)
+static int _create_lkb(struct dlm_ls *ls, struct dlm_lkb **lkb_ret,
+		       int start, int end)
 {
 	struct dlm_lkb *lkb;
 	int rv;
@@ -1199,7 +1200,7 @@ static int create_lkb(struct dlm_ls *ls, struct dlm_lkb **lkb_ret)
 
 	idr_preload(GFP_NOFS);
 	spin_lock(&ls->ls_lkbidr_spin);
-	rv = idr_alloc(&ls->ls_lkbidr, lkb, 1, 0, GFP_NOWAIT);
+	rv = idr_alloc(&ls->ls_lkbidr, lkb, start, end, GFP_NOWAIT);
 	if (rv >= 0)
 		lkb->lkb_id = rv;
 	spin_unlock(&ls->ls_lkbidr_spin);
@@ -1215,6 +1216,11 @@ static int create_lkb(struct dlm_ls *ls, struct dlm_lkb **lkb_ret)
 	return 0;
 }
 
+static int create_lkb(struct dlm_ls *ls, struct dlm_lkb **lkb_ret)
+{
+	return _create_lkb(ls, lkb_ret, 1, 0);
+}
+
 static int find_lkb(struct dlm_ls *ls, uint32_t lkid, struct dlm_lkb **lkb_ret)
 {
 	struct dlm_lkb *lkb;
-- 
2.27.0

