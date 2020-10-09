Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3A09628B0C5
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Oct 2020 10:53:27 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-XkYTvKqtMQOtxcP87h5J5w-1; Mon, 12 Oct 2020 04:53:24 -0400
X-MC-Unique: XkYTvKqtMQOtxcP87h5J5w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12E121015CB1;
	Mon, 12 Oct 2020 08:53:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F1A8B5C22B;
	Mon, 12 Oct 2020 08:53:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D9BF4181A872;
	Mon, 12 Oct 2020 08:53:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 099Jr31k020240 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 9 Oct 2020 15:53:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 851762166B28; Fri,  9 Oct 2020 19:53:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F7C12157F26
	for <cluster-devel@redhat.com>; Fri,  9 Oct 2020 19:53:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 55B6A182360D
	for <cluster-devel@redhat.com>; Fri,  9 Oct 2020 19:53:01 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-98-U75RMJ9VN3OuU7hRHDVWfQ-1; Fri, 09 Oct 2020 15:52:56 -0400
X-MC-Unique: U75RMJ9VN3OuU7hRHDVWfQ-1
IronPort-SDR: tHE4FpwPYgGRaDPt8a5x0guNFWTyTYlAcHr18amGl3gAKuKXlvdEbPGacKfnT8PsIs5hZgjFS9
	XxLKHJ1t5Sng==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="227179078"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="227179078"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	09 Oct 2020 12:52:55 -0700
IronPort-SDR: TN82OMSOJnR+1dzdu/wtYu+HarPMiqU5tCJLq9k+HDWuiKzSJliaVoZHfBedXzzykRk72guGi9
	gJFQG6Pg4N1Q==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="529053748"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
	by orsmga005-auth.jf.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:52:54 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Date: Fri,  9 Oct 2020 12:50:10 -0700
Message-Id: <20201009195033.3208459-36-ira.weiny@intel.com>
In-Reply-To: <20201009195033.3208459-1-ira.weiny@intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
MIME-Version: 1.0
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
X-Mailman-Approved-At: Mon, 12 Oct 2020 04:53:05 -0400
Cc: linux-aio@kvack.org, linux-efi@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-mmc@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kselftest@vger.kernel.org, samba-technical@lists.samba.org,
	Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
	devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
	linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-nvdimm@lists.01.org, linux-rdma@vger.kernel.org,
	x86@kernel.org, amd-gfx@lists.freedesktop.org,
	linux-afs@lists.infradead.org, cluster-devel@redhat.com,
	linux-cachefs@redhat.com, intel-wired-lan@lists.osuosl.org,
	xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
	Fenghua Yu <fenghua.yu@intel.com>, linux-um@lists.infradead.org,
	intel-gfx@lists.freedesktop.org, ecryptfs@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, reiserfs-devel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
	Alexander Viro <viro@zeniv.linux.org.uk>, drbd-dev@tron.linbit.com,
	Dan Williams <dan.j.williams@intel.com>,
	io-uring@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
	netdev@vger.kernel.org, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH RFC PKS/PMEM 35/58] fs: Utilize new
	kmap_thread()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Ira Weiny <ira.weiny@intel.com>

These kmap() calls are localized to a single thread.  To avoid the over
head of global PKRS updates use the new kmap_thread() call.

Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 fs/aio.c              |  4 ++--
 fs/binfmt_elf.c       |  4 ++--
 fs/binfmt_elf_fdpic.c |  4 ++--
 fs/exec.c             | 10 +++++-----
 fs/io_uring.c         |  4 ++--
 fs/splice.c           |  4 ++--
 6 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/fs/aio.c b/fs/aio.c
