Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE874337AB
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Oct 2021 15:48:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634651283;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MGsX/Ml84CMC+OjHlH5RDMfLJcW/FIl8Qk/LyCJCDBE=;
	b=aOQfO2aKf0CBji4DwA8z+7elwXWrccqDyj/X777WxlsbJzxX7gRe3uMDjZBzrN9vCNIywP
	JDjwla3Wwx3lqIX1ArpS9h3gkZhXai4QuWM8KqHcHGfh+CLcBVXcMIftnffYBIm6u5kDGV
	aI/PteQBAAPy+N1u0vAIhkPUxDvDshw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-oy69fK82MA6LBqcd95Qg9A-1; Tue, 19 Oct 2021 09:46:15 -0400
X-MC-Unique: oy69fK82MA6LBqcd95Qg9A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 192E510A8E06;
	Tue, 19 Oct 2021 13:46:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BA6860657;
	Tue, 19 Oct 2021 13:46:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4DEF94E58E;
	Tue, 19 Oct 2021 13:46:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19JDk96c026730 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 19 Oct 2021 09:46:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BE15B10023AB; Tue, 19 Oct 2021 13:46:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.193.143])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3A35A102AE42;
	Tue, 19 Oct 2021 13:45:59 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Date: Tue, 19 Oct 2021 15:42:04 +0200
Message-Id: <20211019134204.3382645-18-agruenba@redhat.com>
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
Subject: [Cluster-devel] [PATCH v8 17/17] gfs2: Fix mmap + page fault
	deadlocks for direct I/O
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

Also disable page faults during direct I/O requests and implement a
similar kind of retry logic as in the buffered I/O case.

The retry logic in the direct I/O case differs from the buffered I/O
case in the following way: direct I/O doesn't provide the kinds of
consistency guarantees between concurrent reads and writes that buffered
I/O provides, so once we lose the inode glock while faulting in user
pages, we always resume the operation.  We never need to return a
partial read or write.

