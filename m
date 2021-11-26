Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F3A45E57E
	for <lists+cluster-devel@lfdr.de>; Fri, 26 Nov 2021 03:44:37 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-249-CyoNdKKwPCChND3Eyy3d-g-1; Thu, 25 Nov 2021 21:44:34 -0500
X-MC-Unique: CyoNdKKwPCChND3Eyy3d-g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8162C2E69;
	Fri, 26 Nov 2021 02:44:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A8CD10001AF;
	Fri, 26 Nov 2021 02:44:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B89A41809C87;
	Fri, 26 Nov 2021 02:44:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AQ2hhml030870 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 25 Nov 2021 21:43:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E1DA3404727D; Fri, 26 Nov 2021 02:43:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DDBB14047272
	for <cluster-devel@redhat.com>; Fri, 26 Nov 2021 02:43:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C0DAA823F8D
	for <cluster-devel@redhat.com>; Fri, 26 Nov 2021 02:43:42 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-319-L2h0wTL8PP2gjVpNdnHbTw-1; Thu, 25 Nov 2021 21:43:40 -0500
X-MC-Unique: L2h0wTL8PP2gjVpNdnHbTw-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id A217261177;
	Fri, 26 Nov 2021 02:31:57 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Thu, 25 Nov 2021 21:31:18 -0500
Message-Id: <20211126023156.441292-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH AUTOSEL 5.15 01/39] gfs2: release iopen
	glock early in evict
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Bob Peterson <rpeterso@redhat.com>

[ Upstream commit 49462e2be119d38c5eb5759d0d1b712df3a41239 ]

Before this patch, evict would clear the iopen glock's gl_object after
releasing the inode glock.  In the meantime, another process could reuse
the same block and thus glocks for a new inode.  It would lock the inode
glock (exclusively), and then the iopen glock (shared).  The shared
locking mode doesn't provide any ordering against the evict, so by the
time the iopen glock is reused, evict may not have gotten to setting
gl_object to NULL.

Fix that by releasing the iopen glock before the inode glock in
gfs2_evict_inode.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>gl_object
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/gfs2/super.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 6e00d15ef0a82..cc51b5f5f52d8 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1402,13 +1402,6 @@ static void gfs2_evict_inode(struct inode *inode)
 	gfs2_ordered_del_inode(ip);
 	clear_inode(inode);
 	gfs2_dir_hash_inval(ip);
-	if (ip->i_gl) {
-		glock_clear_object(ip->i_gl, ip);
-		wait_on_bit_io(&ip->i_flags, GIF_GLOP_PENDING, TASK_UNINTERRUPTIBLE);
-		gfs2_glock_add_to_lru(ip->i_gl);
-		gfs2_glock_put_eventually(ip->i_gl);
-		ip->i_gl = NULL;
-	}
 	if (gfs2_holder_initialized(&ip->i_iopen_gh)) {
 		struct gfs2_glock *gl = ip->i_iopen_gh.gh_gl;
 
@@ -1421,6 +1414,13 @@ static void gfs2_evict_inode(struct inode *inode)
 		gfs2_holder_uninit(&ip->i_iopen_gh);
 		gfs2_glock_put_eventually(gl);
 	}
+	if (ip->i_gl) {
+		glock_clear_object(ip->i_gl, ip);
+		wait_on_bit_io(&ip->i_flags, GIF_GLOP_PENDING, TASK_UNINTERRUPTIBLE);
+		gfs2_glock_add_to_lru(ip->i_gl);
+		gfs2_glock_put_eventually(ip->i_gl);
+		ip->i_gl = NULL;
+	}
 }
 
 static struct inode *gfs2_alloc_inode(struct super_block *sb)
-- 
2.33.0

