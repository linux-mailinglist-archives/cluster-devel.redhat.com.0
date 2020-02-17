Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D8376161A35
	for <lists+cluster-devel@lfdr.de>; Mon, 17 Feb 2020 19:46:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581965211;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xbdmFFJ8BJk2v8coMakTXWVaByGUmbd8Ubv28Z2jLSA=;
	b=JlAZW3OGNJvVnGAj8tqoOmOTfYaWaui6Nj18S7yc1a0zSjJB3WuGUg3djpIzILdOOBx9Cj
	D3Dt/Y7SQiJ47Y9xi5yums73lkUc0DBOmE7nddeXGnkDu5zD8AdpfbqYFRB8Pmuq5y9yKZ
	RnlQyKLmyGu+jPH4uK+hpTEEFD4HAfw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-6HjJHVDxNv2-BeBpdJNiYg-1; Mon, 17 Feb 2020 13:46:49 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F830800D5C;
	Mon, 17 Feb 2020 18:46:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BD9885735;
	Mon, 17 Feb 2020 18:46:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3F0A535AEF;
	Mon, 17 Feb 2020 18:46:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01HIkjqv025135 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 17 Feb 2020 13:46:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 983BBD19B6; Mon, 17 Feb 2020 18:46:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9349BD1BB7
	for <cluster-devel@redhat.com>; Mon, 17 Feb 2020 18:46:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D62B8001E5
	for <cluster-devel@redhat.com>; Mon, 17 Feb 2020 18:46:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-188-9b7BFRx6MJSZcIXu6m7VsA-1; Mon, 17 Feb 2020 13:46:40 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j3lPL-000593-GV; Mon, 17 Feb 2020 18:46:15 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 17 Feb 2020 10:45:48 -0800
Message-Id: <20200217184613.19668-8-willy@infradead.org>
In-Reply-To: <20200217184613.19668-1-willy@infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
MIME-Version: 1.0
X-MC-Unique: 9b7BFRx6MJSZcIXu6m7VsA-1
X-MC-Unique: 6HjJHVDxNv2-BeBpdJNiYg-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01HIkjqv025135
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v6 05/19] mm: Remove 'page_offset' from
	readahead loop
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

Eliminate the page_offset variable which was confusing with the
'offset' parameter and record the start of each consecutive run of
pages in the readahead_control.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 mm/readahead.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/mm/readahead.c b/mm/readahead.c
index 3eca59c43a45..74791b96013f 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -162,6 +162,7 @@ void __do_page_cache_readahead(struct address_space *ma=
pping,
 =09struct readahead_control rac =3D {
 =09=09.mapping =3D mapping,
 =09=09.file =3D filp,
+=09=09._start =3D offset,
 =09=09._nr_pages =3D 0,
 =09};
=20
@@ -175,12 +176,11 @@ void __do_page_cache_readahead(struct address_space *=
mapping,
 =09 */
 =09for (page_idx =3D 0; page_idx < nr_to_read; page_idx++) {
 =09=09struct page *page;
-=09=09pgoff_t page_offset =3D offset + page_idx;
=20
-=09=09if (page_offset > end_index)
+=09=09if (offset > end_index)
 =09=09=09break;
=20
-=09=09page =3D xa_load(&mapping->i_pages, page_offset);
+=09=09page =3D xa_load(&mapping->i_pages, offset);
 =09=09if (page && !xa_is_value(page)) {
 =09=09=09/*
 =09=09=09 * Page already present?  Kick off the current batch
@@ -196,16 +196,18 @@ void __do_page_cache_readahead(struct address_space *=
mapping,
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
 =09=09continue;
 read:
 =09=09if (readahead_count(&rac))
 =09=09=09read_pages(&rac, &page_pool, gfp_mask);
 =09=09rac._nr_pages =3D 0;
+=09=09rac._start =3D ++offset;
 =09}
=20
 =09/*
--=20
2.25.0


