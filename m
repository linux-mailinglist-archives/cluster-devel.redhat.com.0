Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A9C7A2B07FE
	for <lists+cluster-devel@lfdr.de>; Thu, 12 Nov 2020 16:00:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605193199;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=166PnEOO0cI5OsgcvnPT+NELxLwbuoF4H/8eE2mbINE=;
	b=hrLNybz5zkKrUfy7o2k0Eq1L6OuWkxC6ScFLx5jWjI8n4nNGx0f/Sn8tk/om3OrUha9Pr8
	tjFJzDvY5yIFJ12yS9L2xLKI2h803VsaWAEZrT3WbGSX/1QsAiPs9gNngs4528xemWpLdk
	33uIJ5KRXiP62vEnNx+7hY1bejPe1t0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-nmUEumxqO8OWUtBG07e2JA-1; Thu, 12 Nov 2020 09:59:57 -0500
X-MC-Unique: nmUEumxqO8OWUtBG07e2JA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D634A101F7B4;
	Thu, 12 Nov 2020 14:59:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C53FC62A14;
	Thu, 12 Nov 2020 14:59:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A73FD181A050;
	Thu, 12 Nov 2020 14:59:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ACEvmlw021288 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 12 Nov 2020 09:57:48 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 09C1027CC8; Thu, 12 Nov 2020 14:57:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-113-10.phx2.redhat.com [10.3.113.10])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CE76027BA5
	for <cluster-devel@redhat.com>; Thu, 12 Nov 2020 14:57:47 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 12 Nov 2020 08:57:42 -0600
Message-Id: <20201112145743.376789-2-rpeterso@redhat.com>
In-Reply-To: <20201112145743.376789-1-rpeterso@redhat.com>
References: <20201112145743.376789-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 1/2] Revert "gfs2: Ignore journal log
	writes for jdata holes"
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
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

This reverts commit b2a846dbef4ef54ef032f0f5ee188c609a0278a7.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/bmap.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 8dff9cbd0a87..62d9081d1e26 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -1301,12 +1301,8 @@ int gfs2_block_map(struct inode *inode, sector_t lblock,
 	trace_gfs2_bmap(ip, bh_map, lblock, create, 1);
 
 	ret = gfs2_iomap_get(inode, pos, length, flags, &iomap, &mp);
-	if (!ret && iomap.type == IOMAP_HOLE) {
-		if (create)
-			ret = gfs2_iomap_alloc(inode, &iomap, &mp);
-		else
-			ret = -ENODATA;
-	}
+	if (create && !ret && iomap.type == IOMAP_HOLE)
+		ret = gfs2_iomap_alloc(inode, &iomap, &mp);
 	release_metapath(&mp);
 	if (ret)
 		goto out;
-- 
2.26.2

