Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7CFD23E403B
	for <lists+cluster-devel@lfdr.de>; Mon,  9 Aug 2021 08:38:55 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-rU6m0i2iMqqV3y3SzdUzhw-1; Mon, 09 Aug 2021 02:38:53 -0400
X-MC-Unique: rU6m0i2iMqqV3y3SzdUzhw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F61F107466D;
	Mon,  9 Aug 2021 06:38:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F1AE660C81;
	Mon,  9 Aug 2021 06:38:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D8439180B7A2;
	Mon,  9 Aug 2021 06:38:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1796cUGB004444 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 9 Aug 2021 02:38:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8501D200A4F5; Mon,  9 Aug 2021 06:38:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EE4D21568AE
	for <cluster-devel@redhat.com>; Mon,  9 Aug 2021 06:38:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DD61101A52C
	for <cluster-devel@redhat.com>; Mon,  9 Aug 2021 06:38:27 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-255-m9Bmo0wmPo-fbIbJPanYMw-1; Mon, 09 Aug 2021 02:38:25 -0400
X-MC-Unique: m9Bmo0wmPo-fbIbJPanYMw-1
Received: from [2a02:1205:5023:1f80:c068:bd3d:78b3:7d37] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCysS-00Ai33-Vs; Mon, 09 Aug 2021 06:35:30 +0000
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Date: Mon,  9 Aug 2021 08:12:41 +0200
Message-Id: <20210809061244.1196573-28-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: nvdimm@lists.linux.dev, cluster-devel@redhat.com,
	Matthew Wilcox <willy@infradead.org>,
	Shiyang Ruan <ruansy.fnst@fujitsu.com>, linux-xfs@vger.kernel.org,
	Ritesh Harjani <riteshh@linux.ibm.com>, linux-fsdevel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH 27/30] fsdax: factor out helpers to simplify
	the dax fault code
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

From: Shiyang Ruan <ruansy.fnst@fujitsu.com>

The dax page fault code is too long and a bit difficult to read. And it
is hard to understand when we trying to add new features. Some of the
PTE/PMD codes have similar logic. So, factor out helper functions to
simplify the code.

Signed-off-by: Shiyang Ruan <ruansy.fnst@fujitsu.com>
Reviewed-by: Ritesh Harjani <riteshh@linux.ibm.com>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
[hch: minor cleanups]
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/dax.c | 153 ++++++++++++++++++++++++++++++-------------------------
 1 file changed, 84 insertions(+), 69 deletions(-)

diff --git a/fs/dax.c b/fs/dax.c
index 51da45301350a6..c09d721629d167 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -1255,6 +1255,53 @@ static bool dax_fault_is_synchronous(unsigned long flags,
 		&& (iomap->flags & IOMAP_F_DIRTY);
 }
 
