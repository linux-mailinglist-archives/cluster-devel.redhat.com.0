Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4304F26C3F0
	for <lists+cluster-devel@lfdr.de>; Wed, 16 Sep 2020 17:00:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600268441;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ozYrg0kiWeCyFSlrpmBtnAl+5rxUfKOUaqFuehCLjAE=;
	b=ICS8z5KP+pNLlsGRHP5EZNHvOJj+7kGiOnzz9Y7RQTsyP8F1pNyfQnBfouME6pT6duxkSV
	DmdKWPwNqW9HXjoblV3Mz/LSq1BAXoAWmFP/56LEwnZfC6u661hTMd54r3PdScIKwKrkJb
	zlWiPfbsEJwH9ZatKGyhA+WCBlE037k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-bWktpumQPUeXCGhhSSU9YA-1; Wed, 16 Sep 2020 11:00:39 -0400
X-MC-Unique: bWktpumQPUeXCGhhSSU9YA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96344195E40E;
	Wed, 16 Sep 2020 15:00:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 836F819D6C;
	Wed, 16 Sep 2020 15:00:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 47DB0183D02D;
	Wed, 16 Sep 2020 15:00:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08GF0UOp018919 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 16 Sep 2020 11:00:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7B9FF4D; Wed, 16 Sep 2020 15:00:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-23.phx2.redhat.com [10.3.112.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4A23C5DE51
	for <cluster-devel@redhat.com>; Wed, 16 Sep 2020 15:00:30 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 16 Sep 2020 10:00:15 -0500
Message-Id: <20200916150020.36582-2-rpeterso@redhat.com>
In-Reply-To: <20200916150020.36582-1-rpeterso@redhat.com>
References: <20200916150020.36582-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 1/6] gfs2: switch variable error to ret
	in gfs2_evict_inode
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Function gfs2_evict_inode is too big and unreadable. This patch is
just a baby step toward improving that. This first step just renames
variable error to ret. This will help make future patches more readable.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/super.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 19add2da1013..ab08b9a1102c 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1338,7 +1338,7 @@ static void gfs2_evict_inode(struct inode *inode)
 	struct gfs2_inode *ip = GFS2_I(inode);
 	struct gfs2_holder gh;
 	struct address_space *metamapping;
-	int error;
+	int ret;
 
 	if (test_bit(GIF_FREE_VFS_INODE, &ip->i_flags)) {
 		clear_inode(inode);
@@ -1362,8 +1362,8 @@ static void gfs2_evict_inode(struct inode *inode)
 		goto out;
 
 	/* Must not read inode block until block type has been verified */
-	error = gfs2_glock_nq_init(ip->i_gl, LM_ST_EXCLUSIVE, GL_SKIP, &gh);
-	if (unlikely(error)) {
+	ret = gfs2_glock_nq_init(ip->i_gl, LM_ST_EXCLUSIVE, GL_SKIP, &gh);
+	if (unlikely(ret)) {
 		glock_clear_object(ip->i_iopen_gh.gh_gl, ip);
 		ip->i_iopen_gh.gh_flags |= GL_NOCACHE;
 		gfs2_glock_dq_uninit(&ip->i_iopen_gh);
@@ -1372,13 +1372,13 @@ static void gfs2_evict_inode(struct inode *inode)
 
 	if (gfs2_inode_already_deleted(ip->i_gl, ip->i_no_formal_ino))
 		goto out_truncate;
-	error = gfs2_check_blk_type(sdp, ip->i_no_addr, GFS2_BLKST_UNLINKED);
-	if (error)
+	ret = gfs2_check_blk_type(sdp, ip->i_no_addr, GFS2_BLKST_UNLINKED);
+	if (ret)
 		goto out_truncate;
 
 	if (test_bit(GIF_INVALID, &ip->i_flags)) {
-		error = gfs2_inode_refresh(ip);
-		if (error)
+		ret = gfs2_inode_refresh(ip);
+		if (ret)
 			goto out_truncate;
 	}
 
@@ -1399,20 +1399,20 @@ static void gfs2_evict_inode(struct inode *inode)
 
 	if (S_ISDIR(inode->i_mode) &&
 	    (ip->i_diskflags & GFS2_DIF_EXHASH)) {
-		error = gfs2_dir_exhash_dealloc(ip);
-		if (error)
+		ret = gfs2_dir_exhash_dealloc(ip);
+		if (ret)
 			goto out_unlock;
 	}
 
 	if (ip->i_eattr) {
-		error = gfs2_ea_dealloc(ip);
-		if (error)
+		ret = gfs2_ea_dealloc(ip);
+		if (ret)
 			goto out_unlock;
 	}
 
 	if (!gfs2_is_stuffed(ip)) {
-		error = gfs2_file_dealloc(ip);
-		if (error)
+		ret = gfs2_file_dealloc(ip);
+		if (ret)
 			goto out_unlock;
 	}
 
@@ -1421,7 +1421,7 @@ static void gfs2_evict_inode(struct inode *inode)
 	   location and try to set gl_object again. We clear gl_object here so
 	   that subsequent inode creates don't see an old gl_object. */
 	glock_clear_object(ip->i_gl, ip);
-	error = gfs2_dinode_dealloc(ip);
+	ret = gfs2_dinode_dealloc(ip);
 	gfs2_inode_remember_delete(ip->i_gl, ip->i_no_formal_ino);
 	goto out_unlock;
 
@@ -1436,8 +1436,8 @@ static void gfs2_evict_inode(struct inode *inode)
 	write_inode_now(inode, 1);
 	gfs2_ail_flush(ip->i_gl, 0);
 
-	error = gfs2_trans_begin(sdp, 0, sdp->sd_jdesc->jd_blocks);
-	if (error)
+	ret = gfs2_trans_begin(sdp, 0, sdp->sd_jdesc->jd_blocks);
+	if (ret)
 		goto out_unlock;
 	/* Needs to be done before glock release & also in a transaction */
 	truncate_inode_pages(&inode->i_data, 0);
@@ -1452,8 +1452,8 @@ static void gfs2_evict_inode(struct inode *inode)
 		glock_clear_object(ip->i_gl, ip);
 		gfs2_glock_dq_uninit(&gh);
 	}
-	if (error && error != GLR_TRYFAILED && error != -EROFS)
-		fs_warn(sdp, "gfs2_evict_inode: %d\n", error);
+	if (ret && ret != GLR_TRYFAILED && ret != -EROFS)
+		fs_warn(sdp, "gfs2_evict_inode: %d\n", ret);
 out:
 	truncate_inode_pages_final(&inode->i_data);
 	if (ip->i_qadata)
-- 
2.26.2