This locking problem was originally reported by Jan Kara.  Linus came up
with the idea of disabling page faults.  Many thanks to Al Viro and
Matthew Wilcox for their feedback.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/file.c | 101 +++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 89 insertions(+), 12 deletions(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index ae06defcf369..a8e440b4d21c 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -811,22 +811,65 @@ static ssize_t gfs2_file_direct_read(struct kiocb *iocb, struct iov_iter *to,
 {
 	struct file *file = iocb->ki_filp;
 	struct gfs2_inode *ip = GFS2_I(file->f_mapping->host);
-	size_t count = iov_iter_count(to);
+	size_t prev_count = 0, window_size = 0;
+	size_t written = 0;
 	ssize_t ret;
 
-	if (!count)
+	/*
+	 * In this function, we disable page faults when we're holding the
+	 * inode glock while doing I/O.  If a page fault occurs, we indicate
+	 * that the inode glock may be dropped, fault in the pages manually,
+	 * and retry.
+	 *
+	 * Unlike generic_file_read_iter, for reads, iomap_dio_rw can trigger
+	 * physical as well as manual page faults, and we need to disable both
+	 * kinds.
+	 *
+	 * For direct I/O, gfs2 takes the inode glock in deferred mode.  This
+	 * locking mode is compatible with other deferred holders, so multiple
+	 * processes and nodes can do direct I/O to a file at the same time.
+	 * There's no guarantee that reads or writes will be atomic.  Any
+	 * coordination among readers and writers needs to happen externally.
+	 */
+
+	if (!iov_iter_count(to))
 		return 0; /* skip atime */
 
 	gfs2_holder_init(ip->i_gl, LM_ST_DEFERRED, 0, gh);
+retry:
 	ret = gfs2_glock_nq(gh);
 	if (ret)
 		goto out_uninit;
+retry_under_glock:
+	pagefault_disable();
+	to->nofault = true;
+	ret = iomap_dio_rw(iocb, to, &gfs2_iomap_ops, NULL,
+			   IOMAP_DIO_PARTIAL, written);
+	to->nofault = false;
+	pagefault_enable();
+	if (ret > 0)
+		written = ret;
 
-	ret = iomap_dio_rw(iocb, to, &gfs2_iomap_ops, NULL, 0, 0);
-	gfs2_glock_dq(gh);
+	if (unlikely(iov_iter_count(to) && (ret > 0 || ret == -EFAULT)) &&
+	    should_fault_in_pages(to, &prev_count, &window_size)) {
+		size_t leftover;
+
+		gfs2_holder_allow_demote(gh);
+		leftover = fault_in_iov_iter_writeable(to, window_size);
+		gfs2_holder_disallow_demote(gh);
+		if (leftover != window_size) {
+			if (!gfs2_holder_queued(gh))
+				goto retry;
+			goto retry_under_glock;
+		}
+	}
+	if (gfs2_holder_queued(gh))
+		gfs2_glock_dq(gh);
 out_uninit:
 	gfs2_holder_uninit(gh);
-	return ret;
+	if (ret < 0)
+		return ret;
+	return written;
 }
 
 static ssize_t gfs2_file_direct_write(struct kiocb *iocb, struct iov_iter *from,
@@ -835,10 +878,20 @@ static ssize_t gfs2_file_direct_write(struct kiocb *iocb, struct iov_iter *from,
 	struct file *file = iocb->ki_filp;
 	struct inode *inode = file->f_mapping->host;
 	struct gfs2_inode *ip = GFS2_I(inode);
-	size_t len = iov_iter_count(from);
-	loff_t offset = iocb->ki_pos;
+	size_t prev_count = 0, window_size = 0;
+	size_t read = 0;
 	ssize_t ret;
 
+	/*
+	 * In this function, we disable page faults when we're holding the
+	 * inode glock while doing I/O.  If a page fault occurs, we indicate
+	 * that the inode glock may be dropped, fault in the pages manually,
+	 * and retry.
+	 *
+	 * For writes, iomap_dio_rw only triggers manual page faults, so we
+	 * don't need to disable physical ones.
+	 */
+
 	/*
 	 * Deferred lock, even if its a write, since we do no allocation on
 	 * this path. All we need to change is the atime, and this lock mode
@@ -848,22 +901,46 @@ static ssize_t gfs2_file_direct_write(struct kiocb *iocb, struct iov_iter *from,
 	 * VFS does.
 	 */
 	gfs2_holder_init(ip->i_gl, LM_ST_DEFERRED, 0, gh);
+retry:
 	ret = gfs2_glock_nq(gh);
 	if (ret)
 		goto out_uninit;
-
+retry_under_glock:
 	/* Silently fall back to buffered I/O when writing beyond EOF */
-	if (offset + len > i_size_read(&ip->i_inode))
+	if (iocb->ki_pos + iov_iter_count(from) > i_size_read(&ip->i_inode))
 		goto out;
 
-	ret = iomap_dio_rw(iocb, from, &gfs2_iomap_ops, NULL, 0, 0);
+	from->nofault = true;
+	ret = iomap_dio_rw(iocb, from, &gfs2_iomap_ops, NULL,
+			   IOMAP_DIO_PARTIAL, read);
+	from->nofault = false;
+
 	if (ret == -ENOTBLK)
 		ret = 0;
+	if (ret > 0)
+		read = ret;
+
+	if (unlikely(iov_iter_count(from) && (ret > 0 || ret == -EFAULT)) &&
+	    should_fault_in_pages(from, &prev_count, &window_size)) {
+		size_t leftover;
+
+		gfs2_holder_allow_demote(gh);
+		leftover = fault_in_iov_iter_readable(from, window_size);
+		gfs2_holder_disallow_demote(gh);
+		if (leftover != window_size) {
+			if (!gfs2_holder_queued(gh))
+				goto retry;
+			goto retry_under_glock;
+		}
+	}
 out:
-	gfs2_glock_dq(gh);
+	if (gfs2_holder_queued(gh))
+		gfs2_glock_dq(gh);
 out_uninit:
 	gfs2_holder_uninit(gh);
-	return ret;
+	if (ret < 0)
+		return ret;
+	return read;
 }
 
 static ssize_t gfs2_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
-- 
2.26.3

