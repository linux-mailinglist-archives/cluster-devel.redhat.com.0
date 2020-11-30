Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 545232C8E5C
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Nov 2020 20:48:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606765687;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AaFyPJmplGhVXa5tN5jnZ059syGIAzsENaLwF1V70QY=;
	b=CX9OI1a9sBM3G1OjU1NSWJ/Kxrv3b+7VLzSRczbLxdmIzrNftGs4UfTQNZWSmaj3BCdlrX
	9RAcQZH7cBVKOfs7lhmjkkbU+DcSW9gqIuVhJisVnssojydKZXLrmycC8B+lsBNENMlEyX
	SSM9PCMIXIYS1Ie+z4J8B5TjCXkWzYs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-frx4eLS_OeiDO6t-3BgFAw-1; Mon, 30 Nov 2020 14:48:05 -0500
X-MC-Unique: frx4eLS_OeiDO6t-3BgFAw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68B85101274B;
	Mon, 30 Nov 2020 19:48:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C7CD60871;
	Mon, 30 Nov 2020 19:48:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AF6ED1809C9F;
	Mon, 30 Nov 2020 19:47:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AUJiS3B020698 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 30 Nov 2020 14:44:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AF49B6090F; Mon, 30 Nov 2020 19:44:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 89CF060873;
	Mon, 30 Nov 2020 19:44:24 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 30 Nov 2020 20:44:22 +0100
Message-Id: <20201130194422.741935-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: stable@vger.kernel.org
Subject: [Cluster-devel] [PATCH] gfs2: Fix deadlock between
	gfs2_create_inode and delete_work_func
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

In gfs2_create_inode, make sure to cancel any pending delete work before
locking the inode glock.  Otherwise, gfs2_cancel_delete_work may block
waiting for delete_work_func to complete, and delete_work_func may block
trying to acquire the inode glock in gfs2_inode_lookup.

Reported-by: Alexander Aring <aahringo@redhat.com>
Fixes: a0e3cc65fa29 ("gfs2: Turn gl_delete into a delayed work")
Cc: stable@vger.kernel.org # v5.8+
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/inode.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index eed1a1bac6f6..3b9e8c99293c 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -725,13 +725,19 @@ static int gfs2_create_inode(struct inode *dir, struct dentry *dentry,
 	flush_delayed_work(&ip->i_gl->gl_work);
 	glock_set_object(ip->i_gl, ip);
 
-	error = gfs2_glock_nq_init(ip->i_gl, LM_ST_EXCLUSIVE, GL_SKIP, ghs + 1);
+	error = gfs2_glock_get(sdp, ip->i_no_addr, &gfs2_iopen_glops, CREATE, &io_gl);
 	if (error)
 		goto fail_free_inode;
+	gfs2_cancel_delete_work(io_gl);
+	glock_set_object(io_gl, ip);
+
+	error = gfs2_glock_nq_init(ip->i_gl, LM_ST_EXCLUSIVE, GL_SKIP, ghs + 1);
+	if (error)
+		goto fail_gunlock2;
 
 	error = gfs2_trans_begin(sdp, blocks, 0);
 	if (error)
-		goto fail_free_inode;
+		goto fail_gunlock2;
 
 	if (blocks > 1) {
 		ip->i_eattr = ip->i_no_addr + 1;
@@ -740,18 +746,12 @@ static int gfs2_create_inode(struct inode *dir, struct dentry *dentry,
 	init_dinode(dip, ip, symname);
 	gfs2_trans_end(sdp);
 
-	error = gfs2_glock_get(sdp, ip->i_no_addr, &gfs2_iopen_glops, CREATE, &io_gl);
-	if (error)
-		goto fail_free_inode;
-
 	BUG_ON(test_and_set_bit(GLF_INODE_CREATING, &io_gl->gl_flags));
 
 	error = gfs2_glock_nq_init(io_gl, LM_ST_SHARED, GL_EXACT, &ip->i_iopen_gh);
 	if (error)
 		goto fail_gunlock2;
 
-	gfs2_cancel_delete_work(ip->i_iopen_gh.gh_gl);
-	glock_set_object(ip->i_iopen_gh.gh_gl, ip);
 	gfs2_set_iop(inode);
 	insert_inode_hash(inode);
 
@@ -803,6 +803,7 @@ static int gfs2_create_inode(struct inode *dir, struct dentry *dentry,
 	gfs2_glock_dq_uninit(&ip->i_iopen_gh);
 fail_gunlock2:
 	clear_bit(GLF_INODE_CREATING, &io_gl->gl_flags);
+	glock_clear_object(io_gl, ip);
 	gfs2_glock_put(io_gl);
 fail_free_inode:
 	if (ip->i_gl) {
-- 
2.26.2

