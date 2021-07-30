Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 851953DBE17
	for <lists+cluster-devel@lfdr.de>; Fri, 30 Jul 2021 20:08:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627668522;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=k9GlY53GxXVIOI+8XIFw/EmGLn9MmUExgSn0Aj7iNkI=;
	b=NUgKG/swrpO8mFinK9vth4s17LIm0n42ctIAr3BZMw1M0v/e1xMrLuBgrpXgSO4ruk4QYA
	7XTELFxETHRa1CHqQSibkgIKJX4yPR2N51K6mWQAyQVvYzOqgzhhzbEc5oM2KwLtKPta6j
	Jd/sILfSIDW7NDbVot3BBnk+HtfAHJI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-yOXMAm4UOt6Eb8cP8u27mA-1; Fri, 30 Jul 2021 14:08:41 -0400
X-MC-Unique: yOXMAm4UOt6Eb8cP8u27mA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BC40C7400;
	Fri, 30 Jul 2021 18:08:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A98B5D6A1;
	Fri, 30 Jul 2021 18:08:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 17BA34BB7C;
	Fri, 30 Jul 2021 18:08:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16UI1iXQ020800 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 30 Jul 2021 14:01:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BDC365D6BA; Fri, 30 Jul 2021 18:01:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-104.phx2.redhat.com [10.3.112.104])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8C8BA5D6A1
	for <cluster-devel@redhat.com>; Fri, 30 Jul 2021 18:01:40 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 30 Jul 2021 13:01:40 -0500
Message-Id: <20210730180140.427284-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: nit: gfs2_drop_inode shouldn't return
	bool
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

Today, gfs2_drop_inode can return "false" for an int value.
I'm sure this was just an oversight. Change to int value.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 0a5b7dfa7a45..6e00d15ef0a8 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -947,7 +947,7 @@ static int gfs2_drop_inode(struct inode *inode)
 		gfs2_glock_hold(gl);
 		if (!gfs2_queue_delete_work(gl, 0))
 			gfs2_glock_queue_put(gl);
-		return false;
+		return 0;
 	}
 
 	return generic_drop_inode(inode);
-- 
2.31.1

