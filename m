Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 85A5A20056E
	for <lists+cluster-devel@lfdr.de>; Fri, 19 Jun 2020 11:40:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592559615;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lrk5imypRvlh6Xm/35IKdaRrF7e1DPYFegz850ZqocU=;
	b=GbQ5Q/B4G17q9LzSnGmKazLkgkWkFca3EAFuLPdu5ffLBzGobThVM1QrKyin7a60wsr+vK
	2fjKeYlyjScKbA0j33p6TR9DWMH27649iIUJx3vDXD8ryccOo1wHqxpQ8GzteL0wUNz4r+
	RclxKOq4Cds0GNtcoU/YLSQ2MV5lEqM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-80tpd4LlPJ2m2QzfSZZZfQ-1; Fri, 19 Jun 2020 05:39:45 -0400
X-MC-Unique: 80tpd4LlPJ2m2QzfSZZZfQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA7058015CB;
	Fri, 19 Jun 2020 09:39:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA87C60E1C;
	Fri, 19 Jun 2020 09:39:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C18FB1809547;
	Fri, 19 Jun 2020 09:39:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05J9deAL004734 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 05:39:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C5BEF5D9F3; Fri, 19 Jun 2020 09:39:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.195.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 494C05D9CA;
	Fri, 19 Jun 2020 09:39:35 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Matthew Wilcox <willy@infradead.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 19 Jun 2020 11:39:16 +0200
Message-Id: <20200619093916.1081129-3-agruenba@redhat.com>
In-Reply-To: <20200619093916.1081129-1-agruenba@redhat.com>
References: <20200619093916.1081129-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-ext4@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
	Junxiao Bi <junxiao.bi@oracle.com>, linux-xfs <linux-xfs@vger.kernel.org>,
	William Kucharski <william.kucharski@oracle.com>,
	Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-erofs@lists.ozlabs.org, linux-mm@kvack.org,
	ocfs2-devel@oss.oracle.com
Subject: [Cluster-devel] [PATCH 2/2] gfs2: Rework read and page fault locking
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

The cache consistency model of filesystems like gfs2 is such that if
data is found in the page cache, the data is up to date and can be used
without taking any filesystem locks.  If a page is not cached,
filesystem locks must be taken before populating the page cache.

