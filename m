Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id C8EE71F1C95
	for <lists+cluster-devel@lfdr.de>; Mon,  8 Jun 2020 18:01:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591632066;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=v4kI9q0kMA+yjcLJgldRCJK9z1XW2AD1UjJy5FOCkuY=;
	b=YjE1YuAiJApM4FLXn5PBsTyidPxj87Ea3Ys/Ww/CzOrnbtFzoUZ01VtrSQGDuX42VC+b5d
	+1M9220HWyvWpFr7hNOF2pSIF3pa5G1dirZYASX1+u2qAZdsNvCjjgn3hpdspXEZ28qU+f
	Yj2bC0uFjhUvI0prdXWqexYi8maBbK4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-xZnRAflXNdW-LpDoDr0RRg-1; Mon, 08 Jun 2020 12:01:04 -0400
X-MC-Unique: xZnRAflXNdW-LpDoDr0RRg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0EDC1005510;
	Mon,  8 Jun 2020 16:01:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BBC481024871;
	Mon,  8 Jun 2020 16:01:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A27FB1809554;
	Mon,  8 Jun 2020 16:01:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 058G0xBg011706 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 8 Jun 2020 12:00:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AE49460C1D; Mon,  8 Jun 2020 16:00:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.195.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DFED68926C;
	Mon,  8 Jun 2020 16:00:58 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon,  8 Jun 2020 18:00:30 +0200
Message-Id: <20200608160039.549204-12-agruenba@redhat.com>
In-Reply-To: <20200608160039.549204-1-agruenba@redhat.com>
References: <20200608160039.549204-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 11/20] gfs2: Give up the iopen glock on
	contention
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

When there's contention on the iopen glock, it means that the link count
of the corresponding inode has dropped to zero on a remote node which is
now trying to delete the inode.  In that case, try to evict the inode so
that the iopen glock will be released, which will allow the remote node
to do its job.

When the inode is still open locally, the inode's reference count won't
drop to zero and so we'll keep holding the inode and its iopen glock.
The remote node will time out its request to grab the iopen glock, and
when the inode is finally closed locally, we'll try to delete it
ourself.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c  | 51 ++++++++++++++++++++++++++++++++++++++++++++++++
 fs/gfs2/incore.h |  1 +
 fs/gfs2/super.c  |  7 +++++--
 3 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 0332086f7ab9..bf7daa35f73f 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -774,6 +774,42 @@ bool gfs2_inode_already_deleted(struct gfs2_glock *gl, u64 generation)
 	return generation <= be64_to_cpu(ri->ri_generation_deleted);
 }
 
+static bool gfs2_try_evict(struct gfs2_glock *gl)
+{
+	struct gfs2_inode *ip;
+	bool evicted = false;
+
+	/*
+	 * If there is contention on the iopen glock and we have an inode, try
+	 * to grab and release the inode so that it can be evicted.  This will
+	 * allow the remote node to go ahead and delete the inode without us
+	 * having to do it, which will avoid rgrp glock thrashing.
+	 *
+	 * The remote node is likely still holding the corresponding inode
+	 * glock, so it will run before we get to verify that the delete has
+	 * happened below.
+	 */
+	spin_lock(&gl->gl_lockref.lock);
+	ip = gl->gl_object;
+	if (ip && !igrab(&ip->i_inode))
+		ip = NULL;
+	spin_unlock(&gl->gl_lockref.lock);
+	if (ip) {
+		set_bit(GIF_DEFERRED_DELETE, &ip->i_flags);
+		d_prune_aliases(&ip->i_inode);
+		iput(&ip->i_inode);
+
+		/* If the inode was evicted, gl->gl_object will now be NULL. */
+		spin_lock(&gl->gl_lockref.lock);
+		ip = gl->gl_object;
+		if (ip)
+			clear_bit(GIF_DEFERRED_DELETE, &ip->i_flags);
+		spin_unlock(&gl->gl_lockref.lock);
+		evicted = !ip;
+	}
+	return evicted;
+}
+
 static void delete_work_func(struct work_struct *work)
 {
 	struct delayed_work *dwork = to_delayed_work(work);
@@ -792,6 +828,21 @@ static void delete_work_func(struct work_struct *work)
 	if (test_bit(GLF_INODE_CREATING, &gl->gl_flags))
 		goto out;
 
+	if (test_bit(GLF_DEMOTE, &gl->gl_flags)) {
+		/*
+		 * If we can evict the inode, give the remote node trying to
+		 * delete the inode some time before verifying that the delete
+		 * has happened.  Otherwise, if we cause contention on the inode glock
+		 * immediately, the remote node will think that we still have
+		 * the inode in use, and so it will give up waiting.
+		 */
+		if (gfs2_try_evict(gl)) {
+			if (gfs2_queue_delete_work(gl, 5 * HZ))
+				return;
+			goto out;
+		}
+	}
+
 	inode = gfs2_lookup_by_inum(sdp, no_addr, NULL, GFS2_BLKST_UNLINKED);
 	if (!IS_ERR_OR_NULL(inode)) {
 		d_prune_aliases(inode);
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index fdcf7a2f06c5..76ac2578e658 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -399,6 +399,7 @@ enum {
 	GIF_ORDERED		= 4,
 	GIF_FREE_VFS_INODE      = 5,
 	GIF_GLOP_PENDING	= 6,
+	GIF_DEFERRED_DELETE	= 7,
 };
 
 struct gfs2_inode {
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 71218a6fd9b4..7d8caf169efd 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1299,9 +1299,12 @@ static void gfs2_evict_inode(struct inode *inode)
 	if (test_bit(GIF_ALLOC_FAILED, &ip->i_flags)) {
 		BUG_ON(!gfs2_glock_is_locked_by_me(ip->i_gl));
 		gfs2_holder_mark_uninitialized(&gh);
-		goto alloc_failed;
+		goto out_delete;
 	}
 
+	if (test_bit(GIF_DEFERRED_DELETE, &ip->i_flags))
+		goto out;
+
 	/* Deletes should never happen under memory pressure anymore.  */
 	if (WARN_ON_ONCE(current->flags & PF_MEMALLOC))
 		goto out;
@@ -1333,7 +1336,7 @@ static void gfs2_evict_inode(struct inode *inode)
 	if (inode->i_nlink)
 		goto out_truncate;
 
-alloc_failed:
+out_delete:
 	if (gfs2_holder_initialized(&ip->i_iopen_gh) &&
 	    test_bit(HIF_HOLDER, &ip->i_iopen_gh.gh_iflags)) {
 		ip->i_iopen_gh.gh_flags |= GL_NOCACHE;
-- 
2.26.2

