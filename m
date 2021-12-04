Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6C1468409
	for <lists+cluster-devel@lfdr.de>; Sat,  4 Dec 2021 11:27:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638613661;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8KFLsR7fjs5Q8ZrwXS52oqCNJz4Ij54wLG2MMFREKJY=;
	b=XOnaPJzype3LtAjEkrKhqyTDQZWFD2w71ArULQ5732jl92ie56RaBwB/dnIRcM28mLGPid
	EF+HoUCfFM688jPP+cRQx811CDdBclHXFLWPjLbJO24GJW1TbbzGYxiFl2fsP4rHFaTaYZ
	H3BSmrv7mv3VQaN6w94FrCWtOiTB0qs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-465-m76mzuNhNcaE8OSILHwtxA-1; Sat, 04 Dec 2021 05:27:38 -0500
X-MC-Unique: m76mzuNhNcaE8OSILHwtxA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 515E41966320;
	Sat,  4 Dec 2021 10:27:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45E256060F;
	Sat,  4 Dec 2021 10:27:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6A1844A7C9;
	Sat,  4 Dec 2021 10:27:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B4ARXqY017312 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 4 Dec 2021 05:27:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 158845C642; Sat,  4 Dec 2021 10:27:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.localdomain (unknown [10.40.192.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5186B5C640;
	Sat,  4 Dec 2021 10:27:32 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Sat,  4 Dec 2021 11:27:17 +0100
Message-Id: <20211204102718.19482-3-agruenba@redhat.com>
In-Reply-To: <20211204102718.19482-1-agruenba@redhat.com>
References: <20211204102718.19482-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 3/4] gfs2: gfs2_inode_lookup rework
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Rework gfs2_inode_lookup() to only set up the new inode's glocks after
verifying that the new inode is valid.

There is no need for flushing the inode glock work queue anymore now,
so remove that as well.

While at it, get rid of the useless wrapper around iget5_locked() and
its unnecessary is_bad_inode() check.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/inode.c | 84 +++++++++++++++++++------------------------------
 1 file changed, 33 insertions(+), 51 deletions(-)

diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index 806357f0c7ee..d73b2933fdb8 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -40,37 +40,6 @@ static const struct inode_operations gfs2_file_iops;
 static const struct inode_operations gfs2_dir_iops;
 static const struct inode_operations gfs2_symlink_iops;
 
-static int iget_test(struct inode *inode, void *opaque)
-{
-	u64 no_addr = *(u64 *)opaque;
-
-	return GFS2_I(inode)->i_no_addr == no_addr;
-}
-
-static int iget_set(struct inode *inode, void *opaque)
-{
-	u64 no_addr = *(u64 *)opaque;
-
-	GFS2_I(inode)->i_no_addr = no_addr;
-	inode->i_ino = no_addr;
-	return 0;
-}
-
-static struct inode *gfs2_iget(struct super_block *sb, u64 no_addr)
-{
-	struct inode *inode;
-
-repeat:
-	inode = iget5_locked(sb, no_addr, iget_test, iget_set, &no_addr);
-	if (!inode)
-		return inode;
-	if (is_bad_inode(inode)) {
-		iput(inode);
-		goto repeat;
-	}
-	return inode;
-}
-
 /**
  * gfs2_set_iop - Sets inode operations
  * @inode: The inode with correct i_mode filled in
@@ -104,6 +73,22 @@ static void gfs2_set_iop(struct inode *inode)
 	}
 }
 
+static int iget_test(struct inode *inode, void *opaque)
+{
+	u64 no_addr = *(u64 *)opaque;
+
+	return GFS2_I(inode)->i_no_addr == no_addr;
+}
+
+static int iget_set(struct inode *inode, void *opaque)
+{
+	u64 no_addr = *(u64 *)opaque;
+
+	GFS2_I(inode)->i_no_addr = no_addr;
+	inode->i_ino = no_addr;
+	return 0;
+}
+
 /**
  * gfs2_inode_lookup - Lookup an inode
  * @sb: The super block
@@ -132,12 +117,11 @@ struct inode *gfs2_inode_lookup(struct super_block *sb, unsigned int type,
 {
 	struct inode *inode;
 	struct gfs2_inode *ip;
-	struct gfs2_glock *io_gl = NULL;
 	struct gfs2_holder i_gh;
 	int error;
 
 	gfs2_holder_mark_uninitialized(&i_gh);
-	inode = gfs2_iget(sb, no_addr);
+	inode = iget5_locked(sb, no_addr, iget_test, iget_set, &no_addr);
 	if (!inode)
 		return ERR_PTR(-ENOMEM);
 
@@ -145,22 +129,16 @@ struct inode *gfs2_inode_lookup(struct super_block *sb, unsigned int type,
 
 	if (inode->i_state & I_NEW) {
 		struct gfs2_sbd *sdp = GFS2_SB(inode);
+		struct gfs2_glock *io_gl;
 
 		error = gfs2_glock_get(sdp, no_addr, &gfs2_inode_glops, CREATE, &ip->i_gl);
 		if (unlikely(error))
 			goto fail;
-		flush_delayed_work(&ip->i_gl->gl_work);
-
-		error = gfs2_glock_get(sdp, no_addr, &gfs2_iopen_glops, CREATE, &io_gl);
-		if (unlikely(error))
-			goto fail;
-		if (blktype != GFS2_BLKST_UNLINKED)
-			gfs2_cancel_delete_work(io_gl);
 
 		if (type == DT_UNKNOWN || blktype != GFS2_BLKST_FREE) {
 			/*
 			 * The GL_SKIP flag indicates to skip reading the inode
-			 * block.  We read the inode with gfs2_inode_refresh
+			 * block.  We read the inode when instantiating it
 			 * after possibly checking the block type.
 			 */
 			error = gfs2_glock_nq_init(ip->i_gl, LM_ST_EXCLUSIVE,
@@ -181,24 +159,31 @@ struct inode *gfs2_inode_lookup(struct super_block *sb, unsigned int type,
 			}
 		}
 
-		glock_set_object(ip->i_gl, ip);
 		set_bit(GLF_INSTANTIATE_NEEDED, &ip->i_gl->gl_flags);
-		error = gfs2_glock_nq_init(io_gl, LM_ST_SHARED, GL_EXACT, &ip->i_iopen_gh);
+
+		error = gfs2_glock_get(sdp, no_addr, &gfs2_iopen_glops, CREATE, &io_gl);
 		if (unlikely(error))
 			goto fail;
-		glock_set_object(ip->i_iopen_gh.gh_gl, ip);
+		if (blktype != GFS2_BLKST_UNLINKED)
+			gfs2_cancel_delete_work(io_gl);
+		error = gfs2_glock_nq_init(io_gl, LM_ST_SHARED, GL_EXACT, &ip->i_iopen_gh);
 		gfs2_glock_put(io_gl);
-		io_gl = NULL;
+		if (unlikely(error))
+			goto fail;
 
 		/* Lowest possible timestamp; will be overwritten in gfs2_dinode_in. */
 		inode->i_atime.tv_sec = 1LL << (8 * sizeof(inode->i_atime.tv_sec) - 1);
 		inode->i_atime.tv_nsec = 0;
 
+		glock_set_object(ip->i_gl, ip);
+
 		if (type == DT_UNKNOWN) {
 			/* Inode glock must be locked already */
 			error = gfs2_instantiate(&i_gh);
-			if (error)
+			if (error) {
+				glock_clear_object(ip->i_gl, ip);
 				goto fail;
+			}
 		} else {
 			ip->i_no_formal_ino = no_formal_ino;
 			inode->i_mode = DT2IF(type);
@@ -206,6 +191,7 @@ struct inode *gfs2_inode_lookup(struct super_block *sb, unsigned int type,
 
 		if (gfs2_holder_initialized(&i_gh))
 			gfs2_glock_dq_uninit(&i_gh);
+		glock_set_object(ip->i_iopen_gh.gh_gl, ip);
 
 		gfs2_set_iop(inode);
 		unlock_new_inode(inode);
@@ -220,12 +206,8 @@ struct inode *gfs2_inode_lookup(struct super_block *sb, unsigned int type,
 	return inode;
 
 fail:
-	if (gfs2_holder_initialized(&ip->i_iopen_gh)) {
-		glock_clear_object(ip->i_iopen_gh.gh_gl, ip);
+	if (gfs2_holder_initialized(&ip->i_iopen_gh))
 		gfs2_glock_dq_uninit(&ip->i_iopen_gh);
-	}
-	if (io_gl)
-		gfs2_glock_put(io_gl);
 	if (gfs2_holder_initialized(&i_gh))
 		gfs2_glock_dq_uninit(&i_gh);
 	iget_failed(inode);
-- 
2.33.1

