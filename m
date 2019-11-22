Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0F008107BAF
	for <lists+cluster-devel@lfdr.de>; Sat, 23 Nov 2019 00:53:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574466833;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CQZMohj51Rvu4NKQeTHUm4c49yOWaO0z0fTazdBpmzU=;
	b=AAemI4iS/kWbW/a+TDj4k8NMzyQ5VelmrZzE2wd6rEJqkcaYGMJ7+OMmDpt6isJ9McBXer
	cPjkFqXjDGNHubXcpmlmxSdgE12XX9fTyRRuVufFWbxptHT1HbLnj46beVjITx+epcOlaZ
	Ehw4M3oUHA6ZWrEGbSFqLjfzUk9OmGg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-6EpRd2sWONOCxHmE1bvCqg-1; Fri, 22 Nov 2019 18:53:52 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBA55107ACE8;
	Fri, 22 Nov 2019 23:53:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C7C895C1B5;
	Fri, 22 Nov 2019 23:53:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B17074BB65;
	Fri, 22 Nov 2019 23:53:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAMNrgun000797 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 22 Nov 2019 18:53:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8D83D5C1C3; Fri, 22 Nov 2019 23:53:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (ovpn-204-21.brq.redhat.com [10.40.204.21])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CC6135C1B5;
	Fri, 22 Nov 2019 23:53:38 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 23 Nov 2019 00:53:23 +0100
Message-Id: <20191122235324.17245-3-agruenba@redhat.com>
In-Reply-To: <20191122235324.17245-1-agruenba@redhat.com>
References: <20191122235324.17245-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: Steve French <sfrench@samba.org>,
	Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
	linux-kernel@vger.kernel.org,
	Ronnie Sahlberg <lsahlber@redhat.com>, cluster-devel@redhat.com,
	linux-mm@kvack.org, Alexander Viro <viro@zeniv.linux.org.uk>,
	Johannes Weiner <hannes@cmpxchg.org>, linux-fsdevel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill@shutemov.name>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [Cluster-devel] [RFC PATCH 2/3] fs: Add FAULT_FLAG_CACHED flag for
	filemap_fault
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
X-MC-Unique: 6EpRd2sWONOCxHmE1bvCqg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Add a FAULT_FLAG_CACHED flag which indicates to filemap_fault that it
should only look at the page cache, without triggering filesystem I/O
for the actual request or for readahead.  When filesystem I/O would be
triggered, VM_FAULT_RETRY should be returned instead.

This allows the caller to tentatively satisfy a minor page fault out of
the page cache, and to retry the operation after taking the necessary
steps when that isn't possible.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 include/linux/mm.h |  4 +++-
 mm/filemap.c       | 43 ++++++++++++++++++++++++++++++-------------
 2 files changed, 33 insertions(+), 14 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index a2adf95b3f9c..b3317e4b2607 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -392,6 +392,7 @@ extern pgprot_t protection_map[16];
 #define FAULT_FLAG_USER=09=090x40=09/* The fault originated in userspace *=
/
 #define FAULT_FLAG_REMOTE=090x80=09/* faulting for non current tsk/mm */
 #define FAULT_FLAG_INSTRUCTION  0x100=09/* The fault was during an instruc=
tion fetch */
+#define FAULT_FLAG_CACHED=09=090x200=09/* Only look at the page cache */
=20
 #define FAULT_FLAG_TRACE \
 =09{ FAULT_FLAG_WRITE,=09=09"WRITE" }, \
@@ -402,7 +403,8 @@ extern pgprot_t protection_map[16];
 =09{ FAULT_FLAG_TRIED,=09=09"TRIED" }, \
 =09{ FAULT_FLAG_USER,=09=09"USER" }, \
 =09{ FAULT_FLAG_REMOTE,=09=09"REMOTE" }, \
-=09{ FAULT_FLAG_INSTRUCTION,=09"INSTRUCTION" }
+=09{ FAULT_FLAG_INSTRUCTION,=09"INSTRUCTION" }, \
+=09{ FAULT_FLAG_CACHED,=09=09"CACHED" }
=20
 /*
  * vm_fault is filled by the the pagefault handler and passed to the vma's
diff --git a/mm/filemap.c b/mm/filemap.c
index 024ff0b5fcb6..2297fad3b03a 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -2383,7 +2383,7 @@ static int lock_page_maybe_drop_mmap(struct vm_fault =
*vmf, struct page *page,
 =09 * the mmap_sem still held. That's how FAULT_FLAG_RETRY_NOWAIT
 =09 * is supposed to work. We have way too many special cases..
 =09 */
