Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6AB3B3E4041
	for <lists+cluster-devel@lfdr.de>; Mon,  9 Aug 2021 08:40:03 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-VLlLjlwQOkedc_SuBrBU3Q-1; Mon, 09 Aug 2021 02:40:00 -0400
X-MC-Unique: VLlLjlwQOkedc_SuBrBU3Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B34ED92500;
	Mon,  9 Aug 2021 06:39:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A708769FAD;
	Mon,  9 Aug 2021 06:39:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 97064180BAB1;
	Mon,  9 Aug 2021 06:39:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1796dvqp004556 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 9 Aug 2021 02:39:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4280E110DBB6; Mon,  9 Aug 2021 06:39:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E30610087FD
	for <cluster-devel@redhat.com>; Mon,  9 Aug 2021 06:39:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3AB378CA942
	for <cluster-devel@redhat.com>; Mon,  9 Aug 2021 06:39:54 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-603-7Cj5y7BqNcWl9rvdhxB6Sw-1; Mon, 09 Aug 2021 02:39:52 -0400
X-MC-Unique: 7Cj5y7BqNcWl9rvdhxB6Sw-1
Received: from [2a02:1205:5023:1f80:c068:bd3d:78b3:7d37] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCyum-00AiEB-Vv; Mon, 09 Aug 2021 06:37:52 +0000
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Date: Mon,  9 Aug 2021 08:12:43 +0200
Message-Id: <20210809061244.1196573-30-hch@lst.de>
In-Reply-To: <20210809061244.1196573-1-hch@lst.de>
References: <20210809061244.1196573-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: nvdimm@lists.linux.dev, cluster-devel@redhat.com,
	Matthew Wilcox <willy@infradead.org>,
	Shiyang Ruan <ruansy.fnst@fujitsu.com>,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH 29/30] fsdax: switch the fault handlers to
	use iomap_iter
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

Avoid the open coded calls to ->iomap_begin and ->iomap_end and call
iomap_iter instead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
---
 fs/dax.c | 193 +++++++++++++++++++++----------------------------------
 1 file changed, 75 insertions(+), 118 deletions(-)

diff --git a/fs/dax.c b/fs/dax.c
index 6d0c6d28be83b1..118c9e2923f5f8 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -1010,7 +1010,7 @@ static sector_t dax_iomap_sector(const struct iomap *iomap, loff_t pos)
 	return (iomap->addr + (pos & PAGE_MASK) - iomap->offset) >> 9;
 }
 
