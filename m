Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 98ED22C6708
	for <lists+cluster-devel@lfdr.de>; Fri, 27 Nov 2020 14:41:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606484472;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cdIfZGUpKVjDOBakVKFuEjRLkdk3OTgu5UFn/hFU/S0=;
	b=EsVG12JQGRhc1wIxiQSMgxC9JYYJcjXPw6OnWkeAXFTEQIP4qI20/oxTOMyPY7Ua+GmbtI
	M58DdENQ/7W+V77vhgkqmYkkr0g0JUn78PDxuJtCMx6bmkZmsNA0baaUSqo47Nby6xwjU+
	sPSRVv7jc/qCinnc8Z4I9soO68jduho=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-imuvN8ZGN5m9ISZaXePLaw-1; Fri, 27 Nov 2020 08:41:10 -0500
X-MC-Unique: imuvN8ZGN5m9ISZaXePLaw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC27F8030B0;
	Fri, 27 Nov 2020 13:41:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BEC26085D;
	Fri, 27 Nov 2020 13:41:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A8FE04A7C6;
	Fri, 27 Nov 2020 13:41:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ARDf47M021395 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 27 Nov 2020 08:41:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CA3EB5D71D; Fri, 27 Nov 2020 13:41:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0753E5D6D1;
	Fri, 27 Nov 2020 13:41:00 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Fri, 27 Nov 2020 14:40:58 +0100
Message-Id: <20201127134058.575594-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] Revert "GFS2: Prevent delete work from
	occurring on glocks used for create"
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

Since commit a0e3cc65fa29 ("gfs2: Turn gl_delete into a delayed work"), we're
cancelling any pending delete work of an iopen glock before attaching a new
inode to that glock in gfs2_create_inode.  This means that delete_work_func can
no longer be queued or running when attaching the iopen glock to the new inode,
and we can revert commit a4923865ea07 ("GFS2: Prevent delete work from
occurring on glocks used for create"), which tried to achieve the same but in a
racy way.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c  | 8 --------
 fs/gfs2/incore.h | 1 -
 fs/gfs2/inode.c  | 6 +-----
 3 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 35a6fd103761..d87a5bc3607b 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -857,12 +857,6 @@ static void delete_work_func(struct work_struct *work)
 	clear_bit(GLF_PENDING_DELETE, &gl->gl_flags);
 	spin_unlock(&gl->gl_lockref.lock);
 
-	/* If someone's using this glock to create a new dinode, the block must
-	   have been freed by another node, then re-used, in which case our
-	   iopen callback is too late after the fact. Ignore it. */
-	if (test_bit(GLF_INODE_CREATING, &gl->gl_flags))
-		goto out;
-
 	if (test_bit(GLF_DEMOTE, &gl->gl_flags)) {
 		/*
 		 * If we can evict the inode, give the remote node trying to
@@ -2112,8 +2106,6 @@ static const char *gflags2str(char *buf, const struct gfs2_glock *gl)
 		*p++ = 'o';
 	if (test_bit(GLF_BLOCKING, gflags))
 		*p++ = 'b';
-	if (test_bit(GLF_INODE_CREATING, gflags))
-		*p++ = 'c';
 	if (test_bit(GLF_PENDING_DELETE, gflags))
 		*p++ = 'P';
 	if (test_bit(GLF_FREEING, gflags))
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index f8858d995b24..8e1ab8ed4abc 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -348,7 +348,6 @@ enum {
 	GLF_LRU				= 13,
 	GLF_OBJECT			= 14, /* Used only for tracing */
 	GLF_BLOCKING			= 15,
-	GLF_INODE_CREATING		= 16, /* Inode creation occurring */
 	GLF_PENDING_DELETE		= 17,
 	GLF_FREEING			= 18, /* Wait for glock to be freed */
 };
diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index 65d15c5c8246..3d414390ace3 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -609,7 +609,7 @@ static int gfs2_create_inode(struct inode *dir, struct dentry *dentry,
 	struct inode *inode = NULL;
 	struct gfs2_inode *dip = GFS2_I(dir), *ip;
 	struct gfs2_sbd *sdp = GFS2_SB(&dip->i_inode);
-	struct gfs2_glock *io_gl = NULL;
+	struct gfs2_glock *io_gl;
 	int error, free_vfs_inode = 1;
 	u32 aflags = 0;
 	unsigned blocks = 1;
@@ -748,8 +748,6 @@ static int gfs2_create_inode(struct inode *dir, struct dentry *dentry,
 	if (error)
 		goto fail_free_inode;
 
-	BUG_ON(test_and_set_bit(GLF_INODE_CREATING, &io_gl->gl_flags));
-
 	error = gfs2_glock_nq_init(io_gl, LM_ST_SHARED, GL_EXACT, &ip->i_iopen_gh);
 	if (error)
 		goto fail_gunlock2;
@@ -797,7 +795,6 @@ static int gfs2_create_inode(struct inode *dir, struct dentry *dentry,
 	gfs2_glock_dq_uninit(ghs);
 	gfs2_qa_put(ip);
 	gfs2_glock_dq_uninit(ghs + 1);
-	clear_bit(GLF_INODE_CREATING, &io_gl->gl_flags);
 	gfs2_glock_put(io_gl);
 	gfs2_qa_put(dip);
 	return error;
@@ -806,7 +803,6 @@ static int gfs2_create_inode(struct inode *dir, struct dentry *dentry,
 	glock_clear_object(io_gl, ip);
 	gfs2_glock_dq_uninit(&ip->i_iopen_gh);
 fail_gunlock2:
-	clear_bit(GLF_INODE_CREATING, &io_gl->gl_flags);
 	gfs2_glock_put(io_gl);
 fail_free_inode:
 	if (ip->i_gl) {
-- 
2.26.2

