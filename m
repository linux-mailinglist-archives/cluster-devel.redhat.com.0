Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 390FC28B0D8
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Oct 2020 10:53:29 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-eRmJ2SaMOUCGbN9_WLAHjw-1; Mon, 12 Oct 2020 04:53:26 -0400
X-MC-Unique: eRmJ2SaMOUCGbN9_WLAHjw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 607821018F79;
	Mon, 12 Oct 2020 08:53:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E9425C22A;
	Mon, 12 Oct 2020 08:53:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3A86397319;
	Mon, 12 Oct 2020 08:53:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 099Js3Zx020716 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 9 Oct 2020 15:54:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3A698207A819; Fri,  9 Oct 2020 19:54:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32CB7205EB12
	for <cluster-devel@redhat.com>; Fri,  9 Oct 2020 19:53:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95E351823602
	for <cluster-devel@redhat.com>; Fri,  9 Oct 2020 19:53:58 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-253-KzD-0kD8OvCKIW4q6mB8dQ-1; Fri, 09 Oct 2020 15:53:56 -0400
X-MC-Unique: KzD-0kD8OvCKIW4q6mB8dQ-1
IronPort-SDR: zni4CYhCvFPaVeOCsqyHygsiUKagCQCnf28B51YQbqnY0BPxdqHjYvtvzN43vWli6sYqSDtPK4
	av79ey4nNRmg==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="165643369"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="165643369"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	09 Oct 2020 12:53:54 -0700
IronPort-SDR: bZn0Zma13YkX7FJFkNsCYMjMNff2FSiB/MgoUwYT50qMOfu0yRYfZtOtUYx1uwuwPtN+tdFX+r
	hwly4wq6Ikyg==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="519847271"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
	by fmsmga005-auth.fm.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:53:53 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Date: Fri,  9 Oct 2020 12:50:28 -0700
Message-Id: <20201009195033.3208459-54-ira.weiny@intel.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Mon, 12 Oct 2020 04:53:05 -0400
Cc: linux-aio@kvack.org, Song Liu <songliubraving@fb.com>,
	linux-efi@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-mmc@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kselftest@vger.kernel.org, samba-technical@lists.samba.org,
	Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
	devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
	linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-nvdimm@lists.01.org, linux-rdma@vger.kernel.org,
	x86@kernel.org, John Fastabend <john.fastabend@gmail.com>,
	amd-gfx@lists.freedesktop.org, linux-afs@lists.infradead.org,
	cluster-devel@redhat.com, linux-cachefs@redhat.com,
	intel-wired-lan@lists.osuosl.org, Yonghong Song <yhs@fb.com>,
	linux-ext4@vger.kernel.org, Andrii Nakryiko <andriin@fb.com>,
	Fenghua Yu <fenghua.yu@intel.com>, drbd-dev@tron.linbit.com,
	linux-um@lists.infradead.org, intel-gfx@lists.freedesktop.org,
	ecryptfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	xen-devel@lists.xenproject.org, KP Singh <kpsingh@chromium.org>,
	Dan Williams <dan.j.williams@intel.com>,
	io-uring@vger.kernel.org, linux-bcache@vger.kernel.org,
	linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
	netdev@vger.kernel.org, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, Martin KaFai Lau <kafai@fb.com>,
	linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH RFC PKS/PMEM 53/58] lib: Utilize new
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ira Weiny <ira.weiny@intel.com>

These kmap() calls are localized to a single thread.  To avoid the over
head of global PKRS updates use the new kmap_thread() call.

Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: "Jérôme Glisse" <jglisse@redhat.com>
Cc: Martin KaFai Lau <kafai@fb.com>
Cc: Song Liu <songliubraving@fb.com>
Cc: Yonghong Song <yhs@fb.com>
Cc: Andrii Nakryiko <andriin@fb.com>
Cc: John Fastabend <john.fastabend@gmail.com>
Cc: KP Singh <kpsingh@chromium.org>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 lib/iov_iter.c | 12 ++++++------
 lib/test_bpf.c |  4 ++--
 lib/test_hmm.c |  8 ++++----
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/lib/iov_iter.c b/lib/iov_iter.c
index 5e40786c8f12..1d47f957cf95 100644
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c
@@ -208,7 +208,7 @@ static size_t copy_page_to_iter_iovec(struct page *page, size_t offset, size_t b
 	}
 	/* Too bad - revert to non-atomic kmap */
 
