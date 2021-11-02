Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C38A1443659
	for <lists+cluster-devel@lfdr.de>; Tue,  2 Nov 2021 20:18:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635880688;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YvTosmIxyror0cN9vRElNpuLrHnoIOtlTGAqvcmx54c=;
	b=QWhO1KRJfUiZIiCRpS96aSiX39iUeAC0YoJxXPj5P6OkQX5izh7feplHR9Pux20Sb0Ond9
	E9NfrhpOXb5qCbi0qqSLB95iWvXkUIuAdtsl1iMTNvoz7b3YdvMrFlFO9FPbLTtRCJozuH
	KtGZ823BD+dGn+TwnEj+Yx45Acj+aAM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-jObNL9isMwSZdrwScsHmQw-1; Tue, 02 Nov 2021 15:18:05 -0400
X-MC-Unique: jObNL9isMwSZdrwScsHmQw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2530210A8E00;
	Tue,  2 Nov 2021 19:18:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 139B86418A;
	Tue,  2 Nov 2021 19:18:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D9C8B1819AC2;
	Tue,  2 Nov 2021 19:18:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A2JHswB020700 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 2 Nov 2021 15:17:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C464167842; Tue,  2 Nov 2021 19:17:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 75F79652AC;
	Tue,  2 Nov 2021 19:17:54 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue,  2 Nov 2021 15:17:09 -0400
Message-Id: <20211102191724.210095-4-aahringo@redhat.com>
In-Reply-To: <20211102191724.210095-1-aahringo@redhat.com>
References: <20211102191724.210095-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH RESEND v5.15-rc7 03/18] fs: dlm: debug
	improvements print nodeid
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch improves the debug output for midcomms layer by also printing
out the nodeid where users counter belongs to.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/midcomms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index 7ae39ec8d9b0..008078f06813 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -1231,7 +1231,7 @@ void dlm_midcomms_add_member(int nodeid)
 	}
 
 	node->users++;
-	pr_debug("users inc count %d\n", node->users);
+	pr_debug("node %d users inc count %d\n", nodeid, node->users);
 	spin_unlock(&node->state_lock);
 
 	srcu_read_unlock(&nodes_srcu, idx);
@@ -1254,7 +1254,7 @@ void dlm_midcomms_remove_member(int nodeid)
 
 	spin_lock(&node->state_lock);
 	node->users--;
-	pr_debug("users dec count %d\n", node->users);
+	pr_debug("node %d users dec count %d\n", nodeid, node->users);
 
 	/* hitting users count to zero means the
 	 * other side is running dlm_midcomms_stop()
-- 
2.27.0

