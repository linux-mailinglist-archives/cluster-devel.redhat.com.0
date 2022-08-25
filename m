Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCE35A14E0
	for <lists+cluster-devel@lfdr.de>; Thu, 25 Aug 2022 16:53:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661439237;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Sw/tVhWE/ZhlEYJ2Jl0d/3BUG7iE6HReUVx6tJkHu0w=;
	b=BHgbTFRtU4XWRMxWptogmV7FhED5itJvgvd/IB+dSuzh8zSxNpzxABI1dQWktJtoPcdbWR
	hIUSw2dUmrfrRpCrfAYWQyepOcOYn2kiRiBtzJ1ewJeBgHWXFr9YMm98SSXHHCKUtT8MDV
	Bc0QezZal76i1ePmG8O4SGqNZivgUlA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402-8PLq6eHlO2edMYN5wdw8_g-1; Thu, 25 Aug 2022 10:53:52 -0400
X-MC-Unique: 8PLq6eHlO2edMYN5wdw8_g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 61D9F811E76;
	Thu, 25 Aug 2022 14:53:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 67CE8C15BB3;
	Thu, 25 Aug 2022 14:53:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0A99F1946A5E;
	Thu, 25 Aug 2022 14:53:50 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4BBE21946A43 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 25 Aug 2022 14:53:49 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2F5482166B29; Thu, 25 Aug 2022 14:53:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.users.ipa.redhat.com (unknown [10.2.17.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 08DA22166B26
 for <cluster-devel@redhat.com>; Thu, 25 Aug 2022 14:53:48 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 25 Aug 2022 09:53:48 -0500
Message-Id: <20220825145348.382382-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: [Cluster-devel] [PATCH] gfs2: Use TRY lock in gfs2_inode_lookup for
 UNLINKED inodes
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

Before this patch, delete_work_func() would check for the GLF_DEMOTE
flag on the iopen glock and if set, it would perform special processing.
However, there was a race whereby the GLF_DEMOTE flag could be set by
another process after the check. Then when it called
gfs2_lookup_by_inum() which calls gfs2_inode_lookup(), it tried to lock
the iopen glock in SH mode, but the GLF_DEMOTE flag prevented the
request from being granted. But the iopen glock could never be demoted
because that happens when the inode is evicted, and the evict was never
completed because of the failed lookup.

To fix that, change function gfs2_inode_lookup() so that when
GFS2_BLKST_UNLINKED inodes are searched, it uses the LM_FLAG_TRY flag
for the iopen glock.  If the locking request fails, fail
gfs2_inode_lookup() with -EAGAIN so that delete_work_func() can retry
the operation later.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c |  8 +++++---
 fs/gfs2/inode.c | 10 ++++++++--
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 0b36a16659b6..f1973a442955 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -1018,16 +1018,18 @@ static void delete_work_func(struct work_struct *work)
 			if (gfs2_queue_delete_work(gl, 5 * HZ))
 				return;
 		}
-		goto out;
 	}
 
 	inode = gfs2_lookup_by_inum(sdp, no_addr, gl->gl_no_formal_ino,
 				    GFS2_BLKST_UNLINKED);
-	if (!IS_ERR_OR_NULL(inode)) {
+	if (IS_ERR(inode)) {
+		if (PTR_ERR(inode) == -EAGAIN &&
+			(gfs2_queue_delete_work(gl, 5 * HZ)))
+				return;
+	} else {
 		d_prune_aliases(inode);
 		iput(inode);
 	}
-out:
 	gfs2_glock_put(gl);
 }
 
diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index c8ec876f33ea..56ded979988c 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -130,6 +130,7 @@ struct inode *gfs2_inode_lookup(struct super_block *sb, unsigned int type,
 	if (inode->i_state & I_NEW) {
 		struct gfs2_sbd *sdp = GFS2_SB(inode);
 		struct gfs2_glock *io_gl;
+		int extra_flags = 0;
 
 		error = gfs2_glock_get(sdp, no_addr, &gfs2_inode_glops, CREATE,
 				       &ip->i_gl);
@@ -141,9 +142,12 @@ struct inode *gfs2_inode_lookup(struct super_block *sb, unsigned int type,
 		if (unlikely(error))
 			goto fail;
 
-		if (blktype != GFS2_BLKST_UNLINKED)
+		if (blktype == GFS2_BLKST_UNLINKED)
+			extra_flags |= LM_FLAG_TRY;
+		else
 			gfs2_cancel_delete_work(io_gl);
-		error = gfs2_glock_nq_init(io_gl, LM_ST_SHARED, GL_EXACT,
+		error = gfs2_glock_nq_init(io_gl, LM_ST_SHARED,
+					   GL_EXACT | extra_flags,
 					   &ip->i_iopen_gh);
 		gfs2_glock_put(io_gl);
 		if (unlikely(error))
@@ -210,6 +214,8 @@ struct inode *gfs2_inode_lookup(struct super_block *sb, unsigned int type,
 	return inode;
 
 fail:
+	if (error == GLR_TRYFAILED)
+		error = -EAGAIN;
 	if (gfs2_holder_initialized(&ip->i_iopen_gh))
 		gfs2_glock_dq_uninit(&ip->i_iopen_gh);
 	if (gfs2_holder_initialized(&i_gh))
-- 
2.37.2

