Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7486AE3DC
	for <lists+cluster-devel@lfdr.de>; Tue,  7 Mar 2023 16:05:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678201531;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IJXVqrzWWn5hyh2dRKcBdbAU+IqVjNkc3jh5BMRDxbc=;
	b=ZF4Om4jwn+qUmHCYpqbEOe2sqpSTm0RhvA2MU4D2FIloeYwL7bH2DF1ABmJCCfScf9ks53
	pI12qQXX+gOzsMcyPykmqtq3s6+orRZTO0aaTjJh2o/RN8gw9u0UBQtyg5tyZ/W3Ypa+qR
	qTvDrvCzzNE916+YMufWMiJ8Bk2js7Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-338-oIllzvaKMfa8r3Lk8DSuqA-1; Tue, 07 Mar 2023 10:05:25 -0500
X-MC-Unique: oIllzvaKMfa8r3Lk8DSuqA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A63B803D7A;
	Tue,  7 Mar 2023 15:04:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7DA60140EBF4;
	Tue,  7 Mar 2023 15:04:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 26D1919465B1;
	Tue,  7 Mar 2023 15:04:23 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 557BA1946A43 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  7 Mar 2023 15:04:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F004640C1106; Tue,  7 Mar 2023 15:04:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E8C284010E36
 for <cluster-devel@redhat.com>; Tue,  7 Mar 2023 15:04:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9B04803CBB
 for <cluster-devel@redhat.com>; Tue,  7 Mar 2023 15:04:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-oD7WRuIgMoK26xoWXMJQbQ-1; Tue, 07 Mar 2023 10:04:07 -0500
X-MC-Unique: oD7WRuIgMoK26xoWXMJQbQ-1
Received: from [46.183.103.17] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pZYOi-000qG9-QW; Tue, 07 Mar 2023 14:34:37 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Hugh Dickins <hughd@google.com>
Date: Tue,  7 Mar 2023 15:34:10 +0100
Message-Id: <20230307143410.28031-8-hch@lst.de>
In-Reply-To: <20230307143410.28031-1-hch@lst.de>
References: <20230307143410.28031-1-hch@lst.de>
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
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Cluster-devel] [PATCH 7/7] mm: return an ERR_PTR from
 __filemap_get_folio
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
Cc: linux-xfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, cluster-devel@redhat.com,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Instead of returning NULL for all errors, distinguish between:

 - no entry found and not asked to allocated (-ENOENT)
 - failed to allocate memory (-ENOMEM)
 - would block (-EAGAIN)

so that callers don't have to guess the error based on the passed
in flags.

Also pass through the error through the direct callers:
filemap_get_folio, filemap_lock_folio filemap_grab_folio
and filemap_get_incore_folio.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com> [nilfs2]
---
 fs/afs/dir.c             | 10 +++++-----
 fs/afs/dir_edit.c        |  2 +-
 fs/afs/write.c           |  4 ++--
 fs/ext4/inode.c          |  2 +-
 fs/ext4/move_extent.c    |  8 ++++----
 fs/hugetlbfs/inode.c     |  2 +-
 fs/iomap/buffered-io.c   | 11 ++---------
 fs/netfs/buffered_read.c |  4 ++--
 fs/nfs/file.c            |  4 ++--
 fs/nilfs2/page.c         |  6 +++---
 include/linux/pagemap.h  | 11 ++++++-----
 mm/filemap.c             | 14 ++++++++------
 mm/folio-compat.c        |  2 +-
 mm/huge_memory.c         |  2 +-
 mm/hugetlb.c             |  6 ++++--
 mm/memcontrol.c          |  2 +-
 mm/mincore.c             |  2 +-
 mm/shmem.c               |  4 ++--
 mm/swap_state.c          | 15 ++++++++-------
 mm/swapfile.c            |  4 ++--
 mm/truncate.c            | 15 ++++++++-------
 21 files changed, 65 insertions(+), 65 deletions(-)

diff --git a/fs/afs/dir.c b/fs/afs/dir.c
index 82690d1dd49a02..f92b9e62d567b9 100644
--- a/fs/afs/dir.c
+++ b/fs/afs/dir.c
@@ -319,16 +319,16 @@ static struct afs_read *afs_read_dir(struct afs_vnode *dvnode, struct key *key)
 		struct folio *folio;
 
 		folio = filemap_get_folio(mapping, i);
