Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5F974161A33
	for <lists+cluster-devel@lfdr.de>; Mon, 17 Feb 2020 19:46:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581965208;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lojwS2xPWv2hG2/bVhx9oyGXZnIwFzlohElbYSsqh4c=;
	b=Qquz0Q3IdFGPdDJpWJK2Dze3bfp5KcwaXa/TQVmhIvIlHZD2TLCww5uUsfwMHdHOMzNBHJ
	SEN64bWooYLGiWhLtfokrcJ/Xi3yJ8vUO0xLwvj/a/gPK1RxxHVgCZHXRUPzcj6XvEXGmZ
	raPcznUXHuWAOuG3CB4w5dkoup7QTiU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-9ajS-25MPQurwVRopAAoMw-1; Mon, 17 Feb 2020 13:46:46 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCBF7800D5A;
	Mon, 17 Feb 2020 18:46:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB09E85735;
	Mon, 17 Feb 2020 18:46:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A211218034EA;
	Mon, 17 Feb 2020 18:46:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01HIkeCt025110 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 17 Feb 2020 13:46:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 030B41003218; Mon, 17 Feb 2020 18:46:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F2C581003219
	for <cluster-devel@redhat.com>; Mon, 17 Feb 2020 18:46:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DAC51185B0BF
	for <cluster-devel@redhat.com>; Mon, 17 Feb 2020 18:46:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-198-1sC4958ZPt2BZX1OKKfVtQ-1; Mon, 17 Feb 2020 13:46:37 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j3lPL-00058e-AJ; Mon, 17 Feb 2020 18:46:15 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 17 Feb 2020 10:45:42 -0800
Message-Id: <20200217184613.19668-2-willy@infradead.org>
In-Reply-To: <20200217184613.19668-1-willy@infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
MIME-Version: 1.0
X-MC-Unique: 1sC4958ZPt2BZX1OKKfVtQ-1
X-MC-Unique: 9ajS-25MPQurwVRopAAoMw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01HIkeCt025110
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v6 01/19] mm: Return void from various
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

ondemand_readahead has two callers, neither of which use the return value.
That means that both ra_submit and __do_page_cache_readahead() can return
void, and we don't need to worry that a present page in the readahead
window causes us to return a smaller nr_pages than we ought to have.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 mm/internal.h  |  8 ++++----
 mm/readahead.c | 24 ++++++++++--------------
 2 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index 3cf20ab3ca01..f779f058118b 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -49,18 +49,18 @@ void unmap_page_range(struct mmu_gather *tlb,
 =09=09=09     unsigned long addr, unsigned long end,
 =09=09=09     struct zap_details *details);
=20
-extern unsigned int __do_page_cache_readahead(struct address_space *mappin=
g,
+extern void __do_page_cache_readahead(struct address_space *mapping,
 =09=09struct file *filp, pgoff_t offset, unsigned long nr_to_read,
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
index 2fe72cd29b47..8ce46d69e6ae 100644
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
@@ -211,8 +209,6 @@ unsigned int __do_page_cache_readahead(struct address_s=
pace *mapping,
 =09if (nr_pages)
 =09=09read_pages(mapping, filp, &page_pool, nr_pages, gfp_mask);
 =09BUG_ON(!list_empty(&page_pool));
-out:
-=09return nr_pages;
 }
=20
 /*
@@ -378,11 +374,10 @@ static int try_context_readahead(struct address_space=
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
@@ -428,7 +423,7 @@ ondemand_readahead(struct address_space *mapping,
 =09=09rcu_read_unlock();
=20
 =09=09if (!start || start - offset > max_pages)
-=09=09=09return 0;
+=09=09=09return;
=20
 =09=09ra->start =3D start;
 =09=09ra->size =3D start - offset;=09/* old async_size */
@@ -464,7 +459,8 @@ ondemand_readahead(struct address_space *mapping,
 =09 * standalone, small random read
 =09 * Read as is, and do not pollute the readahead state.
 =09 */
-=09return __do_page_cache_readahead(mapping, filp, offset, req_size, 0);
+=09__do_page_cache_readahead(mapping, filp, offset, req_size, 0);
+=09return;
=20
 initial_readahead:
 =09ra->start =3D offset;
@@ -489,7 +485,7 @@ ondemand_readahead(struct address_space *mapping,
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


