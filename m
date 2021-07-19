Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C6B193CD328
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Jul 2021 13:09:27 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-WBwXqnBzOyq2Fo7P6ktolQ-1; Mon, 19 Jul 2021 07:09:25 -0400
X-MC-Unique: WBwXqnBzOyq2Fo7P6ktolQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62F2C57223;
	Mon, 19 Jul 2021 11:09:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 456F319C44;
	Mon, 19 Jul 2021 11:09:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1EC341809C99;
	Mon, 19 Jul 2021 11:09:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16JB5HCE008814 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Jul 2021 07:05:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5F46121568AE; Mon, 19 Jul 2021 11:05:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AF9221568A4
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 11:05:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A1B6866DF8
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 11:05:14 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-394-37zY2HcXP3mPW40pGAkhug-1; Mon, 19 Jul 2021 07:05:09 -0400
X-MC-Unique: 37zY2HcXP3mPW40pGAkhug-1
Received: from [2001:4bb8:193:7660:d2a4:8d57:2e55:21d0] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5R3S-006mVY-CV; Mon, 19 Jul 2021 11:03:34 +0000
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Date: Mon, 19 Jul 2021 12:35:18 +0200
Message-Id: <20210719103520.495450-26-hch@lst.de>
In-Reply-To: <20210719103520.495450-1-hch@lst.de>
References: <20210719103520.495450-1-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: nvdimm@lists.linux.dev, cluster-devel@redhat.com,
	Matthew Wilcox <willy@infradead.org>,
	Shiyang Ruan <ruansy.fnst@fujitsu.com>, linux-xfs@vger.kernel.org,
	Ritesh Harjani <riteshh@linux.ibm.com>, linux-fsdevel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH 25/27] fsdax: factor out a dax_fault_actor()
	helper
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Shiyang Ruan <ruansy.fnst@fujitsu.com>

The core logic in the two dax page fault functions is similar. So, move
the logic into a common helper function. Also, to facilitate the
addition of new features, such as CoW, switch-case is no longer used to
handle different iomap types.

Signed-off-by: Shiyang Ruan <ruansy.fnst@fujitsu.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Ritesh Harjani <riteshh@linux.ibm.com>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/dax.c | 297 ++++++++++++++++++++++++++++---------------------------
 1 file changed, 149 insertions(+), 148 deletions(-)

diff --git a/fs/dax.c b/fs/dax.c
index c09d721629d167..6d0c6d28be83b1 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -1066,6 +1066,66 @@ static vm_fault_t dax_load_hole(struct xa_state *xas,
 	return ret;
 }
 
