Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A201576BC20
	for <lists+cluster-devel@lfdr.de>; Tue,  1 Aug 2023 20:17:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690913843;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hYBb0GtKgZxNZTgqR6xIFWrR0DzIkwnxjPcYFDEzeD8=;
	b=QyP6DZ9XlVGQhdjXowsoF7L/WRPBPfnmQLpNlSoUIEBO0svoIK3FIXXRbqKnVynayyB+Tx
	3YcRelCouns0kTQqUbuDCVdCFSADcjxGT2aDUJTEDGl0zZjG9L6hIn+9I8as/rb42ekSYJ
	zBg+HMzN5381ksRzv1NvmQqBKG6tapY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-689-f-DoXyCMMoutN6hshc6ARw-1; Tue, 01 Aug 2023 14:17:17 -0400
X-MC-Unique: f-DoXyCMMoutN6hshc6ARw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39A31830EFC;
	Tue,  1 Aug 2023 18:17:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2DF6C4021521;
	Tue,  1 Aug 2023 18:17:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 064271947209;
	Tue,  1 Aug 2023 18:17:16 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 681AA1947213 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  1 Aug 2023 18:10:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 72736112132D; Tue,  1 Aug 2023 18:09:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4CA9D1121325;
 Tue,  1 Aug 2023 18:09:55 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue,  1 Aug 2023 14:09:44 -0400
Message-Id: <20230801180950.3693180-8-aahringo@redhat.com>
In-Reply-To: <20230801180950.3693180-1-aahringo@redhat.com>
References: <20230801180950.3693180-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [PATCHv2 dlm-next 07/13] fs: dlm: cleanup lock order
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

