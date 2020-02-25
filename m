Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 7A28416F1AA
	for <lists+cluster-devel@lfdr.de>; Tue, 25 Feb 2020 22:49:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582667355;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=inX+lsH79z8CwU3ml9McjZI37LOGwk9XfT6Ta2ucJxQ=;
	b=OUAlRDRvS+qq0kPOgs7ojpN9HagIMZCsatM7xyncOKImI+sBB8N9kD3Q5oN+mDPF8GNHrf
	6dxOvKhuQyjYj2g7Lhk6V1p2n1PpbSStjnr57o0ocZ2BDbxRBLcHeeECKgvxzaBsgbMxXb
	ao+UWDGNNiHBTN7fCW45UGDJTO69tpQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-_0x7sAfKNeWTKJqG2_jwuQ-1; Tue, 25 Feb 2020 16:49:13 -0500
X-MC-Unique: _0x7sAfKNeWTKJqG2_jwuQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D723013E4;
	Tue, 25 Feb 2020 21:49:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BDC5C60C18;
	Tue, 25 Feb 2020 21:49:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9792A18089CE;
	Tue, 25 Feb 2020 21:49:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01PLmwnq010740 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 25 Feb 2020 16:48:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D011E2026D68; Tue, 25 Feb 2020 21:48:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB2472026FFE
	for <cluster-devel@redhat.com>; Tue, 25 Feb 2020 21:48:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7417D101A55F
	for <cluster-devel@redhat.com>; Tue, 25 Feb 2020 21:48:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-452-rQGo7U7nNUeJ1ClPHzc_6Q-1; Tue, 25 Feb 2020 16:48:56 -0500
X-MC-Unique: rQGo7U7nNUeJ1ClPHzc_6Q-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j6i4G-0007pH-UW; Tue, 25 Feb 2020 21:48:40 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Tue, 25 Feb 2020 13:48:14 -0800
Message-Id: <20200225214838.30017-2-willy@infradead.org>
In-Reply-To: <20200225214838.30017-1-willy@infradead.org>
References: <20200225214838.30017-1-willy@infradead.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01PLmwnq010740
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v8 01/25] mm: Move readahead prototypes from
	mm.h
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
Content-Transfer-Encoding: quoted-printable

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

The readahead code is part of the page cache so should be found in the
pagemap.h file.  force_page_cache_readahead is only used within mm,
so move it to mm/internal.h instead.  Remove the parameter names where
they add no value, and rename the ones which were actively misleading.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-core.c        |  1 +
 include/linux/mm.h      | 19 -------------------
 include/linux/pagemap.h |  8 ++++++++
 mm/fadvise.c            |  2 ++
 mm/internal.h           |  2 ++
 5 files changed, 13 insertions(+), 19 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index 089e890ab208..41417bb93634 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -20,6 +20,7 @@
 #include <linux/blk-mq.h>
 #include <linux/highmem.h>
 #include <linux/mm.h>
+#include <linux/pagemap.h>
 #include <linux/kernel_stat.h>
 #include <linux/string.h>
 #include <linux/init.h>
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 52269e56c514..68dcda9a2112 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2401,25 +2401,6 @@ extern vm_fault_t filemap_page_mkwrite(struct vm_fau=
lt *vmf);
 int __must_check write_one_page(struct page *page);
 void task_dirty_inc(struct task_struct *tsk);
=20
-/* readahead.c */
-#define VM_READAHEAD_PAGES=09(SZ_128K / PAGE_SIZE)
-
-int force_page_cache_readahead(struct address_space *mapping, struct file =
*filp,
-=09=09=09pgoff_t offset, unsigned long nr_to_read);
-
-void page_cache_sync_readahead(struct address_space *mapping,
-=09=09=09       struct file_ra_state *ra,
-=09=09=09       struct file *filp,
-=09=09=09       pgoff_t offset,
-=09=09=09       unsigned long size);
-
-void page_cache_async_readahead(struct address_space *mapping,
-=09=09=09=09struct file_ra_state *ra,
-=09=09=09=09struct file *filp,
-=09=09=09=09struct page *pg,
-=09=09=09=09pgoff_t offset,
-=09=09=09=09unsigned long size);
-
 extern unsigned long stack_guard_gap;
 /* Generic expand stack which grows the stack according to GROWS{UP,DOWN} =
*/
 extern int expand_stack(struct vm_area_struct *vma, unsigned long address)=
;
diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index ccb14b6a16b5..24894b9b90c9 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -614,6 +614,14 @@ int replace_page_cache_page(struct page *old, struct p=
age *new, gfp_t gfp_mask);
 void delete_from_page_cache_batch(struct address_space *mapping,
 =09=09=09=09  struct pagevec *pvec);
=20
+#define VM_READAHEAD_PAGES=09(SZ_128K / PAGE_SIZE)
+
+void page_cache_sync_readahead(struct address_space *, struct file_ra_stat=
e *,
+=09=09struct file *, pgoff_t index, unsigned long req_count);
+void page_cache_async_readahead(struct address_space *, struct file_ra_sta=
te *,
+=09=09struct file *, struct page *, pgoff_t index,
+=09=09unsigned long req_count);
+
 /*
  * Like add_to_page_cache_locked, but used to add newly allocated pages:
  * the page is new, so we can just run __SetPageLocked() against it.
diff --git a/mm/fadvise.c b/mm/fadvise.c
index 4f17c83db575..3efebfb9952c 100644
--- a/mm/fadvise.c
+++ b/mm/fadvise.c
@@ -22,6 +22,8 @@
=20
 #include <asm/unistd.h>
=20
+#include "internal.h"
+
 /*
  * POSIX_FADV_WILLNEED could set PG_Referenced, and POSIX_FADV_NOREUSE cou=
ld
  * deactivate the pages and clear PG_Referenced.
diff --git a/mm/internal.h b/mm/internal.h
index 3cf20ab3ca01..83f353e74654 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -49,6 +49,8 @@ void unmap_page_range(struct mmu_gather *tlb,
 =09=09=09     unsigned long addr, unsigned long end,
 =09=09=09     struct zap_details *details);
=20
+int force_page_cache_readahead(struct address_space *, struct file *,
+=09=09pgoff_t index, unsigned long nr_to_read);
 extern unsigned int __do_page_cache_readahead(struct address_space *mappin=
g,
 =09=09struct file *filp, pgoff_t offset, unsigned long nr_to_read,
 =09=09unsigned long lookahead_size);
--=20
2.25.0


