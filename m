Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0187654D9
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Jul 2023 15:23:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690464198;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hYBb0GtKgZxNZTgqR6xIFWrR0DzIkwnxjPcYFDEzeD8=;
	b=SHBf8rnRGrefNzbP2vC7jiEPYhVdV/o5ZpKoDeopSlCEN9W2t1yQHVbawhn8tUauyURnI1
	7iMvEKnbvHVZqD9qBg9DF+RhbsqmsOSwFHAaGf1EwZ/3T81rBgfXJHJk2r20mkxZ2r5EPz
	aU+T9NZC45vREBTh0AMSrlqaPc+eWuY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-qlNla3QJMoGYf-_HWsazLQ-1; Thu, 27 Jul 2023 09:23:14 -0400
X-MC-Unique: qlNla3QJMoGYf-_HWsazLQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E00F483FC20;
	Thu, 27 Jul 2023 13:23:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D45FEC57965;
	Thu, 27 Jul 2023 13:23:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5329E19452C5;
	Thu, 27 Jul 2023 13:23:11 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E0AEB1946A72 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 27 Jul 2023 13:23:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C5E1C4094DC3; Thu, 27 Jul 2023 13:23:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A42944094DC0;
 Thu, 27 Jul 2023 13:23:09 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 27 Jul 2023 09:22:57 -0400
Message-Id: <20230727132303.3352514-7-aahringo@redhat.com>
In-Reply-To: <20230727132303.3352514-1-aahringo@redhat.com>
References: <20230727132303.3352514-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Cluster-devel] [PATCH dlm-next 07/13] fs: dlm: cleanup lock order
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
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch cleanups the lock order to hold at first the close_lock and
then held the nodes_srcu read lock. Probably it will never be a problem
as nodes_srcu is only a read lock preventing the node pointer getting
freed.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/midcomms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index e1a0df67b566..8ebffbfdc00a 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -1489,12 +1489,12 @@ int dlm_midcomms_close(int nodeid)
 
 	synchronize_srcu(&nodes_srcu);
 
-	idx = srcu_read_lock(&nodes_srcu);
 	mutex_lock(&close_lock);
+	idx = srcu_read_lock(&nodes_srcu);
 	node = nodeid2node(nodeid, 0);
 	if (!node) {
-		mutex_unlock(&close_lock);
 		srcu_read_unlock(&nodes_srcu, idx);
+		mutex_unlock(&close_lock);
 		return dlm_lowcomms_close(nodeid);
 	}
 
-- 
2.31.1