-=09if (vmf->flags & FAULT_FLAG_RETRY_NOWAIT)
+=09if (vmf->flags & (FAULT_FLAG_RETRY_NOWAIT | FAULT_FLAG_CACHED))
 =09=09return 0;
=20
 =09*fpin =3D maybe_unlock_mmap_for_io(vmf, *fpin);
@@ -2460,26 +2460,28 @@ static struct file *do_sync_mmap_readahead(struct v=
m_fault *vmf)
  * so we want to possibly extend the readahead further.  We return the fil=
e that
  * was pinned if we have to drop the mmap_sem in order to do IO.
  */
-static struct file *do_async_mmap_readahead(struct vm_fault *vmf,
-=09=09=09=09=09    struct page *page)
+static vm_fault_t do_async_mmap_readahead(struct vm_fault *vmf,
+=09=09=09=09=09  struct page *page,
+=09=09=09=09=09  struct file **fpin)
 {
 =09struct file *file =3D vmf->vma->vm_file;
 =09struct file_ra_state *ra =3D &file->f_ra;
 =09struct address_space *mapping =3D file->f_mapping;
-=09struct file *fpin =3D NULL;
 =09pgoff_t offset =3D vmf->pgoff;
=20
 =09/* If we don't want any read-ahead, don't bother */
 =09if (vmf->vma->vm_flags & VM_RAND_READ)
-=09=09return fpin;
+=09=09return 0;
 =09if (ra->mmap_miss > 0)
 =09=09ra->mmap_miss--;
 =09if (PageReadahead(page)) {
-=09=09fpin =3D maybe_unlock_mmap_for_io(vmf, fpin);
+=09=09if (vmf->flags & FAULT_FLAG_CACHED)
+=09=09=09return VM_FAULT_RETRY;
+=09=09*fpin =3D maybe_unlock_mmap_for_io(vmf, *fpin);
 =09=09page_cache_async_readahead(mapping, ra, file,
 =09=09=09=09=09   page, offset, ra->ra_pages);
 =09}
-=09return fpin;
+=09return 0;
 }
=20
 /**
@@ -2495,8 +2497,11 @@ static struct file *do_async_mmap_readahead(struct v=
m_fault *vmf,
  *
  * vma->vm_mm->mmap_sem must be held on entry.
  *
- * If our return value has VM_FAULT_RETRY set, it's because the mmap_sem
- * may be dropped before doing I/O or by lock_page_maybe_drop_mmap().
+ * This function may drop the mmap_sem before doing I/O or waiting for a p=
age
+ * lock; this is indicated by the VM_FAULT_RETRY flag in our return value.
+ * Setting FAULT_FLAG_CACHED or FAULT_FLAG_RETRY_NOWAIT in vmf->flags will
+ * prevent dropping the mmap_sem; in that case, VM_FAULT_RETRY indicates t=
hat
+ * the mmap_sem would have been dropped.
  *
  * If our return value does not have VM_FAULT_RETRY set, the mmap_sem
  * has not been released.
@@ -2518,9 +2523,15 @@ vm_fault_t filemap_fault(struct vm_fault *vmf)
 =09struct page *page;
 =09vm_fault_t ret =3D 0;
=20
-=09max_off =3D DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
-=09if (unlikely(offset >=3D max_off))
-=09=09return VM_FAULT_SIGBUS;
+=09/*
+=09 * FAULT_FLAG_CACHED indicates that the inode size is only guaranteed
+=09 * to be valid when the page we are looking for is in the page cache.
+=09 */
+=09if (!(vmf->flags & FAULT_FLAG_CACHED)) {
+=09=09max_off =3D DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
+=09=09if (unlikely(offset >=3D max_off))
+=09=09=09return VM_FAULT_SIGBUS;
+=09}
=20
 =09/*
 =09 * Do we have something in the page cache already?
@@ -2531,8 +2542,14 @@ vm_fault_t filemap_fault(struct vm_fault *vmf)
 =09=09 * We found the page, so try async readahead before
 =09=09 * waiting for the lock.
 =09=09 */
-=09=09fpin =3D do_async_mmap_readahead(vmf, page);
+=09=09ret =3D do_async_mmap_readahead(vmf, page, &fpin);
+=09=09if (ret) {
+=09=09=09put_page(page);
+=09=09=09return ret;
+=09=09}
 =09} else if (!page) {
+=09=09if (vmf->flags & FAULT_FLAG_CACHED)
+=09=09=09goto out_retry;
 =09=09/* No page in the page cache at all */
 =09=09count_vm_event(PGMAJFAULT);
 =09=09count_memcg_event_mm(vmf->vma->vm_mm, PGMAJFAULT);
--=20
2.20.1

