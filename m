Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id AE30A161A15
	for <lists+cluster-devel@lfdr.de>; Mon, 17 Feb 2020 19:46:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581965202;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SC8RkU4ZPQ8nUMsjm4WRuT8tNnkwSK3y4r7l9wtH9YA=;
	b=KSOUZ1a+dnYjLQCKmrd1veY+uPBcjve6P4r+eYn3dIAeluy8gBIPG/lGR0SH5Ederri7k9
	wgorxuLexwoEDCl032osfOR9QuI5zfXOmy8xL9pHfa5nMwtAcRdVXQq0Abhw/NjFPagY/Y
	uV1vLTYv1AEAcukhn1qeP75kiPy47/U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-HyNsRLaHPrqe7N2DilkKGA-1; Mon, 17 Feb 2020 13:46:40 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56DE4133656F;
	Mon, 17 Feb 2020 18:46:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4275C87058;
	Mon, 17 Feb 2020 18:46:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1BBBA35AEF;
	Mon, 17 Feb 2020 18:46:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01HIkSUw024876 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 17 Feb 2020 13:46:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D2E3D2166B27; Mon, 17 Feb 2020 18:46:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF0602166B2B
	for <cluster-devel@redhat.com>; Mon, 17 Feb 2020 18:46:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B58DC8026EE
	for <cluster-devel@redhat.com>; Mon, 17 Feb 2020 18:46:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-218-7v6-EHvyOSue_PYua1sN2w-1; Mon, 17 Feb 2020 13:46:26 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j3lPL-00058v-ER; Mon, 17 Feb 2020 18:46:15 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 17 Feb 2020 10:45:46 -0800
Message-Id: <20200217184613.19668-6-willy@infradead.org>
In-Reply-To: <20200217184613.19668-1-willy@infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
MIME-Version: 1.0
X-MC-Unique: 7v6-EHvyOSue_PYua1sN2w-1
X-MC-Unique: HyNsRLaHPrqe7N2DilkKGA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01HIkSUw024876
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v6 04/16] mm: Tweak readahead loop slightly
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

Eliminate the page_offset variable which was just confusing;
record the start of each consecutive run of pages in the
readahead_control, and move the 'kick off a fresh batch' code to
the end of the function for easier use in the next patch.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 mm/readahead.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/mm/readahead.c b/mm/readahead.c
index 15329309231f..74791b96013f 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -154,7 +154,6 @@ void __do_page_cache_readahead(struct address_space *ma=
pping,
 =09=09unsigned long lookahead_size)
 {
 =09struct inode *inode =3D mapping->host;
-=09struct page *page;
 =09unsigned long end_index;=09/* The last page we want to read */
 =09LIST_HEAD(page_pool);
 =09int page_idx;
@@ -163,6 +162,7 @@ void __do_page_cache_readahead(struct address_space *ma=
pping,
 =09struct readahead_control rac =3D {
 =09=09.mapping =3D mapping,
 =09=09.file =3D filp,
+=09=09._start =3D offset,
 =09=09._nr_pages =3D 0,
 =09};
=20
@@ -175,32 +175,39 @@ void __do_page_cache_readahead(struct address_space *=
mapping,
 =09 * Preallocate as many pages as we will need.
 =09 */
 =09for (page_idx =3D 0; page_idx < nr_to_read; page_idx++) {
-=09=09pgoff_t page_offset =3D offset + page_idx;
+=09=09struct page *page;
=20
-=09=09if (page_offset > end_index)
+=09=09if (offset > end_index)
 =09=09=09break;
=20
-=09=09page =3D xa_load(&mapping->i_pages, page_offset);
+=09=09page =3D xa_load(&mapping->i_pages, offset);
 =09=09if (page && !xa_is_value(page)) {
 =09=09=09/*
-=09=09=09 * Page already present?  Kick off the current batch of
-=09=09=09 * contiguous pages before continuing with the next
-=09=09=09 * batch.
+=09=09=09 * Page already present?  Kick off the current batch
+=09=09=09 * of contiguous pages before continuing with the
+=09=09=09 * next batch.  This page may be the one we would
+=09=09=09 * have intended to mark as Readahead, but we don't
+=09=09=09 * have a stable reference to this page, and it's
+=09=09=09 * not worth getting one just for that.
 =09=09=09 */
-=09=09=09if (readahead_count(&rac))
-=09=09=09=09read_pages(&rac, &page_pool, gfp_mask);
-=09=09=09rac._nr_pages =3D 0;
-=09=09=09continue;
+=09=09=09goto read;
 =09=09}
=20
 =09=09page =3D __page_cache_alloc(gfp_mask);
 =09=09if (!page)
 =09=09=09break;
-=09=09page->index =3D page_offset;
+=09=09page->index =3D offset;
 =09=09list_add(&page->lru, &page_pool);
 =09=09if (page_idx =3D=3D nr_to_read - lookahead_size)
 =09=09=09SetPageReadahead(page);
 =09=09rac._nr_pages++;
+=09=09offset++;
+=09=09continue;
+read:
+=09=09if (readahead_count(&rac))
+=09=09=09read_pages(&rac, &page_pool, gfp_mask);
+=09=09rac._nr_pages =3D 0;
+=09=09rac._start =3D ++offset;
 =09}
=20
 =09/*
--=20
2.25.0