-		if (!folio) {
+		if (IS_ERR(folio)) {
 			if (test_and_clear_bit(AFS_VNODE_DIR_VALID, &dvnode->flags))
 				afs_stat_v(dvnode, n_inval);
-
-			ret = -ENOMEM;
 			folio = __filemap_get_folio(mapping,
 						    i, FGP_LOCK | FGP_CREAT,
 						    mapping->gfp_mask);
-			if (!folio)
+			if (IS_ERR(folio)) {
+				ret = PTR_ERR(folio);
 				goto error;
+			}
 			folio_attach_private(folio, (void *)1);
 			folio_unlock(folio);
 		}
@@ -524,7 +524,7 @@ static int afs_dir_iterate(struct inode *dir, struct dir_context *ctx,
 		 */
 		folio = __filemap_get_folio(dir->i_mapping, ctx->pos / PAGE_SIZE,
 					    FGP_ACCESSED, 0);
-		if (!folio) {
+		if (IS_ERR(folio)) {
 			ret = afs_bad(dvnode, afs_file_error_dir_missing_page);
 			break;
 		}
diff --git a/fs/afs/dir_edit.c b/fs/afs/dir_edit.c
index 0ab7752d1b758e..f0eddccbdd9541 100644
--- a/fs/afs/dir_edit.c
+++ b/fs/afs/dir_edit.c
@@ -115,7 +115,7 @@ static struct folio *afs_dir_get_folio(struct afs_vnode *vnode, pgoff_t index)
 	folio = __filemap_get_folio(mapping, index,
 				    FGP_LOCK | FGP_ACCESSED | FGP_CREAT,
 				    mapping->gfp_mask);
-	if (!folio)
+	if (IS_ERR(folio))
 		clear_bit(AFS_VNODE_DIR_VALID, &vnode->flags);
 	else if (folio && !folio_test_private(folio))
 		folio_attach_private(folio, (void *)1);
diff --git a/fs/afs/write.c b/fs/afs/write.c
index 571f3b9a417e5f..c822d6006033a7 100644
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -232,7 +232,7 @@ static void afs_kill_pages(struct address_space *mapping,
 		_debug("kill %lx (to %lx)", index, last);
 
 		folio = filemap_get_folio(mapping, index);
-		if (!folio) {
+		if (IS_ERR(folio)) {
 			next = index + 1;
 			continue;
 		}
@@ -270,7 +270,7 @@ static void afs_redirty_pages(struct writeback_control *wbc,
 		_debug("redirty %llx @%llx", len, start);
 
 		folio = filemap_get_folio(mapping, index);
-		if (!folio) {
+		if (IS_ERR(folio)) {
 			next = index + 1;
 			continue;
 		}
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index d251d705c2763c..1ad3e369e5a450 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -5390,7 +5390,7 @@ static void ext4_wait_for_tail_page_commit(struct inode *inode)
 	while (1) {
 		struct folio *folio = filemap_lock_folio(inode->i_mapping,
 				      inode->i_size >> PAGE_SHIFT);
-		if (!folio)
+		if (IS_ERR(folio))
 			return;
 		ret = __ext4_journalled_invalidate_folio(folio, offset,
 						folio_size(folio) - offset);
diff --git a/fs/ext4/move_extent.c b/fs/ext4/move_extent.c
index 2de9829aed63bf..7bf6d069199cbb 100644
--- a/fs/ext4/move_extent.c
+++ b/fs/ext4/move_extent.c
@@ -141,18 +141,18 @@ mext_folio_double_lock(struct inode *inode1, struct inode *inode2,
 	flags = memalloc_nofs_save();
 	folio[0] = __filemap_get_folio(mapping[0], index1, fgp_flags,
 			mapping_gfp_mask(mapping[0]));
-	if (!folio[0]) {
+	if (IS_ERR(folio[0])) {
 		memalloc_nofs_restore(flags);
-		return -ENOMEM;
+		return PTR_ERR(folio[0]);
 	}
 
 	folio[1] = __filemap_get_folio(mapping[1], index2, fgp_flags,
 			mapping_gfp_mask(mapping[1]));
 	memalloc_nofs_restore(flags);
-	if (!folio[1]) {
+	if (IS_ERR(folio[1])) {
 		folio_unlock(folio[0]);
 		folio_put(folio[0]);
-		return -ENOMEM;
+		return PTR_ERR(folio[1]);
 	}
 	/*
 	 * __filemap_get_folio() may not wait on folio's writeback if
diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index 9062da6da56753..702d79639c0dff 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -697,7 +697,7 @@ static void hugetlbfs_zero_partial_page(struct hstate *h,
 	struct folio *folio;
 
 	folio = filemap_lock_folio(mapping, idx);
-	if (!folio)
+	if (IS_ERR(folio))
 		return;
 
 	start = start & ~huge_page_mask(h);
diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 6f4c97a6d7e9dc..96bb56c203f49d 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -468,19 +468,12 @@ EXPORT_SYMBOL_GPL(iomap_is_partially_uptodate);
 struct folio *iomap_get_folio(struct iomap_iter *iter, loff_t pos)
 {
 	unsigned fgp = FGP_LOCK | FGP_WRITE | FGP_CREAT | FGP_STABLE | FGP_NOFS;
-	struct folio *folio;
 
 	if (iter->flags & IOMAP_NOWAIT)
 		fgp |= FGP_NOWAIT;
 
-	folio = __filemap_get_folio(iter->inode->i_mapping, pos >> PAGE_SHIFT,
+	return __filemap_get_folio(iter->inode->i_mapping, pos >> PAGE_SHIFT,
 			fgp, mapping_gfp_mask(iter->inode->i_mapping));
-	if (folio)
-		return folio;
-
-	if (iter->flags & IOMAP_NOWAIT)
-		return ERR_PTR(-EAGAIN);
-	return ERR_PTR(-ENOMEM);
 }
 EXPORT_SYMBOL_GPL(iomap_get_folio);
 
@@ -911,7 +904,7 @@ static int iomap_write_delalloc_scan(struct inode *inode,
 		/* grab locked page */
 		folio = filemap_lock_folio(inode->i_mapping,
 				start_byte >> PAGE_SHIFT);
-		if (!folio) {
+		if (IS_ERR(folio)) {
 			start_byte = ALIGN_DOWN(start_byte, PAGE_SIZE) +
 					PAGE_SIZE;
 			continue;
diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
index 7679a68e819307..209726a9cfdb9c 100644
--- a/fs/netfs/buffered_read.c
+++ b/fs/netfs/buffered_read.c
@@ -350,8 +350,8 @@ int netfs_write_begin(struct netfs_inode *ctx,
 retry:
 	folio = __filemap_get_folio(mapping, index, fgp_flags,
 				    mapping_gfp_mask(mapping));
-	if (!folio)
-		return -ENOMEM;
+	if (IS_ERR(folio))
+		return PTR_ERR(folio);
 
 	if (ctx->ops->check_write_begin) {
 		/* Allow the netfs (eg. ceph) to flush conflicts. */
diff --git a/fs/nfs/file.c b/fs/nfs/file.c
index 893625eacab9fa..1d03406e6c039a 100644
--- a/fs/nfs/file.c
+++ b/fs/nfs/file.c
@@ -336,8 +336,8 @@ static int nfs_write_begin(struct file *file, struct address_space *mapping,
 
 start:
 	folio = nfs_folio_grab_cache_write_begin(mapping, pos >> PAGE_SHIFT);
-	if (!folio)
-		return -ENOMEM;
+	if (IS_ERR(folio))
+		return PTR_ERR(folio);
 	*pagep = &folio->page;
 
 	ret = nfs_flush_incompatible(file, folio);
diff --git a/fs/nilfs2/page.c b/fs/nilfs2/page.c
index 41ccd43cd9797f..5cf30827f244c4 100644
--- a/fs/nilfs2/page.c
+++ b/fs/nilfs2/page.c
@@ -259,10 +259,10 @@ int nilfs_copy_dirty_pages(struct address_space *dmap,
 			NILFS_PAGE_BUG(&folio->page, "inconsistent dirty state");
 
 		dfolio = filemap_grab_folio(dmap, folio->index);
-		if (unlikely(!dfolio)) {
+		if (unlikely(IS_ERR(dfolio))) {
 			/* No empty page is added to the page cache */
-			err = -ENOMEM;
 			folio_unlock(folio);
+			err = PTR_ERR(dfolio);
 			break;
 		}
 		if (unlikely(!folio_buffers(folio)))
@@ -311,7 +311,7 @@ void nilfs_copy_back_pages(struct address_space *dmap,
 
 		folio_lock(folio);
 		dfolio = filemap_lock_folio(dmap, index);
-		if (dfolio) {
+		if (!IS_ERR(dfolio)) {
 			/* overwrite existing folio in the destination cache */
 			WARN_ON(folio_test_dirty(dfolio));
 			nilfs_copy_page(&dfolio->page, &folio->page, 0);
diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index bb60e0209b7e3b..0135d60d3b4c13 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -520,7 +520,8 @@ struct page *pagecache_get_page(struct address_space *mapping, pgoff_t index,
  * Looks up the page cache entry at @mapping & @index.  If a folio is
  * present, it is returned with an increased refcount.
  *
- * Otherwise, %NULL is returned.
+ * Return: A folio or ERR_PTR(-ENOENT) if there is no folio in the cache for
+ * this index.  Will not return a shadow, swap or DAX entry.
  */
 static inline struct folio *filemap_get_folio(struct address_space *mapping,
 					pgoff_t index)
@@ -537,8 +538,8 @@ static inline struct folio *filemap_get_folio(struct address_space *mapping,
  * present, it is returned locked with an increased refcount.
  *
  * Context: May sleep.
- * Return: A folio or %NULL if there is no folio in the cache for this
- * index.  Will not return a shadow, swap or DAX entry.
+ * Return: A folio or ERR_PTR(-ENOENT) if there is no folio in the cache for
+ * this index.  Will not return a shadow, swap or DAX entry.
  */
 static inline struct folio *filemap_lock_folio(struct address_space *mapping,
 					pgoff_t index)
@@ -555,8 +556,8 @@ static inline struct folio *filemap_lock_folio(struct address_space *mapping,
  * a new folio is created. The folio is locked, marked as accessed, and
  * returned.
  *
- * Return: A found or created folio. NULL if no folio is found and failed to
- * create a folio.
+ * Return: A found or created folio. ERR_PTR(-ENOMEM) if no folio is found
+ * and failed to create a folio.
  */
 static inline struct folio *filemap_grab_folio(struct address_space *mapping,
 					pgoff_t index)
diff --git a/mm/filemap.c b/mm/filemap.c
index ac161b50f5bc17..a34abfe8c65430 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -1907,7 +1907,7 @@ void *filemap_get_entry(struct address_space *mapping, pgoff_t index)
  *
  * If there is a page cache page, it is returned with an increased refcount.
  *
- * Return: The found folio or %NULL otherwise.
+ * Return: The found folio or an ERR_PTR() otherwise.
  */
 struct folio *__filemap_get_folio(struct address_space *mapping, pgoff_t index,
 		int fgp_flags, gfp_t gfp)
@@ -1925,7 +1925,7 @@ struct folio *__filemap_get_folio(struct address_space *mapping, pgoff_t index,
 		if (fgp_flags & FGP_NOWAIT) {
 			if (!folio_trylock(folio)) {
 				folio_put(folio);
-				return NULL;
+				return ERR_PTR(-EAGAIN);
 			}
 		} else {
 			folio_lock(folio);
@@ -1964,7 +1964,7 @@ struct folio *__filemap_get_folio(struct address_space *mapping, pgoff_t index,
 
 		folio = filemap_alloc_folio(gfp, 0);
 		if (!folio)
-			return NULL;
+			return ERR_PTR(-ENOMEM);
 
 		if (WARN_ON_ONCE(!(fgp_flags & (FGP_LOCK | FGP_FOR_MMAP))))
 			fgp_flags |= FGP_LOCK;
@@ -1989,6 +1989,8 @@ struct folio *__filemap_get_folio(struct address_space *mapping, pgoff_t index,
 			folio_unlock(folio);
 	}
 
+	if (!folio)
+		return ERR_PTR(-ENOENT);
 	return folio;
 }
 EXPORT_SYMBOL(__filemap_get_folio);
@@ -3258,7 +3260,7 @@ vm_fault_t filemap_fault(struct vm_fault *vmf)
 	 * Do we have something in the page cache already?
 	 */
 	folio = filemap_get_folio(mapping, index);
-	if (likely(folio)) {
+	if (likely(!IS_ERR(folio))) {
 		/*
 		 * We found the page, so try async readahead before waiting for
 		 * the lock.
@@ -3287,7 +3289,7 @@ vm_fault_t filemap_fault(struct vm_fault *vmf)
 		folio = __filemap_get_folio(mapping, index,
 					  FGP_CREAT|FGP_FOR_MMAP,
 					  vmf->gfp_mask);
-		if (!folio) {
+		if (IS_ERR(folio)) {
 			if (fpin)
 				goto out_retry;
 			filemap_invalidate_unlock_shared(mapping);
@@ -3638,7 +3640,7 @@ static struct folio *do_read_cache_folio(struct address_space *mapping,
 		filler = mapping->a_ops->read_folio;
 repeat:
 	folio = filemap_get_folio(mapping, index);
-	if (!folio) {
+	if (IS_ERR(folio)) {
 		folio = filemap_alloc_folio(gfp, 0);
 		if (!folio)
 			return ERR_PTR(-ENOMEM);
diff --git a/mm/folio-compat.c b/mm/folio-compat.c
index 1754daa85d35c2..2511c055a35ff6 100644
--- a/mm/folio-compat.c
+++ b/mm/folio-compat.c
@@ -97,7 +97,7 @@ struct page *pagecache_get_page(struct address_space *mapping, pgoff_t index,
 	struct folio *folio;
 
 	folio = __filemap_get_folio(mapping, index, fgp_flags, gfp);
-	if (!folio)
+	if (IS_ERR(folio))
 		return NULL;
 	return folio_file_page(folio, index);
 }
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 62843afeb7946d..c57303db6993fb 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3093,7 +3093,7 @@ static int split_huge_pages_in_file(const char *file_path, pgoff_t off_start,
 		struct folio *folio = filemap_get_folio(mapping, index);
 
 		nr_pages = 1;
-		if (!folio)
+		if (IS_ERR(folio))
 			continue;
 
 		if (!folio_test_large(folio))
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 07abcb6eb20304..712e32b382950e 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -5780,7 +5780,7 @@ static vm_fault_t hugetlb_no_page(struct mm_struct *mm,
 	 */
 	new_folio = false;
 	folio = filemap_lock_folio(mapping, idx);
-	if (!folio) {
+	if (IS_ERR(folio)) {
 		size = i_size_read(mapping->host) >> huge_page_shift(h);
 		if (idx >= size)
 			goto out;
@@ -6071,6 +6071,8 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 		vma_end_reservation(h, vma, haddr);
 
 		pagecache_folio = filemap_lock_folio(mapping, idx);
+		if (IS_ERR(pagecache_folio))
+			pagecache_folio = NULL;
 	}
 
 	ptl = huge_pte_lock(h, mm, ptep);
@@ -6182,7 +6184,7 @@ int hugetlb_mcopy_atomic_pte(struct mm_struct *dst_mm,
 	if (is_continue) {
 		ret = -EFAULT;
 		folio = filemap_lock_folio(mapping, idx);
-		if (!folio)
+		if (IS_ERR(folio))
 			goto out;
 		folio_in_pagecache = true;
 	} else if (!*pagep) {
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 5abffe6f8389e2..2e46ddf802300b 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -5705,7 +5705,7 @@ static struct page *mc_handle_file_pte(struct vm_area_struct *vma,
 	/* shmem/tmpfs may report page out on swap: account for that too. */
 	index = linear_page_index(vma, addr);
 	folio = filemap_get_incore_folio(vma->vm_file->f_mapping, index);
-	if (!folio)
+	if (IS_ERR(folio))
 		return NULL;
 	return folio_file_page(folio, index);
 }
diff --git a/mm/mincore.c b/mm/mincore.c
index cd69b9db008126..5437e584b208bf 100644
--- a/mm/mincore.c
+++ b/mm/mincore.c
@@ -61,7 +61,7 @@ static unsigned char mincore_page(struct address_space *mapping, pgoff_t index)
 	 * tmpfs's .fault). So swapped out tmpfs mappings are tested here.
 	 */
 	folio = filemap_get_incore_folio(mapping, index);
-	if (folio) {
+	if (!IS_ERR(folio)) {
 		present = folio_test_uptodate(folio);
 		folio_put(folio);
 	}
diff --git a/mm/shmem.c b/mm/shmem.c
index 714ff3fb02a938..d064f0bfd2ada8 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -603,7 +603,7 @@ static unsigned long shmem_unused_huge_shrink(struct shmem_sb_info *sbinfo,
 
 		index = (inode->i_size & HPAGE_PMD_MASK) >> PAGE_SHIFT;
 		folio = filemap_get_folio(inode->i_mapping, index);
-		if (!folio)
+		if (IS_ERR(folio))
 			goto drop;
 
 		/* No huge page at the end of the file: nothing to split */
@@ -3188,7 +3188,7 @@ static const char *shmem_get_link(struct dentry *dentry,
 
 	if (!dentry) {
 		folio = filemap_get_folio(inode->i_mapping, 0);
-		if (!folio)
+		if (IS_ERR(folio))
 			return ERR_PTR(-ECHILD);
 		if (PageHWPoison(folio_page(folio, 0)) ||
 		    !folio_test_uptodate(folio)) {
diff --git a/mm/swap_state.c b/mm/swap_state.c
index 92234f4b51d29a..c7160070b9daa9 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -336,7 +336,7 @@ struct folio *swap_cache_get_folio(swp_entry_t entry,
 	struct folio *folio;
 
 	folio = filemap_get_folio(swap_address_space(entry), swp_offset(entry));
-	if (folio) {
+	if (!IS_ERR(folio)) {
 		bool vma_ra = swap_use_vma_readahead();
 		bool readahead;
 
@@ -366,6 +366,8 @@ struct folio *swap_cache_get_folio(swp_entry_t entry,
 			if (!vma || !vma_ra)
 				atomic_inc(&swapin_readahead_hits);
 		}
+	} else {
+		folio = NULL;
 	}
 
 	return folio;
@@ -389,22 +391,21 @@ struct folio *filemap_get_incore_folio(struct address_space *mapping,
 	struct folio *folio = filemap_get_entry(mapping, index);
 
 	if (!xa_is_value(folio))
-		goto out;
+		return folio;
 	if (!shmem_mapping(mapping))
-		return NULL;
+		return ERR_PTR(-ENOENT);
 
 	swp = radix_to_swp_entry(folio);
 	/* There might be swapin error entries in shmem mapping. */
 	if (non_swap_entry(swp))
-		return NULL;
+		return ERR_PTR(-ENOENT);
 	/* Prevent swapoff from happening to us */
 	si = get_swap_device(swp);
 	if (!si)
-		return NULL;
+		return ERR_PTR(-ENOENT);
 	index = swp_offset(swp);
 	folio = filemap_get_folio(swap_address_space(swp), index);
 	put_swap_device(si);
-out:
 	return folio;
 }
 
@@ -431,7 +432,7 @@ struct page *__read_swap_cache_async(swp_entry_t entry, gfp_t gfp_mask,
 		folio = filemap_get_folio(swap_address_space(entry),
 						swp_offset(entry));
 		put_swap_device(si);
-		if (folio)
+		if (!IS_ERR(folio))
 			return folio_file_page(folio, swp_offset(entry));
 
 		/*
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 62ba2bf577d7e7..f7c74779391219 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -136,7 +136,7 @@ static int __try_to_reclaim_swap(struct swap_info_struct *si,
 	int ret = 0;
 
 	folio = filemap_get_folio(swap_address_space(entry), offset);
-	if (!folio)
+	if (IS_ERR(folio))
 		return 0;
 	/*
 	 * When this function is called from scan_swap_map_slots() and it's
@@ -2095,7 +2095,7 @@ static int try_to_unuse(unsigned int type)
 
 		entry = swp_entry(type, i);
 		folio = filemap_get_folio(swap_address_space(entry), i);
-		if (!folio)
+		if (IS_ERR(folio))
 			continue;
 
 		/*
diff --git a/mm/truncate.c b/mm/truncate.c
index 7b4ea4c4a46b20..86de31ed4d3238 100644
--- a/mm/truncate.c
+++ b/mm/truncate.c
@@ -375,7 +375,7 @@ void truncate_inode_pages_range(struct address_space *mapping,
 
 	same_folio = (lstart >> PAGE_SHIFT) == (lend >> PAGE_SHIFT);
 	folio = __filemap_get_folio(mapping, lstart >> PAGE_SHIFT, FGP_LOCK, 0);
-	if (folio) {
+	if (!IS_ERR(folio)) {
 		same_folio = lend < folio_pos(folio) + folio_size(folio);
 		if (!truncate_inode_partial_folio(folio, lstart, lend)) {
 			start = folio->index + folio_nr_pages(folio);
@@ -387,14 +387,15 @@ void truncate_inode_pages_range(struct address_space *mapping,
 		folio = NULL;
 	}
 
-	if (!same_folio)
+	if (!same_folio) {
 		folio = __filemap_get_folio(mapping, lend >> PAGE_SHIFT,
 						FGP_LOCK, 0);
-	if (folio) {
-		if (!truncate_inode_partial_folio(folio, lstart, lend))
-			end = folio->index;
-		folio_unlock(folio);
-		folio_put(folio);
+		if (!IS_ERR(folio)) {
+			if (!truncate_inode_partial_folio(folio, lstart, lend))
+				end = folio->index;
+			folio_unlock(folio);
+			folio_put(folio);
+		}
 	}
 
 	index = start;
-- 
2.39.1

