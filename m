Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DD7787A1D
	for <lists+cluster-devel@lfdr.de>; Thu, 24 Aug 2023 23:20:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692912003;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6znAuAFj83Rg+T7LFDEbiCEJAuxrLS48ObaY4VxeHE4=;
	b=bCp3hdxMy49PlrlErDaNEuYsw1YhxUUbC7mEHU07n8LUe+0l5vsG1OiL31Ly900qj8E13z
	eE9UhutuRxxOeQYl4zJ22pWPUjpsgDtY2KBKm2gNpWE3I1QaXXzD3kZUDj2LXJOQkREZHJ
	vjqfS8mJpN0SDNP006I1/PGs9zmn8y0=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-343-Xpkh9dOPPHuoiKLr3zYunA-1; Thu, 24 Aug 2023 17:19:58 -0400
X-MC-Unique: Xpkh9dOPPHuoiKLr3zYunA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D4C893C11CD3;
	Thu, 24 Aug 2023 21:19:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C8AF01121320;
	Thu, 24 Aug 2023 21:19:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 86F9919465A8;
	Thu, 24 Aug 2023 21:19:56 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3B1831946589 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 24 Aug 2023 21:19:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 20614C1602E; Thu, 24 Aug 2023 21:19:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (unknown [10.45.224.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9710FC1602B;
 Thu, 24 Aug 2023 21:19:54 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Thu, 24 Aug 2023 23:19:46 +0200
Message-Id: <20230824211948.3242607-8-agruenba@redhat.com>
In-Reply-To: <20230824211948.3242607-1-agruenba@redhat.com>
References: <20230824211948.3242607-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Cluster-devel] [PATCH 7/9] gfs2: No more quota complaints after
 withdraw
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Once a filesystem is withdrawn, don't complain about quota changes
that can't be synced to the main quota file anymore.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/quota.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index 01fae6b030e9..fccdb22980e8 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -124,9 +124,11 @@ static void gfs2_qd_dispose(struct gfs2_quota_data *qd)
 	hlist_bl_del_rcu(&qd->qd_hlist);
 	spin_unlock_bucket(qd->qd_hash);
 
-	gfs2_assert_warn(sdp, !qd->qd_change);
-	gfs2_assert_warn(sdp, !qd->qd_slot_count);
-	gfs2_assert_warn(sdp, !qd->qd_bh_count);
+	if (!gfs2_withdrawn(sdp)) {
+		gfs2_assert_warn(sdp, !qd->qd_change);
+		gfs2_assert_warn(sdp, !qd->qd_slot_count);
+		gfs2_assert_warn(sdp, !qd->qd_bh_count);
+	}
 
 	gfs2_glock_put(qd->qd_gl);
 	call_rcu(&qd->qd_rcu, gfs2_qd_dealloc);
-- 
2.40.1

