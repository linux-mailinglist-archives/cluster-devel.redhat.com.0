Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B2F9D3F20F8
	for <lists+cluster-devel@lfdr.de>; Thu, 19 Aug 2021 21:45:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629402327;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mNOq9vRSTRt64SmqSypXyJu5mHDnGeZ3glMXa6U95nQ=;
	b=Zn4PaJ9wOnL3htcUGOA3/yvkBH5tr7Xmust7k9GjVqjQCjBZcP5/Y4r/1MFZOaNtfB2/ZB
	X+vGlRlLkdCXedPvNh8FkLwzcTK7WdvWgTH4FPly7DNIEkA5MnvVEc7znjZ1ZXp80ySDtk
	AbtOpja9IPVr9JEaTPmkQESzXYFor+g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-eh67nQ8hM5CJI4xpSvUvWg-1; Thu, 19 Aug 2021 15:45:26 -0400
X-MC-Unique: eh67nQ8hM5CJI4xpSvUvWg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7427B87D542;
	Thu, 19 Aug 2021 19:45:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6591460C04;
	Thu, 19 Aug 2021 19:45:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 508474BB7C;
	Thu, 19 Aug 2021 19:45:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17JJgNtq014820 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 19 Aug 2021 15:42:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8AE7E60938; Thu, 19 Aug 2021 19:42:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.194.206])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EC12A1B46B;
	Thu, 19 Aug 2021 19:42:20 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christoph Hellwig <hch@infradead.org>,
	"Darrick J. Wong" <djwong@kernel.org>
Date: Thu, 19 Aug 2021 21:41:02 +0200
Message-Id: <20210819194102.1491495-20-agruenba@redhat.com>
In-Reply-To: <20210819194102.1491495-1-agruenba@redhat.com>
References: <20210819194102.1491495-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, ocfs2-devel@oss.oracle.com
Subject: [Cluster-devel] [PATCH v6 19/19] gfs2: Eliminate ip->i_gh
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Now that gfs2_file_buffered_write is the only remaining user of
ip->i_gh, we can allocate a glock holder on the stack and use that
instead.

This is slightly complicated by the fact that we're using ip->i_gh for
the statfs inode in gfs2_file_buffered_write as well.  Since writing to
the statfs inode isn't very common, allocate the statfs holder
dynamically when needed.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/file.c   | 42 +++++++++++++++++++++++++-----------------
 fs/gfs2/incore.h |  3 +--
 2 files changed, 26 insertions(+), 19 deletions(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 2cf3466b9dde..9729cb3483c0 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -1010,12 +1010,15 @@ static ssize_t gfs2_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 	return written ? written : ret;
 }
 
