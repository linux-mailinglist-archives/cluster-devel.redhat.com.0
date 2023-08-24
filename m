Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA90787A1B
	for <lists+cluster-devel@lfdr.de>; Thu, 24 Aug 2023 23:20:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692912001;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EHNXXRpmMyOrl7lgPYID5SrD6VM9rT28X4pbtrhfUbA=;
	b=bWhexNi9CcUeMPSsQHtHMHnmI8WzdIDqrlisn6HYWcZrVeV5sDbq5kxl5sQQ5nvjRtkbKx
	+iC8PKaX7gd3Gw6NgG6w6RuQ1QlusZ8XS03yBfQou0mHl8+ANNWS1/Qg8dqIREOgxcjZsA
	4h+IPbuibtfF67LMAag8CBueKbMge6o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-189-6T8Ik3MeOhKwgQ4sRq5AoQ-1; Thu, 24 Aug 2023 17:19:56 -0400
X-MC-Unique: 6T8Ik3MeOhKwgQ4sRq5AoQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4332E8D40A2;
	Thu, 24 Aug 2023 21:19:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 381E82026D76;
	Thu, 24 Aug 2023 21:19:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 14FE319465A8;
	Thu, 24 Aug 2023 21:19:55 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6B09B1946589 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 24 Aug 2023 21:19:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5BA02C1602F; Thu, 24 Aug 2023 21:19:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (unknown [10.45.224.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D24A8C1602B;
 Thu, 24 Aug 2023 21:19:53 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Thu, 24 Aug 2023 23:19:45 +0200
Message-Id: <20230824211948.3242607-7-agruenba@redhat.com>
In-Reply-To: <20230824211948.3242607-1-agruenba@redhat.com>
References: <20230824211948.3242607-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Cluster-devel] [PATCH 6/9] gfs2: Factor out duplicate quota data
 disposal code
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Rename gfs2_qd_dispose() to gfs2_qd_dispose_list().  Move some code
duplicated in gfs2_qd_dispose_list() and gfs2_quota_cleanup() into a
new gfs2_qd_dispose() function.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/quota.c | 47 ++++++++++++++++++++++++-----------------------
 1 file changed, 24 insertions(+), 23 deletions(-)

diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index 976bf1097706..01fae6b030e9 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -112,35 +112,36 @@ static void gfs2_qd_dealloc(struct rcu_head *rcu)
 	kmem_cache_free(gfs2_quotad_cachep, qd);
 }
 
-static void gfs2_qd_dispose(struct list_head *list)
+static void gfs2_qd_dispose(struct gfs2_quota_data *qd)
 {
-	struct gfs2_quota_data *qd;
-	struct gfs2_sbd *sdp;
+	struct gfs2_sbd *sdp = qd->qd_sbd;
 
-	while (!list_empty(list)) {
-		qd = list_first_entry(list, struct gfs2_quota_data, qd_lru);
-		sdp = qd->qd_sbd;
+	spin_lock(&qd_lock);
+	list_del(&qd->qd_list);
+	spin_unlock(&qd_lock);
 
-		list_del(&qd->qd_lru);
+	spin_lock_bucket(qd->qd_hash);
+	hlist_bl_del_rcu(&qd->qd_hlist);
+	spin_unlock_bucket(qd->qd_hash);
 
-		/* Free from the filesystem-specific list */
-		spin_lock(&qd_lock);
-		list_del(&qd->qd_list);
-		spin_unlock(&qd_lock);
+	gfs2_assert_warn(sdp, !qd->qd_change);
+	gfs2_assert_warn(sdp, !qd->qd_slot_count);
+	gfs2_assert_warn(sdp, !qd->qd_bh_count);
 
-		spin_lock_bucket(qd->qd_hash);
-		hlist_bl_del_rcu(&qd->qd_hlist);
-		spin_unlock_bucket(qd->qd_hash);
+	gfs2_glock_put(qd->qd_gl);
+	call_rcu(&qd->qd_rcu, gfs2_qd_dealloc);
+}
 
-		gfs2_assert_warn(sdp, !qd->qd_change);
-		gfs2_assert_warn(sdp, !qd->qd_slot_count);
-		gfs2_assert_warn(sdp, !qd->qd_bh_count);
+static void gfs2_qd_list_dispose(struct list_head *list)
+{
+	struct gfs2_quota_data *qd;
 
-		gfs2_glock_put(qd->qd_gl);
-		atomic_dec(&sdp->sd_quota_count);
+	while (!list_empty(list)) {
+		qd = list_first_entry(list, struct gfs2_quota_data, qd_lru);
+		list_del(&qd->qd_lru);
 
-		/* Delete it from the common reclaim list */
-		call_rcu(&qd->qd_rcu, gfs2_qd_dealloc);
+		gfs2_qd_dispose(qd);
+		atomic_dec(&sdp->sd_quota_count);
 	}
 }
 
@@ -179,7 +180,7 @@ static unsigned long gfs2_qd_shrink_scan(struct shrinker *shrink,
 	freed = list_lru_shrink_walk(&gfs2_qd_lru, sc,
 				     gfs2_qd_isolate, &dispose);
 
-	gfs2_qd_dispose(&dispose);
+	gfs2_qd_list_dispose(&dispose);
 
 	return freed;
 }
@@ -1469,7 +1470,7 @@ void gfs2_quota_cleanup(struct gfs2_sbd *sdp)
 	}
 	spin_unlock(&qd_lock);
 
-	gfs2_qd_dispose(&dispose);
+	gfs2_qd_list_dispose(&dispose);
 	gfs2_assert_warn(sdp, !atomic_read(&sdp->sd_quota_count));
 
 	kvfree(sdp->sd_quota_bitmap);
-- 
2.40.1

