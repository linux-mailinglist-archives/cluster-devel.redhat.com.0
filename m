Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E62FD44ED99
	for <lists+cluster-devel@lfdr.de>; Fri, 12 Nov 2021 20:52:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636746740;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uhpu5a0AbIcAq8UHEbSibj5NkMyVkpUxMRE3QLpfs3c=;
	b=ZKVzwGS0hrvE2qMEBq8SqnUfXwy34XKOD6r7GV2auBpOD+S75ONp9QYwgs55Y2uqG/oji4
	aFJhPWc+Q4/5ma1LXEeRx+pdnblsbigjaS6DQr3jS1ARwiM6aVyBybfXSbIvig7lG0OSe7
	5Yh4lLXRjSZXda3JRl/MkF+/2iTKSL4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-vmH_NkxANDKmi1Z-OStsqQ-1; Fri, 12 Nov 2021 14:52:16 -0500
X-MC-Unique: vmH_NkxANDKmi1Z-OStsqQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0208B87D548;
	Fri, 12 Nov 2021 19:52:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E5CD857CAD;
	Fri, 12 Nov 2021 19:52:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9505B4E58F;
	Fri, 12 Nov 2021 19:52:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1ACJq7rk007823 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 12 Nov 2021 14:52:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5EE2019723; Fri, 12 Nov 2021 19:52:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-145.phx2.redhat.com [10.3.112.145])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2DC9719D9F
	for <cluster-devel@redhat.com>; Fri, 12 Nov 2021 19:52:07 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 12 Nov 2021 13:52:06 -0600
Message-Id: <20211112195206.240632-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: remove redundant set of
	INSTANTIATE_NEEDED
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Function rgrp_go_inval calls gfs2_rgrp_brelse to invalidate the
in-core rgrp structures. After the call it set GLF_INSTANTIATE_NEEDED,
which is redundant, since gfs2_rgrp_brelse also sets it.
This patch simply removes the redundant set_bit.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glops.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 650ad77c4d0b..e054ddae7834 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -228,7 +228,6 @@ static void rgrp_go_inval(struct gfs2_glock *gl, int flags)
 	gfs2_rgrp_brelse(rgd);
 	WARN_ON_ONCE(!(flags & DIO_METADATA));
 	truncate_inode_pages_range(mapping, start, end);
-	set_bit(GLF_INSTANTIATE_NEEDED, &gl->gl_flags);
 }
 
 static void gfs2_rgrp_go_dump(struct seq_file *seq, struct gfs2_glock *gl,
-- 
2.33.1

