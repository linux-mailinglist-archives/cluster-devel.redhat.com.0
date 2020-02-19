Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id D10CB1650AB
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Feb 2020 22:01:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582146096;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Sg7DUhnP4zFw+ARzs2/v0lUAxabK3jYZLrwqHoK9KXQ=;
	b=S9JvXtWJQIBNunS1XGRdXCR85uBjOfyv5EhX7GHfSB17HG/W5wRqxb3c3bHMZbmaDnyVwp
	JPjTqaLKopm/X+nqZ2pjE4009P50DzegqzjpUl82ysZtRjhiYRhHslJWPLP7F0OPbiCBZ8
	CcHHmu/cGf03WE/+hKwDn3cwcRvnJgs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-4AJIifp9PvGQ9P11HTodIw-1; Wed, 19 Feb 2020 16:01:31 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C5DEDB65;
	Wed, 19 Feb 2020 21:01:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 703D160BE1;
	Wed, 19 Feb 2020 21:01:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4EC9A35AFD;
	Wed, 19 Feb 2020 21:01:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01JL1OSb002019 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 16:01:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 83B6F2038B97; Wed, 19 Feb 2020 21:01:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EA1D2038B80
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 21:01:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6423A85A304
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 21:01:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-422-vW3yIlsvPDuQvuMsgtZNdA-1; Wed, 19 Feb 2020 16:01:21 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j4WSu-0008TK-QN; Wed, 19 Feb 2020 21:01:04 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Wed, 19 Feb 2020 13:00:41 -0800
Message-Id: <20200219210103.32400-3-willy@infradead.org>
In-Reply-To: <20200219210103.32400-1-willy@infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
MIME-Version: 1.0
X-MC-Unique: vW3yIlsvPDuQvuMsgtZNdA-1
X-MC-Unique: 4AJIifp9PvGQ9P11HTodIw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01JL1OSb002019
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v7 02/24] mm: Return void from various
	readahead functions
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

ondemand_readahead has two callers, neither of which use the return value.
That means that both ra_submit and __do_page_cache_readahead() can return
void, and we don't need to worry that a present page in the readahead
window causes us to return a smaller nr_pages than we ought to have.

Similarly, no caller uses the return value from force_page_cache_readahead(=
).

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Dave Chinner <dchinner@redhat.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
---
 mm/fadvise.c   |  4 ----
 mm/internal.h  | 12 ++++++------
 mm/readahead.c | 31 +++++++++++++------------------
 3 files changed, 19 insertions(+), 28 deletions(-)

diff --git a/mm/fadvise.c b/mm/fadvise.c
index 3efebfb9952c..0e66f2aaeea3 100644
--- a/mm/fadvise.c
+++ b/mm/fadvise.c
@@ -104,10 +104,6 @@ int generic_fadvise(struct file *file, loff_t offset, =
loff_t len, int advice)
 =09=09if (!nrpages)
 =09=09=09nrpages =3D ~0UL;
=20
-=09=09/*
-=09=09 * Ignore return value because fadvise() shall return
-=09=09 * success even if filesystem can't retrieve a hint,
-=09=09 */
 =09=09force_page_cache_readahead(mapping, file, start_index, nrpages);
 =09=09break;
 =09case POSIX_FADV_NOREUSE:
diff --git a/mm/internal.h b/mm/internal.h
index 83f353e74654..15aaebebd768 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -49,20 +49,20 @@ void unmap_page_range(struct mmu_gather *tlb,
 =09=09=09     unsigned long addr, unsigned long end,
 =09=09=09     struct zap_details *details);