index d5ec30385566..27f95996d25f 100644
--- a/fs/aio.c
+++ b/fs/aio.c
@@ -1223,10 +1223,10 @@ static long aio_read_events_ring(struct kioctx *ctx,
 		avail = min(avail, nr - ret);
 		avail = min_t(long, avail, AIO_EVENTS_PER_PAGE - pos);
 
-		ev = kmap(page);
+		ev = kmap_thread(page);
 		copy_ret = copy_to_user(event + ret, ev + pos,
 					sizeof(*ev) * avail);
-		kunmap(page);
+		kunmap_thread(page);
 
 		if (unlikely(copy_ret)) {
 			ret = -EFAULT;
diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
index 13d053982dd7..1a332ef1ae03 100644
--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@ -2430,9 +2430,9 @@ static int elf_core_dump(struct coredump_params *cprm)
 
 			page = get_dump_page(addr);
 			if (page) {
-				void *kaddr = kmap(page);
+				void *kaddr = kmap_thread(page);
 				stop = !dump_emit(cprm, kaddr, PAGE_SIZE);
-				kunmap(page);
+				kunmap_thread(page);
 				put_page(page);
 			} else
 				stop = !dump_skip(cprm, PAGE_SIZE);
diff --git a/fs/binfmt_elf_fdpic.c b/fs/binfmt_elf_fdpic.c
index 50f845702b92..8fbe188e0fdd 100644
--- a/fs/binfmt_elf_fdpic.c
+++ b/fs/binfmt_elf_fdpic.c
@@ -1542,9 +1542,9 @@ static bool elf_fdpic_dump_segments(struct coredump_params *cprm)
 			bool res;
 			struct page *page = get_dump_page(addr);
 			if (page) {
-				void *kaddr = kmap(page);
+				void *kaddr = kmap_thread(page);
 				res = dump_emit(cprm, kaddr, PAGE_SIZE);
-				kunmap(page);
+				kunmap_thread(page);
 				put_page(page);
 			} else {
 				res = dump_skip(cprm, PAGE_SIZE);
diff --git a/fs/exec.c b/fs/exec.c
index a91003e28eaa..3948b8511e3a 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -575,11 +575,11 @@ static int copy_strings(int argc, struct user_arg_ptr argv,
 
 				if (kmapped_page) {
 					flush_kernel_dcache_page(kmapped_page);
-					kunmap(kmapped_page);
+					kunmap_thread(kmapped_page);
 					put_arg_page(kmapped_page);
 				}
 				kmapped_page = page;
-				kaddr = kmap(kmapped_page);
+				kaddr = kmap_thread(kmapped_page);
 				kpos = pos & PAGE_MASK;
 				flush_arg_page(bprm, kpos, kmapped_page);
 			}
@@ -593,7 +593,7 @@ static int copy_strings(int argc, struct user_arg_ptr argv,
 out:
 	if (kmapped_page) {
 		flush_kernel_dcache_page(kmapped_page);
-		kunmap(kmapped_page);
+		kunmap_thread(kmapped_page);
 		put_arg_page(kmapped_page);
 	}
 	return ret;
@@ -871,11 +871,11 @@ int transfer_args_to_stack(struct linux_binprm *bprm,
 
 	for (index = MAX_ARG_PAGES - 1; index >= stop; index--) {
 		unsigned int offset = index == stop ? bprm->p & ~PAGE_MASK : 0;
-		char *src = kmap(bprm->page[index]) + offset;
+		char *src = kmap_thread(bprm->page[index]) + offset;
 		sp -= PAGE_SIZE - offset;
 		if (copy_to_user((void *) sp, src, PAGE_SIZE - offset) != 0)
 			ret = -EFAULT;
-		kunmap(bprm->page[index]);
+		kunmap_thread(bprm->page[index]);
 		if (ret)
 			goto out;
 	}
diff --git a/fs/io_uring.c b/fs/io_uring.c
index aae0ef2ec34d..f59bb079822d 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -2903,7 +2903,7 @@ static ssize_t loop_rw_iter(int rw, struct file *file, struct kiocb *kiocb,
 			iovec = iov_iter_iovec(iter);
 		} else {
 			/* fixed buffers import bvec */
-			iovec.iov_base = kmap(iter->bvec->bv_page)
+			iovec.iov_base = kmap_thread(iter->bvec->bv_page)
 						+ iter->iov_offset;
 			iovec.iov_len = min(iter->count,
 					iter->bvec->bv_len - iter->iov_offset);
@@ -2918,7 +2918,7 @@ static ssize_t loop_rw_iter(int rw, struct file *file, struct kiocb *kiocb,
 		}
 
 		if (iov_iter_is_bvec(iter))
-			kunmap(iter->bvec->bv_page);
+			kunmap_thread(iter->bvec->bv_page);
 
 		if (nr < 0) {
 			if (!ret)
diff --git a/fs/splice.c b/fs/splice.c
index ce75aec52274..190c4d218c30 100644
--- a/fs/splice.c
+++ b/fs/splice.c
@@ -815,9 +815,9 @@ static int write_pipe_buf(struct pipe_inode_info *pipe, struct pipe_buffer *buf,
 	void *data;
 	loff_t tmp = sd->pos;
 
-	data = kmap(buf->page);
+	data = kmap_thread(buf->page);
 	ret = __kernel_write(sd->u.file, data + buf->offset, sd->len, &tmp);
-	kunmap(buf->page);
+	kunmap_thread(buf->page);
 
 	return ret;
 }
-- 
2.28.0.rc0.12.gb6a658bd00c9

