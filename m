Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C05D74986BD
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Jan 2022 18:28:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643045302;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FfyHBA7TBvOqZ4ya4+yQO3vwde7O5VCVEVm9JXL/Pyk=;
	b=g9sJk15+yHkLJt7lKu++FYh5vRIAgHSaFMBe7MJJQZ3jrUlcPGRDijlKxP1p3Kt4rNE8WS
	HpLgqDK6Jg8dFL4DNVzfjTOrzOKoeka/bT0IP1OY2NEXv1vQ5qUKGe7/1yBIHWyVTwSGkA
	c0pdtkLt0mz2TrGUL2bTzTcdEkfBBNg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-cNJYS2eGO_uUhDpZFpbEcA-1; Mon, 24 Jan 2022 12:28:19 -0500
X-MC-Unique: cNJYS2eGO_uUhDpZFpbEcA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F22D7100CCC1;
	Mon, 24 Jan 2022 17:28:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A6EAB62D64;
	Mon, 24 Jan 2022 17:28:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E53831806D1C;
	Mon, 24 Jan 2022 17:28:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20OHO3he030466 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 24 Jan 2022 12:24:03 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3D1FF77451; Mon, 24 Jan 2022 17:24:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (unknown [10.2.16.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EA0957744E
	for <cluster-devel@redhat.com>; Mon, 24 Jan 2022 17:24:02 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 24 Jan 2022 12:23:57 -0500
Message-Id: <20220124172357.554689-4-rpeterso@redhat.com>
In-Reply-To: <20220124172357.554689-1-rpeterso@redhat.com>
References: <20220124172357.554689-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 3/3] gfs2: Switch lock order of inode
	and iopen glock
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

From: Andreas Gruenbacher <agruenba@redhat.com>

This patch tries to fix the continual ABBA deadlocks we keep having
between the iopen and inode glocks. This switches the lock order in
gfs2_inode_lookup and gfs2_create_inode so the iopen glock is always
locked first.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/inode.c | 49 +++++++++++++++++++++++++++----------------------
 1 file changed, 27 insertions(+), 22 deletions(-)

diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index 89905f4f29bb..b30ff50d17f3 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -131,7 +131,21 @@ struct inode *gfs2_inode_lookup(struct super_block *sb, unsigned int type,
 		struct gfs2_sbd *sdp = GFS2_SB(inode);
 		struct gfs2_glock *io_gl;
 
-		error = gfs2_glock_get(sdp, no_addr, &gfs2_inode_glops, CREATE, &ip->i_gl);
+		error = gfs2_glock_get(sdp, no_addr, &gfs2_inode_glops, CREATE,
+				       &ip->i_gl);
+		if (unlikely(error))
+			goto fail;
+
+		error = gfs2_glock_get(sdp, no_addr, &gfs2_iopen_glops, CREATE,
+				       &io_gl);
+		if (unlikely(error))
+			goto fail;
+
+		if (blktype != GFS2_BLKST_UNLINKED)
+			gfs2_cancel_delete_work(io_gl);
+		error = gfs2_glock_nq_init(io_gl, LM_ST_SHARED, GL_EXACT,
+					   &ip->i_iopen_gh);
+		gfs2_glock_put(io_gl);
 		if (unlikely(error))
 			goto fail;
 
@@ -161,16 +175,6 @@ struct inode *gfs2_inode_lookup(struct super_block *sb, unsigned int type,
 
 		set_bit(GLF_INSTANTIATE_NEEDED, &ip->i_gl->gl_flags);
 
-		error = gfs2_glock_get(sdp, no_addr, &gfs2_iopen_glops, CREATE, &io_gl);
-		if (unlikely(error))
-			goto fail;
-		if (blktype != GFS2_BLKST_UNLINKED)
-			gfs2_cancel_delete_work(io_gl);
-		error = gfs2_glock_nq_init(io_gl, LM_ST_SHARED, GL_EXACT, &ip->i_iopen_gh);
-		gfs2_glock_put(io_gl);
-		if (unlikely(error))
-			goto fail;
-
 		/* Lowest possible timestamp; will be overwritten in gfs2_dinode_in. */
 		inode->i_atime.tv_sec = 1LL << (8 * sizeof(inode->i_atime.tv_sec) - 1);
 		inode->i_atime.tv_nsec = 0;
@@ -716,13 +720,17 @@ static int gfs2_create_inode(struct inode *dir, struct dentry *dentry,
 	error = insert_inode_locked4(inode, ip->i_no_addr, iget_test, &ip->i_no_addr);
 	BUG_ON(error);
 
-	error = gfs2_glock_nq_init(ip->i_gl, LM_ST_EXCLUSIVE, GL_SKIP, ghs + 1);
+	error = gfs2_glock_nq_init(io_gl, LM_ST_SHARED, GL_EXACT, &ip->i_iopen_gh);
 	if (error)
 		goto fail_gunlock2;
 
+	error = gfs2_glock_nq_init(ip->i_gl, LM_ST_EXCLUSIVE, GL_SKIP, ghs + 1);
+	if (error)
+		goto fail_gunlock3;
+
 	error = gfs2_trans_begin(sdp, blocks, 0);
 	if (error)
-		goto fail_gunlock2;
+		goto fail_gunlock3;
 
 	if (blocks > 1) {
 		ip->i_eattr = ip->i_no_addr + 1;
@@ -731,10 +739,6 @@ static int gfs2_create_inode(struct inode *dir, struct dentry *dentry,
 	init_dinode(dip, ip, symname);
 	gfs2_trans_end(sdp);
 
-	error = gfs2_glock_nq_init(io_gl, LM_ST_SHARED, GL_EXACT, &ip->i_iopen_gh);
-	if (error)
-		goto fail_gunlock2;
-
 	glock_set_object(ip->i_gl, ip);
 	glock_set_object(io_gl, ip);
 	gfs2_set_iop(inode);
@@ -745,14 +749,14 @@ static int gfs2_create_inode(struct inode *dir, struct dentry *dentry,
 	if (default_acl) {
 		error = __gfs2_set_acl(inode, default_acl, ACL_TYPE_DEFAULT);
 		if (error)
-			goto fail_gunlock3;
+			goto fail_gunlock4;
 		posix_acl_release(default_acl);
 		default_acl = NULL;
 	}
 	if (acl) {
 		error = __gfs2_set_acl(inode, acl, ACL_TYPE_ACCESS);
 		if (error)
-			goto fail_gunlock3;
+			goto fail_gunlock4;
 		posix_acl_release(acl);
 		acl = NULL;
 	}
@@ -760,11 +764,11 @@ static int gfs2_create_inode(struct inode *dir, struct dentry *dentry,
 	error = security_inode_init_security(&ip->i_inode, &dip->i_inode, name,
 					     &gfs2_initxattrs, NULL);
 	if (error)
-		goto fail_gunlock3;
+		goto fail_gunlock4;
 
 	error = link_dinode(dip, name, ip, &da);
 	if (error)
-		goto fail_gunlock3;
+		goto fail_gunlock4;
 
 	mark_inode_dirty(inode);
 	d_instantiate(dentry, inode);
@@ -782,9 +786,10 @@ static int gfs2_create_inode(struct inode *dir, struct dentry *dentry,
 	unlock_new_inode(inode);
 	return error;
 
-fail_gunlock3:
+fail_gunlock4:
 	glock_clear_object(ip->i_gl, ip);
 	glock_clear_object(io_gl, ip);
+fail_gunlock3:
 	gfs2_glock_dq_uninit(&ip->i_iopen_gh);
 fail_gunlock2:
 	gfs2_glock_put(io_gl);
-- 
2.34.1

