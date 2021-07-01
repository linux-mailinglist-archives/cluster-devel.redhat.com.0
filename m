Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5DFEE3B97C4
	for <lists+cluster-devel@lfdr.de>; Thu,  1 Jul 2021 22:44:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1625172250;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/rlxSk4TpBTCOQxjT8/d0pQ0I9sTjA/v3s2Ukk0Nuz8=;
	b=KaH402Kc6Q7rLmx9vfVUdxo5PAiBt0W/mpakaYxaYzr5QeYuikDEYedOKzhJ7Fe7212rLj
	gTYEuaXKTPj2VVdYA+Ld69SfTvgH6mx7lJiA0MTQQPIDERNfpqKj4zPP/5SDphGx2ZZMzI
	Hp/6pxEwNcjUIrpCtN0AaR/Q1oyqUYk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-t6DFBtVuNFOiabPcgsBS2g-1; Thu, 01 Jul 2021 16:44:09 -0400
X-MC-Unique: t6DFBtVuNFOiabPcgsBS2g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5FEB4802C92;
	Thu,  1 Jul 2021 20:44:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BC4260C17;
	Thu,  1 Jul 2021 20:44:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4F6414EA2F;
	Thu,  1 Jul 2021 20:44:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 161Kgug8008730 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 1 Jul 2021 16:42:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4D2AA19D9B; Thu,  1 Jul 2021 20:42:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.193.232])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0E05B19C45;
	Thu,  1 Jul 2021 20:42:47 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu,  1 Jul 2021 22:42:46 +0200
Message-Id: <20210701204246.2037142-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [Cluster-devel] [PATCH] gfs2: Fix mmap + page fault deadlocks
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

Hi Linus,

here's another attempt at fixing the mmap + page fault deadlocks we're
seeing on gfs2.  Still not ideal because get_user_pages_fast ignores the
current->pagefault_disabled flag, but at least this fixes the
easy-to-exploit problems.  Would you mind having a look?

For getting get_user_pages_fast changed to fix this properly, I'd need
help from the memory management folks.  With that, we could get rid of
the pagefault_disabled() checks in gfs2_page_mkwrite and gfs2_fault.

Thanks,
Andreas

--

In the .read_iter and .write_iter file operations, we're accessing
user-space memory while holding the inode's glock.  There's a possibility
that the memory is mapped to the same file, in which case we'd recurse on
the same glock.  More complex scenarios can involve multiple glocks,
processes, and cluster nodes.

This patch avoids these kinds of problems by disabling page faults during
read and write operations.  If a page fault occurs, we either end up with a
partial read or write, or with -EFAULT if nothing could be read or written.
In that case, we drop the outer glock, fault in the pages manually, and
repeat the operation.

