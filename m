Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F18787A19
	for <lists+cluster-devel@lfdr.de>; Thu, 24 Aug 2023 23:19:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692911997;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wX1glHeestwKxx3Y5Susb5t1EZNGYaN+mlQjyVqw+a8=;
	b=FNST4WAqvGD6hbD97YiSLEWtDtirUAXXC3OG7LgSjCfPF8RESRoHNMpR89se8Xoelrxqva
	1phuYyCkMaSo1in6wwKqJhAcs64JUbohfD7nKmbTVdPoDjjAS0vqGg+vUELabs4yS0w3gv
	bz20hNS9lt70tL5cYXzrgY4sJnbnzNk=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-GRWV580DO4WeBU9V7s3sjg-1; Thu, 24 Aug 2023 17:19:55 -0400
X-MC-Unique: GRWV580DO4WeBU9V7s3sjg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE04D2823818;
	Thu, 24 Aug 2023 21:19:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AEA722166B26;
	Thu, 24 Aug 2023 21:19:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7B47019465B1;
	Thu, 24 Aug 2023 21:19:54 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DCD901946589 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 24 Aug 2023 21:19:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CEC72C16030; Thu, 24 Aug 2023 21:19:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (unknown [10.45.224.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 509B2C1602B;
 Thu, 24 Aug 2023 21:19:52 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Thu, 24 Aug 2023 23:19:43 +0200
Message-Id: <20230824211948.3242607-5-agruenba@redhat.com>
In-Reply-To: <20230824211948.3242607-1-agruenba@redhat.com>
References: <20230824211948.3242607-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Cluster-devel] [PATCH 4/9] gfs2: Fix wrong quota shrinker return
 value
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Function gfs2_qd_isolate must only return LRU_REMOVED when removing the
item from the lru list; otherwise, the number of items on the list will
go wrong.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/quota.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index 48b9fbffe260..f58072efafc9 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -149,18 +149,22 @@ static enum lru_status gfs2_qd_isolate(struct list_head *item,
 		struct list_lru_one *lru, spinlock_t *lru_lock, void *arg)
 {
 	struct list_head *dispose = arg;
-	struct gfs2_quota_data *qd = list_entry(item, struct gfs2_quota_data, qd_lru);
+	struct gfs2_quota_data *qd =
+		list_entry(item, struct gfs2_quota_data, qd_lru);
+	enum lru_status status;
 
 	if (!spin_trylock(&qd->qd_lockref.lock))
 		return LRU_SKIP;
 
+	status = LRU_SKIP;
 	if (qd->qd_lockref.count == 0) {
 		lockref_mark_dead(&qd->qd_lockref);
 		list_lru_isolate_move(lru, &qd->qd_lru, dispose);
+		status = LRU_REMOVED;
 	}
 
 	spin_unlock(&qd->qd_lockref.lock);
-	return LRU_REMOVED;
+	return status;
 }
 
 static unsigned long gfs2_qd_shrink_scan(struct shrinker *shrink,
-- 
2.40.1