-static int dax_iomap_pfn(struct iomap *iomap, loff_t pos, size_t size,
+static int dax_iomap_pfn(const struct iomap *iomap, loff_t pos, size_t size,
 			 pfn_t *pfnp)
 {
 	const sector_t sector = dax_iomap_sector(iomap, pos);
@@ -1068,7 +1068,7 @@ static vm_fault_t dax_load_hole(struct xa_state *xas,
 
 #ifdef CONFIG_FS_DAX_PMD
 static vm_fault_t dax_pmd_load_hole(struct xa_state *xas, struct vm_fault *vmf,
-		struct iomap *iomap, void **entry)
+		const struct iomap *iomap, void **entry)
 {
 	struct address_space *mapping = vmf->vma->vm_file->f_mapping;
 	unsigned long pmd_addr = vmf->address & PMD_MASK;
@@ -1120,7 +1120,7 @@ static vm_fault_t dax_pmd_load_hole(struct xa_state *xas, struct vm_fault *vmf,
 }
 #else
 static vm_fault_t dax_pmd_load_hole(struct xa_state *xas, struct vm_fault *vmf,
-		struct iomap *iomap, void **entry)
+		const struct iomap *iomap, void **entry)
 {
 	return VM_FAULT_FALLBACK;
 }
@@ -1309,7 +1309,7 @@ static vm_fault_t dax_fault_return(int error)
  * flushed on write-faults (non-cow), but not read-faults.
  */
 static bool dax_fault_is_synchronous(unsigned long flags,
-		struct vm_area_struct *vma, struct iomap *iomap)
+		struct vm_area_struct *vma, const struct iomap *iomap)
 {
 	return (flags & IOMAP_WRITE) && (vma->vm_flags & VM_SYNC)
 		&& (iomap->flags & IOMAP_F_DIRTY);
@@ -1329,22 +1329,22 @@ static vm_fault_t dax_fault_synchronous_pfnp(pfn_t *pfnp, pfn_t pfn)
 	return VM_FAULT_NEEDDSYNC;
 }
 
-static vm_fault_t dax_fault_cow_page(struct vm_fault *vmf, struct iomap *iomap,
-		loff_t pos)
+static vm_fault_t dax_fault_cow_page(struct vm_fault *vmf,
+		const struct iomap_iter *iter)
 {
-	sector_t sector = dax_iomap_sector(iomap, pos);
+	sector_t sector = dax_iomap_sector(&iter->iomap, iter->pos);
 	unsigned long vaddr = vmf->address;
 	vm_fault_t ret;
 	int error = 0;
 
-	switch (iomap->type) {
+	switch (iter->iomap.type) {
 	case IOMAP_HOLE:
 	case IOMAP_UNWRITTEN:
 		clear_user_highpage(vmf->cow_page, vaddr);
 		break;
 	case IOMAP_MAPPED:
-		error = copy_cow_page_dax(iomap->bdev, iomap->dax_dev, sector,
-					  vmf->cow_page, vaddr);
+		error = copy_cow_page_dax(iter->iomap.bdev, iter->iomap.dax_dev,
+					  sector, vmf->cow_page, vaddr);
 		break;
 	default:
 		WARN_ON_ONCE(1);
@@ -1363,29 +1363,31 @@ static vm_fault_t dax_fault_cow_page(struct vm_fault *vmf, struct iomap *iomap,
 }
 
 /**
- * dax_fault_actor - Common actor to handle pfn insertion in PTE/PMD fault.
+ * dax_fault_iter - Common actor to handle pfn insertion in PTE/PMD fault.
  * @vmf:	vm fault instance
+ * @iter:	iomap iter
  * @pfnp:	pfn to be returned
  * @xas:	the dax mapping tree of a file
  * @entry:	an unlocked dax entry to be inserted
  * @pmd:	distinguish whether it is a pmd fault
- * @flags:	iomap flags
- * @iomap:	from iomap_begin()
- * @srcmap:	from iomap_begin(), not equal to iomap if it is a CoW
  */
-static vm_fault_t dax_fault_actor(struct vm_fault *vmf, pfn_t *pfnp,
-		struct xa_state *xas, void **entry, bool pmd,
-		unsigned int flags, struct iomap *iomap, struct iomap *srcmap)
+static vm_fault_t dax_fault_iter(struct vm_fault *vmf,
+		const struct iomap_iter *iter, pfn_t *pfnp,
+		struct xa_state *xas, void **entry, bool pmd)
 {
 	struct address_space *mapping = vmf->vma->vm_file->f_mapping;
+	const struct iomap *iomap = &iter->iomap;
 	size_t size = pmd ? PMD_SIZE : PAGE_SIZE;
 	loff_t pos = (loff_t)xas->xa_index << PAGE_SHIFT;
 	bool write = vmf->flags & FAULT_FLAG_WRITE;
-	bool sync = dax_fault_is_synchronous(flags, vmf->vma, iomap);
+	bool sync = dax_fault_is_synchronous(iter->flags, vmf->vma, iomap);
 	unsigned long entry_flags = pmd ? DAX_PMD : 0;
 	int err = 0;
 	pfn_t pfn;
 
+	if (!pmd && vmf->cow_page)
+		return dax_fault_cow_page(vmf, iter);
+
 	/* if we are reading UNWRITTEN and HOLE, return a hole. */
 	if (!write &&
 	    (iomap->type == IOMAP_UNWRITTEN || iomap->type == IOMAP_HOLE)) {
@@ -1399,7 +1401,7 @@ static vm_fault_t dax_fault_actor(struct vm_fault *vmf, pfn_t *pfnp,
 		return pmd ? VM_FAULT_FALLBACK : VM_FAULT_SIGBUS;
 	}
 
-	err = dax_iomap_pfn(iomap, pos, size, &pfn);
+	err = dax_iomap_pfn(&iter->iomap, pos, size, &pfn);
 	if (err)
 		return pmd ? VM_FAULT_FALLBACK : dax_fault_return(err);
 
@@ -1422,32 +1424,31 @@ static vm_fault_t dax_fault_actor(struct vm_fault *vmf, pfn_t *pfnp,
 static vm_fault_t dax_iomap_pte_fault(struct vm_fault *vmf, pfn_t *pfnp,
 			       int *iomap_errp, const struct iomap_ops *ops)
 {
-	struct vm_area_struct *vma = vmf->vma;
-	struct address_space *mapping = vma->vm_file->f_mapping;
+	struct address_space *mapping = vmf->vma->vm_file->f_mapping;
 	XA_STATE(xas, &mapping->i_pages, vmf->pgoff);
-	struct inode *inode = mapping->host;
-	loff_t pos = (loff_t)vmf->pgoff << PAGE_SHIFT;
-	struct iomap iomap = { .type = IOMAP_HOLE };
-	struct iomap srcmap = { .type = IOMAP_HOLE };
-	unsigned flags = IOMAP_FAULT;
-	int error;
-	bool write = vmf->flags & FAULT_FLAG_WRITE;
-	vm_fault_t ret = 0, major = 0;
+	struct iomap_iter iter = {
+		.inode		= mapping->host,
+		.pos		= (loff_t)vmf->pgoff << PAGE_SHIFT,
+		.len		= PAGE_SIZE,
+		.flags		= IOMAP_FAULT,
+	};
+	vm_fault_t ret = 0;
 	void *entry;
+	int error;
 
-	trace_dax_pte_fault(inode, vmf, ret);
+	trace_dax_pte_fault(iter.inode, vmf, ret);
 	/*
 	 * Check whether offset isn't beyond end of file now. Caller is supposed
 	 * to hold locks serializing us with truncate / punch hole so this is
 	 * a reliable test.
 	 */
-	if (pos >= i_size_read(inode)) {
+	if (iter.pos >= i_size_read(iter.inode)) {
 		ret = VM_FAULT_SIGBUS;
 		goto out;
 	}
 
-	if (write && !vmf->cow_page)
-		flags |= IOMAP_WRITE;
+	if ((vmf->flags & FAULT_FLAG_WRITE) && !vmf->cow_page)
+		iter.flags |= IOMAP_WRITE;
 
 	entry = grab_mapping_entry(&xas, mapping, 0);
 	if (xa_is_internal(entry)) {
@@ -1466,59 +1467,34 @@ static vm_fault_t dax_iomap_pte_fault(struct vm_fault *vmf, pfn_t *pfnp,
 		goto unlock_entry;
 	}
 
-	/*
-	 * Note that we don't bother to use iomap_iter here: DAX required
-	 * the file system block size to be equal the page size, which means
-	 * that we never have to deal with more than a single extent here.
-	 */
-	error = ops->iomap_begin(inode, pos, PAGE_SIZE, flags, &iomap, &srcmap);
-	if (iomap_errp)
-		*iomap_errp = error;
-	if (error) {
-		ret = dax_fault_return(error);
-		goto unlock_entry;
-	}
-	if (WARN_ON_ONCE(iomap.offset + iomap.length < pos + PAGE_SIZE)) {
-		ret = VM_FAULT_SIGBUS;	/* fs corruption? */
-		goto finish_iomap;
-	}
-
-	if (vmf->cow_page) {
-		ret = dax_fault_cow_page(vmf, &iomap, pos);
-		goto finish_iomap;
-	}
+	while ((error = iomap_iter(&iter, ops)) > 0) {
+		if (WARN_ON_ONCE(iomap_length(&iter) < PAGE_SIZE)) {
+			iter.processed = -EIO;	/* fs corruption? */
+			continue;
+		}
 
-	ret = dax_fault_actor(vmf, pfnp, &xas, &entry, false, flags,
-			      &iomap, &srcmap);
-	if (ret == VM_FAULT_SIGBUS)
-		goto finish_iomap;
+		ret = dax_fault_iter(vmf, &iter, pfnp, &xas, &entry, false);
+		if (ret != VM_FAULT_SIGBUS &&
+		    (iter.iomap.flags & IOMAP_F_NEW)) {
+			count_vm_event(PGMAJFAULT);
+			count_memcg_event_mm(vmf->vma->vm_mm, PGMAJFAULT);
+			ret |= VM_FAULT_MAJOR;
+		}
 
-	/* read/write MAPPED, CoW UNWRITTEN */
-	if (iomap.flags & IOMAP_F_NEW) {
-		count_vm_event(PGMAJFAULT);
-		count_memcg_event_mm(vma->vm_mm, PGMAJFAULT);
-		major = VM_FAULT_MAJOR;
+		if (!(ret & VM_FAULT_ERROR))
+			iter.processed = PAGE_SIZE;
 	}
 
-finish_iomap:
-	if (ops->iomap_end) {
-		int copied = PAGE_SIZE;
+	if (iomap_errp)
+		*iomap_errp = error;
+	if (!ret && error)
+		ret = dax_fault_return(error);
 
-		if (ret & VM_FAULT_ERROR)
-			copied = 0;
-		/*
-		 * The fault is done by now and there's no way back (other
-		 * thread may be already happily using PTE we have installed).
-		 * Just ignore error from ->iomap_end since we cannot do much
-		 * with it.
-		 */
-		ops->iomap_end(inode, pos, PAGE_SIZE, copied, flags, &iomap);
-	}
 unlock_entry:
 	dax_unlock_entry(&xas, entry);
 out:
-	trace_dax_pte_fault_done(inode, vmf, ret);
-	return ret | major;
+	trace_dax_pte_fault_done(iter.inode, vmf, ret);
+	return ret;
 }
 
 #ifdef CONFIG_FS_DAX_PMD
@@ -1558,28 +1534,29 @@ static bool dax_fault_check_fallback(struct vm_fault *vmf, struct xa_state *xas,
 static vm_fault_t dax_iomap_pmd_fault(struct vm_fault *vmf, pfn_t *pfnp,
 			       const struct iomap_ops *ops)
 {
-	struct vm_area_struct *vma = vmf->vma;
-	struct address_space *mapping = vma->vm_file->f_mapping;
+	struct address_space *mapping = vmf->vma->vm_file->f_mapping;
 	XA_STATE_ORDER(xas, &mapping->i_pages, vmf->pgoff, PMD_ORDER);
-	bool write = vmf->flags & FAULT_FLAG_WRITE;
-	unsigned int flags = (write ? IOMAP_WRITE : 0) | IOMAP_FAULT;
-	struct inode *inode = mapping->host;
+	struct iomap_iter iter = {
+		.inode		= mapping->host,
+		.len		= PMD_SIZE,
+		.flags		= IOMAP_FAULT,
+	};
 	vm_fault_t ret = VM_FAULT_FALLBACK;
-	struct iomap iomap = { .type = IOMAP_HOLE };
-	struct iomap srcmap = { .type = IOMAP_HOLE };
 	pgoff_t max_pgoff;
 	void *entry;
-	loff_t pos;
 	int error;
 
+	if (vmf->flags & FAULT_FLAG_WRITE)
+		iter.flags |= IOMAP_WRITE;
+
 	/*
 	 * Check whether offset isn't beyond end of file now. Caller is
 	 * supposed to hold locks serializing us with truncate / punch hole so
 	 * this is a reliable test.
 	 */
-	max_pgoff = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
+	max_pgoff = DIV_ROUND_UP(i_size_read(iter.inode), PAGE_SIZE);
 
-	trace_dax_pmd_fault(inode, vmf, max_pgoff, 0);
+	trace_dax_pmd_fault(iter.inode, vmf, max_pgoff, 0);
 
 	if (xas.xa_index >= max_pgoff) {
 		ret = VM_FAULT_SIGBUS;
@@ -1613,45 +1590,25 @@ static vm_fault_t dax_iomap_pmd_fault(struct vm_fault *vmf, pfn_t *pfnp,
 		goto unlock_entry;
 	}
 
-	/*
-	 * Note that we don't use iomap_iter here.  We aren't doing I/O, only
-	 * setting up a mapping, so really we're using iomap_begin() as a way
-	 * to look up our filesystem block.
-	 */
-	pos = (loff_t)xas.xa_index << PAGE_SHIFT;
-	error = ops->iomap_begin(inode, pos, PMD_SIZE, flags, &iomap, &srcmap);
-	if (error)
-		goto unlock_entry;
-
-	if (iomap.offset + iomap.length < pos + PMD_SIZE)
-		goto finish_iomap;
+	iter.pos = (loff_t)xas.xa_index << PAGE_SHIFT;
+	while ((error = iomap_iter(&iter, ops)) > 0) {
+		if (iomap_length(&iter) < PMD_SIZE)
+			continue; /* actually breaks out of the loop */
 
-	ret = dax_fault_actor(vmf, pfnp, &xas, &entry, true, flags,
-			      &iomap, &srcmap);
-
-finish_iomap:
-	if (ops->iomap_end) {
-		int copied = PMD_SIZE;
-
-		if (ret == VM_FAULT_FALLBACK)
-			copied = 0;
-		/*
-		 * The fault is done by now and there's no way back (other
-		 * thread may be already happily using PMD we have installed).
-		 * Just ignore error from ->iomap_end since we cannot do much
-		 * with it.
-		 */
-		ops->iomap_end(inode, pos, PMD_SIZE, copied, flags, &iomap);
+		ret = dax_fault_iter(vmf, &iter, pfnp, &xas, &entry, true);
+		if (ret != VM_FAULT_FALLBACK)
+			iter.processed = PMD_SIZE;
 	}
+
 unlock_entry:
 	dax_unlock_entry(&xas, entry);
 fallback:
 	if (ret == VM_FAULT_FALLBACK) {
-		split_huge_pmd(vma, vmf->pmd, vmf->address);
+		split_huge_pmd(vmf->vma, vmf->pmd, vmf->address);
 		count_vm_event(THP_FAULT_FALLBACK);
 	}
 out:
-	trace_dax_pmd_fault_done(inode, vmf, max_pgoff, ret);
+	trace_dax_pmd_fault_done(iter.inode, vmf, max_pgoff, ret);
 	return ret;
 }
 #else
-- 
2.30.2

