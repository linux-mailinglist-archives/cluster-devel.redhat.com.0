Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 62981468408
	for <lists+cluster-devel@lfdr.de>; Sat,  4 Dec 2021 11:27:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638613661;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2W6geHtTaOIkbgE3IbdzZ5OOBXFOZ+pAs2rIAMFzb6s=;
	b=DsX0cksV0v9Y6iFKaIOW5uorjzE9cE1/FeI3K41ByoxhA7XF6VFSxoWZFwxdgDAaFzkN1k
	CLy6/GL499FufTWSLWC+XYiw8GvnpSPYdp3r4KTS5NUSKjRlpuDEDdwd+MziNBtML40iUR
	c2b1jZLQVUuftQHmE27qZ/kZM7TH7YI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-465-TqAM0di8MbiWDtdasJ_y4A-1; Sat, 04 Dec 2021 05:27:38 -0500
X-MC-Unique: TqAM0di8MbiWDtdasJ_y4A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5454A802924;
	Sat,  4 Dec 2021 10:27:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 46D825D9D5;
	Sat,  4 Dec 2021 10:27:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8AB691809CB8;
	Sat,  4 Dec 2021 10:27:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B4ARYGB017317 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 4 Dec 2021 05:27:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 32B435C643; Sat,  4 Dec 2021 10:27:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.localdomain (unknown [10.40.192.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6EFE65C640;
	Sat,  4 Dec 2021 10:27:33 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Sat,  4 Dec 2021 11:27:18 +0100
Message-Id: <20211204102718.19482-4-agruenba@redhat.com>
In-Reply-To: <20211204102718.19482-1-agruenba@redhat.com>
References: <20211204102718.19482-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 4/4] gfs2: gfs2_create_inode rework
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

When gfs2_lookup_by_inum() calls gfs2_inode_lookup() for an uncached
inode, gfs2_inode_lookup() will place a new tentative inode into the
inode cache before verifying that there is a valid inode at the given
address.  This can race with gfs2_create_inode() which doesn't check for
duplicates inodes.  gfs2_create_inode() will try to assign the new inode
to the corresponding inode glock, and glock_set_object() will complain
that the glock is still in use by gfs2_inode_lookup's tentative inode.

We noticed this bug after adding commit 486408d690e1 ("gfs2: Cancel
remote delete work asynchronously") which allowed delete_work_func() to
race with gfs2_create_inode(), but the same race exists for
open-by-handle.

Fix that by switching from insert_inode_hash() to
insert_inode_locked4(), which does check for duplicate inodes.  We know
we've just managed to to allocate the new inode, so an inode tentatively
created by gfs2_inode_lookup() will eventually go away and
insert_inode_locked4() will always succeed.

In addition, don't flush the inode glock work anymore (this can now only
make things worse) and clean up glock_{set,clear}_object for the inode
glock somewhat.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/inode.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index d73b2933fdb8..89905f4f29bb 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -707,18 +707,19 @@ static int gfs2_create_inode(struct inode *dir, struct dentry *dentry,
 	error = gfs2_glock_get(sdp, ip->i_no_addr, &gfs2_inode_glops, CREATE, &ip->i_gl);
 	if (error)
 		goto fail_free_inode;
-	flush_delayed_work(&ip->i_gl->gl_work);
 
 	error = gfs2_glock_get(sdp, ip->i_no_addr, &gfs2_iopen_glops, CREATE, &io_gl);
 	if (error)
 		goto fail_free_inode;
 	gfs2_cancel_delete_work(io_gl);
 
+	error = insert_inode_locked4(inode, ip->i_no_addr, iget_test, &ip->i_no_addr);
+	BUG_ON(error);
+
 	error = gfs2_glock_nq_init(ip->i_gl, LM_ST_EXCLUSIVE, GL_SKIP, ghs + 1);
 	if (error)
 		goto fail_gunlock2;
 
-	glock_set_object(ip->i_gl, ip);
 	error = gfs2_trans_begin(sdp, blocks, 0);
 	if (error)
 		goto fail_gunlock2;
@@ -734,9 +735,9 @@ static int gfs2_create_inode(struct inode *dir, struct dentry *dentry,
 	if (error)
 		goto fail_gunlock2;
 
+	glock_set_object(ip->i_gl, ip);
 	glock_set_object(io_gl, ip);
 	gfs2_set_iop(inode);
-	insert_inode_hash(inode);
 
 	free_vfs_inode = 0; /* After this point, the inode is no longer
 			       considered free. Any failures need to undo
@@ -778,17 +779,17 @@ static int gfs2_create_inode(struct inode *dir, struct dentry *dentry,
 	gfs2_glock_dq_uninit(ghs + 1);
 	gfs2_glock_put(io_gl);
 	gfs2_qa_put(dip);
+	unlock_new_inode(inode);
 	return error;
 
 fail_gunlock3:
+	glock_clear_object(ip->i_gl, ip);
 	glock_clear_object(io_gl, ip);
 	gfs2_glock_dq_uninit(&ip->i_iopen_gh);
 fail_gunlock2:
-	glock_clear_object(io_gl, ip);
 	gfs2_glock_put(io_gl);
 fail_free_inode:
 	if (ip->i_gl) {
-		glock_clear_object(ip->i_gl, ip);
 		if (free_vfs_inode) /* else evict will do the put for us */
 			gfs2_glock_put(ip->i_gl);
 	}
@@ -806,7 +807,10 @@ static int gfs2_create_inode(struct inode *dir, struct dentry *dentry,
 			mark_inode_dirty(inode);
 		set_bit(free_vfs_inode ? GIF_FREE_VFS_INODE : GIF_ALLOC_FAILED,
 			&GFS2_I(inode)->i_flags);
-		iput(inode);
+		if (inode->i_state & I_NEW)
+			iget_failed(inode);
+		else
+			iput(inode);
 	}
 	if (gfs2_holder_initialized(ghs + 1))
 		gfs2_glock_dq_uninit(ghs + 1);
-- 
2.33.1

