Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3E58C3F34D1
	for <lists+cluster-devel@lfdr.de>; Fri, 20 Aug 2021 21:51:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629489091;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YvTosmIxyror0cN9vRElNpuLrHnoIOtlTGAqvcmx54c=;
	b=P++rt3UcA2xeCweFTDy2bFT21pRXzTIVnMnU3YdlpT/LnJdhz8euTIqxbx5YoLsEB6RVKj
	YL0GiZy6EDjqpvuawteFML7poW7HLskGVVJLUGcyQlfkJfrz5u88tTKiCHgwiF60MalMx5
	K14FhEma2Bpyi2DKWEd6pCLmd6aLQy0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-3tzI4d-7OJKCqg45PHp4xQ-1; Fri, 20 Aug 2021 15:51:30 -0400
X-MC-Unique: 3tzI4d-7OJKCqg45PHp4xQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE5D5760C1;
	Fri, 20 Aug 2021 19:51:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD11E60C9F;
	Fri, 20 Aug 2021 19:51:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 97CFE181A137;
	Fri, 20 Aug 2021 19:51:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17KJpOgq017803 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 20 Aug 2021 15:51:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A565F1893C; Fri, 20 Aug 2021 19:51:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 65B1E1346F;
	Fri, 20 Aug 2021 19:51:24 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 20 Aug 2021 15:51:13 -0400
Message-Id: <20210820195115.1370171-2-aahringo@redhat.com>
In-Reply-To: <20210820195115.1370171-1-aahringo@redhat.com>
References: <20210820195115.1370171-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 1/3] fs: dlm: debug improvements
	print nodeid
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

