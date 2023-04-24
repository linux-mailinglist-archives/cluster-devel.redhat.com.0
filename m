Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7F36EC634
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Apr 2023 08:22:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682317368;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TRgCZMat6SwmbUJc5nYBP6IbIwCnK37cme83Pl+2pA8=;
	b=gfsUCRItnjoZM1vbrQt3Z/UOoy1fHQXSjPvGlTF+sw+MAYSNsdaje7tEVunIpP4xttHM2w
	QQhXdePzycYm/xJxA5MCND7k8aD/rI46fKJfX0gxHMSN/zyfVIJqLYYQjsBFepFuucOkce
	uHUzpzbhCN0AH+AMcQD1AngVNkUSbuw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-BtNXlyYnOlKC1D2cmtn31Q-1; Mon, 24 Apr 2023 02:22:46 -0400
X-MC-Unique: BtNXlyYnOlKC1D2cmtn31Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 989CD185A792;
	Mon, 24 Apr 2023 06:22:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8B9EA492C13;
	Mon, 24 Apr 2023 06:22:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 518F51946A40;
	Mon, 24 Apr 2023 06:22:45 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 40CAA1946586 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 24 Apr 2023 06:22:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 172E71417202; Mon, 24 Apr 2023 06:22:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EF6914171FF
 for <cluster-devel@redhat.com>; Mon, 24 Apr 2023 06:22:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E82D0800047
 for <cluster-devel@redhat.com>; Mon, 24 Apr 2023 06:22:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-JKSeCvTVObq8R5BQUXu72w-1; Mon, 24 Apr 2023 02:22:40 -0400
X-MC-Unique: JKSeCvTVObq8R5BQUXu72w-1
Received: from [2001:4bb8:189:a74f:e8a5:5f73:6d2:23b8] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pqp51-00FOul-1F; Mon, 24 Apr 2023 05:49:39 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 24 Apr 2023 07:49:12 +0200
Message-Id: <20230424054926.26927-4-hch@lst.de>
In-Reply-To: <20230424054926.26927-1-hch@lst.de>
References: <20230424054926.26927-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCH 03/17] fs: rename and move
 block_page_mkwrite_return
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
Cc: linux-block@vger.kernel.org, linux-nfs@vger.kernel.org,
 cluster-devel@redhat.com, linux-xfs@vger.kernel.org,
 Miklos Szeredi <miklos@szeredi.hu>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 ceph-devel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

block_page_mkwrite_return is neither block nor mkwrite specific, and
should not be under CONFIG_BLOCK.  Move it to mm.h and rename it to
errno_to_vmfault.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ext4/inode.c             |  2 +-
 fs/f2fs/file.c              |  2 +-
 fs/gfs2/file.c              | 16 ++++++++--------
 fs/iomap/buffered-io.c      |  2 +-
 fs/nilfs2/file.c            |  2 +-
 fs/udf/file.c               |  2 +-
 include/linux/buffer_head.h | 12 ------------
 include/linux/mm.h          | 13 +++++++++++++
 8 files changed, 26 insertions(+), 25 deletions(-)

diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index bf0b7dea4900af..c0f41a38bd9ca4 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -6343,7 +6343,7 @@ vm_fault_t ext4_page_mkwrite(struct vm_fault *vmf)
 	if (err == -ENOSPC && ext4_should_retry_alloc(inode->i_sb, &retries))
 		goto retry_alloc;
 out_ret:
-	ret = block_page_mkwrite_return(err);
+	ret = errno_to_vmfault(err);
 out:
 	filemap_invalidate_unlock_shared(mapping);
 	sb_end_pagefault(inode->i_sb);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 15dabeac469050..f4ab23efcf85f8 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -161,7 +161,7 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 
 	sb_end_pagefault(inode->i_sb);
 err:
-	return block_page_mkwrite_return(err);
+	return errno_to_vmfault(err);
 }
 
 static const struct vm_operations_struct f2fs_file_vm_ops = {
diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 300844f50dcd28..8c4fad359ff538 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -432,7 +432,7 @@ static vm_fault_t gfs2_page_mkwrite(struct vm_fault *vmf)
 	gfs2_holder_init(ip->i_gl, LM_ST_EXCLUSIVE, 0, &gh);
 	err = gfs2_glock_nq(&gh);
 	if (err) {
-		ret = block_page_mkwrite_return(err);
+		ret = errno_to_vmfault(err);
 		goto out_uninit;
 	}
 
@@ -474,7 +474,7 @@ static vm_fault_t gfs2_page_mkwrite(struct vm_fault *vmf)
 
 	err = gfs2_rindex_update(sdp);
 	if (err) {
-		ret = block_page_mkwrite_return(err);
+		ret = errno_to_vmfault(err);
 		goto out_unlock;
 	}
 
@@ -482,12 +482,12 @@ static vm_fault_t gfs2_page_mkwrite(struct vm_fault *vmf)
 	ap.target = data_blocks + ind_blocks;
 	err = gfs2_quota_lock_check(ip, &ap);
 	if (err) {
-		ret = block_page_mkwrite_return(err);
+		ret = errno_to_vmfault(err);
 		goto out_unlock;
 	}
 	err = gfs2_inplace_reserve(ip, &ap);
 	if (err) {
-		ret = block_page_mkwrite_return(err);
+		ret = errno_to_vmfault(err);
 		goto out_quota_unlock;
 	}
 
@@ -500,7 +500,7 @@ static vm_fault_t gfs2_page_mkwrite(struct vm_fault *vmf)
 	}
 	err = gfs2_trans_begin(sdp, rblocks, 0);
 	if (err) {
-		ret = block_page_mkwrite_return(err);
+		ret = errno_to_vmfault(err);
 		goto out_trans_fail;
 	}
 
