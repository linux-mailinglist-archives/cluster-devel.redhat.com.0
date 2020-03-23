Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 2AAD018FEDD
	for <lists+cluster-devel@lfdr.de>; Mon, 23 Mar 2020 21:23:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584995013;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pW8i62u6729CwwLm9PQAAqF/OjCNzR2zXT2tOkihp1s=;
	b=HtORdjlwpAH31uZWHdOmEsrIndbDr8jEFBB8/7tGY2Mzo2J9LrHYPOmU9UrALXbAiFUxR4
	8Wy1yDFu1Gq1foInOKHKT8/gG5EIJ5uo4vrjiLeI523YLx9kO8bxevBPz3ylxQyAM6Cpnu
	XrAJBC04Tpp4gZ2hvlRWqrqBwclvhh0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-PJevLvJSN8yxOzj31kFq1g-1; Mon, 23 Mar 2020 16:23:31 -0400
X-MC-Unique: PJevLvJSN8yxOzj31kFq1g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41E698010F6;
	Mon, 23 Mar 2020 20:23:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E5CC5DA7C;
	Mon, 23 Mar 2020 20:23:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 080F486382;
	Mon, 23 Mar 2020 20:23:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02NKNMxG014802 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 23 Mar 2020 16:23:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 304821000DB6; Mon, 23 Mar 2020 20:23:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CC311004C42
	for <cluster-devel@redhat.com>; Mon, 23 Mar 2020 20:23:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 143DB8FF665
	for <cluster-devel@redhat.com>; Mon, 23 Mar 2020 20:23:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-432-Wf2cg_jXMhmcts2nk-IIkQ-1; Mon, 23 Mar 2020 16:23:19 -0400
X-MC-Unique: Wf2cg_jXMhmcts2nk-IIkQ-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jGTbB-0003V1-LW; Mon, 23 Mar 2020 20:23:01 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 23 Mar 2020 13:22:43 -0700
Message-Id: <20200323202259.13363-10-willy@infradead.org>
In-Reply-To: <20200323202259.13363-1-willy@infradead.org>
References: <20200323202259.13363-1-willy@infradead.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02NKNMxG014802
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, William Kucharski <william.kucharski@oracle.com>,
	John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
	linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v10 09/25] mm: Remove 'page_offset' from
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

Replace the page_offset variable with 'index + i'.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: William Kucharski <william.kucharski@oracle.com>
---
 mm/readahead.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/mm/readahead.c b/mm/readahead.c
index 7ce320854bad..ddc63d3b07b8 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -180,12 +180,10 @@ void __do_page_cache_readahead(struct address_space *=
mapping,
 =09 * Preallocate as many pages as we will need.
 =09 */
 =09for (i =3D 0; i < nr_to_read; i++) {
-=09=09pgoff_t page_offset =3D index + i;
-
-=09=09if (page_offset > end_index)
+=09=09if (index + i > end_index)
 =09=09=09break;
=20
-=09=09page =3D xa_load(&mapping->i_pages, page_offset);
+=09=09page =3D xa_load(&mapping->i_pages, index + i);
 =09=09if (page && !xa_is_value(page)) {
 =09=09=09/*
 =09=09=09 * Page already present?  Kick off the current batch of
@@ -199,7 +197,7 @@ void __do_page_cache_readahead(struct address_space *ma=
pping,
 =09=09page =3D __page_cache_alloc(gfp_mask);
 =09=09if (!page)
 =09=09=09break;
-=09=09page->index =3D page_offset;
+=09=09page->index =3D index + i;
 =09=09list_add(&page->lru, &page_pool);
 =09=09if (i =3D=3D nr_to_read - lookahead_size)
 =09=09=09SetPageReadahead(page);
--=20
2.25.1


