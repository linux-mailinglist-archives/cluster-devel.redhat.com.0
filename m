Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 25C8724DE8D
	for <lists+cluster-devel@lfdr.de>; Fri, 21 Aug 2020 19:34:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598031240;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XB9nX+IVoJhg8Mb2m7MWwfYqYvTCXk+p+SiE2FKDyeE=;
	b=O2zd0mGT9fMWKKvT/El1UNoEwQ5LXo2zgirXp01MxZBHOhQECxN5FHTbS1GNG7DS3F51Hx
	1NzhgsKbTbZrDAom09gIVR37sjql74/n2vXmL4BclKOWVaD3xMuCEl7tkR8+KbaEaDwiyT
	sek6mEV5iJVhjY6Iku5RpfDCMKpJXNg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-yBy7r-1KOMquSPBDWrOYHw-1; Fri, 21 Aug 2020 13:33:58 -0400
X-MC-Unique: yBy7r-1KOMquSPBDWrOYHw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF2B883DC6E;
	Fri, 21 Aug 2020 17:33:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AEC5310098AE;
	Fri, 21 Aug 2020 17:33:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9B818662C8;
	Fri, 21 Aug 2020 17:33:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07LHXiYl028437 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 21 Aug 2020 13:33:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BC85E5DA75; Fri, 21 Aug 2020 17:33:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-102.phx2.redhat.com [10.3.112.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 89CBF5DA74
	for <cluster-devel@redhat.com>; Fri, 21 Aug 2020 17:33:44 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 21 Aug 2020 12:33:35 -0500
Message-Id: <20200821173337.20377-11-rpeterso@redhat.com>
In-Reply-To: <20200821173337.20377-1-rpeterso@redhat.com>
References: <20200821173337.20377-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 10/12] gfs2: simplify gfs2_block_map
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Function gfs2_block_map had a lot of redundancy between its create and
no_create paths. This patch simplifies the code to eliminate the redundancy.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/bmap.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 6d2ea788d0a1..67aff327bf38 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -1291,6 +1291,7 @@ int gfs2_block_map(struct inode *inode, sector_t lblock,
 	loff_t length = bh_map->b_size;
 	struct metapath mp = { .mp_aheight = 1, };
 	struct iomap iomap = { };
+	int flags = create ? IOMAP_WRITE : 0;
 	int ret;
 
 	clear_buffer_mapped(bh_map);
@@ -1298,15 +1299,10 @@ int gfs2_block_map(struct inode *inode, sector_t lblock,
 	clear_buffer_boundary(bh_map);
 	trace_gfs2_bmap(ip, bh_map, lblock, create, 1);
 
-	if (create) {
-		ret = gfs2_iomap_get(inode, pos, length, IOMAP_WRITE, &iomap, &mp);
-		if (!ret && iomap.type == IOMAP_HOLE)
-			ret = gfs2_iomap_alloc(inode, &iomap, &mp);
-		release_metapath(&mp);
-	} else {
-		ret = gfs2_iomap_get(inode, pos, length, 0, &iomap, &mp);
-		release_metapath(&mp);
-	}
+	ret = gfs2_iomap_get(inode, pos, length, flags, &iomap, &mp);
+	if (create && !ret && iomap.type == IOMAP_HOLE)
+		ret = gfs2_iomap_alloc(inode, &iomap, &mp);
+	release_metapath(&mp);
 	if (ret)
 		goto out;
 
-- 
2.26.2