@@ -508,7 +508,7 @@ static vm_fault_t gfs2_page_mkwrite(struct vm_fault *vmf)
 	if (gfs2_is_stuffed(ip)) {
 		err = gfs2_unstuff_dinode(ip);
 		if (err) {
-			ret = block_page_mkwrite_return(err);
+			ret = errno_to_vmfault(err);
 			goto out_trans_end;
 		}
 	}
@@ -524,7 +524,7 @@ static vm_fault_t gfs2_page_mkwrite(struct vm_fault *vmf)
 
 	err = gfs2_allocate_page_backing(page, length);
 	if (err)
-		ret = block_page_mkwrite_return(err);
+		ret = errno_to_vmfault(err);
 
 out_page_locked:
 	if (ret != VM_FAULT_LOCKED)
@@ -558,7 +558,7 @@ static vm_fault_t gfs2_fault(struct vm_fault *vmf)
 	gfs2_holder_init(ip->i_gl, LM_ST_SHARED, 0, &gh);
 	err = gfs2_glock_nq(&gh);
 	if (err) {
-		ret = block_page_mkwrite_return(err);
+		ret = errno_to_vmfault(err);
 		goto out_uninit;
 	}
 	ret = filemap_fault(vmf);
diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 6f4c97a6d7e9dc..2986be63d2bea6 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -1290,7 +1290,7 @@ vm_fault_t iomap_page_mkwrite(struct vm_fault *vmf, const struct iomap_ops *ops)
 	return VM_FAULT_LOCKED;
 out_unlock:
 	folio_unlock(folio);
-	return block_page_mkwrite_return(ret);
+	return errno_to_vmfault(ret);
 }
 EXPORT_SYMBOL_GPL(iomap_page_mkwrite);
 
diff --git a/fs/nilfs2/file.c b/fs/nilfs2/file.c
index a265d391ffe92d..ea35294bb158a3 100644
--- a/fs/nilfs2/file.c
+++ b/fs/nilfs2/file.c
@@ -108,7 +108,7 @@ static vm_fault_t nilfs_page_mkwrite(struct vm_fault *vmf)
 	wait_for_stable_page(page);
  out:
 	sb_end_pagefault(inode->i_sb);
-	return block_page_mkwrite_return(ret);
+	return errno_to_vmfault(ret);
 }
 
 static const struct vm_operations_struct nilfs_file_vm_ops = {
diff --git a/fs/udf/file.c b/fs/udf/file.c
index 8238f742377bab..9420284d7c0455 100644
--- a/fs/udf/file.c
+++ b/fs/udf/file.c
@@ -71,7 +71,7 @@ static vm_fault_t udf_page_mkwrite(struct vm_fault *vmf)
 		err = block_commit_write(page, 0, end);
 	if (err < 0) {
 		unlock_page(page);
-		ret = block_page_mkwrite_return(err);
+		ret = errno_to_vmfault(err);
 		goto out_unlock;
 	}
 out_dirty:
diff --git a/include/linux/buffer_head.h b/include/linux/buffer_head.h
index 8f14dca5fed756..0fcc16b7f02bb4 100644
--- a/include/linux/buffer_head.h
+++ b/include/linux/buffer_head.h
@@ -281,18 +281,6 @@ int generic_cont_expand_simple(struct inode *inode, loff_t size);
 int block_commit_write(struct page *page, unsigned from, unsigned to);
 int block_page_mkwrite(struct vm_area_struct *vma, struct vm_fault *vmf,
 				get_block_t get_block);
-/* Convert errno to return value from ->page_mkwrite() call */
-static inline vm_fault_t block_page_mkwrite_return(int err)
-{
-	if (err == 0)
-		return VM_FAULT_LOCKED;
-	if (err == -EFAULT || err == -EAGAIN)
-		return VM_FAULT_NOPAGE;
-	if (err == -ENOMEM)
-		return VM_FAULT_OOM;
-	/* -ENOSPC, -EDQUOT, -EIO ... */
-	return VM_FAULT_SIGBUS;
-}
 sector_t generic_block_bmap(struct address_space *, sector_t, get_block_t *);
 int block_truncate_page(struct address_space *, loff_t, get_block_t *);
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 1f79667824eb60..03e645032c81ac 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3061,6 +3061,19 @@ extern vm_fault_t filemap_map_pages(struct vm_fault *vmf,
 		pgoff_t start_pgoff, pgoff_t end_pgoff);
 extern vm_fault_t filemap_page_mkwrite(struct vm_fault *vmf);
 
+/* Convert errno to return value from ->page_mkwrite() call */
+static inline vm_fault_t errno_to_vmfault(int err)
+{
+	if (err == 0)
+		return VM_FAULT_LOCKED;
+	if (err == -EFAULT || err == -EAGAIN)
+		return VM_FAULT_NOPAGE;
+	if (err == -ENOMEM)
+		return VM_FAULT_OOM;
+	/* -ENOSPC, -EDQUOT, -EIO ... */
+	return VM_FAULT_SIGBUS;
+}
+
 extern unsigned long stack_guard_gap;
 /* Generic expand stack which grows the stack according to GROWS{UP,DOWN} */
 extern int expand_stack(struct vm_area_struct *vma, unsigned long address);
-- 
2.39.2