-	kaddr = kmap(page);
+	kaddr = kmap_thread(page);
 	from = kaddr + offset;
 	left = copyout(buf, from, copy);
 	copy -= left;
@@ -225,7 +225,7 @@ static size_t copy_page_to_iter_iovec(struct page *page, size_t offset, size_t b
 		from += copy;
 		bytes -= copy;
 	}
-	kunmap(page);
+	kunmap_thread(page);
 
 done:
 	if (skip == iov->iov_len) {
@@ -292,7 +292,7 @@ static size_t copy_page_from_iter_iovec(struct page *page, size_t offset, size_t
 	}
 	/* Too bad - revert to non-atomic kmap */
 
-	kaddr = kmap(page);
+	kaddr = kmap_thread(page);
 	to = kaddr + offset;
 	left = copyin(to, buf, copy);
 	copy -= left;
@@ -309,7 +309,7 @@ static size_t copy_page_from_iter_iovec(struct page *page, size_t offset, size_t
 		to += copy;
 		bytes -= copy;
 	}
-	kunmap(page);
+	kunmap_thread(page);
 
 done:
 	if (skip == iov->iov_len) {
@@ -1742,10 +1742,10 @@ int iov_iter_for_each_range(struct iov_iter *i, size_t bytes,
 		return 0;
 
 	iterate_all_kinds(i, bytes, v, -EINVAL, ({
-		w.iov_base = kmap(v.bv_page) + v.bv_offset;
+		w.iov_base = kmap_thread(v.bv_page) + v.bv_offset;
 		w.iov_len = v.bv_len;
 		err = f(&w, context);
-		kunmap(v.bv_page);
+		kunmap_thread(v.bv_page);
 		err;}), ({
 		w = v;
 		err = f(&w, context);})
diff --git a/lib/test_bpf.c b/lib/test_bpf.c
index ca7d635bccd9..441f822f56ba 100644
--- a/lib/test_bpf.c
+++ b/lib/test_bpf.c
@@ -6506,11 +6506,11 @@ static void *generate_test_data(struct bpf_test *test, int sub)
 		if (!page)
 			goto err_kfree_skb;
 
-		ptr = kmap(page);
+		ptr = kmap_thread(page);
 		if (!ptr)
 			goto err_free_page;
 		memcpy(ptr, test->frag_data, MAX_DATA);
-		kunmap(page);
+		kunmap_thread(page);
 		skb_add_rx_frag(skb, 0, page, 0, MAX_DATA, MAX_DATA);
 	}
 
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index e7dc3de355b7..e40d26f97f45 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -329,9 +329,9 @@ static int dmirror_do_read(struct dmirror *dmirror, unsigned long start,
 		if (!page)
 			return -ENOENT;
 
-		tmp = kmap(page);
+		tmp = kmap_thread(page);
 		memcpy(ptr, tmp, PAGE_SIZE);
-		kunmap(page);
+		kunmap_thread(page);
 
 		ptr += PAGE_SIZE;
 		bounce->cpages++;
@@ -398,9 +398,9 @@ static int dmirror_do_write(struct dmirror *dmirror, unsigned long start,
 		if (!page || xa_pointer_tag(entry) != DPT_XA_TAG_WRITE)
 			return -ENOENT;
 
-		tmp = kmap(page);
+		tmp = kmap_thread(page);
 		memcpy(tmp, ptr, PAGE_SIZE);
-		kunmap(page);
+		kunmap_thread(page);
 
 		ptr += PAGE_SIZE;
 		bounce->cpages++;
-- 
2.28.0.rc0.12.gb6a658bd00c9