-static ssize_t gfs2_file_buffered_write(struct kiocb *iocb, struct iov_iter *from)
+static ssize_t gfs2_file_buffered_write(struct kiocb *iocb,
+					struct iov_iter *from,
+					struct gfs2_holder *gh)
 {
 	struct file *file = iocb->ki_filp;
 	struct inode *inode = file_inode(file);
 	struct gfs2_inode *ip = GFS2_I(inode);
 	struct gfs2_sbd *sdp = GFS2_SB(inode);
+	struct gfs2_holder *statfs_gh = NULL;
 	size_t prev_count = 0, window_size = 0;
 	size_t read = 0;
 	ssize_t ret;
@@ -1026,9 +1029,15 @@ static ssize_t gfs2_file_buffered_write(struct kiocb *iocb, struct iov_iter *fro
 	 * inode glock, fault in the pages manually, and retry.
 	 */
 
-	gfs2_holder_init(ip->i_gl, LM_ST_EXCLUSIVE, 0, &ip->i_gh);
+	if (inode == sdp->sd_rindex) {
+		statfs_gh = kmalloc(sizeof(*statfs_gh), GFP_NOFS);
+		if (!statfs_gh)
+			return -ENOMEM;
+	}
+
+	gfs2_holder_init(ip->i_gl, LM_ST_EXCLUSIVE, 0, gh);
 retry:
-	ret = gfs2_glock_nq(&ip->i_gh);
+	ret = gfs2_glock_nq(gh);
 	if (ret)
 		goto out_uninit;
 retry_under_glock:
@@ -1036,7 +1045,7 @@ static ssize_t gfs2_file_buffered_write(struct kiocb *iocb, struct iov_iter *fro
 		struct gfs2_inode *m_ip = GFS2_I(sdp->sd_statfs_inode);
 
 		ret = gfs2_glock_nq_init(m_ip->i_gl, LM_ST_EXCLUSIVE,
-					 GL_NOCACHE, &m_ip->i_gh);
+					 GL_NOCACHE, statfs_gh);
 		if (ret)
 			goto out_unlock;
 	}
@@ -1049,20 +1058,17 @@ static ssize_t gfs2_file_buffered_write(struct kiocb *iocb, struct iov_iter *fro
 	if (ret > 0)
 		read += ret;
 
-	if (inode == sdp->sd_rindex) {
-		struct gfs2_inode *m_ip = GFS2_I(sdp->sd_statfs_inode);
-
-		gfs2_glock_dq_uninit(&m_ip->i_gh);
-	}
+	if (inode == sdp->sd_rindex)
+		gfs2_glock_dq_uninit(statfs_gh);
 	if (unlikely(iov_iter_count(from) && (ret > 0 || ret == -EFAULT)) &&
 	    should_fault_in_pages(from, &prev_count, &window_size)) {
 		size_t leftover;
 
-		gfs2_holder_allow_demote(&ip->i_gh);
+		gfs2_holder_allow_demote(gh);
 		leftover = fault_in_iov_iter_readable(from, window_size);
-		gfs2_holder_disallow_demote(&ip->i_gh);
+		gfs2_holder_disallow_demote(gh);
 		if (leftover != window_size) {
-			if (!gfs2_holder_queued(&ip->i_gh)) {
+			if (!gfs2_holder_queued(gh)) {
 				if (read)
 					goto out_uninit;
 				goto retry;
@@ -1071,10 +1077,12 @@ static ssize_t gfs2_file_buffered_write(struct kiocb *iocb, struct iov_iter *fro
 		}
 	}
 out_unlock:
-	if (gfs2_holder_queued(&ip->i_gh))
-		gfs2_glock_dq(&ip->i_gh);
+	if (gfs2_holder_queued(gh))
+		gfs2_glock_dq(gh);
 out_uninit:
-	gfs2_holder_uninit(&ip->i_gh);
+	gfs2_holder_uninit(gh);
+	if (statfs_gh)
+		kfree(statfs_gh);
 	return read ? read : ret;
 }
 
@@ -1129,7 +1137,7 @@ static ssize_t gfs2_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 			goto out_unlock;
 
 		iocb->ki_flags |= IOCB_DSYNC;
-		buffered = gfs2_file_buffered_write(iocb, from);
+		buffered = gfs2_file_buffered_write(iocb, from, &gh);
 		if (unlikely(buffered <= 0)) {
 			if (!ret)
 				ret = buffered;
@@ -1151,7 +1159,7 @@ static ssize_t gfs2_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		if (!ret || ret2 > 0)
 			ret += ret2;
 	} else {
-		ret = gfs2_file_buffered_write(iocb, from);
+		ret = gfs2_file_buffered_write(iocb, from, &gh);
 		if (likely(ret > 0)) {
 			iocb->ki_pos += ret;
 			ret = generic_write_sync(iocb, ret);
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index e73a81db0714..87abdcc1de0c 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -387,9 +387,8 @@ struct gfs2_inode {
 	u64 i_generation;
 	u64 i_eattr;
 	unsigned long i_flags;		/* GIF_... */
-	struct gfs2_glock *i_gl; /* Move into i_gh? */
+	struct gfs2_glock *i_gl;
 	struct gfs2_holder i_iopen_gh;
-	struct gfs2_holder i_gh; /* for prepare/commit_write only */
 	struct gfs2_qadata *i_qadata; /* quota allocation data */
 	struct gfs2_holder i_rgd_gh;
 	struct gfs2_blkreserv i_res; /* rgrp multi-block reservation */
-- 
2.26.3

