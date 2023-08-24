Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C876787A1C
	for <lists+cluster-devel@lfdr.de>; Thu, 24 Aug 2023 23:20:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692912002;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rSy8KwCzpiP+JPFTKevrMT8rjhUnPLUhYt6dSTNhPkg=;
	b=iYiUmch+3QaMsObbQq7a2ZwGegBtv+MESr//XJA7ppZqsnk3jMq1YGPeoCapFOtf+gQrE0
	piKPLY7SyR1pSYpGzbDZBeHNv4yqol20Ecy3d39VlAurW+NPj269naYY9DY5X9HqIGTZrD
	a1b7ZHFWvqKUnWxj8cdQRo7LTuXZgX4=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-meUp2GRKOciH5e1e-9r3hw-1; Thu, 24 Aug 2023 17:19:55 -0400
X-MC-Unique: meUp2GRKOciH5e1e-9r3hw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 42BD138210AA;
	Thu, 24 Aug 2023 21:19:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 361A140C6F4E;
	Thu, 24 Aug 2023 21:19:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0925319465A8;
	Thu, 24 Aug 2023 21:19:54 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A911E19465B1 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 24 Aug 2023 21:19:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 969F5C1602F; Thu, 24 Aug 2023 21:19:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (unknown [10.45.224.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1837EC1602B;
 Thu, 24 Aug 2023 21:19:52 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Thu, 24 Aug 2023 23:19:44 +0200
Message-Id: <20230824211948.3242607-6-agruenba@redhat.com>
In-Reply-To: <20230824211948.3242607-1-agruenba@redhat.com>
References: <20230824211948.3242607-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Cluster-devel] [PATCH 5/9] gfs2: Use gfs2_qd_dispose in
 gfs2_quota_cleanup
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Change gfs2_quota_cleanup() to move the quota data objects to dispose of
on a dispose list and call gfs2_qd_dispose() on that list, like
gfs2_qd_shrink_scan() does, instead of disposing of the quota data
objects directly.

This may look a bit pointless by itself, but it will make more sense in
combination with a fix that follows.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/quota.c | 26 ++++----------------------
 1 file changed, 4 insertions(+), 22 deletions(-)

diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index f58072efafc9..976bf1097706 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -1459,35 +1459,17 @@ int gfs2_quota_init(struct gfs2_sbd *sdp)
 
 void gfs2_quota_cleanup(struct gfs2_sbd *sdp)
 {
-	struct list_head *head = &sdp->sd_quota_list;
 	struct gfs2_quota_data *qd;
+	LIST_HEAD(dispose);
 
 	spin_lock(&qd_lock);
-	while (!list_empty(head)) {
-		qd = list_last_entry(head, struct gfs2_quota_data, qd_list);
-
-		list_del(&qd->qd_list);
-
-		/* Also remove if this qd exists in the reclaim list */
+	list_for_each_entry(qd, &sdp->sd_quota_list, qd_list) {
 		list_lru_del(&gfs2_qd_lru, &qd->qd_lru);
-		atomic_dec(&sdp->sd_quota_count);
-		spin_unlock(&qd_lock);
-
-		spin_lock_bucket(qd->qd_hash);
-		hlist_bl_del_rcu(&qd->qd_hlist);
-		spin_unlock_bucket(qd->qd_hash);
-
-		gfs2_assert_warn(sdp, !qd->qd_change);
-		gfs2_assert_warn(sdp, !qd->qd_slot_count);
-		gfs2_assert_warn(sdp, !qd->qd_bh_count);
-
-		gfs2_glock_put(qd->qd_gl);
-		call_rcu(&qd->qd_rcu, gfs2_qd_dealloc);
-
-		spin_lock(&qd_lock);
+		list_add(&qd->qd_lru, &dispose);
 	}
 	spin_unlock(&qd_lock);
 
+	gfs2_qd_dispose(&dispose);
 	gfs2_assert_warn(sdp, !atomic_read(&sdp->sd_quota_count));
 
 	kvfree(sdp->sd_quota_bitmap);
-- 
2.40.1

