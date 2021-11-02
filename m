Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D5546442E2F
	for <lists+cluster-devel@lfdr.de>; Tue,  2 Nov 2021 13:32:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635856361;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XLXPjjXDAuVKKqW9A/ea/TopU4i5oW+qzBR9Wsv36NI=;
	b=DKsYyb5S8/jlbgdwHQcDsY6nOU60t1xFH+FJg9jWKnBl0n0YK3weaa3h3uJr+lT8vjo2ov
	A7NpxwtHBEtp/B3f9xhyAk5GDWXGqVyL1/AkmWP13xW8rng+hLhsvFKsTajLC4efhtM5F3
	WImRwgMAkRvnhnijllNUIIpFdPWoglI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-bkRBQ5dGP1uKDZ_cUCDKUw-1; Tue, 02 Nov 2021 08:32:38 -0400
X-MC-Unique: bkRBQ5dGP1uKDZ_cUCDKUw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0AB315875C0;
	Tue,  2 Nov 2021 12:32:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 924B260D30;
	Tue,  2 Nov 2021 12:32:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1CCE14E58F;
	Tue,  2 Nov 2021 12:32:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A2CU1MQ009607 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 2 Nov 2021 08:30:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CBA972B060; Tue,  2 Nov 2021 12:30:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.localdomain (unknown [10.40.195.95])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A3F4E19811;
	Tue,  2 Nov 2021 12:29:58 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Tue,  2 Nov 2021 13:29:31 +0100
Message-Id: <20211102122945.117744-4-agruenba@redhat.com>
In-Reply-To: <20211102122945.117744-1-agruenba@redhat.com>
References: <20211102122945.117744-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: kvm-ppc@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>,
	Jan Kara <jack@suse.cz>, Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	"Darrick J. Wong" <djwong@kernel.org>,
	linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>, ocfs2-devel@oss.oracle.com
Subject: [Cluster-devel] [PATCH v9 03/17] gup: Turn fault_in_pages_{readable,
	writeable} into fault_in_{readable, writeable}
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Turn fault_in_pages_{readable,writeable} into versions that return the
number of bytes not faulted in, similar to copy_to_user, instead of
returning a non-zero value when any of the requested pages couldn't be
faulted in.  This supports the existing users that require all pages to
be faulted in as well as new users that are happy if any pages can be
faulted in.

Rename the functions to fault_in_{readable,writeable} to make sure
this change doesn't silently break things.

Neither of these functions is entirely trivial and it doesn't seem
useful to inline them, so move them to mm/gup.c.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 arch/powerpc/kernel/kvm.c           |  3 +-
 arch/powerpc/kernel/signal_32.c     |  4 +-
 arch/powerpc/kernel/signal_64.c     |  2 +-
 arch/x86/kernel/fpu/signal.c        |  7 ++-
 drivers/gpu/drm/armada/armada_gem.c |  7 ++-
 fs/btrfs/ioctl.c                    |  5 +-
 include/linux/pagemap.h             | 57 ++---------------------
 lib/iov_iter.c                      | 10 ++--
 mm/filemap.c                        |  2 +-
 mm/gup.c                            | 72 +++++++++++++++++++++++++++++
 10 files changed, 93 insertions(+), 76 deletions(-)

diff --git a/arch/powerpc/kernel/kvm.c b/arch/powerpc/kernel/kvm.c
index d89cf802d9aa..6568823cf306 100644
--- a/arch/powerpc/kernel/kvm.c
+++ b/arch/powerpc/kernel/kvm.c
@@ -669,7 +669,8 @@ static void __init kvm_use_magic_page(void)
 	on_each_cpu(kvm_map_magic_page, &features, 1);
 
 	/* Quick self-test to see if the mapping works */