=20
-int force_page_cache_readahead(struct address_space *, struct file *,
+void force_page_cache_readahead(struct address_space *, struct file *,
 =09=09pgoff_t index, unsigned long nr_to_read);
-extern unsigned int __do_page_cache_readahead(struct address_space *mappin=
g,
-=09=09struct file *filp, pgoff_t offset, unsigned long nr_to_read,
+void __do_page_cache_readahead(struct address_space *, struct file *,
+=09=09pgoff_t index, unsigned long nr_to_read,
 =09=09unsigned long lookahead_size);
=20
 /*
  * Submit IO for the read-ahead request in file_ra_state.
  */
-static inline unsigned long ra_submit(struct file_ra_state *ra,
+static inline void ra_submit(struct file_ra_state *ra,
 =09=09struct address_space *mapping, struct file *filp)
 {
-=09return __do_page_cache_readahead(mapping, filp,
-=09=09=09=09=09ra->start, ra->size, ra->async_size);
+=09__do_page_cache_readahead(mapping, filp,
+=09=09=09ra->start, ra->size, ra->async_size);
 }
=20
 /*
diff --git a/mm/readahead.c b/mm/readahead.c
index 2fe72cd29b47..41a592886da7 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -149,10 +149,8 @@ static int read_pages(struct address_space *mapping, s=
truct file *filp,
  * the pages first, then submits them for I/O. This avoids the very bad
  * behaviour which would occur if page allocations are causing VM writebac=
k.
  * We really don't want to intermingle reads and writes like that.
- *
- * Returns the number of pages requested, or the maximum amount of I/O all=
owed.
  */
-unsigned int __do_page_cache_readahead(struct address_space *mapping,
+void __do_page_cache_readahead(struct address_space *mapping,
 =09=09struct file *filp, pgoff_t offset, unsigned long nr_to_read,
 =09=09unsigned long lookahead_size)
 {
@@ -166,7 +164,7 @@ unsigned int __do_page_cache_readahead(struct address_s=
pace *mapping,
 =09gfp_t gfp_mask =3D readahead_gfp_mask(mapping);
=20
 =09if (isize =3D=3D 0)
-=09=09goto out;
+=09=09return;
=20
 =09end_index =3D ((isize - 1) >> PAGE_SHIFT);
=20
@@ -211,23 +209,21 @@ unsigned int __do_page_cache_readahead(struct address=
_space *mapping,
 =09if (nr_pages)
 =09=09read_pages(mapping, filp, &page_pool, nr_pages, gfp_mask);
 =09BUG_ON(!list_empty(&page_pool));
-out:
-=09return nr_pages;
 }
=20
 /*
  * Chunk the readahead into 2 megabyte units, so that we don't pin too muc=
h
  * memory at once.
  */
-int force_page_cache_readahead(struct address_space *mapping, struct file =
*filp,
-=09=09=09       pgoff_t offset, unsigned long nr_to_read)
+void force_page_cache_readahead(struct address_space *mapping,
+=09=09struct file *filp, pgoff_t offset, unsigned long nr_to_read)
 {
 =09struct backing_dev_info *bdi =3D inode_to_bdi(mapping->host);
 =09struct file_ra_state *ra =3D &filp->f_ra;
 =09unsigned long max_pages;
=20
 =09if (unlikely(!mapping->a_ops->readpage && !mapping->a_ops->readpages))
-=09=09return -EINVAL;
+=09=09return;
=20
 =09/*
 =09 * If the request exceeds the readahead window, allow the read to
@@ -245,7 +241,6 @@ int force_page_cache_readahead(struct address_space *ma=
pping, struct file *filp,
 =09=09offset +=3D this_chunk;
 =09=09nr_to_read -=3D this_chunk;
 =09}
-=09return 0;
 }
=20
 /*
@@ -378,11 +373,10 @@ static int try_context_readahead(struct address_space=
 *mapping,
 /*
  * A minimal readahead algorithm for trivial sequential/random reads.
  */
-static unsigned long
-ondemand_readahead(struct address_space *mapping,
-=09=09   struct file_ra_state *ra, struct file *filp,
-=09=09   bool hit_readahead_marker, pgoff_t offset,
-=09=09   unsigned long req_size)
+static void ondemand_readahead(struct address_space *mapping,
+=09=09struct file_ra_state *ra, struct file *filp,
+=09=09bool hit_readahead_marker, pgoff_t offset,
+=09=09unsigned long req_size)
 {
 =09struct backing_dev_info *bdi =3D inode_to_bdi(mapping->host);
 =09unsigned long max_pages =3D ra->ra_pages;
@@ -428,7 +422,7 @@ ondemand_readahead(struct address_space *mapping,
 =09=09rcu_read_unlock();
=20
 =09=09if (!start || start - offset > max_pages)
-=09=09=09return 0;
+=09=09=09return;
=20
 =09=09ra->start =3D start;
 =09=09ra->size =3D start - offset;=09/* old async_size */
@@ -464,7 +458,8 @@ ondemand_readahead(struct address_space *mapping,
 =09 * standalone, small random read
 =09 * Read as is, and do not pollute the readahead state.
 =09 */
-=09return __do_page_cache_readahead(mapping, filp, offset, req_size, 0);
+=09__do_page_cache_readahead(mapping, filp, offset, req_size, 0);
+=09return;
=20
 initial_readahead:
 =09ra->start =3D offset;
@@ -489,7 +484,7 @@ ondemand_readahead(struct address_space *mapping,
 =09=09}
 =09}
=20
-=09return ra_submit(ra, mapping, filp);
+=09ra_submit(ra, mapping, filp);
 }
=20
 /**
--=20
2.25.0


