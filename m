Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED05443662
	for <lists+cluster-devel@lfdr.de>; Tue,  2 Nov 2021 20:18:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635880691;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eQLHExDqDyruW/F8D2h4DsQW2EshzxaANjW/Ihkp1Ow=;
	b=TL77m4THt/LNuHTJOq9bgiMCfwoocXl69LnTUZ14sWpe5Z0GfwPS7gcjrWGbhIg6x2wUzU
	iIjuDMakwIvx3WJH9uJJnH+HjzFw675KORfcHKHn4LgC4j+29QYSwoIot4motIyZupxBYK
	ro+sJ57lwWaWNuOdXEXkhbyBFbqpvhU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-giKqivokNvG1fC_0jDXEhw-1; Tue, 02 Nov 2021 15:18:08 -0400
X-MC-Unique: giKqivokNvG1fC_0jDXEhw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 335C28042E1;
	Tue,  2 Nov 2021 19:18:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 260C52271F;
	Tue,  2 Nov 2021 19:18:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 76D6B1832DD2;
	Tue,  2 Nov 2021 19:18:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A2JI0OR020807 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 2 Nov 2021 15:18:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0AD9C652AC; Tue,  2 Nov 2021 19:18:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B0CAF57CD3;
	Tue,  2 Nov 2021 19:17:59 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue,  2 Nov 2021 15:17:21 -0400
Message-Id: <20211102191724.210095-16-aahringo@redhat.com>
In-Reply-To: <20211102191724.210095-1-aahringo@redhat.com>
References: <20211102191724.210095-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH RESEND v5.15-rc7 15/18] fs: dlm: allow
	create lkb with specific id range
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

This patch adds functionality to add a lkb with a specific id range.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lock.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index feb2e94f5879..8b30c9d9e545 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -1180,7 +1180,8 @@ static void detach_lkb(struct dlm_lkb *lkb)
 	}
 }
 
-static int create_lkb(struct dlm_ls *ls, struct dlm_lkb **lkb_ret)
+static int _create_lkb(struct dlm_ls *ls, struct dlm_lkb **lkb_ret,
+		       int start, int end)
 {
 	struct dlm_lkb *lkb;
 	int rv;
@@ -1201,7 +1202,7 @@ static int create_lkb(struct dlm_ls *ls, struct dlm_lkb **lkb_ret)
 
 	idr_preload(GFP_NOFS);
 	spin_lock(&ls->ls_lkbidr_spin);
-	rv = idr_alloc(&ls->ls_lkbidr, lkb, 1, 0, GFP_NOWAIT);
+	rv = idr_alloc(&ls->ls_lkbidr, lkb, start, end, GFP_NOWAIT);
 	if (rv >= 0)
 		lkb->lkb_id = rv;
 	spin_unlock(&ls->ls_lkbidr_spin);
@@ -1217,6 +1218,11 @@ static int create_lkb(struct dlm_ls *ls, struct dlm_lkb **lkb_ret)
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