-	if (fault_in_pages_readable((const char *)KVM_MAGIC_PAGE, sizeof(u32))) {
+	if (fault_in_readable((const char __user *)KVM_MAGIC_PAGE,
+			      sizeof(u32))) {
 		kvm_patching_worked = false;
 		return;
 	}
diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index 0608581967f0..38c3eae40c14 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -1048,7 +1048,7 @@ SYSCALL_DEFINE3(swapcontext, struct ucontext __user *, old_ctx,
 	if (new_ctx == NULL)
 		return 0;
 	if (!access_ok(new_ctx, ctx_size) ||
-	    fault_in_pages_readable((u8 __user *)new_ctx, ctx_size))
+	    fault_in_readable((char __user *)new_ctx, ctx_size))
 		return -EFAULT;
 
 	/*
@@ -1237,7 +1237,7 @@ SYSCALL_DEFINE3(debug_setcontext, struct ucontext __user *, ctx,
 #endif
 
 	if (!access_ok(ctx, sizeof(*ctx)) ||
-	    fault_in_pages_readable((u8 __user *)ctx, sizeof(*ctx)))
+	    fault_in_readable((char __user *)ctx, sizeof(*ctx)))
 		return -EFAULT;
 
 	/*
diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index 1831bba0582e..9f471b4a11e3 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -688,7 +688,7 @@ SYSCALL_DEFINE3(swapcontext, struct ucontext __user *, old_ctx,
 	if (new_ctx == NULL)
 		return 0;
 	if (!access_ok(new_ctx, ctx_size) ||
-	    fault_in_pages_readable((u8 __user *)new_ctx, ctx_size))
+	    fault_in_readable((char __user *)new_ctx, ctx_size))
 		return -EFAULT;
 
 	/*
diff --git a/arch/x86/kernel/fpu/signal.c b/arch/x86/kernel/fpu/signal.c
index fa17a27390ab..164c96434704 100644
--- a/arch/x86/kernel/fpu/signal.c
+++ b/arch/x86/kernel/fpu/signal.c
@@ -205,7 +205,7 @@ int copy_fpstate_to_sigframe(void __user *buf, void __user *buf_fx, int size)
 	fpregs_unlock();
 
 	if (ret) {
-		if (!fault_in_pages_writeable(buf_fx, fpu_user_xstate_size))
+		if (!fault_in_writeable(buf_fx, fpu_user_xstate_size))
 			goto retry;
 		return -EFAULT;
 	}
@@ -278,10 +278,9 @@ static int restore_fpregs_from_user(void __user *buf, u64 xrestore,
 		if (ret != -EFAULT)
 			return -EINVAL;
 
-		ret = fault_in_pages_readable(buf, size);
-		if (!ret)
+		if (!fault_in_readable(buf, size))
 			goto retry;
-		return ret;
+		return -EFAULT;
 	}
 
 	/*
diff --git a/drivers/gpu/drm/armada/armada_gem.c b/drivers/gpu/drm/armada/armada_gem.c
index 21909642ee4c..8fbb25913327 100644
--- a/drivers/gpu/drm/armada/armada_gem.c
+++ b/drivers/gpu/drm/armada/armada_gem.c
@@ -336,7 +336,7 @@ int armada_gem_pwrite_ioctl(struct drm_device *dev, void *data,
 	struct drm_armada_gem_pwrite *args = data;
 	struct armada_gem_object *dobj;
 	char __user *ptr;
-	int ret;
+	int ret = 0;
 
 	DRM_DEBUG_DRIVER("handle %u off %u size %u ptr 0x%llx\n",
 		args->handle, args->offset, args->size, args->ptr);
@@ -349,9 +349,8 @@ int armada_gem_pwrite_ioctl(struct drm_device *dev, void *data,
 	if (!access_ok(ptr, args->size))
 		return -EFAULT;
 
-	ret = fault_in_pages_readable(ptr, args->size);
-	if (ret)
-		return ret;
+	if (fault_in_readable(ptr, args->size))
+		return -EFAULT;
 
 	dobj = armada_gem_object_lookup(file, args->handle);
 	if (dobj == NULL)
diff --git a/fs/btrfs/ioctl.c b/fs/btrfs/ioctl.c
index cc61813213d8..c0739f0af634 100644
--- a/fs/btrfs/ioctl.c
+++ b/fs/btrfs/ioctl.c
@@ -2261,9 +2261,8 @@ static noinline int search_ioctl(struct inode *inode,
 	key.offset = sk->min_offset;
 
 	while (1) {
-		ret = fault_in_pages_writeable(ubuf + sk_offset,
-					       *buf_size - sk_offset);
-		if (ret)
+		ret = -EFAULT;
+		if (fault_in_writeable(ubuf + sk_offset, *buf_size - sk_offset))
 			break;
 
 		ret = btrfs_search_forward(root, &key, path, sk->min_transid);
diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 62db6b0176b9..9fe94f7a4f7e 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -733,61 +733,10 @@ int wait_on_page_private_2_killable(struct page *page);
 extern void add_page_wait_queue(struct page *page, wait_queue_entry_t *waiter);
 
 /*
- * Fault everything in given userspace address range in.
+ * Fault in userspace address range.
  */
-static inline int fault_in_pages_writeable(char __user *uaddr, size_t size)
-{
-	char __user *end = uaddr + size - 1;
-
-	if (unlikely(size == 0))
-		return 0;
-
-	if (unlikely(uaddr > end))
-		return -EFAULT;
-	/*
-	 * Writing zeroes into userspace here is OK, because we know that if
-	 * the zero gets there, we'll be overwriting it.
-	 */
-	do {
-		if (unlikely(__put_user(0, uaddr) != 0))
-			return -EFAULT;
-		uaddr += PAGE_SIZE;
-	} while (uaddr <= end);
-
-	/* Check whether the range spilled into the next page. */
-	if (((unsigned long)uaddr & PAGE_MASK) ==
-			((unsigned long)end & PAGE_MASK))
-		return __put_user(0, end);
-
-	return 0;
-}
-
-static inline int fault_in_pages_readable(const char __user *uaddr, size_t size)
-{
-	volatile char c;
-	const char __user *end = uaddr + size - 1;
-
-	if (unlikely(size == 0))
-		return 0;
-
-	if (unlikely(uaddr > end))
-		return -EFAULT;
-
-	do {
-		if (unlikely(__get_user(c, uaddr) != 0))
-			return -EFAULT;
-		uaddr += PAGE_SIZE;
-	} while (uaddr <= end);
-
-	/* Check whether the range spilled into the next page. */
-	if (((unsigned long)uaddr & PAGE_MASK) ==
-			((unsigned long)end & PAGE_MASK)) {
-		return __get_user(c, end);
-	}
-
-	(void)c;
-	return 0;
-}
+size_t fault_in_writeable(char __user *uaddr, size_t size);
+size_t fault_in_readable(const char __user *uaddr, size_t size);
 
 int add_to_page_cache_locked(struct page *page, struct address_space *mapping,
 				pgoff_t index, gfp_t gfp_mask);
diff --git a/lib/iov_iter.c b/lib/iov_iter.c
index 60b5e6edfbaa..c88908f0f138 100644
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c
@@ -191,7 +191,7 @@ static size_t copy_page_to_iter_iovec(struct page *page, size_t offset, size_t b
 	buf = iov->iov_base + skip;
 	copy = min(bytes, iov->iov_len - skip);
 
-	if (IS_ENABLED(CONFIG_HIGHMEM) && !fault_in_pages_writeable(buf, copy)) {
+	if (IS_ENABLED(CONFIG_HIGHMEM) && !fault_in_writeable(buf, copy)) {
 		kaddr = kmap_atomic(page);
 		from = kaddr + offset;
 
@@ -275,7 +275,7 @@ static size_t copy_page_from_iter_iovec(struct page *page, size_t offset, size_t
 	buf = iov->iov_base + skip;
 	copy = min(bytes, iov->iov_len - skip);
 
-	if (IS_ENABLED(CONFIG_HIGHMEM) && !fault_in_pages_readable(buf, copy)) {
+	if (IS_ENABLED(CONFIG_HIGHMEM) && !fault_in_readable(buf, copy)) {
 		kaddr = kmap_atomic(page);
 		to = kaddr + offset;
 
@@ -446,13 +446,11 @@ int iov_iter_fault_in_readable(const struct iov_iter *i, size_t bytes)
 			bytes = i->count;
 		for (p = i->iov, skip = i->iov_offset; bytes; p++, skip = 0) {
 			size_t len = min(bytes, p->iov_len - skip);
-			int err;
 
 			if (unlikely(!len))
 				continue;
-			err = fault_in_pages_readable(p->iov_base + skip, len);
-			if (unlikely(err))
-				return err;
+			if (fault_in_readable(p->iov_base + skip, len))
+				return -EFAULT;
 			bytes -= len;
 		}
 	}
diff --git a/mm/filemap.c b/mm/filemap.c
index dae481293b5d..ff34f4087f87 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -90,7 +90,7 @@
  *      ->lock_page		(filemap_fault, access_process_vm)
  *
  *  ->i_rwsem			(generic_perform_write)
- *    ->mmap_lock		(fault_in_pages_readable->do_page_fault)
+ *    ->mmap_lock		(fault_in_readable->do_page_fault)
  *
  *  bdi->wb.list_lock
  *    sb_lock			(fs/fs-writeback.c)
diff --git a/mm/gup.c b/mm/gup.c
index 886d6148d3d0..a7efb027d6cf 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1656,6 +1656,78 @@ static long __get_user_pages_locked(struct mm_struct *mm, unsigned long start,
 }
 #endif /* !CONFIG_MMU */
 
+/**
+ * fault_in_writeable - fault in userspace address range for writing
+ * @uaddr: start of address range
+ * @size: size of address range
+ *
+ * Returns the number of bytes not faulted in (like copy_to_user() and
+ * copy_from_user()).
+ */
+size_t fault_in_writeable(char __user *uaddr, size_t size)
+{
+	char __user *start = uaddr, *end;
+
+	if (unlikely(size == 0))
+		return 0;
+	if (!PAGE_ALIGNED(uaddr)) {
+		if (unlikely(__put_user(0, uaddr) != 0))
+			return size;
+		uaddr = (char __user *)PAGE_ALIGN((unsigned long)uaddr);
+	}
+	end = (char __user *)PAGE_ALIGN((unsigned long)start + size);
+	if (unlikely(end < start))
+		end = NULL;
+	while (uaddr != end) {
+		if (unlikely(__put_user(0, uaddr) != 0))
+			goto out;
+		uaddr += PAGE_SIZE;
+	}
+
+out:
+	if (size > uaddr - start)
+		return size - (uaddr - start);
+	return 0;
+}
+EXPORT_SYMBOL(fault_in_writeable);
+
+/**
+ * fault_in_readable - fault in userspace address range for reading
+ * @uaddr: start of user address range
+ * @size: size of user address range
+ *
+ * Returns the number of bytes not faulted in (like copy_to_user() and
+ * copy_from_user()).
+ */
+size_t fault_in_readable(const char __user *uaddr, size_t size)
+{
+	const char __user *start = uaddr, *end;
+	volatile char c;
+
+	if (unlikely(size == 0))
+		return 0;
+	if (!PAGE_ALIGNED(uaddr)) {
+		if (unlikely(__get_user(c, uaddr) != 0))
+			return size;
+		uaddr = (const char __user *)PAGE_ALIGN((unsigned long)uaddr);
+	}
+	end = (const char __user *)PAGE_ALIGN((unsigned long)start + size);
+	if (unlikely(end < start))
+		end = NULL;
+	while (uaddr != end) {
+		if (unlikely(__get_user(c, uaddr) != 0))
+			goto out;
+		uaddr += PAGE_SIZE;
+	}
+
+out:
+	(void)c;
+	if (size > uaddr - start)
+		return size - (uaddr - start);
+	return 0;
+}
+EXPORT_SYMBOL(fault_in_readable);
+
 /**
  * get_dump_page() - pin user page in memory while writing it to core dump
  * @addr: user address
-- 
2.31.1

