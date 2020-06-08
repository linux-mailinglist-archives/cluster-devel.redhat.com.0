Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id DF4D91F1CB5
	for <lists+cluster-devel@lfdr.de>; Mon,  8 Jun 2020 18:02:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591632159;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eY6ixCm6xKQ4DTUOe1yRihAL0qJxyjG3gdt1fsDnYNw=;
	b=UpvPXmAtNgjVa9psCMAiL07bO31sGR24+CPtWUR2PL51c2vSWkXRZWtx5uN+n+bwwZ88hp
	a6+Qit+G9TcvA3lkDjxbpS6o0tsgh0+EpiyU4RFigEiyBGLWPombShUBzcEPil5MCs9aFf
	AmPeN8qraNi+ejUpjUn7VB8SsPfNC88=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-jY0v5dlqPQKRZ1tjmaz33w-1; Mon, 08 Jun 2020 12:02:29 -0400
X-MC-Unique: jY0v5dlqPQKRZ1tjmaz33w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D042835B5B;
	Mon,  8 Jun 2020 16:02:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BC077BA15;
	Mon,  8 Jun 2020 16:02:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 165951809554;
	Mon,  8 Jun 2020 16:02:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 058G13xQ011734 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 8 Jun 2020 12:01:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9E2BA60C1D; Mon,  8 Jun 2020 16:01:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.195.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D0CEE1CA;
	Mon,  8 Jun 2020 16:00:59 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon,  8 Jun 2020 18:00:31 +0200
Message-Id: <20200608160039.549204-13-agruenba@redhat.com>
In-Reply-To: <20200608160039.549204-1-agruenba@redhat.com>
References: <20200608160039.549204-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 12/20] gfs2: Try harder to delete inodes
	locally
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

When an inode's link count drops to zero and the inode is cached on
other nodes, the current behavior of gfs2 is to immediately give up and
to rely on the other node(s) to delete the inode if there is iopen glock
contention.  This leads to resource group glock bouncing and the loss of
caching.  With the previous patches in place, we can fix that by not
giving up immediately.

When the inode is still open on other nodes, those nodes won't be able
to evict the inode and give up the iopen glock.  In that case, our lock
conversion request will time out.  The unlink system call will block for
the duration of the iopen lock conversion request.  We're also holding
the inode glock in EX mode for an extended duration, so other nodes
won't be able to make progress on the inode, either.

This is worse than what we had before, but we can prevent other nodes
from getting stuck by aborting our iopen locking request if there is
contention on the inode glock.  This will the the subject of a future
patch.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/super.c | 53 +++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 47 insertions(+), 6 deletions(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 7d8caf169efd..bcb56f13f50a 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1258,6 +1258,50 @@ static void gfs2_glock_put_eventually(struct gfs2_glock *gl)
 		gfs2_glock_put(gl);
 }
 
+static bool gfs2_upgrade_iopen_glock(struct inode *inode)
+{
+	struct gfs2_inode *ip = GFS2_I(inode);
+	struct gfs2_sbd *sdp = GFS2_SB(inode);
+	struct gfs2_holder *gh = &ip->i_iopen_gh;
+	long timeout = 5 * HZ;
+	int error;
+
+	gh->gh_flags |= GL_NOCACHE;
+	gfs2_glock_dq_wait(gh);
+
+	/*
+	 * If there are no other lock holders, we'll get the lock immediately.
+	 * Otherwise, the other nodes holding the lock will be notified about
+	 * our locking request.  If they don't have the inode open, they'll
+	 * evict the cached inode and release the lock.  As a last resort,
+	 * we'll eventually time out.
+	 *
+	 * Note that we're passing the LM_FLAG_TRY_1CB flag to the first
+	 * locking request as an optimization to notify lock holders as soon as
+	 * possible.  Without that flag, they'd be notified implicitly by the
+	 * second locking request.
+	 */
+
+	gfs2_holder_reinit(LM_ST_EXCLUSIVE, LM_FLAG_TRY_1CB | GL_NOCACHE, gh);
+	error = gfs2_glock_nq(gh);
+	if (error != GLR_TRYFAILED)
+		return !error;
+
+	gfs2_holder_reinit(LM_ST_EXCLUSIVE, GL_ASYNC | GL_NOCACHE, gh);
+	error = gfs2_glock_nq(gh);
+	if (error)
+		return false;
+
+	timeout = wait_event_interruptible_timeout(sdp->sd_async_glock_wait,
+		!test_bit(HIF_WAIT, &gh->gh_iflags),
+		timeout);
+	if (!test_bit(HIF_HOLDER, &gh->gh_iflags)) {
+		gfs2_glock_dq(gh);
+		return false;
+	}
+	return true;
+}
+
 /**
  * gfs2_evict_inode - Remove an inode from cache
  * @inode: The inode to evict
@@ -1339,13 +1383,10 @@ static void gfs2_evict_inode(struct inode *inode)
 out_delete:
 	if (gfs2_holder_initialized(&ip->i_iopen_gh) &&
 	    test_bit(HIF_HOLDER, &ip->i_iopen_gh.gh_iflags)) {
-		ip->i_iopen_gh.gh_flags |= GL_NOCACHE;
-		gfs2_glock_dq_wait(&ip->i_iopen_gh);
-		gfs2_holder_reinit(LM_ST_EXCLUSIVE, LM_FLAG_TRY_1CB | GL_NOCACHE,
-				   &ip->i_iopen_gh);
-		error = gfs2_glock_nq(&ip->i_iopen_gh);
-		if (error)
+		if (!gfs2_upgrade_iopen_glock(inode)) {
+			gfs2_holder_uninit(&ip->i_iopen_gh);
 			goto out_truncate;
+		}
 	}
 
 	if (S_ISDIR(inode->i_mode) &&
-- 
2.26.2