The caveat is that direct I/O doesn't trigger page faults.  Instead, it
faults in user pages manually via bio_iov_iter_get_pages ->
iov_iter_get_pages -> get_user_pages_fast, which ignores the
current->pagefault_disabled flag.  The consequence is that we can end up in
a random .fault or .page_mkwrite vm operation with page faults disabled,
which can lead to the same kind of deadlock (directly if we end up in
gfs2_fault or gfs2_page_mkwrite; indirectly if we happen to end up in a
handler that ultimately depends on the glock we're holding).

I believe it would make sense to change get_user_pages_fast to check for
the pagefault_disabled flag.  Meanwhile, we can at least check if page
faults are disabled in gfs2_fault and gfs2_page_mkwrite to prevent gfs2
from directly faulting in pages when it shouldn't.

This case of recursive locking was originally reported by Jan Kara.
Disabling page faults was suggested by Linus, with help from Al Viro and
Matthew Wilcox.

Reported-by: Jan Kara <jack@suse.cz>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/file.c | 81 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 55ec1cadc9e6..5b1af227d0b9 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -433,6 +433,14 @@ static vm_fault_t gfs2_page_mkwrite(struct vm_fault *vmf)
 	loff_t size;
 	int err;
 
+	if (pagefault_disabled()) {
+		/*
+		 * Direct I/O; pagefault_disabled flag ignored by
+		 * iov_iter_get_pages -> get_user_pages_fast.
+		 */
+		return VM_FAULT_SIGBUS;
+	}
+
 	sb_start_pagefault(inode->i_sb);
 
 	gfs2_holder_init(ip->i_gl, LM_ST_EXCLUSIVE, 0, &gh);
@@ -561,6 +569,14 @@ static vm_fault_t gfs2_fault(struct vm_fault *vmf)
 	vm_fault_t ret;
 	int err;
 
+	if (pagefault_disabled()) {
+		/*
+		 * Direct I/O; pagefault_disabled flag ignored by
+		 * iov_iter_get_pages -> get_user_pages_fast.
+		 */
+		return VM_FAULT_SIGBUS;
+	}
+
 	gfs2_holder_init(ip->i_gl, LM_ST_SHARED, 0, &gh);
 	err = gfs2_glock_nq(&gh);
 	if (err) {
@@ -776,25 +792,59 @@ static int gfs2_fsync(struct file *file, loff_t start, loff_t end,
 	return ret ? ret : ret1;
 }
 
+static bool gfs2_fault_in_pages(struct iov_iter *i, struct page ***pages,
+				unsigned int *nrpages)
+{
+	size_t start;
+	ssize_t size;
+
+	if (*pages)
+		return false;
+	size = iov_iter_get_pages_alloc(i, pages, 256 * PAGE_SIZE, &start);
+	if (size < 0)
+		return false;
+	*nrpages = DIV_ROUND_UP(start + size, PAGE_SIZE);
+	return true;
+}
+
+static void gfs2_release_pages(struct page **pages, unsigned int nrpages)
+{
+	unsigned int i;
+
+	for (i = 0; i < nrpages; i++)
+		put_page(pages[i]);
+	kvfree(pages);
+}
+
 static ssize_t gfs2_file_direct_read(struct kiocb *iocb, struct iov_iter *to,
 				     struct gfs2_holder *gh)
 {
 	struct file *file = iocb->ki_filp;
 	struct gfs2_inode *ip = GFS2_I(file->f_mapping->host);
 	size_t count = iov_iter_count(to);
+	struct page **pages = NULL;
+	unsigned int nrpages;
 	ssize_t ret;
 
 	if (!count)
 		return 0; /* skip atime */
 
 	gfs2_holder_init(ip->i_gl, LM_ST_DEFERRED, 0, gh);
+retry:
 	ret = gfs2_glock_nq(gh);
 	if (ret)
 		goto out_uninit;
 
+	pagefault_disable();
 	ret = iomap_dio_rw(iocb, to, &gfs2_iomap_ops, NULL, 0);
+	pagefault_enable();
 	gfs2_glock_dq(gh);
+	if (unlikely(ret == -EFAULT) &&
+	    gfs2_fault_in_pages(to, &pages, &nrpages))
+		goto retry;
 out_uninit:
+	if (unlikely(pages))
+		gfs2_release_pages(pages, nrpages);
 	gfs2_holder_uninit(gh);
 	return ret;
 }
@@ -807,6 +857,8 @@ static ssize_t gfs2_file_direct_write(struct kiocb *iocb, struct iov_iter *from,
 	struct gfs2_inode *ip = GFS2_I(inode);
 	size_t len = iov_iter_count(from);
 	loff_t offset = iocb->ki_pos;
+	struct page **pages = NULL;
+	unsigned int nrpages;
 	ssize_t ret;
 
 	/*
@@ -818,6 +870,7 @@ static ssize_t gfs2_file_direct_write(struct kiocb *iocb, struct iov_iter *from,
 	 * VFS does.
 	 */
 	gfs2_holder_init(ip->i_gl, LM_ST_DEFERRED, 0, gh);
+retry:
 	ret = gfs2_glock_nq(gh);
 	if (ret)
 		goto out_uninit;
@@ -826,18 +879,27 @@ static ssize_t gfs2_file_direct_write(struct kiocb *iocb, struct iov_iter *from,
 	if (offset + len > i_size_read(&ip->i_inode))
 		goto out;
 
+	pagefault_disable();
 	ret = iomap_dio_rw(iocb, from, &gfs2_iomap_ops, NULL, 0);
+	pagefault_enable();
 	if (ret == -ENOTBLK)
 		ret = 0;
 out:
 	gfs2_glock_dq(gh);
+	if (unlikely(ret == -EFAULT) &&
+	    gfs2_fault_in_pages(from, &pages, &nrpages))
+		goto retry;
 out_uninit:
+	if (unlikely(pages))
+		gfs2_release_pages(pages, nrpages);
 	gfs2_holder_uninit(gh);
 	return ret;
 }
 
 static ssize_t gfs2_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 {
+	struct page **pages = NULL;
+	unsigned int nrpages;
 	struct gfs2_inode *ip;
 	struct gfs2_holder gh;
 	size_t written = 0;
@@ -864,14 +926,22 @@ static ssize_t gfs2_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 	}
 	ip = GFS2_I(iocb->ki_filp->f_mapping->host);
 	gfs2_holder_init(ip->i_gl, LM_ST_SHARED, 0, &gh);
+retry:
 	ret = gfs2_glock_nq(&gh);
 	if (ret)
 		goto out_uninit;
+	pagefault_disable();
 	ret = generic_file_read_iter(iocb, to);
+	pagefault_enable();
 	if (ret > 0)
 		written += ret;
 	gfs2_glock_dq(&gh);
+	if (unlikely(ret == -EFAULT) &&
+	    gfs2_fault_in_pages(to, &pages, &nrpages))
+		goto retry;
 out_uninit:
+	if (unlikely(pages))
+		gfs2_release_pages(pages, nrpages);
 	gfs2_holder_uninit(&gh);
 	return written ? written : ret;
 }
@@ -880,11 +950,22 @@ static ssize_t gfs2_file_buffered_write(struct kiocb *iocb, struct iov_iter *fro
 {
 	struct file *file = iocb->ki_filp;
 	struct inode *inode = file_inode(file);
+	struct page **pages = NULL;
+	unsigned int nrpages;
 	ssize_t ret;
 
+retry:
 	current->backing_dev_info = inode_to_bdi(inode);
+	pagefault_disable();
 	ret = iomap_file_buffered_write(iocb, from, &gfs2_iomap_ops);
+	pagefault_enable();
 	current->backing_dev_info = NULL;
+	if (unlikely(ret == -EFAULT) &&
+	    gfs2_fault_in_pages(from, &pages, &nrpages))
+		goto retry;
+	if (unlikely(pages))
+		gfs2_release_pages(pages, nrpages);
+
 	return ret;
 }
 
-- 
2.26.3

