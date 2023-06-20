Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 148BC736E8E
	for <lists+cluster-devel@lfdr.de>; Tue, 20 Jun 2023 16:22:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687270940;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0ernhwPaP6FSJ+kstqzHO13IrHrywXGZE43s/6KXwas=;
	b=XR9lREtUIltyEYoWvuChZNmnLpZVYR51EKb7lAp8m+naNnsVWwnSteJBtvLzNfy6NzNygy
	i3D8ChCTnne2horxi8NcOUf6IkKEIjOc8s3n/TF6P4FTP9z7jakHiF6WgB8Iyp0yOk3sKU
	kZ4fNvGksxIPs7U1jVIZbN74X3UmaFg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-574-ICCD2yNpMBSYoRV2ntjVSA-1; Tue, 20 Jun 2023 10:21:40 -0400
X-MC-Unique: ICCD2yNpMBSYoRV2ntjVSA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 695CD8FF67E;
	Tue, 20 Jun 2023 14:16:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DFCED112132E;
	Tue, 20 Jun 2023 14:16:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6B714194658C;
	Tue, 20 Jun 2023 14:16:02 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3CE851946586 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 20 Jun 2023 14:15:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A55DA425356; Tue, 20 Jun 2023 14:15:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 77883492C13;
 Tue, 20 Jun 2023 14:15:59 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 20 Jun 2023 10:15:57 -0400
Message-Id: <20230620141557.2952429-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [Cluster-devel] [PATCHv2 dlm/next] fs: dlm: remove filter local
 comms on close
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
Cc: cluster-devel@redhat.com, stable@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The current way how lowcomms is configured is due configfs entries. Each
comms configfs entry will create a lowcomms connection. Even the local
connection itself will be stored as a lowcomms connection, although most
functionality for a local lowcomms connection struct is not necessary.

Now in some scenarios we will see that dlm_controld reports a -EEXIST
when configure a node via configfs:

... /sys/kernel/config/dlm/cluster/comms/1/addr: write failed: 17 -1

Doing a:

cat /sys/kernel/config/dlm/cluster/comms/1/addr_list

reported nothing. This was being seen on cluster with nodeid 1 and it's
local configuration. To be sure the configfs entries are in sync with
lowcomms connection structures we always call dlm_midcomms_close() to be
sure the lowcomms connection gets removed when the configfs entry gets
dropped.

Before commit 07ee38674a0b ("fs: dlm: filter ourself midcomms calls") it
was just doing this by accident and the filter by doing:

if (nodeid == dlm_our_nodeid())
	return 0;

inside dlm_midcomms_close() was never been hit because drop_comm() sets
local_comm to NULL and cause that dlm_our_nodeid() returns always the
invalid nodeid 0.

Fixes: 07ee38674a0b ("fs: dlm: filter ourself midcomms calls")
Cc: stable@vger.kernel.org
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
changes since v2:
 - add fixes tag
 - cc stable

 fs/dlm/config.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/dlm/config.c b/fs/dlm/config.c
index 4246cd425671..2beceff024e3 100644
--- a/fs/dlm/config.c
+++ b/fs/dlm/config.c
@@ -532,8 +532,7 @@ static void drop_comm(struct config_group *g, struct config_item *i)
 	struct dlm_comm *cm = config_item_to_comm(i);
 	if (local_comm == cm)
 		local_comm = NULL;
-	if (!cm->local)
-		dlm_midcomms_close(cm->nodeid);
+	dlm_midcomms_close(cm->nodeid);
 	while (cm->addr_count--)
 		kfree(cm->addr[cm->addr_count]);
 	config_item_put(i);
-- 
2.31.1