Thus far,  gfs2 has taken the filesystem locks inside the ->readpage and
->readpages address space operations.  This was already causing lock
ordering problems, but commit d4388340ae0b ("fs: convert mpage_readpages
to mpage_readahead") made things worse: the ->readahead operation is
called with the pages to readahead locked, so grabbing the inode's glock
can now deadlock with processes which are holding the inode glock while
trying to lock the same pages.

Fix this by taking the inode glock in the ->read_iter file and ->fault
vm operations.  To avoid taking the inode glock when the data is already
cached, the ->read_iter file operation first tries to read the data with
the IOCB_CACHED flag set.  If that fails, the inode glock is locked and
the operation is repeated without the IOCB_CACHED flag.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/aops.c | 27 ++--------------------
 fs/gfs2/file.c | 61 ++++++++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 61 insertions(+), 27 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index 72c9560f4467..73c2fe768a3f 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -513,26 +513,10 @@ static int __gfs2_readpage(void *file, struct page *page)
 
 static int gfs2_readpage(struct file *file, struct page *page)
 {
-	struct address_space *mapping = page->mapping;
-	struct gfs2_inode *ip = GFS2_I(mapping->host);
-	struct gfs2_holder gh;
 	int error;
 
-	unlock_page(page);
-	gfs2_holder_init(ip->i_gl, LM_ST_SHARED, 0, &gh);
-	error = gfs2_glock_nq(&gh);
-	if (unlikely(error))
-		goto out;
-	error = AOP_TRUNCATED_PAGE;
-	lock_page(page);
-	if (page->mapping == mapping && !PageUptodate(page))
-		error = __gfs2_readpage(file, page);
-	else
-		unlock_page(page);
-	gfs2_glock_dq(&gh);
-out:
-	gfs2_holder_uninit(&gh);
-	if (error && error != AOP_TRUNCATED_PAGE)
+	error = __gfs2_readpage(file, page);
+	if (error)
 		lock_page(page);
 	return error;
 }
@@ -598,16 +582,9 @@ static void gfs2_readahead(struct readahead_control *rac)
 {
 	struct inode *inode = rac->mapping->host;
 	struct gfs2_inode *ip = GFS2_I(inode);
-	struct gfs2_holder gh;
 
-	gfs2_holder_init(ip->i_gl, LM_ST_SHARED, 0, &gh);
-	if (gfs2_glock_nq(&gh))
-		goto out_uninit;
 	if (!gfs2_is_stuffed(ip))
 		mpage_readahead(rac, gfs2_block_map);
-	gfs2_glock_dq(&gh);
-out_uninit:
-	gfs2_holder_uninit(&gh);
 }
 
 /**
diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index fe305e4bfd37..f729b0ff2a3c 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -558,8 +558,29 @@ static vm_fault_t gfs2_page_mkwrite(struct vm_fault *vmf)
 	return block_page_mkwrite_return(ret);
 }
 
+static vm_fault_t gfs2_fault(struct vm_fault *vmf)
+{
+	struct inode *inode = file_inode(vmf->vma->vm_file);
+	struct gfs2_inode *ip = GFS2_I(inode);
+	struct gfs2_holder gh;
+	vm_fault_t ret;
+	int err;
+
+	gfs2_holder_init(ip->i_gl, LM_ST_SHARED, 0, &gh);
+	err = gfs2_glock_nq(&gh);
+	if (err) {
+		ret = block_page_mkwrite_return(err);
+		goto out_uninit;
+	}
+	ret = filemap_fault(vmf);
+	gfs2_glock_dq(&gh);
+out_uninit:
+	gfs2_holder_uninit(&gh);
+	return ret;
+}
+
 static const struct vm_operations_struct gfs2_vm_ops = {
-	.fault = filemap_fault,
+	.fault = gfs2_fault,
 	.map_pages = filemap_map_pages,
 	.page_mkwrite = gfs2_page_mkwrite,
 };
@@ -824,15 +845,51 @@ static ssize_t gfs2_file_direct_write(struct kiocb *iocb, struct iov_iter *from)
 
 static ssize_t gfs2_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 {
+	struct gfs2_inode *ip;
+	struct gfs2_holder gh;
+	size_t written = 0;
 	ssize_t ret;
 
+	gfs2_holder_mark_uninitialized(&gh);
 	if (iocb->ki_flags & IOCB_DIRECT) {
 		ret = gfs2_file_direct_read(iocb, to);
 		if (likely(ret != -ENOTBLK))
 			return ret;
 		iocb->ki_flags &= ~IOCB_DIRECT;
 	}
-	return generic_file_read_iter(iocb, to);
+	iocb->ki_flags |= IOCB_CACHED;
+	ret = generic_file_read_iter(iocb, to);
+	iocb->ki_flags &= ~IOCB_CACHED;
+	if (ret >= 0) {
+		if (!iov_iter_count(to))
+			return ret;
+		written = ret;
+	} else {
+		switch(ret) {
+		case -EAGAIN:
+			if (iocb->ki_flags & IOCB_NOWAIT)
+				return ret;
+			break;
+		case -ECANCELED:
+			break;
+		default:
+			return ret;
+		}
+	}
+	ip = GFS2_I(iocb->ki_filp->f_mapping->host);
+	gfs2_holder_init(ip->i_gl, LM_ST_SHARED, 0, &gh);
+	ret = gfs2_glock_nq(&gh);
+	if (ret)
+		goto out_uninit;
+	ret = generic_file_read_iter(iocb, to);
+	if (ret > 0)
+		written += ret;
+	if (gfs2_holder_initialized(&gh))
+		gfs2_glock_dq(&gh);
+out_uninit:
+	if (gfs2_holder_initialized(&gh))
+		gfs2_holder_uninit(&gh);
+	return written ? written : ret;
 }
 
 /**
-- 
2.26.2

