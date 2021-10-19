Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 950F8433787
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Oct 2021 15:45:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634651143;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ar3aKMr9iBBKOfCk36pQI1ZdlP0hI+S294ljh+uJbdI=;
	b=dbShKjHrNnm43h+p/kGzON5+ZeNfK07jYRobMKq60ijvZSg06dKxG5uFELoLirk0n7SS4Y
	usbPeMYlI8MDhNLXwS+mhpGdCuthglLZUxBOdLLUWQ02ftJxWK/7yS+TGCdb0Q3Egv9jWE
	7Db0SnYT7J2r/m/Z55F+8s9Q5gNUas4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-MD8SxgZpMpe5I5cYfE3DFA-1; Tue, 19 Oct 2021 09:45:40 -0400
X-MC-Unique: MD8SxgZpMpe5I5cYfE3DFA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA3BC180831B;
	Tue, 19 Oct 2021 13:45:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD23860657;
	Tue, 19 Oct 2021 13:45:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DFC054E58E;
	Tue, 19 Oct 2021 13:45:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19JDh4aY024565 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 19 Oct 2021 09:43:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1E2DA10016FC; Tue, 19 Oct 2021 13:43:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.193.143])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 633591037F44;
	Tue, 19 Oct 2021 13:42:48 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Date: Tue, 19 Oct 2021 15:41:57 +0200
Message-Id: <20211019134204.3382645-11-agruenba@redhat.com>
In-Reply-To: <20211019134204.3382645-1-agruenba@redhat.com>
References: <20211019134204.3382645-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: kvm-ppc@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>,
	cluster-devel@redhat.com, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org,
	ocfs2-devel@oss.oracle.com
Subject: [Cluster-devel] [PATCH v8 10/17] gfs2: Eliminate ip->i_gh
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

Now that gfs2_file_buffered_write is the only remaining user of
ip->i_gh, we can move the glock holder to the stack (or rather, use the
one we already have on the stack); there is no need for keeping the
holder in the inode anymore.

This is slightly complicated by the fact that we're using ip->i_gh for
the statfs inode in gfs2_file_buffered_write as well.  Writing to the
statfs inode isn't very common, so allocate the statfs holder
dynamically when needed.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/file.c   | 34 +++++++++++++++++++++-------------
 fs/gfs2/incore.h |  3 +--
 2 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 13282f57da37..8f37e4bab995 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -876,16 +876,25 @@ static ssize_t gfs2_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
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
 	ssize_t ret;
 
-	gfs2_holder_init(ip->i_gl, LM_ST_EXCLUSIVE, 0, &ip->i_gh);
-	ret = gfs2_glock_nq(&ip->i_gh);
+	if (inode == sdp->sd_rindex) {
+		statfs_gh = kmalloc(sizeof(*statfs_gh), GFP_NOFS);
+		if (!statfs_gh)
+			return -ENOMEM;
+	}
+
+	gfs2_holder_init(ip->i_gl, LM_ST_EXCLUSIVE, 0, gh);
+	ret = gfs2_glock_nq(gh);
 	if (ret)
 		goto out_uninit;
 
@@ -893,7 +902,7 @@ static ssize_t gfs2_file_buffered_write(struct kiocb *iocb, struct iov_iter *fro
 		struct gfs2_inode *m_ip = GFS2_I(sdp->sd_statfs_inode);
 
 		ret = gfs2_glock_nq_init(m_ip->i_gl, LM_ST_EXCLUSIVE,
-					 GL_NOCACHE, &m_ip->i_gh);
+					 GL_NOCACHE, statfs_gh);
 		if (ret)
 			goto out_unlock;
 	}
@@ -904,16 +913,15 @@ static ssize_t gfs2_file_buffered_write(struct kiocb *iocb, struct iov_iter *fro
 	if (ret > 0)
 		iocb->ki_pos += ret;
 
-	if (inode == sdp->sd_rindex) {
-		struct gfs2_inode *m_ip = GFS2_I(sdp->sd_statfs_inode);
-
-		gfs2_glock_dq_uninit(&m_ip->i_gh);
-	}
+	if (inode == sdp->sd_rindex)
+		gfs2_glock_dq_uninit(statfs_gh);
 
 out_unlock:
-	gfs2_glock_dq(&ip->i_gh);
+	gfs2_glock_dq(gh);
 out_uninit:
-	gfs2_holder_uninit(&ip->i_gh);
+	gfs2_holder_uninit(gh);
+	if (statfs_gh)
+		kfree(statfs_gh);
 	return ret;
 }
 
@@ -968,7 +976,7 @@ static ssize_t gfs2_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 			goto out_unlock;
 
 		iocb->ki_flags |= IOCB_DSYNC;
-		buffered = gfs2_file_buffered_write(iocb, from);
+		buffered = gfs2_file_buffered_write(iocb, from, &gh);
 		if (unlikely(buffered <= 0)) {
 			if (!ret)
 				ret = buffered;
@@ -989,7 +997,7 @@ static ssize_t gfs2_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		if (!ret || ret2 > 0)
 			ret += ret2;
 	} else {
-		ret = gfs2_file_buffered_write(iocb, from);
+		ret = gfs2_file_buffered_write(iocb, from, &gh);
 		if (likely(ret > 0))
 			ret = generic_write_sync(iocb, ret);
 	}
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 58b7bac501e4..ca42d310fd4d 100644
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