+#ifdef CONFIG_FS_DAX_PMD
+static vm_fault_t dax_pmd_load_hole(struct xa_state *xas, struct vm_fault *vmf,
+		struct iomap *iomap, void **entry)
+{
+	struct address_space *mapping = vmf->vma->vm_file->f_mapping;
+	unsigned long pmd_addr = vmf->address & PMD_MASK;
+	struct vm_area_struct *vma = vmf->vma;
+	struct inode *inode = mapping->host;
+	pgtable_t pgtable = NULL;
+	struct page *zero_page;
+	spinlock_t *ptl;
+	pmd_t pmd_entry;
+	pfn_t pfn;
+
+	zero_page = mm_get_huge_zero_page(vmf->vma->vm_mm);
+
+	if (unlikely(!zero_page))
+		goto fallback;
+
+	pfn = page_to_pfn_t(zero_page);
+	*entry = dax_insert_entry(xas, mapping, vmf, *entry, pfn,
+			DAX_PMD | DAX_ZERO_PAGE, false);
+
+	if (arch_needs_pgtable_deposit()) {
+		pgtable = pte_alloc_one(vma->vm_mm);
+		if (!pgtable)
+			return VM_FAULT_OOM;
+	}
+
+	ptl = pmd_lock(vmf->vma->vm_mm, vmf->pmd);
+	if (!pmd_none(*(vmf->pmd))) {
+		spin_unlock(ptl);
+		goto fallback;
+	}
+
+	if (pgtable) {
+		pgtable_trans_huge_deposit(vma->vm_mm, vmf->pmd, pgtable);
+		mm_inc_nr_ptes(vma->vm_mm);
+	}
+	pmd_entry = mk_pmd(zero_page, vmf->vma->vm_page_prot);
+	pmd_entry = pmd_mkhuge(pmd_entry);
+	set_pmd_at(vmf->vma->vm_mm, pmd_addr, vmf->pmd, pmd_entry);
+	spin_unlock(ptl);
+	trace_dax_pmd_load_hole(inode, vmf, zero_page, *entry);
+	return VM_FAULT_NOPAGE;
+
+fallback:
+	if (pgtable)
+		pte_free(vma->vm_mm, pgtable);
+	trace_dax_pmd_load_hole_fallback(inode, vmf, zero_page, *entry);
+	return VM_FAULT_FALLBACK;
+}
+#else
+static vm_fault_t dax_pmd_load_hole(struct xa_state *xas, struct vm_fault *vmf,
+		struct iomap *iomap, void **entry)
+{
+	return VM_FAULT_FALLBACK;
+}
+#endif /* CONFIG_FS_DAX_PMD */
+
 s64 dax_iomap_zero(loff_t pos, u64 length, struct iomap *iomap)
 {
 	sector_t sector = iomap_sector(iomap, pos & PAGE_MASK);
@@ -1302,6 +1362,63 @@ static vm_fault_t dax_fault_cow_page(struct vm_fault *vmf, struct iomap *iomap,
 	return ret;
 }
 
+/**
+ * dax_fault_actor - Common actor to handle pfn insertion in PTE/PMD fault.
+ * @vmf:	vm fault instance
+ * @pfnp:	pfn to be returned
+ * @xas:	the dax mapping tree of a file
+ * @entry:	an unlocked dax entry to be inserted
+ * @pmd:	distinguish whether it is a pmd fault
+ * @flags:	iomap flags
+ * @iomap:	from iomap_begin()
+ * @srcmap:	from iomap_begin(), not equal to iomap if it is a CoW
+ */
+static vm_fault_t dax_fault_actor(struct vm_fault *vmf, pfn_t *pfnp,
+		struct xa_state *xas, void **entry, bool pmd,
+		unsigned int flags, struct iomap *iomap, struct iomap *srcmap)
+{
+	struct address_space *mapping = vmf->vma->vm_file->f_mapping;
+	size_t size = pmd ? PMD_SIZE : PAGE_SIZE;
+	loff_t pos = (loff_t)xas->xa_index << PAGE_SHIFT;
+	bool write = vmf->flags & FAULT_FLAG_WRITE;
+	bool sync = dax_fault_is_synchronous(flags, vmf->vma, iomap);
+	unsigned long entry_flags = pmd ? DAX_PMD : 0;
+	int err = 0;
+	pfn_t pfn;
+
+	/* if we are reading UNWRITTEN and HOLE, return a hole. */
+	if (!write &&
+	    (iomap->type == IOMAP_UNWRITTEN || iomap->type == IOMAP_HOLE)) {
+		if (!pmd)
+			return dax_load_hole(xas, mapping, entry, vmf);
+		return dax_pmd_load_hole(xas, vmf, iomap, entry);
+	}
+
+	if (iomap->type != IOMAP_MAPPED) {
+		WARN_ON_ONCE(1);
+		return pmd ? VM_FAULT_FALLBACK : VM_FAULT_SIGBUS;
+	}
+
+	err = dax_iomap_pfn(iomap, pos, size, &pfn);
+	if (err)
+		return pmd ? VM_FAULT_FALLBACK : dax_fault_return(err);
+
+	*entry = dax_insert_entry(xas, mapping, vmf, *entry, pfn, entry_flags,
+				  write && !sync);
+
+	if (sync)
+		return dax_fault_synchronous_pfnp(pfnp, pfn);
+
+	/* insert PMD pfn */
+	if (pmd)
+		return vmf_insert_pfn_pmd(vmf, pfn, write);
+
+	/* insert PTE pfn */
+	if (write)
+		return vmf_insert_mixed_mkwrite(vmf->vma, vmf->address, pfn);
+	return vmf_insert_mixed(vmf->vma, vmf->address, pfn);
+}
+
 static vm_fault_t dax_iomap_pte_fault(struct vm_fault *vmf, pfn_t *pfnp,
 			       int *iomap_errp, const struct iomap_ops *ops)
 {
@@ -1309,17 +1426,14 @@ static vm_fault_t dax_iomap_pte_fault(struct vm_fault *vmf, pfn_t *pfnp,
 	struct address_space *mapping = vma->vm_file->f_mapping;
 	XA_STATE(xas, &mapping->i_pages, vmf->pgoff);
 	struct inode *inode = mapping->host;
-	unsigned long vaddr = vmf->address;
 	loff_t pos = (loff_t)vmf->pgoff << PAGE_SHIFT;
 	struct iomap iomap = { .type = IOMAP_HOLE };
 	struct iomap srcmap = { .type = IOMAP_HOLE };
 	unsigned flags = IOMAP_FAULT;
-	int error, major = 0;
+	int error;
 	bool write = vmf->flags & FAULT_FLAG_WRITE;
-	bool sync;
-	vm_fault_t ret = 0;
+	vm_fault_t ret = 0, major = 0;
 	void *entry;
-	pfn_t pfn;
 
 	trace_dax_pte_fault(inode, vmf, ret);
 	/*
@@ -1365,8 +1479,8 @@ static vm_fault_t dax_iomap_pte_fault(struct vm_fault *vmf, pfn_t *pfnp,
 		goto unlock_entry;
 	}
 	if (WARN_ON_ONCE(iomap.offset + iomap.length < pos + PAGE_SIZE)) {
-		error = -EIO;	/* fs corruption? */
-		goto error_finish_iomap;
+		ret = VM_FAULT_SIGBUS;	/* fs corruption? */
+		goto finish_iomap;
 	}
 
 	if (vmf->cow_page) {
@@ -1374,49 +1488,19 @@ static vm_fault_t dax_iomap_pte_fault(struct vm_fault *vmf, pfn_t *pfnp,
 		goto finish_iomap;
 	}
 
-	sync = dax_fault_is_synchronous(flags, vma, &iomap);
-
-	switch (iomap.type) {
-	case IOMAP_MAPPED:
-		if (iomap.flags & IOMAP_F_NEW) {
-			count_vm_event(PGMAJFAULT);
-			count_memcg_event_mm(vma->vm_mm, PGMAJFAULT);
-			major = VM_FAULT_MAJOR;
-		}
-		error = dax_iomap_pfn(&iomap, pos, PAGE_SIZE, &pfn);
-		if (error < 0)
-			goto error_finish_iomap;
-
-		entry = dax_insert_entry(&xas, mapping, vmf, entry, pfn,
-						 0, write && !sync);
-
-		if (sync) {
-			ret = dax_fault_synchronous_pfnp(pfnp, pfn);
-			goto finish_iomap;
-		}
-		trace_dax_insert_mapping(inode, vmf, entry);
-		if (write)
-			ret = vmf_insert_mixed_mkwrite(vma, vaddr, pfn);
-		else
-			ret = vmf_insert_mixed(vma, vaddr, pfn);
-
+	ret = dax_fault_actor(vmf, pfnp, &xas, &entry, false, flags,
+			      &iomap, &srcmap);
+	if (ret == VM_FAULT_SIGBUS)
 		goto finish_iomap;
-	case IOMAP_UNWRITTEN:
-	case IOMAP_HOLE:
-		if (!write) {
-			ret = dax_load_hole(&xas, mapping, &entry, vmf);
-			goto finish_iomap;
-		}
-		fallthrough;
-	default:
-		WARN_ON_ONCE(1);
-		error = -EIO;
-		break;
+
+	/* read/write MAPPED, CoW UNWRITTEN */
+	if (iomap.flags & IOMAP_F_NEW) {
+		count_vm_event(PGMAJFAULT);
+		count_memcg_event_mm(vma->vm_mm, PGMAJFAULT);
+		major = VM_FAULT_MAJOR;
 	}
 
- error_finish_iomap:
-	ret = dax_fault_return(error);
- finish_iomap:
+finish_iomap:
 	if (ops->iomap_end) {
 		int copied = PAGE_SIZE;
 
@@ -1430,66 +1514,14 @@ static vm_fault_t dax_iomap_pte_fault(struct vm_fault *vmf, pfn_t *pfnp,
 		 */
 		ops->iomap_end(inode, pos, PAGE_SIZE, copied, flags, &iomap);
 	}
- unlock_entry:
+unlock_entry:
 	dax_unlock_entry(&xas, entry);
- out:
+out:
 	trace_dax_pte_fault_done(inode, vmf, ret);
 	return ret | major;
 }
 
 #ifdef CONFIG_FS_DAX_PMD
-static vm_fault_t dax_pmd_load_hole(struct xa_state *xas, struct vm_fault *vmf,
-		struct iomap *iomap, void **entry)
-{
-	struct address_space *mapping = vmf->vma->vm_file->f_mapping;
-	unsigned long pmd_addr = vmf->address & PMD_MASK;
-	struct vm_area_struct *vma = vmf->vma;
-	struct inode *inode = mapping->host;
-	pgtable_t pgtable = NULL;
-	struct page *zero_page;
-	spinlock_t *ptl;
-	pmd_t pmd_entry;
-	pfn_t pfn;
-
-	zero_page = mm_get_huge_zero_page(vmf->vma->vm_mm);
-
-	if (unlikely(!zero_page))
-		goto fallback;
-
-	pfn = page_to_pfn_t(zero_page);
-	*entry = dax_insert_entry(xas, mapping, vmf, *entry, pfn,
-			DAX_PMD | DAX_ZERO_PAGE, false);
-
-	if (arch_needs_pgtable_deposit()) {
-		pgtable = pte_alloc_one(vma->vm_mm);
-		if (!pgtable)
-			return VM_FAULT_OOM;
-	}
-
-	ptl = pmd_lock(vmf->vma->vm_mm, vmf->pmd);
-	if (!pmd_none(*(vmf->pmd))) {
-		spin_unlock(ptl);
-		goto fallback;
-	}
-
-	if (pgtable) {
-		pgtable_trans_huge_deposit(vma->vm_mm, vmf->pmd, pgtable);
-		mm_inc_nr_ptes(vma->vm_mm);
-	}
-	pmd_entry = mk_pmd(zero_page, vmf->vma->vm_page_prot);
-	pmd_entry = pmd_mkhuge(pmd_entry);
-	set_pmd_at(vmf->vma->vm_mm, pmd_addr, vmf->pmd, pmd_entry);
-	spin_unlock(ptl);
-	trace_dax_pmd_load_hole(inode, vmf, zero_page, *entry);
-	return VM_FAULT_NOPAGE;
-
-fallback:
-	if (pgtable)
-		pte_free(vma->vm_mm, pgtable);
-	trace_dax_pmd_load_hole_fallback(inode, vmf, zero_page, *entry);
-	return VM_FAULT_FALLBACK;
-}
-
 static bool dax_fault_check_fallback(struct vm_fault *vmf, struct xa_state *xas,
 		pgoff_t max_pgoff)
 {
@@ -1530,17 +1562,15 @@ static vm_fault_t dax_iomap_pmd_fault(struct vm_fault *vmf, pfn_t *pfnp,
 	struct address_space *mapping = vma->vm_file->f_mapping;
 	XA_STATE_ORDER(xas, &mapping->i_pages, vmf->pgoff, PMD_ORDER);
 	bool write = vmf->flags & FAULT_FLAG_WRITE;
-	bool sync;
-	unsigned int iomap_flags = (write ? IOMAP_WRITE : 0) | IOMAP_FAULT;
+	unsigned int flags = (write ? IOMAP_WRITE : 0) | IOMAP_FAULT;
 	struct inode *inode = mapping->host;
-	vm_fault_t result = VM_FAULT_FALLBACK;
+	vm_fault_t ret = VM_FAULT_FALLBACK;
 	struct iomap iomap = { .type = IOMAP_HOLE };
 	struct iomap srcmap = { .type = IOMAP_HOLE };
 	pgoff_t max_pgoff;
 	void *entry;
 	loff_t pos;
 	int error;
-	pfn_t pfn;
 
 	/*
 	 * Check whether offset isn't beyond end of file now. Caller is
@@ -1552,7 +1582,7 @@ static vm_fault_t dax_iomap_pmd_fault(struct vm_fault *vmf, pfn_t *pfnp,
 	trace_dax_pmd_fault(inode, vmf, max_pgoff, 0);
 
 	if (xas.xa_index >= max_pgoff) {
-		result = VM_FAULT_SIGBUS;
+		ret = VM_FAULT_SIGBUS;
 		goto out;
 	}
 
@@ -1567,7 +1597,7 @@ static vm_fault_t dax_iomap_pmd_fault(struct vm_fault *vmf, pfn_t *pfnp,
 	 */
 	entry = grab_mapping_entry(&xas, mapping, PMD_ORDER);
 	if (xa_is_internal(entry)) {
-		result = xa_to_internal(entry);
+		ret = xa_to_internal(entry);
 		goto fallback;
 	}
 
@@ -1579,7 +1609,7 @@ static vm_fault_t dax_iomap_pmd_fault(struct vm_fault *vmf, pfn_t *pfnp,
 	 */
 	if (!pmd_none(*vmf->pmd) && !pmd_trans_huge(*vmf->pmd) &&
 			!pmd_devmap(*vmf->pmd)) {
-		result = 0;
+		ret = 0;
 		goto unlock_entry;
 	}
 
@@ -1589,49 +1619,21 @@ static vm_fault_t dax_iomap_pmd_fault(struct vm_fault *vmf, pfn_t *pfnp,
 	 * to look up our filesystem block.
 	 */
 	pos = (loff_t)xas.xa_index << PAGE_SHIFT;
-	error = ops->iomap_begin(inode, pos, PMD_SIZE, iomap_flags, &iomap,
-			&srcmap);
+	error = ops->iomap_begin(inode, pos, PMD_SIZE, flags, &iomap, &srcmap);
 	if (error)
 		goto unlock_entry;
 
 	if (iomap.offset + iomap.length < pos + PMD_SIZE)
 		goto finish_iomap;
 
-	sync = dax_fault_is_synchronous(iomap_flags, vma, &iomap);
-
-	switch (iomap.type) {
-	case IOMAP_MAPPED:
-		error = dax_iomap_pfn(&iomap, pos, PMD_SIZE, &pfn);
-		if (error < 0)
-			goto finish_iomap;
+	ret = dax_fault_actor(vmf, pfnp, &xas, &entry, true, flags,
+			      &iomap, &srcmap);
 
-		entry = dax_insert_entry(&xas, mapping, vmf, entry, pfn,
-						DAX_PMD, write && !sync);
-
-		if (sync) {
-			result = dax_fault_synchronous_pfnp(pfnp, pfn);
-			goto finish_iomap;
-		}
-
-		trace_dax_pmd_insert_mapping(inode, vmf, PMD_SIZE, pfn, entry);
-		result = vmf_insert_pfn_pmd(vmf, pfn, write);
-		break;
-	case IOMAP_UNWRITTEN:
-	case IOMAP_HOLE:
-		if (WARN_ON_ONCE(write))
-			break;
-		result = dax_pmd_load_hole(&xas, vmf, &iomap, &entry);
-		break;
-	default:
-		WARN_ON_ONCE(1);
-		break;
-	}
-
- finish_iomap:
+finish_iomap:
 	if (ops->iomap_end) {
 		int copied = PMD_SIZE;
 
-		if (result == VM_FAULT_FALLBACK)
+		if (ret == VM_FAULT_FALLBACK)
 			copied = 0;
 		/*
 		 * The fault is done by now and there's no way back (other
@@ -1639,19 +1641,18 @@ static vm_fault_t dax_iomap_pmd_fault(struct vm_fault *vmf, pfn_t *pfnp,
 		 * Just ignore error from ->iomap_end since we cannot do much
 		 * with it.
 		 */
-		ops->iomap_end(inode, pos, PMD_SIZE, copied, iomap_flags,
-				&iomap);
+		ops->iomap_end(inode, pos, PMD_SIZE, copied, flags, &iomap);
 	}
- unlock_entry:
+unlock_entry:
 	dax_unlock_entry(&xas, entry);
- fallback:
-	if (result == VM_FAULT_FALLBACK) {
+fallback:
+	if (ret == VM_FAULT_FALLBACK) {
 		split_huge_pmd(vma, vmf->pmd, vmf->address);
 		count_vm_event(THP_FAULT_FALLBACK);
 	}
 out:
-	trace_dax_pmd_fault_done(inode, vmf, max_pgoff, result);
-	return result;
+	trace_dax_pmd_fault_done(inode, vmf, max_pgoff, ret);
+	return ret;
 }
 #else
 static vm_fault_t dax_iomap_pmd_fault(struct vm_fault *vmf, pfn_t *pfnp,
-- 
2.30.2