+/*
+ * When handling a synchronous page fault and the inode need a fsync, we can
+ * insert the PTE/PMD into page tables only after that fsync happened. Skip
+ * insertion for now and return the pfn so that caller can insert it after the
+ * fsync is done.
+ */
+static vm_fault_t dax_fault_synchronous_pfnp(pfn_t *pfnp, pfn_t pfn)
+{
+	if (WARN_ON_ONCE(!pfnp))
+		return VM_FAULT_SIGBUS;
+	*pfnp = pfn;
+	return VM_FAULT_NEEDDSYNC;
+}
+
+static vm_fault_t dax_fault_cow_page(struct vm_fault *vmf, struct iomap *iomap,
+		loff_t pos)
+{
+	sector_t sector = dax_iomap_sector(iomap, pos);
+	unsigned long vaddr = vmf->address;
+	vm_fault_t ret;
+	int error = 0;
+
+	switch (iomap->type) {
+	case IOMAP_HOLE:
+	case IOMAP_UNWRITTEN:
+		clear_user_highpage(vmf->cow_page, vaddr);
+		break;
+	case IOMAP_MAPPED:
+		error = copy_cow_page_dax(iomap->bdev, iomap->dax_dev, sector,
+					  vmf->cow_page, vaddr);
+		break;
+	default:
+		WARN_ON_ONCE(1);
+		error = -EIO;
+		break;
+	}
+
+	if (error)
+		return dax_fault_return(error);
+
+	__SetPageUptodate(vmf->cow_page);
+	ret = finish_fault(vmf);
+	if (!ret)
+		return VM_FAULT_DONE_COW;
+	return ret;
+}
+
 static vm_fault_t dax_iomap_pte_fault(struct vm_fault *vmf, pfn_t *pfnp,
 			       int *iomap_errp, const struct iomap_ops *ops)
 {
@@ -1323,30 +1370,7 @@ static vm_fault_t dax_iomap_pte_fault(struct vm_fault *vmf, pfn_t *pfnp,
 	}
 
 	if (vmf->cow_page) {
-		sector_t sector = dax_iomap_sector(&iomap, pos);
-
-		switch (iomap.type) {
-		case IOMAP_HOLE:
-		case IOMAP_UNWRITTEN:
-			clear_user_highpage(vmf->cow_page, vaddr);
-			break;
-		case IOMAP_MAPPED:
-			error = copy_cow_page_dax(iomap.bdev, iomap.dax_dev,
-						  sector, vmf->cow_page, vaddr);
-			break;
-		default:
-			WARN_ON_ONCE(1);
-			error = -EIO;
-			break;
-		}
-
-		if (error)
-			goto error_finish_iomap;
-
-		__SetPageUptodate(vmf->cow_page);
-		ret = finish_fault(vmf);
-		if (!ret)
-			ret = VM_FAULT_DONE_COW;
+		ret = dax_fault_cow_page(vmf, &iomap, pos);
 		goto finish_iomap;
 	}
 
@@ -1366,19 +1390,8 @@ static vm_fault_t dax_iomap_pte_fault(struct vm_fault *vmf, pfn_t *pfnp,
 		entry = dax_insert_entry(&xas, mapping, vmf, entry, pfn,
 						 0, write && !sync);
 
-		/*
-		 * If we are doing synchronous page fault and inode needs fsync,
-		 * we can insert PTE into page tables only after that happens.
-		 * Skip insertion for now and return the pfn so that caller can
-		 * insert it after fsync is done.
-		 */
 		if (sync) {
-			if (WARN_ON_ONCE(!pfnp)) {
-				error = -EIO;
-				goto error_finish_iomap;
-			}
-			*pfnp = pfn;
-			ret = VM_FAULT_NEEDDSYNC | major;
+			ret = dax_fault_synchronous_pfnp(pfnp, pfn);
 			goto finish_iomap;
 		}
 		trace_dax_insert_mapping(inode, vmf, entry);
@@ -1477,13 +1490,45 @@ static vm_fault_t dax_pmd_load_hole(struct xa_state *xas, struct vm_fault *vmf,
 	return VM_FAULT_FALLBACK;
 }
 
+static bool dax_fault_check_fallback(struct vm_fault *vmf, struct xa_state *xas,
+		pgoff_t max_pgoff)
+{
+	unsigned long pmd_addr = vmf->address & PMD_MASK;
+	bool write = vmf->flags & FAULT_FLAG_WRITE;
+
+	/*
+	 * Make sure that the faulting address's PMD offset (color) matches
+	 * the PMD offset from the start of the file.  This is necessary so
+	 * that a PMD range in the page table overlaps exactly with a PMD
+	 * range in the page cache.
+	 */
+	if ((vmf->pgoff & PG_PMD_COLOUR) !=
+	    ((vmf->address >> PAGE_SHIFT) & PG_PMD_COLOUR))
+		return true;
+
+	/* Fall back to PTEs if we're going to COW */
+	if (write && !(vmf->vma->vm_flags & VM_SHARED))
+		return true;
+
+	/* If the PMD would extend outside the VMA */
+	if (pmd_addr < vmf->vma->vm_start)
+		return true;
+	if ((pmd_addr + PMD_SIZE) > vmf->vma->vm_end)
+		return true;
+
+	/* If the PMD would extend beyond the file size */
+	if ((xas->xa_index | PG_PMD_COLOUR) >= max_pgoff)
+		return true;
+
+	return false;
+}
+
 static vm_fault_t dax_iomap_pmd_fault(struct vm_fault *vmf, pfn_t *pfnp,
 			       const struct iomap_ops *ops)
 {
 	struct vm_area_struct *vma = vmf->vma;
 	struct address_space *mapping = vma->vm_file->f_mapping;
 	XA_STATE_ORDER(xas, &mapping->i_pages, vmf->pgoff, PMD_ORDER);
-	unsigned long pmd_addr = vmf->address & PMD_MASK;
 	bool write = vmf->flags & FAULT_FLAG_WRITE;
 	bool sync;
 	unsigned int iomap_flags = (write ? IOMAP_WRITE : 0) | IOMAP_FAULT;
@@ -1506,33 +1551,12 @@ static vm_fault_t dax_iomap_pmd_fault(struct vm_fault *vmf, pfn_t *pfnp,
 
 	trace_dax_pmd_fault(inode, vmf, max_pgoff, 0);
 
-	/*
-	 * Make sure that the faulting address's PMD offset (color) matches
-	 * the PMD offset from the start of the file.  This is necessary so
-	 * that a PMD range in the page table overlaps exactly with a PMD
-	 * range in the page cache.
-	 */
-	if ((vmf->pgoff & PG_PMD_COLOUR) !=
-	    ((vmf->address >> PAGE_SHIFT) & PG_PMD_COLOUR))
-		goto fallback;
-
-	/* Fall back to PTEs if we're going to COW */
-	if (write && !(vma->vm_flags & VM_SHARED))
-		goto fallback;
-
-	/* If the PMD would extend outside the VMA */
-	if (pmd_addr < vma->vm_start)
-		goto fallback;
-	if ((pmd_addr + PMD_SIZE) > vma->vm_end)
-		goto fallback;
-
 	if (xas.xa_index >= max_pgoff) {
 		result = VM_FAULT_SIGBUS;
 		goto out;
 	}
 
-	/* If the PMD would extend beyond the file size */
-	if ((xas.xa_index | PG_PMD_COLOUR) >= max_pgoff)
+	if (dax_fault_check_fallback(vmf, &xas, max_pgoff))
 		goto fallback;
 
 	/*
@@ -1584,17 +1608,8 @@ static vm_fault_t dax_iomap_pmd_fault(struct vm_fault *vmf, pfn_t *pfnp,
 		entry = dax_insert_entry(&xas, mapping, vmf, entry, pfn,
 						DAX_PMD, write && !sync);
 
-		/*
-		 * If we are doing synchronous page fault and inode needs fsync,
-		 * we can insert PMD into page tables only after that happens.
-		 * Skip insertion for now and return the pfn so that caller can
-		 * insert it after fsync is done.
-		 */
 		if (sync) {
-			if (WARN_ON_ONCE(!pfnp))
-				goto finish_iomap;
-			*pfnp = pfn;
-			result = VM_FAULT_NEEDDSYNC;
+			result = dax_fault_synchronous_pfnp(pfnp, pfn);
 			goto finish_iomap;
 		}
 
-- 
2.30.2

