Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D02E7C4363
	for <lists+cluster-devel@lfdr.de>; Wed, 11 Oct 2023 00:05:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696975506;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PNDcpeq2zwb1Ai5E4yBf1qdfkoauBsYMo15/py24iVw=;
	b=NhWvVmsc6OVSTVJqjYxptrcYJqFIiUhF9bJ2ci7IKEwumSfOJ6lGSAN6h9qel3RyVGzc/9
	tzpnBUW2R/ZDEEd5QBNJJjAe9Qm/SeBMHxW+97vf7v9/HPZIItbEO0DUE4JbA+QfhP5oz/
	bNtps8Etot20u0zciAtHnrhr3V3jYas=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-qOW7PmKhP9mh_zbBL63F_g-1; Tue, 10 Oct 2023 18:05:01 -0400
X-MC-Unique: qOW7PmKhP9mh_zbBL63F_g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A08563C0BE5A;
	Tue, 10 Oct 2023 22:05:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A0AF76BC0;
	Tue, 10 Oct 2023 22:04:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 73ADA19466DF;
	Tue, 10 Oct 2023 22:04:59 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1C80919466DF for <cluster-devel@listman.corp.redhat.com>;
 Tue, 10 Oct 2023 22:04:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F1F4363F6C; Tue, 10 Oct 2023 22:04:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BEEEE63F45;
 Tue, 10 Oct 2023 22:04:57 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 10 Oct 2023 18:04:44 -0400
Message-Id: <20231010220448.2978176-4-aahringo@redhat.com>
In-Reply-To: <20231010220448.2978176-1-aahringo@redhat.com>
References: <20231010220448.2978176-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Cluster-devel] [PATCH RESEND 4/8] dlm: fix creating multiple node
 structures
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
Cc: cluster-devel@redhat.com, gfs2@lists.linux.dev,
 christophe.jaillet@wanadoo.fr, stable@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch will lookup existing nodes instead of always creating them
when dlm_midcomms_addr() is called. The idea is here to create midcomms
nodes when user space getting informed that nodes joins the cluster. This
is the case when dlm_midcomms_addr() is called, however it can be called
multiple times by user space to add several address configurations to one
node e.g. when using SCTP. Those multiple times need to be filtered out
and we doing that by looking up if the node exists before. Due configfs
entry it is safe that this function gets only called once at a time.

Cc: stable@vger.kernel.org
Fixes: 63e711b08160 ("fs: dlm: create midcomms nodes when configure")
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/midcomms.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index f641b36a36db..455265c6ba53 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -337,13 +337,21 @@ static struct midcomms_node *nodeid2node(int nodeid)
 
 int dlm_midcomms_addr(int nodeid, struct sockaddr_storage *addr, int len)
 {
-	int ret, r = nodeid_hash(nodeid);
+	int ret, idx, r = nodeid_hash(nodeid);
 	struct midcomms_node *node;
 
 	ret = dlm_lowcomms_addr(nodeid, addr, len);
 	if (ret)
 		return ret;
 
+	idx = srcu_read_lock(&nodes_srcu);
+	node = __find_node(nodeid, r);
+	if (node) {
+		srcu_read_unlock(&nodes_srcu, idx);
+		return 0;
+	}
+	srcu_read_unlock(&nodes_srcu, idx);
+
 	node = kmalloc(sizeof(*node), GFP_NOFS);
 	if (!node)
 		return -ENOMEM;
-- 
2.39.3

